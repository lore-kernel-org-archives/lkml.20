Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793979411;
	b=yK2SmvUvk3z9qYTuBleKULU1CTTyRs7PIzPh8vDVVlrfuEkafmjH2M9bHn5llUBy5fSU
	 moNJ8peTiEgJZBomhZRgqeukAtsp+3XCHp3ZF6CRnvff4Qq5vgFAVIqNNrXDZ1NsEe5i5
	 wMFMfkcy9+G5KppRxEXxcbE7cQwwcK/y/ZJBAqiFjevoqDV5aCSVNugghfCrgJniuRb/O
	 cTyCPF4JQgCRrKfjYKLi936MOBnjCdb7py12N2J2AuazekeglYK4rssXLxBDIt9UNmQpY
	 EScfZZlaSLGZRj88K7acggSQiaNXvskNAq0x9wtcSf6iVLJ5IOftb55vUIa3OBvpV1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793979411;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=ZiCURZDhgyGIlSD3PbaH/tWIzwBivGR/3EJJGZ3gorY=;
	b=mupVPabEkktnh8ujYMxZ1kpL8YM1+F4tpna860i5uIcLiysMGLfr06dMWwJqGvEtHuHH
	 HmVmRr6RtoxbFz/QaVSw1esVr4HdCph53LamBro+LYM44bnEk+WEZEQovsfe3jh8hfgRO
	 IV8bJ3hN4s+DNKvKAvpNa/2oFtcA6fwVn2fxCqlHZwtg3Rj9Ao3y3QLkqotTjkFOnBwFJ
	 sMLYK+lUpG5BEKrGZFiNS8tR9OBAmJ47L9kxWfGkhxjfdcxF+z9wm3i9oZsPIN75Hm5eh
	 0j+6xBmVFgpnNVZxW8X7K2pqdTKv/wv8rkQtoxCBrT5xYQhOp10C6JSMnKxfiB4cPDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=PA8n1+PA;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b="N55r/l00";
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E84606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:36:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55E84606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=PA8n1+PA;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=N55r/l00
Date: Fri, 6 Nov 2026 16:36:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793979409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZiCURZDhgyGIlSD3PbaH/tWIzwBivGR/3EJJGZ3gorY=;
	b=PA8n1+PAjNax6kBm3+SA6tcGSljdJx/BB5LXhg2zW45M0g2hfJTix2F2kE+U7PqRMHAPK9
	v1dfvGAUpg3ug4xMm927ngIpFoCzFiLq8AQs0iz6ldVF5F0PgcQ9KnN0qv7Xcxuc6EVw+E
	ED3sQPYU8Ng+R2w4e51jXY13YIdinmwD+71qG3yhj3c9lmZWP/mvvSpz24BZNKGsZ7Qw1T
	AGZEiWU4DXmjyOjUQn0/qaj72S+9Xp/h6pBXdzr4ao0x5n5IyE2lI5WFoTb1iL2ZdwhqCz
	dqJr2xP5bHDHJ4tBPz3w207GIePo7gvSUZ+8OQ/yeSl4TsZUmxZSntcJr+sbEA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793979409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZiCURZDhgyGIlSD3PbaH/tWIzwBivGR/3EJJGZ3gorY=;
	b=N55r/l00i/4ynURyXk6ezziVRoOvkU/z8WHNhLzIMgOaeE72M1wftJA3X0eFJS1sS6cqwH
	gm4WmM151TUp1MBQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Julian Vetter <julian.vetter@vates.tech>
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
Subject: Re: [PATCH 0/2] Re-raise irq_work lost during Xen suspend
Message-ID: <20261106153647.F7ld02De@linutronix.de>
References: <1793977074.8631fc262581453bbf619ec5b2062170.1a1b15dc430000403d@vates.tech>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1793977074.8631fc262581453bbf619ec5b2062170.1a1b15dc430000403d@vates.tech>

On 2026-11-06 15:57:40 [+0100], Julian Vetter wrote:
> We hit this issue with an Ubuntu 26.04 cloudimage guests (7.0 based
> kernel with the 8250 as an nbcon console) on XCP-ng 8.3 / Xen 4.17. With
> a kernel commandline adding two consoles, i.e., 'console=ttyS1
> console=ttyS0'. During a live migration on that setup the printk()s from
> gnttab_resume() and xen_irq_resume() queue nbcon_irq_work while the APIC
> is disabled. Thus the list transitions from empty to non-empty, but
> doesn't receive the IPI to empty the list again. Afterwards the list
> stays non-empty, so the IPI never fires and all irq_work piles up.
> 
> The Commit 560f4deda327 ("printk/nbcon: Change nbcon_irq_work to
> IRQ_WORK_LAZY") removed this particular issue because declaring the IRQ
> work to be lazy, causes the timer interrupt to trigger the irq work
> instead. But any other non-lazy irq_work queued in that window is still
> lost the same way and will cause the list to fill up without being
> handled.

Adrian has this:
   https://lore.kernel.org/all/20261102074039.26983-2-adrian.hunter@intel.com/

I sort of asked for flush on suspend but Adrian pointed out the NMI
problem.

Looking at #1, you could probably limit it to a nop on
!arch_irq_work_has_interrupt(). The tick should not be disabled if
irq_work_needs_cpu() returns true (you don't add anything).

And lazy items get handled via irq_work_tick() anyway. This make me
think if it gets any easier if we handle both in irq_work_tick(). On x86
raised_list is evaluated anyway so by dropping
arch_irq_work_has_interrupt() we would avoid the APIC check and handle
list in this rare case. If the IRQ-work is working then the list remains
empty.

> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>

Sebastian
