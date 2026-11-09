Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794240431;
	b=wqhqlEwWjbnuoWXuesnAmSGa9lBlU5boAFFTy+lo5GMR2zT67ANS7kggRaJbM4sk8qH5
	 qtZtUcqNGJex/9nvcJ1F9f3Mx3l/HZY44nk/au5Cz3clOMHEJovjfhsFxlBS3bHq8qDUD
	 w2jVhLSlTp+9lWEJwXu+2oxLY7PoPwMQA/IBCdV66EaiNcoySVNzxGmcYe6Rd0pRYn/hU
	 g6Oy8vIxwWaJspIQyrjoIY0N3JnNxmK08AVVks0vZEH0WI97CMSrwgxy20nk/KOdr3IZ4
	 PqgMp0ivPB4zyTLsDCNJCWSEiLbbMjJ+In1tAEyGN38m6CT5ElNPTIVQXJbEIFHj5Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794240431;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PAVOiEo7yvU59/BVYzddko8QH5/O/35Z26C3YJ1MLT0=;
	b=iTL3XL0Nhg52CgxLrxDsXY/J3il5difOSVcTVNZH0vwkcGxCb+t+jJ3IZtYuYY3hsTjL
	 5Vi5HeVJg58G5uKHffC31Kg4tf+M9Zdr1gZeqweKHC1c+ZW4dkV57ZJbJ2xKvZlG9Y8Sh
	 daOZ/QIeAocs+/rDp1QRK86TX/6JOVToWn4hAXB6sPpqG+TJs5puAP3sorvMkZ5OFbKQy
	 lHFLR84OUY+v3DzC/Rro8okr9Jwpy4UHnALU8dg5XhGAa57q3cX+Ghghw2WnfOkD7QRiH
	 571iLqfIlBp0Ko9ij0/30kwTPEGx/e/iTScy9n+q2ndUHUTRJyjACQVozFHexwbUs7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sqa358sY;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8AA606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:07:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE8AA606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sqa358sY
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so11175465e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794240429; x=1794845229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PAVOiEo7yvU59/BVYzddko8QH5/O/35Z26C3YJ1MLT0=;
        b=Sqa358sYb7vDClaxbVoF/6a1DcYEcMdoUqLa/bldz4TkukcBnj/4j1SBdcQdsxrTVO
         Tj5z+YqSHxTDeMLh9lQB9l2MWsLj+PoocVMw4V/gtIlhvWN8RZh1N6//6nLhuxinjDvr
         hszV/LqdMCEePdts2i6OGA6Hd6Ksy7InsuWLKYZck3Zmj6PUNV7Xtbp4xKSfRPInT0ts
         ZYBxK9dNRs/6xayKxgIto2MTNWoihDjf/3tfLvTn32LIazVlG/TbtHriVKDBBdUN5dYk
         idr04ABO9NW++emuaZSQCmGlFYhBd1ZEVSAO4QTWWrbPu/NtUcDJVjCkAx11YyBQJgDX
         a4Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794240429; x=1794845229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PAVOiEo7yvU59/BVYzddko8QH5/O/35Z26C3YJ1MLT0=;
        b=qHGKOiOXDiq8O767MVtXJWFehZ3/LtBKwTkP5MNb0c772RSg37sQnlleuiyIEiIPS8
         UGSeMhyCEs/uxNmpcCwQMq/Fbj87v9Y1qDwdlMEtfkicon5UwsIlt+41CjHn6vy807Ci
         Q6Kl6slPx7g30WISyF3JkVZMT1HXDBXZTUBWkRCpgIHMturvcJGGzEXSfG/d/B//Cbz5
         NpHSmnyb8wC+KfqeuII5DZc+LY07L5+0QGxs+JbLOTLrSkAzBIjsxsLogmrf5NqYhJfv
         /Dv7ls/ti6gnMxgyypyauH8/N3co/Vuv8YQovpzFBMH3aYZNK4geq0qCftxD0HRnuUKp
         sf1A==
X-Forwarded-Encrypted: i=1; AL+hErGFMHQZ16fKNCiA6Ec4L9Q0gDzoXeSPAje3lVCHJIXqM4NIiv0e/p7bbGEP38sz7NXYlu3cBgf/8SQZH90=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KJa2dyyFJa3MD3JEYWLDRbdqHBkHDBfbEhBohtmNA1cD7HYs1
	ChMtVBp6Z3a0st0FNS+rZS3sSw44zmqRqJxVcbwZyuHmbyPDJsYa6K/Y
X-Gm-Gg: AYBFou3tGyI4Z0XNhuPxkCuiz+UCBGJOEM4RXDJcEAJrrAbVuXQTZx03K+AXeIxILV5
	NV3lsT7IciYtIS3d2XxMVUsbtHC4xZbdekwJzzric7ip5zsc92S6CAY3dcs71l1yOdta7VRcDu8
	mOQVpHk9Q6ktcmxhNw5XUbsW9wK/e6l/wW8uUWeWSA2BQ17d+bD2pMM1AVyBdYUfmB/Tuivw7Od
	Smjc1KJtp/8DS6LUnNtZYz4kwINi2g8jNEKtGhsEIp93wxt0TuYu8+11qH6hGgXYTYhROY07M/R
	zksHpqmI8RJwMJ9rXejazkuVqTBSkDugmMEtO/9up5ulIbVPOCquXrSyDOPW7V2kC3mv05hyEHD
	Fc9TKZwy5RxVXOT3IQuFqgKATfIeOr28i//N/faU8syDRqBYaUm9dPpP1lUOWkyJMyYv8CbbMDn
	7Ag2Iw5kHLwoHVQhZFvlnfWGpJTunqs1UnGo68hInXfVRA4XuqYZOb/uscvvOj9KvaRLMwH5JnU
	tze6Ea4Tydv9OuKs2iTx8k2AYWLvF80aebFeOs7oJzA0iR7w5Vom+m6RDMTm+otOwa+zUeO270+
	J1wbVWiVOUTPOuwU75PRWCe2omp7FE1xgnCpYkCeRGDm9RiKiTd6StkSbCMxtWoj7ddD9SiVS1b
	WH4jsjj1/mnwq9qMiDAImJPockv0cqzmqyPolRKzDVw==
X-Received: by 2002:a05:600c:4f86:b0:4a1:fa21:fd90 with SMTP id 5b1f17b1804b1-4b960d9b17dmr83943565e9.9.1794240428927;
        Mon, 09 Nov 2026 08:07:08 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:863:742:6109:ac9d:152:38c3:6463])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90f119b96sm159174245e9.15.2026.11.09.08.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:07:08 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Igor Reznichenko <igor@reznichenko.net>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH v2 0/3] drm/panel: ilitek-ili9488: add the PocketGo S30 panel
Date: Mon,  9 Nov 2026 17:07:03 +0100
Message-ID: <20261109160706.2272332-1-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Miyoo PocketGo S30 is an Allwinner A33 handheld with a 320x480
1-lane MIPI-DSI panel built around an Ilitek ILI9488. The panel uses the
existing ILI9488 DSI driver with its own init sequence (from the stock
kernel), timings and DSI mode; the sequence is close to the
E35GH-I-MW800CB one.

Patch 1 makes the binding's port optional: the Allwinner sun6i DSI host
links its panel as a child node and has no output port, and the driver
does not use one. Patch 2 adds the compatible, patch 3 the panel. The
board devicetree will be sent to the sunxi tree separately.

Testing: each patch built with W=1 for arm (multi_v7_defconfig,
DRM_PANEL_ILITEK_ILI9488=y and =m) and arm64 (defconfig, =m), no
warnings; dt_binding_check clean for ilitek,ili9488.yaml. Tested on a
PocketGo S30 on 7.3.1 with v1 (A33 sun6i DSI, one lane): the panel
probes and attaches to the DSI host, and the picture shows the right
colors, size and position. v2 only renames the compatible and edits a
commit message.

Changes in v2:
- Drop the "pocketgo" vendor prefix patch: PocketGo is a product line,
  not a company (Krzysztof). The S30 is made by Bittboy/Miyoo, so use
  the existing "miyoo" prefix: "miyoo,pocketgo-s30-panel".
- 3/3: drop the claim that COLMOD sets the panel to 6 bits per color
  over DSI, only say the stock value is kept (Igor).
- Add Igor's Reviewed-by. I kept it on 2/3 and 3/3 although their
  compatible changed from "pocketgo,s30-panel" to
  "miyoo,pocketgo-s30-panel"; nothing else changed in them.
- Link to v1: https://lore.kernel.org/all/20261103110524.2812831-1-romain.tisserand@gmail.com/

Tool disclosure: this series was prepared with Claude Opus 5.5
(Anthropic) as a coding assistant, in an interactive session: it
extracted the stock init table and timings, wrote the code, the
bindings and the messages. I reviewed and understand it, and tested it
as described.

Romain TISSERAND (3):
  dt-bindings: display: panel: ilitek,ili9488: make the port optional
  dt-bindings: display: panel: ilitek,ili9488: add the PocketGo S30
    panel
  drm/panel: ilitek-ili9488: add the PocketGo S30 panel

 .../display/panel/ilitek,ili9488.yaml         |  2 +-
 drivers/gpu/drm/panel/panel-ilitek-ili9488.c  | 55 +++++++++++++++++++
 2 files changed, 56 insertions(+), 1 deletion(-)


base-commit: a1e63ab695ad76850ab9787b9eb6aab695dc2965
-- 
2.43.0

