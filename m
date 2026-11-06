Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793980315;
	b=vDj0KUNMegWZlNsYO+c079G3IDw2or4Xm6fgjTGUMc22banXjJkg/AEudGiynfb4KEq1
	 5VJwYufhbK7yXHaaq0njjXUb6pB6n8dnGr+vjeNcAMUSSDVuHSRbYTGZnVkXTR7AWBHd3
	 iQRXPjjnDsZwFc/qM63xH1CYrFYPpKiBfkgbiIa7gOrlclDv2fyTQ49LQ/ew6pvFmreAT
	 qvEZuDfPI4Zw3T2+kbq3K7ei/CZQGNH6dN+uuqTWXFBREXxHltoF4NHmxdHV0rMhSrn8o
	 l9T9z8fy0Gwev+SL1tZ3AVH1BwfBG0n7RCgBPvMlRk6YHKNXRUmZfiQbsrjakgCA10w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793980315;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=qp/Cn94KwArfPWCyeLZRUZTdCMFqpznPg/yTOzrJyXA=;
	b=VobnYj8fV09C/h2SWwapo7PjIPSeY/rrjC2ZlVOXigzrY8MYPUgoJcQUuT57VU1Rm5Pe
	 OZJbTqyLY21qY5/zo0IQKBSkHP7+49rwG2AqMVaLJ2vOckXNAe97nPKfNyF3GBTnN972c
	 MEfMbdAIv2sUeEynIt22SQbujxd75mVZdIugBLMOqP8JKoA/oi7XQCRbqACtVzuQw50mJ
	 5xtaWSiSgP1LqlzL3FBPBky6+XTUkIO9fo36TPU+JriHQ9o+CjvnSUCHBEh6LtE8tvdaf
	 dQv8inu64PaME4FAeYEnsqE6mVPrEZyTJQbBPAc8oi3VaP4HtINgGRhx+k5FFpV7FCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=cCim9Nrp;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A289606A32D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:51:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A289606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=cCim9Nrp
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so6592365e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793980312; x=1794585112; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qp/Cn94KwArfPWCyeLZRUZTdCMFqpznPg/yTOzrJyXA=;
        b=cCim9NrpgtZ0UMW1+22EDqlkGoHoeNlE+SAqAWEXwQ11zGfEZEQhQ5q94udT6+Rb3H
         i35iCQ8hJp5skTJsGARR/UO8yEv03kNmSxawU+8VKwGAYlEsO3RQ691naC/BS4666M5z
         zMYRnWR5dm8fLK5PAg4I9CgHkN1sAJL0HWdI3OO/Iw+gZSBzficMQ83ev2hVhpgKrHkD
         fca9v7hFdDV/hXFx/ZS+sR4PhjfhOYxigoOwJryiyhXJo6wrf8HGWq2AmR5yaVBTv3OX
         i6ZQ9fEmgN5wPtM2x/LRCHDiyqE8JGWmFB1wWpc4Bcdo1p8ju/IKnYkZ54YBbJPwIhxc
         hAmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793980312; x=1794585112;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qp/Cn94KwArfPWCyeLZRUZTdCMFqpznPg/yTOzrJyXA=;
        b=2Mda736gtsG9tLx5EVyT1cdipRVuKxf0Ue+fuGYMmPSFl/SkV9iws7f25dAebLBHgl
         j2rvNKNCFObKJcxizSRQIXBDY318pa/H8jSG5U+QJYMTuq5PM+aR4FrbMkO0USdX3Twr
         i7ZViUuMSQlA1Tj10P/INR/s+hkg1/LsGrVuesAfFhunYjlsfjr1wLBohGCTQ6vkjAep
         b4u0y/v6cGi7YZgmHFn2lCVB2MuU8nqHWHZiHFLOkykeuVRkGwBm1THynACBE2A5ZJyU
         SDj7CFKsv+iom/ZZG6pYjnzUXb6FX1N+TTKdWyjDc+xq+DsHS7jsXMkITzKa1gZWUSeD
         gdHA==
X-Forwarded-Encrypted: i=1; AKwUvBz1kEtBx2K/uihmor72JyMInYdeZn4CVAbYLTyDXrSjjd5mBd5tOnjUb6pV6PEujjlA7srZBBqLZghlb3Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LB3xh2sGxLW/xGYBHnhGstz7JtHQyyMnbfMj+7eweNRxeS6Yy
	41aTInuYnvBJ0nVdy/ZnHryiIpWulCQaC+YHP4cy9YIna3995Uli5kM7QkZGFDqeOOQ=
X-Gm-Gg: AYBFou0eir6HqbmczjtjXBiwgkc6Jw/in1f7r+M6ZZnOj/YQSpcIHBWDxAOrFGccqv9
	Y8u2Ypwet2RkX3RjjhppVCjY5aenoGScte/SiclXZbFUuyf9EZCiiJIrI44vCO5kWKEteLmCou/
	CSqAMtRBLaQxwc+Ck/1vLWFzopXzUG+Qvaoq5o25bn9KT7nyBm2Zhe+e3DPXEsBdkir9xjRuiH2
	wP5JE5kkoYxLkZfeI48+h0Gs2ecZujRhlYEBm02rC/uBPUJYJXgsIf7G2lLM9yhjrf1BsryosOi
	DUyQloB1yINDi0mR4P07N1mS1kknXlTcCRynDLE78QSzKB1e4SY+GKOC4bbbsLT+y6gUUo1aT2O
	/dApibcUd8pwePHEd9B5FClZ6wdUtHvVgrO081MnnKhJmTPZ0ZvOkrEKLPuPsXlQru/kU68eSID
	jaFZ+nyq2o3e96BhVeCJSxoscNlmuMR2+8CYXQm8S3nvUo/sGplen2rPtzyKQcKOvbwbDoBrzUz
	jd070xiEYO9kSBzpiDQxj6N9F2MkrJryA9jZDEYGCTDjNoxU38Pt1lW5PoPX4TQAlVeHO6uaCuD
	VK1FqXY2LY2r+E6u/qMWhSdeLkRbshV/5EIqUOG2O0Ctn1Nq
X-Received: by 2002:a05:600c:1391:b0:4a6:44b:2593 with SMTP id 5b1f17b1804b1-4b6dfd97b6cmr50243775e9.29.1793980312099;
        Fri, 06 Nov 2026 07:51:52 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6e1b5d745sm62876215e9.6.2026.11.06.07.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:51:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/2] clk: divider: Fix the divisor for rates above 4.29
 GHz
From: Jerome Brunet <jbrunet@baylibre.com>
To: Brian Masney <masneyb@kernel.org>
Cc: Carlo Caione <ccaione@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Brian Norris <briannorris@chromium.org>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 David Laight <david.laight.linux@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>
In-Reply-To: <179382912410.620422.14715602424648962218.b4-review@b4>
References: <20261102-upstream-clk-divider-large-rates-v1-0-eb17035bfad2@baylibre.com>
 <20261102-upstream-clk-divider-large-rates-v1-1-eb17035bfad2@baylibre.com>
 <179382912410.620422.14715602424648962218.b4-review@b4>
Date: Fri, 06 Nov 2026 16:51:50 +0100
Message-Id: <179398031041.2573818.13317727784501684521.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1299; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=0DalZ75GCJ/Y2wzvrEds89TdSXOwZePw1AI9YnwLQBc=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlvv09Terx73ppqrvAZSmWa81euZd/jNaPhw9aX59bN6
 XR6bnttQUcpC4MYF4OsmCJLDXe1+DtJrS+zpuvchpnDygQyhIGLUwAmYp7P8L806Ue9pfPPB28P
 GW5ROua9w9ha0rbki/rbJY5ejV9KywQZGc4tK1v6OupqOj+XzLPqtO8lay/yiMrEpXO9k1liL8N
 wgwcA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On 2026-11-04 16:52:04-05:00, Brian Masney wrote:
> > DIV_ROUND_UP_ULL() takes a 32-bit divisor, so on 64-bit platforms a
> > requested rate above 4.29 GHz is truncated. A divider fed by a 5.94 GHz
> > PLL then computes a divisor of 7, not 1, for 5.94 GHz.
> > 
> > Use DIV64_U64_ROUND_UP(), which takes a 64-bit divisor.
> > 
> > Fixes: 9556f9dad8f5 ("clk: divider: handle integer overflow when dividing large clock rates")
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> 
> Reviewed-by: Brian Masney <masneyb@kernel.org>
> 
> Since this is a core change to the framework, I'd also like to see what
> Jerome thinks before we merge this.

I've had not problem with the change initially but then the AI told me that
it brings back the overflow problem fixed by 9556f9dad8f5.

At first I thought it was crazy because it would mean parent_rate + rate is
more than 18 billion GHz ... BUT, a common way to ask for the maximum rate a
clock supports is clk_round_rate(clk, ULONG_MAX). This could trigger the overflow
and there are instance of this in the kernel right now.

A way to make the calculation without the overflow could be:
parent_rate / rate + (parent_rate % rate ? 1 : 0)

-- 
Jerome

