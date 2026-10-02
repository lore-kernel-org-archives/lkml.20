Received: from mail-ej2-f40.google.com (mail-ej2-f40.google.com [74.125.228.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732F336B91A
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 14:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790950913; cv=none; b=cJYtr+/8DcDE5N7gSKqGAYqRMojG5Zk4LkuauUPf7Yrt6636R+eHyCrvmLdmJ35RC8c9h7BaxfdvZQCPbi6AKXxIU7N3IkmQ5jv5NHOCNWdE4BjH1XFn9ro7MwugAVNa+VrTtD7I481QZL/1K9ZsWqUN9oieGVYrYv3U9sxL64s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790950913; c=relaxed/simple;
	bh=NrQQe+ffbbsZUbQfuVMBkJLb7Eu4aQxcLMmswA46ZKM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=l3weAr2jEynDxTVCaq3Ge5dNwtgPeRHget73Ff6Yyvxrf62Za9pyKgODR9wlY4LvvRkI0BUgqGCyEdNktotk9+fFFQJpatE5q/z2Y2uLjA4H7BgFUYL1h3ozfihThRHBybVjkHA2f+A1/yoUJHz7/8BR086bF7tlQ4RgU0wNVJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=4l2Spv+b; arc=none smtp.client-ip=74.125.228.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="4l2Spv+b"
Received: by mail-ej2-f40.google.com with SMTP id a640c23a62f3a-c2e417a5a81so15247766b.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 07:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1790950910; x=1791555710; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Hi8AlywePpuCp/I6l8npdCyUnuCu9uLP5sJkPsGRVk8=;
        b=4l2Spv+b2KfK+AfG4Kq/eKSs5Mts6yAaZN7O/nqgFK6GWlQRBrZbRcBOOEQEivcbmb
         52KKsw74nAboal3l7e6VHGHy7cRTfo+sWF6NRMdG9/rgcR0+HH/0UqRwbIXw3n8VynmP
         TWBYE3ouFX/Nn+WarlSEAJXPbW5H0fPLrVm8kSI1+PjNFKud71hQrdRkhvbe+jp0HZZI
         YsPjrsOnwFLq+ISuhOXgsk66AIpmtXBb+1/zoTFZWG19Z5EmD3IsQdVEYrD/EwXsLaSf
         09vzFUCC4nBCNkX/l+tj1dSg1ShnSQ+Ci3ZxvBgFHbvevlrOO7zhXS82pTBCsPfNhgiB
         Dsdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790950910; x=1791555710;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Hi8AlywePpuCp/I6l8npdCyUnuCu9uLP5sJkPsGRVk8=;
        b=CuxltVZeYvAnzuJfstMoDm72gtU6e2YF8tRGgWiPB6ESnkVYw0QP1z4Hcn7AyU01qH
         JSUkBUxu1x3o1WYlXo9nc5iLq32OYQmGjAUioPfqxd1jfFBj5dq/OV4IEYF6QtU+IZRq
         2m0xaxxfYpIeWmCT1FlU9CX+2mAT36/v1+fmvnpbkPkLouPKsxF4gqEG9QgODChrWalg
         Q8qAykrklO0QzrBnmNM5lJlxCjdKR3MUZ6tB/84ptrtkgfsLhUtATcJby3op3kwet8VU
         IdmqDJuN4njkBNYyw7IBpi6s/BH/uAYMhBRPwp/O4h6Gs644GwqizqThEqPbUFxx4yJ7
         XR2Q==
X-Forwarded-Encrypted: i=1; AKwUvBywRsfQ5Fxfru8fA66Wbgtmo9+7bzsdUtxyWIya+vdkFgzyhQTTb5ca4VGAtBlrTzW1HZK0v8qSFtikvwQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kgU/SuYI1dYsQVA1O5/5M+2c8kmAfIQtBcvfShrlZ7b8i7A85T
	WufRA3imy6lO7nf6J7P7qDffXct7d2jchLQo+/t5ff/bRMPn+o5g3wE/4bgAaxtAUFk=
X-Gm-Gg: AYBFou3h9e+vOmRJbmhnn8SuIo6VeaaSZtnpebilGb4AKDmC1jiPZF/vEgo/I/EIqfJ
	Cm25SxCs8ilR7EMp7kq5W7+/W6bmfue96kwpz/qKTaBWkcgKV1xWz0rHoub7NyomgvSL+AT2ptY
	g1MdQ6tiks2AkWeGhbXYDwSQRV76O13WKD8ha4yih0NQRtGSonyW2695mv+2CxuCIV5BC4Q4NFA
	UUCKbuDQszBWXl4tS8f/t8P98rwAxVRy47IDIkiPDRvAV7gnm3GI7r5eQGciEptyENnMh1wi0ci
	U+WjWAyUL03u1i9TR53s/fdkZCpmVlDDHMQtuRWwTQOXDuElmgb8kifcS+6Bogeks3jZGBa8OxL
	gj61GzqGPAC1mW9KFIH7R87JP5dy7d1tmvOpKiTU+agtGIifMuqoaZ/wQwgcTvZUbn4Ui0xLts+
	K4JkTQOw5qTZneF1DAkNTZJQgfFkpvvMWaiyXdEOtZvEY3Ax845U/5xCbd7Gg8KWFYrE+1wwoso
	9mRRghj/fj7aCLqKV81mbMFRSbTx2DPRu049KSVAhFjAVrEFOSN
X-Received: by 2002:a17:907:2d10:b0:c2d:cdc6:827e with SMTP id a640c23a62f3a-c2e4af677d3mr241217366b.41.1790950909638;
        Fri, 02 Oct 2026 07:21:49 -0700 (PDT)
Received: from [172.16.240.104] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cf684e3sm89307166b.51.2026.10.02.07.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 07:21:49 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v3 0/4] Add Novatek NT37705 panel driver for Fairphone
 (Gen. 6)
Date: Fri, 02 Oct 2026 16:21:44 +0200
Message-Id: <20261002-fp6-panel-v3-0-4b80f83bc936@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22OQQ6CMBBFr0K6tmba2kpZeQ/jAoZBahSwxUZju
 LsVTTTG5U/eezN3Fsg7CqzI7sxTdMH1XRpqkTFsy25P3NVpMwnSgAbBm8HwoezoyFWtNFpr69y
 uWOIHT427zq3t7rXDpToQjs/Am/B0vqQj4wtjVRmIY386ubHI4nqpuEfFnnbrwtj72/xYFDP85
 4coOHACixVoowXipimdH9q+o2XKzqUoP7YV+bctk22M1bgCyK2EX3uapge/DQfqIgEAAA==
X-Change-ID: 20260501-fp6-panel-3d35c999d894
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790950908; l=1468;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=NrQQe+ffbbsZUbQfuVMBkJLb7Eu4aQxcLMmswA46ZKM=;
 b=+KnsUStWqf+ki9Bj4Hq0RXT697KNdlbH52n35vhI+yqQTDUqeanE4a/XtKcxAs0t19T8OBgMJ
 NKhSTvVvfClBOP34uXjdxonv9HZans0NcThfNKohGCcG8y5/R8RTysN
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add bindings and a panel driver for the NT37705, and then enable display
on the Fairphone (Gen. 6).

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v3:
- dt-bindings: don't use 'contains' (Sashiko)
- driver: Use devm_drm_panel_add & devm_mipi_dsi_attach
- driver: Replace linux/mod_devicetable.h with linux/device-id/of.h
  (Uwe)
- Link to v2: https://patch.msgid.link/20260918-fp6-panel-v2-0-6695c4008920@fairphone.com

Changes in v2:
- Fix kconfig dependencies of panel driver
- Pick up tags
- Link to v1: https://patch.msgid.link/20260501-fp6-panel-v1-0-e09cb05651cc@fairphone.com

---
Luca Weiss (4):
      dt-bindings: display: panel: Add Novatek NT37705
      drm/panel: Add driver for Novatek NT37705 panel
      arm64: defconfig: Enable Novatek NT37705 panel
      arm64: dts: qcom: milos-fairphone-fp6: Enable display

 .../bindings/display/panel/novatek,nt37705.yaml    |  71 ++++
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts   |  64 ++++
 arch/arm64/configs/defconfig                       |   1 +
 drivers/gpu/drm/panel/Kconfig                      |  12 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-novatek-nt37705.c      | 396 +++++++++++++++++++++
 6 files changed, 545 insertions(+)
---
base-commit: c2cd463d6ee7d55a3ec0719d93c49ff99022d58f
change-id: 20260501-fp6-panel-3d35c999d894

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

