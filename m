Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9873F7AA8
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 10:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788604296; cv=none; b=CPYWEq7gftByddmm0wwbkxJxpOzAOjWUb11pWhHIM/8l7NwCR2CDs8vS74ytkK0Ncv+uBEta52QC2nQowwVULffIiqe2PrtpfmFBwhK9kO9SFyXNFiYKyJ/unn9eBqMU2P6ZKr0dRtJZ2jfriSmL1Ikpuj5M1Mli3/oJlKrrVCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788604296; c=relaxed/simple;
	bh=4rXgfOJ0xvVxonDpFBIOOCRalE+qiMjR1jea2gTjogY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rCBsOAFDifhlwOUdiBI3j52Or88j9bLYIZZ1Uvl59kSmkyWWWU9xXqEra8HSqC7Brio5A+awoUILXC9QKsoLjSLLI73gZBLqZ07LoqMXfk6aOWjRIUS3/jMfgdhdM93UorSP0f5M0iXw/K39xw0A3DcN2h3TJDtZwCRV2qvL+I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eu5IjXdE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eu5IjXdE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B08E81F00A3D;
	Sat,  5 Sep 2026 10:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788604290;
	bh=RO38S0JwK7lDdj7U4pXrQGbqEogQS7B4533x/qRTrlM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=eu5IjXdEP0AybE6f30I01p2u/IthSA3FxhnyCGykpzE0jo+W9v3BCKAxiA+zLvlB8
	 hh2KRoDq+LiHZfzfXrcq47IpPQxYQWf3wEUxaSaj0HlLnnQM7hSMGgiTVswaN1cB8u
	 gWLTXQFwYrpKKY+x4SX4hl/IjROGUtGGM18nxrD+kWU5GqZuTndAzUEaAEk4ojI8Jx
	 SYDsCjGQzihwn2c8D5hsVOGxGZxtqSj9UsEvNTvCrJ7BO42y4LLiRf/uSLMq8da7eQ
	 La6ERcxxBRVVlO2ej3IT/pk8t0QliWOxpPFUAYxuWUpQAThd1hJBqFPy0ye0eoFk/i
	 LEX+4vc6S0nmA==
From: Thomas Gleixner <tglx@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: syzbot <syzbot+417a6b7c02d5d03f9aa6@syzkaller.appspotmail.com>,
 andrealmeid@igalia.com, dave@stgolabs.net, dvhart@infradead.org,
 linux-kernel@vger.kernel.org, mingo@redhat.com, peterz@infradead.org,
 syzkaller-bugs@googlegroups.com, Catalin Marinas
 <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [syzbot] [kernel?] Internal error in futex_wake_op
In-Reply-To: <apsIH2hDpeiGiazJ@willie-the-truck>
References: <6a908778.1d9ded08.62e62.00dc.GAE@google.com>
 <877bl1a811.ffs@fw13> <apsIH2hDpeiGiazJ@willie-the-truck>
Date: Sat, 05 Sep 2026 12:31:27 +0200
Message-ID: <87qzj856rk.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Sep 04 2026 at 19:04, Will Deacon wrote:
> On Fri, Sep 04, 2026 at 07:40:42AM +0200, Thomas Gleixner wrote:
>> On Thu, Aug 27 2026 at 11:52, syzbot wrote:
>> > futex_wake_op: syz.0.17 tries to shift op by 144; fix this program
>> > Internal error: synchronous external abort: 0000000096000010 [#1]  SMP
>
> This is an _external_ abort!

which confused me :)

>> > x11: 0000000000000000 x10: 00000000fffffff5 x9 : 0000000000000000
>
> X11 is NULL...
>
>> > Code disassembly (best guess):
>> >    0:	d500409f 	msr	pan, #0x0
>> >    4:	1280014a 	mov	w10, #0xfffffff5            	// #-11
>> >    8:	f94057eb 	ldr	x11, [sp, #168]
>> >    c:	f9800171 	prfm	pstl1strm, [x11]
>> > * 10:	885f7d76 	ldxr	w22, [x11] <-- trapping instruction
>
> ... so the futex is dereferencing NULL in the LDXR instruction implementing
> the atomic_or operation. Normally, that would trigger a translation fault
> and the exception fixup handler would cause the function to return -EFAULT.
>
> However, in this case the userspace program has mapped PCI down at 0:
>
>   r0 = openat(0xffffffffffffff9c, &(0x7f0000000300)='./mysys/bus/pci/devices/0000:00:02.0/resource0\x00', 0x2, 0x0)
>   mmap(0x0, 0x1012, 0x3, 0x11, r0, 0x0)
>
> and the access from the exclusive instruction generates the external
> abort. That's expected, which is why mapping MMIO into userspace is a
> bad idea. I suspect you could even make the abort asynchronous if you
> wanted to, in which case the kernel couldn't work around it even if it
> tried.

I assume there is nothing we can do about that. But that mmap() requires
root, so ...


