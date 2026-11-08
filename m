Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794123749;
	b=Mffsup2PFk5qDSsGjOSYqYi6YmcaRAXjxkz4F78BkzcSZLcef5yU6W8VquLw3bY3mnTK
	 JZCH1keEgXqMpQyRgW80cQQdYzHElbshmWLViKuYYYNIm8DAl7jkc3u5m3Yn3XEdGCQNJ
	 pytvNsfRwm9MxFAqgUj9W/5/Kan9d/BST0Yzdv/rKo1+Mlvql57R55XaeZL94c2X+0P+K
	 F7xnZ9Q5owFV96dStQhZD1Vef026/Vg9bXf7iqzRLxTKBPlLX21HvvBmTN0CCGCxr/Z1B
	 uCLMgd2MAgj3HlpnEpJ25UTSlgdiNezAnxW8PdSczwNo5yn1adZVB2zmus7qMNY+eKA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794123749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VLNz6RHfyZ2V0vojI2Wyp9rbbg58O57zxxjtT74LsU0=;
	b=I9uDbhodJFBeZhMKBwTFoNfshReWVDTutQR/9wy5AqdYT0obNWx0QTA6FHNjhNLinPHU
	 ULP6X4mmIZ4bEl5WS5qgl36QZ81XaMlSvRFRBCgSsaAz3/PzUqaZ6gLL73zNLgbGj7TG8
	 cpWHoFu2TTaLHnpCcng99y4Uk/VICZ9i5J5Lhqy95HH6ncguM692CEOvefuHd8FzgLrIJ
	 plC6jIfco6NyjaOzuK1iQf0MUF1qc4it7tBAUBkExctG+T38M3FdFRd1t4VutKdwPzNqE
	 kqxPqKrp7G76ZpYC4xUnjuvtF9phtOroZa4VtEVj35iq8yD7oPZJD/N2utgpbE3daTA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=futuring-girl.com;
	spf=pass smtp.mailfrom=futuring-girl.com;
	dkim=pass header.d=futuring-girl.com header.i=@futuring-girl.com header.a=rsa-sha256 header.s=google header.b=WDdgpR1C;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C468B606A321
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 07:42:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C468B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=futuring-girl.com header.i=@futuring-girl.com header.a=rsa-sha256 header.s=google header.b=WDdgpR1C
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b56c428212so224291a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 23:42:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794123747; cv=none;
        d=google.com; s=arc-20260327;
        b=ffagYOE1Pq6YlDwoJ+jWjsDqDCLbFmTkxYOXriUtQVs77qqnKXXfGXov8FDZKWmQWp
         Mh/vJtaX+FFC7d2szfi4+eqBX5O+otqaui2KcFqnZFkynRMs2r1eFacnaJwtq0ef13Mh
         XfZF5d37CpkS3ajbI2QyFgqk24G7LNEOSgWzes3orVTzp4ZCqEOoAellFuBYqmXNkb8B
         Ifx/kXuCYzaaG/csu8WxHfU4ZiSANshRyGXufmtDQ7+KDGkBx2gOYu0yUDU5JxlxggqY
         aY5CsOVvhIMIGlDlXXMzjb/cKEaHx9GEZF8XDkij93S1FPdrzxEImJSwFzOJ+Paze4ML
         vo4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VLNz6RHfyZ2V0vojI2Wyp9rbbg58O57zxxjtT74LsU0=;
        fh=jhB/tFUk4t+lkI+oF28H8JByH+ly6kVb5pcbnVLQkyI=;
        b=Xr1ToMPleXhRMyyp0KfV6DetxhvQYtC6ktZE9ha2vnj7zPjJdla8IH0XtHXPN2wk9v
         rkWnaBST2Dee5nY1obw8pmsfFc2vrRUqWFN8A368J5ZXeXrlliLkpaK9wWiuHIsm+x19
         ZUmJCk7n8WQQ1gU4vGeK16spSMszkQHoh4CqMXF/Z7Ri0VRjdQ5ZR9B0eccaX2rxCsP6
         LKQAHeOnwayz6p0zwTqK5fPvEPMZTiz3Fu3xnveJnsph7d3u7jrhQLxDe2ioQdH3pg9M
         baN5Ivg0xVza3ivTjf20gMwDx/TTOJ+Yhxi9o/bP/CKp5pGhy4foNLUGb9t2xn8L+t7M
         AtGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=futuring-girl.com; s=google; t=1794123747; x=1794728547; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VLNz6RHfyZ2V0vojI2Wyp9rbbg58O57zxxjtT74LsU0=;
        b=WDdgpR1Cr4LlFfGn8lZUZwZAfSFoPLNi/WotJWOD6tv8xOx5wfKeYkE0LTd5jXhQYP
         cbIZODYYQPD47OZIMi3V4QMkMTsFK5mHVVwWP6Y7LmfjkzT2K+9AAPcsTkCM0BlfdGSQ
         fkLR28554SxnYkkFHFaMn9C7B7uuA5MaFoQpXn4TRCngellis38kHkec1tJogXriFpYA
         hhNDLvQ8t7RVBGmXOTmWCeg1hForTzFtMLObqk5qavSL60ipEwgC/7E9HxnAYLtarQ+M
         Taz4RPKdk5zGG/S/Y6HinmR5N9vCpluCu7aQ2auUeqnBWkKaDQ5P+HSW2BodTBQSlVGG
         OkHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794123747; x=1794728547;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VLNz6RHfyZ2V0vojI2Wyp9rbbg58O57zxxjtT74LsU0=;
        b=Kkz57j4dvHYQlg1M4/JNeYP0m8iRToLpb4kqOCIEXZCBxbvTzB0MIgnlyB+iVks8pr
         hwPGZBHFguxgT06MFeHOtlHj1/f44xt6l7UH7HYJ0rjRDrQdFELVo0FTniLrJaB1plX/
         sXs6+0Xdv7tMeWFxwvxI2p29RMgPXsA/BFqFq6YeVs6gqzLgBh3IVLH4Iq0PJ2wRKqCN
         Y+1e4anx1fsPg9PbrLNGmURQCaQ361Fdf3iyOYlq7Ktz4wUfilzPRF+Mfjhkvp67w4Li
         74poDC7MLTKQqgVLNuSP8VcVtUokpSRPAu2KaxYj+ejPolfMmpQbJJtAYxjN0zWf10R3
         z6PQ==
X-Forwarded-Encrypted: i=1; AL+hErHAfg9HOZPhVw+QEWI3ta/tACknkzo41wM4KS72NVLUCm3Zmpn0ugANqY0RNPEly8zelzfvdqh/8NDUALU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9RIKBl5iPxJ3TRODzUT4GD6P30pbeqD4zGOVV2g/tvdj2dH/fu
	2t7SL5QL1d9h1XsUg1F0O/y5R20ep2SrA6Mvcn/5Q1Zn3/Y92hEFDtskN2zkpVxgjNvvE3TlYrp
	DXa+Xy1m8kE+niVALUL/PDR2E05PnVsCTXsKaNs52dw==
X-Gm-Gg: AYBFou0Yn9exafv8rlkEk5hmo3N2aKGh2rLvOmLRkUST5qQ33g6ZC9E3LNF0yY7wxXt
	vhPMRPzqmmEMQURSUZNL6CLTVkvHzo+8SmM6RY524gib4NIUo7/5/J1MoL9nZTs5ENGvHUZN/HS
	q1fj/2LVYhQCnXaH9YXXjS7bmCbbxXwY5IcPvcRxPA7mie0QP25kAv8VBrfvtsWovdP44+A5zBD
	6WS+sgw1Pekz49dVNTX9g687+sb3vWRsDB2YTDMNEtjQdQkyqDwQ6n4PJJKelC4Xm1CioMtgREV
	UQ/v0EYL3mOBVVu7ppgT5M+iXssYo9eylFmoc0GgbAijcREYLzta+UqC3XmDnxuLJAcvDSaIxGn
	ErNF6MhVqkuoj6PNirgfxnH8d4UctTdt+0cq4
X-Received: by 2002:a05:6402:2b91:b0:6b5:96e9:ae97 with SMTP id
 4fb4d7f45d1cf-6b722484ae7mr465101a12.34.1794123746308; Sat, 07 Nov 2026
 23:42:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261107134939.434104957@linuxfoundation.org>
In-Reply-To: <20261107134939.434104957@linuxfoundation.org>
From: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
Date: Sun, 8 Nov 2026 16:42:09 +0900
X-Gm-Features: AclHuK_4Y2M3DeuqST9ji-ywEkqYo_2N9_-1XAV98U47LHLOvTm2zUmbhhFxDD4
Message-ID: <CAKL4bV507bkW7uEgo4BqgE-ADALXc_ZhH1OjvwUVoa0QT29ysA@mail.gmail.com>
Subject: Re: [PATCH 7.3 0000/1257] 7.3.4-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev, 
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, 
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, 
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@nabladev.com, 
	jonathanh@nvidia.com, f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, 
	rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org, 
	achill@achill.org, sr@sladewatkins.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg

On Sat, Nov 7, 2026 at 11:01=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 7.3.4 release.
> There are 1257 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Mon, 09 Nov 2026 13:46:08 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v7.x/stable-review/patch-=
7.3.4-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-7.3.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Linux version 7.3.4-rc1 tested.

Build error
The previously reported issue has recurred.
Built successfully and confirmed startup following the procedure
reported by the previous user.

Lenovo ThinkPad X1 Carbon Gen10(Intel i7-1260P(x86_64) arch linux)

Tested-by: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
