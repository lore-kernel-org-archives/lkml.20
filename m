Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793010220;
	b=NCPo+6A8i2/eLeTNMtWfJefqklqTdgIhPKvOTznVoSmKld3c1gVhMkcuIlHtxnPNBrX8
	 baBtdPfBb9n2peGpDdla0U8uSSLKFn9ldJHr8/g/4vYLTAhmWeicyal6gL4SN0bua//7i
	 9RbFaLiyTB5L4n0p3a0kHWhAumyUYvpG5rDfSPk0/BXUHvxILDqsYdhpWfNQ3/jDNmduE
	 MD9VPgBUELef6gEYrgKrcNITGPxjLI5wPIrdAOBEYW8M1OwUw1UoEtFAgle6wL8XBO0HR
	 ZwOncrpj6278R9ymoSEeiJalrEzQYINA9c11Y6B5o+PMUykabORau6R8asGz9NbXhPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793010220;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=okdfPAUG/95gVMAQwqPlFeuM9Ab2hbczPB989+Nnh8A=;
	b=xI/wB0qBRFz5egfDhPv3S23m7fAJVI5c+DjuCR7C/f6kRnCTV7ARxFDxle3bjU6+jdUB
	 6UAVjgZcEnGvTAJN9ZHLgEbbb3m69rhZT91FQbRCboA+YOfIWiz1TuRhHu/hYtMdQ61DO
	 Njvv+/ZsrmEBEiBx6V0x1CM8UQS7IV++qEigHUHN5dLG/Dsr+uMI1Ne7iLJ1OSZ+OjF+Z
	 LyOqMeBv2W9OM21DoxggKB3yzQrR7x53mP0G8rEVBijidjF1aKkGTmF1y2e6w4yVQm1Ap
	 MMfaYJO7X4iinIQIsdEVOe+9CIXTdtbi9kgyDMAFajnsk7kFN/MaAX4t0XBjeckMqpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Uz73HNC5;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36E4606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:23:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B36E4606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Uz73HNC5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=okdfPAUG/95gVMAQwqPlFeuM9Ab2hbczPB989+Nnh8A=; b=Uz73HNC5lZ1q0U4x7QEx2+B/ZH
	W40bkcZxhehHLm0p1STMmTz7+2PlM/pbZ5yUhLMtmFeCaI12vt4B8FtLbVea9wNshblVvSBGjJBGZ
	/LQPw+P1zZRH4C5aFKd8H+m1ucWRm0HC9yIBPVn5RqfejAvAdHqzazJJZWJvYZcgwOPVQjdYHI4by
	bNXCqQkqRwS8OBzlFX8rihjDC9kr4XEyo1vuT4ulUZ+v47p360aMQzJ6gSPUarTRBYiVFDRQ9Iej8
	M/43SnV17EcrU19Eu+ZSduO3ydX5ocr2qbMdhkj3GQBhk7LerKSmC5sk3bqtYuBQb6o30Nl0CaH1Z
	Qp5C8/Uw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHrZ-0000000Dh8Z-1wMg;
	Mon, 26 Oct 2026 10:23:34 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id AF037300DB9; Mon, 26 Oct 2026 11:23:32 +0100 (CET)
Date: Mon, 26 Oct 2026 11:23:32 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Marc Zyngier <maz@kernel.org>
Cc: zhangqiao22@huawei.com, Zhan Xusheng <zhanxusheng1024@gmail.com>,
	tglx@linutronix.de, jstultz@google.com, sboyd@kernel.org,
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, zhanxusheng@xiaomi.com
Subject: Re: [QUESTION] sched/clock: Potential timestamp jump due to
 inter-CPU counter skew?
Message-ID: <20261026102332.GB2668200@noisy.programming.kicks-ass.net>
References: <cf7a043c-384c-0642-204c-8f207eff3d42@huawei.com>
 <20261026082730.2117173-1-zhanxusheng1024@gmail.com>
 <86zew0ygqr.wl-maz@kernel.org>
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
In-Reply-To: <86zew0ygqr.wl-maz@kernel.org>

On Mon, Oct 26, 2026 at 09:05:00AM +0000, Marc Zyngier wrote:
> On Mon, 26 Oct 2026 08:27:30 +0000,
> Zhan Xusheng <zhanxusheng1024@gmail.com> wrote:
> > 
> > On arm64 the system counter is meant to give all PEs a common view of
> > time, and keeping the copies on separate dies in step is the
> > implementation's job.  The kernel has no tolerance for skew.  The counter
> > errata handled in arm_arch_timer.c (Freescale A-008585, HiSilicon
> > 161010101, Cortex-A73 858921, Allwinner A64) are all reads on a single
> > CPU returning a wrong value, worked around by reading twice; none of them
> > is skew between CPUs.
> 
> Indeed. If the implementation cannot give any two arbitrary CPUs
> anywhere in the system the exact same view of the counter, then this
> implementation is broken, and unsupported. No discussion.

The limit is the cross-cpu latency.

CPU-0			CPU-1

			A = clock();
t1 = A;
t2 = clock();

BUG_ON(t2-t1 < 0);


CPUs must never be able to tell time goes backwards. This is not to say
the clocks must be in perfect sync, only up to the point where the error
is smaller than the observation limit.

So effectively, if software can tell the clock is wobbly, you've lost.
