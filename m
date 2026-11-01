Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793530720;
	b=hniwh9wfcqC1qSajlXOfw5IWPcRn7tuWzCs085QGL5xBnGBDhrkJYQfr6wCK9TRrgk7U
	 rGbaWlGBvlK/AumcwcwuU/W0biylVAo//MOI7fvNnNpUSKyYmRqmxSKGP3U0V6V6guf4h
	 oHloRvWmtbmTsjXWQJZfMsrxNvUPk+JkgDi0i4LpWeivpS2VYzDyKwLh4Aqtd86IHI4gX
	 e11iSrxEaxolwYNpPxX09C8PI1KykwMsEktuh7dCCf6C8DmGd0vTX/uCF2IX71kdCYGU5
	 ZZrayfa5c7hUvUzd39va1UonSOrKBCeWI2wSNR8duX/+dryA1qQDV6SeImiVTTpkfJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793530720;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BCy9FbfGCagGcVT1iVy5/qKWXuDsXeyd+T20CrEKRK8=;
	b=rLH9BSTP7SSix/j/3lDBqfllSn2QIJ5VFWizAD8d/X7gaokq7QmztaBlPb+NGLa2nqnd
	 CzxYjq51FGzQRdsO+1t7EGGrLX8iMVFXvXgJOtDPrxOz2JKeiwUIIbu4/FlCFiBblbA8V
	 z65g5t3rMjezzwfjj/e5jSTldDd0mXYrrnUTUXmbXg9z5ecOBjANthriHQXUt2egb7sz3
	 d7VjAJQcVCtXITzCjlnVFMsU7+8dtaSUnipWUlhK3lAny0JYAOzyTr53KUGTxUp3wxocq
	 KIUDJB9r9mJUyVtzcxYnWU6LmsVwcrG8k765wd0TZjHRe2LUn6cw6hqtKBdCfrlZAlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YNEdPM2u;
	arc=none smtp.remote-ip=209.85.208.180
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77860606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 10:58:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77860606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YNEdPM2u
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3ab3dd9681fso18911291fa.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 02:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793530719; x=1794135519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BCy9FbfGCagGcVT1iVy5/qKWXuDsXeyd+T20CrEKRK8=;
        b=YNEdPM2u04IwdWEarcCFuNlfrKyRUs/D6adKObe+2aN3T/8nBD4AVauHGs/N8j012i
         MsSZL+iI9NYmPDIkHfqr5G7EN+OpTTLsCMZjGtUQkjpJ9Ehjmp+R097kNUEqPB6SHXCM
         cSZggvawxPPjo++eI9Dgjgtm5uDZ4wmYC+WvWXhpVU61qS1EGuy9eF5vcM8LSm5hgpq1
         IyT9AsX0ySZO/bPbg8MfuZ8Jarr4ebvAEr/BszZAewg4CUesPizMeRKaAdbp25nTiX7O
         E31W8Jvq6U5MoBDuGNEXfGOG71gS1GHSk69RPGXFQrPrMKyxg1h3v8mYLRJ49FTmOEUa
         6Zlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793530719; x=1794135519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BCy9FbfGCagGcVT1iVy5/qKWXuDsXeyd+T20CrEKRK8=;
        b=P6AE/JGw/YndgNj8LDEBbDap4lZ4TsQT2mFWVlGj+pP+3uH03TZPjqDgbKZ8vmI+UC
         NA6HUZdGKceNNFFDBuOCzbsxEh5A5L1EKcsqpwPra/wR+dv6huFPkzoOfKljmbRjSFD6
         wN0YIEwwMpvnJZ849vINMfX09JB4v/vxC0fP0DBlZSh7IxSy0I8mlG0ysrk9OHXEk4RW
         4leokr/GMLFto+qH4/DHrdRvX8Sq3tBUMVbs/TTDUO4XOP2RoymvlovdcGXDnjE0RZQ4
         qAL2W4V+PXFPuxH5ppyPwNN6nGq2XJcZ7s3EhG09QpEMCLE5fxvT2gmj2/82+dBqyx+G
         Xc6w==
X-Forwarded-Encrypted: i=1; AKwUvBxW4nGpr6xHadSXBKo+LD4vn5kgj1O6HS+CFJn0qtmjdDGGA6oFqValnb3S9yA3266vs5jmBsrB9PNkS/g=@vger.kernel.org
X-Gm-Message-State: AFq9FYJE/rOuJPM0/CEqF2JNDz4jptSTnWL+NMTWu8aKikQ9Am6DzBWv
	aukJn2tDA5vwRdDSEy71NyVThWQkIUBbiXsIfElQ8130rxN2HCvB/Myg
X-Gm-Gg: AYBFou318j7wlfOnjo4zAAKeJc+V6SKck+ZMri9rjqpIrRLjyrTsoLIemRkod8s4pVk
	2HnMlAK6l0r10isEV1cbHdtd2dEHg3zkv8dxjPNRk2sPjMFJnyeZMfpbVYyIP7NzV/SlLN319UP
	OizmQvAGh1VBRNHY+mR6NJJxG1mlMUtdWxgBi9ul7624T5fXizFtkc/Vog6vwpbzbL1O/IPZs3I
	aZ6aUNuDKE3/eCZjP6TDs32rU0rI/euETG79L+om6e+OwZXZhho2+JWZmXxDL660fSVxBz3uAuI
	qUUVwzc9EOm5L490/jcxmEnoulZn/nTNp3wln615Dwz0mpdDc+ZB62yCEfNKIBD057uSECuFOoh
	cHpz1R7ul8cwqq4P5UgAusvJ7F6rnP9/p/7IRls//1uc6g3c81PS3OUbq0GxMa+yNlENli00Umo
	Rxd16+fcy5p2X1X2LhNWz/GsqjpfdtqLxbC8XGNjT0YsTVNaT6Mu+ewsKzUjfbBM4ukjP4PetSg
	bd2JdJBx1Ib4cn8v6l7oBpb6wvpjz2LSOKbQAUVk4iq4e0+sp9h93LdHj5Ecd6ld5KymVALBO7W
	AVg4fXSkwCWyN0qrtxEuWVFFnVu+ZmvRDNViQZr1UAk8qca5Hwnxpv6tTbIX1OwssuLUmk4EI/6
	HY8X1rFhp02KDCXFenB60f1vtl9bXtuVWOjCcvQ==
X-Received: by 2002:a05:651c:1474:b0:3ac:330c:518c with SMTP id 38308e7fff4ca-3acb7a827f8mr15638971fa.19.1793530718404;
        Sun, 01 Nov 2026 02:58:38 -0800 (PST)
Received: from yantra.. (nekmmqtbv463r5fvgny-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:5462:a993:5223:791e])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acbbf1b726sm16613131fa.32.2026.11.01.02.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 02:58:38 -0800 (PST)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: jic23@kernel.org
Cc: Alex Lanzano <lanzano.alex@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	David Lechner <dlechner@baylibre.com>,
	Guenter Roeck <groeck@chromium.org>,
	Jagath Jog J <jagathjog1996@gmail.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Jinseob Kim <kimjinseob88@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Remi Buisson <remi.buisson@tdk.com>,
	chrome-platform@lists.linux.dev,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Elver <elver@google.com>,
	Bart Van Assche <bvanassche@acm.org>
Subject: Re: [PATCH v4 0/9] iio: enable context analysis for all drivers
Date: Sun,  1 Nov 2026 12:58:32 +0200
Message-ID: <20261101105832.55605-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261101033018.05897c08@jic23-hlaptop>
References: <20261027124954.110697-1-zoone.rupert@gmail.com> <20261101033018.05897c08@jic23-hlaptop>
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

On Sun, 01 Nov 2026 03:30:18 +0000
Jonathan Cameron <jic23@kernel.org> wrote:

> Please take a look and check I didn't mess it up.

Diff is fine. Built drivers/iio with clang 23 allmodconfig: no
warnings, and a dropped unlock is still caught.

Subject line got lost though. It should be "iio: enable context
analysis for all drivers".

CONTEXT_ANALYSIS_dps310.o := y in pressure/Makefile can go now too.
I can send a follow-up.

Jinseob Kim's Tested-by didn't make it in:
https://lore.kernel.org/linux-iio/CALMSew+nhZp9BoqS5tOgFdiVy13U1r2f4UQa9Sd5zc9pSt_YcA@mail.gmail.com/

Rupesh
