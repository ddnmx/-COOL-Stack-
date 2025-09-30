class Stack inherits IO {
    class Node inherits IO {
        val : Object;
        next : Node;

        init(v : Object, n : Node) : Node {
            {
                val <- v;
                next <- n;
                self;
            }
        };

        get_val() : Object {
            val
        };

        get_next() : Node {
            next
        };
    };

    top : Node;
    size : Int;

    init() : Stack {
        {
            top <- null;
            size <- 0;
            self;
        }
    };

    push(item : Object) : Stack {
        {
            top <- (new Node).init(item, top);
            size <- size + 1;
            self;
        }
    };

    pop() : Object {
        if isEmpty() then
            {
                out_string("Error: Stack is empty\n");
                void;
            }
        else
            {
                let temp : Node <- top in
                {
                    top <- temp.get_next();
                    size <- size - 1;
                    temp.get_val();
                };
            }
    };

    peek() : Object {
        if isEmpty() then
            {
                out_string("Error: Stack is empty\n");
                void;
            }
        else
            top.get_val()
    };

    isEmpty() : Bool {
        size = 0
    };

    print_stack() : Stack {
        {
            out_string("Stack elements: ");
            let current : Node <- top in
            while not (current = null) loop
                {
                    current.get_val().print();
                    out_string(" ");
                    current <- current.get_next();
                }
            pool;
            out_string("\n");
            self;
        }
    };
};

class Main inherits IO {
    main() : Object {
        {
            let stack : Stack <- (new Stack).init() in
            {
                stack.push(10);
                stack.push(20);
                stack.push(30);
                stack.print_stack();
                out_string("Peek top: ");
                stack.peek().print();
                out_string("\n");
                out_string("Pop: ");
                stack.pop().print();
                out_string("\n");
                stack.print_stack();
            };
        }
    }
}

