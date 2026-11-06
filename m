Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793973290;
	b=1fHLMs19DfCtwaneeEFBimLBXwg05hkDT8L4HnNI5nhYDq8Sme3T4HpbCHkly15LpSXL
	 +56QAI/xdgjjPBd5jRjEWvkURs7BWPvulHV4opy47TJSVSOA0j+nOSNZYZI+cIzR02pa7
	 vVdtEuqqlAA9e5j5hYfcxsRF944yxzKEG/tUyKSZVue3bWJjZA4lWoSvQsYJi2saHH7bM
	 pbhVkPGUXl6QmOWZcg02Wc2rjD9ZZdcQ0ZBn4aaz8PjAAPrYYdX8QTYOkeCBILO/DIJH+
	 j6HUTwfRTwVvv3xIaUAKvuesBWm9e2RCZQIDI3Mv+1uZWiZcSWbKMSeSv4xNLUDgXNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973290;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YhC969aoZeZO4EN87Pr8flhLc6MwVIFADHN+EJfduEI=;
	b=q/LcDJOCkIClZxEC8AYHh4qTzjVIMSuPgtyO9WNYZRG5XoBPdOa3+chmuKOd20WjRxHz
	 SzYpBZ6SsMsUUxECRX7eZWgalBFVED9TgDwkPOYi9rJxIJuxcVHJW2F+u2V5Pax1V7KF9
	 y54w6mCvPaUTZK2TicMcT9jwpOkobzlnhrLT7oXidGEJFAIjMnDAvmyBSX+d8KBhTeb6R
	 Uf50tPUU/Wv8BzgEaJz33tByDi3thut6iD+FhLb/UHcRS4C7KqGDvjIaNzEE+Gwp6qKCo
	 lWEBBGmr7b6gyBjf2Q8HNa82ix7o2t2MHDKYJvnX8oCHoL4NJdBRFU9e6+tGlvYB/SA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CsreXca5;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16925606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:54:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16925606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CsreXca5
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-49134c8509fso594879f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 05:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793973288; x=1794578088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YhC969aoZeZO4EN87Pr8flhLc6MwVIFADHN+EJfduEI=;
        b=CsreXca5E1pMin31kHwPFSa+zHh0j4vm2eSTeZP4n4qoY2Nk1tQGNo7TH21ev508JH
         +4h+HGmiNKVAQuTC+w4RPqkmarRK23BfNTVJcFWVyeOXf1QlBPNwWDvZc+Bpo0199vf/
         MPmzv1CCIhaLnS0zkFdbhnExzCD7PYqRsu2tq6hgYGLm6mTJC3pMyhRhOO93HL9QX9PB
         yYqQXrIgd+IINpUK2azxMfVC1X7HJeSzOe3Ly7ghTAXg3lhI281usQhIq61cKMysoJM/
         0JjqCZdiinl5DOmM3fX04n8U51eA+hpSkBe6h99Y7zM+/+OzGs9Z3Q88EvnGFDgbttKY
         Gfxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793973288; x=1794578088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YhC969aoZeZO4EN87Pr8flhLc6MwVIFADHN+EJfduEI=;
        b=YbByqjq+PSt2qnaagLYjbqWeu6uQKSh5aq8DUSA7PXadgLm0OappkgBLYk9y4VRwq/
         jMWDV9GXrBFqqmaLo7/Vkbo8+IRNZPTgHXIXN2zC4cgXthrwalHC1A4JYo+TwTpv+Kil
         y9kDnqijnHMFUlQHSCbyi9XCt63l8ddLdHLGELxgDFzPxVDkb/avuMsGGst58iq5iWYr
         4smvC6kZjQBK/V6XUeLPqQrcqp6UQGsFZMbn/F16ed3VMHeNx8Y6jdH/+BPN0T4TNTJQ
         KbP55S3nETqEKiUA2mfzV/gqDhhhkoRq9f4AryMD3QeM701Hge7L+wRwWpbqw8SS0OeP
         18PQ==
X-Forwarded-Encrypted: i=1; AL+hErGuBalYoKxn26zbiBBXOXf4RXhvY8U4jrCQvnK/pvUeylWOx57BhrxunSd64ziyaMBJiCyUkIIsF7eywZk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/9WH7dm4CPL97++2ZyRn+biOkpgDD9ZmWwBpm7i1BPON9NbAx
	vQv+gzVm7sFqa//N4mxGJBPqhFdWt6NOpT5l41r5ftTjzuQ57hx7/8zs
X-Gm-Gg: AYBFou3kWL0UVp4/Eff7XJAKIWMgzHCVCbhmErey8D5/wP8zRFFipmqQtr/huKNtJAi
	sDM8DwWC71pGJvKWD0JrxyEg3JsacNGrlqmFzvbQtRnOZjncOvxN5d+uxrCaSfxxdPkEgM+Fn8g
	bkjjM5GM5ZbIVmyCG1iaGNnWC6SDdop5dyJF0UlDQcoQLzw8oaaQybOmDCiASAqaQ2QmXjo+D2T
	600079ftxsF+F9qf9fFa+Ee5h59afcKEg6Ohjjl1Awnz2G+84Dp+PMhbpty4gi19AcvTzWafeWk
	WbboatQK/JTbhSHk+1Oxvqixv7hPSNrePps8UGQ1kxYkwiq91mZvy1M4pIJhM+pLAKaLG4rjbPv
	Pt5QWd/zAFI5cvMAt86eAwqBg7Kr9pOuUUYeMTPu9JUqx4d+VV+UFEDbu9rcrz0c8Q8jaBrSx4d
	dqMIGt0GeZMB+XOzQKlugy+EZd0KiOzhgERwIp9foAh/Po9DZMtTV/2GuP1OKNvrDLzh3DhPFkg
	a1oaRyNMpgIYEo80+rdTkZyCFVaPpcsFSv7wIwobkzGhXweCWUmijBIeF0S4zH+tzseY7KbePlz
	8I49DGMrE2jwTHyq3j6HraUjKKyqWFkysMFfj/DSqcA3QHFjwCoiHkzZuMCgzeusoH3+4aKfoxP
	x3JBC+OeZ71smdTpew9zD+cY0VTs=
X-Received: by 2002:a5d:6f0a:0:b0:48d:dfff:fe6b with SMTP id ffacd0b85a97d-492760da71cmr5896957f8f.34.1793973288307;
        Fri, 06 Nov 2026 05:54:48 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.lan ([2001:861:39c2:e340:6118:66fe:a6e9:e648])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d087a3c5sm3393124f8f.0.2026.11.06.05.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:54:47 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: airlied@gmail.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	igor@reznichenko.net,
	jesszhan0024@gmail.com,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	sashiko-reviews@lists.linux.dev,
	simona@ffwll.ch,
	tzimmermann@suse.de
Subject: Re: [PATCH 1/4] dt-bindings: vendor-prefixes: add PocketGo
Date: Fri,  6 Nov 2026 14:54:46 +0100
Message-ID: <20261106135446.1334980-1-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106-gentle-shrimp-of-weather-dde4f4@quoll>
References: <20261103110524.2812831-2-romain.tisserand@gmail.com> <20261106-gentle-shrimp-of-weather-dde4f4@quoll>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Nov 06, 2026 at 01:58:02PM +0100, Krzysztof Kozlowski wrote:
> On Tue, Nov 03, 2026 at 12:05:21PM +0100, Romain TISSERAND wrote:
> > PocketGo is the brand of handheld game consoles such as the PocketGo S30
>
> Vendor prefixes are for companies and I cannot find anything about
> PocketGo, except it is a brand. What's the website?

You are right, PocketGo is not a company, it is a product line. The
S30 is made by Bittboy, which is Miyoo, see e.g.:

https://www.retroshelf.org/devices/bittboy-miyoo-wolsen-pocket-go-s30

I will drop this patch in v2 and use the existing "miyoo" prefix
instead ("miyoo,pocketgo-s30").

Thanks,
Romain
