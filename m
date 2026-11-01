Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793550216;
	b=xVlopOxmCfiz8Wrjn+llRvVOF6VSTfa3CfiH/70/iqB4N0qjUIjbnSSgQuhQd1WSsWsu
	 V74Uvdq4CuMZtoVPYpN/8jJY75KRbUDMZ6o2uPtr80JkXfdrvFn3zejFHy9Ajt32w8agk
	 FSb5yyLmElqhoHq/nfOwuYOJ/goCWdAMjWcJQKa/Op2CYEn7dJLZjkTtnhTFBoYiEJN0c
	 v853lu9KuF9HHccdB67TdoQ+7++Vx6vioEgP0d5oIBmXXax03tFLTJtBKEpWuBBJFlnKS
	 YbCDoHpNi26qMjR/wv7asdk03lsSKlImgK2zB8c0gaqztIGUKmSHiICW4DHz1rDY7DA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793550216;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=//BiYczTSqt77P177JXkniyDHFQ+z+V4gCGeruh2sQ0=;
	b=Pu1K7V4Dy+d6bA24nj8x/C/Odf7p54ClGAxKOKW3CJvyWfkCJrILBUxAHdes+heu6z6P
	 gwGC/htXLAiq/egfU/E1/7RpBzQ9X4uvxDNM7pi8t4WV0WNxwtCAWdwxPSe/qJFUbMlYR
	 QBhohG5xZQ/dtFO/hJCOR4BzFy3/Yh+GMH3lCvoVzvwQXIpEFriaVcELXSv4NWtoviszj
	 mJdnBp71fnmAYDP0kHmUJyMSi33ho940O6vr2MJYdiAam3gKRZhxAjVIuVovfmwAduNHI
	 bxGNdyKw8YiAhMP7/54gQjKNIoWEUKGIQtGdJjB60yP/6C6mvd0UrlMM+tnXw6laJpQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=miget.com;
	spf=pass smtp.mailfrom=miget.com;
	dkim=pass header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=IptkT1lC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01EAE606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 16:23:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01EAE606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miget.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=IptkT1lC
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6df7f544919so1564792eaf.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 08:23:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793550210; cv=none;
        d=google.com; s=arc-20260327;
        b=R4Jwt9+Qm7ooIODN79jLwVT2KjxBco+t73zy/Hmb4dWz4sKSt5BpQg2UFDWOrXqk37
         PpMA8wvC8LieCqoA/kQ4zmrXfVfE9Db8gszuWKNeyPCtae/qALbcjZSQBIL3lvhbbvTl
         BaJzNW8yvoQCttaXAfzaHAr4r/RVPOKn/L+//CL4gyf4NXluc8KQCYuKOAb1syFlxHYT
         dblXJdWiLs7w+gAhM8fkkcLpoOI2/8JWFebZae3HrFgwpE4woqWi3HY62NXTRcjrMVLf
         efOA9DLswEfivS3F8qZ6nijrgJcOznp9/6Wn1k1df67rMuzeAy04lnX3RziulxANRVjz
         y8xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=//BiYczTSqt77P177JXkniyDHFQ+z+V4gCGeruh2sQ0=;
        fh=ra+nTo8haM9pSfQZbmeEraEomWKiZwjLcX5FOqmp3cE=;
        b=oXyjw0TPHVJTUvC+VFM7jdw9v5KCAz3wYOmn7TcF9RhTs7XWrSkO3ZlnHsa6NddyLl
         /OAo7YLlQkkZQSb+lPzDUl6z13jmFkveWRH0q7LQ96VH9f2q1a1jV/r/hHt9DbkOfuGJ
         VPFOgLd3bblvDM9FKbPc7b3jhUKn5yzHV1GXa817Gi1OA0hnmFmb+jqL3K1KS37RVAWl
         Kg3JgN5Je7HfgQVu1vx1iTvrr4w3n2FBa5XAqOcbqVxJzc3a9zQN2+Q1PxC+agdjzwJK
         zuw9hN+ZX0DgXd0t0wO4PUhPoD0QP1YdMI3dekJPYUI4Vd/HQK454CLK2NEMmzFiZoDu
         tfdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miget.com; s=google; t=1793550210; x=1794155010; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=//BiYczTSqt77P177JXkniyDHFQ+z+V4gCGeruh2sQ0=;
        b=IptkT1lCeVEW4GSLktWlzpRHIvYEQzQbHAjdian8+bAtOiw65U/iZe3Zoej2SCZXVF
         tmQTv5OvjQOYs/6Sb95w6uNBdK5tZ1+Ti39et0wcaxN7Scae2mwCI61ti4BHt0/JHY/H
         huek61pbYoOvDx/ODkhZzAtIIiTW9XL4c/TUw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793550210; x=1794155010;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=//BiYczTSqt77P177JXkniyDHFQ+z+V4gCGeruh2sQ0=;
        b=ENzYRNMlAS1S2rxiCqHBDdKLINBQwvcQK+HmG5IJkJ91g6G9aGM7968aE4EQDXEufh
         h++HcJ26mtSatBWrrgP5PWcYb+WmJTUtigCuW4dxurBMFAwISfOLz/76Z8N+dgjjOGrY
         lJQ1dZ1z1lOAP2Sew2d0Lo9omWkCHzF1xsEsHiXfvYMiwStyr30c0Tyxv7DtOrpxpjyV
         pnqEnGFHwlcN810eQhpd1plx6SNi3JhghytBrCfnPAdYJoZ7c5LLN24QJhCk6C6B6WGR
         B8iLlFrrqueJTLHdk+k1ONwQM9ripFferkm7GtVrrvLeysn/nON5a31P8iMuq6nNz5o4
         ocVA==
X-Forwarded-Encrypted: i=1; AKwUvBx6RU2durtE0vd79FYbonTMlN9+S/Pk3awDrSdjRELMEvVlryI8tH5T5Cjxdn7VvTAOy7TvEEkIDtUcQiU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKO8/sqjnYtr02qKoaipQFCulJ4K2kD+vxDtqxMtYNgb35Z/Jg7
	gQapVVJ8Wul22VNBKTjmMIR2ZeYlGakg3nLnLvx25Ozrj4eKwBx2s6UVeQ2+2FuOXVqxvmTwZ/4
	qD8Y8vcsBO7rEXsc8vfIWKa+FwDB+evPiFCqILNF16Q==
X-Gm-Gg: AYBFou2BZEhfiPKI3sLTZNyA7XEH8TSfdEzapS2W1xE8WS+Q+8TkVM6KaB0iCi4ruiC
	pgl27/AP+gi7Huuoid1KsNiRL9DXRtaSNh99oC4PvoGIUM3xAJyxnrZUOeM/wO41TkpaN6QEInD
	MAtx+hE5VaZ6rIeqzWbgJ4wKij7FQpm6cV+DtJsLp9pCzG+wjdMzvLDcgEk6GW64BqNIw9o4juS
	VV0oWJ4DNxi8Ki52ZEZQFqZsGi5OGMUu/5EwYz9aQxiJNRkVHjycI/0aSRhssHTBomdzcOTiS4g
	L4U35x2Rlu2gzAby2Xl71xDKhBspnUoJwgcgP7IRuFIsANi+SNpdSletrV7rb67WDgU3+G0RuSF
	lkP8dqCfGWMvMCHYYA89GBqnj64JMQ60NLgZ+IfxfnakOzI6pd8sUZIoLXoqj4IcxnfilJIdvIc
	xJDDietWtTEN7+mC8IwTkWq9SzQw==
X-Received: by 2002:a05:6820:f024:b0:70a:d839:2b4e with SMTP id
 006d021491bc7-714f2885c8bmr4370807eaf.28.1793550209930; Sun, 01 Nov 2026
 08:23:29 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025195456.43414-1-chris@miget.com> <20261101153856.1367825-1-kento@kekto.ru>
In-Reply-To: <20261101153856.1367825-1-kento@kekto.ru>
From: Chris Taraszka <chris@miget.com>
Date: Sun, 1 Nov 2026 17:23:18 +0100
X-Gm-Features: AclHuK95wuYaVs_y70yGzxJna7r1n3cTJpA4sSaZzeYToJAUZISruSrOiT1I-cw
Message-ID: <CAAcRvKOq6C_nWcc1oezzQ1Uima+ehJqDxg7Bf4yhrZ+jheCrrw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] platform/x86: bitland-mifs-wmi: Xiaomi Book Pro 14 support
To: KentoNion <kento@kekto.ru>
Cc: Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Armin Wolf <W_Armin@gmx.de>, Mingyou Chen <qby140326@gmail.com>, 
	Ilya Gladyshev <ilya.gladyshev@linux.dev>, Matias Civadda <matias.civadda2342001@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kento,

On Sun, 1 Nov 2026, KentoNion wrote:
> 0x03 is Turbo, not balanced. This board has no
> balanced-performance. 0x09 is the firmware's normal mode.

You are right, thanks. The DTT tables in the firmware's data vault show
the same: on battery 0x03 is Turbo at 50-58 W, and 0x04 has no battery
entry. With v2, balanced on battery ran at 54 W.

v3 maps low-power, balanced and performance to 0x02, 0x09 and 0x04, and
uses 0x03 for performance on battery:
https://lore.kernel.org/all/20261101161814.1325847-1-chris@miget.com/

Thanks,
Chris


On Sun, Nov 1, 2026 at 4:39=E2=80=AFPM KentoNion <kento@kekto.ru> wrote:
>
> Hi Chris,
>
> On Sun, 25 Oct 2026 at 20:54:54 +0100, Chris Taraszka wrote:
> > Kento, if this is a problem on BIOS 0707 or 0A0A, please say so.
>
> Yes. On XMAPT4B0P0707, SET 0x04 is rejected on battery. The supply
> check refuses balanced-performance and performance before the
> firmware is asked, so 0x03 is unreachable on battery as well. On
> XMAPT4B0P0A0A the SET status is success for every write, so that
> status cannot show a rejected mode. Your 0A0A test on AC shows the
> following GET is the value that actually stuck. Keep 0x04 only when
> that GET returns 0x04, and otherwise SET 0x03. The supply check is
> not needed for that.
>
> The map we use on TM2424 is:
>
>   low-power    SET 0x0A
>                GET 0x0A or 0x02
>   balanced     SET 0x09
>   performance  SET 0x04, or 0x03 when the following GET is not 0x04
>                GET 0x04 or 0x03
>
> 0x02 and 0x0A are both about 18 W. 0x0A also dims the panel and the
> keyboard backlight, so that is the low-power write. 0x02 is only a
> read alias. 0x03 is Turbo, not balanced. This board has no
> balanced-performance. 0x09 is the firmware's normal mode.
>
> The quirks entry is the right place for this. I am not sending
> another copy of the patch.
>
> Thanks,
> Kento
