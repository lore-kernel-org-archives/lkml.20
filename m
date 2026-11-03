Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793732190;
	b=Kyk2hsN+oY3Cz+pCbwFIg8UcLV7pwFaG/Tk9SBh2KBYM1GyEDV//cyb+yb+4h27+9WwT
	 JIaZUD74H50h7s+LBIQEqWyt1VBZ7r0XPkJG/xS4Q/t6FyUHYMalbu2BkLO6uZwc2hhUr
	 VJrW4Wk3DKgifBXvYLgPdmDiIaKLK7adJZzNIBKqkyN141JOIeI6tPioCWAJY24qr2buG
	 wZOnQByq09tQ8da8MLPNqfuSA2OM6dA4XX4yvqzpIjAtGoiD3RHGoadK+XtZXWnrPdE64
	 f/3mKPZjAUGxzzkaIrY6pAUUl/Mcupwj5LdfT7QZYXaak4Mxh0KqXZnlgdrX50KW63A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793732190;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=5629z1hliFgRB1i8Gc9oK4Mr2yUaR1BiwYHKsmR/8Bs=;
	b=vHRbnmgg1wiogPXRK31msNKQTOVnQJLcbR6yLd/+Mj8B8NMSWN9BPc21mrJhzuedkVFU
	 MdvNdTeM0YNPmEbaOhYyPK821e55LP/q2aHwSKwCHFWtyEWCLGlJ5rnDGfe4cyosBlm0R
	 h2CiqygNBaygbQ4dn6s62qqf71BMT2BbFjkQFNxT8EpFVbW+3eqsI6PpMRQgFca53t/Gj
	 OpeglA2KDlzEWE5BcpnbNsCp50xfvAbRedFe51X4SrTVsaX22T44oJHmVkgMsFmnhJuXK
	 XFxu0WeSBsAu2mVxu/wfz3HSyQuzh6iPvrcx+iJnpYoHHpm2vkZbujDjaZt+9UbijRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=miTVynxt;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B659D606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 18:56:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B659D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=miTVynxt
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1DD001A143C;
	Tue,  3 Nov 2026 18:56:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DE3386046C;
	Tue,  3 Nov 2026 18:56:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 95D44103291F9;
	Tue,  3 Nov 2026 19:56:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793732186; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=5629z1hliFgRB1i8Gc9oK4Mr2yUaR1BiwYHKsmR/8Bs=;
	b=miTVynxtoXW9Wx5uPS4QgDE1vcHvI5QwANZ+tG+FRuGk4H8WHeC7aTpwlSmpDUuz8SsLJ0
	LUEq9DxhZzFInjwaVRy2udvRdr0Y8swZGhaxanz6tCGB/2pIzER0lx1fcNVPdGtlDeu7iS
	k/p2Dw+A9xnuTa9vegqSHSQ0Sx+F1YlKP5uIbxjEL+MTJXo+7GddtcNQ1yCyvFVYCQyv1h
	sN+u6TKnIe8boAweKC1PZNC1f8dxVpZ8pJLw/tE63Spjhv6uPgYHU3wIyDPGeh+uo1SsR7
	YigMHQkG7EFROpBjfJruu/ffYaGjWfNdt2nXhwRu2L7pMvtUlQiY9JPf0/6XXg==
Message-ID: <862976ab-e80e-4d6b-9657-ad9bba2d020b@bootlin.com>
Date: Tue, 3 Nov 2026 19:56:20 +0100
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
Subject: Re: [PATCH net v2 0/5] net: mvneta: fix the TX queue arbitration and
 the mqprio offload
To: Josef Schlehofer <pepe.schlehofer@gmail.com>, netdev@vger.kernel.org
Cc: marcin.s.wojtas@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, w@1wt.eu,
 linux-kernel@vger.kernel.org
References: <20261103125021.70845-1-pepe.schlehofer@gmail.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20261103125021.70845-1-pepe.schlehofer@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Josef,

On 11/3/26 13:50, Josef Schlehofer wrote:
> The NETA TX arbiter is left at its reset default, which serves the TX
> queues in fixed priority. Under load a busy queue starves the others.
> OpenWrt has worked around this since 2017 by sending all TX traffic
> of its 32-bit boards through queue 0 [1].
> 
> Patch 3 serves the queues in weighted round robin. While working on it,
> four older bugs in the mqprio offload showed up. Turning the shaper off
> leaves the per-queue rate limits in place (patch 1). Deleting the qdisc
> never reaches the driver (patch 2). A failed setup is not undone
> (patch 4). Opening the interface or changing its MTU sets every rate
> limit to 10.23 Mbit/s (patch 5).
> 
> The series was tested on a Turris Omnia (Armada 385). The other NETA
> variants were not tested, but the driver already programs registers of
> the same block (MVNETA_TX_MTU and the token sizes) on all of them.
> Suspend and resume were not tested.
> 
> With patch 2, replacing an offloaded mqprio qdisc with another mqprio
> under a new handle loses the new configuration. The new qdisc is set up
> before the old one is torn down, and the driver now acts on that
> teardown. Software mqprio loses the configuration in the same way.

Wouldn't this break mqprio offload ? It's no longer priorising then ?

That behaviour of the high-prio queue potentially starving the other
is likely what mqprio users actually need, so maybe we need to setup
prio-based queue selection when adding an mqprio qdisc, and switch back
to WRR when its removed ?

Maxime

