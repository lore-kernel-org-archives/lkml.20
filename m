Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793291256;
	b=hZwAW+k5SzcBzC8tq9l/vLpoFGmUcotsSfvAi0AiUAfcMYx4mLggpwJ9u7/bmgmpcwgJ
	 cW7TlT7mHwQJUWGtl9QjBEINV+2hD25sc9JxAF3ndpPOOPdecbVYl0Khi+Pay1xX/DiZH
	 IM24XU2w8CQoSg2nEL7f7doUUI7SX2di7O7Pj1P5cU2OaujOQAV0o5Okl4q8Qxi+9wUgm
	 wrYTOyOEtL/j+K6EoxiiWd1EXON0ZCn31oVfrRtQcYWrcm4VWwxhjqJ4l0PNlvovQMDl4
	 16rsDvNL5sALptfNWEOBHEQrXEZPCbOkIZjcs2ttgtHEh+oTM2e0CAJy7Vvc9se/FTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793291256;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=QaCdRNnHz+8N7HXTLuFRnsZC+AC3EUSu4/cODcTHB7E=;
	b=V83XanyZk0t4VIrczmnSGAp0aPLMeJJb97uQAyyXNVhKrRe8SY0fKgQfyMglfZmD1ZLk
	 QghOw2nzakFqd4WzkM+v2aRnLs9qnHkxfyU9uRer0ukoHTsR7ue2hrW8nsRluiWUu+mgb
	 RX7Ys1xt8KvtrHKzoWDhCoXnjqRib2wi/gyjQiySDN3fdCxMHwC5V5NPhiBRoizxVsJni
	 T+N0G5MhILZLMbpeAobuIpSlx9y/DEF4hGHzQ1WQAx2WLBahqVmDTdxoRSpTswadZ9Zae
	 Qdxu6PxBQfCS42gYWLT7MYyaTC6HdTRkMfZbJ0Kj3Jw49y0/HMJisn948BlynZBr9Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=CbDqvhok;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0222A606A31A;
	Thu, 29 Oct 2026 16:27:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0222A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=CbDqvhok
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 0C66F40E04D6;
	Thu, 29 Oct 2026 16:27:33 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id AGVulI0bbCsi; Thu, 29 Oct 2026 16:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1793291250; bh=QaCdRNnHz+8N7HXTLuFRnsZC+AC3EUSu4/cODcTHB7E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CbDqvhokTaYDiuAP1AHxdAEX8izv4p9epcFDGVjcidJq4OXeLUq7+ghhHZDnnrCat
	 B3ccvoCH6IGmN5AD7pyzEr/fHh0skHpatrQX4rIW+y9V8jjpx0qTAbIJecvtY3ubOZ
	 V5bwxcjqZnkk/0Inf/3VBgSFGwFsxkm3xIiwIcc01j01OULGMh0rJsIv9FOcIulNGm
	 zKtQ09/rLiGHG3EVPZ77THvKFRKtkNMmMBlz0miOyjoIoIxDd80axd+5VsBO9TdPFF
	 DZDNTSScCurezV6bycLlmHp1QGDeUmGGfHqKIwLNF4cnpenS3oygGFarjU5Uj0eijD
	 YQnmtbMiQOufYKHFyJABCjtPRLv+NCwPmLluQk9fDRInS1w7cykJ7+BLMgOaYcl257
	 szHUPmdN9XMo9r39kHtaEhVoYqhdu4cHCMQFZJy7OhuEjkhgisI5Olm+iR+tVyxIAT
	 RtBjLpMeUR/lbTwxXG4tAUAf00U2pUUE0bvxjBluvfS2sb5St+AaVpTkz6NAemYFYU
	 Uyu8ALCRzI9Um8fCZI9E7lno+plkvFc6KufeQq631Lu6VX/cdps3yi+bC5Mo8uKbg0
	 hftWYLmec0kGqnRihrX3pDQnG+Q5g9mxoaXg6QTrdLEfK241b8CrosM580686jNfNF
	 DAb6sxecpVRsIAZu1ZQiWoh4=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 4D16540E04D1;
	Thu, 29 Oct 2026 16:27:15 +0000 (UTC)
Date: Thu, 29 Oct 2026 09:27:11 -0700
From: Borislav Petkov <bp@alien8.de>
To: Michal Simek <michal.simek@amd.com>
Cc: "Veggalam, Rama Devi" <rama.devi.veggalam@amd.com>,
	"Ghannam, Yazen" <Yazen.Ghannam@amd.com>,
	Rob Herring <robh@kernel.org>,
	"tony.luck@intel.com" <tony.luck@intel.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"james.morse@arm.com" <james.morse@arm.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>,
	"rric@kernel.org" <rric@kernel.org>,
	"git (AMD-Xilinx)" <git@amd.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: edac: xlnx,versal-ddrmc: Add
 xlnx,versal-xilsem compatible
Message-ID: <20261029162711.GCauNz378qqsVFtI6y@fat_crate.local>
References: <1792587442-2794880-1-git-send-email-rama.devi.veggalam@amd.com>
 <1792587442-2794880-2-git-send-email-rama.devi.veggalam@amd.com>
 <20261022143730.GA1287910-robh@kernel.org>
 <20261026203920.GA696395@yaz-khff2.amd.com>
 <PH0PR12MB8125B27A7814A3818739C4B9CE6F2@PH0PR12MB8125.namprd12.prod.outlook.com>
 <b683fcbd-ae5b-416c-96e1-7b0d7146c468@amd.com>
 <20261029152549.GBauNlfeOlTwktwjYs@fat_crate.local>
 <9dd48bd6-70ce-49f1-b3cc-7cf8f49e995b@amd.com>
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
In-Reply-To: <9dd48bd6-70ce-49f1-b3cc-7cf8f49e995b@amd.com>

On Thu, Oct 29, 2026 at 05:12:44PM +0100, Michal Simek wrote:
> With Versal Gen 2 which is still under development I can imagine that we can
> design it in a way that we say that we won't allow any MMIO interface and
> only firmware interface will be used and firmware itself will integrate all
> edacs in the system and export it via the same API. Then we will have only
> one single driver for the whole platform and it depends only on firmware
> which functionality is going to be exported to Linux. Which is IMHO model
> which you would like to see.

I appreciate the intention to make it saner but ARM is insane by definition in
that regard. You have IP blocks which can be built in in all kinds of
platforms and sw needs to mimick that. For some EDAC drivers we even have .c
compilation units which get linked into each platform which supports them.

We would usually do that when you have too many EDAC wrapper drivers loading
on the system and them needing to talk to each other. Which the subsystem
hasn't really planned on supporting.

But if the wrappers can be relatively independent, we can do the simple
thing and do a separate wrapper for each. No biggie.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
