Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794585129;
	b=aJGF+CWFmtpVFHRHTv0sY2sRlBplC/R29mKscfzF/5mJulCDt4YUqO6oTGWWcuSLQfrk
	 WkQcT+ENHMf+w3LTD1995MRZBFVy+Eo7q5ocj4kBG2NwtI+fVbXNPKCFKeo9Y9OomCK8f
	 tCMbZzXhvatYxq/iQ9tnyiFtr9xVWwwGD6NDfjDB+eM3h+SNUAXt9QgMOYpkLvJMMEKgR
	 giq2k4bklwk7Ni9xy8HswzlHr/Za8mTdkLeAB1H4HI6mogaedjEcbfkdv658uWeK6fYsA
	 IVsIuic4e1wv/1EqSZlUq+2ub3uVQvg/KI3d8+4fUQZabBIb0XvWDpsFpKk0RDuxu7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585129;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=m+BoVytq9UYzJLS/f6D3X7otTb8bTdPeXKJPYAbpP9I=;
	b=iMOkdu0ZNJKyQY+irLc5UB6JOc5k4H43WvIwQVByKkgFeI4XCpigf04GFo0hk+bkucGo
	 lv/ZD1gHOmu3YBhl55AhyPLbebKOViwUL1JpT3yixVLac0iS4LP8kqUPSBlm8YKI5BtqR
	 twJEZH5RlHYWDIb1ogGwHswMELJWTrMYej797R+wc0v0l5qf+X5fJoMei0B9LspnmgZWG
	 e5twTBf6dAwH4MBefs8mlEs68oA3zbe4P8+TiLrwSFbSonLuFw7q3Y2a/ASFdhEIJQrjT
	 dGyT7yAnF1Sh1k51bRUAfotUrw1cvvL9TooG6lC2suVkNMNxFeH5aWkDcH32ibIzSiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r0AtE+52;
	arc=none smtp.remote-ip=209.85.222.44
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10C4606A331
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:52:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B10C4606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r0AtE+52
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-9907a58f14dso345553241.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794585127; x=1795189927; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=m+BoVytq9UYzJLS/f6D3X7otTb8bTdPeXKJPYAbpP9I=;
        b=r0AtE+52dDi/AaQ4VHXqjwEYXeO3lJ73BeoWweqbUwUqYYu2BVn5yF5lVpGr5JZOXb
         pItzJA6REojHaUjA2ZXInd1BZ+DmOdC3Pg00wVpbcq6Y/NrlLNNWQd4Qw6uwFIqIhk9e
         vlqKDvvFQPgMeMbNdr1kHDB9piBCFrwbG/bvI8usuwvriqrMc2Oc5Pk3XM89t3fzBLqe
         SD361FvW9ZkmNCjT71/jubr7xEelGFmxdfpnP/hD0VEMYAHpj/E4cQvBrQMLVi5kPVr9
         qNot7Qjs9dKMlryOOq9KDcXQRm0Uwx9WVtqgSQ92vTSPKBqYeWdavLKqldUK6/iQOHzq
         xqsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794585127; x=1795189927;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m+BoVytq9UYzJLS/f6D3X7otTb8bTdPeXKJPYAbpP9I=;
        b=zIfEtWsRFT1hYc1hC4vWNiaaFs9X4vkapGGnZ2mTU7bZaQe6QaJ54M2eH4aE9qjx1j
         dBfHGitLmBMlQmUUrECPAlUTXbj8mbZGDABNTCKEl6yaWT7G0kfdTERX4ZORD72gPAWR
         9SxJcGdLkuoniXhxMYPLIR/MHo0jJ9j1S9VAv8ujWIs8b7/DaVT4Wf49i+9zd4YNI4EL
         eE2eCzZH5NyiDl6CqtAxNM0lXvnTpPPQi7kX4PXhZm8Olk83SGBogNWJovdUroTAmTqw
         qm2Moee7yzoQgXyihbX1NkQkQYecVPKgx22yYdyg2Z1QCGhR/2FvW4AZ/JwrO9BsMB4R
         kCOw==
X-Forwarded-Encrypted: i=1; AL+hErFDlMHACPyAc7+kX2JJ6RVq1NN3N1Z9G/SdWxU/VM4wvHyajVPlh6A9cjCLzaMedWDchfdzfV5bPA3NvrE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+KX1fk0hCZ6U2gB5+/+fvPiUIsrIS+4xmPoNUf6UHHzYcKwMe
	832lHNo6IBR4xYSnPCxvILJREyr1LHLK2sVM1zoXkfKiWqHRJoAAMNTs
X-Gm-Gg: AYBFou0cOyK/jon/oW1K5kwylIkhToDLdIdtGdGqF8Obb4+kcHfMsopC9Q6xmehMFRQ
	fpgehEw4LicA0rV6VlHLnCQKpeNui9u59BGENddtxzBEZiXkMQhQd8gW3CuxxEU5OE+ritn8wH+
	golR66LGxIWsbddw/A323Ki28iIP+beESuXaNjyjoJ7ueeoIGmeS712boKOV7mdiAwVX+IOsx6V
	ERTQnBrLj8ObaafGcNHnzhGgWNGHFc8kXp1Okju50ca1Z/9He8G8E52d3E04bh158pq1Zyym0gy
	3HEhQ2rXzu8iuoYqI/R3k6jLrH5AVKplPEOazOIfeDh2ADrM8q4PQ3TDRz25bLwC4OgJIKOJ/JX
	wV5uEasYfsvaQtsiqT+la7Dr0wA4708Re2DFP9CewqYvRoePhOee8W6qoK73EYsY6nTbh47gB9J
	VKY3TdAf39CZWYiqlWc0TS2SQXc3yA2jy6SXDxG3nCGRamWpFgw6kyNZXycOyTn5udRWnL4SpM5
	bZuXu2gRkylyrs/avi3U4OwmLyeNyumo3IKaGYl8o3NeCitM8qFOkzZOa5g1qjdmzCuLlWzZs5E
	uiYcL31g+I3xyre/KvOrBz8TO4eDiYUZ
X-Received: by 2002:a05:6102:f12:b0:7d2:8e49:f90e with SMTP id ada2fe7eead31-7d64d84030cmr745103137.27.1794585127400;
        Fri, 13 Nov 2026 07:52:07 -0800 (PST)
Received: from [127.0.1.1] ([179.160.39.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c8428c7fcsm1635449241.9.2026.11.13.07.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:52:07 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Subject: [PATCH v2 0/6] arm64: dts: freescale: Add SMARC iMX8MP display
 overlays
Date: Fri, 13 Nov 2026 12:51:11 -0300
Message-Id: <20261113-v1-arm-dts-freescale-imx8mp-toradex-smarc-add-lvds-displays-overlays-v2-0-327f5d37a9c5@toradex.com>
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
X-B4-Tracking: v=1; b=H4sIAO8x92oC/y2OQQ7CIBBFr2JYOwZopOrKe5gukBmUpEjDVFJje
 nexYTdv8vP/+wqmHIjFZfcVmUrgkF4V9H4n3NO+HgQBKwsttVFSKygKbI6AM4PPROzsWDNxOcU
 J5pQt0gIcbXZgEWEsyICBp9F+GFKhvB1W9x2dJXmHKOrUlMmHZdO4DZWfgWvXZ7Mq6v9tAlK38
 rbYqoHf9xjmv5wEf+xPznT+bnpzbUoHl6IY1nX9AQyXlRHxAAAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 ernest.vanhoecke@toradex.com, Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794585121; l=2798;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=1WzCApbm/N+lfLdjiZlJyPKQ+4AjAxmeXLq+NVpvXao=;
 b=yf3UBTTx8wHqJx9v3Stw00xASfc5loBUIuwai4kXTRF28vEGBey+xUGDbjXMB+7XoaGW8WThW
 ZmnAr1ndRq4Di9YRUlBeIFYVWcS6SaUNovwo2EBPH2mYxweV+v4/Vz1
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

This series adds device tree overlays for display accessories on the
Toradex SMARC iMX8MP with the Toradex SMARC Development Board.

This brings SMARC iMX8MP display support in line with the corresponding
Verdin overlays and makes the same Toradex accessories available with
the mainline kernel.

The series adds support for:
- DSI-to-HDMI adapter based on the Lontium LT8912B bridge
- Toradex Capacitive Touch Display 7" and 10.1" DSI variants
- Toradex Capacitive Touch Display 10.1" LVDS
- Toradex Capacitive Touch Display 10.1" LVDS V2

The Makefile entries build the standalone overlays as DTBOs and add
ready-to-use composed DTBs for the SMARC Development Board.

The DSI-to-HDMI adapter, 10.1" DSI and 10.1" LVDS V1 and V2 overlays
were run-tested on SMARC iMX8MP with the SMARC Development Board.

This is the v2 for a series previously sent by Ernest Van Hoecke, and I
am taking it over on his behalf.

Changes in v2:
- Rename display overlays to use the "tdx-" prefix, and add the "-v1"
  suffix for the Toradex Capacitive Touch Display 10.1" LVDS overlay.
- Add the Toradex Capacitive Touch Display 10.1" LVDS V2 overlay
- Link to v1: https://lore.kernel.org/all/20261002-smarc-imx8mp-display-submit-v1-0-f578c63fb676@toradex.com/T/#u

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
Ernest Van Hoecke (5):
      arm64: dts: freescale: imx8mp-toradex-smarc: Add DSI to HDMI adapter overlay
      arm64: dts: freescale: imx8mp-toradex-smarc: Add Toradex Capacitive Touch Display 10.1" DSI
      arm64: dts: freescale: imx8mp-toradex-smarc: Add on-carrier 3.3V regulator
      arm64: dts: freescale: imx8mp-toradex-smarc: Add Toradex Capacitive Touch Display 10.1" LVDS
      arm64: dts: freescale: imx8mp-toradex-smarc: Add Toradex Capacitive Touch Display 7" DSI

Leonardo Costa (1):
      arm64: dts: freescale: imx8mp-toradex-smarc: Add Toradex Capacitive Touch Display 10.1" LVDS V2

 arch/arm64/boot/dts/freescale/Makefile             |  20 ++++
 ...arc-adapter-tdx-panel-cap-touch-10inch-dsi.dtso | 123 ++++++++++++++++++++
 ...marc-adapter-tdx-panel-cap-touch-7inch-dsi.dtso | 124 +++++++++++++++++++++
 .../dts/freescale/imx8mp-toradex-smarc-dev.dts     |   7 ++
 .../imx8mp-toradex-smarc-dsi-to-hdmi.dtso          | 103 +++++++++++++++++
 ...x-smarc-tdx-panel-cap-touch-10inch-lvds-v1.dtso |  80 +++++++++++++
 ...x-smarc-tdx-panel-cap-touch-10inch-lvds-v2.dtso |  98 ++++++++++++++++
 7 files changed, 555 insertions(+)
---
base-commit: 45327d3207619a05bfbd7e6f2e116285ef726933
change-id: 20261021-v1-arm-dts-freescale-imx8mp-toradex-smarc-add-lvds-displays-overlays-a273e90efcdd

Best regards,
-- 
Leonardo Costa <leonardo.costa@toradex.com>

