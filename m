Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794864970;
	b=jqAAupVi3z3bTwpWhn9pKy7EHwzopP6IuvyAnllEBVw7iF5RaoUPFayefR9St0k4Crp7
	 OEBPBGnnbXNCH1djosdahWS+C+j5s62QR10liV46krLz7mXmsN+gw/yFuUAFrM8zI9dTO
	 V55arjwQ49PCE9rfhVzXdl+wWXaV3nDSGCbUnYvxBenS1xiLa6VFI6KsUiFT7c6Zoj5cC
	 ShY/OSvf2YMvT53isos0PgrCUY/9bYkdr6ML5vBD2BuamxppdzfDXQ0ZOReggmwz2tD/S
	 3FKqN+6hxuyKCgWqMAleA8E4IEFcx4/u5WPqN6p7HGoU6nWPS/crCZ1mx7FgYkUCblw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864970;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=apANsySrfP2AcQg+nmmV+CTyQp8Y33Z+cnFTxK46jGk=;
	b=uPuopEI+IkrXCU6goB6KdSrvvpVY7uj/8sdg8hzsJXuqsolJ1ueNomfAv0jW6u3MndYI
	 QU5c4lk2ICv2K7xqqlnD2vshVpAaQzMg7+PWrEJjl/DMRxTNg6ohxPuAiRwibrpGU4Yj7
	 u+qWP6kh0c7Dan6WOHvxhWGjWLwJ0YDc16M7M4eLjIsh5nOEVFwyBEjLIUykVVylijErs
	 dcN0yWKWoyYUqqlSMUMCwUuitTMVMJuh63Yzr1RBU3FGBF4xF+L9ToHUFoGTQQNqiGMH5
	 KrSRlDPUUPyYZatKGC4/1Cg8RSQrwWlkiEOu39Y678eCoojp3btAIzbq4sLB2iF4kgw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FkvtWOck;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D918D606A893
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:36:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D918D606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FkvtWOck
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so24781445e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:36:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794864967; cv=none;
        d=google.com; s=arc-20260327;
        b=dQEjm7smPR6+IwCX9qM50RfxangBHvI0VFyKBqxc2ropPZvDTah9sYgnKMKxpEOcWm
         9hGAGNjx1+Xx9C+Un+ur1VDEWB3In9y3cqvOR1Xux2Op9zWVCg17bjHYKQ87NK6T2lky
         jRV4+o4KhWpFetayE4II/n7/7mJTH60P3VE4551pvdej8/NLH4Cqys6/+v/B3cjExud8
         Cz/eTPRpQhBCRRQD+oE+UxLJa5oK+Fc8FklhTonh2BiQqjAatjjLIdUOi96hU2NeFSin
         4TU+oW9XGMLty6crGUa5yE7PMGUUZWPkST3j97l9ITW7j3oZFfkc5Cb0NSRgopXHbtSx
         XCDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=apANsySrfP2AcQg+nmmV+CTyQp8Y33Z+cnFTxK46jGk=;
        fh=njiCThYI0kQTO0oqj+JPb9CD2ByZDrqcqOXjCLbvFps=;
        b=GoLalwUo2RCtbgH7RYlg4MT3U2iPwXWoV5gx6SveqgoUJJoxUQw2aF6nqFF9LQ4i7l
         r43tb5gUpE4Smvnzo5nUxdk1ZKbFHPzkyLxAqn+5KidIiyUQHqM6LhmSal8FdXpMFriu
         MDL4wEnTKh9cDbxhQ9T1cAcgzYgXbjAjH7lJUnhOkhDUHLapwHZhQxuAJBFoNnu9LEAl
         MUxGCJFcdTgHMXXrzG+Zg1J3uN/k4Xss6ouh4ftcd8jygn4otUNPyegFbRypfzsdhG5U
         b1aHnBs8v2HCwGo90MXJq/gi6VsgK5ORjjGRqMSoGNR/DO8SpViVIi99e755IvBxd97a
         TB5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794864967; x=1795469767; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=apANsySrfP2AcQg+nmmV+CTyQp8Y33Z+cnFTxK46jGk=;
        b=FkvtWOckknAYm0RBIyWFk2hyjH/txzcVdLyRwArO3s5wVqxQHIzo36LUaapF/n6Z3s
         Q7YViKggIQ1g1al0cxXOXU7xjTQP9RgTuVYTzpM0kQPftfKlzmM61gyh4a9OElg7G8/n
         rmBBI0+BETwqhAGXFaSkKe6p/5WHlelwsUsuy8LR4H5E7klAZixS42zbd1Q9uuT/UEjf
         cmiohyXZ/DY8pBIkbFlE8Z6shSu+KQWFwv8z+SNAmrAZPdKHnEewpqdITKMjGCK+xR31
         Xbg4C/wyovicEPWi/6Xe7TuRlni2rKJ1ggTH70vyv0IIe1VP2eCc6vhfFEoFBqkjI4XT
         N83g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864967; x=1795469767;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=apANsySrfP2AcQg+nmmV+CTyQp8Y33Z+cnFTxK46jGk=;
        b=IeWLxTspD/TvGsWbR9Is3Ik77CAmJ7ucdR46Simfpcp5K7tKOWFauq2f77zUPfmvJI
         PLtettbR2dfO8qzC8uKbQqikbfOwNb7Lqap3+rAoys0TrusT1ftbLQtsT4Ec40ruOT+e
         KHg1ARQtT8Cnee95/jjxXbv/AvTzmIB/Wxqs4kJZU22I5zeJNDKzJUI8I3bo0XXvf16f
         9gXsWisk95FZfadeU2YGfGybdQxlawhfeSmIkBo0r6Rpvh83aZw9iENdbYXtu45RiyeJ
         +0rimALubW8zXmYlINAbk/6t3nupZBIaO0awGJ0x79mfJ79lWFXmWxlHjgOoBunLzOmZ
         dvKg==
X-Forwarded-Encrypted: i=1; AL+hErHA7+JjTBct1rmmG6PPW3a6XAhWoz5fnDrk341kXIbXw+HgUwhYekniO30HFn8f8cP75ZyqWcZZFa67kWg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PWUoXJhKDyer+FI85ApCsLoAMQyi/Bvo/dxeV9XKBuWb5AT5x
	M0XujxzepXw5Z8woJmukYyK46vJIxLZ4dWeeHDGbj9AumhcHPmZ3T8mUg0nNMxLTWcFxjgHWv9T
	1udAWjkGsrdtsxcht523BugJW2wP86YfQ0v9YTLc=
X-Gm-Gg: AYBFou3iUjz245s5ZIRLTDeLxr4+PhjSwScIZEuqXSlvYfKpE63LEU7N2L6/zl4SBsA
	V1cVlw4TWlEcmbYE+NYAaqPN0sE6tXDsKG0CoGjjGAp8kyNQoWx1mEdm9LFHnwG6ssQhVWnc8G+
	Hn8SAooCsXj21sDqRwdxZFIFuC8UR0W42n+e4+jU2OyGaLEisvdotrTi4r+Cc8vIryI2X7cvgQ+
	PRm7hMg3nPhNVScP/UKI8xB892P6dUXRp4EXnF2rRzkfmOKiyrZtzYF8BOVDTUlDmegG01SGwLQ
	+UGClAoZluFb4Zi+7NxIlaz+B1sFcj0JQzG3x0w7LArD2UNW4VuPMcIE2nSEyYJzk2OYWaxoFEg
	GM2B3yOSnHiUFG2ZcRiykogkmbQ5taEBWyZzF8tiylDoeWcY8tEc25UEdSjZusSWmSyBx12ZcQf
	xpDbGI+QqZy3hWx9Zfe3KxJDyxKRIRP4Sx2m8s5jt3Kh4iPj+q/jj4UEZ/N7AYgpcTpvIrduSRr
	CLtxmt7qg9I1U1+lvs4EX94AQE1dWzgl3vpA6Mo2eJ7Op8cI5uh4Va5OekbwA7YW/3aN4KyyV5c
X-Received: by 2002:a05:600c:6090:b0:4bb:6752:8413 with SMTP id
 5b1f17b1804b1-4bb67528699mr154625985e9.8.1794864966813; Mon, 16 Nov 2026
 13:36:06 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116192638.233125-1-mathieu.desnoyers@efficios.com> <20261116192638.233125-3-mathieu.desnoyers@efficios.com>
In-Reply-To: <20261116192638.233125-3-mathieu.desnoyers@efficios.com>
From: John Stultz <jstultz@google.com>
Date: Mon, 16 Nov 2026 13:35:54 -0800
X-Gm-Features: Aa3M54qNbJqnYjwTpJDqdrj2fM1PpHTuxzMAt267iJG4QdrELR7wDN9LyqQRXVg
Message-ID: <CANDhNCoWGAPr+TBPAiZB1bd3o-CGpkYG_w2ssgx0WQryBXe_bQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 2/8] sched/proxy: Wake blocked RT and deadline
 tasks through the full path
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: peterz@infradead.org, mingo@redhat.com, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, linux-kernel@vger.kernel.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	connoro@google.com, arighi@nvidia.com, akpm@linux-foundation.org, 
	shuah@kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 11:26=E2=80=AFAM Mathieu Desnoyers
<mathieu.desnoyers@efficios.com> wrote:
>
> With proxy execution, a task blocked on a mutex stays on its runqueue.
> The RT and deadline classes do not put such a task on their pushable
> lists. enqueue_task_rt() and put_prev_task_rt() skip a blocked task.
> enqueue_task_dl() and put_prev_task_dl() do the same. find_proxy_task()
> migrates it instead.
>
> Commit 7918cf369361 ("sched/proxy: Only return migrate when needed")
> wakes a blocked task in place when it is still on its original CPU.
> That wake-up does no enqueue. It also skips select_task_rq() and the
> task_woken() method of the class. So the woken task is runnable, but it
> is not pushable, and no other CPU can pull it.
>
> A SCHED_FIFO task woken this way waits behind a higher priority task
> while another CPU is idle. In a test on two CPUs, it ran 500ms after
> the mutex was released, when the higher priority task stopped. Without
> proxy execution it ran at once on the idle CPU. The test uses
> SCHED_FIFO. The deadline class has the same code path.
>
> Fix this in proxy_needs_return(). An RT or deadline task takes the full
> wake-up path, as a task that was proxy-migrated does. The other classes
> keep the in-place wake-up.
>
> Fixes: 7918cf369361 ("sched/proxy: Only return migrate when needed")
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>

I need to look more closely here but this seems likely to overlap with
currently out-of-tree chain-migration patches that Conor came up with:
https://github.com/johnstultz-work/linux-dev/commit/80b820a921bf5058196314a=
b72f8446f5ca3bad6
https://github.com/johnstultz-work/linux-dev/commit/27f701c997a152cc831262b=
55a226d513fa6abab
https://github.com/johnstultz-work/linux-dev/commit/fd1c4d9c6df6183e5ad9348=
51dbbaa31846619e1
https://github.com/johnstultz-work/linux-dev/commit/d0d409fad42196f4f412675=
93566c0e55f856d6d

(from my https://github.com/johnstultz-work/linux-dev/commits/proxy-exec-v3=
3-7.4-pre-rc1/
branch)

So I'm not totally surprised to hear there's DL/RT balancing issues current=
ly.

Also in another thread (which I can't find right now), a good point
was raised that some of the early return "shortcuts" that I've used
elsewhere aren't good for core-scheduling either since they can break
the cookie checks, so I wonder if a better fix here would be just
removing that (task_cpu(p) =3D=3D p->wake_cpu) conditional all together?

thanks
-john
