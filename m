Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794494288;
	b=GTXnjryb0X+oSPs1lOGMdmvAQD6x5HtJST9jANJZVYABbkhd/Xp5iMgM98RAobluZ/j9
	 wqqUzc4CNyDmybINf+7govIPEzSSYtOOmbva+PbAG790NSspdd5XO+MypH0OSFdHXwxI8
	 tSAA/yJ7NJ4y6ziP+9MlnHtGBfb1Y2kR1xoV3FJX7cfKAtrzvnuk+cwWum6j0J8N5AVt7
	 SIZVTw6fCBDCtodYf5Ru01sN/E6CQnZ3lxHsJWYANTaMSGswa1a2yNZ+EZY2xbP4SHqwP
	 gogp5iNEnZ5smvqXMTB/t0hM036ckupGx8SmNMheF2SqLyo+d3taGlegNbcUCWVYxQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794494288;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Y2IsT0Jg+TbimKFRjyF/8T2AxcX0fGduIv2EOCoI08Y=;
	b=xk/dwbFpAWVtyaENq81hyT27hF5HN89Lpnabk2YXsIQcmho2i0k4bQX+usQc9xrS9A05
	 Kp1LJoxprCzSZfoDWFvHbTbfw8KqNj/7xfGvuNlIvg6R4gEuy9hNOQDzVmZa1fbvuhQ/r
	 N0hgWmSgqHY0gWeUOGpGiV7t2bWIYcOs7DOo2L1QF5hZoTyKQWhX4BdLssoKozVwL20gw
	 zQrzXkh+FP026Hz12RGjpzvdFbIrv7bl0t256HwYQSaRa6VNwAhtY6IiebpITotc7bkHT
	 I2JckYMoyWzK7rq4UtvIUMWu96giou9bdOgYfXmVVXQWM+mXBzs+fbRiAFf/vysUxOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UgbpnkMj;
	arc=none smtp.remote-ip=209.85.217.44
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9885606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:38:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9885606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UgbpnkMj
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7d2d1b4a83aso1320880137.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794494287; x=1795099087; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Y2IsT0Jg+TbimKFRjyF/8T2AxcX0fGduIv2EOCoI08Y=;
        b=UgbpnkMjKp/P9v1pdxKcUUylD2QK9AZ17IJVx+9nruvrpjN5xy59QGzuFP0jV73QD9
         5BPj0g/gNUqfS8JgeXuUo/DpDfuo0tP0pYIrVXkmwOnGK36eKtRN8kVGcNWpQMgoVgkm
         UiZ3ABIB6hoJw9mCRUzTCsbyRrFqAvB1eRDFIq0+X0UvGY8mqW91V+9eHEzlFR3YMPQC
         emoZr4VkA9Z33y7C6FtEC4INiloypFQGtxRthzfr6t7cXpR45HyxurlkvpG3wjHB/XDK
         DvMH60oy5H/yXwyU2GPl5gl9tGgshH5hLpWOICgd3Qw5A8LIvj60ImIKDq0y20g/341g
         vASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794494287; x=1795099087;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Y2IsT0Jg+TbimKFRjyF/8T2AxcX0fGduIv2EOCoI08Y=;
        b=sobaU6+zsJnPKcActrzZ3Jwm4ZiRjyXi+3uaeGd8J1V+TValQWdu7bN4A7eLoFws8Q
         1t/xSyUwPjZ1IWqMdiWy0WqTpCXlE6xvhbA47ykXHqW2QpCXbi4LbyS/rVVeBwKuaNcm
         u7V0JAB+eVERXcY1KZB7i3KsrWJSyLBg3bfvTBKENpd3d/pO9X4kfjA1C0n4xkt/3Jqn
         Xr9d5jO4nFS3cuBFxVvqJa01rIw1bXF2ORloygJnQwRL5ikiXKi0PwC0u5P4xuB9DGxb
         uBSLq8PinBfRZg+VGCCrzJVvTNiTGUOlwowsJKcoYGDrY8g4EKsVl/5Ef33+su8QqhZS
         hfpg==
X-Forwarded-Encrypted: i=1; AL+hErEmwxrzUKVyh+d2Rv5ysVph997X6Y1OAK+ikH9E3f2HwEhI+H/N7wXvXKKeZTWsgvmq5KVcjtgFrGnA0QM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ya+2iQ5EYN3d1oU5ewPgNRML8CKHWkX70GRQgt2TlFUuKwKVn
	7qgQ9T3sjLN/+SK4uFTkVVqGtEw1abkwOZFhPVpk0OjMHY1N9STpVGlD4fJP129k
X-Gm-Gg: AYBFou31/PTvrmwZwU0DJW3UTqQUHUV1faxDX53qGpbfcGc2VbJQCoKQ1iuxpbOwLqn
	Tt8FzDOhdRlbZtLl4k+ms6CYTkxvhgTD0c8ZZG5btS144sA3Vs+VwFMPoLAxlURHzusAUPP21J0
	aRqtBjPrGKBC201tu1qruKXF0DzD8P5v4rTWI47wqO+C0a1k2/I67viD13N/0sKuyAZ1xMJxPfk
	tdv8VwLKENoOV/77Xnc7CqCp6WPITO7Zk2e6r50nWw/r2ij+2sXFA18dfmK5qGuQiIXx97ALHFT
	L+fQFLvRDt5lknLw7/aII+UBBdwkmiCCo5qOeaALD5LrNpiK45rM4IxoFZcc54St6oGv9g+SKR2
	41jh24r9fMYnsgdF0M1A8Ack4QTJ7mPpNwUf/U1FRJMIsbDVWDeV7Y356yj0/QaP/C6VUQP2CRr
	C1Bpyk0+hzz0m1pgYSwAED4cYeyClIOhzHKgU+ZcMR2cSMIYSQA3zO2TGJnZxlSRcmvU9ubUpK7
	9LaTm2HLuL5mqJwIwjPIz1OMPpN6I4GWVbJYxxT8CQ/ri0qYdJ2w/G+0D3K+YAYrIsaQifzmvcs
	YTq/KfopRDh8yxKcJyLcIrIjUXSBwAJCSw==
X-Received: by 2002:a05:6102:149a:b0:7d2:d194:3de6 with SMTP id ada2fe7eead31-7d5061175femr2125294137.35.1794494286681;
        Thu, 12 Nov 2026 06:38:06 -0800 (PST)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c1fffe12dsm5177230241.5.2026.11.12.06.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 06:38:06 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Subject: [PATCH 0/3] Add Lotus Carrier Board with Aquila iMX95
Date: Thu, 12 Nov 2026 11:37:32 -0300
Message-Id: <20261112-b4-v1-aquila-lotus-dtbs-v1-0-ca150bb4b0f9@toradex.com>
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
X-B4-Tracking: v=1; b=H4sIACzP9WoC/x3MQQqEMAxA0atI1hNoSu3Cq8gsokYNFJ1pVITi3
 afM8i3+L2CSVQy6pkCWS033rYJeDYwrb4ugTtXgnY9ELuAQ8CLk76mJMe3HaTgdg6Fzo5fQMnG
 MUOtPllnv/7l/P88PWp6GYmkAAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794494281; l=1750;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=Fyhoh2gvGk3Ft2hHZ7zQnpX2e5GJIorXgz24xXGeA8c=;
 b=wJ/LS0jpHT8LcyyR5TSXkc6mSkonP1SS8IhsBv4qtGJ5gdoAYFflJJigSL5SExYpGh6YgMZ1U
 yfhxpkJMDaqDqYK8caPbJ0/huMKaV14HbWGQ3RhMaeUGivztiMEcHxk
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

This patch series adds support for the Lotus Carrier Board with the
Toradex Aquila iMX95 SoM. Lotus is a carrier board for the Aquila family
featuring a small form factor (Nano-ITX 120mm x 120mm) and built for
volume production.

The board features:

- 1x 1Gbit/s Ethernet
- 1x 10Gbit/s SFP+ cage
- 2x RS-485 (Isolated and Non-Isolated)
- 4x CAN (3x Non-Isolated, 1x Isolated)
- 3x isolated digital I/O
- 1x CSI
- 1x DSI
- 1x TPM 2.0 chip
- 1x microSD slot
- 1x USB-C DRP
- 1x USB 3 hub
- DisplayPort through a Mini DP connector
- A mini PCIe slot with USB / SIM card connector for a modem

Additionally, this series adds pinctrl groups to the Aquila iMX95 SoM
dtsi, muxing the I2S_1 and PWM_4_DP pins to their GPIO functions. On
Lotus, these pins carry the SFP+ low-speed control and status signals
and the isolated digital I/O readback signals.

Link: https://www.toradex.com/products/carrier-board/lotus
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
Leonardo Costa (3):
      dt-bindings: arm: fsl: Add Aquila iMX95 with Lotus board
      arm64: dts: freescale: imx95-aquila: Add GPIO pingroups for the Lotus Carrier Board
      arm64: dts: freescale: imx95-aquila: Add Lotus Carrier Board

 Documentation/devicetree/bindings/arm/fsl.yaml     |   1 +
 arch/arm64/boot/dts/freescale/Makefile             |   1 +
 .../boot/dts/freescale/imx95-aquila-lotus.dts      | 365 +++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi    |  61 +++-
 4 files changed, 422 insertions(+), 6 deletions(-)
---
base-commit: d6bcfc94eb4da6e089c5473970cd96727292fd97
change-id: 20261104-b4-v1-aquila-lotus-dtbs-00c2e45a1a66

Best regards,
-- 
Leonardo Costa <leonardo.costa@toradex.com>

