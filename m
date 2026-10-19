Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CE84CEE7E
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405231; cv=none; b=SP0WrC+LqXohyob9aOd5Psa5Aa7ZvOnJBKBx0yaJFHYwazn1F6k2u2F6y5BDF78k7RYfm4BhXRaH/Pq8ZYpGZRt0ibft9e9TZrklVPOOdRyj1OHaH/kVFIlh3dqBAs6asxnGwO67KkV7Adf+umICC6k+IFHLme41wxnE4jJf9hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405231; c=relaxed/simple;
	bh=Wtjo2nq6SBTIM531bE9hkp4uSTiLMC+4CM/B7PGT41I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FWQ8EJpRQVQpxyhBo909mkJ5etze3w3ksaN7BXd3Gc4w1ut6lGx5iVGIpGRCK0x40IV3fslGjR3IztRTNHZLpIAeuXcIm8wiyPzOkz3bGmbFa4cr/ddzEHJhCoGppXm1dBwvzS3HbYJGe8skk3UxopjXuqeZvn1VGKFYfi7977w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KEaAQrbc; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KEaAQrbc"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-15943c9c005so1272513c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 03:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792405229; x=1793010029; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zL01sBFtwzYNtBLBNOJogTgRcd3XXRxHUdSzNtaNMhk=;
        b=KEaAQrbcopfeUpJspu/RKANbsa07N75e793fKoWVgS4efy9o7G6J0ZaN4HwY2dEykv
         h/xjKyryQVaEm+GDK09XWjkKB5zanTr5DbHiVSZK7Z2eYHeXV0Dsy9Ah+FG5hBq5QukY
         /XjGpjLKwbaVe6E7R/M36nLTWPKMarQcH5o5wVqwyauIlxL21HwTpVoL/UvzIx7hhswV
         ZHb/9NDwNTks7jAQp5/dijVSIvPnCTbsQDVdWe78x9ThsmaTp8DDJIohtsD+KhhCNSk6
         ZwDPOaSJIvEYcfd34XwpjALusi8lBEt1zaaafPmWbvW2ERa/pVzqGivQwgfzG6bcuwZb
         KBxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405229; x=1793010029;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zL01sBFtwzYNtBLBNOJogTgRcd3XXRxHUdSzNtaNMhk=;
        b=HcEeginXOD3PPfabGE46OZ3x55AYRUo9cCtlsujomzQbYZhyDLxG1Pbz18lmA4974/
         5FzGVmFGoUkm0tOcHgdug8927L5KHdydN05V2vTDIo4bYbFUElUIZIjc0YYQIF5pY2Ig
         B+f7bUU4z7cWPJOrLLizW+q1lCNeCHC1Ha+CEYTEMXbvUKcH1DUJFSMtUS88HwP1Nnqn
         eDsCre85VMkvcl7a0n84ztWWZKYKd3zDwCLihbJvH0DZDXCCBId33f2FSAIlqREsNtzG
         KXKFlPFz9Lz6QeygK+s7ET8q5HAAi6kifl0L7RvHEN2QqdIgicfs9Fio2AzhnnXr/9oD
         7/Mg==
X-Forwarded-Encrypted: i=1; AKwUvBx4ZAs/oeBd+n5PvVVrv25gepJb6ZfBhu/k5IXVuC59rlkh045vdtG/7iywqpT3cMLMMbMWCGWfQfnaiI8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKBYRTzjqcDm8ckDYomvQWWuTWV8PKGxYx2cUe/Vxw/diaj0r3z
	vahhQFv15OwIwE9VW04q1E447euLuoO0VtSYodxS39KVWU5egc31g5ws
X-Gm-Gg: AYBFou3rrVhRoROSvZbmCYzIw7XIb0PnOufDSU6/cU/Oni3CGwdEYsAH99WrVGVMczx
	tWJpIiQEJAbDezHcN5VgmFX0+wvmNlMjvSHGzrfCTQN1PO9dIAZI3rJ9xvpsJQo+T1KBzI+ofQ1
	KSVuCZVsFERmd6ReYQMtt/ifMGe0iB2oa2mh5AQeCps+HIMFIee5Old/u5i3gwuTqmuHlPiJ1Kx
	0VmUnOGubKvPB6k4xS/2K+DFB1MpIq8bkG5dJ7FQonGHNA6y4+V7f+tH6wKgjmIf8Ie/awWLi5U
	bqW92KhG9Va/j33CJ9dgw2yi0kmo5LRnSVNcfLX39phojPgbSluyEJysurClVbRHTqIRGFvHxag
	8RICAxuVbHdp+F9ysAKaL/jQM2Ekr4vO5kb1Cjh7Sp9ceqdpkZZzBOsXPFVYzstLGe0i+vnRmTD
	rZA/EWbDFNR0CjWFGtlfhGyHl/qidjNuaaw+D7mx6sKMdAtOjIAKI2AG3xZgm9dlrbfNP0odPEB
	qU=
X-Received: by 2002:a05:701b:280f:b0:17b:fea8:1425 with SMTP id a92af1059eb24-185138b58e0mr9940511c88.30.1792405228916;
        Mon, 19 Oct 2026 03:20:28 -0700 (PDT)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18319d3b880sm26324251c88.10.2026.10.19.03.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:20:26 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
Subject: [PATCH v2 0/3] Add VGA support for Apalis iMX6
Date: Mon, 19 Oct 2026 07:17:13 -0300
Message-Id: <20261019-v2-apalis-imx6-enable-vga-v2-0-ef6a3a780472@toradex.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACnu1WoC/x3MQQqAIBBA0avErBswMYWuEi2mmmygLBREiO6et
 HyL/x9IHIUTDM0DkbMkuUKFbhtYdgqeUdZq0ErbTnUGs0a66ZCEchaLHGg+GLMnNL3aeuccGWe
 h9nfkTcr/Hqf3/QBiOi3/awAAAA==
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792405217; l=2441;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=Wtjo2nq6SBTIM531bE9hkp4uSTiLMC+4CM/B7PGT41I=;
 b=K/92ccUEyeN+TkExSsHIzTIooOpzahjw6HNCnpCaTctauVPX9ywt82Fnmfxdz7h43b7N6JoQ8
 agNgWXrR1O0Bd2/w7lhY8SXJ79VsHXNsansU0VxIDNA3yLiaBD/A/Tz
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

This series adds a device tree overlay that enables the VGA output on Apalis
iMX6, which is driven from a parallel RGB interface passing through a
non-programmable video DAC.

The video DAC is a simple resistor network gated by an active-low
data-enable signal. For the bridge to work properly, this series also
changes the following in the dt-bindings and simple-bridge driver:

- dt-bindings: Add the existing data-enable-active property from
  video-interfaces.yaml to the simple-bridge binding. The property is
  read from the bridge's input endpoint. This allows a dumb-vga-dac to
  specify a data-enable signal polarity.

- simple-bridge: Read the data-enable-active property and fill out the
  bridge's input bus flags accordingly. The property is ignored if the
  bridge already has its own timings struct defined, to not interfere
  with its existing settings.

This change depends on another patch, and should be applied after it:

- https://lore.kernel.org/all/20261002-v1-simple-bridge-atomic-check-v1-1-ef5d8332b078@toradex.com/T/#u

  Adds the atomic_check function to the simple-bridge driver, which
  allows the data-enable bus flag to be propagated through the DRM
  pipeline. This is necessary for the VGA to work correctly on the
  Apalis iMX6.

Changes in v2:
  - Introduce the data-enable-active property.
  - Describe the VGA bridge on the Apalis iMX6 as a dumb-vga-dac using
    the data-enable-active property to specify the DE signal polarity,
    instead of using a dedicated compatible.
  - Link to v1: https://lore.kernel.org/all/as-heYw7PKLPm3yH@SMW015318/T/#u

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
Leonardo Costa (3):
      dt-bindings: display: bridge: simple: Add data-enable-active to dumb-vga-dac
      drm/bridge: simple-bridge: Support data-enable-active endpoint property
      ARM: dts: imx6q-apalis: Add VGA overlay

 .../bindings/display/bridge/simple-bridge.yaml     | 28 +++++++-
 arch/arm/boot/dts/nxp/imx/Makefile                 | 21 ++++++
 .../boot/dts/nxp/imx/imx6q-apalis-eval-vga.dtso    | 80 ++++++++++++++++++++++
 drivers/gpu/drm/bridge/simple-bridge.c             | 21 +++++-
 4 files changed, 148 insertions(+), 2 deletions(-)
---
base-commit: f33c2a109da4a527ed3103acb649a88e88cf368c
change-id: 20261014-v2-apalis-imx6-enable-vga-450f5777a476

Best regards,
-- 
Leonardo Costa <leonardo.costa@toradex.com>

