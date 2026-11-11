Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.203
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794404519;
	b=2hf9tpqnyYcXmpQmDvJm0ajQartkcS/X/CtDLhPhQbahUs1FeshGMLGOlLJG2T6Renix
	 hqm29qOgnEkECppMa/U2QjkuocoqXvzosrYEhDE6eSFyqOy665FGwDpiMROAmjfuBiARx
	 D0XbtSfoBAmB6JIPUsi8fN1L6k9ajs51FA8eZZ+wc1TFcp9zmqdgPFobEgldj3t0EjBT1
	 RHCG9eSR8bdZi656PVcrGe8HxiwfY+x9QnAayl9MHmV+z9h6SN5itqvckFKE51d5V6+SF
	 kLqU/NDMREbVgTxCQuswDgYW4olTADYrqz8j2yVccuktEC6Qq8RgD68cYj4C/DahdWw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794404519;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=DXnOrYJndBjtvfOZAozL2l4Cp0d2hZXtDRZnAOOlgK4=;
	b=DRIlqOZScVEL1tj7Cj5xbKjiukkRQIrqPBltLVMubw4OZaYEoAJPkNG/145DytPx+g/G
	 dg0y3/zFA736FHFzTXHDGUvSE1Tqn04SX2KJgxRkVVRXlpM+YdxTZoN7OXKHOoF+uiG9c
	 5/+oTwzDcXSxIyhMaKEUJtPOAXDOSypWGZ18iZX4bhU23qH1PlwTzWkKmeaGmPMNTV92h
	 HN3z7hm9ZGuso2UbyT/ETVcF/s0Wd2E+tbLUJ4kZEWCCnDyxNRC7BEVzsdl+n1gRVeDiQ
	 WDGkLO5KecPqrgzuxo4YeX0S01Q9/cDyvxh752axSl3SKOpTvFHmC9CUR8QPazNYK0Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g90birjF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.203
Received: from mail-oi2-f11.google.com (mail-oi2-f11.google.com [74.125.231.203])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F69606A327
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:41:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42F69606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g90birjF
Received: by mail-oi2-f11.google.com with SMTP id 5614622812f47-56820670d00so1262000b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 05:41:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794404518; cv=none;
        d=google.com; s=arc-20260327;
        b=cpDUywlle6JOFAjZJ1WhvSDcLHvm0l34gT/I0BjOTBMjz8Lf3EBxXPueeQvJKG3JZ+
         MyPP3DO9W4yVZZyltQorBDwi8mGDVG0echtxazbuFa/oDEl03WwGGdv4PDRRB57rE0KV
         ryRk5S9W6lJ0LKk1HqZmNfn3Ab4oUOWlE5/BmOyeqGCJ5WzeQFZSvzQWNRpuNV83LC+j
         0XIDXD+u0LkLvDVJooFJznI4iiU+RNGlw7esUYIfSQbFjjjxbtXohz0koM8RrtslM/y/
         0kute7Dpb1ddZgJ2JaTdE87NbVHGI3S4ELcjrV3xeaDFBjKd5COX5P0XGZkSfDljGZSP
         OwyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DXnOrYJndBjtvfOZAozL2l4Cp0d2hZXtDRZnAOOlgK4=;
        fh=5CB/06D0a+SaeJaMegO/kRsnByAWNnt6nkHdDmMVXoY=;
        b=KGf2OQaVeIXocuMFm+OojJrhQggB5GaPkXlcIlANswCxHITlYfbng3v4YURqJBkBvk
         seu3IX3boBX0IHBfsn3fqIlTvekTZhre7n3RPyhSmDf7D39wyOCSdSgwuzoRXM16mrhW
         ym5Mx9yfoAn86wDgAOzLc1mEX2tbowJvEW21APZ4VxNw06ssuSe3JGRNxV9LdzP+EcVd
         5FuAr01REcvXM3GwFxZEJdzwdYFGctqebe+LEiBEyEHCmqgIOwI9s9p6/+kFsPCfLlMT
         x1N6LdAWbP9RLHa0Bk5bbzPn95C///bStw6WWChBbX6xaJUJFdBC/yZQ/GkpKh2naqCD
         c83Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794404518; x=1795009318; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DXnOrYJndBjtvfOZAozL2l4Cp0d2hZXtDRZnAOOlgK4=;
        b=g90birjF51kGiHNi911bO4MwqBelgEELX+vyzPNk+SOLHF+7TbZ0bMj8500ez/uy8e
         ZrQEXliuV86UgyR4l6e7htHKO4P2TzesiSsRciHkULeuTEh2Vr+ppWsqmB+Fj1L+cmIZ
         cuspCo0ll37tCrXTBp+dQyUrO73YGrAw5Srd1GYqGUihiK8eY7iMJwWCIaL0KNShVObA
         /GjDwSE/nml/rN7h3upqn7Na1I8GHTUMQe0uk6l+ElYTduAciMQrwZkBjUnOmrTL8p4R
         F/q4q45jAZrbJ7fcwljfqcnRVX7vCTL0ToO7h/RleoK8zZeAJNH1CsBqFqlh0Cpsl8uC
         VaUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794404518; x=1795009318;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DXnOrYJndBjtvfOZAozL2l4Cp0d2hZXtDRZnAOOlgK4=;
        b=mVYgn+1aXhHQ+uwff+8jvmF1kvptavwMPBoh8sxLkJ812gotoGlQ9SCh2o5xAWAVoG
         tO8j5XwGo2BgAPA+SAXyFb6cnQKNBIVWcB+jahTqN47vBH4RCrSHhLiR6Ksey5MjFcm4
         hft7fZj1tqQvvm6kSvRTqJyTbTSAETiE3I0O+WW3ji7QTtNMoCWEKP6tnJw5kbrAnac0
         E3eWNff0Em0rc1aLp0O0rex3q1K9Si0NcniwA7q9cUDykFCF16ol5/9CbQfcuiP3inhQ
         9QdmtfeiYcgofkcblEsGZC0p92hSkUCLFlLdYzPOJkGo1BpEOMZrUolKA+eVjXVlGN9W
         2ACA==
X-Forwarded-Encrypted: i=1; AL+hErFhHT3fiAy80uai1LzTNsEYMbwtlPLxZM4W+Dz74oL5bH7eI5toXN4wH1i6XGRSuOvW8bYximdW3gfApio=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xOK/cvXWFq8t9GZobwNaaod9JV1XUMPYgDMBLJzAMTFuVHJyk
	O+XgGYGdY4/359zECGPoneRegelb+rOWh7oOfx834PNe7qmIxrmVx6qXOrieyxwuTXnZgq/8u/V
	SlZ+bPIKCEFII19O2CFHMNb3m5aMnRylAzBGgRZcARE0c
X-Gm-Gg: AYBFou2eyNqccdop7cwaFTZzgzK/PNIjSv5ThTXxlI2lz9B+avEUIg7YDOOaCeeD3WM
	0aQ8zOV6IlLHmcJ/4x4sx/PdWzRktKPbDRUBL5w2bav5T7tcJyV4fQu80fTE5HXQJwNCVXpnPZB
	g4Ob4grlcO9pSMhXw1Pp0uR/6XU4XSZ3CxiQHGVZJYITINt9jNUV7UCRdvvLpcEp1cA6h0pVN6n
	HcINBoiqLZo5TTAyFAKYO7AAYQmEFl7t82KK27LSoIqhkwN8Y+7+ViNFfBesyRVRBKi3f3tgzY7
	T3exFqlBxcOubmQO9rL+pxh/4vXhLsRiTa3haFyBPtgrs5OrTVvCfIIfxx6VbpozC2AUudYr4fb
	uMHumSdlq9Lq/GgB2snJAYZ8OiBLV8umHOF8FPSrZYk5iEZE22bO0/sYSgv9A2NoWaZN9plB9b/
	Myy1nKbXe1viseHqKDWYRQ/n0veU/bkmJTMvKqUE47VxA0WGcwCgOJwajfoY/usOECB4X7r91ZD
	Q==
X-Received: by 2002:a05:6808:10cd:b0:55b:f88d:6ebd with SMTP id
 5614622812f47-56b9293c5f0mr1861940b6e.3.1794404518140; Wed, 11 Nov 2026
 05:41:58 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104191621.89561-1-dennylin0707@gmail.com>
In-Reply-To: <20261104191621.89561-1-dennylin0707@gmail.com>
From: Hungyu Lin <dennylin0707@gmail.com>
Date: Wed, 11 Nov 2026 05:41:47 -0800
X-Gm-Features: AclHuK979fFPsKcuUOg3hUc17dq81L1BTuEdNVZioITPsDqDO4LERCg-x-Z03Ik
Message-ID: <CAGEkeHeMnYs_SM610dCCBPufJHAN6t00WBtC6YtgyZbw_GfUcA@mail.gmail.com>
Subject: Re: [PATCH] f2fs: read atomic replacements through the COW inode
To: jaegeuk@kernel.org, chao@kernel.org
Cc: daehojeong@google.com, linux-f2fs-devel@lists.sourceforge.net, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Chao,

Gentle ping on this.

Thanks,
Hungyu
