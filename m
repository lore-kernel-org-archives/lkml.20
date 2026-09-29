Received: from mail-ed2-f16.google.com (mail-ed2-f16.google.com [74.125.228.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9693D47AB
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790693243; cv=none; b=Q/aTn05FdDHtxRdj3yjF3QMAY+jNPRApOlhALmAKEuryRCFs/ip7dLek9XCQ9CjDOUnGA7TexgoHSg+fWnjx8UgxAQcmTZOumBewZ7wz+m8MkErdKwhTfnF+E96qbPdh530y0nPDzTADpIdxkIa6188o/ktDNFf84kF1OoUs/Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790693243; c=relaxed/simple;
	bh=SLmPCj6Drkarz6MGesiMP1GtPbh4rsUc3J8b1Kcoqwg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=REviH/GXPoUAZ6jx2ZvDx5bJziyvW0ir4PZLATg9D9GA9Se0SWaCAPhMNY00xR1DyTwzpYiv3eFQSu2gx1cVfFYfhNSpvE7i8MJkQgeQe1v74LHA3TlUF0elJaQEojWhJZareMc6OZNIocHWhiwRVdbXDCGWDSff1RuWRbX8KLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=FAy3PfmP; arc=none smtp.client-ip=74.125.228.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="FAy3PfmP"
Received: by mail-ed2-f16.google.com with SMTP id 4fb4d7f45d1cf-6a9984f9adcso7245147a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1790693238; x=1791298038; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IP+IFTLJhHPOzVgLZORkj6YpvpTLDjx8asIrhC/8Liw=;
        b=FAy3PfmPob5b0tf35c22y/lqxzj34685Bt3ifpj4hCUJdnr9xqz7qoebi1ZpVN7Cp1
         yzaU94LLP02xO71cSvnm5iyfPHLPI8doJn2khs+4Yfvl0HHNairGQPfyyqC1nNBVb8nf
         B9pWbThAUdMYtTtZWwICGr4ZppnSr23eo7VrI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790693238; x=1791298038;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IP+IFTLJhHPOzVgLZORkj6YpvpTLDjx8asIrhC/8Liw=;
        b=Jz8AJ180B478663jutYDmr5ahfwLX7ALhiFEgTZKb+KadyE72fNwLLis3an79VitJO
         cvxDxS2VLjbOTjKXjziQRttYkFdSQAFsHPA0DxC5CjR3bxfO0KLoZBGm+84NML+mamQi
         AcFB1LlUJLEDN6+9wT2FtgXyt7WAW+206eMfC/CANCroZH9OE7ujgxL+Uy+WC1n5nO89
         HYmAKucPbPhKBsQTlJ1Ms78r+ZwgTI5JtXFwTJTHcYk6bSY0ubbnY0EYqGShzaObP+7d
         Eg5/OTgEftwd/iJ/XHX5otTM73KEBjLXpFBUho9uA+dluVsDMep3pCjHlJZkacElgfSe
         juLw==
X-Forwarded-Encrypted: i=1; AKwUvByKKHiCGwn8vwp9AhH4KyIbUhFm0yWa+H3b67qfyt+znrlvJYADQFOqbuY4sVGgvooboeP04vm3QImmXto=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQtDKbyI6OyPPLQrwlmPdbVIN8tFKWSUFB9DBSI4IA/K3YyK/d
	qSo63Ji8uHwz9oJhy4Mcm59wEF5zaZi6ANXzatFNzwjfzCaGGuhi2nlzwlaO/IRq1F0SGU+WapX
	IqDPfrc8=
X-Gm-Gg: AYBFou1QStmet9JDxT/D91zS+sRRjEan8ZuoHz9sjrt4QUNxtQaBRHqD52RmiOu0MMD
	DZn7ljbdl30A82aAwci4yR1nJ0Y42IbGVsdoorZcgS/VFTTMMHJ0F8YHD6afNP+PnSKNj81RX7F
	wANlcdnuLUry/4Zse0IaVF+u/mUlZTTLt9YvE4odPw4QUOuePpIkGNKD5Gp828IdFdFJVZRgyz5
	y6dVNVs8k+1dW3sdL8o47z8zItEsJft8DRdwerp01JKN3dgK3hdWw7QB+N9EwSd+Dp0MZXvBXFG
	c9n3J34SkTKY02KljbeAAYCcA8SkiF3zGpV8fFyVn6iALzExXihrKV3kwQYcaBMx8A716y5kBHS
	rdEkF5FGMWsVMo/TzAnnwZthJcCFNAKu55ao6X94D6X+dNad7fX26GNWKf23FES4k0KbB52zBw9
	0jiabfGM/RJj3hal2h6C/SAauzFDabFSSy+PEjolFPN6rPflMFS8kezbI8/MA2XnGS58gVtW+Hf
	/Hf9OOZpYpDYrvFhN9Fc6ejh0kPThPBAEA44YzSqJrWkiS0fEbL91tn1d4c
X-Received: by 2002:a17:907:1c8e:b0:c2d:cd1a:d5b0 with SMTP id a640c23a62f3a-c2dcd1af3a4mr673780466b.15.1790693238178;
        Tue, 29 Sep 2026 07:47:18 -0700 (PDT)
Received: from mail-ej2-f42.google.com (mail-ej2-f42.google.com. [74.125.228.170])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae757ade3sm656130366b.29.2026.09.29.07.47.17
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 07:47:17 -0700 (PDT)
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2dbdcb4f59so445513166b.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:47:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwiu1Qw1Z/WOFEeT/uFrR9ju2eTKqWsf8P4xPvKfUl9M2uxjW3vpva3HcFiy3pcnvwugWFaRdzmwEbrKSw=@vger.kernel.org
X-Received: by 2002:a17:907:c491:b0:c26:1648:a06f with SMTP id
 a640c23a62f3a-c2ac253fd57mr1427153166b.42.1790693237251; Tue, 29 Sep 2026
 07:47:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927155134.4740-1-mathieu.desnoyers@efficios.com> <20260927155134.4740-3-mathieu.desnoyers@efficios.com>
In-Reply-To: <20260927155134.4740-3-mathieu.desnoyers@efficios.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 29 Sep 2026 07:47:00 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgQyCdrWH3ZuSajOxZqiups6jYbPtqY8JR8OeS7yi49Mg@mail.gmail.com>
X-Gm-Features: AclHuK-hIyKMMCYq0m6RbVGEdDaE41y87jUOezwgP_JOLXBYBmnHdH3WXkY-n-A
Message-ID: <CAHk-=wgQyCdrWH3ZuSajOxZqiups6jYbPtqY8JR8OeS7yi49Mg@mail.gmail.com>
Subject: Re: [PATCH hazptr 2/4] compiler.h: Introduce ptr_eq() to preserve
 address dependency
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: "Paul E . McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, Joel Fernandes <joel@joelfernandes.org>, 
	Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, John Stultz <jstultz@google.com>, 
	Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Josh Triplett <josh@joshtriplett.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Zqiang <qiang.zhang1211@gmail.com>, Ingo Molnar <mingo@redhat.com>, 
	Waiman Long <longman@redhat.com>, Mark Rutland <mark.rutland@arm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, maged.michael@gmail.com, 
	Mateusz Guzik <mjguzik@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>, rcu@vger.kernel.org, linux-mm@kvack.org, 
	lkmm@lists.linux.dev, Nikita Popov <github@npopov.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sun, 27 Sept 2026 at 08:51, Mathieu Desnoyers
<mathieu.desnoyers@efficios.com> wrote:
>
> +static __always_inline
> +int ptr_eq(const volatile void *a, const volatile void *b)
> +{
> +       OPTIMIZER_HIDE_VAR(a);
> +       OPTIMIZER_HIDE_VAR(b);
> +       return a == b;
> +}

I had to think about why I hate this so much.

It's probably entirely senseless, but this just rubs me the wrong way.
Those OPTIMIZER_HIDE_VAR() statements are hiding the wrong thing. They
are telling the compiler to treat valid information (the pointers) as
if they had changed, so then the compiler will have to just reload
those pointers when they are used later (and "used later" is part of
the whole *point* of this, after all).

But it was never the pointer values that needed hiding from the
compiler. It's always just the comparison. And while the "optimal"
thing would be to just do something like

  static __always_inline bool ptr_eq(const volatile void *a, const
volatile void *b)
  {
        bool ret;
        asm("cmpq %0,%1":"=@ccz" (ret):"r" (a),"r"(b))
        return ret;
  }

that is an architecture-specific thing - and then have that
OPTIMIZER_HIDE_VAR() available as a fallback.

I don't know if it's really worth it, but I really do despise that
"hide the wrong values" thing that generates two new values just to
compare them and throw them away, and adds register pressure for no
good reason.

               Linus
