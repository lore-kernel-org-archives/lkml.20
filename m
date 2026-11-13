Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794604183;
	b=xxTBbCj2hprFWO3VgfwLzpFFlnAxPJAk1dMlqgMhqTHljFMMuO+QU6KSnlOJ10dfnscO
	 dbuM9SyLkAtRTw1PAqTLcpN5T7KJVrg+Kj4kO2Dnmf9i/M/PrnbUqEWWTHe691OWM7Za4
	 4KmVPmkx7zGfwIh0Q7r5ObLwHMT+zul+VVS1zffS6HPWfDMlQT8VsXUX5tBhqkUB4wVb6
	 6J7TTt9JqywHJ52mjTYiWKWPbCh8TvZiNKp7tbr0FAZZrVxO+g0Mqx5JbYmB9+UNtkq27
	 GDx94zB3MKRn6/Aj6cRyZRgO+zag4ygKzAlKxquc6A2aTxY4DG+NIm3UvjWvGzkRxSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794604183;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=kEhCbhJxhFZz5+IkdVTZLQBzFG+PYKljMqg0fOSE0pw=;
	b=dOx7wFJe9iSz3Ty59LY3hhQhbQVFBTWo1Ji1J60pfxmcqJdjHu0MnWdhThJimimFU4+1
	 rzlmGemG6IHvc7LjE30GDZVuc7HsP5DjuIkhtej9tF9BPlOs8my5nao6tht5ANJYP/4R4
	 Pi1uKzrRvmqCpDs2q2mAQEX8wYp9f09/GDukuU99uwKEDNMinTuGaDtp6nvTJxohcLiB0
	 ycjT2qEvBI/JnKGrt5KZWq3TBs4UhpXnIfTMe0ly8pf14sTKahxGTRnIVIZs6Bv8FXNC4
	 0+j5f9GgeQSrFeeU//aNDi4tZ/cP3klSKSta1uudjWxdecBfuGuPQHZ/B2tE+BecUDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mL4bWoI1;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1025E60A3837
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:09:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1025E60A3837
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mL4bWoI1
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-37198ed3727so2839863eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794604181; x=1795208981; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kEhCbhJxhFZz5+IkdVTZLQBzFG+PYKljMqg0fOSE0pw=;
        b=mL4bWoI1mpeMMgydl8Xi9d2krbL4oJdwH5dCeLzhcLNDqmkJeCUaFBJPwG5csoTBCA
         yQosIHGXgtHK3esf/hwQtiVpDpS+LeYZsaNYU9xQunGvp3H22PUO/6SMho5UbuXCpeCD
         weIZd7D/MGUjs+KEXZMU/C1/MVZILtvH4SRvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794604181; x=1795208981;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kEhCbhJxhFZz5+IkdVTZLQBzFG+PYKljMqg0fOSE0pw=;
        b=2Ujui+X++I/G7/OaAh1x0lxoaeJqiNrN5qXZDlj3Al918qN8M5abFqzfMHsUBQkidq
         YUENgTkXYffMd9Wd/TyJwXvVgqUfiQplH0Z7hP+PzflgNNOHjGxZrZadH331NkPJrJsC
         qF2KmRu7HBOl3H9k2MnQhwtjLUJRsTJImyClpUymL0umZfbNl9X6tqj9ptYcXeGZWbXi
         Fc4smimq22fWrfUTl3eK+bBdaoU74sSN6fQxWOr5drbabsnnWgH5teEBT1vCcrjwxKEV
         PqMsz7Hrz6vKq/aadoM+eELrFFil8WpLrdu0604+zHASCRt86IYCPQ0va4Z6lo5m+2Q6
         d5Cw==
X-Forwarded-Encrypted: i=1; AL+hErG4bLdEF/23R9H4FoSzioz8fSb5/DAAEaDWj0mF2ZFI6tLg5TzaU1+zWfOY4r3CfEkirSsk92/m0DoB3m8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kSlVVKNGQBUqQjmr7O1NOZeokzpsNPkWttML3Oeq9uJGs7eLg
	5A7eq+BRxm3dS1hvk/Um/xUu2hqKheaLH4VcZd+Ja8Bzs3DE9iD5j/WYfVhb3ALSWA==
X-Gm-Gg: AYBFou0OtX6dWY5dBfckandpmkwW0BOgJVM3Q3oi3oVNpYW0G6AIFdVDy1/5AV3zWi3
	xQpJjWNNS+UXrRosjSmS7g4yv+oCryDSQxq7BYsvI7gyWT8S2r7PsWzt/5jRa6dXnBAvW2g+agS
	1cOe+sSwDmrW8yBIBALJIlDjKHqFR3g3NGWL3PJeqNaGhHpTYPCxneJ4dUEMM3aZjRjsKXDi72Q
	7hD6IUlZxV5twdeE1qpUOuIVXFH4Uiq6H9PWkWdhBHs2oMrGuLYDWZkilVKgeCvk0+BDq9fHYeK
	Ej9MIphWOty/c6syQSkjpT/1ndQu+mM8JjBSGlQW1nv9hYStgMxPDLiIclPl3lb0OcWmUS5xJ5K
	vENTDTFUsud5jEH/JqJV7/48gmke/JiH7dvKLm5cV5Wu0yGDhoScSyCkQWJzzXOse2OnngFniwV
	rZ9b6RIj8aTbqeComJW1J7UZ3NSLcN9GFWH9VaPFRbei/uliptEDH8tVWNYERrotG0YrmqBqWtW
	kHBUKGpBZPrp9q+mGtoWrzdYlPR704tciznTGVq4jKb59euI9z0kmx97bu3Ld2VDKDtiWmrma9c
	qlMd+okTf1fLrP6hAoGrtF8pXy95Gz0cOOESqVZuLQnWq71jWZZSnM2pwcfxMskpuxugYS+4pgx
	OjB6We8NFgNB6PyfEdPdsAdwx+xLMrD+39Q==
X-Received: by 2002:a05:7022:4093:b0:1b3:b455:93c3 with SMTP id a92af1059eb24-1b5030cf269mr3095118c88.22.1794604181056;
        Fri, 13 Nov 2026 13:09:41 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:38c:b779:3be9:e682])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50300e5dcsm8463040c88.0.2026.11.13.13.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:09:40 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	Julius Werner <jwerner@chromium.org>,
	Michal Simek <michal.simek@amd.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-kbuild@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Will Deacon <will@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Devicetree@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Nicolas Schier <nsc@kernel.org>,
	linux-kernel@vger.kernel.org,
	Saravana Kannan <saravanak@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	devicetree@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: [RFC PATCH v2 4/5] arm64: dts: google: lga: Add lga.fitconfig FIT configuration file
Date: Fri, 13 Nov 2026 13:09:13 -0800
Message-ID: <20261113130858.RFC.v2.4.Idfb669fd6c518bc86e45d8555f159c0ec611a6f9@changeid>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
In-Reply-To: <20261113210918.356261-1-dianders@chromium.org>
References: <20261113210918.356261-1-dianders@chromium.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a FIT configuration file (`lga.fitconfig`) listing the Google Tensor
G5 (LGA) Pixel 10 family boards (`lga-blazer.dtb`, `lga-frankel.dtb`,
and `lga-mustang.dtb`) along with board and SoC ID/revision metadata in
each configuration's `match-1` subnode [1], allowing the LGA FIT image
to be built with:

  make \
    FIT_CONFIG=google/lga.fitconfig \
    FIT_COMPRESSION=none \
    FIT_FACTOR_DTBS=1 \
    FDTFACTOR_ARGS="--strip-local-fixups --single-base-dtb" \
    image.fit

NOTE: At the moment, Pixel 10 doesn't directly boot from a FIT
image. However, packaging scripts will be able to take an image as
built above and convert it into a format that the bootloader can
handle.

Each configuration carries a `match-1` subnode (`compatible =
"google,board-id"`) with typed `board-id`, `board-rev`, `soc-id`, and
`soc-rev` properties [1] to identify which configuration to use on which
board without polluting the device trees themselves with loader
metadata. Having a structured (and upstream) place to store this data is
part of the motivation for landing this FIT configuration file.

Side note: at the moment, the Pixel bootloader can't handle picking
overlays based on the `soc-id` and `soc-rev` (it only uses those to pick
base dtb files), so for now we won't be able to support boards that
might have different SoCs. I've included the `soc-id` and `soc-rev` in
this FIT configuration in the hopes that we can improve the bootloader
in the future, though.

[1] https://github.com/open-source-firmware/flat-image-tree/pull/66

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Replace checked-in lga.its with a compact lga.fitconfig sidecar file
  consumed by scripts/make_fit.py (Simon Glass)
- Move board/SoC matching metadata from the configuration description
  string to a typed match-1 subnode per the proposed FIT spec extension
  (Simon Glass)

 arch/arm64/boot/dts/google/lga.fitconfig | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 arch/arm64/boot/dts/google/lga.fitconfig

diff --git a/arch/arm64/boot/dts/google/lga.fitconfig b/arch/arm64/boot/dts/google/lga.fitconfig
new file mode 100644
index 000000000000..fd90b85c2fb6
--- /dev/null
+++ b/arch/arm64/boot/dts/google/lga.fitconfig
@@ -0,0 +1,22 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+
+[lga-blazer.dtb]
+match-1/compatible = google,board-id
+match-1/board-id = 0x070406
+match-1/board-rev = 0x010000
+match-1/soc-id = 0x0005
+match-1/soc-rev = 0x010000
+
+[lga-frankel.dtb]
+match-1/compatible = google,board-id
+match-1/board-id = 0x070306
+match-1/board-rev = 0x010000
+match-1/soc-id = 0x0005
+match-1/soc-rev = 0x010000
+
+[lga-mustang.dtb]
+match-1/compatible = google,board-id
+match-1/board-id = 0x070506
+match-1/board-rev = 0x010000
+match-1/soc-id = 0x0005
+match-1/soc-rev = 0x010000
-- 
2.56.0.611.g1030f0b940-goog

