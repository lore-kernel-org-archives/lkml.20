Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793126696;
	b=r32+UgU6sDIuLbeRG15j19o0F6zLsqSCNZsfuQhPUgIxueY8ETgMysuN7Gs2pTSTkSrI
	 D23CZXWQvxq63p707v2IxIPrNodIi3WNK76ikZN09sTWYTnT40Hk8v1R4wriinu+v5a6s
	 RLtYUk4D+w8QPMH8UQErcpt0DVNHmrFVcp8Hm46lnC+uQ13Wu7LAL2xZfzJMjAeMA7J/D
	 zZq6dkyfpJ59DAHBWV19LLi6wiH3zdtdgeI+fp8l8xCNXnBsafWh15SR8KOZRB+ZLC8vS
	 RQy/QiX+e71Zpnf9m9q3aFrJwwld+KfbeUcp8AR94K76snXCIWIZC9n6l3hmGsQLtYA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793126696;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tEoWr6oOVnosU4poLjW2kjTOYuqBMD/9cOa8c5tjMMU=;
	b=M5v7EMboMGnicCdI9PTaaZLEmDjfG7QrXbc24tsG8lzE4eftg3IbZq6/GyfUPRraADUw
	 H2Hwo8x6ykOiAw7pePUUUSGk2PYjflR73tj8dj0h/WzY3M58g0c8A+aUuAeIpjE/nVRNy
	 hAkUO4y3ZWgkmAOCW7oN8B66Zv0qnfKMIKQtd/tXoPvqzPTk4chSedj5VjVsLX9ZXOagm
	 RVfB1fYPzDE76K6A9160hzz2RIZDsvN6wfW/vitwmQPgSBLOrjoYrsr0h2srBu/0f/K8w
	 Qs9t01ya18ekyykwXrgZvppwoGxSz6P966HiEV8qzAPEI5CHhWEVG9Fr+SLbZj5644w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RZ9Tmw7X;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D626606A322
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 18:44:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D626606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RZ9Tmw7X
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso333009eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:44:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793126695; cv=none;
        d=google.com; s=arc-20260327;
        b=kSo5/w/hFguOB/42qzC/tKYN4J192FUtsetTHkGQeHCaNQlFbvB0Y0/KQblyRvHvjw
         dTGHFqHvep3/VYqOaHnIZzq4PSOiijzOTh7a4lelPHtzsZPW/QXht3o5GUzFBRWBp9yo
         bTmC6FqB3nK7934MQBqD9E7cDmpVTAFTzCxG/OZz+h7+och45ao52vtv/z+HIz+Rea4s
         jpW8CfsEfO7c9DOiuyCHQ6vNvmeNMkd66rcB34kEsXrittEKFo+piuRWuyAt4G6QW/1F
         wAzD7vFWrOQN/BBRJj6OUH1h2Z9QTAI5ZAhhc/cbMKDp9+xgRcwf4Dl+tjp+QtQpwO/S
         fUVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tEoWr6oOVnosU4poLjW2kjTOYuqBMD/9cOa8c5tjMMU=;
        fh=pOGJBpcLOKrfK6whgKW4UZRZ4BxRNvMVc171QrTnT60=;
        b=qZTB0uw4aWOwSmtXO6JYnSPAuitOTyLz2t2QztH4/6ykCsf7U1KVxQ8CgqSmAc3cpw
         crW01jbJfCF87qaTPiYlE0quYxLeiLYT4aOYahWh5dijaeorB7biSaHBx7keNN8D8RNj
         qhocqdURxjFgXkpLm8keRk+QVenN9hXk8Q7n/LNr2+XymUR1Cauyr899xIqUEFvFQZcZ
         YKWUj6vT+odUrFHEa8H7vBDxfdYFhQ8oKoUOOZKLTwj9qpDE3J/LaLHaUHfZYLi2DgLj
         NPWMjTY2BCSiz6Vi2YrNKOcS2h9hEJCE2rZwhQ49mc9FOywMT6u7M8Rdi/ktoWxTS9si
         EFew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793126695; x=1793731495; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tEoWr6oOVnosU4poLjW2kjTOYuqBMD/9cOa8c5tjMMU=;
        b=RZ9Tmw7X9onYeXIfmAJ7wd3QPCdcDBD4paScJ30dfXx3BWGyoV/6iQVFuzt/zccTjD
         /R35Yw+g8tOlNVl9zG9vBSMJgjxM/01FiXo4i4OMwmfBWTkYxrwCTYp23TJhNnIZrNUl
         5Td6Blf2bHUxOSbtHInNeN2TmSkk/7hRDPWcbGC29dn8i2aJUskeIehrHrFKYXyCVFqa
         ChvsxSNNwMjawkbG0F8uJ6EhS+Ro7P32dpB1Tr1pYwVglEU/MTXh2lSmWArCdzF1Ufqs
         8fXSzdJJ/apgn4X+SdnXZz/JC0H46gG4PTYJHNOcuPBLOwpeR4FONKL3Vf8zqXYbDJsv
         Ym1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793126695; x=1793731495;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tEoWr6oOVnosU4poLjW2kjTOYuqBMD/9cOa8c5tjMMU=;
        b=ReIth7dYNctT4T+CLZEadjgoZa6tXaKAkXDaBFJDa3wlg4juNrm0MvCkh5OP8TwYLC
         U54m4JnizDQpDyRuKP+nKlr00FahkpVfu8TTs48FWhKO6jLTbGXWmExiNfJVnm03NCn8
         CeET/PSFovDu6dkwqek6c4+I0VH/55awL5m0WsJUiYOOgxM6K1ewg8nfwr3dxHo4NWWi
         eBSJuN5TiG+jCv+XpAvEjUDEzC1LzbTjM9OKXlC+SiVPhfiapzqRfr3JYSZ4xVCrOv8b
         mRP8x0ryDDLeeyun5M4plS3zSVa/IQ7URoQS9VSDqlTOSHECGlBoNYiY5QHXuR69JseC
         cMCA==
X-Forwarded-Encrypted: i=1; AKwUvBwRfboticrH/PZhrmmrJU5G017Ng8lPacC5EyE5LKjOyRMrWqmnjXYblB4pwe+R2k3cqkuhEMCMCtdQPZE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJyCME/hez8pitZ+TGCHmxCBdV/K6FD0Gvx+IfpKAN8R/YuWv4I
	yxwvGRCQC3fWxAL0N4bKIBB0qaObj63zx8MyWswLeBLlZHXVdc4dz/h5nGUKf9r/yBSD2w8l3MJ
	ViULrdiyLVjFS8XhzqQDbFQqIlp9Xups=
X-Gm-Gg: AYBFou35mGlCHeC8xloinSC3jgRS57icdEzhmRGyotCbMCHnLroUAK7WBrUV7Qz7UcR
	gjrJGgPtMvWMdmlDk9Kqe5/xXEaqwPZ4AODNuQeSGBjBZnVA7xhu0iIqU0/qk3g9YYiOvRD0WhF
	8mFQr/5bsoDTB69NkcYI/P+IwE2CrL1C4FQ8nqNXeYgxMcMva5wNyAVOieoqy3FWfl1fyjsX6GE
	/YVPSMJ7keYomrnRZ9DbBIKFTKyuMVrAnlsjTkLCUfzA2ztgP0MaR1ovpH/m8j8a3stxE4UXnTu
	6JlkqD5orNhPJqHz9d2o6ihhETv1YM9oBguDmCaW5XORRRLdjCzBkFAfiKz3U6t+qLPqXoIIhzA
	ikWGWMmnazFsMqJcSDalEvEjRNfiL4d0tcYDy9V8CV+3qQeOlHpnMAWrhPsUlLJTkhG3IV3MHWS
	xQJdtXpSW9Ak+ZCLs=
X-Received: by 2002:a05:7300:c88:b0:369:eec1:1d7e with SMTP id
 5a478bee46e88-36a2011245fmr748593eec.11.1793126695515; Tue, 27 Oct 2026
 11:44:55 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027120019.93611-1-clamor95@gmail.com> <20261027120019.93611-6-clamor95@gmail.com>
 <179312433904.199157.3178610408209114840.b4-review@b4>
In-Reply-To: <179312433904.199157.3178610408209114840.b4-review@b4>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 27 Oct 2026 20:44:44 +0200
X-Gm-Features: AclHuK9YRoKNp7VL85UdMjrZOorWmZTdr54Qmc8Jf3CO54OLWmTMK4fUeFsGC7k
Message-ID: <CAPVz0n3MXT7_h6_REqcyayC_qyi9xXLNUjJLPzeyACFipr=TMA@mail.gmail.com>
Subject: Re: [PATCH v1 5/7] ASoC: dt-bindings: wlf,wm8994: Update
 #sound-dai-cells property
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>, 
	Leon Romanovsky <leon@kernel.org>, Animesh Agarwal <animeshagarwal28@gmail.com>, 
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 27 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 20:0=
5 Mark Brown <broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> > The Wolfson Microelectronics WM8994 codec provides three DAI cells.
>
> >    '#sound-dai-cells':
> > -    const: 0
> > +    const: 1
>
> We have existing Exynos users which are validated with 0, this will break
> validation for them.
>

Yes, sorry, it should be enum [0, 1] my bad, I will update in v2.

> --
> Mark Brown <broonie@kernel.org>
