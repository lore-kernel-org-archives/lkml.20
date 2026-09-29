Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444AF51FCD9
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790685776; cv=none; b=m1mVjyRBa8By97+vgQY8IZ3Y1//3g7NJJUuZe5eE5UJkIjPVQK0PUk6S8IuEy1s95dCMl+Va5c2rur3KbfSwKCvIRAots8wS94UIJYCNdHfVicIHSqtFMcLAjqBn0k8XVFmwTwKRC6xBIsKqBpJAhKffr453+FlhNtqUHcb2tAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790685776; c=relaxed/simple;
	bh=mOxRtsH1JPL9owXn0qNOVeNblRDMKMjv/lQqgZ1o4Fg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OC1Osz/H1Ae/6mZJfd1+08kztj2VDEZw6EUFbjP7CKgwgJ/IqBesEmmdTz7HlIP66iJQ+uAHpvkm7JgZGSGJNE+00gG+GIIWotU2CPM3L15diaqYoGIdTVWRwovmVl01wsWLRd1ZhE4Zl2lm4wH+QMOed2O3RmrvP+Z2+dti6ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iXmuXhJm; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iXmuXhJm"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a006d3fe83so6011265e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790685772; x=1791290572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hrtHWB1jWF11iA4PyaL+aKgI4wfwu9cWtf1zbD3RIvY=;
        b=iXmuXhJmsqKyFQ0XvUheRdbmdvjHox9lcZyyT73qwOydBajUaXgrJqvumfLIlMT7mJ
         IEs5x/AhYwkAhsIeFmVSX0P4Wdso791EHKMG14P1HRzEbEMRVIy082O3NL94Sg4OhdAk
         WzVyx9Aa/TJ1c5yEAbaZLCoyXs0YTKSZa5tO6Qom7pSJqBkb9VV3JshtNUXNhJxBD+Q4
         ol4nBUrtAFBnjLWGAX2k0CBerSA4mE6LLB/poDIxcRMCFL0eU7EBjnlHqwhxh2R4+bmv
         IgLpOXSNkM8I8Jm/oJgThudS8CD5rkv3KkMus2o6JdZP+BBxSL1ERB1Yl3KxPcwt+UzG
         LYpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790685772; x=1791290572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hrtHWB1jWF11iA4PyaL+aKgI4wfwu9cWtf1zbD3RIvY=;
        b=bD4yfyGjmA6YMftJ/pFD/bGs8Y1u3ymkS4XGCnNpRMvhhNFyD5Cw6OvZl7kNFHlk0F
         JRXyMZGWh1asuqGELaDHU/vsl9jSI4cGdTYSLQQQdL24YcVTlFKQ5+VXZ4gqwkf+AXVZ
         Lq1soGjFANJq0ww7qKKQCTijswOw55EUWfiwjgJLmSAno7YLG3tasQlZMwFGqwUhx2Qp
         PK9+bkU2adwEt/+7mqJYL3Q/G+0BRpwCo6dkEecJjQKn0nydJ2n4CYf0SePqTV3Pny1x
         BynuSL04ajO7i+Z+QkaCdT5s0ICalcQXxFypiRHMOEGHz4NdQob+DbkORMBPNlTH2mEs
         EuOw==
X-Forwarded-Encrypted: i=1; AKwUvBzw1bWO9Zm9A+ARsKLtGE3/X+s3MU4waO9vw7mWotDSso7/F9GfVY89aUnctav6Uh03U9OgyA6yehAyK04=@vger.kernel.org
X-Gm-Message-State: AFuF++mCTtXUsg940AEAupuo0+TNKeR0d7LtHRhUvtGROvwGfJ5fM/Pz
	m34JM1AwX3K5eds2iABto9TgD9ADoCBrml/5kg6QKnAUXvMclNP5gGE3
X-Gm-Gg: AYBFou3OMHEw60hoaWIdvSzSCbH68XPBr83u6w7SU0RIF12lZG4l6qbMDTlGIgGTt6j
	rCryotfKEJYVm9CrtOASF801bL/1nOoal4CjewpIb51n3WWH0tMY6pPCyZUhcrSaUVtDPaClXLs
	w2JL2eanlL4jw9VkOjuusbzb/LVg5Tfp2ixwBife3HpkoB60o2jOSPZqQwtBEKRttUKYIazWJ3Z
	017ZK+yexN1piT8VEsDFwcExviU7ZBYC8Zxmq0OuT2jZmOVis2ckDy9LqOJZCaEWGrFxCrTjQrC
	eJURyTZs++KmABzNnWy4s+xVp/nk5/O0kMWwxlbVZWGxfMlPEV5veVHfb4CIwCD4SbTza6c9WdS
	+OzjMK+dYkE7V7yK9/sVrjwa1rmHxdblgHoSwdNWRFnCpyEuYLMW0195LQy3sC79TKJM1KHcggE
	+xL5HocqiIQgIQX3MfBqYppMig1RJ7hEbo32roz8+YgY+RHikriAR/nHxIy/muvHasOnSETEBmh
	S5BExJdtPTo1U9UW1rJx8b7gXbGseBOWUJOzn0m/dRmT8zWrzLJtN77ytuNRrYa486ggfEOf2Y0
	EyPLeMibrD5/tooiMQ==
X-Received: by 2002:a05:600d:6454:20b0:49f:fe89:efca with SMTP id 5b1f17b1804b1-4a00d7b6dcbmr33387045e9.19.1790685772306;
        Tue, 29 Sep 2026 05:42:52 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:be4b:8730:c872:1736])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af502da06sm4436630f8f.11.2026.09.29.05.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:42:51 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-iio@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/8] Add ADC support for RZ/V2H(P) and RZ/V2N SoCs
Date: Tue, 29 Sep 2026 13:42:40 +0100
Message-ID: <20260929124248.237032-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series aims to add ADC support for the RZ/V2H(P) and RZ/V2N
SoCs. The ADC IP on these SoCs is similar to the one found on the RZ/T2H
SoC but varies slightly in terms of available channels and configuration
options.

Cheers,
Prabhakar

Lad Prabhakar (8):
  dt-bindings: iio: adc: renesas,r9a09g077-adc: Add RZ/V2H(P) and RZ/V2N
    support
  iio: adc: rzt2h: Wait for the analog part to stop after a forced stop
  iio: adc: rzt2h: Add chip-specific configuration
  iio: adc: rzt2h: Add optional reset support
  iio: adc: rzt2h: Prepare for SoCs without sample state registers
  iio: adc: rzt2h: Prepare for SoCs with different ADC info
  iio: adc: rzt2h: Use scan type for ADC scale
  iio: adc: rzt2h: Add support for RZ/V2H(P) SoC

 .../iio/adc/renesas,r9a09g077-adc.yaml        |  38 ++-
 drivers/iio/adc/Kconfig                       |   3 +-
 drivers/iio/adc/rzt2h_adc.c                   | 321 ++++++++++++++++--
 3 files changed, 335 insertions(+), 27 deletions(-)

-- 
2.55.0

