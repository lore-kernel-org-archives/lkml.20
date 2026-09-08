Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E4B4B0498
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788872881; cv=none; b=qwkECqKZm99APpBZNsaI0vB//1NhrS+UUYl6QMq3znosD9UVRSLMp88vQfJJ13ZLmfmQbVnruZg6dx5+EylmWK/r63vHeM5hW7JYRw2wRVYBCBRnrdxmRidWqwwE3LDsvIwLWJ59WaIM7y/+ckT4rNOY/Kxfjls6yFJ526LTzRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788872881; c=relaxed/simple;
	bh=cw2N3W41LXIl6pSddh/dl3HNjG7u1Myg/bxOr7qfT6s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iqOyFW3zqw0kjLNAvtDZ7gN2ySzfCGI8VL2jgzhLgFCri695cvTw4UQpUW9EBEfrmKUcgLGHnnIaKhOYuPIfSku6SfJso2I77ETjElQpH+DxAWOdU9P947o5DzKsGJlQH4IuD1sTtvJhv7q837DWjm4Ui2tYDA6WlX0WbBw08Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BWlF5NOj; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BWlF5NOj"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49d05d51553so24761725e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788872878; x=1789477678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cc+P01fTvqlQKKHP8oo+eSTRJiBil/x3iDFvTP+c3Tw=;
        b=BWlF5NOjRo77e25eNBABnQaCIu8Hwcy3l4eaxOIDunZ3G/QOrArB1kRyq0GcoEdTwc
         5Q14rHIIEzAcRe+cz08DS4QV92pGM+iYQfWpEE6PqW0GDDxmEVTAsjVNXuHUXooQPKrN
         tTV48eARuxS6QidGiRwFRLKB9MjQWGfUI1ktaq4pEmtyg5Se/78sKgZyxgYytQb0z1s+
         mZZrAV+LiqoG0BMwekf85kErhIu5jea7XAFhf+IHKhNzxKpUUgiHXd6P4EsR8bet3L4J
         cCJ1n1yBqSENWeCdLy0RTdziVkCFPBwONaQ8BKSAWeVUlXRoa66Ln08QdfyGqH1hWQte
         CcwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788872878; x=1789477678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cc+P01fTvqlQKKHP8oo+eSTRJiBil/x3iDFvTP+c3Tw=;
        b=DhV6KTBnS+aNwFO9jPh+mf/tjciF8v1VaAZrXEahzMHBlZvVMjRuNDr17QtyVxiDZx
         SijDs6LZGB+8wjL8yB4lXYQJv6rG+3DChV6MmavqgLUNZWjiR3y8iF/yaaEMQZxsgjtm
         IBHoqPHU+kWGenze0VDpXdRYpCdeIXsnMDBPBB6iDIeAdL2MADCvlag3wFo1VM/2rTeo
         zLR/mzGch8+P+9fYyyon32G22Z5jZpLQTdkNG3MYaggtnJqdLgzGO1Xc3RwEGEl7uoo8
         zrxvUGWEAM5OsS0a63TPW3ORBv+oGLULdhjNvzBXk5eDvbkvKY8rcN4MXGgdJmFf32Nr
         /gFA==
X-Forwarded-Encrypted: i=1; AKwUvBwUzURYVKndO5PC5D9h83JIZNlz+EZYxU0WQMLI8FKG9WWnjV3BDtArrJ4kgPoaCScevCLAmI82Lb6n/Do=@vger.kernel.org
X-Gm-Message-State: AFuF++mT0yqarFgKQITyGQlmzUkFOSxI8qf42EcPQn4Y1BoomRmRABaY
	8dHYvO3PY2cbKSHnH3f1vILW4rDO2mXXkk0c98FPkdnJNyiJfjchQizQFtJMlUz4TTUuDA==
X-Gm-Gg: AYBFou2i/+Qjq/bqj8AqJaveAzNrO+U2W8zPxqqnxP97g2iPLplp7BJP9N/2tXhFp5D
	RgRFRsO778EOE0VkQ1JpfqJ8cwkiBy1j7QuCUe3GY+Fsr4TqhyC6A5EELew6uje+I2POwX8XIT6
	KQQnrkYKt2T3pQPQP1urt1/KyqhwrGzWakZPWB0I6nwF7Db+z3FY32GRxsyyWZIzi2vdoBcboe+
	keV2uHtp+K03ZQJ4TkZpURhBqNnZRGI32BEedKX1ZxpaEfIrtECzgXwFQe4P01CrFqox4IIlhVH
	oeAURyNVE4t3Fl3kyzxC/fUzxiI0vK+eFtJ3tve+R6Nh3GtV2kAFzYsrRRS9b5n/Qh2+UiQmqPi
	WP7S724U4v6JgKLftj67W/J3txIYt8x7KX29d9/HL+PkJKpMDnQta1oSOPSKcQ07j3GwO3+V2J9
	jSeP7qRJxa6gWrbupkscpa1uY+tns4M565ER3bwt+xXqVrLqdDMjnilMIviaY8jV9KYbh62xgW5
	sQMfQqLEjW0v0jXdWvx06Of+6S5iJvG4ev//2QlHf/t
X-Received: by 2002:a05:600c:4744:b0:49c:fc6e:a3e0 with SMTP id 5b1f17b1804b1-49cfc6ea75amr279617375e9.31.1788872877979;
        Tue, 08 Sep 2026 06:07:57 -0700 (PDT)
Received: from localhost.localdomain (mob-31-26-103-238.net.vodafone.it. [31.26.103.238])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4859162f354sm28884165f8f.20.2026.09.08.06.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:07:57 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] mfd: qcom-pm8008: support PMICs with no interrupt line
Date: Tue,  8 Sep 2026 15:07:43 +0200
Message-ID: <20260908130745.2545-1-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The camera PMIC on the Lenovo Yoga Slim 7x Gen 11 (Qualcomm Snapdragon X2
Elite, glymur) has no interrupt line routed on the board. That is not a
wiring omission - the part has no INT pin brought out in this design, and
the sensor resets are driven from TLMM instead.

The part is a PM8010; this board describes it with the qcom,pm8008
compatible, which is what binds the driver touched here.

qcom-pm8008 currently requires an interrupt: the binding marks it required
and the driver fails probe without one, so the PMIC cannot be described at
all on such a board even though everything it provides - the regulators -
works fine without interrupts.

Patch 1 relaxes the binding, patch 2 makes the driver treat the interrupt
as optional and skip the regmap-irq chip when it is absent. Boards that do
wire the interrupt are unaffected.

Tested on a Lenovo Yoga Slim 7x Gen 11 (DMI 83QR, "Yoga Slim 7 14Q8Y11"),
where this PMIC powers an OV08X40 sensor.

The DT change that describes this PMIC is not part of this series; it lands
with the board DTS, which is being upstreamed separately.

Oleg Keri (2):
  dt-bindings: mfd: qcom,pm8008: make the interrupt line optional
  mfd: qcom-pm8008: support PMICs with no interrupt line

 .../devicetree/bindings/mfd/qcom,pm8008.yaml  |  7 +--
 drivers/mfd/qcom-pm8008.c                     | 52 ++++++++++++-------
 2 files changed, 38 insertions(+), 21 deletions(-)

-- 
2.55.0

base-commit: df2908090cda368b01ff43709f51890076c56157
