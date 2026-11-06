Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.155
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964869;
	b=aoRd8IUY5GvSV4cKJkI5t0iJr9yOiSxTLkYOJcsodGzHUiHqI9EFw5ap8PZSYAuC4loO
	 dQ1Z+051FCXAOoQXFM5+PmlN8Y4mu6IU6NHqJjbA9LCtr08munzgpYO4E2zAkHDV1fCXD
	 JWNYkKrKjTGT6SVwGyxjFuKxZIZmh1ztxtKOlbmgIYaT6ztkG3g1RAumIGrf3V1fvJv9W
	 VU54cSwfWmbJUqiwTizWiPujhVRMRI9eIgz7S2vNjjKZ0/tklrhtgNnq4zPj4UMVh/kJs
	 0+mTEWcCH7itnqt11Dolrb5GjyFXJc1//tcq5C6tZz9IHDb/0ZU+lb0V9ACMfVLoY0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964869;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=S05hHUwARmVG7zsi3KTm+NNKa8OEiz8mS0LktP+OE/U=;
	b=RDoKN51onRhXq0A7TXfJH3gK/qu9CkvBsR2Ot2tDwlTJKepLjyLxFJ2SH/2og91i1egL
	 iAMS8aSNz3LYqt9PXJ1U/bJe0J3d5aip+/xgjsyeT5B4zCQXRChfuX7QY8r+a3psvNh1Q
	 be+faIW7C4trhlLb2i1RwWJQ0HryEAxLZkQf5MG6ca9D7Z8DsfjEnyq1uaLzcmq5d2MbI
	 VsFzr/gWU5LPEhdkrYOP8aLJIwgL0EtTR07qaJQFD8IRUojZkzksr1ZeTFfirXm0SfdZW
	 v/qNCutmOmWiaPtwSVAKBjrRnNHXBIlHYjcei9nBxkbc2a7W+M1PVLDYiCpa2GShtlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=shutemov.name;
	spf=pass smtp.mailfrom=shutemov.name;
	dkim=pass header.d=shutemov.name header.i=@shutemov.name header.a=rsa-sha256 header.s=fm1 header.b=w3vyx2py;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=BUjls2Mj;
	arc=none smtp.remote-ip=202.12.124.155
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CAB6070969
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:34:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32CAB6070969
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=shutemov.name header.i=@shutemov.name header.a=rsa-sha256 header.s=fm1 header.b=w3vyx2py;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=BUjls2Mj
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 7CAF17A01C3
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 06:34:27 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 06 Nov 2026 06:34:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1793964861; x=
	1794051261; bh=S05hHUwARmVG7zsi3KTm+NNKa8OEiz8mS0LktP+OE/U=; b=w
	3vyx2pye6pNcuccrdfJ/GlqZmuUkNWOWA6beTS7Ot/qCr/ORnRyM5A42rsuwFLRT
	jhZpIrazgmWhxONDXH6EEDN3RZF2WGCIuJmdSbUag6P0UqjRsB+n8nWFMiTNS8PZ
	ve/QYI7BpcGDkJ/Kdfd+W9u/khI5MOCWRClVT+zNDDXZ6IkAxzJOPGUgPKErSZJH
	REsPXv2vlwQK8TZOrS1aDeA9WJAJXVSz3JPsaCGgmxgbIzaEBS9fZI4UF361KSbz
	0MBeJ1aer9Rx9K3mU0J57omO/dNzN2APpPdaCrl5ykQVnvOV5DmquEHNyDawDLn4
	taNR9Gh/UhThnTQmWJ2sg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1793964861; x=1794051261; bh=S05hHUwARmVG7zsi3KTm+NNKa8OEiz8mS0L
	ktP+OE/U=; b=BUjls2MjcTECELvifgt8JRtzFw5eXBzY2vuEmMAk8dT/HL7cciC
	w7Mvr/ni1IPUHwTu6OOxU+OI44Cm2Diuy0z7VsqD0kBSFqWzHOKA8yQ9N+ZrOTkG
	AotUPe5iMg/rfxcqnyaFnNIySjKOy+y34/yKiZ0VsmeRU+ha4rPaBnKX6FMAS5J9
	koge9Udolt252EhD9m07pdUVznmYDCnSDEk4K8cql7Apyffozft+UAknAFdJMPCj
	7SEVltD9TnyaVkw90W5wSP2Slx3XQEwEvMQBItR/oADQDHU2YvwGIoVfHlVGQPoS
	Uej9vejXNyEVH/JFD3Lp3piem67J5aGjZ8w==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=shutemov.name a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793964861; d=shutemov.name;
	mf=PGtpcmlsbEBzaHV0ZW1vdi5uYW1lPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:tAdOTzz6XUIYBzLUkDKkyUC/DQsyGvXEXrpaMbH3B/BB3TV
	gB0ZaBumpPiyCFHUZoKtBbyv2uLoeSRuxJn8fPAcOAIB/qQVRmFhx4898IX5Fg/I
	8/KPFYJ8SQ0DR9VrjbEJCDF9cWfR28oQE3BrsU2kpgspndCtL9Z+m3jVbTQbja47
	qhAV4RIp9MA9R+YGaKjPoZRMT9IS1RAxN/rifCHg3ukgrSOhW7mcrYJAtiMWCFzL
	BPEuEoxZgS7BTqHqJoBFMMRkbJxfAKbJCv2HzyEL5EGGkUqyJhxaSjThbU2MXozV
	A//5PjU9Ft0K0XpZjUHKwESTIAfMZf99pYJ34DQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:N9Bkb1Q6euqLM6IScdWgBprItu4YIW/zij64EJC6ZMQ=:4f/ErG6eviUjNpggser3qW3I6mF0YGTDsd0v9fb1QL0=;
X-ME-Sender: <xms:PLvtao6skYnBqTYV9-Aa1wsSMpQ3nmveRwWohNCj-ElOSSK6P28nlw>
    <xme:PLvtatAOGn5fhtMkEi6uag1pK4QhYOhVNBEWzxltc0Av2rZEoWz8_sZWngpoIKy8Q
    Q3I4Yf3JYJPO6WdCPInnbuoS6wNjm9Dxn8qHaPxaBpMcR58Zvyg_hls>
X-ME-Received: <xmr:PLvtak7AZ0Y50LfdbcqFez9REXD_OfSblvx0wtsdYLBvkZnbfv6uY0IFbNM>
X-ME-Proxy-Cause: dmFkZTGSmkU8QxgTNq8+9R19IKWKHZQ98KB/ddheFnBanaWgbOP5Qa+MHtCDoX04z1Q6ZO
    K/lgDFBAUtC0e4JK13G7iaIqts9SPcP2Ar+WENIwZszm+Z4BNTqkYI/ORWUXannnF7k+yf
    kzb/U+T9loMlNHRV9OtykpVSsPh1SXFvl52BF+nGW1NbzJtjCG3li/ZbtHU6qhc1TKPhKJ
    xkdy8En2oZLlWW6f3Y0u6I2aKxWdOIUGNZV5nKzXs+Msj5zbMum2N74kgcs4GrOuoeUjJ4
    ZSv5QI+McWKml/sVOl0vehvYTRscOERrxhRfihEoRYJ+5BND+/Yt2fezBdoe2W4ssaRzK5
    k/2l3uKW8Mu5ItSlXkgnEXwMqOoaedop2acOxaZP9403nprrXDKSsrlrqmNXxtlWvY0o9C
    oUg4d7zsfI4qie0nccA8j8NjQxyla5w9GejicgQNDkmw1Jj/KsCkHlZlqS3P9R1OxdqzM9
    uob4O8j+xN5cafNH03wlkU7KN1XmM0OjgICFUQnDDlHCwt//Khjx+yz7OfvaX6oGuLLEzi
    AY1Y71cm43hQQC9CR/TVvMJwYJGd4tLpFKhrwAAtLFf9SjTGYfw1nctjJ56ihzvLJHpytE
    iiI29rXhg7k0Y4R2w8swF93RfEPgvb+Vr8X6Xa5Q8ss1ehn7X7i62Wvpjgkg
X-ME-Proxy: <xmx:PLvtaht0_Ss2eNACDrMYATowHqmyhHE2Lc11pbSbc2z9iEi0tqJVUQ>
    <xmx:PLvtaqzf-x4RAv5ptfHt4ur_gL9rANggxsAPDiGYWoLg7LPBiStuqg>
    <xmx:PLvtasanTdQ7dWuFR-W-xbsUPoT2wEIG3nMlMuEdmoOrqk3Wdphtaw>
    <xmx:PLvtai0FhlKM89lshag_NXmPoZmtEN3qWSKt0YurQH1rvwYTSQJT9w>
    <xmx:PbvtathaZ3Pgh92knJUq3cAKzoQHiL88Kt5lPt-tw3zLsQ31e5mPdAqs>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Nov 2026 06:34:20 -0500 (EST)
Date: Fri, 6 Nov 2026 11:34:19 +0000
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Breno Leitao <leitao@debian.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	James Morse <james.morse@arm.com>, Usama Arif <usama.arif@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	Doug Anderson <dianders@chromium.org>, Jinjie Ruan <ruanjinjie@huawei.com>, 
	Ada Couprie Diaz <ada.coupriediaz@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, 
	Linus Walleij <linusw@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Thomas Huth <thuth@redhat.com>, Dawei Li <dawei.li@linux.dev>, 
	mrigendrachaubey <mrigendra.chaubey@gmail.com>, kernel-team@meta.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: sdei: Preserve the interrupted context's
 exception registers
Message-ID: <au27CSJbg2Wdqh42@thinkstation>
References: <20261105120835.3321912-1-kirill@shutemov.name>
 <20261105120835.3321912-3-kirill@shutemov.name>
 <auyjSmtuqkXCqMvl@gmail.com>
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
In-Reply-To: <auyjSmtuqkXCqMvl@gmail.com>

On Thu, Nov 05, 2026 at 07:41:12AM -0800, Breno Leitao wrote:
> On Thu, Nov 05, 2026 at 12:08:34PM +0000, Kiryl Shutsemau wrote:
> > From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> > 
> > An SDEI event is dispatched by firmware regardless of PSTATE.DAIF, so it
> > can interrupt the kernel where the exception registers are live:
> > 
> >  - exception entry, before kernel_entry has saved ELR_EL1/SPSR_EL1 and
> >    before the C handler has read ESR_EL1/FAR_EL1;
> >  - exception return, after kernel_exit has loaded ELR_EL1/SPSR_EL1 and
> >    before the ERET.
> > 
> > An IRQ or pseudo-NMI cannot arrive there with PSTATE.I set. Firmware
> > saves only x0-x17, PC and PSTATE around an SDEI event, so a synchronous
> > exception taken by the handler overwrites the interrupted context's
> > ELR, SPSR, ESR and FAR. do_sdei_event() only notices that ELR changed,
> > and warns.
> > 
> > The interrupted context then carries on with the handler's state. A
> > task interrupted on its way into the kernel can be sent SIGILL for the
> > handler's kernel data abort. A task interrupted on its way back to user
> > space ERETs to EL1, at the handler's fixup address, with user registers
> > loaded.
> > 
> > With SDEI delivering NMI backtraces, this happens in normal operation.
> > The handler runs show_regs(), which reads through possibly-NULL pointers
> > with the _nofault() accessors. print_worker_info() faults this way for a
> > kworker that is not running a work item, and a single sysrq-l warned
> > once per such kworker.
> > 
> > Save ELR, SPSR, ESR and FAR in __sdei_handler() before
> > irqentry_nmi_enter(), which can take an exception too, and restore them
> > after irqentry_nmi_exit().
> > 
> > Once they are restored, a nested exception is harmless if its handler is
> > safe in NMI context. That holds for EL1 data aborts on translation,
> > permission and access-flag faults, which never take the mmap lock in NMI
> > context, and for BRK. Warn once, with the syndrome, about any other
> > exception class.
> > 
> > Fixes: f5df26961853 ("arm64: kernel: Add arch-specific SDEI entry code and CPU masking")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> 
> Tested-by: Breno Leitao <leitao@debian.org>
> 
> Tested on NVIDIA Grace (firmware SDEI) with next-20261104, KASAN + lockdep,
> ARM_SDEI_NMI=y: sysrq-l under stress-ng, with a kprobe on show_regs() and
> eprobes on irq_disable/irq_enable that fault on purpose.
> 
> Without the series the box crashed (a task interrupted in el0t_64_sync
> got the handler's BRK, then lockdep/KASAN fallout and a hard lockup)
> 
> With it, KPTI off and kpti=1, ~4000 kprobe hits and ~5500 faults in
> irqentry_nmi_enter()/exit() produced no warnings or stalls.

Thanks for testing!

Just to clarify, does your Tested-by apply for whole series, right?

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
