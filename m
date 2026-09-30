Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1211E4DDB54
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790777631; cv=pass; b=kYBHSVrCkCcmqLykBCQoicTh3aFxpAu/ijizFo2Nf6BXe9kmm3eXLZw++8okHVAtswjsNUstJoQ+Ox92lT9I4yRSS7xVaWMuS4pRjOC9kQPCwagTHZyK85204zBKeVDZM8FNGf656wLEKBkcBzoc97lwGB2A/EflGVFcnBMxryQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790777631; c=relaxed/simple;
	bh=ouiP/s84DTBB3CgCBBKgMRlCvmNQLtc3ruMbeozhkFE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kvIvC7L/i1vo49KuFGjKhH+3MlIejWxyfPZq77YnoyQjwZlYWPPGxfdXaNCl814nPKzLjecb3FW4pPe191ikZhi1FxmLCQPRSeF99IbHFYRhJOG1W07u5jHw89qFIAQwjZlvWePfyXOCC3MDamgGVVLQXZ+M7UfjABcKoI6sisc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HU3JuVoh; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HU3JuVoh"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5ba31af701aso1581437e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:13:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790777623; cv=none;
        d=google.com; s=arc-20260327;
        b=AT9/TUD/5xWqCmSoGX6zTgPfueYfbSqNHpEM7R9sSHDugpIyQNFgDv4Kpe3Rg1ihL4
         KX+4Eh5HSrKHKb76GkTXcL8DR/1WIh8TjLO6NbWiUihDyh2ol7pFoByunC5D6jkihuIj
         +GaYQd6EaU8/ycZlD7d5lgw0c2KR/f70/X6BiCPO+isSdKPLDgBTKpgwINubg6mSNSvq
         xAYbwtQLkwvpjHVeWrbnN8uN/Sfi5PHZZD3x2cttJ0Rl7MvIz8NBkzZz58+6l0GuLJuB
         0DmriQj3okYqdErcM2owQjds1nAuVENk7q+HC8I5tkPQijUf8qs1Ml9zXWJ40d1W4vnP
         ZIGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ouiP/s84DTBB3CgCBBKgMRlCvmNQLtc3ruMbeozhkFE=;
        fh=U++3DZg8hZliseVxYDAyznNtdZNN5fYc5oFsU9Z5sQM=;
        b=ruhJQEum0Bj9uRQt8Y2YGLwFzglOS3LuKRCfFjiFwOcA282wb8xSWDjLrUK57G9wd6
         /chsqbAf/JONTaJn2+8xmWDRP3ESaB0e75Tgozm996CxWo4UIeyOupRh9lcN1J0f9ZrT
         pX6ta4OjWmPiMB40Vy0RdGwIn4B7qWrpoq7SfU0S0UL+Vj/8r9ZBfVGLV+tqhlm0Nef/
         2KRHSDmhnUzxlrUUV5szKYmizyzWMnT6ILt5SlQXrSwPd4IFqbOADvOd81afA3ng9+RV
         Po6HbAh/WYEOKgAl6jrmNYFC9lt4HskPg6UtoRWhXt6nj8Jraq/h82AAyjPDI1W5XUy4
         nU6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790777623; x=1791382423; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ouiP/s84DTBB3CgCBBKgMRlCvmNQLtc3ruMbeozhkFE=;
        b=HU3JuVohcapnkuT8TmF6+QOx52bOpVZAIps9S3IPbbRkpGnKxCBUKjQ5SbyfqArTOW
         C3tBoIfVqFT/Zgk16U6c8b5ZL0PdV+DKRu03OKT53E4v3wwsuH+s99FpvD05bMUSMQWK
         r1HS4HOk5yHhzYyqNRbXvHUzAKpAr76Jd+aOjvdcjzfvK+GogJC9lRbg5lmmEU5tWvcC
         4g5bKAZP/3taB8vETUKvANeLgTnSf7S3LuSfWVqbTR/3OlYDZ0+UGhkOoK5S1JGyXaVb
         gr4DU4amAbBsMRTFQcDr6truIB2LF7VRMohFAcHkSR8Cgbrdma5dDhj+HmILILEUiNCF
         FVEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790777623; x=1791382423;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ouiP/s84DTBB3CgCBBKgMRlCvmNQLtc3ruMbeozhkFE=;
        b=p+ojrTNyYE28yQA7odQGhKy7OsajuONWlguG38uUoUy/zk1Uw+c9ZZrCctROh1CpFq
         TbEXt5qIXm+vxogCCgng2ZTMo1g2GO11nmgJpA3N7beAjdPdq4Jy4R8Rl/C9j6vlTDhC
         ywKNVBjKIgEPPJ8yv5lY2wVecTldbFygFFgfcErjGhul/VPbGTq2TPeBXLV/D4ontwjz
         riH8j+9X5T75D+fvR7lxru3GhPWq95W3FVX6/AnCGnGokWj9QMwjL4pdtn7+40vd3cfU
         USscWq3P6EsJz6uyWgUVCXJbhPscseZ+oBaykodXvN79XM6JmygxXN+WIVdBUbr+8Ov9
         2zfQ==
X-Forwarded-Encrypted: i=1; AKwUvByxGiFQ8ULIz0cOYiTrjxJHUAt050G6nRdDbU8IQOclLSKJKwEIRaZoOUq53rVl0cv9mMRQ/w+fD7FH43k=@vger.kernel.org
X-Gm-Message-State: AFq9FYLaRPGS+5RN/70MWJeD+bQ4cCbOYovvPoJSsOSfSfTmHTrr9YGB
	oafnr7YAPkK3BzTtQzdpXjM6KLDhcBXG+Xk43K1SmBmXoYsBUESLDYN9meuUm241ggScvHwzt8y
	KrntDD2abGv4449gbA8ezMhC79494v6I=
X-Gm-Gg: AYBFou1RkI8JFXLX0PclEbC3zoqwqpugv+1tmD+i7dOfSKChJ485U0WeV5mnkuQ0E53
	dsTesZaLvn0szvED2EOwIOWz0V2AkzP6DaYWA/6+p2g4Kimceft3KN//i37DQ5KLz3TFkU1yvgN
	x+7kFfj2ASZtnF6z37rmu8uFMwgicWkUD8V07Qk2ZSqHfhfSSG7vX8g1VS6YFajVqruWWRx/JNL
	mAc93C5UFf94L+NFLCOz4FIEXnFCu8XlrwkIqkD2ojnawTgBNAz9XbnUr4J3z1jLWleoXf0Nkfj
	QAJPUVc8CzBn9xnH4Pfe/mrIo1kMDejxU3LK6eSZsUYwr5oSSrv2eJ6yi55oiUBVueGn1ZbAJ6i
	r72MvEunPkaJi1wbpMOLE6I7PUAKoJnjAOfC3jJHU55Je
X-Received: by 2002:a05:6512:6884:10b0:5b8:f472:2e66 with SMTP id
 2adb3069b0e04-5ba405e9177mr509267e87.25.1790777623133; Wed, 30 Sep 2026
 07:13:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930112842.21323-1-sigefriedhyy@gmail.com>
 <20260930112842.21323-3-sigefriedhyy@gmail.com> <235a33c2-7138-4815-820d-793568757d95@6wind.com>
 <CA+7S2v+VaVYksOpuUKzo+DoWZ97M_XKvnMr8cCcgwTkrOxsvEw@mail.gmail.com> <7d8f1378-d5a6-4a87-82cd-98eb794f85f2@6wind.com>
In-Reply-To: <7d8f1378-d5a6-4a87-82cd-98eb794f85f2@6wind.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Wed, 30 Sep 2026 23:13:39 +0900
X-Gm-Features: AclHuK-ds-pquglK1wdrfnVLrVe9lO-XLy96JgNFg8PNJqutvY6kezkk22pc8Pg
Message-ID: <CA+7S2v+hEK09FDv4jLrp3yGLxeFMde0j3FJ-TBytLxQ1Uoq=dQ@mail.gmail.com>
Subject: Re: [PATCH net-next v9 2/6] net: change netdev_hw_addr_list count
 through helpers
To: nicolas.dichtel@6wind.com
Cc: Ajay Singh <ajay.kathat@microchip.com>, 
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, "David S. Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Donald Hunter <donald.hunter@gmail.com>, 
	Eric Dumazet <edumazet@google.com>, Ido Schimmel <idosch@nvidia.com>, 
	Jacob Keller <jacob.e.keller@intel.com>, Jakub Kicinski <kuba@kernel.org>, 
	Johannes Berg <johannes@sipsolutions.net>, Kees Cook <kees@kernel.org>, 
	Kory Maincent <kory.maincent@bootlin.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Nikolaos Gkarlis <nickgarlis@gmail.com>, Paolo Abeni <pabeni@redhat.com>, 
	Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>, 
	Stanislav Fomichev <sdf.kernel@gmail.com>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Willem de Bruijn <willemb@google.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Thanks. FYI, please don't top post:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst#n336

Thanks for the reminder, will be more careful next time.
