talking structured like program code

The current nested pure structured documentation tools is <a href="https://witheve.com">eve language</a> and the title of <a href="https://roamresearch.com">roam research</a>. <a href="http://www.rebol.com">rebol</a> is a great looking programming language. It eliminates a lot of symbols. So I was inspired by robol to make improvements.

Currently I translate the rebol form of the language into the eve form. This allows structured queries to be made with eve.

Operation is as follows.

1. open file "toeve.html" in browser.

2. click "r2e".

![1.pic](https://tomzcn.github.io/talking-structured-like-program-code/1.PNG)

3. copy the "out".

4. open <a href="https://btheado.github.io/tweve/">tweve</a> in browser.

5. click "+".

6. named "1.eve"

7. paste to the text. and type some text to the front of it. like this.

<pre>
```eve
search
  o1 = [#o1]
  [#the object: d1]
bind
  o1.text := " {{d1}} "
```

```eve
commit
  [#html/element tagname: "div" #o1  text: "1"]
```

```eve
commit
[#be subject:[#of thing:[#the object:"capital"] limit:"china"] judgment:"beijing"]
```
</pre>

8. click "✓"

9.  click "+".

10. named "1.eve.exe"

11. type some thing like this.

<pre>
<$eve markdown={{1.eve}}/>
</pre>

12. click "✓"

13. This way you can see the query results in 1.eve.exe

![2.pic](https://tomzcn.github.io/talking-structured-like-program-code/2.PNG)


