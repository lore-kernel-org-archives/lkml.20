Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794817660;
	b=zwqol9PS0Ev45jLobcznEDRRLVUmssqmSjdF8E0f/istAm8O+IYYwPio9fjp7EkBrrQa
	 Z6b4JddXijnZmBoyBgodpbA/DM/xv9cmIJsmO+/A2V9WnTY+p8WKV3Dtq55TdzUkU5OrQ
	 v+mcSWuW/Lj+Q8tgikrFubI+1wdXDndnXSyZ9Y+7OCZDZsyUVxRJlv9F0v0BJqidEoO01
	 Ow3f8mjekJR5mx0C0NfnOwYA1HmQEaK+RZObFazXJ/cDD4XTR7l1I92xipaqZev+5SGr/
	 Y6ROuEzbDacmHDbUgZnN/Q9e2JajIRSuT1AE+zw5xA4OouEtcM0ZpQVQU0Jw30raVZw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794817660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=JPKixLqu2J0r2gKaA9vV2FAPWomClf1vD2pVgRpZ7aI=;
	b=MJ74nmvI18UhjSzTmHwQo656NlCap/UM5nsGOU3oVpTVKu+H66Hb3o03f7QnPR52Ppj+
	 YSNGMI+R9JK6zGi32aa20nA7GFlFd2p0YmOT1HJI+e9zNF/m+T6R2bKQjzjVYpu0p4Y7U
	 C5SWgwpYceD87LKo65Q1kasHJHUjUA3Ly/YNKabpPJvb58ufUgVKScaD/y31fLxFS/9uB
	 BMzREg1RJQZjqEbHCb+D+Ka+ZLGZG8NvHuTJLlT2cxEkSYnbAucLANz9TSnUUkRJHv1J0
	 9UfZkRySRI0VhzrNQEqEOKjMoSVEiN6cuHappYLnHAVyTIQWhzjATr3jdWULTcsxXKQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eV4fspfO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E103606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:27:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E103606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eV4fspfO
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2edd50e36f2so14215895ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 00:27:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794817660; cv=none;
        d=google.com; s=arc-20260327;
        b=nOsUFpCgQJjqio+U/RvQN/9eVTs2Ltq3TodjHyg/e8mZWtvz1+TlbI+HfIbAsrsp5R
         ClTFBisFJUWRvPbW18mfMGlc7eYJ6Ksfac7bo2bylDymbyqSNdo49ynayxriEeUe50JM
         9Dn4j8Wcd7sJpZO6XwEZtqkXvylCOF3BrvzycytZjyPKO2foVBZcAZTOTKvSqe7qkkSC
         gEi1NaXnEYslmoM7ZXHflOrig6ndIUeMhF8Nd0sHAL2LBlTVwuQnDeIVD5Cti1/trVTk
         RLkwGeqnZ8Aw0dNeHDHm5qol2P0R9ggIAG4WkOZoZFt9ad6tBq3vlXSOPzqRsSA57Y+B
         D9qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JPKixLqu2J0r2gKaA9vV2FAPWomClf1vD2pVgRpZ7aI=;
        fh=WAL+gnVhokeYFk9XslmkS+rVdytC7V2pWEttPYUk648=;
        b=a/ExEaokGDSfW8GW680+2jMsx+BR/cSm9o/mSOA5G5LFDLj1I1I+lhKuCOgH7i/lCQ
         Uf03T4XOymzmwgSoZpgHzq4eWVajTNnrhVh2mZ48o2Czj3weowP420w5K4fTuobpDK7j
         CZJIPSlnLJFTBraI7JtFFQ9gaaJYUuiJJ1SsoLH/WsEOu4i7VmDr6bDu6yrk6OrL9zeN
         kQNqVERfBJhBvryxSFDQqT1ZsKgHzmZMWeszQ7O56mbhN2zmq6w8Id0+UPEP1qS+J2qa
         7I66dhMhPHk5Xc93NXsztxSBEOyIAH3q5e0ATlfgOMBDWZwwfc3Gptat1kCvmix72QVI
         JaJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794817660; x=1795422460; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JPKixLqu2J0r2gKaA9vV2FAPWomClf1vD2pVgRpZ7aI=;
        b=eV4fspfOaP2Tturg+lzdotzqI2Gm0GnlSyvDrPWhQ5MuFzcOcT15MPaLUk+9dY8ZGG
         eg1MBKaEe0/L+9cUmBdW3g7Vs8LwDFGf9f6aTF3LMOSQb1YNO86FlepwJUuwAcJ54q7j
         VSkBykJ9gdeE4FG6JocH1C9zUJB1zYUtldORv/MOdIX+MMgxSDRfOiM88fxkYen69e2k
         +Se5azRHXTBBtMDGpZbyhFGDmHVJP+H55A6osBbP0MLpC6/ABw+PqFOFrLinmeTWZWmg
         sCMMu+GpdOZqC0ROyrX8tECYVcNcJZ7LORkifra47mCFvS/3QOMbziy1RuwXRkggb/gw
         qVAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794817660; x=1795422460;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JPKixLqu2J0r2gKaA9vV2FAPWomClf1vD2pVgRpZ7aI=;
        b=INa2u4Bxd5hfFwgrtr6kM56U+AwQikZM8+pBV0E+Gay0eU4KTy4XjLQmgSdUHzjece
         jZ/T26Q7fwppmdWPBsIa34P80NVngsxklR9kpoO7E8aVG9FopJtHaICOpUKuVPnWFEKd
         bOnchOrTaKa1FsmGGc0OIzGYoOpsDGSh9DPaTbcuMQku1vLMopsxcjUXh0uTwMw83S+Q
         QSHzT2elViKw7ULoebkVUvSqfdFtosx8H3/8qFhm16f8uaETAeTe+UB8xJT8m4XJJ4Dp
         Po1SempUsuX1TF37mL5HNCN9mLekmJeTERy5YPdRxdBXxRBLvJINWZRe7PFgVIJZupeW
         lhmg==
X-Forwarded-Encrypted: i=1; AL+hErFIyD139I2w1xtWS71yzRMxRUkvDcFt0TGeQkWl66W6OFNXwAnbzGWthhmROLA5bQ73dx/WHI6AXeSoE/M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6Dr5FyVpyZN3z6/CNvN2kChEhTfI1qoX+duadqKTjn/psaslY
	RQh30j4nhXNnoGzgqjWWyPj/PYDBqgTRwxYdKiZuHjCTYnBcdvgELg2dWlO6DodeKfWefPaOyxV
	8c4f6eyRsHw0+XpNOoS4pOsp5v5/QkK4=
X-Gm-Gg: AZFdTZcZSnnzPp4QLV8/AtlvIlQMUz+dBh0gul7YpmD09NR0lSCUsQOnoceBNDLWIZI
	PvBNrw17cPek2jGbi4N3taI7DIoT6KkaAuNQ5MhMaKb1NbpJrhmx5CznBpqEzyj2cBRvSeA0EiO
	yHLP4t7VOi0wq0U2gvA2ScqGAbgczwLCUf6bCGFVzMcxKKHdRX/nurKSob42AOsZqakVcEkrmG9
	dp8ZUYeEFTgbT5dJ1HmM86htVx/8xZQ7BYS2dwZde0nh3odnLmlWpNEN0edZ1n5/QD2+qnwGnxu
	Q5miuSlzPlkvipLJhpTsWtOlrltv79umFkIczLK3/n7pffohYXfgmDQKRoVI7/IyiQUkvYqG3t5
	JMs6GD8sjwvKkXz68DKmdGfj2Vr7ah4tBtm6LMTOd3X/OPneepeKjWihayIKv3renwKHhYT766O
	7R
X-Received: by 2002:a17:902:fc84:b0:2ee:2aac:eceb with SMTP id
 d9443c01a7336-2ee2aad0a49mr55123265ad.58.1794817659577; Mon, 16 Nov 2026
 00:27:39 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115143708.492883-1-eugene.shalygin@gmail.com> <a0f9b726-d877-42cd-aebe-7cd727a6c98c@roeck-us.net>
In-Reply-To: <a0f9b726-d877-42cd-aebe-7cd727a6c98c@roeck-us.net>
From: Eugene Shalygin <eugene.shalygin@gmail.com>
Date: Mon, 16 Nov 2026 09:27:28 +0100
X-Gm-Features: AclHuK8jSUb0JrTmkDLUkrzHNIZwBcVR0yyCUnDLxAyLPU1aaUOqfBrZCTrwjn8
Message-ID: <CAB95QASOtvS=XMYFn_RK96Kxhh9wydhfAK8Vv=OzBpHvGL92Vw@mail.gmail.com>
Subject: Re: [PATCH 0/3] hwmon: add three more board models
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Nov 2026 at 03:46, Guenter Roeck <linux@roeck-us.net> wrote:
> Series applied.

Thank you, Guenter!
