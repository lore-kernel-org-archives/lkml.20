Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793706570;
	b=gTBCwlioGQWN0/WUzXEeVHrUDFqR5iZ2JG1g50gngj+WAIAyMi6CDU+CNEzuPhuOtpjX
	 LiX1znAdnFSVLi9cOlz5j743u5ymSx738lJ6O6+7duQOkTSDDRZrGgRFAIy0KKlxqeFdB
	 9b0vwKF7H1Uft8QdT/kJea1Jm70a2l2Lv21OUS7WYIxBAdcRwPHfQhChyajyfiOXPMHQg
	 gkYYctjZJOYuFmlpvQXzfSUnFcxVT3amsSk/W2uy3mBgUsT6b5PpDP0j/PnlAjKkhD3vJ
	 YpC98gvYBseXxOQb29PQWOMYqnHeg5Tq9aAv9vV5LcSnVyRRRELRlAGuMopNZZGc4TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793706570;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Subject:From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version:
	 X-Last-TLS-Session-Version;
	bh=DNjdSl7ksOV1yWe4pcrgOgqAzi47y7DqGBV06ofjyH8=;
	b=U01p+8vxD5Yj+/ocG2Nmf4hCHxVgQomhXrtFDk/ExwaUUQ/NHvM4MrvO/+31kkT7vEeI
	 VgHioE5yr0XMYUKBPjzKNQuKNpwKyj437Y12WZpRLahoXcAcAuf5uWudaZ54RtnVUTxfy
	 4Eh35ArAN1EXNX5scR7+UGWM31NX47RTtY3DlV+1hNgc8i864PyUvCm/pu8jLKmfqSFZB
	 qx6tlzhqtACdtNnEeyjczWTXJH1yFKOwhj9VKUZxEa7QJndCJxiumsKrqUc0Kzcq9M0If
	 02053pUd+Wehd7lbhutpbC93/0AVvBAHgcalGFVKy7Nrigl2M1PPgEl6MJWYV9iU1eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ZTUj3rdm;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828C4606A327
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:49:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 828C4606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ZTUj3rdm
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 27405C8F458
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:50:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8C6146046C;
	Tue,  3 Nov 2026 11:49:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8995110328C5E;
	Tue,  3 Nov 2026 12:49:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793706566; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DNjdSl7ksOV1yWe4pcrgOgqAzi47y7DqGBV06ofjyH8=;
	b=ZTUj3rdmGKpzrXaiM7tUT4VERo1mKsfCR7+hb0Z/3sDO1MVbQGugTbtDEFwF1IhVsCCF/r
	7zeraggGY8LwdT1WSDkYwF/FU/tJEdRG4QW9x7m6lRh6+SXbox49dRDj0p0cGQwCoSC/Rz
	zlADQG/3lgW6aI1r8G3iMLY+WFkWS9zBGf8iYZKMMlIGYzB2nvWSvdJ9g94UJ+XkIiqnGT
	xg3oG1QQnYR+0nsNJ/OmjWKEabMiM7tpR9U6EhmQ78NyangtjR+krGwgrxK/ekvXcVlFDI
	5dorHib4p/6zvUOD60XtfrlgQ91RoWHGKwz2d339Et8Ihl7X03st2n3e2pCy4A==
Message-ID: <902f7e15f881583e9069ae1376952964f7bdf96e.camel@bootlin.com>
Subject: Re: [PATCH] arm64: Kconfig: add CONFIG_CMDLINE_EXTEND
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland
	 <mark.rutland@arm.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue, 03 Nov 2026 12:49:21 +0100
In-Reply-To: <aunCuysle9uzTRI1@willie-the-truck>
References: <20261103084140.7689-1-paul.cercueil@bootlin.com>
	 <aunCuysle9uzTRI1@willie-the-truck>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3

Hi Will,

Le mardi 03 novembre 2026 =C3=A0 11:17 +0000, Will Deacon a =C3=A9crit=C2=
=A0:
> On Tue, Nov 03, 2026 at 09:41:40AM +0100, Paul Cercueil wrote:
> > Other archs have it, and it is supported in arch-independent code, so I
> > see no reason why it is not provided on Aarch64. Add it there.
> >=20
> > Signed-off-by: Paul Cercueil <paul.cercueil@bootlin.com>
> > ---
> > =C2=A0arch/arm64/Kconfig | 6 ++++++
> > =C2=A01 file changed, 6 insertions(+)
> >=20
> > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > index 1075bc661833..f8542e532b50 100644
> > --- a/arch/arm64/Kconfig
> > +++ b/arch/arm64/Kconfig
> > @@ -2551,6 +2551,12 @@ config CMDLINE_FROM_BOOTLOADER
> > =C2=A0	=C2=A0 the boot loader doesn't provide any, the default kernel c=
ommand
> > =C2=A0	=C2=A0 string provided in CMDLINE will be used.
> > =C2=A0
> > +config CMDLINE_EXTEND
> > +	bool "Extend bootloader kernel arguments"
> > +	help
> > +	=C2=A0 The command-line arguments provided by the boot loader will be
> > +	=C2=A0 appended to the default kernel command string.
>=20
> We previously reverted this in cae118b6acc3 ("arm64: Drop support for
> CMDLINE_EXTEND") and I think that reasoning still applies. The thing
> that _has_ changed since then, is that I think bootconfig now has some
> support for early params, so that's really what people should be using
> here.

I didn't know about bootconfig, that looks like exactly what I need, thanks=
!

Cheers,
-Paul
