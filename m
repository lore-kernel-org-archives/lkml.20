Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF301E8332
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 08:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791706861; cv=none; b=AsnueBur+tSkaExnYaCGeaks369jwB+ewL3zt/G1w2/bfoaiSamumi91WhZAPuUq3YtIz1kY2FhwvLUazX7/Bj2BCwTEwejt9Y9tXmdwZdlTQVERKhMqrj0iGgFPg/ssSaRs+/GpKggfMzDxFg8yDWVht4I3CPe6VufbbcyObT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791706861; c=relaxed/simple;
	bh=7xseFDg2DfuKOCY187wJoUdoDhg/OnzPbY1h2hrMjTc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FBW9nfm2lPO7T4LMd0TLz0xAC7TOa0ISnYcYZVnRzzBHrnepQiNL1iuEAG68ObZsJgkXAZuX03urVz1Mcf0dsylHd0IRx2n1RlXA4nbra9J2YZIfe3fix5KHKWhVlsWZyFYwY811qhDmjik/Bq1nnj13bjVFT89UgROsVkJMhKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RhlHGgfx; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RhlHGgfx"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a17baef589so6822165e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 01:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791706858; x=1792311658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dr49tUUlFxPFnEicxFg6BKjDZLTyIOa8zv4bTCe4eu4=;
        b=RhlHGgfxDI6/creC5xJk11WxpLURRMreRFGM5JvViQ5x2U9+W4MA5jkKYpznmckN08
         eHQVNPaZ6e22I1sKlVCJieyIXKUxJgidGUcvH/tgMg+ZX4c1LVOroPrg0xbc0coElDnc
         i5ZEhWTVABRddG0zPUJfGKvccn3MQNyIm5neRTNa9aKpnxSfhgiltcrhW9bWarUN7d/p
         b4cK45TCkzAYC1Rv7NE9M63SONDJb4PA0S3EKxvMaktLu19nBnLBPiZn1zvzqLE5D+/g
         W9bn3nGhbMOFvBRO+VvJUT1vjTlZHJOiCaF0M82xAmGYHpfdOiI2z0NTLLLhydz8KDjs
         Mzog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791706858; x=1792311658;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dr49tUUlFxPFnEicxFg6BKjDZLTyIOa8zv4bTCe4eu4=;
        b=dmRjEySrShPmuG5+RwvSWUZKV0g0w9hVE3eVtRDSUTBvuL6vF0pyeyheWz4kjV3O4g
         9b3TRINDH7xv1LHRN+5rM3URKrQfcWMBT4ZjTSRz16JAqFORvOzTc5aYVWV2WJO7uIqS
         OEMe/qwzO+dmCZuOYNFJZscg2LbA6/b8sKrS8D7k4cRl46xuJQBUMHG92cgxu4w1ONHh
         G87xVTmnHRbXDC5Quoz0hgd35NhiJdHA8NgW01QnMPPGRwiP7w9vY8KT+R7dOw165hp2
         TbcLzF0WnWyJiYhvqgx4zofefToJpwV6+aRi0/8DnxA/F3Sj8OjIdgn8nT6uL+qZokYN
         7Qwg==
X-Forwarded-Encrypted: i=1; AKwUvBwHsu3ZYLdcqVgU3JSeiG9XKZbSXiD5DgUuIQSdXB26v0aK0Ov8vTKXE0e73PsAb13LF/x6gZrr8R7x2ek=@vger.kernel.org
X-Gm-Message-State: AFq9FYJlo5sFf/p64MpHqS6BGIvztRfs5JFc7po7F+EVwyP5+RiNdYKT
	NS7JDP6hIX5JuHTdMXwB27bZ41W64NkLwCfegdVtTQwRgY3Mq55Zgcg8
X-Gm-Gg: AYBFou3dIn+WoFV3BxpVyuzhtiupdEfkVyAb8rA4t60xNEUoz5Jf5RpDliP2Wu2+C+B
	mifosebnnRbhZsAuyyai3bTiK1eL27V9Ulml7ZtIuGkEwoKa9zDfjq0A2peGrRbKAmaZSY9rRYr
	BpNlETB/ifS6BUWhTTY+vJ/nbq8BUidryr3Q68SGTz7XeuqUg7xDIjKsth/2jCW9QjDIt1TLS2J
	DAjRwCjjYG/ncUit7StvJ6tOWS7/UpnjeXgAkpOyVmVvl7nzQFOdVu9XPLgjZd20rSr4BQ+T+Ow
	CqopFwlBG5BW2ACOB3IqCuf6HoFESXJJUeAuJ231qkCJeYHfwzAMXN2b+H6/76q2iVkNpNgz2nh
	KTBd5keha6oyfhbw4iBMqrRCSwFUpzf7yProe3NHqGUXBfDESsGbK86HGVLdQEn7G0qL3nHnNRD
	GfZlBfJxjW2JsGcz2z6NOdHzARCeNi2yqat2MvThwI7HaCe3T9zspXqK+6lcl154iIMr0=
X-Received: by 2002:a05:600c:4708:b0:49d:15b9:2a2a with SMTP id 5b1f17b1804b1-4a18e47a8a5mr126204925e9.10.1791706857720;
        Sun, 11 Oct 2026 01:20:57 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a195002123sm152063175e9.1.2026.10.11.01.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 01:20:57 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/1] phy: mediatek: phy-mtk-hdmi: Use regmap to manipulate hdmi registers
Date: Sun, 11 Oct 2026 10:20:30 +0200
Message-ID: <20261011082042.348422-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While working on MediaTek mt8167 HDMI support I noticed that on some SoCs
like mt8167 and mt8173 the registers used by HDMI PHY are actually inside
the memory space mapped by the apmixedsys driver. On mt8173 this driver
maps its memory using of_iomap, while on mt8167 it currently uses
devm_platform_ioremap_resource. The current phy_hdmi_mtk uses
devm_platform_ioremap_resource too, which causes a conflict between the
two at probe:

hdmi-phy: error -EBUSY: can't request region for resource
[mem 0x10018300-0x1001831f]

In patch [1] I initially proposed to use the same approach of mt8173
in mt8167 too. While working Sashiko correctly pointed out that it never
unmaps its memory during remove [2], even on mt8173. It is of course
possible to add code for that, but it would mean creating a dedicated
drvdata structure, and it seems a little invasive. Using the devm_*
functions is certainly cleaner.

This patch goes in the opposite direction - it converts all register
access for mtk hdmi phy to the regmap_* functions and obtains the regmap
using device_node_to_regmap, which internally uses iomap and does not
trigger the conflict. This way memory can still be managed by the
apmixedsys driver using the devm_* and the HDMI phy only gets a regmap.

This patch has been tested on mt8167 only. Unfortunately I have no devices
with the other SoCs that are touched by this refactoring, so I am sending
it as a RFC to gather feedback from more experienced kernel devs.

[1] https://lore.kernel.org/linux-mediatek/20261010115539.9237-4-l.scorcia@gmail.com/T/#u
[2] https://sashiko.dev/#/patchset/20261010115539.9237-1-l.scorcia%40gmail.com

Luca Leonardo Scorcia (1):
  phy: mediatek: phy-mtk-hdmi: Use regmap to manipulate hdmi registers

 drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c | 145 ++++++++--------
 drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c | 133 +++++++--------
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 185 ++++++++++-----------
 drivers/phy/mediatek/phy-mtk-hdmi.c        |   2 +-
 drivers/phy/mediatek/phy-mtk-hdmi.h        |   3 +-
 5 files changed, 235 insertions(+), 233 deletions(-)

-- 
2.43.0

