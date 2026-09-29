Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527DC544894
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 15:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790695389; cv=none; b=n0QIRdEARuZrlnt/6c9BJwi5FLicZ0dsUFggNJrEbIxzKCiJ7XWJ4gg6Z/u3aEr0pQ8zMjncq0Q+MdtbVA/mGRGg3MIM5DAtc8hBmg+vn5qkSS2eNAlRxOQubyv1pwgylJ1+4pAo0YNW4uOP+VXEOzOugDM3Dz5Z2O2CnzbH0ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790695389; c=relaxed/simple;
	bh=UyqxTJzFsBHiwpgeaPtT2Qc3mjNuoQ6QFEr9V0LfDYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g/Txo68d8Fsjz51StWWY9poh9swpvYJmYcfjcDM3CmHmS2sdfDJ3pf3g/VvkJXnEaegyM+X0MZM/q0e/f0ZODkGMYmmM9qonx0ZIh6ie7Qi4/QB/1rdYEevCMP9qAzZiBg4loWcYot2OPwnq3Q+zVXqLaGBt5x0eH4AJltl804o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=DOelXX+Q; arc=none smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="DOelXX+Q"
Received: by mail-oo2-f43.google.com with SMTP id 006d021491bc7-6d7e06de06eso1339932eaf.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1790695378; x=1791300178; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9eZZFPBNxtfOlsCifhs9U8AcK3CT+8uiPgj0yDOTXkc=;
        b=DOelXX+QsSDjt7eMfKtr96Zo7Dj6NOrulxrJxekMPwhHFNPV5MNaWAbUQLHZDgCsdS
         3zCfdypROx7z6ZEFxPuOKQf6sfqjU8vIoL/dJItbeykXkw2KfWhB/0UQWO2/ZUMkgV1l
         Crl5yr5NdkOzmbM40v1AftuXmO300unitYJPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790695378; x=1791300178;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9eZZFPBNxtfOlsCifhs9U8AcK3CT+8uiPgj0yDOTXkc=;
        b=x4nyGrgs3qgPLoK1V3Cbfk7Dm7iI6qR+fkLY1oiF7KlDEkzIEGIijOZZP8tIDGa8K7
         NnLnq6beQGp1tZcRhoWF+pNiQgVbkSP3iEqPR/flLfKCe4PJronvBe316+iQ3R2fRchB
         RNZQsR9QP/f0K9eKXs1eYg0uZvWbKwx7d3ahXeGn6ZV+1Y5R6QfUAUD6Yi1Y5pgMUoTG
         79f9VXt5PKf9tMhugFzUi+9K3q9Be/8ppH0u2YmAJZu+OSZeI7Q0pP7yL3i5iDHLIP8e
         R+DpRTlGsTjck4cd4ePrpqNs+MreUQ8gIWrtKUcKWdFq85hV0uwT2EkGprDB14tNBj6l
         TCwA==
X-Forwarded-Encrypted: i=1; AKwUvBw06GJ80F1HTndsmhEmUf8IRQvf3fpmm76BkPe+6hb3HB6tghmMeT/11rdmc/9UqNJS4FfJeNUO81/Z5yg=@vger.kernel.org
X-Gm-Message-State: AFuF++k0KtYXdQ2Z1VHRni6cpCUEGJdU/CqZWZJ5m10lrQShbfzc/WfY
	NhCbkrNBUczuuXt65iFBSgVEFWsPQ8FnSL/tmvGEaVbLgOzmGp3rLIYDubLV5ZCWR7U6e2qS3uK
	gDRpNjdPdsg==
X-Gm-Gg: AYBFou3YrrXvsTv994MdNZy0BiVz2rxMkpaGr7YDNP7LGF3N3Jx9tib9kG3QjlRcqAf
	3GzKDpe9zTkr2QQlQHI9bdvvb3UERPVZxDfhAcg0Vw36TWKD3O6ThzbkJSiFXo1VZ8zo754FnAe
	QQ04J8nCWFJ8nH/eCKKlOS9ksbx73yT9BPzBCRz+ogor4AK4i7bDue2Fq2GgsYfpI5f/OHwJ5MM
	nBdQw0jAxt4ZkC4V9pSqdZ04SBMs8gbdoAtNv7i6i0ZC7JRZ2bpnpfsaPqXnXppXaoQ+JtNDmRV
	2M+lWI+nkiRjvb4FWr3amDtjlSOI++vQakpMWPOwg7l7RiwpT0WNXt1Py/ytVAhnOhOVQ4s5ZEx
	XFqdbJqBhAVjyd1/CSmHDD/fWDZMeL7dVyCeukzY019iH0TRGyqJNR2oAWsmrKIpsU0mSsmu2JZ
	P4QNE2Mk7abjCONNoRw0lyUHwiHo2NY/QaU4nyNYo5e++3ncqgeg60nSLp7zJQS/4qDDk6/EJew
	I2rttPCjbgzlHKaDS2MUOs6S2gVa9U0t2t/SyzvPiP2NGnk
X-Received: by 2002:a05:6820:a290:20b0:6d7:aca3:bba3 with SMTP id 006d021491bc7-6d7aca3be50mr4669364eaf.20.1790695377848;
        Tue, 29 Sep 2026 08:22:57 -0700 (PDT)
Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com. [74.125.231.76])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6dc44837508sm143450eaf.4.2026.09.29.08.22.57
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 08:22:57 -0700 (PDT)
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-482620dc91bso2628279fac.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:22:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw+XaYVPRhzbtyglXv7K0kU6r9g4kxQfM0JmwDEvbgedcYiu/86IAqs5NXaByp1LHzlWMNarLrkh0ROzLA=@vger.kernel.org
X-Received: by 2002:a17:902:d483:b0:2dd:ad73:5b68 with SMTP id
 d9443c01a7336-2df7da85639mr143411375ad.24.1790695032383; Tue, 29 Sep 2026
 08:17:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927155134.4740-1-mathieu.desnoyers@efficios.com>
 <20260927155134.4740-3-mathieu.desnoyers@efficios.com> <CAHk-=wgQyCdrWH3ZuSajOxZqiups6jYbPtqY8JR8OeS7yi49Mg@mail.gmail.com>
 <133ca8de-cf30-4bf5-9539-d0b73e347b22@efficios.com>
In-Reply-To: <133ca8de-cf30-4bf5-9539-d0b73e347b22@efficios.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 29 Sep 2026 08:16:53 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi7BkCuzMe_zWi6KHUs09UQWJpCVNvuFg5wh_CAu5dgow@mail.gmail.com>
X-Gm-Features: AclHuK92qcnFUvMDyEty0mgzRt4zpmui3HdPCBaHPsJjfcUlLFRzvquKppDzHHE
Message-ID: <CAHk-=wi7BkCuzMe_zWi6KHUs09UQWJpCVNvuFg5wh_CAu5dgow@mail.gmail.com>
Subject: Re: [PATCH hazptr 2/4] compiler.h: Introduce ptr_eq() to preserve
 address dependency
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: "Paul E . McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, Joel Fernandes <joel@joelfernandes.org>, 
	Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, John Stultz <jstultz@google.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Josh Triplett <josh@joshtriplett.org>, 
	Uladzislau Rezki <urezki@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang1211@gmail.com>, 
	Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>, 
	Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Vlastimil Babka <vbabka@suse.cz>, maged.michael@gmail.com, Mateusz Guzik <mjguzik@gmail.com>, 
	Gary Guo <gary@garyguo.net>, rcu@vger.kernel.org, linux-mm@kvack.org, 
	lkmm@lists.linux.dev, Nikita Popov <github@npopov.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Sept 2026 at 08:04, Mathieu Desnoyers
<mathieu.desnoyers@efficios.com> wrote:
>
> I agree that doing it in asm would generate better code. Also, I've
> been told that clang now preserves the address dependency in this
> scenario, so perhaps we'd want to use preprocessor conditionals to
> select how to implement ptr_eq based on:
>
> - architecture (allowing asm implementation overrides),
> - compiler (e.g. if compiler is clang >= version X, just do a plain
>    comparison). Likewise for gcc if it ever decides to fix this
>    behavior.
>
> I think this "hide var" hack is a fallback which can be used as a
> starting point, and then we can specialize based on architecture and
> compiler.
>
> Or do you prefer this in a different order ?

Oh, if there's some sane way to tell that the compiler already honors
address dependencies, then that should be done first and the whole
thing should just become a simple

 (a) == (b)

for that situation - allowing the compiler then the freedom to do
whatever (which can involve not using a register at all, but a compare
to memory, or whatever - the compiler might have reasons to avoid the
'cmp' and use another sequence entirely)

Then a "if we have an architecture fallback".

And then that OPTIMIZER_HIDE_VAR() thing as a last fallback.

               Linus
