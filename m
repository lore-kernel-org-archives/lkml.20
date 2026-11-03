Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793675450;
	b=kBEWKRmGJnmdl61YbyQUF4GIcS+P7pvKFI5fhxisL6ddi0L84J5CSV4ph0hnagvnm5AV
	 wncpMQ6AJNaLBcmCTMxoyHLV/inwKP1xAdJAWkOZ+of6gncuoIr7gYxMf5VK4OrvRdeEI
	 Hp6O8rUxG2WXPm7qa1YsKrf2s1CxMNfLOIHTrTCBiwE6Uf4ocxpAjVBH37FkDr0wXKoRF
	 es0crHerbteS/n3X1VYIFJxwmDWLAdIT4SFgqucACIzzdJ6CA/Pdj6dxYMDWDihwlyRuN
	 wllc284KrTHxGQXt7nsJ0DGC0lGsmUhlx4SDlauOwdAQoV5sUhYgX4TQwegfxYyVTRg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793675450;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=I40CEUKGQGeVFrpde/Dw8amUVmDAEaeEzpfG41WG6Yo=;
	b=Rbha+diOFODEHD5dPgme5tYvM32stZbV71Honcx8CDz9tc2ykaAwhN9U1taLcNZ0eSU3
	 4QYFJ/YEWtzW2GcXvHbkMp1abKSmPCTJqCVFK4NnO+QAZIKhqS0fGvxjQ5bsjHgAPhg42
	 IhKRIxLTUJMGCYLTUUpSJdhktConlUbKL3gfhNtiaP9Dl6NiA4jltGsonBR31ioM2SsDi
	 B2VQFKPNoFhMCUSFo6P7RDIukmx6iEhz3mH4rH2DBwZUUEs3PjYkTu4XndNtChg4iUwXQ
	 NOXkiD8pSNOD9JkwVbF1uMQ5m3mWAbjw/SENadu9TlI9LNSELkiq3BvApLXMeyXyYfA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kd1d8neL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41088606A32D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 03:10:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41088606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kd1d8neL
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-91c7b00a75fso44594706d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 19:10:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793675449; cv=none;
        d=google.com; s=arc-20260327;
        b=WmP5vVi6mSyOmNdDKsxCyHjYwwnmmWJqTBgYGFHje09ICqXKNmKyckvnbV5D6soQf3
         XeepA7o3NWgaROkLjc5owFsWl2rD/Ep9hMJ86NPsna1OpErmnN/Q5dGCWUIqehsg6eJR
         pFMA4FbX/nISSRNVzF5Qk8ooq0TD21nh6ScojRhQm0ZErhOa77eNemR0ECrmZqSUpzSd
         +hcsuOn5ZEaiaGBdMcuciLgO8e4bRvliCNF7mzadKnyLSzvjQUvlNLXvo1JVRmbtx05e
         VvbZI4kYZPr5MroKZqnIlYAHpNfR+jSR7Cq3y/WD/s562IKWW2oNvd9Q3a/phEaDMTan
         SJJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I40CEUKGQGeVFrpde/Dw8amUVmDAEaeEzpfG41WG6Yo=;
        fh=/Hy7Wx+fpUDdDNK7db3SfuFhfooEF0Je13AvhPOgsOg=;
        b=n6yexuB9An/EmGCk9j5SjYDE1xyiZBsbPs/E8qrx55FmfIrtBE4kuaTQuiCRQaZCVJ
         TpoGeEYjkckSHWkHp49z1sQGwwFOAf9SzD5G0I35REcyL0PPzZejsJT0oGyituQhv+6a
         JUJ80neUxyEE8r2ulUzzaMFCLa1Fxwqa/o2Na09yf3MeQDLZdQwnvdI9V2Mrwf1REMlK
         JusRkD+n6xC7lyzicNoJpyVfD3knzWNW9kwjmUh5hmUVwmy6ZlREWVRK0BV7dbOTY/Gl
         FGplk+dt4Ls5euMKiN5aDdff3VMVaFvbvFc4Y+ED+uN+ppqw4g8RmYVkGFv7IdY5Fpcw
         8UmA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793675449; x=1794280249; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I40CEUKGQGeVFrpde/Dw8amUVmDAEaeEzpfG41WG6Yo=;
        b=Kd1d8neL3mi0vxLQynuwHhuLnYrGWKsrp4eFh+ak3/BEcqFEIvh4SE9c1aFOUkFpj1
         LrlWaigVkdNr0ONMHJ/Ov+9IaNAqgZRVBLi2Va8c5TQBBZV5bq0h+RkjByvrFDPhoLqM
         9qC1Sv4LJ6L5F+rgqYap02KwM5gF10n5OVLPgwWGU9C6kEYY1ml6Tc3jnfT2ZlLVvjVT
         UIyiE1VZMpDui6NVZ0bsvdlsG3DUg8mskLI4PEIt4As1FvyMz4BvOImX7uTotWoaQ9Cs
         7C+QYuYstD+hM9EtUZXDZITNJ/G6Rp0MpcdwoP1BVq+fl2r3MvKD0gAT6Mg04IzTD6d8
         uP/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793675449; x=1794280249;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I40CEUKGQGeVFrpde/Dw8amUVmDAEaeEzpfG41WG6Yo=;
        b=oMFt7rM3XoQhp77Zfq1gLBwV3BF7HkTMunapdclrQzmQGkaNz0/+L6bGeIbWRLS7qs
         xYjp18VbEYuoiuKdiCI5UpJ/lElkiNttYaGaQYAUTjnMG8j9bEESyoLwqJP1UtFrbXhZ
         BKUggxeMNWQWJsIAToG1kzynvEVNJZiXA4NXP6354ViBGrJoYrP/7Qgi9o5Y/MgvBCyZ
         N/lMvPLUzPWnPOq9+xZLi4bZWhcCm9AqC3ogs8wNpTb4lsYCXzRZcy0wWxiNu0Hq1vSU
         d1199Rk37Qx0lElR6YGjuLHCGv8yTTx5Xqfpvuv0Bn1xKVuidbd6AHcefayZSvxRfkFY
         dPCg==
X-Forwarded-Encrypted: i=1; AKwUvBykOAcV++mYPkEjMJy6Vk6L270v9VnT8ZvHUB+YoPE8VBRhORxLOKPEsReLimEr4kFcomMDVqiSXwn+oe8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ysmss4rs7Q7zPfi/QNLWm1muFJq8SW6UbBaq7uUu8kkWU4oHg
	hE/oZxSWXmvQks+ZCly+hukcPk0Vu7DdsjcpI/FvFXADeFd94JJ5UTkqZxQ5fSXbcDuF2V6+781
	TAI436NkrCVipa0fjn4ucmvN60M94ryU=
X-Gm-Gg: AYBFou3RiImbV/9ykGJFu7zAxHpazYahv1lyyJVYItSkT7SH1Ed597nHMSC7jw4Wyi8
	pvwEiasji9q0R3J+g4r1VIHEAasZZy4mB9HmG0cRj8/W8TwJXoUQbQnFwBmvi1WJfoUsthoILyh
	2Jm+sDSWOziPq7SehcM+26YThwTT2yqLL9ZAx74xqgnD6QHntFsPLHobRYs3/0xwWsYciQ+hbx+
	w1DgNeXBs6heOM/nAS+Tz+emWY9QnqRRl9FGGzGU/C1kTfhrVrQ94KzwXhOXyrUqofA+2zxxewv
	8tpotFwLRX/7udnfKHdoGjy1wSCP93Me5/MbKv2K/jpV1SqMczMvKm/Bp3YSaYAXROOc8UouZqD
	yIhLw0D72cN2bURsRR105f1z+5VFaAimJ59wTPyOZJJQWNxbEWND428a5IseajYazKZuGsLWOUV
	5t87dVy69za4mO37iqBz+wUJrTZHDByywAj6k+izWmvLHioRMscxcV4M8mMthR7GzZ1WmhDlRoW
	xTJve+c24pxTbZkq9H86t1jmik=
X-Received: by 2002:a05:6214:2b9c:b0:914:563a:b3e3 with SMTP id
 6a1803df08f44-91ca4b50632mr206042986d6.36.1793675448953; Mon, 02 Nov 2026
 19:10:48 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101194423.44459-1-ygorotavio.sjc@gmail.com>
In-Reply-To: <20261101194423.44459-1-ygorotavio.sjc@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Tue, 3 Nov 2026 00:10:38 -0300
X-Gm-Features: AclHuK8GVbGdwEglxUYkowJRdXZFoN7I9cbuMHab-05gEXheEypiH8GnhkOCXL8
Message-ID: <CAMAsx6dCFZPfViXMWidbrRT+_xAN1ZMJKecU5yYv78x5gJhMNw@mail.gmail.com>
Subject: Re: [PATCH v3] docs: pt_BR: translate process/generated-content.rst
To: ygorotavio.sjc@gmail.com
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ygor,

> +Como em todas as contribui=C3=A7=C3=B5es, cada mantenedor tem a tem a di=
scricionariedade
> +de decidir como lidar ou tem autonomia. Por exemplo, eles podem:

"tem a" is duplicated.

> +tudo o quesubmeter. Se voc=C3=AA n=C3=A3o for capaz de fazer isso, ent=
=C3=A3o n=C3=A3o submeta as

"quesubmeter" -> "que submeter"

> +mantenedor possa se assegurar de que o autor entende completamente...
> +como o c=C3=B3digo funciona.

I don't see the need for the "..." here, since the English text doesn't hav=
e it.
Thanks,
Daniel
