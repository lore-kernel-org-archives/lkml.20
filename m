Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794895562;
	b=Fz5AVxvgxvkpFb8AeFVwBzvmMoiIins1ZrudPz4W/JbcYZEUyxB+4Q9EoKhKDEf7q93/
	 KCG6Pdy9qtXEv5f77S5R58YqQzPo1rHwEPD72o1C85f5hOJaEbGWZRJsrwhKeU0PDj31A
	 tz/8uQAjyL+54Stm7sONXDhHkA5xBoLVdNsNKDEaN5+uwLJn9wEdTF7srRcuuHR12MDVU
	 7MyeEHHHBnCMBQjyWUVJumdbZNwPx9CH5mCnWSoyS+GMm4zjac4t7kZhEPM+uIKkCEl5D
	 0FOp5QwFQbrD6iDBK6JQS6SK0bNb7oXCWKqiVwneW1QEqGTgX+MY1GVJvfwtl4NVaaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794895562;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AZ+Nts8V7XrClS1oZQvmfEVzXa+kntyG6oy84QvWVxM=;
	b=5CRIhewKOf5/6ZDPDKZdkoGpv32JHgpqfpZ9duTDQ6x/M5vDCmavD0PTOjArFXjdvbpF
	 xXcMnzRKYxqEAUkLnHZ9mcCwSoxYArtSrc4oDEwTqK8TST29I9Ad1u/fXjK4NHpiuZOeD
	 8/UY6QmEBw5GuRcDrQiac+6imLl4h8rZ6y278jD2QUU/3X3xdUBxBbodhAcW6N5j2HF7v
	 JukQV24nTRyu00STxvMX1PwyzvrqNDRgOXMKfnYuhx3eAQEJnRwU2vw7+Al8BKji8pWe4
	 oU1z72cy1DAzNn+VsY2irEmZ7Og8Qd5htvrcn/iFgGFtk8qB3ZaVLS28bqo4ht+jOqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LtQkGBNB;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4CD606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:06:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED4CD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LtQkGBNB
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8a05b210703so1868720b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794895561; x=1795500361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AZ+Nts8V7XrClS1oZQvmfEVzXa+kntyG6oy84QvWVxM=;
        b=LtQkGBNBtFlMhQ915KOkq/VELhj0hHpL9kotE3e1lf+d+nrQmIoTNN211bWM1OO1Xh
         xN0Bonp5CY6clcr1V1vBDBXNhwlEEKLccovysqMH40Rp9Vfa4BnwtODC5rwqkLlHecVr
         L7pNw7s9qNoDKmlEbQmNnxhi+DRJGMLxVkQ/icdOCyZYjHe2PG34ye5dAeeOZEvCQbCo
         v1V60CRBu/GmWgKwXqRhmWVQ9vD371jCQayNuW86NrxhZLBDRTHXJ2cK7RcZ9+L3wKvp
         MWecAqjErbYOUipKjoKZWAlMveyVbZA9zyF6KVL09GONEVrti79GHQliulOLp2BRiOIc
         04gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794895561; x=1795500361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AZ+Nts8V7XrClS1oZQvmfEVzXa+kntyG6oy84QvWVxM=;
        b=1YJo8Zunyq41vaMN+bwQlk7yNYwIMPnj1Asvze0dC/HctS5CkYYwWh9IjDDVV/ARkB
         mM01FQMw/aXtZabR8NL6QvHzfdu01jl+lKJW37l2T1rc0oZMUpO+/7+ZfBaeZ4yVrCe9
         9bEtDLpNTZ5t5J48KBCOY4u5xLJSv9QoZ8COfGWHjTsvmvPBa+nanx15DFjrHWNL53JT
         z36KHqgNBui5Xmjg8c/dH4dmfUoK3s8TVWAujIsfRu5R3I5tztXVg5XcC6h0dbZm7Q+g
         BZYKs4QRzDFeXG53ebT/FZ4JxaV8ouMwGhS/UXsPFOJVnpmtHNXSFMcLhOgMuOavtA11
         0rVA==
X-Forwarded-Encrypted: i=1; AL+hErE95m27ZJD/AizLESTW1V3iI/kYsUZdopKh/8p+xU2eaxD8tszRVGkLsE2k05N022ywqxGTOynqh/injEw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/tedG48hq6+IceRYWataCotGOb9K9xPJNFmggEHm8p5ftaoHGN
	PqTE0QAjV3IcJVIp0LYeIl5ZvpOODEWKaqign8TA4MKZqMGBKBVujSs3
X-Gm-Gg: AYBFou3i8a+AKKWUJhPosH++4uNL9CTKfVsNYnqymyi/PAYjP/DCwd9u51TSi5Mo+gL
	Y9hQes7fsJyNNf2a2yUGbheUi989sewg1HJMpWsihr/Bz7gc8kbXiw624GAY2zgKMdlvG4nKIjc
	IajkMuoMlMPaUhXefjW2dumu3O2iqzs1MCxfsg3ADWGgNhchAbgyvfhVEaZq6ocJ54RENfomp+l
	UCo8Xhuxv8lzvNF7MiBGla+mD+CMnz5zY38yKlAkMti4tfDSNMRta/oKiRF7ZTiUHC2MQjWOKAO
	T3D6yUo+N7oGtBOYiavkBTUQt0Vd9HBqfoN0vLxQdOPnGUXdMOpepeKViasVxmth00UoAHydg1P
	AMI9OYKBd8oUNxqSqYK6Z/nYblpA2IFevTd7AyeY0hwqg2Ib3Z/jooBt5CASpNIhQf9YPaxJtJe
	qPSQXua/k10xT86mKLwRJJr/U6OGoEdI8lCVbFkNB7iIZOtvZTYcmtyWqcHERC3zJomLk0uDswI
	KdZIGGKYGlCHHSan9ndh8qFTp6sNDpEIv3kRTj4OysmEKDq3mVXokBMPL2Ep3iGJKgWFgH3/kUM
	TQN+tmp+SVt+/K0gOkvtK24XBMjJxqpVsIrooTic9wfLUkA13bhiGjZWQqv1G0SjJOfW2BXKdRP
	FLoy/VWsbwFyo
X-Received: by 2002:a05:6a00:94dc:b0:886:a52a:316f with SMTP id d2e1a72fcca58-8beb2e7e862mr11025811b3a.4.1794895561290;
        Mon, 16 Nov 2026 22:06:01 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a8172sm4464623b3a.13.2026.11.16.22.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:06:00 -0800 (PST)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: rafael@kernel.org,
	daniel.lezcano@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	p.zabel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zi-Yu Chen <zychennvt@gmail.com>
Subject: [PATCH 0/4] Add Nuvoton MA35D1 thermal sensor support
Date: Tue, 17 Nov 2026 14:04:57 +0800
Message-Id: <20261117060501.2611071-1-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
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

This series adds support for the on-chip temperature sensor of the
Nuvoton MA35D1 SoC.

The sensor has no register region of its own; it is controlled through
a single register in the system management (SYS) block, which is
already described in DT and bound to the MA35D1 reset driver. Rather
than adding a child node that would only exist to instantiate a driver,
the SYS node is made the thermal sensor provider, and the reset driver
creates an auxiliary device that the thermal driver binds to.

Patch 1 documents #thermal-sensor-cells for the SYS node, patch 2 makes
the reset driver create the auxiliary device, patch 3 adds the thermal
driver and patch 4 adds the thermal zone to the SoC dtsi.

Tested on the MA35D1-SOM board.

Zi-Yu Chen (4):
  dt-bindings: reset: nuvoton,ma35d1-reset: Add #thermal-sensor-cells
  reset: ma35d1: Register auxiliary device for the temperature sensor
  thermal/drivers/ma35d1: Add Nuvoton MA35D1 thermal sensor driver
  arm64: dts: nuvoton: ma35d1: Add thermal zone

 .../bindings/reset/nuvoton,ma35d1-reset.yaml  |  13 +-
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  16 ++
 drivers/reset/Kconfig                         |   1 +
 drivers/reset/reset-ma35d1.c                  |  11 +-
 drivers/thermal/Kconfig                       |  11 ++
 drivers/thermal/Makefile                      |   1 +
 drivers/thermal/ma35d1_thermal.c              | 149 ++++++++++++++++++
 7 files changed, 198 insertions(+), 4 deletions(-)
 create mode 100644 drivers/thermal/ma35d1_thermal.c

-- 
2.34.1

