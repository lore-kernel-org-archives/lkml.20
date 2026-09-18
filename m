Received: from mail-ej2-f37.google.com (mail-ej2-f37.google.com [74.125.228.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6792B4848B7
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789742413; cv=none; b=Si4GI5RnD+411LutRvsOnIJI7mg+7mAa/AOWtyaE2kz24POobnYP6l3z4q0VQB13ougzryB2K4yQSkuT6hJQR1LZjDy2Iag40OWU9ngeLUkKqu0PusdOa06Rz8ZW1Ny/lVLv/8KvpG1sGCcEpJUmZkkQj+S80yFgJwX/QvmP1v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789742413; c=relaxed/simple;
	bh=LnOCLi1t8Bj2U3X4K5t0uslhmFfyG1Xu8O7lRIkja+8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hyHsxQhufIt9vUzub2vA6oG8VydMMrOBITPEn7qtg+q5wdyaOqfxVZN/X13tVCOvHWFaUJZBYL1+BoHjP88kAx/g90nGM8Y34GKCq9QxDEy4NehwZ0um9+kl2n1f3KRxaNX8RQ36CYjiKeMGkOlm93rvwxWuyF2hNcWBrNCjVGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=j+/R30Wg; arc=none smtp.client-ip=74.125.228.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="j+/R30Wg"
Received: by mail-ej2-f37.google.com with SMTP id a640c23a62f3a-c294af0caa8so118525566b.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1789742408; x=1790347208; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LkU3ODIuhAAsu4O/XI/NDvqsvZfMhywu2ET0wE91o6o=;
        b=j+/R30WgrX+NkB18orvnO5Y9i3Hlk4k4tARULvQ51GDXUTxl4taUltInFcpes31G3T
         rr3HuvdGMyq8+Xjo4wXzcPcTgvuha4E6/MmbPDMlFwTVjGDhfqPZhj9N2XHue8U3cMs4
         R5DpdFYK8l++hOsM1oSTfors+csnOiDXchQEgC2YVepUN72pJ+Oud5g1+ttM6TQKPDLK
         UcuIgGKQRbMfYooblSUYAr1Nq1F9oP4HZdGeXMuBiaArb/r5OFgPkodM22YIlpfFPxb8
         78/JG2R/BMqLTjNLTC+cstKP9jll958QWwWoAMZk32BByhey1xHzJdXtGgDpctvv4VSI
         yEwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789742408; x=1790347208;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LkU3ODIuhAAsu4O/XI/NDvqsvZfMhywu2ET0wE91o6o=;
        b=zXKSaOZ0lAut++2jTNzGnFdkLhPE/9V9IAtj+SRr/vbRsh3/U7o6NlSjyAP9MmnZT4
         X2BqGVQrBfQk0a652CWhY6MIUJRB32Y1+RoVuOPA0+/Z74zOrwzktRkA/+pvDhGIM7cl
         Bxdezjgl6vkkUhZOP946C3Qva1L/7xcpYlByu/IrP81bg3u33pT6jjXy7+vn9gbzLzbc
         Q/jJUe8FIuUSvNRNzn3dh49lQx+F+aEPM7QegQEr7wsP31LhIj/bCcKimpJ6DwE6SXRi
         m32LTnlYRMxYuMfgJLQiuPYnkfB9nRus4AZJnqeJd5lLaqhD073/pTMVqALHWu6N/xwS
         eo+Q==
X-Forwarded-Encrypted: i=1; AKwUvBzclUnPaUXxBDhtAAGxzzvWbijnM2IX3YJyHJOX04J70yD7sCt8ZZZQfrcXTMlXwBwEJv67EUkCxrPBJUU=@vger.kernel.org
X-Gm-Message-State: AFuF++mgodfkoktl2Kr32+PPHVGavzWzgqvRIBOeYdwWeNutj926rb+3
	cGnEKn4m/Te33EzBXKcmgL1bhuTYxcLQVNIo++htsIzR3P9hc45HTa5XT6RyFbBf4LQ=
X-Gm-Gg: AYBFou0ZydqJEvQutQ7CUKiVZVh/8jwKzn2Iq1p/cXtH6IyHZcrTEsPpDApNKraVCjQ
	AFsISvGh28YEVQ7//4EN84E33l6GoabiGk//IRoxjF1PvEQ7CuxFduO+rR/TFAJqbrPrbPiquIm
	4R6DiuMCsxyyszrrUHNiq7Iw0wsYuko8J7dldX911cFxmqqCfo2IeCcz2pVAdy7AbXKTzkDFu33
	CJ0vHO25n1MTQU6EBmq/YJ8DCFHF6Mm8gG4GyoMVmM8yHLomd9p72WeyLl6OwarxsPxt6WqYQn1
	89blOScd4quKPEN18RVl1ly4z89+A5Y37l541efPGboHF3Z5csLRtdvQP+k9gEiPcwfK+eKgv0F
	9yCazQKeFmztLkLdDMZI05jyw5heY+bs6plxIH2wI4S2yjYM356imqx9LeBZPgi4mrtacGPQfRS
	Ze044IqUqpUGoxXekqGS1R409yceO40oBuok9HC0pIGhDvLrAeXKoFdDBNo1ACTBniTkVeCirz4
	AaQ2K8q9mAIk5eyCukE4khwnLr7PKq5DroLoOoOVeGXZe6d7tCtrw==
X-Received: by 2002:a17:907:c0c:b0:c24:b11c:6c05 with SMTP id a640c23a62f3a-c2a156d58bemr272513366b.14.1789742408589;
        Fri, 18 Sep 2026 07:40:08 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1b7a369esm64244966b.9.2026.09.18.07.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 07:40:08 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/4] Add Novatek NT37705 panel driver for Fairphone
 (Gen. 6)
Date: Fri, 18 Sep 2026 16:40:03 +0200
Message-Id: <20260918-fp6-panel-v2-0-6695c4008920@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22OQQ6CMBBFr0Jm7ZAWBC0r72FYlDJIjbbYFqIh3
 N0CLl2+5M2bP4Mnp8lDlczgaNJeWxMhOySgemluhLqNDBnLSlYwjt1Q4iANPTBv80IJIdqzOEL
 0B0edfm+ta72zH5s7qbAGfoaj1xifhF2DRnpCZZ9PHapkOqU5OpXDet1rH6z7bMMmvsl/NkwcG
 RITqmFFWXClLp3UbuitoTRmoV6W5QtDUYv85AAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789742407; l=1177;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=LnOCLi1t8Bj2U3X4K5t0uslhmFfyG1Xu8O7lRIkja+8=;
 b=tfhs+1QCTPakQSMArYo3Qc5awfvXxVAu3VGhjGKoN6x8OFEeUZqKsENV2eUvrbAJa1KfOq2xd
 HzlZhifolmUDnRaQt/+PIUiu+kBtH7aTfKxlNwGmF/x7J+aPtz4RCd8
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add bindings and a panel driver for the NT37705, and then enable display
on the Fairphone (Gen. 6).

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
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

 .../bindings/display/panel/novatek,nt37705.yaml    |  72 ++++
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts   |  64 ++++
 arch/arm64/configs/defconfig                       |   1 +
 drivers/gpu/drm/panel/Kconfig                      |  12 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-novatek-nt37705.c      | 413 +++++++++++++++++++++
 6 files changed, 563 insertions(+)
---
base-commit: c2cd463d6ee7d55a3ec0719d93c49ff99022d58f
change-id: 20260501-fp6-panel-3d35c999d894

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

