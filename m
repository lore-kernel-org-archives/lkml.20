Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794831113;
	b=o2IajpRn0DhK8mX/ezSqYWmzMwHFVs2S4XVgo9lv2s2O4g8Q4E/Gh03ja5PHPxFe+DXq
	 CTcS31i8j8svTdZUntCRblYRpdecMUf5fIXWXPV+TX3JHVF9fmdsx2/AstjO49OQGP9GD
	 DTsvH9uCvLS3fOyshlz9zpU46MxkiDnSd+XczCY+lfq6sIvGUZBYf40BdCeHKhm4n8JCF
	 Tr6vUcLNEmL7e6MA6X/trKmlVkjD0TJ8k6Y8TiKEwE6wnD3TBLgG8pQn7A/8pfssj0NNx
	 d1cJMKBL6Rrx8+NAu/OgckvDJtBD9Y//qsws7ooNagu2HUeN4rW3IchOWI5Fezlp0jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794831113;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=crdLSmlfnO7VKMZXhE1g/GIeZeZ2qlXrtngZdD7/DKk=;
	b=pPD4r6Sy8MR51tL374pSozKrtQ9tD/G6hGxtOSFQfLpZXuUPmzXDz97nNKcil3vuYmUJ
	 lYCLThd8uzVmpTUyTDCKrIoubBcJueWOpJcjmcDXrZmDTSDtWlnDfCDmunEO2Pg3Jknwt
	 /wKlK+8qsXUYJ8idFaROgKwDiiT+Qy6fZsonZg27QdO1ZuJ+FzFWLv1280PcDljS+PLBT
	 I+JRGvEspzNTxkqHQ/1s0cBWQgDt0b1t/5NsexIIS9FkLbWMA6XGiKSPXbJBphOyDu/37
	 mKVvtVn7oiX9EF8pC/5Xf9WqcZUuvamSzXClpD7yOm1N3PKerPLy5hoGYp7hihYAViA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fn1pkVOh;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55AD606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:11:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C55AD606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fn1pkVOh
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so16916235e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794831111; x=1795435911; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=crdLSmlfnO7VKMZXhE1g/GIeZeZ2qlXrtngZdD7/DKk=;
        b=fn1pkVOhZJ2vJRwZ8IT0PQbNtnL8jVHqGxa4l+jf7COFOQRFK6NpETv6TXMIGdH5c0
         g7+GoC9bpH9k4XHOJ80tVR/UDJpONGVE1zDW4CYGqabVmm6frk6RzA4DgQLOqmj+bMat
         QVcTQP0KEulZhT4rF08nZ68tjs93scMrS5GXo8VMnewh0cYrNg+7dhjBqj3GInNRGNrt
         uXdPFQSYsTyBigXr4SluFICLtrFYl/EBW/Iq7kT32N0O+w1n09NBmZgmNZkhEzkPU5wz
         n815oRyAO0hrp+FrY1axZgkxb1Yw+0v3v7lBLj4Y7oLmWEDSmsoQlPq9tiHdu44wuWuS
         cMjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794831111; x=1795435911;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=crdLSmlfnO7VKMZXhE1g/GIeZeZ2qlXrtngZdD7/DKk=;
        b=Fx+H6Fro2YpFCimfIxWzB1CIlWtoMEg/mvMOpj+jRnB4faIiuQiH/smtvFGCPRO5j6
         IMq+gBfzY7PZfWoCyT0MNyx6z4FB8SYon6qZA6AxoEtT02Q+8kmuBG1eMIIrvYwdKXoB
         6zXy0B1YMUVCAKulRqmuOVMl/uXdlV3zPtSBWHHeQwH8v9lMvK6vk+2ncMSfpIFzmv4W
         RDjHLy8lkro74Df0WsHnF/V1YprwuamUkZgzPJjjFuNs9/ui+64pTPJZf8BdGek6um5L
         /xyDTWlHq2gPnyGE7KKISbF4Uh8rMi6R638ISso/NHhk0b50GgGoBG/PUIWi25rMxBqr
         A0Wg==
X-Forwarded-Encrypted: i=1; AL+hErH/JnkPecwJLgIBaWHg8bkyE5vtv9Ty2Ybt6KNe9mgHenLsPt6gq1aHlZxfZklzd9ewVxyQCbtx0u3L91s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8aunUH6Q/DFYui2tRuZ9o3N9rw3sn2PthWffpb/bjRKtAi0sBs
	kj//2jxS+YIPN/lSeDikEbFQUE2Hkl2v3E7DyxXE8wY89wYunmQusFS7
X-Gm-Gg: AYBFou1rD/ZGQXQM3L2WJwV2pgIri5nYmE4Hmoto0Urn91lcYya9/SzWwevSsWOEtsz
	BLhaK2BfMhW4XYLCS6f0ZZvJm3KN5iXoFmN9Oe/plUwLc54VA/uDVLpbS/g/Xjc2e5F+NH0MOI9
	TTS4nW96C8FjmjfSX04bX6dF5q06J1eiDHg0kziVx43Ib4tcp+llnLhyiQvCBNu+DO9JIa4Hrmb
	CDLwCDnNNBj2HQ7j+Uhar/WjpFKq293RdTyAYFwC3c0dWn6uhH349WhyKN9I/v3FX+ok2rT0lWl
	v3Ksh5uT7HhObYgjCH2Dkf6/mXAnjCJhkS/2nlNjJmmVPGLhbpO1R0ae6jqGNjxBJfmnJCfpgNe
	SNq5KFT++s0uueL61D6FbU4Y5kk91+p7hKtcqhKgjB8tonXrIFkEjtU0gbWOSkimcHJhPe5a6y5
	F3JJXgMzj+sKVGxQaZsqmRgmC7B8axrj4z09r8iLP/FB0hxe2g2hJKkH77pMfxPj5TYLQI6JTjP
	+oUkLGvvMY7r2RhA/SZTr6lJ6fwNzM2mftetX9kZ2nwcK4MOHLCSt6zoeOwvsG4wbK7LtFOkjOL
	VjnFSbmuKGOAMrMjVAK3bMOudSJQ5JD1sHP400o+jIY+nJsXEuMGpY4wotNl7HEp53lLs460jqF
	ZlVQTSzNdN6vz/lUp1LkMDwtM0VMN5GBL41fESOBrd7le1t0H19ixwVvnOpGsck/gM4Bp49xq
X-Received: by 2002:a7b:c009:0:b0:4a1:e672:5721 with SMTP id 5b1f17b1804b1-4bb55a832famr162798335e9.13.1794831111064;
        Mon, 16 Nov 2026 04:11:51 -0800 (PST)
Received: from localhost.localdomain (80-108-121-211.cable.dynamic.surfer.at. [80.108.121.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb70105a98sm61442005e9.5.2026.11.16.04.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:11:50 -0800 (PST)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Subject: [PATCH 0/2] MNT Reform 2: Fix the internal panel on i.MX8MQ
Date: Mon, 16 Nov 2026 13:11:47 +0100
Message-Id: <20261116-reform2-internal-panel-v1-0-765cf8d5ff4f@igalia.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqDQAwAvyI5N+BGuhW/Ij1Em7YBjZIVEWT/7
 uJxYGZOSOIqCbrqBJddky5WIDwqGP9sP0H9FAaqKYYQIrp8F58J1TZx4wlXNpmweY7ti5iHgVo
 o8Vo8Pe5x/875ArE+tEpoAAAA
X-Change-ID: 20261116-reform2-internal-panel-35c872aabb28
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sam Ravnborg <sam@ravnborg.org>, "Lukas F. Hartmann" <lukas@mntre.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Christian Gmeiner <cgmeiner@igalia.com>
X-Mailer: b4 0.14.3

The internal eDP panel of the MNT Reform 2 with the i.MX8MQ module does
not show a stable picture. There are two problems.

The panel-edp mode for the Innolux N125HCE-GN1 is a 70 Hz mode that is
not in the EDID of the panel. Patch 1 replaces it with the 60 Hz timing
from the EDID.

LCDIF underflows at 1920x1080. Patch 2 connects DCSS to the MIPI-DSI
host instead and leaves LCDIF disabled.

Patch 2 depends on patch 1. The video PLL rate in the device tree is
four times the 138.78 MHz pixel clock of the new mode.

Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
---
Christian Gmeiner (2):
      drm/panel-edp: Fix Innolux N125HCE-GN1 mode
      arm64: dts: imx8mq-mnt-reform2: Drive the internal panel from DCSS

 .../boot/dts/freescale/imx8mq-mnt-reform2.dts      | 52 ++++++++++++++++++++--
 drivers/gpu/drm/panel/panel-edp.c                  | 15 ++++---
 2 files changed, 56 insertions(+), 11 deletions(-)
---
base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
change-id: 20261116-reform2-internal-panel-35c872aabb28

Best regards,
-- 
Christian Gmeiner <cgmeiner@igalia.com>

