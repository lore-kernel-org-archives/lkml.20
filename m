Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB004336884
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788781304; cv=none; b=Ro8rANUmBQbOpYdfeTZXm5TM1b3p3JoI2CdIYHr/W8WIMo0Smtm525z1M6dOFZjG4/NzQYzIAMgNeZbDqjPrXXhgEBWRlqnFmzzc8nMIAbJx7XzLjoLIBWp/8R0zExGSL/junGW3ebe6ZVTNTLlKqe/qmPw8TLJ2qAfiQ2ydVbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788781304; c=relaxed/simple;
	bh=zZDECq2bmY7+ZdpePaPahcwPBF0z8nZz5LFse5CLo8k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=c/wtJpS1muw+7sytCnrfyFWnINn5N3JNJ4VG0A4zQCd4+5Q6WnYO3Iw3maD/V+fD+TQzTI8paaXggjdgyQgzECI4OCrTS+nH6BTIhzf5wDHB0pS7JRrV5seiRC+nAZe8xHaly3HCf7FWXAtXAsY0jTMNE+bO5rEuFXTwDFvtAKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kQvkQc+Z; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kQvkQc+Z"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so41589455e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 04:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788781300; x=1789386100; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FL1mL1XVE71/okiZ+ZMIYLV77/ov3lC/JuTKkmsqmjo=;
        b=kQvkQc+ZBs2AM2ctdOkqdNcZQq9tKD0U6B83zyXKm6KdWswxGv93S3uejzNnr4GtNC
         EWqGt4uJ+2ybAaCCS2mJBTsZhQW4+uRe1OjC1AZT76vmeapmbfHj5tZcRedeFp4/xGu9
         D0e2lMZiDTYVNG+m0r2w20NOnSctx4mRXiU07SpqNjLQRGbT4FmukbGDPEHzsCBUKzVL
         dM5Q9TSYDmvPLoY+r45+47wnsSwR/Zh7N9deIPmPNH/74Z/JD1cczaeYjYPH2pcwi9ng
         Y5abxjS5wLWc2dLDqy9aULMWekrbNQsDXAULm101VhFclv4/i4x6g0/qCxK/PBjkb6OW
         WYXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788781300; x=1789386100;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FL1mL1XVE71/okiZ+ZMIYLV77/ov3lC/JuTKkmsqmjo=;
        b=rj9kRHBqwmmx0kTgf4pNT+BUOcnfMulHaKsL/FTJR2rfZVlsFbae/gu8c2Lg1Rwk+T
         qg+EvkvcDNueeKnJ2yTIkZZiaRfzUpRcsc5vu+gKcDQam9Hj/lhI7y7dGycAL6825HMV
         23axUJLQHBduCVa6MaaeYppt+28eY8A6l47qwlamU99wqNsC25SCV59e9ltLh1NPvnQs
         5DXVntmd4AsEWD1R7knc1Ivrz4EHpsWImEb2GwSF3ahMxP9SfWBgBteRTYNptwfNVLVM
         or14jpLn7oqes+58TKxYQK5tFQrBj/UWBXTLlg8zh02OhmUaqCKsFAEa+1Q/xORUrKd0
         YO6g==
X-Forwarded-Encrypted: i=1; AKwUvBzqTh22k8BBE7Zxmh+VtrLEyhm0cLS6Tisek6g+uMV9HNQgePcOmjV6YX4LqKyce4lvd0GDKbpGd1KYUxk=@vger.kernel.org
X-Gm-Message-State: AFuF++nrkek7RYsecfgx9rSOmZb7iDfBkzox7otYYpemjRDNO7R0fXs7
	FCge0p6FSLq0uOcOxUbNwBQW7v7dYIGl9MkSS25bmB5hsWz4RRVEK/Bg
X-Gm-Gg: AYBFou3G73++eIvR1AERIznNHVOxJinCkp38c3xXvDz3ew9SGn6JNOL/46qv5r6HCmx
	xVepjI2PnnpIpwWQOt1q7iOblygREV0QQ/04ubORDmOOjrWz+h+XYvB8qNiGXdZPLYoLrri5oWz
	UxVqoeL2vT10SS0ktJ3aWD99zO4n0VTbhm0kKNgVsLP/pHLFPeSb+AopcS/95ewdFvjPZtj5gha
	SlyDsMorAmBe1Z+XwfP5ddjlDWyUs0m3A3mt1JRvCZLS6gZ2y9peN4jWHmlQlTnQVzRl/vpYPJ9
	eFlptXigHYJcYGIO6dn9UENpVDordwN5ucGJeFa20545UTdmrF9sb/4a3CUg1mW11eni01j/yK/
	pNQgLrPI2uMOeHvtdnrIP6Gc/3u5QG7Czoyd91DL4WxTmOik7MP7+cZvh//QX9XlC5FxfqtCzKD
	+2wRjkhZTJqTZN1AeYqMnmeGoj2wHyIOVtITw4DPfI6DS69APybgfTdMLfa9DJBe/TC396Cc23p
	qEzTjsieBOrBAnz1r4gtqqNnCvBp+jKRtsvkiQBWYb8zmF+j7OS9w0Ul1lvzxk=
X-Received: by 2002:a05:600c:474a:b0:499:79b9:e220 with SMTP id 5b1f17b1804b1-49cf825d722mr202658655e9.10.1788781296694;
        Mon, 07 Sep 2026 04:41:36 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858d2693e8sm26763182f8f.3.2026.09.07.04.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:41:36 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Subject: [PATCH 0/4] arm64: dts: freescale: Add Verdin iMX8M Plus overlays
Date: Mon, 07 Sep 2026 13:41:29 +0200
Message-Id: <20260907-verdin-imx8mp-non-camera-overlays-ready-v1-0-ca0c63c2994f@toradex.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOminmoC/x2NQQqEMAwAvyI5G6h1EfUr4iG0cTewTSUFUcS/b
 9njMDBzQ2ETLjA3NxgfUiRrha5tIHxI34wSK4N3fnCT6/Fgi6Io6RzTjpoVAyU2wlzNl66CxhQ
 vDNPwclsMvht7qLXdeJPzf1rW5/kBxWHdJXkAAAA=
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

This series adds device tree overlays for the Toradex Verdin iMX8M Plus
SoM. The overlays cover audio configuration, a display adapter, and DSI
displays.

The series adds support for:
- NAU8822 Bridge Tied Load configuration on the Verdin Development Board
- DSI-to-HDMI adapter based on the Lontium LT8912B bridge
- Toradex Capacitive Touch Display 7" and 10.1" DSI variants

The Makefile entries build the standalone overlays as DTBOs and add
ready-to-use composed DTBs for selected carrier board and accessory
combinations.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
Ernest Van Hoecke (4):
      arm64: dts: freescale: imx8mp-verdin: Add NAU8822 Bridge Tied Load
      arm64: dts: freescale: imx8mp-verdin: Add DSI to HDMI adapter overlay
      arm64: dts: freescale: imx8mp-verdin: Add Toradex Capacitive Touch Display 10.1" DSI
      arm64: dts: freescale: imx8mp-verdin: Add Toradex Capacitive Touch Display 7" DSI

 arch/arm64/boot/dts/freescale/Makefile             |  28 +++++
 .../freescale/imx8mp-verdin-dev-nau8822-btl.dtso   |  14 +++
 .../dts/freescale/imx8mp-verdin-dsi-to-hdmi.dtso   | 102 ++++++++++++++++
 .../imx8mp-verdin-panel-cap-touch-10inch-dsi.dtso  | 132 ++++++++++++++++++++
 .../imx8mp-verdin-panel-cap-touch-7inch-dsi.dtso   | 133 +++++++++++++++++++++
 5 files changed, 409 insertions(+)
---
base-commit: 26835cf70bbb6207214af55495ea8bed9ea96775
change-id: 20260903-verdin-imx8mp-non-camera-overlays-ready-c9640fdc2183

Best regards,
-- 
Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

