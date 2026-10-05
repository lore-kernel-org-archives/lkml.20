Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADD44334BC
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 22:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791240638; cv=none; b=LxFfyhx670k0CjQmfHN/m745gQpM5UxTaXqLmvRrd2RhmPtKczgT/PAilRqsWjtybmqssjg0hOYAwy3gH4g7xk9KN1JF9qgql89SRMkimEFCZM3QpEyVjjCH9+DfGol1vDWUJJ+dGvzGpFuCY6zqKiRXM7+fc8ZVxnrhHXCP0D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791240638; c=relaxed/simple;
	bh=LFSA8feAoSV7Rk37+Z54SkvL6CshyhdgMHIDJRLxbMs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IfPbAqkIAOHmTsf1wGRsadke92HC4IhM/8vL0SDMR4FoMJ/gu7K7JL/fOd8oTqAEtklD/WWZMhLO0Ocju2TAlfUuBszn7wq57Q1y5pQ1kw9uA41csu4kKkiJV61gveuGv9PXt4gIIFppoVeNIjalsfPphM8+vkWDhfB27/uouwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fOCPrIey; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fOCPrIey"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e2e0f3dd40so14537715ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 15:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791240632; x=1791845432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NElNsMz+D132sFgkyXd9YdnrBfiWRjJQdINkQ7a0bW0=;
        b=fOCPrIeygIIPMafqrTUdydnViQdcpfib5FsJIx+JcOl5ctMWpvJauncfoID2a+grNT
         TwBtz9vXDmQbU1f/8qaGWjKTQujza5rUQwabF1JHkeN4PcF8hB5QcQeJ8xz/C20+kbin
         0050VMwQT7560NFratKbKBgAiH4/IJ5URk0thUNrFqr/rDGK5g19eNBp+NZLJOEIrmYR
         XPaGi1oaQ88AJlVD1aak+e7ncQbeNGS73e1/TrYX/pZ5MPOB4S2xvs64ZXJkD7K1t5Q6
         E/WP+j34hbXOOIqmI4hot+HfR3XD4UQjPPQH672FcpVQ9rLAiGxpEsRnyjSqVYF7mHS8
         glfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791240632; x=1791845432;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NElNsMz+D132sFgkyXd9YdnrBfiWRjJQdINkQ7a0bW0=;
        b=qOws3U+iivmefkj/FAw46KoXHKTQRcWVgcJr3NCgjau8u0vg4cKJ6N/ApEzLphz9Tn
         EXDw+owYYcIH3IwzZgVG1bIiTgs19P6khRNgrtnRVAkNAcgfC3J24D/mJzTgAzIfGZzM
         7UA0o66z7VmeDiu8aMzezI4zJ/U3xXFIomERhNLzz/zQ8S+tBdEAMa1mgH6c2pgzCiTo
         EtSGXQq5+BKHG6kL7u7cIPrgu7exUOVs5DVFihZkWGwDbT1/aLDX0qA/8Sfx+z/g8LMR
         e9a2mXMrCRGuf6HE5MkK4WNwk0mwa0N0x0pATOZYdI7PJeCzGKRvcaaSw4vWowfnWeia
         /ffA==
X-Forwarded-Encrypted: i=1; AKwUvByvK86jctFTpx6nSfZKUkTQZdbfxopsngoBvTkHkpLhi24EnqnGR8Dwf/tpnEtKxh0A5QgliRYIS0CQEEI=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7jLBLJpxxI2SWyXWO8CE38RTrlYEpcLCc0vee+h16wYAeEy93
	gOGyeKToq21G8ChWX2J7StPDUmgwvWI3dtmEKlYeFPZa2hl7ooJA85SS
X-Gm-Gg: AYBFou02htuYyYZ1yEkmESMq8by/Slzs0+5cCSMl7oVevIuGgyymQrQTLo1SspGEftO
	djAdZ+g5+ZeO9afjfEIOJ+lI3faIuW5ZDElzgtTE9V01xm/JyUd7lqG9KKYqatM2ql4tmMaZVgu
	gJDibG1fVC67zgx/x7sDZFeULzLRXDxERrphwwnvqgzrE2LiRJAc9DvUauxPEAeevPfiAZTsJpr
	ladD57I5DjU6zuCpMz0NbGaGSdXdH5yLnQYDzQHrEsYGCWzLgCsI+yl9z2lXjTQkLYPjnGZ2zDP
	CJLkSZID4uOdR2VeVbB4w3cVfiBgXWVANlikL8SbBxcEAsTE0Q/qbLcg8kmEkJOL4vBDnF/KCjq
	XE44LWmS59RHd49/9XN83Px72tQUW1qDwGkOkuc1Krqv0V3sBPt5rJHW04htU6WJnLLrybJmjuO
	v/rRzDkHh+sug1I9z4ksS5QbN43waGdg7Rwv8uOnNsQ9QptQ6CH5vzS+lD2IYQ5mnXW6E9uhOOt
	MU9Dmegqk0Es0Xfjw0LRvhuXtheqFfdlT0X3ytHKrlMgMuU7FJjYUHqFjcJAxFex4CS2Vo4t6bh
	F4kwMVZ4J8dzAMJPyY5HfNug20ug/0STVqV1B1zgd1HPiRjm
X-Received: by 2002:a17:903:22c9:b0:2e5:ca81:13a9 with SMTP id d9443c01a7336-2e5ca811612mr6715975ad.37.1791240631818;
        Mon, 05 Oct 2026 15:50:31 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5d3013e1asm24585ad.45.2026.10.05.15.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 15:50:30 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Michael Stapelberg <michael@stapelberg.de>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3] net: phy: marvell: keep WOL_EIE across interrupt reconfiguration
Date: Mon,  5 Oct 2026 15:50:28 -0700
Message-ID: <20261005225028.465866-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

marvell_config_intr() rewrote the whole interrupt enable register, so
the config_intr call from phy_init_hw() on resume silently cleared
WOL_EIE on the 88E1318S and 88E1510: m88e1318_get_wol() still reported
WAKE_MAGIC, but a matched magic packet was no longer routed to INTn and
the board did not wake.

Make config_intr update every bit except WOL_EIE with phy_modify(), so
the WoL interrupt enable is owned only by set_wol and always matches
what it programmed. The read-modify-write runs under the MDIO bus lock,
as do the accesses in m88e1318_set_wol(), so the two can no longer
overwrite each other's update. Have m88e1318_set_wol() clear WOL_EIE
when WoL is fully disabled, since config_intr no longer does.

The interrupt register layout is the same across the PHYs this driver
handles, so extend the shared handler to also claim a WoL event instead
of adding a per-PHY one.

Fixes: 3871c3876f80 ("mv643xx_eth with 88E1318S: support Wake on LAN")
Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v3: use phy_modify()
 v2: resolved review warnings, including wol d.
 drivers/net/phy/marvell.c | 30 +++++++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/net/phy/marvell.c b/drivers/net/phy/marvell.c
index f71cffa88406..56650182bf3e 100644
--- a/drivers/net/phy/marvell.c
+++ b/drivers/net/phy/marvell.c
@@ -55,6 +55,11 @@
 #define MII_M1011_IMASK			0x12
 #define MII_M1011_IMASK_INIT		0x6400
 #define MII_M1011_IMASK_CLEAR		0x0000
+/* Bits updated by config_intr. The WoL interrupt enable is owned by
+ * set_wol, so the config_intr call from phy_init_hw() on resume does not
+ * silently disarm Wake-on-LAN.
+ */
+#define MII_M1011_IMASK_CONFIG_MASK	(U16_MAX & ~MII_88E1318S_PHY_CSIER_WOL_EIE)
 
 #define MII_M1011_PHY_SCR			0x10
 #define MII_M1011_PHY_SCR_DOWNSHIFT_EN		BIT(11)
@@ -393,11 +398,13 @@ static int marvell_config_intr(struct phy_device *phydev)
 		if (err)
 			return err;
 
-		err = phy_write(phydev, MII_M1011_IMASK,
-				MII_M1011_IMASK_INIT);
+		err = phy_modify(phydev, MII_M1011_IMASK,
+				 MII_M1011_IMASK_CONFIG_MASK,
+				 MII_M1011_IMASK_INIT);
 	} else {
-		err = phy_write(phydev, MII_M1011_IMASK,
-				MII_M1011_IMASK_CLEAR);
+		err = phy_modify(phydev, MII_M1011_IMASK,
+				 MII_M1011_IMASK_CONFIG_MASK,
+				 MII_M1011_IMASK_CLEAR);
 		if (err)
 			return err;
 
@@ -417,7 +424,8 @@ static irqreturn_t marvell_handle_interrupt(struct phy_device *phydev)
 		return IRQ_NONE;
 	}
 
-	if (!(irq_status & MII_M1011_IMASK_INIT))
+	if (!(irq_status & (MII_M1011_IMASK_INIT |
+			    MII_88E1318S_PHY_CSIER_WOL_EIE)))
 		return IRQ_NONE;
 
 	phy_trigger_machine(phydev);
@@ -2074,6 +2082,18 @@ static int m88e1318_set_wol(struct phy_device *phydev,
 			goto error;
 	}
 
+	if (!(wol->wolopts & (WAKE_MAGIC | WAKE_PHY))) {
+		err = marvell_write_page(phydev, MII_MARVELL_COPPER_PAGE);
+		if (err < 0)
+			goto error;
+
+		/* Disable the WOL interrupt, config_intr leaves it alone */
+		err = __phy_clear_bits(phydev, MII_M1011_IMASK,
+				       MII_88E1318S_PHY_CSIER_WOL_EIE);
+		if (err < 0)
+			goto error;
+	}
+
 error:
 	return phy_restore_page(phydev, oldpage, err);
 }
-- 
2.56.0

