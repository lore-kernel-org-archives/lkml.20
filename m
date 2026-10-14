Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5524C41A91E
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791962284; cv=none; b=uckHH6/a/hVN3sWZWlACrHXs5LQrObwwT59OuffisOqIRGPB0edkhc0IED5GKLxYsvw1nXhYXOUs1765yAtCD5vS//xgQMqZRrdqY3zhkibqTWiDashsdggyEYIcHdulrdH0qYxTSAIg5PbzC0u7p7U5cr51jNrfWJjoNjTJ3kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791962284; c=relaxed/simple;
	bh=d4GLcb5Sehan0oOBDRGYh5uZjLzRhyZtSNxK5RqNJZs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TACapeqUU+V1u37Az8s6bEexrpbs9dOfypMklIC6QMq/Ssihr7OR9wVnEqBUerv04P1dTCebmI63qD+5PpouKYaqxzCGVB9bfZeK6dO5IgKd/7Ex/NL8FKHryIdDFMn6InFrDiO/KEODFTHtkkaqh+r+uGSlsrj0FIiVMGGT91g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lfDsyo0f; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lfDsyo0f"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a021c809e3so36590045e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 00:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791962279; x=1792567079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+Gr5bWZcYgumQbnVFUL+12XP1Z/UJrPiizeHxuglwVk=;
        b=lfDsyo0fqAJmiMO6qfwJnfuaEuU4QXcTPu4n27AgE7xoKpcRLA0vARvn3hwN/Kv+ES
         9MoSbXs5G9Br3+J7DIfeulIQszoxluJ140IkTPgYoAH2fVUWo/sbUXUm03S5YTo9W4IC
         OJIt2+OrckKB1bw5q69tB3qPmDVlGXkTe0e0pYWsovRnO+7dSYg84AUCYD+fPFlqGVmE
         GYmDb0qh9EOHEgqvcdyAx/fVKj+nLBDgeCZkIR0lNkaYm+oqUxgBsYwk1/fBQSLPBjJn
         uGRPyr9Drk7erbwyf83NjkMCLar4b7w9FIePp8r9PiVAlp9yrAuooBBr6fNJk4vNpRTi
         5bqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962279; x=1792567079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+Gr5bWZcYgumQbnVFUL+12XP1Z/UJrPiizeHxuglwVk=;
        b=MU3Mf9exZ57Dq/HvjzCvSCrDCmYn1nDxNMxTv8bIEJ2wcSIovn/TURodUloyxoN60J
         KQWLTZafhdxSb6n0+45B727a1h6wI+AzJLTTiq4lkFvQDT/N5O902gWJ9XKMfnKFiS6z
         WWZ4KLPl7bqZmoRR4udi39BGONY03laU06Srv/mPtCiTNdEuvgMZo3g2YAzMYJJ68B7u
         sUx/rB0Er+u9UrMYdqcwvw/tWniSmPVjZWUsFB/mVhp2Rap8C+kFhtQUDkT7l5+32qUx
         D47xJNdnN2V049FxKLDy/1GpWzJQZW10t/ekMwjwx35+zVFgYudOGF+Z4XGfU4i9cTO+
         hA6g==
X-Forwarded-Encrypted: i=1; AKwUvBzuSvX2gVDdrbWvHKVQeR8cyNrm0B4Yc4FCMsHwJFfmtt4DvlQC9x/vd/AAmEp1sYeaw/bsWnXzIBU/OTI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJKfAs/aUhyK873AAqCOEjgwKGyHiHA+LVKkm+2stwvmMXr6qZ
	79cBVOBhvNpc/WB9KSbP1kaBqsS35z+4v5nlC03h1IpAxPxqj95nOO7j
X-Gm-Gg: AYBFou2xP5wYs2rn1vJYT46uORTV5iuaxbzophnreTVksZ4YjaOOgbWARKZxckDJtA2
	e7/z86GPFhBcs9aTQm45K8foB+0Sn4czVndMnWO6AW1xM5CjMRepq17mY3ucOL6MMgqs7qBrlMq
	4HN5HtM1otwX9iT+HUXYDDF7FNAeASPK/8mhKRQAiSDYLwDkDquaLlld1ugAG+TAk3vleoJY/yk
	nnwZ34YUZGKFAFDQiyfxl89kLsqjqMnsspJF7XxzFd8UNFKUy0G3IFWifN8gElBWZ7I0IU2rCMi
	pnUht0Y6nZAqTyoO2fhPE0c6kgh3dBlOtBAVbagkfzlJIqSlm0G0UlOESSyvmez1+LrxFSLZcJu
	1JPkL2F7qw1Bpu3PG3Gh2cpc7i+wO+DsS3L0ten7L0YTXIaHTKMWed8fZtK4ZF5M8jqwApwG0AE
	wfNTW6fpB+JiZfheNgYcOz96nU6ch4GYlE825rvdT7SaHHXUVuJ8jKsuc8hhS2T25JjNP3RW1Fq
	Qn4Z590Cp9uXWy8Vw+50c5HEpv6W7qL4t74NVLPnG/lEcPTeqM8dLMJaYe44XYdQAr8jVfAb0MQ
	2M/TElmgiU/6wdochvH7NXL7pca5YzBZ
X-Received: by 2002:a05:600c:3f0c:b0:4a1:85d9:13be with SMTP id 5b1f17b1804b1-4a18e498471mr318247985e9.20.1791962279370;
        Wed, 14 Oct 2026 00:17:59 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-235-252-189.retail.telecomitalia.it. [95.235.252.189])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1b35d64e4sm18756285e9.0.2026.10.14.00.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:17:58 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ahmed Naseef <naseefkm@gmail.com>,
	Joris Vaisvila <joey@tinyisr.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v3 1/6] net: phy: mediatek: export __mtk_tr_write
Date: Wed, 14 Oct 2026 09:17:32 +0200
Message-ID: <20261014071739.216345-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014071739.216345-1-ansuelsmth@gmail.com>
References: <20261014071739.216345-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Export __mtk_tr_write to directly write to debug register.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/mediatek/mtk-phy-lib.c | 5 +++--
 drivers/net/phy/mediatek/mtk.h         | 2 ++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/mediatek/mtk-phy-lib.c b/drivers/net/phy/mediatek/mtk-phy-lib.c
index 4c4eca870bde..3e4fb899a85b 100644
--- a/drivers/net/phy/mediatek/mtk-phy-lib.c
+++ b/drivers/net/phy/mediatek/mtk-phy-lib.c
@@ -36,8 +36,8 @@ static void __mtk_tr_read(struct phy_device *phydev, u8 ch_addr, u8 node_addr,
 		*tr_high, *tr_low);
 }
 
-static void __mtk_tr_write(struct phy_device *phydev, u8 ch_addr, u8 node_addr,
-			   u8 data_addr, u32 tr_data)
+void __mtk_tr_write(struct phy_device *phydev, u8 ch_addr, u8 node_addr,
+		    u8 data_addr, u32 tr_data)
 {
 	__phy_write(phydev, 0x11, tr_data & 0xffff);
 	__phy_write(phydev, 0x12, tr_data >> 16);
@@ -45,6 +45,7 @@ static void __mtk_tr_write(struct phy_device *phydev, u8 ch_addr, u8 node_addr,
 		tr_data >> 16, tr_data & 0xffff);
 	__mtk_tr_access(phydev, false, ch_addr, node_addr, data_addr);
 }
+EXPORT_SYMBOL_GPL(__mtk_tr_write);
 
 void __mtk_tr_modify(struct phy_device *phydev, u8 ch_addr, u8 node_addr,
 		     u8 data_addr, u32 mask, u32 set)
diff --git a/drivers/net/phy/mediatek/mtk.h b/drivers/net/phy/mediatek/mtk.h
index 79e09727b81b..3565e39b96a8 100644
--- a/drivers/net/phy/mediatek/mtk.h
+++ b/drivers/net/phy/mediatek/mtk.h
@@ -72,6 +72,8 @@ struct mtk_socphy_priv {
 	unsigned long		led_state;
 };
 
+void __mtk_tr_write(struct phy_device *phydev, u8 ch_addr, u8 node_addr,
+		    u8 data_addr, u32 tr_data);
 void __mtk_tr_modify(struct phy_device *phydev, u8 ch_addr, u8 node_addr,
 		     u8 data_addr, u32 mask, u32 set);
 void mtk_tr_modify(struct phy_device *phydev, u8 ch_addr, u8 node_addr,
-- 
2.55.0

