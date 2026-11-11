Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794399633;
	b=Gpc9wNb5WXm3RDM0ek3omuKItGll4zqzoT2cJysgZdGU77XbFUX0V0+Nh0wEYKsJyAMW
	 R/KgAPU9danivlXREMa3AQvbz+hAPBMvPBHCYFjgbwLI9kTEzY1C7aPZTy2YuF4qw/4Gg
	 iGAzxEmJyrPoWUKIYEyTe7C5f60rgLdKSUzEF1fXuBog480gk6iRRqSM0sfB3THy3wUyH
	 WcZhZn4QjpN+x9y7i5Ul8M6myayA0yMOBFDR/66/SkXFCwkEiJeCOVRe6AbGAx2tVre4W
	 iyK9nSOoPKZskPBX3rHU3Ha/x+8o5uFmXD37u2smZGyvEJ+tndPkZnKnx38Dt+Q2V7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794399633;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=cBBBVEGbUigmAVKraBU8HoXde7I7HCP/fQU5YOmGir8=;
	b=RJ/s3ZKUTVKAq1SFTRyzzVgxk06Z7TFTaCcNb7j4VLGyzA6C7CMiSlCiVirAGAOlSvBa
	 QyxFRhdMBBj5jlKRqTKc4v8gN0wr641WLjiQnQydz1K6ZtsZ1yTQaIdFvqcE3IzkiN14y
	 2cRlDUuOWnmDSwLbvHEIrDeOF0N8v0WEe6iE0mcN9AK5VNFsoyGOXGPxTZMk/Hlu00m4J
	 WdU9Rs1xuinSjZxOFfd0rr0JvVJHWJV+u3gWhRyZhZvVL6rECmp8CsDJh67QeJmhQadrP
	 mZ0Wa6dGllOwRQGWmUE1hTP1R/rFeEYjnvyw4AvoznqwkERselkdD/NwkDCHYdU4SFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bBnKSdIe;
	arc=none smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3E8606A336
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:20:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E3E8606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bBnKSdIe
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b3b31a6290so1943187b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794399627; x=1795004427; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cBBBVEGbUigmAVKraBU8HoXde7I7HCP/fQU5YOmGir8=;
        b=bBnKSdIenrrIOZGpvznYF3HyWtY3D/ihG7DGFbh49iO3oUIOt6jhmKq0EgxOksIrF3
         fzNHrVKt9VZXZf4f6qlEtiCyWhmMdNdNrG0388SeHDBIpe9MlwucfPziPB05eZVz09xs
         HmDUnxL9TDO2Fu0KkUjNek+ahuwF+owaTGjJGqXScglXkW9LZLei28vXLg53QAwq6SaJ
         bD0HXIYVfh2+jDCSkzqm5Hz5sDy1hffDDFGhPe7lu1SYj9O+ZsLOj41CRYzEYQvgC2Lm
         hutjfQOYOies+duvioCraOK37KQel6g1rXUtff2z8Wc9I9qbmGhmwEHW18ww8EI1WpqP
         Aomw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794399627; x=1795004427;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cBBBVEGbUigmAVKraBU8HoXde7I7HCP/fQU5YOmGir8=;
        b=nQkeK8AVAncYHj8Iu80qoxulZBKVS+t45hMIjERPX4nm2fYXh4krOihgiGVtBhf5EQ
         piR3CkX98aBIvh7L4/JJ7nOVCiYzvV0qYZKX8RJNR4kpN6YNAN47KzpJNpcAjxYvFMW8
         ZmaPfy+1lJMm9U2HcpwaHlKxbtJ1yp0SisILISwX/onymfNJJsMIHZXDdBb7NYmvg1yN
         OgccD9Yyyi4qykN7tX3MM9Ppc6m8lOojP/lxfr06jfJlgri5ENRjZ2b/0CY0SxyP7CRY
         UhNOCsPPMAPzfE9qdaSbPi5kLm2DF1VrM7MB92suzcDl/L+VI/tMMH6vvU6NK01zz1Qh
         I6Rg==
X-Forwarded-Encrypted: i=1; AL+hErEGdCoJ4erhOgDnIUBfvOQEhjJn50czNWKKz6ayWvUBa1NfCpWZwse3kw1z4VtJ6DLw3OLODkzUGzM0WbY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Acd6Mh7f3uV84AFLs8XoQGqxUhJKgzeH2Vstagjf2kRkgDr1i
	X6JZOT6SnMoVo62ahhHMoyzUS72EFyk28TBxLdsQh9IGsrePQGzp7oeL
X-Gm-Gg: AYBFou3Wd076K+IaE5QjCitIL/7vScICJlGv0wUGPTvgWwkop7wXlpldsYN+pHGVnLv
	eBC0II3O/YMVLv7BNMjBMqke1jBzNgAWRnZnWp2HR+2vvVW8n2h/cfGDZ+Hj6fA/wXelmckwqft
	czj2Q9eL0ILNL/2gQd9nhLwedhXI3tOdxJQdkRlYImUzv5skGNgAxRSaf1jJPFPonnSCtNahZ4I
	CaW+1VTTjjzYFv1OhNnXw/cXLVP5oEKB08DL8Tj43TxEAVCh9eEXQQKRC0Wkp8WYu4oVOzOkgYT
	/1+zg/LFdB3e00TAeA4XL/1uo5wjIVidcDH7Lhg7C+/3aZdX0CfsGLgVquCgI+zzMcZzJL7Zq84
	VGXWie7ICtJHArv16w1A5T01y5n8DDS5Yw2lOvzJMb13n6PbMF9v5CfGbApyy4Nvkavw793Zdnr
	Jy7tebS6uXqyG+gUwTxXc7ry47WJHl4aOBdbyga1oPkkoP5YbsXJHWgUFPKHs1hgiFR608ZeMGt
	3ngaY/alS5+4J11n+mXenM8QVRJlLydFRHSqMALNEUMhd9NnFUkS4xgHYqe1nMsSvi1lktf0eks
	ZRsk1T5/CPgPrM03+AvEKpfzRubsi8yI89//QztjvjJxMC6o/UlS2Kn8E2PFDK0Sqijn/zrLKIt
	iwCyLbq0VsIR2kaZhyBmsf6au6Zqt1YWUhKJUWDX+QsKNVFSzE0uNYE6npfxSJmN/pr88YBj4wX
	03CLs1D/qXd2j/el/2xrfU
X-Received: by 2002:a05:690c:a849:20b0:8b3:344a:4f44 with SMTP id 00721157ae682-8b3a817a55cmr9874957b3.62.1794399627423;
        Wed, 11 Nov 2026 04:20:27 -0800 (PST)
Received: from MaquinaLab.. (189.27.147.77.dynamic.adsl.gvt.net.br. [189.27.147.77])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3933a165csm42716417b3.14.2026.11.11.04.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 04:20:26 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Enzo Adriano <enzo.adriano.code@gmail.com>
Cc: linusw@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Andre Przywara <andre.przywara@arm.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] pinctrl: sunxi: use automatic voltage detection on A733
Date: Wed, 11 Nov 2026 09:20:12 -0300
Message-ID: <20261111122013.35133-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109-a733-pinctrl-v3@gmail.com>
References: <20261109-a733-pinctrl-v3@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/9/26 21:11, Enzo Adriano wrote:
> Add BIAS_VOLTAGE_PIO_POW_AUTO to select auto (01) in every field of
> POW_MOD_SEL at controller init and skip per-pin voltage setup.

Tested-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com> # Radxa Cubie A7Z

Tested with the posted prerequisites and my local board DT. POW_MOD_SEL
reads back 0x05555555 on the main PIO and 0x00055555 on R-PIO, and
UART0, MMC0 at 3.3 V, R-I2C0/PMIC and GPIO interrupts on eight main PIO
banks worked.
