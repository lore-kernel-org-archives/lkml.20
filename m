Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794453857;
	b=eU0wsgiEIG49I+X7ylWCAgFKi5GMzMAf/PsOaMHeIo6vZlpfXZnOq6+EjMdYlE5nMNVS
	 07qY4ikLMxiDDVWFBHbyEAb0I7j1mnVXFFzxMgTMx76aSy7MCEw4CzK8KnoH7ewRcaat2
	 RrWmyQWPyUqgdFYyFd6TLof0P1CnjQJojY35BBGCcSxgLmKjV61CFVhs9Xo4KMZ/gVKPn
	 R97QCdjjnjUHC2JVrHjLQHH19xvbNC/DK6wmMwd1/Gp2PsZtUfe+ubEBHACPVpz4QCRaN
	 PHhQSu40c4as08PL3fxAMf2G/GG9ZfjbsppNzF4p4iqsHUqov6mKnOKO0v2PLd+Sa/A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794453857;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Q4vGBoYjXFEqsa4lUNP8BKLQi2KAQQHSCj0yiO/z3RQ=;
	b=hOBSS5HlA4lcc6BE41c56kmX4vqEbMUze67OLNt2pZ8VvqvaV59Va2ZFHW91aQ4dxEJS
	 RzVoLJnD1p/JzQMlrnKS2MKwTOegUturuxz7UhmWi9qdIQEouDZoLS51UQkxdMpsmNsxx
	 sEBlqHy9EduGxHWGyQaSUP1wrtsm04Fpe1sisCzeapV+JizgC+u2XJ00kQQHHbR2I5Iui
	 TJUb4zEYGb/ym7UAVWrpJOz0/UCPzz5FqDYZMdLh9CewwHcVGQMq7oAQ1QE78fsNhQjOh
	 0h5AM//xWXQ/b+CZQWFteHGQRHoe1c9jdoQjubDxTFkdIUVkMtC/FjbTtUPURje9keA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oHmtI1ml;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84257606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:24:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84257606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oHmtI1ml
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-33fb4680717so4537052eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:24:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794453857; cv=none;
        d=google.com; s=arc-20260327;
        b=eu/FCp2zTXfTbUeLIh4aEZzkm/yOwxuCAgBCXadbUhK4wWUDEqVMKvQjW9xJ/ndYLL
         JHoEbHdZZXQjt5hrZAWNUUhklZTacX6LJBuelnfM7LrO/Hul69aVcccJrJC1eKCD7/3Y
         /N5QGAbkEWiY/tpE5zodc8dmH3scLqHtOavInAmYfGTJVPO6sEb6m7mtlgrc8Pp1m0fO
         8Y16+2B22I0GPMg0V/36Z5E/iBTpozH+SkWwNODDLBt6Dn950TXe1rjdFElYHpGZdxoY
         djoLKQsWFYOoi/Z6hytZ+LHybOgAZXck6RonTQr3mfKxqGqkh02zayqDnfSC1Libt9fv
         bCbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q4vGBoYjXFEqsa4lUNP8BKLQi2KAQQHSCj0yiO/z3RQ=;
        fh=6i5cbYK3RL5MsmIk7aPYjnM1xqNagKV4OfUBRyrXBy0=;
        b=W6hlP3Q2PfKODR2D0acvd7GR6eLDbXKVaa2jd39NtaLcEHJXKvEwL72J9heCBRGyOa
         j9lO58peBpV7yHj/Td2C/bto00JyfHnS7ptJO/H4Ywwx+FUEp5hRNCR1ypMBmhczuW0k
         FjLobO3m5r7YwTo5+Ou+W3pKbCNPKYtymUZ93/NhhL7RRtNezggpUF2xLWbmEUPJxA49
         5BiSOxkh+4xebC6ZDLlbBY+NnUnA1nnPz6yD+ZtlrSNHebmIyNKjG6l8AFpw/CSScM2+
         sinOrKd5FP/+KR+iGhGO0wKD85tCz2NHGCIoU0/7M6TiJRoQGtxU7uT5WdAJAGK85+AX
         Q+jA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794453857; x=1795058657; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q4vGBoYjXFEqsa4lUNP8BKLQi2KAQQHSCj0yiO/z3RQ=;
        b=oHmtI1mlCv4ejGkzncxu4FeiQZGkBkIG+Uipng9xKmEURLEeUg+XV/wMMGwyP4iUqy
         1ItFv9ibWqS7p/99s3Qm42lMFDBe/pmPegJQgBorqDceE0nhC8TQqWuynEn3UyxGVZDO
         euLuq7aziNRtCdc98K61q15gOB5u60w3kmItbRWwQdMYRxj3UIrTd24e+Re2GfxcxZ1Z
         HB9ReMrvDB0CAhX0T/iNV72w3DAFm12h1aEv5otcOb2DJw3PkYlMuobGefAmy0DRM4YU
         c/ihWqKX1tvaOizP2nIpgaEm16Hu6PVJPZminkArvqGxS+0dC0nrZ3boINckuDZXOy4/
         mwWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794453857; x=1795058657;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q4vGBoYjXFEqsa4lUNP8BKLQi2KAQQHSCj0yiO/z3RQ=;
        b=CDHjbN4htveVJuN9GXuFE+RGBWUD428CwmvOVwAlkf4QIGmSWLjt+p7lmGDOzvOR4S
         n6JpD0ZsAUxRGAdAYOPUbraE7MJpgeHYN/xu3A4VcGV2h7YYP+YPLffOckNf9MfVMFK3
         TcsMhHp6WBznciU+JaSLrgvWD2MSOb00FoN6XvH7o31gxsj8+WSAlQbxneB56IDs/29I
         oWQt7D35QIRuJcK2fmD1Ew1QOnYaSK9Al4jkbco0z01xcBmsEuK093xhk1yn/Xd3sHfo
         ZuMVf8y8GBcoQEDp5tfjpoF6dKxBQOa6CnMu+Td73lA3JzSfHPLgPMzHKayei0ik/oE9
         qzqQ==
X-Forwarded-Encrypted: i=1; AL+hErGmSMqsfqWs7RHyy6TlaKrjtwlRRTrrB0Jpbtm6ylsAqJV4v83sTjQgnFLD7S9LW5GyZAZzEqELr1VEZnA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1jrQ2xwd6E13RxxZAuo0c3r/oT8v691QjXspa1D60G5XKmwzo
	ckLAyXgJw0ZHeE+DSST68j6cq12vrdosvVK781CCNEC6w0u5cRZSSC64UBGYSX+wRCe3at5s7Ju
	kVSyULqlzQJ7gxxRqeu12Li4gtXvGHLY=
X-Gm-Gg: AYBFou2NDx9qrwPtnBEFKbFD4TyiKbv4Pgeji/+9e5o2qs7KmEGX3K92A/Gz1a4yX9n
	/PVgsWB3wDt2EjBoo8WT0hFIkz2I5tErtpfOguYYu3LmBV3mz/8xipOoGXJrc1IsSGHUlGmAiab
	ME3eO9gQ6GMCeCC/ze6MLQZhYdIegMpALf5qjZt+x7WEUEgm/s5CZ6k6N92932V5l1Zkvywp80A
	T02F92XCsFeuRktzW2brc1QrJNSb5vRioUfsAyl+FI8W1+wRCPCo5gsvAYXkfuEtmTTIyJ+6HFt
	9b3D5jo1QvVod/cpKPPsTqhZRlrFLfHtoUC+gM0I0Q1e1u8qKL2ZjqCuEiKHjfzjbIJiAOKm4cs
	/rODSmJe+qIG00hVugrIQyYyrKd5eFBVkMq0ZpoI3q+ILkr9SWbtUISjOChU/x0dbQGaA
X-Received: by 2002:a05:7300:2324:b0:369:4c3f:8a5 with SMTP id
 5a478bee46e88-376858967b7mr6629283eec.14.1794453856441; Wed, 11 Nov 2026
 19:24:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109124933.1603575-1-hj351016@gmail.com> <20261111172718.1e41f48b@kernel.org>
In-Reply-To: <20261111172718.1e41f48b@kernel.org>
From: khj <hj351016@gmail.com>
Date: Thu, 12 Nov 2026 12:24:04 +0900
X-Gm-Features: AclHuK8dZXGZrK50IL11IFqhm4T154m_E5AYrfNaDTyQqii--eKK6YwdxrFnb7g
Message-ID: <CAGr5VtMkhKim-qOuHBOo-6S+o3uf3J9mcKF1MRKGFZ0_XZraQQ@mail.gmail.com>
Subject: Re: [PATCH net] net: wwan: iosm: cancel adb_timer on cleanup to avoid use-after-free
To: Jakub Kicinski <kuba@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>, Sergey Ryazanov <ryazanov.s.a@gmail.com>, 
	M Chetan Kumar <m.chetan.kumar@linux.intel.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Understood, I'll drop this one. Sorry for the noise -- I won't send
untested driver fixes to netdev.

2026=EB=85=84 11=EC=9B=94 12=EC=9D=BC (=EB=AA=A9) =EC=98=A4=EC=A0=84 10:27,=
 Jakub Kicinski <kuba@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Mon,  9 Nov 2026 21:49:33 +0900 hyunjungg wrote:
> > Found by static analysis; not tested on real hardware (needs an Intel
> > M.2 7360 WWAN modem).
>
> Please don't send these low effort untested driver fixes for networking.
