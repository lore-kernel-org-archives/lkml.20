Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD3B3C1D46
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 17:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788716755; cv=none; b=mc+5lyFO3qrC5xl7g0nKVOiDzTDnJ3EBelMUmyGcLdNDMgID04t7Z0hdTlOVZ5K/RwSM4MYrplgDmXvSiukB/gQRfIlCPBz1GfJOOEcseUDDbcaTuwZM01gMvu/3+PaZpMNGTPh5M9Jdm0bkCUt1BfL3p3cRmDTDaez5kXPFD7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788716755; c=relaxed/simple;
	bh=K244GoaR/SBN1qTkqznMbdB/qRyg1uAQxHof7eZyYLA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ggouyb9tGqx5hiq1tb7qsmdVQfMOVGY1+YJG8VymonU7E88MPAi4iC/D0b9HCtI6sU4waS8Znh1Yo2rbwb902PVXyoVgmBeevRrgeDMlkR2qcbpR5tZXn8hitoSS2OtvBALmFs5EL3vtAFh+mmMOzIi5UYzqRnmFQ6cmuX5ULGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=LZHeNUA8; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="LZHeNUA8"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49a97714f5dso24766175e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 10:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1788716751; x=1789321551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nwJE/G6DLPhkatwmSaqyq8HEYQKnbZm9tru5auWihS0=;
        b=LZHeNUA8ThlfHJ8IUWW5tpcRcoPmef+VXkClscU0s6ZK6Nj27WWGu17wGcstjFDm7Y
         +tNQrHe0TtDATUG1ZSaXaodU+oo9mxcFBfzTDA596/Ku5NAm2Cg/gClIOcsjQif0wLW1
         7lk+vZAXy8dsa9kPgRrxqi8bQFfGAxmx8frQynJ3fbAMasX8VHmGIdWY2poVhbxD/bja
         xxMbNXpfeXqzqAA2prRe2pzqVm+qA3Jceanbar2QTN/Gs09ACL/QFR/fi3hNGb15f7iV
         vMbpSACLaGiW5eJ7Dn98xtTmVSFytal6qZ8EvOvADUugsxZk5zMjLB86TLOSHjiZsQlT
         in1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788716751; x=1789321551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nwJE/G6DLPhkatwmSaqyq8HEYQKnbZm9tru5auWihS0=;
        b=ighBeew1ThzhzT+Dbg6xGqObhtlUAzI2B72xi+UygZez3mfXk/+QZFnt4IHyl5mib+
         sI6de+YlP9HuvKsWN4sSOwEfJoBG5hyEZbIoa+nozoo6QGHvJh1twrPs/c69BFckbbvX
         GaPi/NHiLsBzAwdsRccAeRC90UHcU2TTAjGdTPJjq7AcTxujRNX9sOUtIHWn0jtcFS0F
         D8x59lRAV8h7jSGLzyCz6hRSOARkPRSKy7DKEDoD61cKvdgHisvhmt+o9oedyEr7VBng
         Ii3P6407nTv68ZZ0wpy92vsVo/lcPk9JbuIhWQ0DDWOrlcCzM7IXjY4CAH5nsZzRUaKe
         mjDw==
X-Forwarded-Encrypted: i=1; AKwUvBwO4UpFi5duVJIv0Y6e5PyVOHWU77wkfCRNzeTECZyVU+0v7YHrKeGQXNqn5m4o5clcMejXMy0MLazneI8=@vger.kernel.org
X-Gm-Message-State: AFuF++mCmmVgn7xfAPeL9rG6SGNYEo7d66dK2DDh9Z6QBVf5YT7I22PE
	LabnM/9RAtJTq8+4gkeg6P4bsqkAH+X1/oMiGeqrYJrceQXnuHMy1PYDiNI+iCu4xLM=
X-Gm-Gg: AYBFou0fzwVou8EiTkLKUj3NARDoxghtu9hfCSOUSHEWZsedbkoBSXhhhP03JAWGxb/
	R07+U3pbnGjBLZHYagh9H35G0C2qh18gKsxf9WePkcNvjkDdo0icrvfvLvKHiX3/K1pu4S3YCQK
	Kv90aRdzs4KiTxIY/eHA/uCm8a8cirsJVlYwRTA3S7ljWlk/aub+BowuPxv/skqikjGoNaN7NZX
	cBpER54cviUSBbb0qAnLz/mvjTn1jwBWt0+iE+ugRV1nl/NwpX5MB8Ep/PYSptVdkyF/KfTjTRg
	MfoCvZ/TY/gTHtLj71EaQ1kJbzLcUtA9thrYHp4wMbALIMCkEW6htt6cbIdlBIMndT1bE5tKm9T
	Q6PfixN3pdHNQ8Fn/5pqoFMLD8Ttng0hsp5x1PgcjOssj1TvlU2cpmkR3Lyyc36ms8YCEM/+/Yi
	P5140gIvLrB2tZP0dcodwi4kx4VcXZMdhti+F+hrM=
X-Received: by 2002:a05:600c:314f:b0:49c:ffde:45ff with SMTP id 5b1f17b1804b1-49cffde4629mr130539685e9.17.1788716751586;
        Sun, 06 Sep 2026 10:45:51 -0700 (PDT)
Received: from remote-01 ([84.17.55.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf755c22esm245418805e9.0.2026.09.06.10.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 10:45:51 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: andrew@lunn.ch,
	andrew+netdev@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ericwouds@gmail.com,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH net-next 2/7] net: phy: add mdiodev_lock(), mdiodev_lock_nested() and mdiodev_unlock()
Date: Sun,  6 Sep 2026 17:45:38 +0000
Message-ID: <20260906174548.4106801-2-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788711797.git.f@lex.la>
References: <cover.1788711797.git.f@lex.la>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Code that holds the MDIO bus across a burst of transactions has
phy_lock_mdio_bus(), which needs a phy_device. A library serving a chip
before its phy_device exists has to open-code the same mutex.

Add the mdio_device spelling beside it. The nested form is for a
library whose caller already holds the bus one level up, which is what
the EN8811H MDIO driver later in this series does.

Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
 include/linux/phy.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/linux/phy.h b/include/linux/phy.h
index 3d8afe6b7f1c..e74a8f5cf5c6 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -2284,6 +2284,22 @@ static inline void phy_unlock_mdio_bus(struct phy_device *phydev)
 	mutex_unlock(&phydev->mdio.bus->mdio_lock);
 }
 
+static inline void mdiodev_lock(struct mdio_device *mdiodev)
+{
+	mutex_lock(&mdiodev->bus->mdio_lock);
+}
+
+/* For a bus reached through another one, as mdiobus_read_nested() is. */
+static inline void mdiodev_lock_nested(struct mdio_device *mdiodev)
+{
+	mutex_lock_nested(&mdiodev->bus->mdio_lock, MDIO_MUTEX_NESTED);
+}
+
+static inline void mdiodev_unlock(struct mdio_device *mdiodev)
+{
+	mutex_unlock(&mdiodev->bus->mdio_lock);
+}
+
 void phy_attached_print(struct phy_device *phydev, const char *fmt, ...)
 	__printf(2, 3);
 char *phy_attached_info_irq(struct phy_device *phydev)
-- 
2.53.0

