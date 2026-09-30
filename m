Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C2549E12A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790765305; cv=pass; b=HTWbDODkB+VnrZfT8hGl90has1fWpkfdQaoh6E8Lr+skYdXlTbhtRuswrgbF7XkAPkJNmNHejW6jdYfxZvd6aVzalBkMC1O7r/KLgKP80AlgoFe8AWVg+G6lvRPQYIzcFKeMyZmzzv9mwBRlzeyBX5p26WhZ1/kykD2gKkSb5z8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790765305; c=relaxed/simple;
	bh=Xq3N2ANyfb+Xloxo9AydxI9XEgKscgcw1LYegzbSXnU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oA4T6zxjrkVMpgz2QBVnYdtRNp4TKh9/Gx2cUytjNwdOncBrLMqeimNgQLU2BTR6fLobJMjD4wgwNGe1ecz3ghPaPab7VV5nBMeiZ6UKdIJ1M5AssEBJeRqsPOQv2fqJlIqyr7jdfnVDjx0J3GC/1XQj+qv6DKniPBtO8stbS5Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TsF8hbIW; arc=pass smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TsF8hbIW"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-328664c2da6so4416383eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 03:48:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790765294; cv=none;
        d=google.com; s=arc-20260327;
        b=CVBgOUSnDfYQWyRioYhvDcMlYHGV3KPpvj58TUh1e5/he/oq43X43N52sCjwuORPqj
         iAKai1jvsbXNLudid2egs5ApmRMxCVYNkX4/KrR5EBw+okB58N17GhSdI6Bj5ET+t0mp
         YwBG2YiDN/XjMSVUHGGSAjZBOQ7rkQJEArSzaDdYrXnxhpzVsQWufYYDggbxQUBlWVCd
         fuUHxxOq0XNI2tGjZY/cl9yzUNhPDrStRYYpSG6F915AUHZqQfZU3BJbCFH6mVQjzHDR
         ZwDfLJlHg98ugXc+wVUQCfyVi6NKMTYbkaD/Vu2gXosIw8Ea/qej9FITnFNZO+SmNj47
         vMcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PzwGy8l1+YM8qJ7FQ+1mOaVfQljvGUnBphrwb0sFzIw=;
        fh=jY4xMh+wG9SlsivCGy5nO7GjTn+UJ1SY0d8nsodpEfY=;
        b=luNR8t3wh1xp3hwHGt/7o6Z332VTombnQohmqnRNNfhxtcNT9wh15mV9Tx9QEdW4YR
         V1NI7SPWA/M/2j/gYpu6Tah2bDHkqBOMoCB2zc04Vy4Gpqz3KFDnpcMLetumpEoICy2f
         ZzqQuuQDLLsKG7UdElXhVjlJlKQwxfXI9F3zF5pelgQy5CX6lm7GOpKfPa/fWk1K4l4U
         TEbKlw6TARv7ucKljoNTyTcgw5Gt/a0JEPu+FsfKIlNSMcIr9ObEetkxM4Vd3Ggziq4x
         JMVHyUJmK+6/8unmmJQDG3saoeUM3Ag3Xx2amSIwdyH4H3MmsSfPR3pVakmXWiyi6paE
         tE0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790765294; x=1791370094; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PzwGy8l1+YM8qJ7FQ+1mOaVfQljvGUnBphrwb0sFzIw=;
        b=TsF8hbIW1wCjRIaE1hxC8EltOeQXMMzpqgPXV2bU0nnvx+Tf/4GdlEB81RvTNXR/yS
         jEBvPXrQoQr5B0/f6jaMROpj2A8VS5iJzOh0/JBSGgyb5EUUeWr4fwC8IHY0OSgwK4GN
         UW98f6TS3At3O3F3UQhO4nyR269M3KuP0oeuk33UObOHvjXr4lMXTzXpJqhK2hW886iu
         RIubJ7BmIpqkclSK5yylILIyKeS9QX8AWbTmeU7wtxX0Xp62e6ZM1EqX6A0yrUqSXMoP
         5mTRmv9+rA2BPmzgbkPV0U36fAQZQQDRQKTAK+7bpvAUktlIIDpRSbdxWVfHOK4LKuzA
         RUhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790765294; x=1791370094;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PzwGy8l1+YM8qJ7FQ+1mOaVfQljvGUnBphrwb0sFzIw=;
        b=EdJvOrQ+TS/v6cM9kyGUTXHwwSqecLw8Fp647oPy7fAmxTbweEyi7tGx4k0f8yE5Dr
         LsiCKxTupgwU+OXLU0+9jIBjZu+0CGL+Phug+LbRo15a/Og9ak9Em2V857Ji2BgjhXUV
         ndzN3H31dG48wGI00619il6VKJely1IYUQcamhW9g75zFQjQy8BK3QS/tJCLW06WGYbm
         4DQJ54nGKy6Wo2A5KUOGLNeKsR/MaktAVIdCbkN8r+OEJckW1UENu+xw2HItA3Eqn0Xo
         5t9yDjd/wyCK/k2EfyugIJ0VQAO7ShYiG1RIrpgwakHxDg4FzKuom1qmuh1WVIgymOl7
         jygg==
X-Forwarded-Encrypted: i=1; AKwUvBxwOW4mZJhuTBbSLue/YQXAk65URRnmSRFTBeBtXUDYpj/P7KU7niLtxnq+IzbidWHA0mmpHEF2B4LkHPM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLGGB7E49s2syCJGZ+Qsuiz6piElJ20slrkzNaLTDxJ3cId0GxN
	VobjtRHUgxmWxR8HS/66kuISrfYiULE6xnCl0f5ZyhrsHVwCTMLOk0NhMGl8OKMS2Ao9uu7tADb
	D8Hr/geTMYUyLmVa3npu8btFFV7QZAsk=
X-Gm-Gg: AYBFou2/0/mchwo5v+Dn7nAaPnIiFvbfNFUlV4zEFIupoQnrtmPn+oNRhwzeJ+bN4bx
	pgQcVj0QWjYVrFpzPLZ1jYQODvbnrSgEhXy74q1EAbm9rvBPo1DhwN0n+Kf/0BtZ1qDYW69568D
	aiG/IE55FmqIfeKuAde5FphHwGxHdUUne0lEj9mDEz74WwrIQ9tDVzb6sQrXlLuYWEjfV0Jnxyi
	4Xi7Q1bIRSQyM6eKbzjaK6U79cfI4lG83lBZlf8KSI+nH98SkmYiq37CYZq/cMXqEF/28qP6b46
	uY/djjwE6Cz3dfTsjVR/SWbb82mNwn7dQ9SrMUYwYqb6U5XVl82LA1EmDR1VNxhW9+Bk7d54QDy
	XsxV/5NBnCBs3
X-Received: by 2002:a05:7300:8296:b0:34b:7e89:997 with SMTP id
 5a478bee46e88-34cdd69689dmr1294076eec.38.1790765294291; Wed, 30 Sep 2026
 03:48:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930070535.47130-1-clamor95@gmail.com> <20260930070535.47130-7-clamor95@gmail.com>
 <arzNgbx465QIKYdX@orome> <CAPVz0n2QdSWL8=KBXnsQQkdNEJ9m6HSQ0+6mJji_RHZ8QgXN-g@mail.gmail.com>
 <arzilGz4akKvRF1K@orome> <CAPVz0n0-baCzHOXjWLOCLjv8fb5GbE9a2v=8tBYr3RgHkEu+qg@mail.gmail.com>
 <arznE4HKl9r_mPX2@orome>
In-Reply-To: <arznE4HKl9r_mPX2@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 30 Sep 2026 13:48:02 +0300
X-Gm-Features: AclHuK-qGc3Psoay8x3hInLmhZCMxpDiJ3bmtWhyIJMqMqR4y3RvUdbuIDV09gs
Message-ID: <CAPVz0n2A8oU_yRFQ_u_YkXSa5x7PtK8sYZ_p2P+GNcphq-bP-w@mail.gmail.com>
Subject: Re: [PATCH v1 6/6] drm/panel: Add Hitachi TX10D07VM0BAA and LG
 LH400WV3-SD04 MIPI DBI panel driver
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 13:43 Thie=
rry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Sep 30, 2026 at 01:34:19PM +0300, Svyatoslav Ryhel wrote:
> > =D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 13:23 =
Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Wed, Sep 30, 2026 at 12:08:41PM +0300, Svyatoslav Ryhel wrote:
> > > > =D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 12=
:02 Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > > > > On Wed, Sep 30, 2026 at 10:05:35AM +0300, Svyatoslav Ryhel wrote:
> > > [...]
> > > > > > +static const struct of_device_id panel_dbi_of_match[] =3D {
> > > > > > +     { .compatible =3D "hit,tx10d07vm0baa", .data =3D (void *)=
PANEL_DBI_TX10D07VM0BAA },
> > > > > > +     { .compatible =3D "lg,lh400wv3-sd04", .data =3D (void *)P=
ANEL_DBI_LH400WV3 },
> > > > >
> > > > > Why the detour through that PANEL_DB_* enum? You could just pass =
the
> > > > > panel funcs pointers directly via .data here.
> > > > >
> > > >
> > > > Passing API/OPS via .data is discouraged.
> > >
> > > No it's not. We do it all the time.
> > >
> >
> > I have had some controversial experience with MFD, with passing cell
> > composition. If DRM subsystem allows this, I am more then happy to
> > pass panel ops directly.
> >
> > > > > Also, looking at the enable/disable sequences these are in fact t=
wo
> > > > > different drivers, with the only commonality being that they happ=
en to
> > > > > be used in the same device. Rolling them both into one driver see=
ms a
> > > > > bit odd.
> > > >
> > > > I did this to simplify maintainance. Both panels are used in the LG
> > > > Optimus 2X. My assumption is that LG switched one to another at som=
e
> > > > point, hence they share same timings, controls and supplies, but
> > > > differ in en/disable sequence. Additionally, these are the the only
> > > > DBI Type B-only panels in the kernel, from what I can see.
> > >
> > > That's just one more reason to put them into more of a generic driver=
,
> > > which would allow people to find it and extend/improve it as needed.
> > >
> >
> > This driver cannot be "generic". Both panels don't fall into any
> > category of being "generic". They are grouped solely cause they share
> > same timings, controls and supplies (only these 2 panels, other will
> > definitely differ) and are used in the same device. I have no problems
> > in splitting them into 2 distinct drivers.
>
> The driver can still be mostly generic. And I suspect that the panels
> might have different names for the supplies and controls as well, they
> just happen to match in schematics or sources that you used as reference
> because they are for the same device.
>
> My point is, you can keep a lot of boilerplate in a generic DBI driver
> and then parameterize the things that aren't the same across them. That
> gives you the best of both worlds.
>
> The reason why I objected is that you have a very specific name for the
> driver file and the second panel doesn't match that at all, so it's
> confusing.
>

Noted. I will split them to remove confusion. I assume that schema can
remain common.

IMHO creating a generic DBI Type B panel driver does not wort it,
especially since these panels are more like non-simple DSI panels and
always require a dedicated en/disable sequence.

> Thierry
