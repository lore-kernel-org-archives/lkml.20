Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794911723;
	b=c83Qq/QDiJKL4Ff5sih08wuCFQsn5ZjksqUTE9X4dpjOMNl0hn0F35yvdmm0WjD/2ULA
	 UKOqQ5rJj1doGEpYFpWqhGNvjC7Z/vmFG1je3rtcUTouCrd1A9dxWrTEWjAB+rZ0pU5Xc
	 1g3wEh5aLvpLz0KYl6a2ZI5g97AJuepkeCcy4iW5UZvCPZH807FSqS82rIiOPhl2xqE4l
	 oBJl4PyoISJtkwU1PZiEQ4xsBrt0DZTX4wTC0DQDVAIMWGmuy7ecSE8UZvwC0Be5naFHm
	 Ph+ylTTVOCr5jQRQWDTOwi9z7G2h7zIrSaBf8c8Im/cR/VudUsVYdQge4eHR+eqpsVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794911723;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=ozaSRCF3ns3TdfwuqLcS/RvJouUC669txRlTVKR2W6g=;
	b=J9+gcG4K5CsBPK86vMSh1wiAqPlWq8eVDy+uqRtTtAJ5UeKFfxDoxLBXV2itv46K3nYR
	 vZ1FTe7oSIs2+1DbYFxPWi1DK7Ub4+BYurD45j0YOFBeAOLDc/zOaBtD5+u0A0C3dOg1T
	 cMRcfruvWgFCIE63ocGtc0OcCVqxJ9k92y872uvzx9PI+eAPKSffJUFNgJuuvb6hP4lK8
	 Wt4B6/h64++g645E4b87MyC0XH0ABRRGhQb+9KtnXpft4yQ+NbK1FbSj7c83JYgyHjq0u
	 OphuL3x/tABStjLjfKTvO9Cfw2yATzNONRBREOXbOqrZSTgKXRIFxsRUaSNi3ohHSFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=QxWe2OfE;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0EC0606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:35:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0EC0606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=QxWe2OfE
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4F3571A15C0;
	Tue, 17 Nov 2026 10:35:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 22AF95FC81;
	Tue, 17 Nov 2026 10:35:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5EFD811BC0617;
	Tue, 17 Nov 2026 11:35:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794911719; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ozaSRCF3ns3TdfwuqLcS/RvJouUC669txRlTVKR2W6g=;
	b=QxWe2OfEZduMRFK8iuJ33wTHUQ31LgA/8plpVXIdkJj9bJfw1hlcJqXj/gpxFHc4L6QGib
	qBT8M8dB+F8A3trB+m9QhZMc7lOUi8iQ4U48NwGMllM7kRHJJJOXX83M5MB8BLTVIXoPQN
	5ykuzy6jHRSrt61HMhQc/4IPwp+L6B1R5lDh94vanFbnT+J9hip+hSjzMRx1+SJ/1j6Wkz
	v1L3Zl96OQtHZGuOEioBMNev/Lok6dlt5D59cctVeNvMfkT3iYzEhlW8hBxJ4WeFfXJQia
	1pBAcP2svtfVac06AUvQ5AOqR33SBOB9+zWsgeoRpaEUCvF5vWh6zHBTiNZrkQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Simon Wunderlich <sw@simonwunderlich.de>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  devicetree@vger.kernel.org,  Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>,  linux-mips@vger.kernel.org,
  Hauke Mehrtens <hauke@hauke-m.de>,  Aleksander Jan Bajkowski
 <olek2@wp.pl>,  John Crispin <john@phrozen.org>,  Sebastien Decourriere
 <sebtx452@gmail.com>,  Yangtao Li <frank.li@vivo.com>,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: mtd: Add lantiq,nor
In-Reply-To: <20261114100608.3432120-3-sw@simonwunderlich.de> (Simon
	Wunderlich's message of "Sat, 14 Nov 2026 11:06:04 +0100")
References: <20261114100608.3432120-1-sw@simonwunderlich.de>
	<20261114100608.3432120-3-sw@simonwunderlich.de>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 17 Nov 2026 11:35:13 +0100
Message-ID: <87fqwzn3tq.fsf@bootlin.com>
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
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi Simon,

On 14/11/2026 at 11:06:04 +01, Simon Wunderlich <sw@simonwunderlich.de> wro=
te:

> The NOR flash on the External Bus Unit (EBU) of Lantiq SoCs is handled
> by the lantiq-flash driver and used by danube_easy50712.dts, but its
> binding was never documented.
>
> Add a schema for it, including a new optional lantiq,ebu-swap-check
> property. Some boot loaders, like the BOSS bootmonitor on the bintec
> elmeg RS123 and RS353, enable the EBU's own endianness swapping for the
> flash chip select (EBU_BUSCON0 bit 30), and the flash then appears at
> its unswapped addresses. Whether that bit can be trusted depends on the
> SoC: it only works on VR9 (xRX200) from revision 1.2 and on AR10
> (xRX300), and Falcon has no such register. A board property instead of
> a list of SoC revisions in the driver was requested in the review of an
> earlier attempt at this. The property does not state the bit's value,
> so a board keeps working with either boot loader setting.
>
> Link: https://lists.infradead.org/pipermail/linux-mtd/2017-January/071749=
.html
> Link: https://lists.infradead.org/pipermail/linux-mtd/2017-January/071818=
.html
> Signed-off-by: Simon Wunderlich <sw@simonwunderlich.de>

Let's be honest, I am not very familiar with that MTD area and all the
legacy content is has, but would it be a lot more work to add lantiq as
a physmap variant? I don't like much the fact that you describe the
flash without describing the EBU. Physmap versions typically are matched
using the more specific compatible (lantiq,ebu?) and the cfi-flash
fallback. All your tweaks are EBU/machine/integration details, not
related to the flash itself.

One consequence of not modeling the controller is your need for
EXPORT_SYMBOL_GPL(ltq_ebu_membase) in patch 3/5, which is quite a hack.

Thanks,
Miqu=C3=A8l
