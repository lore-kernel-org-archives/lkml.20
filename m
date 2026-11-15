Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794743829;
	b=NzxnL1uLxOazPPQPpVId/MNdw62cm+g7MUcxOjtEGzl3oiN7fxeGrMb3mcgK6BYmGLr4
	 0uXXe+F+iNO4XU7qJBhP4XfmVIOaCxCERFiTfPXQgkll2cK39dcZ99Pr6sijGCuP5QHyM
	 331b7M4jChWRHCmD0/GM0Pw/q6nrghZuCL2zS4dFZsBeeX04OTLXBtMupJpAiJUoIwleL
	 iod9tVrhyrtgYeownVKZ95Cvls+7kpCJErfn5VzyO4ENSIkIewbC89GA0ntSf9+2KWve2
	 0qoVaqFGmfwpDQXNdCGwfWuT67JOTnuKSIb7whHgfClrkJjdj4DpVhMIyqcg7gjyKxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794743829;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=zhhDm2qyru0LaqxksPFvsWC42WCRzYXUzwovCybxf/w=;
	b=dMXZZEWls4brzq5rh/pAkNXdKHghCr54OhDaJneEY9EGQeIsETHrWYnmPsnP4PwCLUQe
	 gcNHuQR66cH1qCNkqhPyNDYg/aiVmOKkYm+UaTJjg12GfyTTRgLOemY3411gc01bSQTrI
	 smBlQMILfvpi5DLcInzgFBsDX0JMTtmH+idpubdKprEyHGFl+oxhtenFX6xvSRZfG6vNR
	 QagfM4vDxN+OlgqLcX4XoMqOCi6QAP4ia5+Goxtiv9UB/kCgWOE7pkFDDKGptqLXooy3q
	 xfsPKcpOd9hqdXDP45MAb6/gxGusxpaYlppHRAMgWacfQb8jeKiXfPDWX7GEoLD08uA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=ijmaewX4;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54CC606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 11:57:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B54CC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=ijmaewX4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=zhhD
	m2qyru0LaqxksPFvsWC42WCRzYXUzwovCybxf/w=; b=ijmaewX4miP4ddwVG2zc
	FelrOxzBahZlunioU4qSakWVzoN8fPAagUD6YVAJ0ZOjcjb7/yv/V26nBnSPy/f5
	aYgQ9ONhYbdH9dKEWGVUN98pvjTap8Au+ouO1fOtBzgwrSHIxhWTWSaNXS89mdiE
	dxYYYJbHzWSkvfkdJRhHCxZRw62t5bI1k+1FtFb2PulTwIKeIm4jKvjOche8IkOs
	Q/hxqRt8wzUEEJjBR1XDrm74hJm9zznBOQBZN1TANbnnI8/KDlbMZ1ExM1ot4ARV
	l24JpZjPcT/mBTM0D/GEFmoUZCtwLC/jJiCpj4kDknMk4FuL+HKzwiqsi22ad4Fp
	vw==
Received: (qmail 906437 invoked from network); 15 Nov 2026 12:56:58 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Nov 2026 12:56:58 +0100
X-UD-Smtp-Session: l3s3148p1@cPS5W09g7qgujnuZ
Date: Sun, 15 Nov 2026 12:56:56 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Diogo Ivo <diogo.ivo.sx@renesas.com>
Cc: Frank Li <Frank.li@oss.nxp.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: i3c: renesas,i3c: Document analog noise
 filter control
Message-ID: <avmeCELZRvJVNtyl@shikoro>
References: <20261020-divo-ssgrlpcsrc-2966-i3c-anf-v1-0-b7ad60cde650@renesas.com>
 <20261020-divo-ssgrlpcsrc-2966-i3c-anf-v1-1-b7ad60cde650@renesas.com>
 <ate-aNmqsyXCAIX8@lizhi-Precision-Tower-5810>
 <64f604a7-7e70-4a0d-8164-28c5d7b1e509@renesas.com>
 <at-5E3b_wKcnuJ9Z@lizhi-Precision-Tower-5810>
 <f4b8a714-dab8-45d4-b98f-717d010806de@renesas.com>
 <auC06gqa5lGtKPjj@SMW015318>
 <7dea4022-20d8-493b-b560-ee635deb7cbc@renesas.com>
 <auIK38HPyv7PmDJF@SMW015318>
 <db1ad309-c02e-4616-8486-ffa967207d44@renesas.com>
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
In-Reply-To: <db1ad309-c02e-4616-8486-ffa967207d44@renesas.com>


> In the end we got confirmation from the HW team that the SYS_I3C_CFG
> register does not actually "exist" and was unintentionally left in the HW
> manual, meaning that we cannot control if the filter is ON/OFF so this whole
> discussion and patch series becomes moot.

Interesting outcome! But easier for us :)

