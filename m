Received: from mail-oo2-f39.google.com (mail-oo2-f39.google.com [74.125.231.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39004497B74
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.167
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790768059; cv=pass; b=DShtV29Ex2LRgzDX4me7xtguDmgMTwLXcXxBxohHgDWvXach2VoqfAJxNXCa5JYMioIzVi6oKmJcS+SPfatPKZkwZRHQdLhKNHDOi6jjU6ruls+p3e165iRPZFVKR0aGlc0atwbf3pA2YNZvdK7t1A/klp5fMVXX7adjvRMQNFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790768059; c=relaxed/simple;
	bh=aYrSFshnjc1dLaRx+4fcphgUxBfodGw4jGAuwnmXMOE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H+yRvU1fOytEIlsO/JAMeMM1oGUdvexA3RZTNr/KGK5LLCjmr71HcMAGnv9vdx6XNXXdHRMGS2IQYWi7ZZ2/KZRblb+vGt21hn9aEwiJuebHAzaKkr5vcLE2ZrXxVNrvgp8V17AKF/2ZmueBLjs/AFMa2hGLJxBl0mzhBMoaOu8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DSLEWDCx; arc=pass smtp.client-ip=74.125.231.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DSLEWDCx"
Received: by mail-oo2-f39.google.com with SMTP id 006d021491bc7-6c24d19ebcfso2803595eaf.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:34:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790768057; cv=none;
        d=google.com; s=arc-20260327;
        b=cnLWL/UGtXUl4skJ3ThE96KSwb/xCFY8Eg2u/WxBbJa/Qzcq1PkvY9WgO8Yr4i07eF
         Bm2tof/Exc9lK8plvDuEepjTLRF7wS5a+38+VH++8R+MJMouyHdXmEGtEUtnullFBpsL
         kGWSyADoRfZ5HkHwFplPpPuAbzwGaqEfSScPh5z12z1TdUIR5Q7ZyPiPvDIjB1IeN943
         /N05jbRlM92n4K5ezWkY/QUtQFgcXPxdghSCccHewLQNeUq6eUgQpvpnFra2C68NDWcv
         i/KG5xfeioHjSKOMLNCFx1eFNJj25eCyyOuIFbGQKg+Wo95hCrHUpKM0Mrn20uUUN2jC
         LY/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=srVWHQ34fmEZwN42zGAC9YE78eGz/CHZFtfzts5HK8c=;
        fh=RjaaQTcw5At53Yt/TJjx+gJoZae2EwUvrMoEyZaFL8A=;
        b=lI8S6/8itQh/YMe0w2eQxAfQU0FNy20WkhI3GBU6bQlf6/hn7kueF50c57TZUS9r/N
         UaBvUMdjnJT8v0N7GgYr0f3p9oU+vF8/tMvuBCZE1z+R4Qa/jPx0ANsxuFrS43q/xt+N
         uAZO13O3FFkk9ohkrTWPfGgd2Gv8asXoDc6W0edqJlefDNdOVJR2NFYDeuyFV0PsE9OZ
         NPCVgwWJ2jUQRKS4EO6BG8UyrMP5Im+rQkxj6k6D/58Zb8AR57qxYUpOMtsvk4+y/Mbv
         AtNU/51LecQThVUSdBSdnKJBH9RSmp0dnkhEkwh1p5VSulZkUmya2e9C5WM5bm/h25Cq
         I+8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790768057; x=1791372857; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=srVWHQ34fmEZwN42zGAC9YE78eGz/CHZFtfzts5HK8c=;
        b=DSLEWDCxtXVZ6Dk0G3hXOPk3okJJEQM5h23blJMnNu9NPvswzaOoAEnQIpCfD+ZRYO
         DjZHDLdaQAohjSgkJScxpPeRvjDhBJc6FjPC3nKYvd7e11WN3HNBss3jCpimkK0z93o7
         tKKbym7+bvU/JnBwZOQsphJBY+ZsfpOCQA7PspdGHBeXCsS1WTYUrM1cN7OIuVtXRCu1
         ngddTig4H2T7MnThDPZrtxN4IX5tIf88kZVTUMeits1Z0Xv5IEG8vsJmx3RC4iOSn6mL
         R3rFN3V8JYM9tAjcy6CNEINV1RcfZDYhAumKclDHQbPhFEmCCiRzRMgALTpYThBDv/Wl
         DUxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790768057; x=1791372857;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=srVWHQ34fmEZwN42zGAC9YE78eGz/CHZFtfzts5HK8c=;
        b=APbeQarwycv9rL5pKB462+KtwEliosc/VLxh4LplzuK/Zb9w4XjaMeaJxwRjBDnAtS
         HovMxEAkneKAnUZJ/mucjsV710Rd5BJIQWyNicScAww6/ZRDdv8b0LHtVELavj4lIjR1
         BM8nSvw66RnmdaXuQ2dUAQXOp2lSLEsOqbdT7bC6v2kg6YQTx6JQNBegAK96IciOe5cE
         Ybf7NTUC1U4ishvzoAnDCU7epvYjwk3ZgO4Z2iqSTp+R1OGIVzfDpfVbTAUJ0/KeHfCo
         i7pDc1cYAWTNTrvGLD6StdHrrRKDgJWz1TgRCdsPX8O58vvzGSb1zTY++GrEIX0CqySL
         /Wng==
X-Forwarded-Encrypted: i=1; AKwUvBwKnYiwCjUiTILQkV7KudzSr5UeUCbOfBCBId2e2OQllq70z8uyIO4NBlwfHrluMZ3NkjMZEMHpSpcRMac=@vger.kernel.org
X-Gm-Message-State: AFuF++kQ0nZIYeQDfB7UzPFRpKyIHU6Bfu8dyeuxyTqxuDJoE+PfMJT1
	B3o3HfxqLEHBEwSHohhiboaOOiShjiF/Zb6ChBixPW7KSXvKY1wcx5bpzCp3YO0FudIprNbF3GH
	7paZ1Lnx3XGYuxa1tdDZt2otIvEIFa6A=
X-Gm-Gg: AYBFou00ojJfjRmipir4M5E/yVD7o5wkagXDe7yRc8wPTMLfVfirNNDueNCIzlpcio1
	7YRXYFSfUFCUV6HZjmZfd0z3jxIee26b2HDR3PtF0Sx0XppXaX29cJuTUXNMgxCGClzMDJLILC5
	KlUloxGXA0Imju8m4Ym/PcJPO+OnImhGPhQTYv2aThFw9OrXpYAgLgn+A30SBb5ombZ6aBytZHJ
	0bsbu6R1QIfr9ohWZQpR407nQHj9c7CcYdEKikW/sHTcSMZnsr7m4HNV15gHasrgIGGnTBFcKac
	K/r2b5ROGKwS2tnai464/iv27lC1obyageRKvmkXxPli3PRXfGispp3daCVMCeX/D2sm
X-Received: by 2002:a05:6820:4ccb:b0:6c9:80d8:a205 with SMTP id
 006d021491bc7-6dcf6b1c1efmr862593eaf.66.1790768057073; Wed, 30 Sep 2026
 04:34:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929184900.39515-1-abdelnasserhussein11@gmail.com>
 <20260929184900.39515-2-abdelnasserhussein11@gmail.com> <arzUmYfK6mbznNre@ashevche-desk.local>
In-Reply-To: <arzUmYfK6mbznNre@ashevche-desk.local>
From: nasser <abdelnasserhussein11@gmail.com>
Date: Wed, 30 Sep 2026 14:34:06 +0300
X-Gm-Features: AclHuK88JiQnM2CrEgftb3pl5BF2N7zfRmcPmhGHddpC3jq8LxEOXsr2V5NPP8U
Message-ID: <CANpqX3bTpB-y2hr2UZZkZWC1+wPNz1M0HQg_h+c5SU+XdR8n_w@mail.gmail.com>
Subject: Re: [PATCH 1/3] staging: iio: accel: adis16203: fix inclination
 naming and remove unsupported Y-axis
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: jic23@kernel.org, gregkh@linuxfoundation.org, nuno.sa@analog.com, 
	Michael.Hennerich@analog.com, dlechner@baylibre.com, andy@kernel.org, 
	linux@analog.com, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, joshua.crofts1@gmail.com, error27@gmail.com, 
	narcisaanamaria12@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Andy

Thank you for the review.

> Read Submitting Patches about imperative mode (search for "This patch").

I will reword the commit message to  use the imperative mood in v2.

> This is a staging driver, why do we care about ABI preservations?
> Yes, ideally it would be good to have existing user space software
> continue working as before, but if this adds a confusion, better to
> rework an ABI as well.

 I will completely drop the 'X' modifier from the channel definition in v2.

Best regards,
Abdelnasser
