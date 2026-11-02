Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793636879;
	b=5lG5iXTp+WApoM/NvmsZpnnny9DatnzC6vMUNerh6WL2EbFvfZuydPnMiEKQbe96VSL9
	 28gjXns2ECPym/Yc/Nz2IWYsoWgHYvQ2x7+ARD5mPem19Abq7I7ip/OfCXUPDZcwKv4IJ
	 wT8MLg8wA1LAJmnXktZy+SGlHE1EGBahCIHzpyfA0KzJugguGKwxWWUrrICemBZgDv/v3
	 Lktctj+K0pvDtuJS/VG3lGzJm40A+KtX6fkgTVpIK3imesFOY7s/zPYc68jNCNd4jeqAQ
	 tdURLfm0iSQfa69UKw/4KGqZWNicGeWulwCd66cvFQ8cRRXNRjssji22MQByrDjMwyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793636879;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=6Yzw89lsinqooxl3AQbwM5bflwcgQEHrujUJ/xTqMIU=;
	b=YCR6L77D7KZ2FAAnCzSzi9BylN30shpRG+PEERtvO3MIn3m9HFqk1kKTkxLu85MZrsUH
	 TzzdCMPvwyUyGG4VJyZAAPuHU2KjKA4WAG2rzHql0a3AJGqmLkwPAStnFrOFXL5hTkDCN
	 2HW856ort2PH0HHLj9zXDimvtUlvKnH/9/O0Wr08SLdFWaq+N7mxPkTQHQx5Z7GplP5fH
	 wk/bShL4JEbrAijr9oAtlywN039zRgbZP1+K0oGl74scvChOvPdbXDocLPHjxzE2jo7iE
	 JP6H/bmkIjmXBK3XwqmicU0ffw1ucMFcmvQ+Hq81MaR0Rlq6Xyxt4cwGWT+t3cRE3Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="N/JdCmfo";
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2705B609EE4A
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:27:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2705B609EE4A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=N/JdCmfo
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48c45111bebso1368590f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 08:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793636876; x=1794241676; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Yzw89lsinqooxl3AQbwM5bflwcgQEHrujUJ/xTqMIU=;
        b=N/JdCmfoOQK7c/GlMh6ZWjDCLLUajzBzjn9fBpsmB2HQvN6puxJw/UkqIE7QPHlIoW
         6K4m2yWk+nOk0+Kpdqxy5DIFfGmfpa5iCOJSQsL/lf6IuhXBPyzUIAgbNDgr+QvlRXEd
         2Fmhluv+O62pXpzWu3XwgrWs4FPPga0Zy8OwSH0JcuHNWRKoSMcdxuKftMW7KerTEQ/P
         gbIFOi+mBMM1Pl8qPZmEM8x8LRimJvlhMxDo2kkKoPldlJEdglHFuYzCyKVDrAgVIS3x
         hdBHEPyglDigrWnysmsToQwL4mR0MWyhWNBlIYW0sIsTsfoxIpBNgQyarKxekqle1GWB
         0AMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793636876; x=1794241676;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Yzw89lsinqooxl3AQbwM5bflwcgQEHrujUJ/xTqMIU=;
        b=q9LaK66HWQtK0zkLi9YlRLSy83KnxHtnBNXpKg5X9emv+sy67a+gSnFUP+yh0lDt4U
         EMiiP7fsvySNkfa1lmpa6fTve78rH38egyv8Gz4lrjfHJvQEI+T05YNmCcBt9ZSKl9pz
         kgonYri2i3/UMRoLmq7ErykVUgdZklzZpL1k2w/hPJG7v5QG59NtmHjrogNTNnW44MAm
         V1Y/L1u9TUb9poyBi+XojI2i5kSKGR/OkrJ7QCbk5fo96TJm27healbF+ZFBfuZCsNnd
         18Qzmo+UVQsVUPQVeCsLcN2YWKb5CpoLATxxdjC1Vr9YCq8ClzPHOZcnDymXNE0M/2KA
         RYkg==
X-Forwarded-Encrypted: i=1; AKwUvBwEnXjc0alZIo2HcN7StAvHVLC647KuiEakrrRANCTTScxuVCZLKiqZDobKmQajVLGtuOdXCpULw1oER0g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9v83boTQA/yxlIy+8biPawke7FwUOGLg4W31mbftHW0lDFknSa
	jXqJpIZKqn4KQhyMAAxTDzRqluxqLqEbwRQBls1zAjLe2AdUhTI5IPuKiQ0GrawtrMY=
X-Gm-Gg: AYBFou17W8HDmXaZcmhi2nxnBTeNa2/3NwGMEbhQZS6FZJRN/tXOFujhSM3GHVzJJwF
	Fji6xN9D5DxFE7PoKJfFSe8/EtIzFrSeh2ymbIuPctn/j94PwnhTttsxx/wHFCbkrCUZ+B5Rrq5
	GAneI76aSM7KdjSeu5xuIWa5a3V6VhL6AEraS8nWZ4si5nhgxc9adr6zrHUBAhkDXFnOPhPjxA1
	jO1+77WarOdgdzudo0jE+XJ4yS4UpHIk40WLNwJXnu0NqzVZQawQXkbcCFGwmhhMLroF2fG6915
	jBmIpYH19+yK8knwyt/EwXGn3vyDv3cB+JAHptpNmk+MGi/RWP+sUrOofYnxIcIvw5r5udv9K5f
	QT8mCXTiLux7JkXfTeDZirlKVg5MM2OVdQZUnZ6U83YRjWoV4MAyBTu9+pk4jfBo7YYnsW2+k3f
	K1v9bXBRc335+9TZGxJ+nFgZ0+iM5ho4mGQCgQw4dK6qtnlK0g7IqgKX4dxHiG8r0vW6vju4kN1
	Mc5Fp8FixQXtt7Q6qQGy+ZWJGSh5PSWMzr9B++e1h2X0m0ArwP10MONxk2cr8wgeCVYb4gSXroU
	DO1lxQxT79G31izKiQ+TGxHlrd4x/MV2X9Y7HEoEpJfLTG9GAQ==
X-Received: by 2002:a05:6000:22c3:b0:48e:61c9:4e32 with SMTP id ffacd0b85a97d-48e6e505515mr22460208f8f.32.1793636875388;
        Mon, 02 Nov 2026 08:27:55 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d425sm21327567f8f.1.2026.11.02.08.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 08:27:54 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Carlo Caione <ccaione@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261029-upstream-clk-regmap-ro-divider-v2-0-7a375fd8f88e@baylibre.com>
References: <20261029-upstream-clk-regmap-ro-divider-v2-0-7a375fd8f88e@baylibre.com>
Subject: Re: [PATCH v2 0/3] Fix rate rounding for Meson read-only dividers
Message-Id: <179363686177.2573818.9840227299008811238.b4-ty@b4>
Date: Mon, 02 Nov 2026 17:27:41 +0100
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
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=78; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=6Yzw89lsinqooxl3AQbwM5bflwcgQEHrujUJ/xTqMIU=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFkvdnHpxHrPXvaH9XIH+4SEyWdKTjDzFkYtFOY7YbPEt
 ljWNNW4o5SFQYyLQVZMkaWGu1r8naTWl1nTdW7DzGFlAhnCwMUpABM5dZ/hD0+n5LxFfV82ZzPZ
 LpyvGbFFh8d2+Z7r0yJVltn8e3RUezHDP9Oft5buYvW7J6K6Z1Hb+ym/t6j/8G1lnzSlRvlYf7X
 6Ri4A
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Applied to clk/linux.git (clk-amlogic), thanks!

Best regards,
--
Jerome

