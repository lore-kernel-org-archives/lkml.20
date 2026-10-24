Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792823893;
	b=tgWIGZ62qCGYjzDOaJYfIMSuQ365L3Tm+CvvyHaLKoKXQKNGuKi2E6AxeTpKuuvuN6TI
	 G3xtorAN0Cd54hiUBxQ2xMkU3ND5r7ak7da7D9f1l1zu5hS6l30nnLlMT3jqqqd16Vj6R
	 VvuJ+PgeIw3jP5e5OvpJhSt6CDHeVnWucj1QSvxG7JBW8j+BEc3LDxQGVEb2o+SY/Hy0C
	 LQnSIExb07Wxs2qwzKD3TEY8Hi6Nobq/X0Fmy2RO39Xig+o2CC13umSdGXtxKCPJxMRmD
	 VaIPlWykWwm4bxXTQgkgzFk/e4nLk9Vwstr/QB3jbaqeSz0TjoUAUM03aENpyCRRrCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792823893;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Eo/uDup4KcaVJ1mR+rT1i9h2PRHKpBooRZboT0Neq5k=;
	b=VzDSzLX/RWeIyeHImsNfbDVCPti3/ccDasANW3ziRLhJmiJfdqQ2KtpRutioK1/5lGpw
	 A896jeimF2BoqaTYgMbDxuy6JZ92cTzdDkCi8NTym9doygznFNlduHrL5LzgPx0c+D43A
	 h9oo/rmqwerSfT+pg8Aw17JRg1NxW8mw+bl+8DcGlNhEftAIxOyvff1/krUIdLHgFj/h9
	 2TieLxQN7YbKgX4wlQKP+YQRWqAOxaibRIHiwkG8Ih62+/6yZLIxYOpSEZdWNmK2Zx/T/
	 uLTOeD6qhcrFO0D8PkicEGbciHApABZbuuhxYSYcbJBMbHeMDW58UjWMEFwS3PlJWCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JSq5usht;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99316606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 06:38:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99316606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JSq5usht
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so13940555e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792823891; x=1793428691; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Eo/uDup4KcaVJ1mR+rT1i9h2PRHKpBooRZboT0Neq5k=;
        b=JSq5ushtKCOp88C6tHvh//K5tNcwrAAwAHXEk/x9OnSeJ/X9kmdoR7O5qQ51NAbMXf
         PDaoU5tQ3bQOy7RkA2Xe7tSu0TgTxjIWtZtnmhxMaxVIaDhauDuYTTPB2D18kW6LOa3a
         copeaz0+6y2herGTsVGoBl7nU6YdW+c7qmbS+/scTzCXantPYa/AvOTu/rTxxN54c4qE
         snedA8EKU068xKbI0cT9dOgtk8ora/IKMl1pQ4flfYz4RbMahCMzNBarV6gMV4Ykz0ML
         4HPLYq1EZhhqGGrzUvGIvCDclZGXCB3FeqgdzY8PTbLg491oCK9Z7fai5d1OPScoiC1j
         2m8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792823891; x=1793428691;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Eo/uDup4KcaVJ1mR+rT1i9h2PRHKpBooRZboT0Neq5k=;
        b=kEBxZ9tCh3dtG2G+/SlgACfXFOGUH3onFwsOo3pePlT39MVjDKNhGx/ZOwhdvGtAh1
         8uZAMPxzJloeB000YU4SOwS8uFOOKVp8gOQVEJk9jktOT+lyBqJVCEABK2UVKnejU9Aq
         ld1CWpn0AOIA6F9KpBKQSBFRqyFVUISAKH8YlY1rPcBCSR8VtTydck2eLTV0Y37yszZs
         t+dx4nPgslFEyiphXC8Zl1khPEL/jngob6L+NVVsPn5ZnV5Mw3p3kDlNIUNwonW/dQPn
         80+tbsE0pqqqLMf7wSz0RmvQSTkNNCGMdVerh/YJ/iFFg/2JfQeeW44nd5iz+N14qIwi
         5caw==
X-Forwarded-Encrypted: i=1; AKwUvBwdxcOhij5qP/mVm2vXhamXDRAo5RCgJMD2nuySyOPRCgekderjkvr0PNknnkqJ1kUqd2bCMuBqda6kUdU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJVZU/Jt+muk97osu2Vn2NF0iQl53pEP29UGsy+oOZM/i+5Q/Ja
	Y3v6wb8q3mSFfUEqm7C5K+v2eMBI6hOqvty4Oy4ARXl9pUiCKwGoTYlb
X-Gm-Gg: AYBFou1Lrv7U0lYGzDfcUtydIoxrpHh66VTrQ6GFHlfpPoTRPF/K78sTd1rnICBwdXR
	uJ6ln6oDNVy6Ydn3gw9N9HgXZiCKyWwTD0Z4wMemIG3sTskliEJaM+Kctm70u0GUs5Snk0150Le
	vSg96YSbB2LcmeAsv4AwriFO1vg6bAfN3FTws1daGZtenpxj1iQGMMdcoSY7Cb96vwF5ux8crSj
	Ms9Q+EpZlpYOvMy8TkQAxQ9GkdzChdG0deVVcsBIUzT/xyRYaSbXZiU889Jy6Tndel9hsUZ6y+v
	9O6VyiIeg6Q+a0x2w8QpObDAOBYSRWkFf8tZqvgXjPFtevcWXo4eQDlkimuwIe9/trnOjxdjwFe
	sDU6zzY02dy1V38zN7RUVqoZlhJpuBEoSvynkf/nJnORh9Itnrb+W7F6BLkl1Hmy7O5Oef4niDR
	POg6wCH2RMcfSAqneoyW3eyVkKGJ7nEpl+dRDaGXB7PnSnAb2+DXO3nvvRLTFzVScIHFwQLsk4/
	fB5IK75YIeqYWsbNXabOUut7ydGcp6OlE5izYoXWv80v1328pyIJ2kt8vUdM/5A1b+gWZFu5TXG
	QpxWuEggjbPC6AaXaXnB2UnARBnINWGID+ZeLQ3T9rhBVaFrxHzgUTeMdzjAW+okjEdQsGWpagN
	pKLrQAIVmZy84+o5xiNhu3Nra1CTmKd+BDT9pNqg1+MJB/h82A4EbmtGDex6k1o+XbZFLIBio6W
	kb5DLYQ5wTzacRHTQKnw3sipkBVoFA
X-Received: by 2002:a05:600c:5308:b0:4a2:86b8:7e9 with SMTP id 5b1f17b1804b1-4a35ac9d077mr14744425e9.16.1792823890868;
        Fri, 23 Oct 2026 23:38:10 -0700 (PDT)
Received: from localhost ([2001:718:1202:45:44bf:6db8:6c32:23e1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0bdd59sm22278075e9.4.2026.10.23.23.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 23:38:10 -0700 (PDT)
Date: Sat, 24 Oct 2026 08:38:09 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Olivier Louvignes <olivier@mgcrea.io>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul
 Cercueil <paul@crapouillou.net>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: iio: adc: Add the Ingenic X1600 ADC
Message-ID: <20261024083809.000026e5@gmail.com>
In-Reply-To: <20261024041357.34346-1-olivier@mgcrea.io>
References: <20261024041357.34346-1-olivier@mgcrea.io>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 24 Oct 2026 06:13:56 +0200
Olivier Louvignes <olivier@mgcrea.io> wrote:

> The X1600's SAR ADC has four auxiliary channels and none of the
> touchscreen or battery engines of the JZ47xx ADCs in
> ingenic,adc.yaml, so it gets a binding of its own.
> 
> Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
> ---

Please use a cover letter when submitting a patch series.

-- 
Kind regards,
Joshua Crofts
