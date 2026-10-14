Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6410419FB2
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791998587; cv=none; b=bjmVbncAWNxX1XQtZGquXzKJtJE4wCAphdCZtsh1eG8gujDZE0QiDz3rgJSDE6Z6dkTrmSDXIl/53GFTqDyCj9Dkewi2NUe0t7gnLSRWRQN0I1ChnqeERfMz1pJ8at15d+IIy75COxWZPJgTJPMMZ0dxjU3tNTqVNJoF1Zw1FwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791998587; c=relaxed/simple;
	bh=kwV6mI6CO5ixDdSeU2StLqiQxTrWodmaslZY1Exez0U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kbhigJnXIeJer0YcBUR8VYuqF87w8/+FfoQwUmzWxg0044ZnPgEDzRfS4wSjBu4OQVoxBFaVmBDphmyY+MAsTScLRtXDfX7FMNIsIkp/Kfvf5DCLPvKKqGYfba+UNmEDAWrgjdlUpVBo8GZAWCF8r85fV/vmzJ2z8hJNKApU5+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=tWQ9jOxF; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="tWQ9jOxF"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-535199ac562so42868231cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1791998584; x=1792603384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ww5U0pAT/EK2sJlV9E6NzHJiMJzSAUGDjX9HkzoR4OY=;
        b=tWQ9jOxF9a/FZa1sD10IWaILLqAqRkvvBgLaaT22oSTXbBQ/MVVaGz/eMvFWDmXoyP
         botnPZ8ZL1yusM6/Jhjsxdz6SnayiHv3xm9kmRpGBJEVBAf7Oh8vg+wuzw44mtAoYVoo
         pP8K3d0vmzuAqwbzKStZVOqPiP+9D3T+WnDTchp/Yn0Gv8KygHfIMQy8zg5ORVCMMfgH
         +S3HeeMH/V4YnX1u/WzTeTC3LJ/0sACGFNL8iupt6/D/b6dGDVwzyGM/uE6BveJ/w+99
         SHN0WF2iq2I/rXN9jit1W4qr0SdE6va5HMV9RlLbPBXnqlHtctWI84FIxENOcRqrIWqb
         Upew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791998584; x=1792603384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ww5U0pAT/EK2sJlV9E6NzHJiMJzSAUGDjX9HkzoR4OY=;
        b=avArSjxMt/ORXA/Fii4icHD9OecoQMB+l0ZksfIq8NJm1lV6Jad+5pJLFfbG9f4yIi
         wwr4+MlrcmC1OZPQFG321zRTCQ5pVE7RdAlJJdGlyi6bj4zlVrj37LYtwaQC7cEQWGmJ
         Hq8OqAdupIpb6xKUzOUPfflK+gOH4f9CXMLYQzu2Rs1j0GKYN69GcrnfiM8tGESitoJO
         LlIvsJjs4GjXKC86o02Ksd4sQ4eiBRDmGlrvY4Ne/vYmURh1PG8vWYlv/3wPSU45gxHJ
         7SCVmiMAhFp4Y2dSRvj3WKfXEi7wspM4ul9Q+AXRSU6NKDSdFb085tNaYse+aaZCEsy6
         lGIA==
X-Forwarded-Encrypted: i=1; AKwUvBzdt+pVjR21+UNhIEkUQWMS21O/RwIz5S78SJld4KLB113iBZtQ+nKHsvK9MGZOBvxnwVZOVjLaRA/B7/I=@vger.kernel.org
X-Gm-Message-State: AFq9FYLSNQFL8Ue8/JrlwKjSJRRNvIkAJG8jUuyM9DpvNLE0Fl3CGWkF
	a4/R+sATeVjkQhe2oQLIXOa3aHXg0okwpzHGwN5/RgeoJktf00zdwAT1033iNLr9Kfo=
X-Gm-Gg: AYBFou2eEzT+uMdOeJznMmsupd9WdJMn0ezgCuEUuMAVuxi9/9j5MBRUeYCQSd51MMU
	LMpeefl7mEh0FXNk1DF3PEnO2Lzfjkgq3g2BkXtn6sNJjSFbdqg9Has7h9AnJmv6asTcvV+4O4Y
	qihOXZeRGcMMO6GHtr76AlMFBgLOu8g8U1EwR9cim0j86hB9L6QZXifVxWvS1Hj1eRyi+tjWaNV
	0IYclcDadNB8jwMiQ9bmSiPY36rEqt/jDjAcKQfUc/ZyzM0x7rbQxHeVyJMy4ZilBNN16NbQqNe
	ehh3vdSsv0qpksumwqTDDaCpmWly7bLWQwSjFjHy4Ia/dR3lLVgjxJgbBupj2soejrJbmfi0EsD
	NRIUbeFFpDBbsSSoUwsIJhb2uxydDgPuIvcE92djKr6J13l+ULJkf5NG/zACUMFapxdzzZ21T+U
	zYD6BjvPfiMtqP0Jo4JDyQiAjPG9bMOzNV8NvpgiEAaOpX8xbiFAxtaJQ49tKrCrBj9bwdrZWme
	N8=
X-Received: by 2002:ac8:6109:0:b0:533:4da1:b5d1 with SMTP id d75a77b69052e-5359fa724e6mr266172231cf.23.1791998584265;
        Wed, 14 Oct 2026 10:23:04 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97bdf05dsm57638436d6.38.2026.10.14.10.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:23:03 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: Daniel Thompson <daniel@riscstar.com>,
	donggeunyoo.kernel@gmail.com,
	ansuelsmth@gmail.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	danielt@kernel.org,
	netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] net: phy: qcom: qca808x: Add regulator management
Date: Wed, 14 Oct 2026 12:22:59 -0500
Message-ID: <20261014172300.292324-1-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel Thompson <daniel@riscstar.com>

QCA8081 appears in embedded board designs paired with GPIO controlled
regulators for its power rails. Add logic to allow these regulators to
be turned on during a probe.

In order to avoid the complexity of tracking state for suspend with and
without WoL we take a tremendously simple "always-on" approach to
regulator management, essentially relying on BMCR_PDOWN to conserve
power when the phy device exists.

Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Co-developed-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/net/phy/qcom/qca808x.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/net/phy/qcom/qca808x.c b/drivers/net/phy/qcom/qca808x.c
index bab26e4c61408..6e2bd753257d9 100644
--- a/drivers/net/phy/qcom/qca808x.c
+++ b/drivers/net/phy/qcom/qca808x.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 
 #include <linux/phy.h>
+#include <linux/regulator/consumer.h>
 #include <linux/module.h>
 
 #include "qcom.h"
@@ -181,15 +182,44 @@ static void qca808x_fill_possible_interfaces(struct phy_device *phydev)
 		__set_bit(PHY_INTERFACE_MODE_2500BASEX, possible);
 }
 
+static int qca808x_power_on(struct phy_device *phydev)
+{
+#ifdef CONFIG_OF
+	static const char * const regulator_names[] = {
+		"avdd18", "vdd", "vdd18", "vdd125"
+	};
+	struct device *dev = &phydev->mdio.dev;
+	u32 count = 0;
+	int i, ret;
+
+	for (i = 0; i < ARRAY_SIZE(regulator_names); i++) {
+		ret = devm_regulator_get_enable_optional(dev, regulator_names[i]);
+		if (!ret)
+			count++;
+		else if (ret != -ENODEV)
+			return ret;
+	}
+
+	if (count)
+		fsleep(phydev->mdio.reset_assert_delay);
+#endif
+	return 0;
+}
+
 static int qca808x_probe(struct phy_device *phydev)
 {
 	struct device *dev = &phydev->mdio.dev;
 	struct qca808x_priv *priv;
+	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
+	ret = qca808x_power_on(phydev);
+	if (ret)
+		return ret;
+
 	priv->led_polarity_mode = QCA808X_PHY_LED_UNSET;
 
 	phydev->priv = priv;
-- 
2.53.0

