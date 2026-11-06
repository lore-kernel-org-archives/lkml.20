Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793974197;
	b=44o6yNEW0CMUKNjAEMAwEtzsUMvB4T6suHC9OPItRKWGNrnNsh8PkczUS0y2iEtOcIjn
	 9T5M8JZMYv2T8inTuTKcctFH0dQ4Xhp31y1vPpz5RGUw8+UiDFsslbePYUoYxFoAY91mE
	 bzGXyeXAKITXdhbIzfw9kbWjIAVFQdhTROmAb+Fo+Deaw13QY5LO9rdDWD+1Hs21y22BF
	 N3b0GusYyCxsnHv47IbU3At5764iILaWOp9Wj0v5/KAD/52tllVJxFVjHRzJF5MDIm0fL
	 L1sXt+tImJOHKqWF/odWWArbnGYJb0Yz0VVmKa8L7wfU7q1L3+S2TkyfGGRtbtN3Ciw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793974197;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ziCxpeJuEuP3+fM2uEf4yqPzKab2VX2n4iM7IOvJP5g=;
	b=mrcVs5EUF2gh3tX0lTMW7lNy5llrRaNmiBPw4bOMGReCm2SpmaXiPHc7grWvpjCtA39N
	 glxTY5r/jFgZN7C1t2EsELvwyB9NFit++Jt7X+ULRy2oxQ5GfU8xTTme1WsLxPagGyVJt
	 UWze8kanoXH9Fa9c463gUOxhsC6wPUT5fsTflj1O5n+1LinvWSomq3KjlNzjxMDu8CCmj
	 ALUk0a8EaZRQP87vlHE6Qd+Tqgjh5IX7dQMy/KO0cK5VSbIAzc0/KgBCBuUh63Qu9aWNY
	 4dxY6gZ97qEcGWa0HKbaB1Hl+4P60luxG/k8dky36VHOmEOFmcoSRvzyV9BDJMNBUEw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="oWxmGrI/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFF5606A334
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:09:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FFF5606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oWxmGrI/
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so98958866b.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 06:09:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793974192; cv=none;
        d=google.com; s=arc-20260327;
        b=b7qWUMhq7WxOP8ux6d1JBbiiCw7wGFwOhARgTiFAY1jl6hPMXfajRoWPN8Un9a/lKP
         xwq7KEvJC4w2YCJNdI6EiG8GSEoVahO79LTKjaYz+Ma6TyhumvZhF/wdOqsdpOJRnS6/
         Q1WucQPh0DPlZS+FDNDrwRCJ8M9N6Xzzhhr+28mrTdB9q3pTQJ5y5e0wQ/wclUrEklLQ
         05JeLgVJs3zGlA4L+IgyvhBmre29cBfO2L2irRacaoqD+dW5o0jJJ4040UcPaw07eZwu
         34/GYSygy7RPuvmPZO9iM8ZIZtJzn+pu4JxhQgYxcAQiFKnVM6DKPsmgVQi/TBJBF93D
         6pow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ziCxpeJuEuP3+fM2uEf4yqPzKab2VX2n4iM7IOvJP5g=;
        fh=2vls5VrP6GGvMtZo/hyXHKRi/FQz4ZPpKHlBetb4j3c=;
        b=NoUrSGywjK6bPE1Sstn04Hljh+phY5UlooL8qPP+p8qoty5FqtvAhqv9m2wBFAEK95
         pP3fUzaoLcaMleT5rhBnOF3uL9TBAmSVXuoz0XHsdCzPuDaN27aPf32d758OrNnLyP0E
         G3R6xEvxtO03FMj5scsqnUWvkqsz0bDZxaY0sqwkReUoeBjLHNbw+0XI6zIWfpc4pPCp
         mDMNazG6AGhqFQ9xZczkJktdU/QmeK5CtSSViXsIjQswjrhRr5SGMnS01tVlkfB0/+Ox
         LdaN2xkxfLO0BBtByQyWBaHpqnMwYGcD5L56JvM7h735J64prgrqdWDu7s2zqKTisw5Z
         fZPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793974192; x=1794578992; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ziCxpeJuEuP3+fM2uEf4yqPzKab2VX2n4iM7IOvJP5g=;
        b=oWxmGrI/VLJ1xkgXDpseuv1p5AaWUS4yXjq0c4PJZxvcDs7wn41s5xKxp/hpBp1jOb
         rawxidujgp1ZMtTuPLlKDGJiDNUnIWuqEqlbOo1MkBoSyhw8OU9StvTCZvQ0r6o0aJZ9
         iJ61Zxh++Llmfcvtz+7Ekdl2U6+8qrAw3X9aN/iZlqFTGFWKK8OUi/ngoRL9HXF23nnt
         Jd9Kch5lbgQM/f/WMcdqeowB8nYYRi9kg7SMzhvwHg3Kig6nMDaph9kx+nf+o2zyyD5r
         DFeeUlCokM7AWYjCtqhsPzR5JDFGQnzQi38/Dbvk7ZdxI4gT7eAYem2qSINnCMwwLpb7
         Uxyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793974192; x=1794578992;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ziCxpeJuEuP3+fM2uEf4yqPzKab2VX2n4iM7IOvJP5g=;
        b=B+j2X9mHsclf2LpJaxGsDeSiWEgvHPgDvJAXWKHf5nAeYKe2jYXQ4iM9zbbO7QlrHJ
         bUVIXwdK22NCt7fhdEqxK/wrdiUtbpmafsbArKnzS62LW8KYKt8bY8NRXGxdMcG6YBml
         WYXO/H3/nUSDIdoUKGcwljWtpmzC4HNDGD2S3+n/ZNx0VNGbeKW7r4+Deiikqeym3EkG
         7iVwYjRhT2QjJ8Os60OxrT0DwFb2IFwbui9BmyLTz4/DZPuJzawyERsAVrk8ckb5rlZ2
         elYcFFX0fQ/8FNHYifVByjw5/xJ90l3uGId7Ea6wefTVkXUTl/puD3mNvgQhc03TzPZv
         Yjfg==
X-Forwarded-Encrypted: i=1; AKwUvBwlZ3Z/OL7eWy9IdpjqzOOqPDQIZKKJ+6M9Xf9qscmAtzLi8ehd86Pi+DhY92ZfXl9jzNmoGrCidc0Ur5A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+fe8oY/uKrCZ3e14Qvms4oOSRB/NOvu6qJZaF/dfGFG7evDWRt
	BY6fhNCKFfAoR5sUiQkYbkpNGHYxnWAnN2DE4XtZAROg0rdKyrD3c7w9HRWXO6yTR5TPVE9kN+Z
	z/+7oqnwfHEoSQNlKIg5g9gaovuQx0Vc=
X-Gm-Gg: AYBFou3x3BYuSljGc3TNcSsLx3nJW7LRM2C68DAT5OxbRgcMKhppn59vG/Fbe2c1z4S
	sARu1G8HnQHhaKqUJLHcbXzeeSl/bQCoh4JZYLPcahpuWD1Gql5mGN9hMXDVWMJBbJON83aUlUe
	1DdvPrDK4D2Zk7HvxddWQrwKyafgvnES9Cbbvo/Yz/zO5eCVXozVFqVjqQyoChW8W5meuaUmoWC
	j+qYJDTAnCFHdzHoEKMBTxRQpBouPtp5z6CqyTvHBi3mI2KKDWi6l/j36xVQrUZkXSK9QhQObi4
	RIBneloe31ziJ2hm6LcPNfAMQFk9PL6ikDgKAfpy9m4AAK8fXeGY97lScUW+pVEO9X1nwTRlyze
	vW/21U5sD10ghC4zq7B1L8t71LKPsAqlT8zxSd+n0eiabC4ariX8IEpXz3prrjFMjfEbQafOfg3
	Om3Y1ulDM0g4uiOwJC0SOnHcGmAeHq7g8=
X-Received: by 2002:a17:907:c0b:b0:c41:731c:534 with SMTP id
 a640c23a62f3a-c4d352c83c7mr245800666b.24.1793974191437; Fri, 06 Nov 2026
 06:09:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105140510.165165-1-clamor95@gmail.com> <20261105140510.165165-7-clamor95@gmail.com>
 <au3dMlmsLEOUqan9@orome>
In-Reply-To: <au3dMlmsLEOUqan9@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 6 Nov 2026 16:09:36 +0200
X-Gm-Features: AclHuK_cVVXjJEkd02nCSMWJMQCoAmARR5pIv9xMRuv91xrb2JMaT2_t676ijeQ
Message-ID: <CAPVz0n3=R1UhyTw1o-ZR2hMyXwKAomNkb5O-cQbG+TBFJi5=JQ@mail.gmail.com>
Subject: Re: [PATCH v6 06/10] drm/tegra: Make panel parsing by
 tegra_output_probe() optional
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 6 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 16:00=
 Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, Nov 05, 2026 at 04:05:06PM +0200, Svyatoslav Ryhel wrote:
> > The tegra_output_probe() performs panel parsing unconditionally, even f=
or
> > devices that do not require it (such as HDMI) or that handle panel pars=
ing
> > on their own (like DSI). Make panel parsing configurable.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/gpu/drm/tegra/drm.h    |  2 +-
> >  drivers/gpu/drm/tegra/dsi.c    |  2 +-
> >  drivers/gpu/drm/tegra/hdmi.c   |  2 +-
> >  drivers/gpu/drm/tegra/output.c | 52 ++++++++++++++++++----------------
> >  drivers/gpu/drm/tegra/rgb.c    |  2 +-
> >  drivers/gpu/drm/tegra/sor.c    |  2 +-
> >  6 files changed, 32 insertions(+), 30 deletions(-)
>
> Does it break anything to try and parse this even when it's not needed?
> In all cases we error out early, so there shouldn't be a whole lot of
> extra overhead either.
>
> Adding this extra parameter just adds extra complexity for seemingly no
> benefit.
>

Dual DSI panel fail for Xiaomi Mi Pad. Maybe you should check your
email a bit more often?
https://lore.kernel.org/lkml/20260305161035.64548-1-clamor95@gmail.com/#t

> Thierry
