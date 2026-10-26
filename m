Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793010629;
	b=s3kB43SW9jCQUeBcUjvAnzztsMEHi2waFCMvwr1c3KUKy1Z/T5ycCKrdLJmzvqe0wdyn
	 UoavAAz3b4DlE5awHfXSo1vTlR90YmlilAEDiRtw4GryDpKhxyQyrMbtBYlbPnVsaUBbY
	 sJt740jHV8hmmItVRDcEiXmk/mJJYst4gc1ltOGrkCfOR/lGh/in49g18YjoHCueJQEvv
	 Lwjdj+Yt0Y5sZvNrart7TKcLIwv+Jkbjhs1v/3me9jyhPzqLB++OkW85H3yoTOMwHEMgx
	 m2QLPq8zegvhr28VObn/vZSSLvcSp6PqFZ6MgabIJ6//NKFh9LVAZtDmKf8fXngcpNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793010629;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=BPQ45pNWMxy9Q9JShYIadO5sSR/GgKBVI8UMLlvZrdE=;
	b=VZiLFq/kHV+yyBrCLnp+1u0rXRb62zyrdWjsytFKQrj6kAwpLqeicEcf/XLM/r9xMCri
	 twrKJ+9yYTyfeSXo5OMakrHjJ1uQThPFyXwrpOwz1UiAuHeNeiZyQrzpZBZHdFzZtIZL9
	 YTrtmmrnLyADBF2y0DPf9OTNI5u8ua7Mg+cUK83MIRvYdwt3mMi1RpFo6fmca21p821bY
	 ++afAjW0ELbcKoeVSF0muDSNhhU/Fm992byUI7UQ6ke1ctN7CqmWyXu2LyTmqJTFIjjpI
	 J2tyEtew7RCQsYnUrw5SHpv78bvf+6GXLfZr2GNoiDUYMuZEYfZzNtT2fvUr2dcwUtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=lZJIZhgZ;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A4A606A321
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:30:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8A4A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=lZJIZhgZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=BPQ45pNWMxy9Q9JShYIadO5sSR/GgKBVI8UMLlvZrdE=; b=lZJIZhgZ34Vvmxa8NJqJoeeO+e
	R6AoC+bVdHPWwv9mAjQqOFj5HywlL6pCVHbrwZTXjgnB8w0C5gnOKAhIIqBdMeP/eTD1oF8JMI1Kz
	iNoFKD38SdPxK/i+MQLhnw84YPyFfW/4rHeKlj89Y4X4toh/kYodExVESjWizAKZFbjZZ8zEXXfyU
	ucG/ZkErbm/IBOGWBtWovX7yWH2gxyldoT9CRG1ey+CU/tsnnj/J30xswzEEHffwJ7+uzUHoFz1c0
	6ZjX6NWEO7FyGIy2CFm96M6++opFlCTdLRaVN6+z8UIpKQfsxa4smllg2I4clpZczBWzNtVBiK8Ps
	QRfb7ivg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHy3-00000001gwV-3WW5;
	Mon, 26 Oct 2026 10:30:15 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 8B776300DB9; Mon, 26 Oct 2026 11:30:14 +0100 (CET)
Date: Mon, 26 Oct 2026 11:30:14 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Gary Guo <gary@garyguo.net>, Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, cfu@wavecomp.com,
	torvalds@linux-foundation.org, olof@lixom.net,
	aleksa.paunovic@htecgroup.com, arikalo@gmail.com,
	Boqun Feng <boqun@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] riscv: support CPUs with Zalrsc but not Zaamo
Message-ID: <20261026103014.GC2668200@noisy.programming.kicks-ass.net>
References: <20261026-lrsc-only-v3-0-ec29c8190fb1@mobileye.com>
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
In-Reply-To: <20261026-lrsc-only-v3-0-ec29c8190fb1@mobileye.com>

On Mon, Oct 26, 2026 at 11:20:01AM +0200, Vladimir Kondratiev wrote:
> RISC-V split the A extension into Zaamo (AMO*.w/AMO*.d) and Zalrsc
> (LR/SC). Linux has so far required the whole A extension.
> 
> MIPS P8700 [1] implements only Zalrsc. AMO instructions are emulated by a
> trap into SBI. I measured typical userspace atomics on this CPU: an
> LR/SC atomic takes about 40 cycles, an AMO atomic about 600. The same
> ratio applies to kernel refcounts, bitops, xchg and futexes, so the
> kernel needs to emit LR/SC when Zaamo is not implemented.
> 
> Mobileye is going to use the "eyeq7h" platform, built on this CPU, for
> ADAS and autonomous driving. Kernel atomics are on the scheduling,
> memory-management and driver paths of that product, so the emulated
> AMO cost is not acceptable there.
> 
> This series keeps today's default: both extensions on, -march still
> contains "a", generated code is unchanged. Turning Zaamo off is a
> NONPORTABLE choice. The resulting kernel matches one -march, which
> userspace has to use as well, so a runtime alternative would not
> produce a portable image.
> 
> Zalrsc stays mandatory. cmpxchg, conditional atomics and futex CAS are
> already LR/SC sequences; Zaamo cannot replace them. BPF atomic ops
> still emit AMO and remain unsupported on a Zalrsc-only kernel.

The comment with RISCV_QUEUED_SPINLOCKS state that Zalrsc requires that
cmpxchg() loops have forward progress; which is much stronger than the
typical LL/SC implementation.

Does this MIPS thing indeed provide this?
