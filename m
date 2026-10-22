Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792644309;
	b=a852PpTa9krZzWeoyfU0FPYpa3Q/PqxmVInaG8OL6EWOSguUGpZHGpyK9CU16dQvBNnK
	 a6tI07RrMQnLlDDsS3gXK1P+Gew+mKVNIGn+W/QEmnyY/QdhgOzhNIminENtxiJXDysZC
	 sSyKHBYQhTwk52rhXAjBwJcORP9uXzIEkwc3XHscNZg07WjaADFlkVDlPi8E/N4INh0cg
	 L7RjFStou1Z7DNLaSx6i1PqvDrHPhed+c/8RAtw0okv7qvNeaVHoEteEAc013aGWmOCnT
	 DopsH2/Rw+gPHGil83ChEAF1B6fH/MCyX8d0efl44XYa6YtiT0h2GsGdyLt1ZAu5tYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792644309;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=jw10wdm/SUX82NQ+7l3IDdOzCuGsThMNSoFw7hS6weo=;
	b=pQdHV55YmY3baphytDAUvdkvn7v3YgBvm4sVTZ1bLUoq2Z8yafUtOFRsB2UCoJyPO35n
	 9TB1RuvzoAglcKpWNMKI2pHspKtfwhUAUu+4FmKf7Zswpag0kEvtRPtBDQg2g8cWEUQjR
	 iJe6kfP+L7jkFxRuvqXuEVPdj6gIgAG9MeLhXJoaYVRlvTtzYrXxtMTBtCMJYsj0HBhe9
	 rAMM6bWQx3G1ti1xOIGzskepMj8QCHNoDa+XSR1szDPbWBhH42zWDhWmzk5D0wZNm9DgN
	 gNYyTQ1piBxcbbq2VS0PGUOAFofCNuIDQsEdXBThg17EIzO7xbMfdYIeItH0Gwr3b7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kroah.com;
	spf=pass smtp.mailfrom=kroah.com;
	dkim=pass header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256 header.s=fm2 header.b="V5cER/6G";
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=MRZOlVei;
	arc=none smtp.remote-ip=202.12.124.138
Received: from flow-b3-smtp.messagingengine.com (flow-b3-smtp.messagingengine.com [202.12.124.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C8E606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:45:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52C8E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256 header.s=fm2 header.b=V5cER/6G;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=MRZOlVei
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.stl.internal (Postfix) with ESMTP id 97ABA1300145
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:45:08 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Thu, 22 Oct 2026 00:45:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1792644306; x=1792651506; bh=jw10wdm/SU
	X82NQ+7l3IDdOzCuGsThMNSoFw7hS6weo=; b=V5cER/6GfP9KUMA2sww3bCoOJ6
	oNN75jbHFE+SIx4THjimKv+DeXQMTBJTInIcF4+ti8j2cLFO5wjFYG4bCgStebew
	vRSqMEdiZZnr1ooyUDalfrqzvstmaOW7i/hkHIdU35amygrsQl5ko4xo2lcf9lxp
	7qCEvaAiJSKQF3SrnRMHvYTSNd7MT51HNgw6iuSiOoATEwkeC55Ckc7OTThg7f2c
	NNyq7FHkoMTsrwZPwVEfn18QucOFBe5h1mbQv7ymt89pzcKfDaUDGYkLAuWx9BNr
	kgzVyUnLjx9a6PlVymkQpnx69D33crUA3JSDmL8KxBDht8woUk2RCKhXhrrQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1792644306; x=1792651506; bh=jw10wdm/SUX82NQ+7l3IDdOzCuGsThMNSoF
	w7hS6weo=; b=MRZOlVeiXotI15eK3TaUZ0xSnEwEoR7XaUi0s9s8U1aKiPCMKpM
	xbYjNyntMWIQOnbJYqQemRw4uh4eAnowKurc8j8/EfjWz2FaEvjc2SJxE20mIILW
	nuNuiV/EGaXKbjS0HHpJrRLNHikPynmBGIK/BksPO6mIJPh1osksbff8vEsOr+KV
	bk/e499+VGsVqU/Dzbfa+8RE1MYW7o4H3w/rcJpbBNdv403l6deMnT1RUOYwO3Sw
	QLfsJr/fU3f7/+3N4Jk4JFwAVjipXktrq5vIIuj0uA1dlOqFfUfu6qZI83TKhL2u
	GOiiyfIwFSskJcM8FfbFBRXiHsDQNmBR/QA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=kroah.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792644306; d=kroah.com;
	mf=PGdyZWdAa3JvYWguY29tPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:TaahOsmwzprwWipKWS0+A4v6694CGS9kcEJv9hAcaGY8byb
	wdn7SfjADk5odc0z69O+cqNfF8l706iMSOlX0lZyaJLqy13EBaCTWJnQdjc0c4BV
	XHBkuSBtiV/5e8VpECSY/BzpTKyalTXY9ZypqXyDT+Zxs2r9oSDNkLRbiqOFoUnX
	b8X+ZJldm3MBcUlpD63f6mk0wQIe9f5yfOXvkgFDyztRm4L92l29oPSTJfvCHki3
	a9H2aMqZIduUKdc71WQYJpI7X+z5UGd6l68cgMNkj3E8xBL30G2Nr60aX0YJBObd
	92tPG5yzwjYOpfs+BIBsDWBWsIm0T740UCzItww==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:amwkfUm3uM3yNunfXHZ8vAlWN3B+rGx2XwwqAmexKuU=:+xgCL0MxHdcc3kUWDLvp0hiFd/rPogqaJx9kciWORtA=;
X-ME-Sender: <xms:0pTZanET_w_gGch5Ii1eVEeVSimNi-aQSesMOtkN1AwPNgsZ1oI2Nw>
    <xme:0pTZal_UB_vwdY6SQYZ8PjWD15jaCZgpGMTvV7kZYQdf2RFR_O-PZOFeyKNbWpXkR
    NMqtX4XMp5Xljb2npOpD4WPvqnWaFaKbB7PF6cGRshXylwA>
X-ME-Received: <xmr:0pTZatOreHuXv5KaIlwAlociA4usv-iojhEI7tY9Rd0CQwg-y9UOg3hNv2ypdI87utcmL2LtJJ4QRgYmqno>
X-ME-Proxy-Cause: dmFkZTGaTy9dL+58t36/JuKlsN9NMT57Jr3c7Iq9/EQyc60T2Nl9dXi+0W/N5JoCIB4mbF
    iI9rOPy76nvQ1nEDZVBqsqfFmyny7lBhWiMGztay/GrJp3ml8tYCRcklaAL8gWlhECKHS4
    kZJfzB8CFsbgLJguIJ4UhFxoEmXM4nafAFYS+51xI4jzmO6eqnHIrUW8rHZzPJuC1BDc4R
    j1QUoYUncaqbpPjM2HAJOUJNQQjpE7ztN2C+ThfIjzszlS7M8/FIxrDbQB3faYU0aTnHyb
    R7zXqoseyUDgnMd1UWgXtVTi+UssHY9yYWRP550tzB77eVTDnEghl+kLA+eczgRHdpwUP4
    RhLsldQSeTZwPngqcJfQdl/oTb+BpxzNSAKMfkQNEJoSndkfw+QQ+zUp5h512h20alvcaP
    l/BxIVOXwaTU0YTYgZMGj5r5YIXDDxX4TvJQOsfd8lhucQULOmPeZXzVQIgzy279EIrnTs
    aZFQ1iaCiGxxaPtvKe/nXKlg+aGhU2JQd9uolLS9cScGJhve91gWJASOy7T0G16f77Bh7M
    IN3+GIIwO/6W8j1vRDJMXOD3Dywhf8+CiqKpD3Y+04UcMmEuKJUQoE3vBPboEQofzujZ3i
    bM8yVGt+1/Sj/C6EnWiQfMtY4T/nPmgR0+4fx0SeOlJZNnN+6AVPLZ3ubHIg
X-ME-Proxy: <xmx:0pTZarhhViNN7xWPs0rmOK0qqw94mJ1eVPS32eOoC38gImqCcc6WDQ>
    <xmx:0pTZasSHLRv9FpBNH4hsinO-9OAgM2dLMPL1D8MwWFvVsR6V8nhWtQ>
    <xmx:0pTZaurZXZ0mdEjg6SQVT5Pc9Mzi3RPjwZq43WKgh1DpxyQVHIo9DQ>
    <xmx:0pTZanYVonrCXDF-6I9xVoRtopOBKvhAAKPzsZvUQpHAMc_cvSiq0g>
    <xmx:0pTZahB4NbgtTgdD78--z53ln5ksCDrPMXG-T3Y4zH9b95ZrfYeH4U6n>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Oct 2026 00:45:05 -0400 (EDT)
Date: Thu, 22 Oct 2026 06:44:23 +0200
From: Greg KH <greg@kroah.com>
To: "zdi-disclosures@trendmicro.com" <zdi-disclosures@trendmicro.com>
Cc: "security@kernel.org" <security@kernel.org>,
	Zack Rusin <zack.rusin@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	"open list:DRM DRIVER FOR VMWARE VIRTUAL GPU" <dri-devel@lists.freedesktop.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: ZDI-CAN-34068: New Vulnerability Report
Message-ID: <2026102254-protector-seventy-6454@gregkh>
References: <BYAPR01MB38301CFC012E873340F77E3D80662@BYAPR01MB3830.prod.exchangelabs.com>
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
In-Reply-To: <BYAPR01MB38301CFC012E873340F77E3D80662@BYAPR01MB3830.prod.exchangelabs.com>

On Wed, Oct 21, 2026 at 09:25:57PM +0000, zdi-disclosures@trendmicro.com wrote:
> ZDI-CAN-34068: Linux Kernel vmwgfx Dirty Tracking Out-Of-Bounds Write Local Privilege Escalation Vulnerability
> 

For some reason you sent this to public lists, and did not include a
patch, so there's not much we can do with this.

thanks,

greg k-h
