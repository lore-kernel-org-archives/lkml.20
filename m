Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793021396;
	b=bE+cTpWGmbccG+dBaaunzfv6sWo44x92DPSVcSVvENWgncf4mgvWjwS7i8zEaenelX9O
	 OwhRtSBbYvvPnuyJYeqGj2UPcL5tyeKEQBvsKveQPh/3w3HeSxI4Eg6m9rnT1ugCZ2BjY
	 iodCE9j38O/f3JimnYnfKQJyBcr8C/L3TwFIeUmK9Z2jLpzF2W5FnGs14fbr/F8s6Q3xl
	 HOPxO2Mzgcn+aZPo1cJ4dcDIwttUN6o6BD6p1QzDIn7FSXEfzsVB2V2L71L1lWXju85NG
	 h2hM/4bjPNEVaizTIImTwT9Je9nQmNjUal6lCCgqsq4YhQwtvtiIME9vzK0+mBjRxPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793021396;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=+8H3O6quflUjqnAfb6xhcXaxZg/Y3GPcBLpYGFoqzbM=;
	b=acrlK/0ynyY+clZnaLEra1ygqZxxKd7Xa9eM/84P3Fss4TdCU/niWlQCfdzfUJGt6Sig
	 oeiVqQAYf2qOxPPmOW4ihdWyWAK18utle2ReRdMqwUlDje6brh0Aorp9UEqGYFQ8uwCnT
	 N4hzNaa3E+YefeKnmUqR4+aNcK9OUqcpns4J5+7ZNMEgFvKxscmdM5wJAJZJF4ZyjHQf+
	 EHxT0wHW2kPzH/O0z3Cx0xCg6etKztN1GD+DT8VEnmvASEs4ONYrnF8xabKd2Dp+ERfdy
	 l0sAfDFhinC6uik83u2y8r5cW1iQwIYBj7OnDISzLRvgH6CDWfji1w1aYPhAJgS3Ypw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=mkWnB004;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71BD606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:29:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B71BD606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=mkWnB004
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so21062505e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793021393; x=1793626193; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+8H3O6quflUjqnAfb6xhcXaxZg/Y3GPcBLpYGFoqzbM=;
        b=mkWnB004RlPg74PYFUh2tTt5NpYjKdrGeCAQaj7PHkLTmly/tXgRUMdoL0rbvSYRBl
         M4+0H+sAkY05Lm5cXHNAMt5fNYfLfpFvidaG7PUVyu3DMQrMjU6tEC0NpBL5ARPMv7Ko
         qETOh16A+rTpCbtYiPF0AXbE0R2Fm7FWCOxNIxxKR05ArcnX70DlM3b2vkWEEiOZvKR0
         Ac/J76/OZH0+z/OIuYnkPmCJluuSn6ActgcovWxHYA9apBvKt2XdMy70sX6/eda5aJ0Z
         iTwYmnUbL78hXpaoeMyvnyFg3On6HuZ4ZtuR5DgkqfbAay1elIKAnfPxHvuYU2EPF0+l
         pVvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793021393; x=1793626193;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+8H3O6quflUjqnAfb6xhcXaxZg/Y3GPcBLpYGFoqzbM=;
        b=QU+xv3CSExlHWJBpPRzUja+owuBOqvMkJKqA2Y0pnSgT0+6WwlG56YOnmdx89j42uH
         NvxBsNmeCfBqwWfffL6hqMBvdNdvGUbyZFHQ/zuZUChkaFVSDKo7LaFY+8vyg5u9Opc1
         tIx+UcaOJ5QaC6s1GZOnL2h5SlETUSu1/MAlVRzDekakBgbZI1DeWonCBc7qPaQrhkYv
         tNPxu5u7TtKI3YBX4j4/Mg27HNCWteDkiaFx5CpM8AUDGHuVrxWZFjtlI8bzN59WKC7P
         b1NTiBasvQnw3ofqRHQlN6PpmUUR7xSbFqQU4n4UXy2J8n9YbJsD7nCrqyCbGJAlvMHD
         PiGg==
X-Forwarded-Encrypted: i=1; AKwUvBz4YobsClg+cdHThx5FAE7BAIxOSjr8emh5/dhwz7g7PjZbD5c90YYeKBET9n4ckm1ue+2DPgRoH1eWGus=@vger.kernel.org
X-Gm-Message-State: AFq9FYK0sI8lUziLx9cs5zMt6oLxNY7UUwvLz0CRG4565LhUsjDd733E
	xth1s2uCmkvDw49nCEfXLYf4RxCgZy8c2OCnK1VawPM/REy4U/OLLl+GVBoQKGuPNLY=
X-Gm-Gg: AYBFou10wM57EYq6oSk8FEj3EFbW9Fpksnp7OUX+vS7bEARz1AqsTJLKOtc6F056OPD
	XWHd9dbcQJzs9zVJgAUY/tzOHiQ+vyKHl5b3hh9DffamCJNwfbdCF1x580slTmVG4YyZlIr/tK7
	Jy99BqMZSYMNRo9wxnvUD9rjf8uBxTFYK49OEPF7PAHyDvwTu+L7av+QqwQI7bImIHYbub1/pQ3
	hZlAVYKtHCZOJIvCZaDGdCXTZ1x+BAWL297FhHtT2JUgMavzpyQK+V7b1rp45LBqYQUkK3gNlfX
	PHatgn9qKu5iswIkDTAc1kLr1ZvmtLsUjja7e4uGj0lxqgLxB+ZSfHtFLylUTt8yjbTGi58tDng
	Pg7lQrvPPjb5khs9moMSMdh6vA5N2n6FW6EmgniftiOGY+azZ36+hAXB8pjJummaa0pzyTZLxP5
	zfXdAzCHpUZm3MPAYtwO/nFGQ9vQfdvkttGhIUSLnZ/LpLXshgHHIZ5+hn3HD60GCf+XnpmMHt8
	WB8l5bQXv3CTkUrvIUPCBkFdOYY70WynqIUm8/Ye3iSNxkS6AfNcFimOzN4WRNvrMBcLVaxMk7/
	pOmwjCqd72Ovqn1mvhZpiuoxZm8jBHuQnDL43ZO5utp2qqZFd529DkssFGu2jZrNpRdB1wH/
X-Received: by 2002:a05:600c:8b63:b0:4a2:1960:6fa with SMTP id 5b1f17b1804b1-4a35ae7027emr137803465e9.4.1793021393144;
        Mon, 26 Oct 2026 06:29:53 -0700 (PDT)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359fbb725sm194507095e9.0.2026.10.26.06.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:29:52 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Subject: [PATCH 0/2] Fix rate rounding for Meson read-only dividers
Date: Mon, 26 Oct 2026 14:29:43 +0100
Message-Id: <20261026-upstream-clk-regmap-ro-divider-v1-0-c8216b0fb93a@baylibre.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNwQ6CMBCE4Vche3YTW6KJvorxUNoprgo0WyAkh
 He3yGEO3+WflTJUkOleraSYJcvQF5hTRf7l+hYsoZjs2V5NGU8pjwrXsf9+WNF2LrEOHGSWAOV
 4A+pLbWMDQyWSFFGW/8HjeThPzRt+3Ku0bT81nJl3ggAAAA==
X-Change-ID: 20261026-upstream-clk-regmap-ro-divider-f9ee3532fbe1
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0

Meson read-only dividers can round a requested rate using a divisor they
cannot program. The clock core may then adjust child clocks using the
wrong parent rate.

This series uses the divisor already set in hardware. The first patch
adds a missing /4 entry to the GXL and G12A HDMI divider tables so that
all their register values can be read correctly.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
Carlo Caione (2):
      clk: meson: add the missing HDMI divider /4 alias
      clk: meson: regmap: use the current divisor for read-only clocks

 drivers/clk/meson/clk-regmap.c | 34 +++++++++++++++++++++-------------
 drivers/clk/meson/g12a.c       |  3 ++-
 drivers/clk/meson/gxbb.c       |  3 ++-
 3 files changed, 25 insertions(+), 15 deletions(-)
---
base-commit: 363f97a1ce635b86be7fd263d56a040fbd87bdbb
change-id: 20261026-upstream-clk-regmap-ro-divider-f9ee3532fbe1

Best regards,
--  
Carlo Caione <ccaione@baylibre.com>

