Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC530224AF2
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789469014; cv=none; b=k3Pn/fswaLq3yZSWiNsGIoLlWtVxFqCbsdDYaa8nTDjgL3rFgCS9p2LUGREtUBiU8HEFFIVE55h9QpIuoAMOwcNcphnrZ7QJYGYJldH4p+uMhgZdXILe2fhxVkMVICDuBrDFnGlVrWTr47Y9wP35jR7u+y3+EeEfynlMFgpQAzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789469014; c=relaxed/simple;
	bh=yZEgzTB21dJfahfS3EghGIYvrSbI8fD5s64xGT2boCo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pv2fxm7P8wDFrSz2iDMP+4nnUQYVckjEhfaTvAY2V6UVDrv29OixGeccyfyJCvM06M/tOVvANRXkAL5O4qHVZQAgh7NlSSr8sPvCx+FuU1ch2JQP4db7E2ZsfWf8DApd3slEEAdaDCZ8mEjs0MO+duRhFNm2hEd0dYRZUZPwq3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KvV9sqP3; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KvV9sqP3"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912df756so711675e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789469009; x=1790073809; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=c1tT3yvxjkinhN97rO87ZxGO8TE43RhDvmMo/jPsRss=;
        b=KvV9sqP3IbQxdsLronXb+JMIUTfHqODNtknisbi7Xssq4JaUJaoic38EI4HiCw8Ebt
         K94TijNmLxI0AZClLDTVM/q6GJZ7A7JfH5wujF2ZLN8eR7Og3lTUj3V0gTE4DPyLtqOE
         vtl5kILDDFcEeqpsp+2Upg6YjbMwL7O56Ti9i8dVqTR0SkXzPbohKDKw4zcJkfxj2Zww
         9nWcpHwXL68Wd5iVaEg65dL+qA1dCf09ZX57rHqXd30+T5OgBTTntogjKcVUUulUGyGQ
         ISJxG073UAb5fwxN0XDODr0ut6nK2eVUTQUmpJkhJJquN+l7QjuJaTKCr2ChclwaHrtF
         nJpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789469009; x=1790073809;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=c1tT3yvxjkinhN97rO87ZxGO8TE43RhDvmMo/jPsRss=;
        b=zOt0kB8yRDkNOeTPTdTHq+1rCzttlKXHmDk66o8+jIAHaUBHwEqqUrRMgDYz3tTBYz
         PFk9HIMT6SBYx4u3A8LP55p+udKPN9X6nKssS0hqdrx6r57XmsoeS+v+E2q7hasbzZ+C
         OREHxosK0z8r88RgVUbB5tha3I9SrAFMMZAqBPLhkaNB7npSxWwYjWYUqwF2h3jt2nxd
         ig7D2SioD2YnIv1jMv1GHC/YgWu73HNysyyykVeFVl1Gaf5FVwMmjzkbUhaGl8Nwjrqy
         furVYFObZIAc5AKDpzXpdw7KbXhxsAv2sQXAdMs3F11xgvYxwOOjNQ6jeCK4jqHqK2Wr
         pV6g==
X-Forwarded-Encrypted: i=1; AKwUvBz6OHygU1tG2w8dfT+Und1E+u2NZqWWaHRLVR4C29XtM119EngOIRoTUrNucSrjvKYQgMbxuRKgjnzhcas=@vger.kernel.org
X-Gm-Message-State: AFuF++k/IdMMf9ueYImvn7WcjRIt7p4+ymSR1a4THXR4lJj0e9rhpq9x
	r2c8wdOaeamxHHeaFbLdXCOp4klVT26CWwFmIC1Jx0rsHmQ7OG7ijG3w
X-Gm-Gg: AYBFou3W+KwjFtFwQ2skbvOIL+oh6GbH5m7dnXktiZy+3sqBHHSPxwoaCLAS2EZtzxB
	HeRVTYWx9oNOaxQ3y5FgXUjMR9AdHj5KpRq+99PKX8721cVKxsXEwCzncN9ZlGr5Id6N68kXhPX
	LGii9RviyNORnv6WByW5IxdPrH9wuNb9ZEqmX/k+CdBKV4CCDc2wA+bPjakh1lwIQ8fYYlEGPP8
	x2Vr9Oy6PLw5W/4F0mHpJNXK+ythtYHwypHevJpvhgyoECUiY5m2lHpQKiwdyCfsbUGkuTD5G79
	6FS0qZsIKCoEJb9lxMTNMNL+MUTML/EeNOfLDuczYFnHzOrXBwlKJ58UGCfXmDRYm6L9vZr9SR8
	brjYLOcHCYEOp9pyBm0HbL6EHnlRqJkaq7WnUuKb80J7yVTOFRPR5kB0FRjl5lK1pMZcrgwXYoP
	yqdjC++l3v+UTA3o/Fab0iD+0uZWz7S7SKOLgqfLvhTlTFmXOP/8r/xFJm6WD/P1/M6r4Xw2EEc
	gKHuJZbDRRtVDoSI046EWjdAhV8U79BFQquptwy7854U0sv325U0D4+nvLX1TRwpgo=
X-Received: by 2002:a05:600c:4f46:b0:49c:cfbe:5a76 with SMTP id 5b1f17b1804b1-49e82213d4bmr10107005e9.2.1789469008368;
        Tue, 15 Sep 2026 03:43:28 -0700 (PDT)
Received: from [127.0.1.1] (2a01cb0007c59900d73f8285c1e647ab.ipv6.abo.wanadoo.fr. [2a01:cb00:7c5:9900:d73f:8285:c1e6:47ab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d2a94b9sm58001325e9.3.2026.09.15.03.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 03:43:27 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Subject: [PATCH v2 0/4] phy: rockchip: add support for the RK3576 MIPI
 CSI-2 DPHYs
Date: Tue, 15 Sep 2026 12:42:45 +0200
Message-Id: <20260915-rk3576-dphy-v2-0-b56e68b54b8c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACUhqWoC/1WNyw6CMBBFf4XM2pp2oFBZ+R+GBY8BRuWRFomE8
 O8WdOPyJOeeu4Ijy+QgDVawNLPjofeApwDKNu8bElx5BpQYS6Muwj5CncSiGttFYCij2kQGlS7
 AL0ZLNb+P2i37snsVdyqnPbEbLbtpsMtxN6vd+5VR/pVnJaRIJKEmU2lKzLXpcn6ey6GDbNu2D
 87Uuh64AAAA
X-Change-ID: 20260819-rk3576-dphy-2304f848215b
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>, 
 Amin Gattout <amin.gattout@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789469006; l=1671;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=yZEgzTB21dJfahfS3EghGIYvrSbI8fD5s64xGT2boCo=;
 b=ot+vSy2JSTHjEbz9uBeefJXb/lU1tBk60Hb1vd+2VgmjPFt6k8cpkzJT9QHP88Ng6VxHFAlTL
 bJSEKJiOgB5A2Ledx+QpDv+NYkObnMwn0SNsr7pQzcftDj0X92xSduC
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=

Hi all,

The Rockchip RK3576 features two MIPI CSI-2 DPHYs. The CSI-2 DPHYs can be
supported using the existing phy-rockchip-inno-csidphy driver.

This patch series adds support for this variant.

As you may have guessed, this is part of the efforts to bring the
support for the RK3576 camera pipeline (VICAP) mainline.

Looking forward to your comments!

---
Changes in v2:
- Patch 3: drop the RK3576 GRF register table, which duplicated the
  RK3588 one, and reuse rk3588_grf_dphy_regs instead, so that the reset
  names are now the only difference between the two variants (Michael)
- Patch 3: reword the commit message accordingly
- Patch 2: spell out in the commit message why the RK3576 compatible
  cannot use a fallback (Conor)
- Collected Acked-by from Conor on patches 1 and 2
- Link to v1: https://patch.msgid.link/20260820-rk3576-dphy-v1-0-70e25e8d5e78@gmail.com

---
Amin Gattout (4):
      dt-bindings: soc: rockchip: add rk3576 csidphy grf syscon
      dt-bindings: phy: rockchip-inno-csi-dphy: add rk3576 variant
      phy: rockchip: phy-rockchip-inno-csidphy: add support for rk3576 variant
      arm64: dts: rockchip: add csi dphy nodes to rk3576

 .../bindings/phy/rockchip-inno-csi-dphy.yaml       |  2 ++
 .../devicetree/bindings/soc/rockchip/grf.yaml      |  1 +
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           | 34 ++++++++++++++++++++++
 drivers/phy/rockchip/phy-rockchip-inno-csidphy.c   | 15 ++++++++++
 4 files changed, 52 insertions(+)
---
base-commit: bd5f485f3f026225b86573e559af0b7254ef4184
change-id: 20260819-rk3576-dphy-2304f848215b

Best regards,
--  
Amin Gattout <amin.gattout@gmail.com>

