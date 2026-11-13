Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794549399;
	b=JbYCH0V8oggOTFzajmyX4m752+u/Pp/uqo4vaxWNT5tELsDpHkAcj3rOv+K83B1eSz8H
	 iiXeYo0UtuWi0wus5P28V1CPBmISUXcavKqKHM7rJ6OyJXDaeMUh7r8vK84pLAgq3aah4
	 MI7TwMy7Ems+YlSel2WVHmrYPicT6qvqOogR3Zp+JhQ0mHjXPRjGO/e2s90wu5+2gVbSu
	 57TP0dlZ6/9dJe2/2tzGrGdpfebiG8PbBA9E9fd94sWnk99T2CeGy27weROyYKsLlXdv+
	 NY1TzD7orna/Z1jU//pJYvJ+Qa3HekgaknELs0IysSKp5nzwUx/LYsn59vf1c+7Uy/A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794549399;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=4C8NDcT/yPvOgy/CAop2KGnvkHTE/6R5s/p7W0Ysh+g=;
	b=2BK5kRqUG3qQS9JIf6Xefc0lfOQ/nTMJ/7W/UKeViFLJovg/7uTVJhqRynITV8A4wApg
	 lURnpMiEXcCrRE9qKHZsBGPsxGRocakgHkFY+yvZmxAHVG2XI9Qf/YKz6dAUCwSDYo+X3
	 vbiu8HcEuHRvpiY1gTOunAgCFKGHxwjV4i2htoQ+KgLCjQPI1Wnomu5FR6eR/d+bPhMta
	 EFS9Fpkv8fxIrMNPZyhAssni/zSdp/9/UiQ41XQDleb1vHu+9j9xlQXY737SZ313qegwX
	 ZaBRCdMEIheYUF6b/pvi5GxyAZByC2gMLgQqYg9nhBJhCCqGBGWReBOcDR1dcKbR5/w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oY5G8dvy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C638606A882;
	Fri, 13 Nov 2026 05:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oY5G8dvy
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794549399;
	b=HQoZf9mv3sW+P/IHIiFp6oUEUOaa62W9ShaM1FpVuGJvA8Ai1YVjjUj5YdlilbW/nepV
	 mxO2ntMwjf+OlDF65yaOIgtyMEB6hNJSEyI2n9MDUG0dLPUt07yRkaLfdDvZqT84DC2nN
	 C4Z2+HriKVUNcBveSEWv2ZRVIkDdf11xkiAb6iTiCVqJ6ypTXixcDGlMXoKXYpEmOtlk8
	 /jNUe/aIudCmpiBswUq+GbzXccfzwvKe370DPD8zIkI4I8yCdgiY5MoBSTvQ+ihZ8ink3
	 H+feKrbmD4Febt3xYEPBIsUByTFtS5CzB6wD88T6ZOxchRvEQNV0ehkUbvwYXkhDlyA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794549399;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=4C8NDcT/yPvOgy/CAop2KGnvkHTE/6R5s/p7W0Ysh+g=;
	b=HuF2/n/Npbz4WEmk/jvRuIZpAyv/j5xG5FScg0YE0pp3eA+9SzuIZcUH0pXees6rgZuM
	 0Q9jKVtyktM5MxHhItNbP/A0nbEP5Ztg0IhFPBfNAaoRTfWa7l2zwf+CxDRD0CDnnJjs3
	 cYb8Suu6XbGTRZJYRtULNRJDmuE/eOF8mvo2yacFNsc5I/spa84Zs1UZfDrNE3+6akig6
	 dEz64d7Dc7jgg7cvJ8rYaq/iGRgrB7fEe2Pj6P4d78vycwB73+1WNOFLxVdw4itTrinWR
	 DTCKld+g58l1D1zt/SsXe9fzlFmR/XcbN3WEneIqvNhcZeAR07yySDQwkmAlCCL1/BA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EEC901F000C4;
	Fri, 13 Nov 2026 05:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794549399;
	bh=4C8NDcT/yPvOgy/CAop2KGnvkHTE/6R5s/p7W0Ysh+g=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=oY5G8dvyA4pzJcbqiQpi3oZt9IVOku7rL6hcsXsuK9jutRtoAXoLXCH18KCJ2CAxj
	 wczRwLo3tlEEraO9dL8KLPdPsUQwnKZT8cbSwoJTNPRGVRFwWuSjdg+ELvbxSqlkAk
	 2m6kt2Vp9C8EkAyTK0NcI7tEPkohUeZqxCts0AraSHXdauTxluJ+PG74A+t4e9SDNV
	 bG6j/14pKn0aZmwhR2T3m68ABT3l8swq9zU6TrouH5W74PC/bKTQtQKJMAt3/jr+KC
	 p1fuBy2EqA+Lcj1woP4Vuylmo8zCjUOzG1J6Yhi3hSMOo32NFCjdFTQ5zJJJZuyk9W
	 AMb85hQlyv5Vw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 506F647607;
	Fri, 13 Nov 2026 05:56:37 +0000 (UTC)
From: Ishu Brar via B4 Relay <devnull+patches.brar.si@kernel.org>
Subject: [PATCH v3 0/6] drm/msm/dpu: Add SM7250 display support
Date: Fri, 13 Nov 2026 11:26:33 +0530
Message-Id: <20261113-dpu-sm7250-v3-0-30bdec59d204@brar.si>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1WNwQ6CMBAFf4X0bE23pQKe/A/jYaGr1EQgLTQaw
 r/bogl6nOTNvJl5cpY8O2YzcxSst30XQe0y1rTY3YhbE5lJIQ8gpOJmmLh/FFILjgIQtSEwmLM
 oDI6u9rnGzpcP+6m+UzOmQlq01o+9e61vAdLuG1bwGw7ABQddXXOhqMmFPtUO3d5blrJBbiKA/
 BNlFEuqpEaFJRZmE5dleQMZR5gk7QAAAA==
X-Change-ID: 20261023-dpu-sm7250-a01aa5de1da4
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Ishu Brar <patches@brar.si>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794549395; l=3390;
 i=patches@brar.si; h=from:subject:message-id;
 bh=BSHS/Aji18Q8W6naE/wxA1UmN6lL7923+dY0DTqriYI=;
 b=dBiyCxc5HjyMaKY/TMBKI4ZKwvSDwtSLniowPAaiCVvwtW1AhyMjqTJY86FTWJ2StsLNRgRjE
 PRvaD9Ltr3KD44HcOlDV9BkciWRzEAlm1fEoFZgqalAJsx6hLy+nAzP
X-Developer-Key: i=patches@brar.si; a=ed25519;
 pk=Ds+E23E3ntzjPzuBDyVRkOouclcNI5k75R+N42yJtCk=
X-Endpoint-Received: by B4 Relay for patches@brar.si/default with
 auth_id=1189
X-Original-From: Ishu Brar <patches@brar.si>
Reply-To: patches@brar.si

Add display support for the SM7250 (Snapdragon 765/765G/768G), which
has a DPU 6.1. The DPU node matches the SM8150/SM8250 schema, so only
its compatible is added there; the MDSS gets its own binding, modeled
on the SM8250 one.

The MDSS driver needs the SM7250 UBWC entry, already applied to the
Qualcomm tree:
https://lore.kernel.org/all/20261027-ubwc-sm7250-v1-1-e766b1e264cf@brar.si/

Tested on a OnePlus Nord (a 7.3 based tree).

---
Changes in v3:
- MDSS binding example: connect the DSI output endpoints to a panel
  and add data-lanes (Krzysztof)
- Collect review tags
- Link to v2: https://patch.msgid.link/20261112-dpu-sm7250-v2-0-8e925a3a8a7d@brar.si

Changes in v2:
- Use dpu_vig_sblk_qseed3_3_0 for the VIG SSPPs, as the other DPU 6.x
  catalogs do (Dmitry)
- Drop max_hdeci_exp and max_vdeci_exp from the caps, as the other DPU 6.x
  catalogs do (reported by sashiko-bot)
- New patch: add the SM7250 DP compatible to dp-controller.yaml, as the
  SoC has a single DisplayPort controller (Krzysztof, Konrad)
- MDSS binding: add the displayport-controller child, fix the
  description, drop blank lines (Krzysztof)
- Collect review tags
- v1 was sent three times by mistake, sorry for the noise; the reviews
  are on the last copy, linked below
- Link to v1: https://patch.msgid.link/20261031-dpu-sm7250-v1-0-159f403ec405@brar.si

To: Rob Clark <robin.clark@oss.qualcomm.com>
To: Dmitry Baryshkov <lumag@kernel.org>
To: Abhinav Kumar <abhinav.kumar@linux.dev>
To: Jessica Zhang <jesszhan0024@gmail.com>
To: Sean Paul <sean@poorly.run>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Krishna Manikandan <quic_mkrishn@quicinc.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: Ishu Brar <patches@brar.si>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Ishu Brar (6):
      dt-bindings: display/msm: dsi-controller-main: Add SM7250
      dt-bindings: display/msm: dpu: Document SM7250
      dt-bindings: display/msm: dp-controller: Add SM7250
      dt-bindings: display/msm: Add SM7250 MDSS
      drm/msm/dpu: Add SM7250 support
      drm/msm: mdss: Add SM7250 support

 .../bindings/display/msm/dp-controller.yaml        |   1 +
 .../bindings/display/msm/dsi-controller-main.yaml  |   2 +
 .../bindings/display/msm/qcom,sm7250-mdss.yaml     | 361 +++++++++++++++++++++
 .../bindings/display/msm/qcom,sm8150-dpu.yaml      |   1 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_1_sm7250.h | 309 ++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 drivers/gpu/drm/msm/msm_mdss.c                     |   1 +
 9 files changed, 678 insertions(+)
---
base-commit: 198acaed3b84c91030a039ac5ab833432ec166ea
change-id: 20261023-dpu-sm7250-a01aa5de1da4

Best regards,
--  
Ishu Brar <patches@brar.si>


