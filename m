Received: from mail-oo2-f5.google.com (mail-oo2-f5.google.com [74.125.231.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1746C3AFB1A
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 18:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789237353; cv=none; b=cDnwu0MPJGo2LuqiSYUnFjDOPW31pDzQswgORLA2dWFJhd0MeUs1KlDXnmPOs3XdXelYroR2l2z/dJbJ/eVTUSbAbHVEuZkUzei1Rfw/TccKsjtFNrMyP4x5SEYQuU2BPofCN46psW3pBEd/sa2oBAuBMzb9pHsq+NJcMBYpwSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789237353; c=relaxed/simple;
	bh=kKPzi/HLXfog7rBMUGiYLepe2mjam6b/jz1qv/PYobU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZCrODnK2L5Ey9Lm1HOb7kwPmbhnSmftDE1wjAGm9AYXlMcY14v/JmwHoYaklbryEWkm1JACZciOCFemhxDOc6aph92WL5gOz9Qoddt1/FlTBsKGj/X5JM7VeDu2yjp008BZwoP9wWpPneYXb2LHbBH2Jw2jyAhUYtkNxQrEMfrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HFQLSakY; arc=none smtp.client-ip=74.125.231.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HFQLSakY"
Received: by mail-oo2-f5.google.com with SMTP id 46e09a7af769-7f66624aa21so399932a34.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 11:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789237351; x=1789842151; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BjdcnniX+ccVQA7cSgS2ONHbmJ0xMV8RyAyGUcD/M60=;
        b=HFQLSakYXvA8RZ2WbYLU0POVzlbJTcobdV5bHD0ggDuBQR+DFOZQYrj6tZMpTFdfKM
         4QYMd4xAHpFCuWBWHTOBOiSCvDdoZzh1bp8etVOsC/3z7ApPKzONA2kBwKr41gj8B4+y
         dA+b6MRsO/U0XErgOkxEavxmWsXGWLZBrEUIvazkiG6+2JgQ9c3hYpFy2iGM3NUFQ7G8
         N2Wceo1krNP1WbyksR/w0MyNGNx6SqUSEFxonn5k8nSrKuWTVyBUJCy689GeWmGl85mR
         L0VpMf0CD8FKIKa/qiXEr3Mc2BjjPjDHjqGdeOmd1N50asrO17e7sFRpFUG+WUIyinQN
         F1+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789237351; x=1789842151;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BjdcnniX+ccVQA7cSgS2ONHbmJ0xMV8RyAyGUcD/M60=;
        b=YWi9dC+/h4vjnB79hV6/97i4Siq6nNJftUEUTqTZydBdFvU+34b8b1hAcvno8kXrqZ
         YEIICqMIWbPl8iJIbSxdyA8EnPVJaG2JOHm6pwbxgQk5Rq4dGDvQl2V5+f+5vI8s5ibz
         IQ7FM6e1BdU/qPgOv3Jm6Wz1umO1vfvpm00fTfa4cGJQDQ0pgUt8VS0fIMDMa4YGtZf2
         GzBUJz75HdCI9ho6xJxi/0n9963Ca15n0MBMQgT7f4F9iYfXVte3F82UsrVIhI8oJhD2
         10gy3x8xyPHR5yusOSakucMyBOutUZPkXOG5zJPYEEsIrXLVacbwyGPYua1Fnw4sI1SS
         JsdA==
X-Forwarded-Encrypted: i=1; AKwUvBxz/tVdSpxd5P26Z3Ve/9hEEmDO4hRCKTSRiXxFN919REMQjiOfxl+9xdE7VXLj9HH3Xw2CMX4ODqeL5R0=@vger.kernel.org
X-Gm-Message-State: AFuF++kinQRt7hMbUi4NesNMbMqeALsHxWsqcc0PsHbkhBCuADLU5T87
	70k1byyqUrpBRJ8dL8R3qX9camHZDbHI4FX7RFyPJoSWf4+xBpzUM7i1
X-Gm-Gg: AYBFou3iyxZeKL8fnTkyZl1zPK92RiqJGOXblNG8+WHrL3u02V4du9Xb3NuwM6tOqKQ
	Z1XueCy37MEMX8bpB8NsQSSFBOK9aaszq4/u9bUpfkDWQ8AFsVpbzr4DqBh7fhvB/4N33q46ic7
	AhE4RGbL20LIhmT9TQQpKUW9IS5thiRcBtUW1QAHCX7XUOW4GxtZMfCgcuLXX/uF35oGDwgiYxK
	tNNK42F9zPIE+mtFaZyKRCAPGO8lCLhek5MdxI211T+U24UfXGSvZPkmwXuVZ0MiXBiimoaozu6
	uKwWskDpkYe3Pf/QMY3ahdXkZretltcGlb+4qucbA+WVlqgXl4khiOdYQVu/IEGtQHma7pVaAGM
	kaNnvOWYR5o515X76Rc3MGO1JvNFXR0xYLD1UcZqktULLnqhtTnBmbtPW7YGzxjDp19rXJgo7ZF
	o6A5Jy2iPzNlnU5hSEeBT2q+kXHi07pGNz91WAi1k4EI3wPl9Lz6NktCRDJnSmAVuWAdo=
X-Received: by 2002:a05:6820:214:b0:6bd:cb3f:5896 with SMTP id 006d021491bc7-6c24d39681emr1997214eaf.30.1789237351016;
        Sat, 12 Sep 2026 11:22:31 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df64d89b9sm5413898fac.1.2026.09.12.11.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 11:22:29 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Subject: [PATCH 0/2] drm/panel: novatek-nt51021: add the BOE TV101WUM-NM0
Date: Sat, 12 Sep 2026 13:22:21 -0500
Message-Id: <20260912-add-boe-tv101wum-nm0-v1-0-3057a08e8b80@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2O2W7CMBBFfyXycwd5nEBEhKr+B+LBy5C6xWOwH
 VMJ8e81y+ORzl1uIlPylMXU3USi6rOP3AA/OmG/Nc8E3jUWSqqN3KIC7RyYSFAqSrwuAThIcFq
 iHYZxcGYjWvSc6Oj/nrX7w4vzYn7IlkfX20h0WdpeeWnC6ExgYwi+TF0dVz0kqx5qoJz188jU7
 d4/EC5NBY5VF/oFLmuUCuGsmU4ZqgIJ2K+px63U49F8Be355NnzvIpp/hSH+/0fxNISU/sAAAA
 =
X-Change-ID: 20260912-add-boe-tv101wum-nm0-da01c4474db6
To: Nickolay Goppen <setotau@mainlining.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789237347; l=1702;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=kKPzi/HLXfog7rBMUGiYLepe2mjam6b/jz1qv/PYobU=;
 b=zhgopAjqYGTLQfAWgqPnNFDJTigscCfew+z0rKaCkpyo6MuRFZd+vY+oPw5xjQIg8OP5kWijt
 UfJm8fc9c7UDq7WRF3gqj6GifalJJCWcfTHEurQeM7krhqd4d0rbQSa
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

This series depends on the following series:
[PATCH v2 0/3] Novatek NT51021 DSI panel IC driver
https://lore.kernel.org/all/20260911-qcom-novatek-nt51021-panels-v2-0-135e3190a7fb@mainlining.org/

The BOE TV101WUM-NM0 is a 10.1" panel present in the Amazon Fire HD 10
(2017) tablet. It differs from the BOE panels in the dependent series in
key ways:

- The pin count is 51 instead of 46
- The vendor asks for SYNC_EVENT_VDO_MODE with cont_clock=1 instead of
burst mode.
- Different timings and flags expected.

The init sequence, flags and timings are mostly adapted straight from
Amazon's vendor kernel.

Tested on the Amazon Fire HD 10 (2017) driven by mediatek-drm: 1200x1920
at 62.5 Hz across a cold boot, display off and on cycles and a
suspend/resume, with the MIPI TX PLL reading back at the intended rate
every time.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Ryan Brue (2):
      dt-bindings: display: panel: add the BOE TV101WUM-NM0
      drm/panel: novatek-nt51021: add the BOE TV101WUM-NM0

 .../bindings/display/panel/novatek,nt51021.yaml    |  1 +
 drivers/gpu/drm/panel/panel-novatek-nt51021.c      | 66 +++++++++++++++++++++-
 2 files changed, 65 insertions(+), 2 deletions(-)
---
base-commit: 5e036ce12de91c6fd674dad33b169c6150be2a7a
change-id: 20260912-add-boe-tv101wum-nm0-da01c4474db6
prerequisite-message-id: <20260911-qcom-novatek-nt51021-panels-v2-0-135e3190a7fb@mainlining.org>
prerequisite-patch-id: d8b58f07dc5c9e1fcf7c51a14b48eddca2e09090
prerequisite-patch-id: 79dfdac7b7fa79f7d05a5f3849909c9a7f956398
prerequisite-patch-id: 79c01de4e67563772dde152cd4c4d0c568b14d17

Best regards,
--  
Ryan Brue <ryanbrue.dev@gmail.com>

