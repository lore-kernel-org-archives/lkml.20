Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792738033;
	b=DtpGn8k5fRl1tl2jfFyqyhIRF8VK/kqLuUYbnfW/I3+b+w2ZvUw4wlwOtkRSm3NHgUFJ
	 gR7ajo5lKzqYlhfpyurzuIuZJ7Sj66RgSohHEouIVenmdqlCeHaDvX47zQtv7WmAX5gZb
	 etxc33O3QaC2XzixQE5Q/PJkFQXgLfdLpa98Hx6HLGCRBghgOqcKsLA0YZu47PS1/Ashw
	 GB78EFQjHMhzWbTpGq8ztpCheJaa62uQ7S8zKb7NX6qSuT83EV2T4m6XT9LUirWkN46Us
	 Fh9kAalwrYyAplKVNaWCOc5AwItJW+r6vcc/T3PDq08jlikIThCzowHTgC0JZdV92iA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738033;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pIi8MdAeFNPPZi1519d1TRfnKE7WeSeOMYcIAex5C5w=;
	b=d3YC3uiTHyaxUIeCO1NWIpwyXxk4ay9t+M0WTnHE+xEfQ0xHmtvup/r2tViVb4sVUnLM
	 CcUfrptXTXc51twHw1+QEbciCDP/d65RDq3yLrRctKXiE+yvMoxCU56dX2erxEofHsOr8
	 VgmRivjz9L6MQcITZ1MVXQf3975k+bR3GShuf2S7zFhLFRLOGsS9KMI33ow011MSMJI+i
	 y5PJ1nuO1tbh/IzQ7CMDVQaojejTWrKGlLm8urSU+VI5xznLP8QyIPvySnmRXX9OGkXMt
	 IwG0VF+offaFLa56bldH5Honi3HwlTGGEsu24FhJgcaQcBAOU8uaLBU3ESfE0arGeOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WrYKUUeK;
	arc=none smtp.remote-ip=209.85.208.176
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AF5606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:47:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78AF5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WrYKUUeK
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3a9841363b5so3223331fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 23:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792738032; x=1793342832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pIi8MdAeFNPPZi1519d1TRfnKE7WeSeOMYcIAex5C5w=;
        b=WrYKUUeK1wAUN0YSD3859zM1x9INQBLFaKDfd/J/HNg68fzU+DejXhaFhHpeym5mxf
         rA2CyHX4NdIYHbc7g6Oqdea5tgdFnxWQdstK2OQMgD+oP6xLiqGH7Nfu/GjrjZejCbBH
         dGSZw1aMinokzAcax9UmLdsA5rxMSnTMwg9W/GLVlJy6Tzxvm7eCa7LuqXnRwjZ5Dc9q
         RzpxpweKS0gHSVEQCkCHMVkHdhDKlVQqcIvwgKjGy6xdd/gAxjnss9IonXTQG/YYmzSm
         UbfW0LusbyQZvem30e4cYKxHwFeOC9Y2iej3vTEeScmC+Uunvc7h0HhamiWPpKZk2nO/
         Se9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738032; x=1793342832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pIi8MdAeFNPPZi1519d1TRfnKE7WeSeOMYcIAex5C5w=;
        b=P6cdet3KxskfwEO7qTaUU3r/3EQH5E8BN866+YygV+8lzPKWwxonUShPnIeOO1AcKu
         zVbpJJ7JvePTjJ9gezTyCPtqkruanKEdotXvYsx7yE7+4LfWxqQpltfOEnmTl20I5sYQ
         8MLJztSHBLHDZLL7KQ+8zJT4HgPWXBd5JAhfresyhP0tMKewt9EO7BWeqP6NaFA6JYY9
         jSAXNWdP9lQyRmKNc5w1uUKceYXs8vTETjzGdZOm2GMB+qiQVNsDJLcafdz0qWdDIHwb
         mveA0h2+O6AUeVz+V1eQbf6JICZHWsCurBrMQqO8nV4VJ1mdrv6RlkrF9MwGVSP6qdk2
         JjOQ==
X-Forwarded-Encrypted: i=1; AKwUvBwaI1PMNy1pabNIKt2zkGwlzATrI1y31CEDhd9ILAwjVRr/sSn2yMk+yzUuBfO+Ri3mkqNVMM+1qSZcdI0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRcRLJ7dxKbJVMLMbYCO0/HlAEfzSkDGBV5X9ZGpw5PB69/zdh
	a6bVRvgtrr4MxtVS511pZBcoOy2Jn0QGbJwuQZNJt1Oa/8uj8UU0i0Tq
X-Gm-Gg: AYBFou2fB8p2ULa+1xeau3Hz0hTjy5pwNKSgtpEpQgCin+U/MpwyWJoyj4t/gkAzDza
	5PW4KEqNTO4NAZ3l4v7bCOM3qoYyY5YcXA/isZ38xhM/oS90d/wdAB59d+GyAA4m3EE6rqwResZ
	uP9PbEcI5rGaKOLTxkGan5zw+bftgM9r1ZzO0eFu0Z5rYlLPfiY9ZgM/JHV/DbQz54ETep/O12f
	cCMCKC4FOdtE3ukUtSzy6PseQBr/hYIQ8t+dwXIKKwceDI601MjhJbSd73JXNd1y+yQQj4FLxJ6
	RGdOjzIuzTlGAwJhWdz+2x1EvEV9wSxop1O3zL+Ym22nDcDkrktuR9pPpwDjCZ5pgjERDsJ+At6
	PKzrkzM4U2PzPDkO4bLvVCZuzXDMA6QZc7DjafDxHuknQKQGgfYenaEwxC2DOF1Ahl8O/ESkR/8
	GNcjFNucFdRVYWGyy0nm9rY6x2d9XRlHJZ7sMdhbJP4Z73ShrlOyUVEhRwy8RKVcq7vBwf+400N
	J5DIYT2AC/ZDxPFsyfji4GSqpj0q+2YjWY+00IfphMxO4zaL3NfnQRy/tXGYTpMA8DzpxosrqPG
	4Xf5Ou9L05/uB/MVoxbCc8JbUQcV67zZg6gB3Zs2APjCF4HJbNpcyD1a6sqzWhG4
X-Received: by 2002:a05:6512:2c8a:b0:5be:414b:a84b with SMTP id 2adb3069b0e04-5bfb0abb0fbmr363051e87.51.1792738031443;
        Thu, 22 Oct 2026 23:47:11 -0700 (PDT)
Received: from yantra.. (nekmmqug0dsu0zzscv2-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:9db7:a72f:37b5:1f1e])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb027372csm246233e87.14.2026.10.22.23.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:47:10 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: jic23@kernel.org
Cc: Bart Van Assche <bvanassche@acm.org>,
	Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Marco Elver <elver@google.com>,
	linux-arm-msm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] iio: adc: qcom-spmi-adc5-gen3: fix lock annotations on mutex helpers
Date: Fri, 23 Oct 2026 09:47:09 +0300
Message-ID: <20261023064709.77180-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021202433.0efc7979@jic23-hlaptop>
References: <20261021052435.112686-1-zoone.rupert@gmail.com> <3f41338e-fc47-4306-b68b-5a81c26027fe@acm.org> <20261021181944.14272-1-zoone.rupert@gmail.com> <20261021202433.0efc7979@jic23-hlaptop>
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

On Wed, Oct 21, 2026 at 08:24:33PM +0100, Jonathan Cameron wrote:
> I haven't tried yet, but I think you said not much broke?

I hadn't tried either, so I did: CONTEXT_ANALYSIS := y in every
drivers/iio Makefile, on testing, x86_64 allmodconfig, clang 23.
255 warnings.

240 come from iio_device_claim_direct() and
iio_device_try_claim_buffer_mode() lacking __cond_acquires(). The rest
are 4 in industrialio-core.c and 11 in five drivers, none of them real
bugs. With those annotated it builds clean.

v3 would be this fix without Fixes tag, core annotations, one patch per
driver, then enabling it for drivers/iio. Does that work for you?
