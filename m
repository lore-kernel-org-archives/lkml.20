Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBB5345ED9
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 16:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789835448; cv=none; b=W817ICwM1mXBaPyFYKcjbkQMe2V9FjIy9U5jmVUEdBAJQwQIP72BS0woHrdQeNeVvyXYqcV+DB0Nd+t1w0BnAE2QX7KuM0g0F6//+XR5B0bcIM8mT8V3aQvJfG/8GKN9sf7aojU6WdyDmv6FCHajeK+N3od9nrcJMEZ3zeIvuns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789835448; c=relaxed/simple;
	bh=nBbiCr4fg61dV4D2oGNu2aR4a7biYiZnhkG7Z99V1Hs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mX2v1Ru9w7yfaXNcgzAeFQD/W8iqcZPfiy5CvEgIEg4yBC43wA00sfz9j8QVqi5G4ebCX/D8jeR3RC8W+twWvQhhIoXhsm5LwNEj5IaLuiBOya4IX6Ly0J/aTNjKLf5k3HXpblhbTS5+FSjfcYkeHjVmzNwAPU6ckH9O90BWbRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=My7SVqmT; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="My7SVqmT"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254fa4c24cso277215866b.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 09:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789835444; x=1790440244; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UGWocLshUzVVG8Rydp43t4CQtO4FrerHAEoPSMI/C8I=;
        b=My7SVqmTc+ySsHbzbPJr+tKLM4xy50gul4tsayLne1rU7IyZz6wqBHpOzZLmMZvSit
         7qIkOQALQCZr8xE7vadpFcHyZhDD35rnw29IXWM2KFJvMX9lf6Bqjy7ThEmMcBBZkV7H
         SOZQ4U5O2e15SiF4VtmYIF8DaracUEntfofU0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789835444; x=1790440244;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UGWocLshUzVVG8Rydp43t4CQtO4FrerHAEoPSMI/C8I=;
        b=18qD6O16mjhxSMWCizY/j/pyLV679rGn8mTCchDA6/wUlZv909autrp1Jf+C/PR2xm
         6dCSSOdpLFf9JX9X/je/xixhyxsCazA1XLYNVxM8Oyb9jwvaVuzlt0LJAMWZwMLAMMin
         afSTYAvsZvNdRyF4y+5Y3Z50uGJJVxWXEORfUBXi3sxmxbfqDz7+swbD6GMxI8hdYbFC
         P3A1M7hpnuNC9oWI5VkxL0eDI9ZuCmb+4vonkqIYCOsUM+4ogU0zocqpmCBfNtuEsr14
         +xxhJrDGm0KdJ/sdsrJkMwgDP48K2n0AdGaKmGdr62AK507BSd27CsLEfazlJdQv/9GW
         KNaw==
X-Forwarded-Encrypted: i=1; AKwUvBzXl9l4zJ0xfm5JnpNJiND8+uAoORz9BW5yWzZgW8ofE7Sr200bsyQNl3uDVmIJEtX8Bhf1aCn9XpI9/Ik=@vger.kernel.org
X-Gm-Message-State: AFuF++kpJlMQAmwYa0qUe6cb4qc9pNqM9NCfX5kmq/WuuEFVEW95o3Eq
	4zVZ2PQ1rpImJqnPNjKHE7uzm+Uft5R7Kflp5dFY44+NNcfWbn3BSDfudEmyVgnfz5HX4jraEVg
	aPs8NHyI=
X-Gm-Gg: AYBFou2gmcv0YC5wHArN9KrH8jOl0jr1jvuSMQOseqI+cFhzW4ZEKFsdn3M3hlo7jSQ
	kj4xtDatv3XFewqqqmMmXe7rzASetLjSC/WnQgNjkvBk/afcqe75OwPuuoecLxCCr72B/3RbSto
	L7E1weX/k762IWmDe87SuKIDRBZK36siq2td4T0nH9QnRrTp3f4wRf0Y/zX+iY9psWYDHPOUaVa
	Hctj6WWefTc9Xc3tDIH19phRb9JaSaksIhtMYQAikEKJHdm1RvD5wkW7fyb22AeJeYqpR3mYrRX
	y8/9UGK0rHR74DcCBApxFIP8/dZDiEOq6mfibUvmYmCo/dRg5lARGwR16RW/GDdDOvTZVBMdx0v
	hGJNKp1xWbZ0Ce05/kD9URXQ3u4ZKsJGGZ9jXphASV8IxUunYzgAzf12dRWRgaDFKvMw1IO6TGP
	8fbBNFEA+bVkDx3XqXefE2hn1Y5lGmLM3S4ui6Jo9Q94oBD13c2C222abUJzY9jx4Urlb2yPAq3
	iXiaON/OjAC3ahAZ1q7jQkCwu98Wlvyr1DIJS5mqZ8MQt3v9A==
X-Received: by 2002:a17:906:6a06:b0:c26:2c3d:67aa with SMTP id a640c23a62f3a-c2a15e7d68cmr543130866b.47.1789835444481;
        Sat, 19 Sep 2026 09:30:44 -0700 (PDT)
Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com. [74.125.228.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a3585e768sm95062866b.41.2026.09.19.09.30.44
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 09:30:44 -0700 (PDT)
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c2953a01240so261545166b.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 09:30:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzbaC0MC1Oq3wgVaszfmQ9MAsYPqSusydsIyz8+rns9DHddqJxARq3itHwlLV3E6yV0Rr16bb3zDx9vN28=@vger.kernel.org
X-Received: by 2002:a17:907:6d0b:b0:c29:2646:fc3c with SMTP id
 a640c23a62f3a-c2a158569e3mr548265666b.15.1789835444190; Sat, 19 Sep 2026
 09:30:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <e9669b34-12c2-4cf2-a887-315f581f0789@paulmck-laptop> <20260919000056.3132131-1-paulmck@kernel.org>
In-Reply-To: <20260919000056.3132131-1-paulmck@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 19 Sep 2026 09:30:26 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj9knmxXD01=top1DQ9_aqrN2a3kpWRS5DQv6QLwLOztg@mail.gmail.com>
X-Gm-Features: AcwNN1UfxSUGwclkVhiP1abbV-DjzJIO2ybg4zteTUzmnNfVhojty9fZ436aqK4
Message-ID: <CAHk-=wj9knmxXD01=top1DQ9_aqrN2a3kpWRS5DQv6QLwLOztg@mail.gmail.com>
Subject: Re: [PATCH 01/28] hazptr: Implement Hazard Pointers
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: rcu@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Boqun Feng <boqun@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, lkmm@lists.linux.dev, Zqiang <qiang.zhang@linux.dev>, 
	Wang Lian <lianux.mm@gmail.com>, Kunwu Chan <kunwu.chan@gmail.com>, 
	Bradley Morgan <brads@mainlining.org>, Nicholas Piggin <npiggin@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Alan Stern <stern@rowland.harvard.edu>, 
	John Stultz <jstultz@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Frederic Weisbecker <frederic@kernel.org>, Joel Fernandes <joel@joelfernandes.org>, 
	Josh Triplett <josh@joshtriplett.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang1211@gmail.com>, 
	Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>, 
	Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Vlastimil Babka <vbabka@suse.cz>, maged.michael@gmail.com, Mateusz Guzik <mjguzik@gmail.com>, 
	Jonas Oberhauser <jonas.oberhauser@huaweicloud.com>, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 18 Sept 2026 at 17:01, Paul E. McKenney <paulmck@kernel.org> wrote:
>
> Its main benefit over RCU is that it allows fast reclaim of
> HP-protected pointers without needing to wait for a grace period.

So last time I looked at this was some time ago, but the thing I was
missing then seems to still be missing: actual real numbers.

And no, I most *definitely* do not mean the pointless "do this in a tight loop".

That's just garbage. Honestly, when I see those numbers it just makes
me go "I don't want to merge things that even mention this kind of
stupid load". It's worse than irrelevant - it's an actively
misleading.

So I want to see a real load where this is actually visible not a
"loop a billion times on a hot-cache thing that doesn't do anything".

               Linus
