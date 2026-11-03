Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793748915;
	b=i7Qr71CLe1GVW1Ypt6cvyQJCUH2IOTrU9B3tdPy/H1pBdIWySgkLhWm7w4ZTiYkMVQSI
	 a4YhNfmJG0UiYmIc7qvXiSm70LEYpxrwza1l+kH2DOsLJEiY9T4DLYHCtOaUk1wJv0H/F
	 va4QrZD+I4O4kGGBXD9e/ePSCYBMzZ/gn3yuubi88gSTL7j6Gtfc0wBp3RyZjEcugOsYU
	 WY9hc2zfMXAoyyoYv6xXgk7l+YAfOWU7KRaysAnOixhbx64cbUGvVjil3uLXqLt0yv9+0
	 OXxWOW/5+ZuSoCRq7M5q8Tjuv94qn1SufrIlHEJitmgvdp2n2ZwImuDwxKYfcONAjeA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793748915;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=nKxJiX2hq5njbsbRPPasik6GSDqBNI5NA8L85r6kDpk=;
	b=x8e6T9J9AYlrEmnR+Q1f2UocXa8/GG7MOnr900oc0+5DF+01H118ZonMivKIFbC6egcI
	 U+kiRPRHFudTIk734izGhMvHADLTTsZEDHDpuFy2g8gziwUKzrOF5wBSH8qplMkV/dNA+
	 dAk/3OSEUFFOiVpj7kJ0IBnYpUG9FTTUOLNK/Qc+qQgMmp0+uUHtCPYZFqD9mEt7M0NN5
	 nZsHewnTORm1+oarYaz4JwvpRvt0SOcnJHuiAP7NLe7TeK4LYh6fuH0L+x9XvAn51l/VG
	 I1x/1jigOrLC1bgqp6PthPgS9vPhsCV9uBxfTbgmpa5ViSTIiUe2feaoYEdxVLUmZwQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VxTJ+4aJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.42
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482A5606A328
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 23:35:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 482A5606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VxTJ+4aJ
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-91c73c63116so1981926d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 15:35:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793748914; cv=none;
        d=google.com; s=arc-20260327;
        b=a0jBhkBrg6bylxhrDoXS6xTdK09Gk10TivWYKk5PkBQ8t4iR/UlEaakfLZzO1pP30P
         OnnfGCWAmB2i1c9TXurRt9kyaoILWVJcq3bKOrasHpagKewb9KIyC+fpXc292GQAQFAr
         fs91XQyUyxHNjTip1q6ZmNiONOuTgdICnWD8Zu6yIqvm2vp2ZTGaR7OaKq+KFtL+jwfx
         vvqBOO2l6lfjNT7SrktaGb/MRGDpsR1HLfJLCb0FH7a7p2nt8JNVruV4k/nZBs1Ob4Aq
         kxBGgXSeo4Yxul2ZLeVLk1HFTOYvHFelGDuX+i02VJF+eizqzySk+lHhHZAABTjA976M
         Sjgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nKxJiX2hq5njbsbRPPasik6GSDqBNI5NA8L85r6kDpk=;
        fh=sWXObwhXnWYwu+ONyIyyGFu7BX2S/SgpCE5awXtoRF4=;
        b=EJRTGi/umSaq3LKLc7mcpjLeNBZ+d8rfECo9hMRbwvLYsiYaP5dSPlj8FfTa4HqXQX
         Darn/f9XLqBwKR2jzUuq8fbnD5qa036XVTPJecBIbvsy9nKmtelXmq6pad4942HA1Td4
         SsS7lUk9jIB0RTEAGBiGoZcjPmQdLW9afz5ONMqkFtD6tCiUg9jMlOLnO3tMU/2k+oi+
         8IsQJhlxdel/+nGWlM3CTnBbpqs55cV6/khK59xvB7guT3owE7CouKPMVD5RjvYKnvXH
         Lnp7wvXf++BPuIvFaVAzVLy58nTikNK0lalkQe3X2mNW/7G8ouDATXBESoH4fZ1ySwyb
         BrGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793748914; x=1794353714; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nKxJiX2hq5njbsbRPPasik6GSDqBNI5NA8L85r6kDpk=;
        b=VxTJ+4aJ4hoGXlN0OEblscqsEQ8ZIHoVlcPvCs4QWOtOxiB6KfhsX9LnWXJ1+88jC5
         0JTCj2E5N2/3fs3r1e+RvaE9uLU+ENzivEnj2ssqal8mv3UOGemtl16V1KRc5jm/UX3C
         RxanjYA2i4+D/A+cmNKKG0E8C4enpHVo0ZPMBVFtUDmR5OiNohPGtyk0ZJGJRTkv93uX
         v7hCXNF/t2IwvnBd8lnfDtMCDVh7ykrqTzVw9MjHzF74JPrJRs78yx3S2MLuciYisYU+
         qAU9pf9YwEGQt2oG/HcPePOzm8xYVcD/4WEYZIKmHy4+NwBYlOcYGNmtY8HhfcBa5r8h
         1msA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793748914; x=1794353714;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nKxJiX2hq5njbsbRPPasik6GSDqBNI5NA8L85r6kDpk=;
        b=PiO1RNLw9SJfndNtF1KwZGTHmAVjKmOTRA4PBfyHxa26gFa9tg5weVVLiPUHxoom52
         b9fwd4p307j8GZGOEscRQDVJCleQTy+r9jqGdaEftBYBva7ihX1B0rB9GdTAAQzlj6/f
         T4qi9Y3lTUypUXC7ZCqgXFiL1qpUR7s+4FZ1wQsrGCv8BGVry71r9EHfgg1mOBXBk7sh
         TdQUY/X9rV79qfPy/woPwoqISM2k4g25i3gLXMznIVnxdjz9foXSzamEp6+e/BO0XrhE
         mixNEHoVOOteQvjAnJqgcClLqUAfOaguRc6z8KDmx1HJL2CW5hDM2ypyRJi73MO+zMVA
         dYrw==
X-Forwarded-Encrypted: i=1; AKwUvBz6gVgSz5IkX2NIF7uFnhTyUG8cK2iruBFFK5fDvazET7eKyamihWo13p3eFAdgwNzb0CQz/q8Ol+tZIWA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4ySC+J/xHtS9vzKx4QOiXXInDwU8IrWq4x/77erUh27Z+Q9po
	e/P/ARbTm8hkWApXHPKt8StTxVeFX8Le7y7CQiaoYHcnNdJdGGgNJx7Eq5lGwoP4nZfTY+22N4r
	sImPWuAD53KHHKF48gvpk5BYhBLKkymw=
X-Gm-Gg: AYBFou2tq34gDRO7zBfxAYFB00+9qitrHgZpsupTO9yixA5mk7ivkGr/jONVx2OuJBy
	MPLT7VhrY3Y5QeKp/DRVQlAjGJ8AC/BhTYhGrR3H93Oe/pTRaCH9+u8R1AOkhj58HimSF/0fBMa
	cSGVwyJ58K95Fk8+XSjTdrEJ4xJSj5FWMK7uJpYABlhPC1V7dS2qubtXJM/0HRl+GCSI8LxIMIy
	trpA+pG7bYCFSPPcAGkH5eQZUxLgrUpEHkZATu4n/HzwFzNwQG3kyyIhWAzrjx8Oi+vc/6Q67fq
	uYxtwtCMj2Xu1GssobyZ6LrDKbwnsM7PYzj2jCNisQ+XKCxelwOV4VFFNQDBrUM0uVATwFRWFKL
	HqTmuUJssGaISw1QWB6DMfIzW7owF56XevXRjrl/Pjj1feP9NVJDPrdUn/Q6gkM5DEpOX/QTJm7
	CFAckNNMpjKKAhQH0S0xynu3XW6qIQ5EmFMwAr9nbfJj9JblG1FFtmd0kAINYtPn0BU04KW2bvg
	Y6QjcYNmjbFwI6PbwAdivNLSA==
X-Received: by 2002:a05:6214:300b:b0:91c:7f1f:2c9e with SMTP id
 6a1803df08f44-91ca4c1bea5mr239516046d6.55.1793748913967; Tue, 03 Nov 2026
 15:35:13 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-keyupdate-rfc-v5-0-de1ab90a88d5@gmail.com> <20261103-keyupdate-rfc-v5-4-de1ab90a88d5@gmail.com>
In-Reply-To: <20261103-keyupdate-rfc-v5-4-de1ab90a88d5@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Tue, 3 Nov 2026 20:35:03 -0300
X-Gm-Features: AclHuK9j19hhkEsExp91lQWmWztn20ZPkjs1fSHVQiEkHUWk4-OotQ7EK4u8uqk
Message-ID: <CAMAsx6d0kMWT+QLBVGnGjfbEUDuOfrBaoCaizMNKZKn+NmkG=Q@mail.gmail.com>
Subject: Re: [PATCH net-next v5 4/6] tls: update the RX key when a KeyUpdate
 is received
To: martin.belanger@dell.com
Cc: martin.nvme.dev@gmail.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kuba@kernel.org, sd@queasysnail.net, 
	davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	john.fastabend@gmail.com, hare@kernel.org, cel@kernel.org, 
	alistair.francis@wdc.com, corbet@lwn.net, skhan@linuxfoundation.org, 
	rdunlap@infradead.org
Content-Type: text/plain; charset="UTF-8"

<devnull+martin.nvme.dev.gmail.com@kernel.org> wrote:
On Tue, Nov 03, 2026 06:57 PM, Martin Belanger via B4 Relay
>
> From: Martin Belanger <martin.belanger@dell.com>
>
> When a KeyUpdate arrives, kTLS blocks reads with -EKEYEXPIRED until
> the user installs the next key. A kernel user such as nvme-tcp or
> sunrpc never does, so the connection stalls.
>
Hi Martin,

Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>

Thanks,
Daniel
