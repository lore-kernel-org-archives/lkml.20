Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919635;
	b=J9DOXIvrmh1Dd1CT90nbjvJRy2cztq0+WytyqOd5y1cIy5Dtw0CyVKKkFxe8JYHSNkJm
	 aJ+QkGjvKp0MHQI4DVQ6TApG3g9g0Vp4C8Yx/wEj7vlD9/Y5dKRptZacXM2j8Yp2WUf+C
	 p0FQ8TjRmVdlcyWkAe4V7BLxX9OAWn4Cwxv/QN13cUwdV85bBK67j9X+SI70OAXLHkY4W
	 n3zYpF7YiohzIOB435jmc4fl9/q8St6h329d6mf73KRDcVpccs5Yo2nJ2G16vRbp+lfUR
	 LcQeg5OWULGRUsRRMTquQ8ajW7tPpWKzu57z8UXBKvsMgFoHUdXGhEPjTRghrQy4e7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919635;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=66IORwZwNmFzwgB6dY9tprRV5k1fWvE4IbZQCtoOk6Q=;
	b=aYfzaGsqXRP7InJODMyGNu/0l8s5GeB8XkqcOgI1yXe/Sg477MT9/vF30gnyRo0pHJHE
	 sqReoR+dYBo7lOGPg1G2ZyMezsfzDGmPqcTtnU3GjTlZL3xwUSgf62Vp18OHYJkHVFIQo
	 q3PujAJuodng7uo7l88PmY3h8JRgl94vuBvcFqugpWyeDT6S/4otx/CEENDkFiqBOH3UM
	 8INdpAXz7qfExKiiJcR4/OIwvW0C7QNa4L4AT5FqcK4jloRppUv1Cv/HdfxKUAhue1ZhT
	 xOzd8wKcDt/nFSPGu6FpuZRzoROS4d2oAw+ouq4Lczw3w//VX0ijIWH8DEVSeGmIbvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jannau.net;
	spf=pass smtp.mailfrom=jannau.net;
	dkim=pass header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm2 header.b=r25NWiJB;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=nzyVvWXa;
	arc=none smtp.remote-ip=103.168.172.154
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DAD606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:47:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87DAD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm2 header.b=r25NWiJB;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=nzyVvWXa
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 8E9921400186
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:47:13 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Tue, 17 Nov 2026 07:47:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1794919633; x=1795006033; bh=66IORwZwNm
	FzwgB6dY9tprRV5k1fWvE4IbZQCtoOk6Q=; b=r25NWiJBjbwPJR1B3jFtOcDSgf
	RBiySIzBCT+aP1KQ+aVNNrkbie6KRoPtufgw/aNmYQAsGLGg/7lWJaHwhLkZAe0o
	FUFChu7osyl4G+/YgNT3bpr3anIZvbA4BUTRyCQTDYL/SgaT1KEVhs5mWChLjSXM
	Wt9HFMg9EJ6SuaEd9Zbp1J40XCGYMVy3dLcqlq6ExETtcWAszD25FdPj1ZLmuRO1
	S+c+eC1AliOskNzx3AJPZ9zmgA5Q3NKaNN1x/IwER3jomeG9L06xeaeE55DS/gUg
	2iHdICbt0L3NmXNIjLgOgyB7A9H5XdN+fxi9zE+bYmOMXVbC3soVV5rnK1Qg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1794919633; x=1795006033; bh=66IORwZwNmFzwgB6dY9tprRV5k1fWvE4IbZ
	QCtoOk6Q=; b=nzyVvWXaJrDu2+wWJmTUVqm/FWF+3P/ionqlaoGZGZWrLSuKnRN
	fUisMv1bWfkasavOquTp3/zPedmPtofizYqhIIRd4jG0r/OMetX9zkFQW2X5BKga
	Gsn015QP5NCI6H77kM83QF7Bwo6gzO+2HH0GbzabSM4Qa/tgl6tlZrHrOW71JQfH
	Kop+z/N6mKRbmgLqHos9NCAsowPA+tXnIkSxW35SfEFJpTRqpuflSHfHH1+irfgp
	Ajc9gEDrRSOgO/qpN2cNuZXefyi6vEMoJO4mQLTmnnUtgmjrMeiX5w9KFfV+QEsN
	cSolW94isoHjYbE/G2gg9YKcH2J3Mb6GUNQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=jannau.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794919633; d=jannau.net;
	mf=PGpAamFubmF1Lm5ldD4=;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:KS4FjUo2J+tmuM/trHY44blzlw3j1Vst5Ha6yTe57LsTE9/
	2fcmJosbsPX7p6fHFq5HNEHHz9CWYuYBLvquE+ldasRvhfcfsrBrZ1DkFn5/PIHt
	5tTAmvRTOgoFAf5QvRjvVynA+TnEljTJVXyToNTrzXTOsNv8VKWQK0vH/TL2wf+U
	I+1PLhG9po4iibm21o+mS7XX0KDo0dpY6Z2W9rgDJp2KGSu0v8BgWk4Xk1nglrk1
	RlKY5CLLYwtTmk9/YZQ+IpPFU5LHah0dTpBI4NL+rjNrivip8C2wUryKLQvonZNf
	w8GAVuNnscEygsvvRjQaKNPbctE/JiZv3FWyp3A==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:PPdbO5EL5SO3Y8hSzr30lTANh9SKPm2mGNnUJBxyLho=:G1shM/10uD8l3tWwo+6XfHZxUMC1LoWENsN+zHNDHGE=;
X-ME-Sender: <xms:0Uz8anSeEd_aTaXMak8nleaEgnu0Z1CYthpH9WVhOb4Yr1XtFwgLIg>
    <xme:0Uz8ajvO_Ai4a6I6RSxhgZV3EuqOStxwJneSkYEHZAxbjpip7GRcZXwN5oNJscuwN
    ilqHKY-To4iX0TvTLd9AEQ8AKMiEWGGOVRXPOuoOSFZEHtyYfwFNEk>
X-ME-Received: <xmr:0Uz8ar1HWUvlRqzbkpefSkwLrI2QNyEiGSQA2kyLCNO_MG_MxR_u-SmttkCHNQuCdC-uI-l0zMmjdaJpiU98hi6ZEP0DTRlSU1U>
X-ME-Proxy-Cause: dmFkZTEpUHidJGiF11Grf/R3Md1mSuLc3yaWlwQRsLrJ9bHQBXk3LBD27Up/Yw4yeiSVLL
    TS7J4tnzL7lwQK7HqKc9lDFbVLuzUaU3zi3i/92+rC1danl4A6uqk83eVpT7fIG+Yy/rgI
    UJHoHl0G5uAobTqtaHM/JSuZ8lmD95s/wLMyr7/lVbOdxoQyInBQYp9OImlw1fwJLwaV1y
    EV2nFxl13xUzMuZzUnx5g82RGfwTkQ7q/hRWCCumpvFippdgv2g0JIHSbLFZrw/KG/Y3kz
    oRipGQ/oFDwyL/hRX/zUjRNtkTkgWG/1s34X7psAaA7l4sNMWrX0WUbD+o2pNLICXfwRJL
    Y7SLH7U6/EvWBg+AMDDmYMqP299af0MttxMbmEqwGIRPx+gi/QhXTFkoOhLv0osvdwqoLm
    BluKsJOMz9tY0AYiNcGV0cD03zLtxRLdFp/8RnOWoD5DMau5xDch5vdAMPdXt6htdi4Oiw
    nSAH6HXTY6Owcg5/0Ap35Wfqb4jQyyvnru/LYi1cDy7RcoVQYS/txLHv7rMzvvvoAyYhg2
    4MF/CSwH5OwczTCqAPEPbK2uQmXwgl1+8C7oBANFTIaEbseTIPqQ1U/xT7riJgeeRrUCVY
    e8orCE1I3ZyfH0H1E26EeHNt6E0FIoxMH1Qx1ZSi5Y2xu/bdT67gwBRcIJTQ
X-ME-Proxy: <xmx:0Uz8asVdgVJlrfGccncqtd3Qj2WRR2sRu00HzCHHnv17-q47b2gReQ>
    <xmx:0Uz8auLGM45ppyJdlxsHqSrLgxVATBGU9avNo9L2IZ2kMR3McgCwyw>
    <xmx:0Uz8am0owvOSRAUqRFcPa8PozLrjpRhROAAI1SFHfh9KOAOwJ5qRfA>
    <xmx:0Uz8as74LUzoa_bHt8oiCeHBIhp4EbW2UYRblrqL94fNt0zAX3L7Kg>
    <xmx:0Uz8akFYzK5T9UyB97YjMQaXpSagS7MwxiiwsBluctCtbBCEc0tUhfpo>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Nov 2026 07:47:12 -0500 (EST)
Date: Tue, 17 Nov 2026 13:47:10 +0100
From: Janne Grunau <j@jannau.net>
To: Jacob Procee <sn125164@gmail.com>
Cc: Sven Peter <sven@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: tipd: cd321x: replay the plug on resume
Message-ID: <20261117124710.GA515128@robin.jannau.net>
References: <20261112113005.16418-1-sn125164@gmail.com>
 <avw1kOqmrUii-msr@black.igk.intel.com>
 <3bc5a31a-ab2b-40cd-a030-d0498002776a@kernel.org>
 <20261117131713.2db5294d@nixos-macbook>
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
In-Reply-To: <20261117131713.2db5294d@nixos-macbook>

On Tue, Nov 17, 2026 at 01:17:13PM +0100, Jacob Procee wrote:
> On Tue, 17 Nov 2026 13:03:03 +0100
> Sven Peter <sven@kernel.org> wrote:
> 
> > I suspect we're just missing the proper suspend/resume work in the PHY
> > itself to put it into a low power state. Or maybe we need to keep an
> > additional power domain enabled so that the PHY doesn't lose all state
> > and keeps working in a lower power mode.
> 
> Agreed, please drop this (and v2).
> 
> That second option is what happens with wakeup enabled: the dwc3 node
> and the ATC PHY share the atc*_usb pmgr domain, and it's only switched
> off in s2idle because xhci and the root hubs default to power/wakeup =
> disabled. With wakeup enabled on xhci-hcd.*.auto and usb* (Asahi 7.3.3,
> j314s), the domain stays on and a device left plugged in stays
> connected through s2idle without re-enumerating (no "xHC error in
> resume ... Reinit"). Asahi's pmgr marks these domains
> GENPD_FLAG_ACTIVE_WAKEUP; mainline's doesn't yet.

yes, the downstream tree has commit to set GENPD_FLAG_ACTIVE_WAKEUP for
all power-domains which are active at probe (boot) time.

> Wake from a USB keyboard still doesn't work: nothing calls
> enable_irq_wake() for the dwc3/xhci IRQ, and irq-apple-aic has neither
> irq_set_wake nor IRQCHIP_SKIP_SET_WAKE.

The interrupt controller (AIC) doesn't have functionality to configure
IRQs as wake up source so it should set IRQCHIP_SKIP_SET_WAKE. Does wake
from USB keyboard work with that changed?
You might also need to add "wakeup-source" to the dwc3 nodes.

Janne
