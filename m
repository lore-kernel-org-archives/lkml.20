Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794219407;
	b=iADwmKg0xzyQeQ5pAlwILtxHQvHw6h1o9Y8o7/0mWGogmPFkZPXrYDdoHYFS++q9UFrU
	 D6e/+jlefRVQxImclY/XuM16njTr9Xkcq8sweXaC7OkLQc3oeTeOXrdkJW9BrqogIUHME
	 bpl1CSdSmCeIneW/CSNvWESUnmTdXRwyshBhB9L4Ad3Ze393y6CFl8pimXFmJW5y1M/f3
	 mxP9oZn0NraxtLNEcLRRtm7NOhWXPFsMpgNlzp93UARt3Nyt06uXDhWYmiSFZU3Qn8/GP
	 MITOfGVz2jw8ZNpw7ITDbv80cbBcDtYq3xB8H6O0ykCQlMaR4VxwODEbmmrFGRzkNhQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794219407;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=z1tFFIkKDjY4xYW1PtNGBh62gyp6wCd07sTLJtfhRp4=;
	b=nkdGLBXNcIqk/jXFiWzBa3/WdzwahJKv1TU8r/BwMm3Z0wbNfMbkH/SVr0+bNR0zzV5P
	 TFZgOp7FmqbV+5wkJGACWASI5f9Lcz8pKh2uN/7TEw9lSIKYk1kwmTXkzQmXkwTylR16G
	 6Ps8D+nuywNoL6Kz9/arzkf5HKQDRRgiUlFY8wt76rjBuB3KD12/fSYYKv6u1m1/Vd8hp
	 HSSlCUqWtq7LPbJ8GMCMwpYfxikm7gTjwZrlWK7hxmI8B3pWKMTYJRhDx7RjhJx1gzYiB
	 cHP0Yi91WeSNNXymWgMI487NIlmm1IMOECeJ7g1eOXBtnhkprExT4D1ye5KqI28+rww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outer-limits.org;
	spf=pass smtp.mailfrom=outer-limits.org;
	dkim=pass header.d=outer-limits.org header.i=@outer-limits.org header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=c3hOmrgv;
	dkim=pass header.d=outer-limits.org header.i=@outer-limits.org header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=KJ3gWpH+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.52
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C2C606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 10:16:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42C2C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=outer-limits.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outer-limits.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outer-limits.org header.i=@outer-limits.org header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=c3hOmrgv;
	dkim=pass header.d=outer-limits.org header.i=@outer-limits.org header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=KJ3gWpH+
ARC-Seal: i=1; a=rsa-sha256; t=1794219368; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Ly5CoXLr6I+bRApne+yZ5VfYEOur9JERXKloz51nArrfXuODkvcUiBvwjOb0RJqqAr
    y+6zx/tmpuX7jHH2pt1+vR4i94Ff/5k0FgtLYVirrIFegnTjkMsvu7bZ56w5UQHmyeDq
    9sRGuKrIVOVSrAhNjANUgeRDFOkCPNKxiV3NBc06yhroqUm7C7gJ+x0zkMrBYCxkvg4R
    KDzGvZ6NNzkbjmJL6WWXjy53zb9WGUlf73B9oTJ6ZpmtIThVGK0Y04dU9xlrvEDWJUWM
    82QNdxK0b/YdFohRzHG8LEidG7z8TmicoOGLi+ZUiZwJwFLGXwgLr1NNSLc9LzJTY1yt
    PObQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1794219368;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=z1tFFIkKDjY4xYW1PtNGBh62gyp6wCd07sTLJtfhRp4=;
    b=iBV54vo/NoN5wM2xVSGV7GLBiw6NcCypt1BkXWz6mix97Uk+SPHYnqvSTND229WaDB
    zsNAkvxcwnNXir7xfPyu3Z5c11udVYMb4lGVynjkpQeAyLC6p4pCEh9YSatNRBqVTgOg
    o1JAKJ9vJhq1ld7fN8ufKePFHZP8ttZn/E5zQ70H+FJmIBTYiE6cWlrMXTifZoUFENtV
    LkWCnP/+emJ8F9hpqAn5lDjPYAT/Iu8SvVD89k9H6LxK/Sj5sIGVghw6X9vDyQW8aWnA
    HI6HmezT7fdCv9LtEYWXd2zAUYev/r/HOb6boG97XgTSMSuSL6lg9Jfe/uzwYyIboNpy
    X2Jw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1794219368;
    s=strato-dkim-0002; d=outer-limits.org;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=z1tFFIkKDjY4xYW1PtNGBh62gyp6wCd07sTLJtfhRp4=;
    b=c3hOmrgvGDecahsWsm645sNDdaO5/OJpe12xwJq+HYZyd1rPjkCiWCQJsgPaMcvlth
    P17D35QMNCtyjk7ouQzNMvYetISiLcYvXgalbSgP/0VIkOM/mUNXYUosXnIoKbMlgoL7
    PuokefaNNzc8TTN8dPUZw1bpF6yRkDhSlzQC60q5Y/XanEbf3K25LvJF3laRFmpf0HRG
    rMny347h5gqf2+Ug9NWeK+SseZXn2L78Q8bM3ku63Lk+669/6YqvXg+FapTGOEPS3Keq
    VRWxZnhecvOF9XEy1o+mT4Bp1jE32qoHvrU2xjEpHrPTF/+lJTqzLR+SmD88O7TJCSIY
    n2kg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1794219368;
    s=strato-dkim-0003; d=outer-limits.org;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=z1tFFIkKDjY4xYW1PtNGBh62gyp6wCd07sTLJtfhRp4=;
    b=KJ3gWpH+1bvC7YaM6TF17cqLSRMT6xMJYpxHEcv8J5cR8v8i9HB5JD+IH106OKz2eO
    fk3Ep5OzEYdfV+GbjJBQ==
X-RZG-AUTH: ":JnkIfEGmW/AMJS6HttH4FbRVwc4dHlPLCp4e/IoHo8zEMMHAgwTfqBFXdk1Z5IDmIqDY7xpnOs6mGD64frXxHtrE3e66udIGwZnWwLgga9o="
Received: from [IPV6:2a01:cb15:80c6:e800:a9dd:2b53:f1aa:d3fa]
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id J82cde2A9AG7zog
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Mon, 9 Nov 2026 11:16:07 +0100 (CET)
Message-ID: <1fb98f79-183c-4144-aaac-45a437ff2d32@outer-limits.org>
Date: Mon, 9 Nov 2026 11:16:06 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Re-raise irq_work lost during Xen suspend
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 Juergen Gross <jgross@suse.com>, Thomas Gleixner <tglx@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Jiayuan Chen <jiayuan.chen@linux.dev>,
 "Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
 "Vineeth Pillai (Google)" <vineeth@bitbyteword.org>,
 Adrian Hunter <adrian.hunter@intel.com>
References: <1793977074.8631fc262581453bbf619ec5b2062170.1a1b15dc430000403d@vates.tech>
 <20261106153647.F7ld02De@linutronix.de>
Content-Language: en-US
From: Julian Vetter <julian@outer-limits.org>
In-Reply-To: <20261106153647.F7ld02De@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/6/26 4:39 PM, Sebastian Andrzej Siewior wrote:
> On 2026-11-06 15:57:40 [+0100], Julian Vetter wrote:
>> We hit this issue with an Ubuntu 26.04 cloudimage guests (7.0 based
>> kernel with the 8250 as an nbcon console) on XCP-ng 8.3 / Xen 4.17. With
>> a kernel commandline adding two consoles, i.e., 'console=ttyS1
>> console=ttyS0'. During a live migration on that setup the printk()s from
>> gnttab_resume() and xen_irq_resume() queue nbcon_irq_work while the APIC
>> is disabled. Thus the list transitions from empty to non-empty, but
>> doesn't receive the IPI to empty the list again. Afterwards the list
>> stays non-empty, so the IPI never fires and all irq_work piles up.
>>
>> The Commit 560f4deda327 ("printk/nbcon: Change nbcon_irq_work to
>> IRQ_WORK_LAZY") removed this particular issue because declaring the IRQ
>> work to be lazy, causes the timer interrupt to trigger the irq work
>> instead. But any other non-lazy irq_work queued in that window is still
>> lost the same way and will cause the list to fill up without being
>> handled.
> 
> Adrian has this:
>     https://lore.kernel.org/all/20261102074039.26983-2-adrian.hunter@intel.com/
> 
> I sort of asked for flush on suspend but Adrian pointed out the NMI
> problem.

Thanks, I missed that. It is the same issue, just a different trigger. 
Adrian's example even ends in the same hung task we see 
(fsnotify_mark_destroy_workfn waiting on SRCU). Also, Adrian's 
syscore_resume() placement would cover the Xen case as well, as 
xen_suspend() calls syscore_resume() after those printk()s.

> 
> Looking at #1, you could probably limit it to a nop on
> !arch_irq_work_has_interrupt(). The tick should not be disabled if
> irq_work_needs_cpu() returns true (you don't add anything).
> 

Yes, right, the lazy part is pointless.

> And lazy items get handled via irq_work_tick() anyway. This make me
> think if it gets any easier if we handle both in irq_work_tick(). On x86
> raised_list is evaluated anyway so by dropping
> arch_irq_work_has_interrupt() we would avoid the APIC check and handle
> list in this rare case. If the IRQ-work is working then the list remains
> empty.
> 

This is maybe a cleaner solution, it needs no APIC access and no call 
site in the suspend paths. But irq_work_needs_cpu() would need the same 
change, otherwise in a CONFIG_NOHZ=y setting an idle CPU would still sit 
on the work until it leaves idle and re-enables the timer tick, no? I 
will test this.

>> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
> 
> Sebastian
> 

(Sorry, sending from my personal address, my work mail server currently 
mangles mails to the list.)

Julian
