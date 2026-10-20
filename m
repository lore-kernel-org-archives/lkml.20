Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792502988;
	b=EdrA/9dbEoPUD2JhINzSNWggZtNJZKJTJu+3RpGHapHdIadnZUebFhjIdrtpgnTCFccl
	 7VfOaUQoa8lCyf2SXbDzXUGVtmllY7D2ZjPtFCNUkSOLqHzU0lEbuFzZ5h/GWFdPS4p+G
	 k0kUjhv9hz/LL0oIsJZ3x9cttfQ3z7P8/oTl1yaEOD6kS+2oYKAHM5gaNc1y92nJMLLLC
	 xdehE4LRGRptWWr+ISNOgRUL79cqJdaadTER0jI26ky+KeMKUCpMwThR3bLubhgs5XGDk
	 8yqCzgQlioEJ8pCRoSVUCfNUj4m83cGIUYpjkPcWTvPHa+TtnF4msx0EuXaUz6CeffA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792502988;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=GoAdG5LD4++Mz1Oi9XOmg93QHvpINRKEHA4v8WqeZzA=;
	b=lgfFjjG8ieJCzcfDpIoH+P5Exxsq4YW1pOnP9459onphD8qmJWOp8JqpH/ymExxKEyMY
	 ksP8LG+V604JUl9cH0ncTCISRSE7Cso4iq4RYzeqBuZM5NeZ+XyvR/7twF9M1SNpGpx9D
	 eH7dbOvci0jtztUQMEhV6ihYwXfEzmTIQk28DQ3uciqD+kj8ExYMg+WdInuYmPTYdAi6/
	 RsNuqgHPum31eok9HYUDp+TAZ9A3nKbj/+T2U4ksNEc6CW7srtj2FpF/2IJmIRtiZDYHk
	 c1yIrp/cVutKgBIwJ51Cpjb6S4CUFtQ/KX3mYYGWZboFwIR9eLtzzvNLlZ8BxOpS6WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WvsXAARo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E69B606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WvsXAARo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9F501F000D4;
	Tue, 20 Oct 2026 13:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792502988;
	bh=GoAdG5LD4++Mz1Oi9XOmg93QHvpINRKEHA4v8WqeZzA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WvsXAARoBuC+DMbCRqrac83u0ve2zarkH15LXC7N/TqHSa3LSYRNZlihSsSt1hcgG
	 uipgJRKObyV7k+8aTWqEhOFdOerb/dOPqIjmmKERnCoXHZCvxxoYkfXUJ3gLZQvpfG
	 kASe5phrJFhWXz3k1ztIsC1evqFrLg8yYhQbPvZo00mSOPqy5Twd/6mJHgyWVnbLh+
	 q6MTLrfF3xLB+uY15M1V3PKv0ahkpAV6HMJuOegiMRfX4y4oLBeQf9e++jtyc9FcCU
	 Tk4ElFPF00g/717xa2I/0ZDVRhaiz0HSzl0vFvYJFjuRGtnbdD8ed75GqsehQHykZ5
	 WND8mNPJv+qNg==
Date: Tue, 20 Oct 2026 14:29:43 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: shaos <shawnq1@163.com>
Cc: akpm@linux-foundation.org, Mike Rapoport <rppt@kernel.org>, 
	Peter Xu <peterx@redhat.com>, Liam Howlett <liam@infradead.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [BUG] mm: mremap merge clears RWP state from an untouched
 neighbor
Message-ID: <atdqy4ngmOFW4nIB@gremlin>
References: <20261020110748.959870-1-shawnq1@163.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020110748.959870-1-shawnq1@163.com>

On Tue, Oct 20, 2026 at 11:07:48AM +0000, shaos wrote:
> Hello,
>
> An adjacent mremap() can remove userfaultfd RWP handling from a neighboring VMA that was not moved. The moved VMA and the existing neighbor use the same userfaultfd context, and UFFD_FEATURE_EVENT_REMAP is not negotiated. When the destination merges into the neighbor, mremap_userfaultfd_prep() resets the context on the expanded VMA, including the neighbor.
>
> The neighbor's PTE remains PAGE_NONE with _PAGE_UFFD, but the VMA loses VM_UFFD_RWP. A read that delivered UFFD_PAGEFAULT_FLAG_RWP before the move then completes without an event. The same-mm PoC reproduces this on two fresh boots. No-move and nonadjacent-move controls retain the RWP event.
>
> HEAD commit:    24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
> source version: Linux 7.3.0-rc7
> architecture:   x86-64
> compiler:       gcc 11.4.0, GNU ld 2.38
> QEMU:           6.2.0
>
> console output: https://gist.githubusercontent.com/shaos26/3b44971d9385a0cd18cfbf2e9bd730c6/raw/368568c2dd47417b54a957c8d9cc09f77f28b236/console-output.txt
> kernel config: https://gist.githubusercontent.com/shaos26/3b44971d9385a0cd18cfbf2e9bd730c6/raw/4989bc843fa61b5eaaaa53422238ec39e4356b70/kernel-config.txt
> reproducer: https://gist.githubusercontent.com/shaos26/3b44971d9385a0cd18cfbf2e9bd730c6/raw/109dc86c28debcaca07aedb2d450ed1e95ae5edf/poc.c
>
> Build the kernel from the revision above with the attached config. Build poc.c statically with pthread support and place it at /init in a minimal initramfs. The positive run and controls use:
>
>     timeout 180 qemu-system-x86_64 -accel tcg,thread=multi -cpu max \
>         -m 1024 -smp 2 -machine q35 -nodefaults \
>         -kernel build/arch/x86/boot/bzImage -initrd initramfs.cpio.gz \
>         -append "console=ttyS0 panic=-1 oops=panic loglevel=7 rwp.mode=positive" \
>         -display none -serial stdio -monitor none -no-reboot
>
> Use rwp.mode=no_move and rwp.mode=nonadjacent for the controls. The positive oracle is PRECHECK fault flags=0x8 followed by POST no_event value=0x41 and RESULT=RWP_NEIGHBOR_ESCAPE_CONFIRMED. This is a userfaultfd tracking defect; no privilege escalation or cross-process access is demonstrated. I checked upstream master f47d223627f8; the relevant mremap/userfaultfd logic is unchanged there, but runtime validation was on v7.3-rc7.

Thanks for the report. I think restricting merges for UFFD seems a sensible
solution, will put something together.

It doesn't _seem_ to be addressed by anything we have recently, either.

(Small nit on email, please try to line-wrap to 75 chars, makes it harder to
read mail on the antiquated systems we use :P)

--
Cheers, Lorenzo
