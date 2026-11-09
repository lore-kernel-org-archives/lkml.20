Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794267838;
	b=lBgKNMdh8TwuSsH+ZY2vQdlp4Thh1Ssul1n/xlt9j+3OUakyH4pC4iVkOsJMchYCTJMJ
	 Gsft5omFlgqb3H8x0SYk+Wp36syJuMfNlfCaoQt7wsK9U2H3+x3jm4BlKF/ehEFRwIZcm
	 gmCQchVttUUCjsF/eA4FtNpZEhxi+bCGoPyb3RM6HaS2Kr3xI+MSOs0NSTaDfSNs1bdSv
	 9CsnijVE8I0os9pYqtEGqee6ruHS1OaptpEH2jDF4CBNnDqOiUMxGbBiGu1OVb9yDCPns
	 avMZSdNRf5ZtNlEwxuZyz0k9u04aWJoCEZN1L6Qo6VYEKpyC+iYmZI/1XNMuPtkO0cw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794267838;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=qbotr9HsG4F8SOuvQwl9pplgEz/kcu/6H9npIEXtgH8=;
	b=XyQRBNaa2geCvZJKNLbrmGfj1MP8wHt+VWmPAlWs2W/nwf2dbKTuIPmiA0MvOdsqKQsF
	 2FaaVPsxUFluQPmhfn/NL+PJwayx1QW26N0KCzC0WT2T3pd4g1HJr1Eip28/ophuWotm9
	 VcSR+2UhkG2GLem8ymZrQGjiclASW9FObEjN6yTGjv8aQcbbsdNgeRJZxt9fwfmPvmRux
	 +Z31G0VQFv1Pe2UuVhbRBjk4RhgRpRNNeObj3RIpdxe2l7Fo3G9HcFR4QEFN5kY00QqIC
	 YQRHtP8IDmDLU3ZMlxvIe61ZSuJ74EZ1nPo2SKRRBoJYtJAqARK8/JCF2AVqtWF/4dQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p8G+mgms;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13FC606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 23:43:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F13FC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p8G+mgms
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e8da6ef7ddso8629395ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 15:43:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794267837; cv=none;
        d=google.com; s=arc-20260327;
        b=XWZExCnuflBmFmrQW3DzIks0mLp3xYE+WhoEw6JRAbkK1kL5hSD8kXcikcCSebCZ55
         M/0DR4O/lUW36bEswbuiqq3HB/7G8g3fWc8eRTSUywbf5GmBoLwBAFwmGDU9nkyWu2pA
         +TK204mT9qMF5dM1gLn0VKyVYB2T9m4rE1BT7UA1AyjV0j56TreDDE4hYX/+pcwiLkNh
         +1p/qHSKA7NNhkj3yeOdVkvpcHiKxZ5D7+UPZukmrLLlA9wnyOYy1HfeuZlnfF6Wyevz
         hYVjznVnWWIb/PnULnnnPNhU4OmFvLEKd75eO1pOX2l6vnEI4z1QJijuvTtGP4EnSYzW
         UjZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qbotr9HsG4F8SOuvQwl9pplgEz/kcu/6H9npIEXtgH8=;
        fh=EPOoXIk8xGkHPdo9ZTM3RdLaTVwVcSebzomvkJBO7iw=;
        b=lgLooBO6u6d8WWI7AdwD/90Ue+LmqUsgqQVLHmxrh2ydfW9JUEddJ7AqmA50is2lF5
         8GBULzvPxIxUOqlLwASh1h/XDaEXaYtSqcJn0tLpQuGE0/wWVaM/OH6jcMxVhy3IlC3f
         UxzW99Zkx0QhL7zLmbrzB6sPt0t+gdEn+l2jeRf4xDZgqRhLZly+NXaITWslJl5Ju30K
         zvKnmgE+Rtw2yEX6cHi98m+v9buixJgdWqnInd2/b2K3GqeP4Ykw2k9IYPxgfNLYDiOR
         7J3SRGtTMxzSrZbJXQG2sCRaFEYooZZl7fpuhRe4DA3zNAivBG79Ysmjy8meZsqtJPGE
         0rEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794267837; x=1794872637; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qbotr9HsG4F8SOuvQwl9pplgEz/kcu/6H9npIEXtgH8=;
        b=p8G+mgmsN+1+yeTonrlxR+6dJybCBUs9uYgHeZROgvnKgAHjEsg9S5W4Ej6nai3GJB
         j4fXFMRB+8ualdi4CI19VsIgnnDaCVJPQCdc90tpI26tE0XdaIAmv9rlFrCAOhWsmgCY
         tBU+3PR3rdsxWKnnvUU5aysyDghmJs4y9UzCxqU8iq09FakGCC4RfzmqBF9PMppDk92s
         YwaKfYHx/h9ggzQ4l8XJgHKlcuU0bPJnC043mpB8gMFdS6PVOv3IjP9WaQyOL/6oVfj7
         FRNFaoP+10Geai+I92YXUQz8Sw9spNE0q2ExXdAcPN+wax+MXkESfQcmtDhhLOdUTg3D
         2tyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794267837; x=1794872637;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qbotr9HsG4F8SOuvQwl9pplgEz/kcu/6H9npIEXtgH8=;
        b=wmOiPQlv1w3O+1lJ+2tI8Q9EdZ6FMQ/KtaszauqKvUFOVkYJK1Q84Rn3sQtLBgnppk
         tjQTXTYM53vUH/KJmMDd0jg5as1aDOI7itgtAbLAz1+rK6LfkEkCCOE5gvOQzuCmoQkh
         7iG9XlGgNyfbR7Q+YSuVTqZJ7CWOImIvKdubcLxeptOFo3+PUruWjzEfGq4NgCYc8W6a
         YDmwTR4ChBj8H5H6q7MyQfP7JoOpXuuZEEf71E812kqgvBPUsihJSn7kbx/jxJ+zCUhg
         JdKgP6UdQixUNZXTyow5IQaxER5qkgSouVwd/pQuTv6aZarW9YKpnCOB1ffl4ZFJuaGq
         ldFA==
X-Forwarded-Encrypted: i=1; AL+hErEFQwX/dkgND7nyKIvbehyeA//xhL2OngxCOiAMm0ep1hyCms4rZXBMtRgggSiO0wZKm1CYyE8dDFt3Agw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+P3gPT9lgQ7PtfORlI1H/VHGQlBptt1Oewoahcxx9dH5B4w7J6
	i9YrIt5jBJ8c6oOrAC7cxvu334UZUKOmTyFtdLNxYukiRp0yfpA/2xICtYVbVf9he5HZMK0P472
	GRHsHbm6pos8mW3vVHd73mhRMJY6JIgg=
X-Gm-Gg: AYBFou1OAZwxQDFgZCTJbfezR5UddMWTCUFsyaJc0VLhtBRtACYmdCFO0SxL2qkJNiF
	5oJXMYIUq/AW0N1NzipV2JLiczdD5FK5mjyal0vu7YIFbQjmDwsoj8d5My0ayWz8JXHRxSxcO7p
	zDS2yC8Cw+hWU04NtXvo4jb4F1f1CEJuBlVS8X4gld3qCcJBx6yEQoGrsTv3Ucfwe6afMeat4b0
	B8w23KYPV5KoH/NslgfQx3+IsUzs1bVFZntxy8k+qadiSEYbfcwEbFzZGYqodhfr7JrcADm3Vwv
	qJdSjZ/G8V3kevItqb3ZN0aWcX4INzdP3BTQPSf49kSsoC9k99fPUlFpgO9oFMIuI/51XyQzdG9
	PibnLGQX3FjwBedySCfIctJNMflLCEqSSukB84u4F5iT6rdXXUk+CLdUbMQv55XUAznGFn4vQCT
	0houZG+oUTO9C88+s=
X-Received: by 2002:a17:903:3708:b0:2ed:4c7a:31e4 with SMTP id
 d9443c01a7336-2edb8f95b9fmr6762265ad.1.1794267837146; Mon, 09 Nov 2026
 15:43:57 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1785183549.git.allen.lkml@gmail.com> <cover.1786384168.git.allen.lkml@gmail.com>
 <auv5LFaju515uVLM@parshuram>
In-Reply-To: <auv5LFaju515uVLM@parshuram>
From: Allen <allen.lkml@gmail.com>
Date: Mon, 9 Nov 2026 16:43:44 -0700
X-Gm-Features: AclHuK_IjqiX83c1DJy_vDMRHUU25ZAygSTNNSWEu7_KJWWcXOL9A8rZkK2Xack
Message-ID: <CAOMdWSKMJXPHoKosF6HrGd5o0CbdxeQF5qgCMSvnZqjuNMJubw@mail.gmail.com>
Subject: Re: [PATCH v3 00/34] dmaengine: migrate channel tasklets to WQ_BH
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

HI Vinod,


> Hey Allen,
>
> Any update, I am looking to pick updated patchset for this. Can you post
> v4?
>

 Almost ready, will have it posted early tomorrow.

Thanks,
 Allen
