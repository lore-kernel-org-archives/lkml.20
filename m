Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8563AEF20
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 03:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788491511; cv=pass; b=VObHs+fx4+3zKLVcufLFpUR5pMphoeB1HRAexmuT3H+JMKnAI0tE/4LA+znx8T3fBBWU/lVete3nLwMsqvOpw/N0pTPkXgXQQmYKDOG/NWJMzxkRdqIhhsMrQlgOrAxyiC68spE3HQoSVhtetYWmiQDe5A52IdzLM5z2EPeC3NA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788491511; c=relaxed/simple;
	bh=vfRlFYrZG7tQcJDkEgmaPaaxAK6OS6eQsP+WeAvUDW0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OIZf3h0FLP95eod5Ig13/l0I9HnP+83Bgg9mWgUJPF3le2OHIa0+B8fmk47K8Nd1kolGuR690ZoWXMd/G59Q3/YlG4n0AM8tD51gl+LuyiBQEyZIV5lSkjR6oY7mwUUbP/IO0bE5DIo8McAbfY0vRl3LXYCvfUQ7OxpJtkRlIJA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cB9L74Y/; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cB9L74Y/"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d8f265cbe6so4486395ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 20:11:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788491510; cv=none;
        d=google.com; s=arc-20260327;
        b=P/QBt9EX2KNaYp70fDSJPxMojziu3OIC49U4IPv8XmMQMFHl8zmWGUOtt/TMRXFECC
         Ukh8hV5TydwuIiuz+/mWVHahXcvDGjU8x1JnIUrP7atewLMpAmE1DkuBQiHZ86i2yfmY
         xbDnbrcmvhj9l6coJvcNNyHu9q5VaI1WbxG8PeFyVmALJTs84TasaKGXQGhpXyATrzku
         Xx6jllJuGhiGahIihJBrGSfC1svnpqjHv8MYGNmQS1VGV7gYNQrMCaF9GPzoevwSrxo/
         X2zW/oZE6+BJamTraW8YesQ/PvYctxR7SJwtWN7+EjjrObdTCOFneqgzwRPOvqZavfPP
         GTfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vfRlFYrZG7tQcJDkEgmaPaaxAK6OS6eQsP+WeAvUDW0=;
        fh=yPdBAv4leUMzCwUsDs5CUsvzllf62HvvWXryjAvI3Eo=;
        b=dDYl3+vBzOgOEfuqlmAsRRsJ+w48s20lYPO8klvYkt4k7aSfnTCuUD8dgWJkfh180w
         A70MbLxIvSi7AW4kTCtpRFPLPKOHEnSkGciYJBuB80GirDqTxBIJQhMZQvvCZmmJlIKY
         x+pc9cIfBFB/PNrzFufOHz+u0EHnX3CAx86+GJn6Jz/HeIeXXD1sxT+1etGhiuvsaU/2
         npi7U+2+nEmy8NhVX13/GzvWqQ4PDB/Ju117kwADAKEhgsTm/v3D+btjJ8a2cI+MM9pn
         PgFa2jeEo0TnOdvuFU7MesJS2zOxCvIxPDDYZ9ntAVQgbS7LkPHXZF8xLZQro82DTqlJ
         LOUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788491510; x=1789096310; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vfRlFYrZG7tQcJDkEgmaPaaxAK6OS6eQsP+WeAvUDW0=;
        b=cB9L74Y/322y7ZV+mCRyplO5gjZFLkjeXcoQe3JNT0KFh3EcB958KWB0LSyvDdu8O0
         HImua85i7oVVPDUdlsEDnerGun9UFBx3klouyyJi7c7rTXcH4Gr0eFsxR5s3kji7Dk6D
         Xf1nOzWKDpkYg3srMPFDmzOJLIhsHsTaHCvctqWb6hhLOWTGBr/eub6cqcGKF7rtZTrS
         GLuu+M2ZhFLwaegHRJA5MIanOGBpxTDkHCccs2w+4JpY5yUY/zDbxnVia7+2LUQkUumo
         FwfwsY7y6CyIDEmJp8aYIWrJdcGkQycBrhn45YJm/U5SW9D7ECgq6pRhZn9GtUHIH3J0
         6Kig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788491510; x=1789096310;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vfRlFYrZG7tQcJDkEgmaPaaxAK6OS6eQsP+WeAvUDW0=;
        b=btDWBI3oWwOQGvydmyHIn4HzczT2UtKPSDtwPJsz7D7LmCVnTCRPIkCKQthb81kqeJ
         PYgx9n3G8QFDOydyXtPEbXfngroU08QYT08EjC3h31nhLZyx4m8jNbiZUKSs8+gR9G0D
         i4U1PjK5mpDDbdDn93EIJO3jAHS+qN9MohsV7hhftgV12i+293Ydn44OiVa4h4iZ1lOY
         uiKQ2BiB0GG7WFczaxncA/wrzaL+qg8BgsXK+Vcf+MLzXyHoQjKCvDZoLZ7WDiAKAU+a
         6+kcBPe0q0w1a+bkSEjibtE47YcDViNfwY4g+JEGhGJ5940iU0lygBxW3iRWefy5768G
         7rSg==
X-Forwarded-Encrypted: i=1; AKwUvBw0pbo4++nJHt9ucmTfFxdmJWv2TK18wY93qDW5fJmOtcVFzbS0c09ezxCWeuUbJiETcv524gwzY1xHC7E=@vger.kernel.org
X-Gm-Message-State: AFuF++lxZRjd5xaNAfnLelzva6h4IN8ZX4mOVMEgsIX1m42dQdyedKV3
	Q5Zi6XINwlONWfDKuo2wZ3/nYt3BDbykjehY6vh4bNpXO4odgyRXGM6MlchgbSgC2VyeAFgCc/P
	jOzt0kQ0yQy9c4yQzbRDrzZj3RU2EzSY=
X-Gm-Gg: AYBFou08RyiNwniBQr4hSRhJal0XM20z/KjYsOfguvBWB9RFzx42H9wHReIneboIgGy
	mTh4Y9kSdJcKaLvHlQ0gYg/Y9wGjHDLIj3bFd8Uj96QcDfsx3EKL2VAsIZKtYdhiiy5QAg6QqWt
	netG9u9GVsKu4vkZFHORgFHTmeCrNJ4PHIbbu2+STSDjZxv0kot38/kja2tEt3+MPjCVKhu82FA
	20HHstn68OXk5Kz4mZZoHyJ4swmHumloA4PWvS6AleWHEtgVzyLvny4w3g5gQhZVspx7/K4gsbM
	PQOOSJkhLt7vsuIBv5F19lySgmWb26TRkhCqa3phXpa0
X-Received: by 2002:a17:903:1acf:b0:2d8:da29:da41 with SMTP id
 d9443c01a7336-2db127509bemr55944165ad.15.1788491509602; Thu, 03 Sep 2026
 20:11:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260813070020.719810-1-shengjiu.wang@oss.nxp.com>
 <20260813070020.719810-2-shengjiu.wang@oss.nxp.com> <20260814-lean-classy-hyrax-60aab2@quoll>
 <CAA+D8AOdF08PyOqQX6HTz-bWZmyB0bmKoW2DxYtnGS3g72aWrA@mail.gmail.com>
In-Reply-To: <CAA+D8AOdF08PyOqQX6HTz-bWZmyB0bmKoW2DxYtnGS3g72aWrA@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 4 Sep 2026 11:11:35 +0800
X-Gm-Features: AcwNN1VSQJhguJNnq06i_90XVuMC-oTCxeandMzLTYM0L_HXyiYFRb-mCLJw1rE
Message-ID: <CAA+D8AN=ZSPDK0HahaD_Ki9=RSfofpTbphFz_eestpZvmFpYfA@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] ASoC: dt-bindings: fsl,imx-asrc: update port
 binding to support multiple paths
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: shengjiu.wang@oss.nxp.com, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	shawnguo@kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, 
	perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org, 
	Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 14, 2026 at 3:41=E2=80=AFPM Shengjiu Wang <shengjiu.wang@gmail.=
com> wrote:
>
> On Fri, Aug 14, 2026 at 3:21=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.=
org> wrote:
> >
> > On Thu, Aug 13, 2026 at 03:00:16PM +0800, shengjiu.wang@oss.nxp.com wro=
te:
> > > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> > >
> > > The i.MX ASRC hardware supports up to three conversion pairs (A, B, C=
).
> >
> > Each one or only the newest? You will be getting the same questions.
>
> Each one.
>
Should I refine the commit message with a new version?

Best regards
Shengjiu Wang
