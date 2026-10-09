Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF564E36DF
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 14:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791556529; cv=none; b=sZhMsrJo5E+CAJyguPFlejn7JNlXtQlNTibczAXo0tHVdQIGwdcfaY21SuSSuViQoYKjzAfBo6Qo14df4KwXeQ3039NHWM9H/ea+UCNRLf7tQfReTHeKIZgjbbAsFpFTrbdEZOkyn8c4rjUNPvbDTBPGYavOi82WTn6EQzqOymA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791556529; c=relaxed/simple;
	bh=kYOWTtcRSnBg2+a4cGHVZyquREY6r0DKghYsyPc9Il0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NlJsvN1XAGV7ZArzczlI+Ie2Wuuhy1nx9GQb8DD2KABTQ1AJLIvZVxHDdX7uOcnhfAfcFJkn5JbOv24NhNniqi/wUHq+MWmez7uqG2qDxY8Xoz5hDS0jUZ2nPkfYZdVKk//dlcOfmQS21twW1v9mX6rX7PIvUwaXo3S33p3EHU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com; spf=pass smtp.mailfrom=jclark.com; dkim=pass (2048-bit key) header.d=jclark-com.20251104.gappssmtp.com header.i=@jclark-com.20251104.gappssmtp.com header.b=JLnJn6Gx; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jclark-com.20251104.gappssmtp.com header.i=@jclark-com.20251104.gappssmtp.com header.b="JLnJn6Gx"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-93e503815adso338678985a.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 07:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20251104.gappssmtp.com; s=20251104; t=1791556526; x=1792161326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=39M6cKiwSBQh698eXKEbMm/aXVe8zrZhERHGjPGBWrE=;
        b=JLnJn6Gx9ndL/iovvnjMBVuZsdyW+ORKJttqy+wArXAwr6aHgJpsBMjFdsjenrKLz6
         mMOYc4kcSVtrUZG5/W+1REd9p2NgDVi20V5Pl4weCmoeC4yvA7zxl5qqGA9E8Bi9Km82
         /3LbkTnXSeAfXQUIY7Dmrrzg95od11RwLEiJBqjX/dtWEa+0aDhPwgvDVqika1fCCCOY
         DcB73ueb9zn2LhM20ECVK5SAxIjnGLJkWpJDFyhZqtjdW0I8kOssDTUe42aAgKH3WWW+
         ankGc8wGQtrqLYJzUs7bFWC3CvHLjfucodFFkTEMD7zFOTcFWabu5dDgYfXMjlVYbYwx
         /Org==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791556526; x=1792161326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=39M6cKiwSBQh698eXKEbMm/aXVe8zrZhERHGjPGBWrE=;
        b=aCYYNbe0L6x2yJ7tfktRXixp7kyNyH18ZsgfYo7m/AB5kFnvHQAb8gYppg+mY3XJWL
         ZZ1WQppy2A5JU/9Q70ywSYygtiYixPzPeeKodd7j3AhcI86uX94FvdN2nLAVqEMCcEAH
         ihBhHi312+TDHDz9z9xVmR0I/T0sZTO/qGt5XA5pHzBKVAU9S6lZFribqZlIg7hy97Pt
         YDOnRt7dwY26U6iFXA6SNyDUMyB/hphjzeBAY45L5EHl52a6QCj2gh3vTzw7pf4UM7Lo
         2pw5hRPhBAkvhxbID6K0a+I984reTu4VR18ZLSgaEpF+eIhT4anP2AJkLFuB01h7J6vH
         ewpA==
X-Forwarded-Encrypted: i=1; AKwUvBxs4gPtrOTY/5/fKA78XjoxlI/kGjZq4w7AEigLUUkcCGAGYGgVX7B8c198aTupH4Tyyygh9AWzFdep2mE=@vger.kernel.org
X-Gm-Message-State: AFuF++nn6b/dzK31kC617QfPp6091GyVNM6tlldLp/D4fKoFpCOZ6E2D
	mjX7erXlfvhqx82xDxB0cZRV4jAKTcYjWOdx5SBp8iLJjTERHu2u5zmnLkoi3AfDEZbCZBinKLN
	1hoE7ZdnFLXI=
X-Gm-Gg: AYBFou3BDtGg/UxqPDd2zce9ifNxfQfN2QPhgBs9ADDcedBzo1ZIDRk5OHIaCgoc7Y/
	YwhS4bqfZ/80p1nCN9KOBAXJS66gWXFAqrg7tsHAjb5mTFpvf7ykDzJ51eXT5MKxpqIjXclV3mt
	74Hfla6UkADp7BbogwUIAGBywCtNM81rRZtg088BOOfMWmF8nXA3lR3eygMUdqciji4EyoX7CvJ
	nU9i8oSGAJ989U+mWnvGy951mtxrE94+JH/uQZRYVcET5VM5+WP590C5eqS33XdpGaOFICpmu9K
	byKc2qrBWQBi2nIASqhXfaAgXNt7bueTf+s936lU5R9zFuWwDXGpAaLPU6TkYJd78sSiCpcbj4S
	dWhLWBh8auoLqaBzcrbPIzRcuM/76ComOxwLv3CwgPaNo/Bwig300k1AJVIm7fyiGzGg/Ggvg9M
	uzTJDf5FO+6sMz5DU1KUjXRTBZ5asVyMAmGixlWojEgP3g6bPKPmxZMASS8ttM
X-Received: by 2002:a05:620a:4503:b0:93b:d7a0:d9dc with SMTP id af79cd13be357-93ebd23ca0emr314762985a.54.1791556526173;
        Fri, 09 Oct 2026 07:35:26 -0700 (PDT)
Received: from cantal.lan ([58.136.72.162])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b5501751dsm19769456d6.17.2026.10.09.07.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 07:35:25 -0700 (PDT)
From: James Clark <jjc@jclark.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Doug Berger <opendmb@gmail.com>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>
Cc: Russell King <linux@armlinux.org.uk>,
	Conor Dooley <conor.dooley@microchip.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Miroslav Lichvar <mlichvar@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 2/5] net: phy: broadcom: use timestamped MDIO writes in gettimex64
Date: Fri,  9 Oct 2026 21:35:03 +0700
Message-ID: <20261009143506.2507607-3-jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261009143506.2507607-1-jjc@jclark.com>
References: <20261009143506.2507607-1-jjc@jclark.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use __phy_write_sts() to obtain tighter system timestamp bounds in
gettimex64 by timestamping completion of the write that triggers
capture of the PHC time.

The PHY captures its time a short delay after the end of the write.
End-to-end measurements show that the delay is small, within the
measurement accuracy of a few tenths of a microsecond.

This patch does not try to fix the error handling in the existing
framesync code, which ignores MDIO write errors.

Signed-off-by: James Clark <jjc@jclark.com>
Assisted-by: LLM
---
Does Broadcom know the delay from the end of the MDIO write to the
framesync capture in the BCM54210PE? If so, I can add compensation
for it.

 drivers/net/phy/bcm-phy-lib.c | 25 +++++++++++++++++++++++++
 drivers/net/phy/bcm-phy-lib.h |  7 +++++++
 drivers/net/phy/bcm-phy-ptp.c | 27 +++++++++++++++++++++------
 3 files changed, 53 insertions(+), 6 deletions(-)

diff --git a/drivers/net/phy/bcm-phy-lib.c b/drivers/net/phy/bcm-phy-lib.c
index b64beade8dd..022f5e5e6ce 100644
--- a/drivers/net/phy/bcm-phy-lib.c
+++ b/drivers/net/phy/bcm-phy-lib.c
@@ -42,6 +42,31 @@ int bcm_phy_write_exp(struct phy_device *phydev, u16 reg, u16 val)
 }
 EXPORT_SYMBOL_GPL(bcm_phy_write_exp);
 
+static int __bcm_phy_write_exp_sts(struct phy_device *phydev, u16 reg, u16 val,
+				   struct ptp_system_timestamp *sts)
+{
+	int rc;
+
+	rc = __phy_write(phydev, MII_BCM54XX_EXP_SEL, reg);
+	if (rc < 0)
+		return rc;
+
+	return __phy_write_sts(phydev, MII_BCM54XX_EXP_DATA, val, sts);
+}
+
+int bcm_phy_write_exp_sts(struct phy_device *phydev, u16 reg, u16 val,
+			  struct ptp_system_timestamp *sts)
+{
+	int rc;
+
+	phy_lock_mdio_bus(phydev);
+	rc = __bcm_phy_write_exp_sts(phydev, reg, val, sts);
+	phy_unlock_mdio_bus(phydev);
+
+	return rc;
+}
+EXPORT_SYMBOL_GPL(bcm_phy_write_exp_sts);
+
 int __bcm_phy_read_exp(struct phy_device *phydev, u16 reg)
 {
 	int val;
diff --git a/drivers/net/phy/bcm-phy-lib.h b/drivers/net/phy/bcm-phy-lib.h
index bba94ce9619..365cb3d1c32 100644
--- a/drivers/net/phy/bcm-phy-lib.h
+++ b/drivers/net/phy/bcm-phy-lib.h
@@ -34,6 +34,8 @@ int __bcm_phy_write_exp(struct phy_device *phydev, u16 reg, u16 val);
 int __bcm_phy_read_exp(struct phy_device *phydev, u16 reg);
 int __bcm_phy_modify_exp(struct phy_device *phydev, u16 reg, u16 mask, u16 set);
 int bcm_phy_write_exp(struct phy_device *phydev, u16 reg, u16 val);
+int bcm_phy_write_exp_sts(struct phy_device *phydev, u16 reg, u16 val,
+			  struct ptp_system_timestamp *sts);
 int bcm_phy_read_exp(struct phy_device *phydev, u16 reg);
 int bcm_phy_modify_exp(struct phy_device *phydev, u16 reg, u16 mask, u16 set);
 
@@ -48,6 +50,11 @@ static inline int bcm_phy_read_exp_sel(struct phy_device *phydev, u16 reg)
 	return bcm_phy_read_exp(phydev, reg | MII_BCM54XX_EXP_SEL_ER);
 }
 
+static inline bool bcm_phy_supports_write_exp_sts(struct phy_device *phydev)
+{
+	return phy_supports_write_sts(phydev);
+}
+
 int bcm54xx_auxctl_write(struct phy_device *phydev, u16 regnum, u16 val);
 int bcm54xx_auxctl_read(struct phy_device *phydev, u16 regnum);
 
diff --git a/drivers/net/phy/bcm-phy-ptp.c b/drivers/net/phy/bcm-phy-ptp.c
index 65d609ed69f..2d8b377010b 100644
--- a/drivers/net/phy/bcm-phy-ptp.c
+++ b/drivers/net/phy/bcm-phy-ptp.c
@@ -214,22 +214,34 @@ static void bcm_ptp_framesync(struct phy_device *phydev, u16 ctrl)
 	bcm_phy_write_exp(phydev, NSE_CTRL, ctrl | NSE_CPU_FRAMESYNC);
 }
 
+static int bcm_ptp_framesync_sts(struct phy_device *phydev, u16 ctrl,
+				 struct ptp_system_timestamp *sts)
+{
+	return bcm_phy_write_exp_sts(phydev, NSE_CTRL,
+				     ctrl | NSE_CPU_FRAMESYNC, sts);
+}
+
 static int bcm_ptp_framesync_ts(struct phy_device *phydev,
 				struct ptp_system_timestamp *sts,
 				struct timespec64 *ts,
 				u16 orig_ctrl)
 {
 	u16 ctrl, reg;
-	int i;
+	int i, err = 0;
 
 	ctrl = bcm_ptp_framesync_disable(phydev, orig_ctrl);
 
-	ptp_read_system_prets(sts);
-
 	/* trigger framesync + capture */
-	bcm_ptp_framesync(phydev, ctrl | NSE_CAPTURE_EN);
-
-	ptp_read_system_postts(sts);
+	if (sts && bcm_phy_supports_write_exp_sts(phydev)) {
+		/* cannot ignore error since sts may be uninitialized,
+		 * but still poll for any triggered capture
+		 */
+		err = bcm_ptp_framesync_sts(phydev, ctrl | NSE_CAPTURE_EN, sts);
+	} else {
+		ptp_read_system_prets(sts);
+		bcm_ptp_framesync(phydev, ctrl | NSE_CAPTURE_EN);
+		ptp_read_system_postts(sts);
+	}
 
 	/* poll for FSYNC interrupt from TS capture */
 	for (i = 0; i < 10; i++) {
@@ -242,6 +254,9 @@ static int bcm_ptp_framesync_ts(struct phy_device *phydev,
 
 	bcm_ptp_framesync_restore(phydev, orig_ctrl);
 
+	if (err)
+		return err;
+
 	return reg & INTC_FSYNC ? 0 : -ETIMEDOUT;
 }
 
-- 
2.56.0

