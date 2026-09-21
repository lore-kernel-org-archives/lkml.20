Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38437483821
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789990769; cv=none; b=CMktdp+4DRf4NhkQAhaiODNwfJNxRk/Uzum2AFMmsa2y8ViSM7PXC+xtPvI9d+aTsZYJFHj7iiLK85R8/W26M/f/7XR1txsR682ewsvAi24+UXRb4UWr7W9Dsm7JmFcUeb+rijXd2E7xw6THmjsuRQTR6rk837GUykFgt9Mc3jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789990769; c=relaxed/simple;
	bh=SgVXdnakh1a9vybRscg8PdXIeBwRWAm6jhyYz/fIS3w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dJSF+stYiDE3AKkPg7X+2OS+U8X9uQd6HOofdQrR8QDFXyRXD4KW498Eurh6Sy+3jRrkMYlKRXB7q+GmJbYKyJZiue//p4tgVrLO+axxTUFM4OIO399b/bz45xtF3HcBWil2EaoeE3iGlbXDqmmc+n4WgTRRCyN/mexnwP4/fQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c6018jKc; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c6018jKc"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccead2aecso13563645e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 04:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789990765; x=1790595565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bJjHs4K3u+gvdjbfOs0Xg8GRiY9vzGbZiOJ805s9gPE=;
        b=c6018jKczyYlBKLfZW09cEBcNQYjNWUZ22B18YONln1fit9LNYjCrUgWhAp4kntnJX
         ovnd31bQlq7X6It1ovLQIMguGEfOB4/HWZ60nCWHhPVp62LTS6whP0lehzq1Km67/LwI
         dge6VjpjewkaCFq11ksUzPgzGNioT+pUV1SKmfZMRL6L7v3HbrgPb06TzziDW1t7LDx4
         aSsWB0nGkpAdfueQ3Y6Kdi5tgI1x+K3d9BmJmByyG4DGBL0hJFrnxvw3Dh2f7koP4SXI
         14LGSHdtM1P8kNXXWcwCABXV9HuCADCM0HRwN9F8xughGAqQYz4k56iDEFxfkvIKshgj
         uBgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789990765; x=1790595565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bJjHs4K3u+gvdjbfOs0Xg8GRiY9vzGbZiOJ805s9gPE=;
        b=rlSGJ4lVhZKaH7qLtO/CFQkwaytpRobXICCFZJNfnr7GxdkJNf4uWXOeObeTIUPt5Z
         GdEsLhtWGoN1O27b08jeIzNnCGn8v2TnMyXhKwNZaBux/24y4XFYwJpTI8t8M6Cr2La/
         Bq98MsAi9eFMA5Oj1wnC/Z+68kKrrhShkTXmom3QsuL2XdDL6CGFz6V9raJhnJ94eATe
         YH276GXltvnUiZajxxsvaZtjirUOrKMDslhrsPu9mQJ0AqUZUCKYMFw8vRzhQbt+TOSJ
         JBztkL6YffZ3HQNmPCyJ0f6H+z3DdAJ35lVLpBuxwiAqp5D7Iz+A/GVne6dsoZBrpbc2
         le8A==
X-Forwarded-Encrypted: i=1; AKwUvByZEqY7Ew7iEL2h5wo1dgFGM/CQ7a6lYaPc1aEvnNDYIZ8I67/3Mw4b56acmAJVKc92QYlQdLvm0NOfie8=@vger.kernel.org
X-Gm-Message-State: AFuF++lm7N/C86Ou9bL1cunsc4dXHGOUxHp6CZUwTrMnLX6r6Ze1RiUC
	fG+5m+vNV5GUFbh/zS/bOr7druRKqXaq/jK509mWImIe8llMIJPfzrrS
X-Gm-Gg: AYBFou2pjrVaSb339vMNij+HWZw0aVJlaUMniAGORrYEUQ8GDSgaim++Yl6Vw9wPBLb
	fC6uVjK+HY4JeG9ofroZpTo5W7mYYatS+1EBTMwQigjd1Xv4oJItCA/razXhN7ZFm972rdnbJmB
	3WB+cc8UntqhhS2mR74htbEbq21GP5JI2NKa1GD0bTESnlfRLUaQCdwD770+fSw7OF4X6QVVke5
	Ua3CT82rmQkXzca+qGDP7SYX+LuHNveq/0Qr6JfCY1N8XguIriqwHihnhzE5DhTV4QaMiYhIIDy
	bcZL2w8uKl+GV5uhMIFTnKmiXG2LbtQyQGTURAI9eUxtIIYlQPUnGCICVa6LGGvJJxK0Q3fnUMt
	RUUVG032YJpQ1XMA4CGwB2pK3uBmsbFX2xgSP44rFX0ZJNW3RZr9fsFqrJZkxSnBaMuMupZrpBg
	KLUigxj/4O+gM7/suzXeLxu1hhRLaLW8JZHgVsw0zg2/Ds1bZiv0AaDmr1AovOBBsBkyRSlkIoQ
	+NDVg==
X-Received: by 2002:a05:600c:3b8e:b0:49f:bc43:9e96 with SMTP id 5b1f17b1804b1-49fc57144aamr185348875e9.8.1789990765124;
        Mon, 21 Sep 2026 04:39:25 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc57547easm244273865e9.3.2026.09.21.04.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 04:39:24 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	CK Hu <ck.hu@mediatek.com>,
	Jitao shi <jitao.shi@mediatek.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/4] Add support for the mt8167 display pipeline
Date: Mon, 21 Sep 2026 13:38:54 +0200
Message-ID: <20260921113914.779393-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for (almost) all display blocks of mt8167.
This SoC supports a DSI or DPI display and has HDMI output via a second
DPI block wired to the HDMI phy.

All the hard work was already upstreamed in the past, now all that's left
is some glue. In the first two patches we add support for the DPI output
blocks. In the third one we describe all the possible combinations of the
SoC display pipeline and in the last one we add the required nodes to the
SoC dtsi.

The final outputs of the display pipeline in the SoC dtsi are
intentionally left not connected to allow board dts to specify their
own output node.

I said almost all display blocks because HDMI output is not included in
this patch. I have it tested and working at all supported resolutions, but
since it needs some fixes in clocks and a new phy driver, I will send it
in a separate series.

The series has been tested on a Lenovo Smart Clock 2 (DSI), a Xiaomi Mi
Smart Clock 2 (DSI), and a Sony Playstation Classic Mini (HDMI via DPI).
Unfortunately I couldn't find an actual device using a DPI display, but
since DPI1-HDMI works, I feel confident saying that the clocks divisors
are correct.

Changes in v2:
- Fixed some copy-and-paste error in MMSYS routes spotted by Sashiko [2].

Initial version: [1]

[1] https://lore.kernel.org/linux-mediatek/20260918175736.355305-1-l.scorcia@gmail.com/
[2] https://sashiko.dev/#/message/20260918180358.81A1D1F000FF%40smtp.kernel.org

Luca Leonardo Scorcia (4):
  dt-bindings: display: mediatek: dpi: Add compatible for mt8167
  drm/mediatek: Add support for mt8167 Digital Parallel Interface
  soc: mediatek: mt8167-mmsys: add routes for all display paths
  arm64: dts: mediatek: mt8167: Add DRM nodes

 .../display/mediatek/mediatek,dpi.yaml        |   1 +
 arch/arm64/boot/dts/mediatek/mt8167.dtsi      | 369 ++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_dpi.c            |  23 ++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |   2 +
 drivers/soc/mediatek/mt8167-mmsys.h           | 193 ++++++++-
 5 files changed, 579 insertions(+), 9 deletions(-)

-- 
2.43.0

