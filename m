Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C2B40DB5F
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 20:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792354341; cv=none; b=BjEFt3eRbJKpBC+gp2ZOIx92TzErBrLo1IEu9NPRGUs5fMdr4Y26z7g3XL/PaFMCDyD4KTN6TUIa5OZHQbN2FW52wM5BcMgLc1qO+cdzxaYF8ykJuug7gWbgI9CFEWI1Yy+0fwKKy7PoaH3Dd9M4OoVNaV9GADgrmid85/XDwdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792354341; c=relaxed/simple;
	bh=ArCaIIdF3iMR3/shchrj0OcFScvKZbFAm11j0q5ixBU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JuYr6cR/yGkOgG2Dw2PNntH6McbfUXIznwbW+SGOid984I/jsSkBXbTNzCnJMHw3/uW1L23VCphEmXjqImNLaKJnHHH/2p2r2AIBcMswY9rA/bq3CE4uUGsstkeRcAN8OSRuPmPDjns/GK47m3LvveJxkZBMhWdMSjnjTMKB86U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a5M/Di5m; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a5M/Di5m"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35a31bb9fb6so3555235eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 13:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792354339; x=1792959139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9rxS8cu+8uQMWd8R4vCgJNNQUau1Y5Zq1kaWOXI5jNU=;
        b=a5M/Di5mNYjNOE8t47wwl+6MaYri3mg9saU90jG1Ei5Y/I3eHzo91sLSr7n8NPa2OZ
         kWmqukzrMd3n7n3Nei2HrXE0jS+UR5PWSP9EjBNH2qQQWHv/LgwCV0qnEgI113fPKgCr
         bewn9PUvzA0JzgefNuVqCod3Cdjd/XpuBNLhz9g8mZqwbAM0xJrqhCM+3XnPC7sbiY/N
         cORGcMFs1blm0/lOKCKm0oLbI/5JWi4CLPkWJECG88Qa9sSnuXbg3vNvoSgKxl/084on
         KEW5ZNNqTbbkvcE56KQGMOy9NqaJqtwv9FNu21DzvyH3lOSu24URGiK1NU/9a0+aP0bx
         XY6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792354339; x=1792959139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9rxS8cu+8uQMWd8R4vCgJNNQUau1Y5Zq1kaWOXI5jNU=;
        b=T1cdRsPRxmm+0BHwA/0sZ897HTHnvbFppV7KUy3DTo4hH/6rgJXq4bZSRZQsBak9zQ
         v8w5lLieteUlkc8JaJHRP/g5bZ02vQqY7IKqJSvMHa9SvY05tn0XMvETdQXi8Sa5Oobq
         PPRrQG+TMb4MY1N04DzQbV1RXx2Kv6R8dvZXPwQ9wDD9SuDEUqKK9nTTWMhX1u0SuC+Y
         GJR1D8eC09MCvEWm81Cp2mbiS4NPxJENU+C17oJ7VmnnlK+6pJBrChNQlZJcFfPZSL2m
         4yP4BYnRLZKKuKN/3PfITd94ZNBvCPc+WC+T92PqZXqOhqma37qPdUj8BgM7mP5D4sYD
         OsfQ==
X-Forwarded-Encrypted: i=1; AKwUvBwPEBCnd6uEL0wXKwTvYO9EuUknzk5K4e5hrVEDWd9gT6O21EdmwLJIaek7kwxWa4G4PZVDWQAbEcrJUaU=@vger.kernel.org
X-Gm-Message-State: AFq9FYK7NdZASt9mSMuVPFJCvjvyN4Z3KEIXbGX7DQT1TXKi2Wtqdacl
	bXAPdrN49syrUOZiMCOUQShPYnsQZLsPb75mvwLytcYds30ZoXWmoiMw
X-Gm-Gg: AYBFou32ods+d1p3zheqrzTPQdM4FKnT9qvEM/Z8cP887gr/sNGlwmCQCNZL3V5+J3q
	JWmrexeAj/Xuz6fUseuyUqi9Qbmq8QBh/SlaVSrAw74qizPV5mKMgLea7omzcMedgwRWHejNtMj
	nP8LWTXenm9VATQGzFVe2x/K7p0YyOQWIjyKIwN2GBt9JlXE9jZXkm/VuubBoknXDsab14Jwj69
	EOwlq5kjOc0eLGyWkInMip7evgzXf9I5sTzQP5mTr8FALvpCdrVrJ5KbI/X79hU1sEh/eQH2wR1
	O2R+WlUyURT3/aF8RhLXHNTMKkE6kcp459odGeU8rmSN4vFF5SRPABAXxN103ceOB9Mf7a8vWG6
	1I4Y/3+wNUAm1pfrfCUW8HCIcjcG3TRV4NyXlfLSPZ5BC0nz1zYTheigD3oEp8Xq413PkYnS26U
	DWk8McPUbG/ECl3Z7S5pD6pEeekaKsYczScGKedFxGgLVHxKqmfpcnwW1r+QU9zLCdwC7MtIG8m
	PT2om7VRY5x2cBqFn32we94RXqjXEyfo9GToi8wwVZqxG4H15UE+paCH6wHZUrBva+VMBrkNDQL
	Xh4NKKuiDU4cCvNLPmTwXwLuXr5tNR9I+ELPNSJtmOPaP7Hs
X-Received: by 2002:a05:7022:f512:b0:144:c127:dd1b with SMTP id a92af1059eb24-18514256b0dmr8231019c88.39.1792354338635;
        Sun, 18 Oct 2026 13:12:18 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-185aaea8b24sm16046825c88.19.2026.10.18.13.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 13:12:17 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: "John W. Linville" <linville@tuxdriver.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	b43-dev@lists.infradead.org (open list:B43 WIRELESS DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH wireless] wifi: b43: keep the HT-PHY TX power control enabled
Date: Sun, 18 Oct 2026 13:12:16 -0700
Message-ID: <20261018201216.51975-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

b43_phy_ht_tx_power_ctl() enables the TX power control by setting the
enable bits in TXPCTL_CMD_C1, then writes the saved TX power index of
each core to its command register. For core 1 that register is
TXPCTL_CMD_C1 itself, so the write clears the enable bits again, as
does the write of index 0x32 on 5 GHz. A TX power index is saved
whenever the control is turned off, which b43_phy_ht_op_init() does
before turning it back on, so the control ends up off and the TX gain
stays where the saved index left it.

Change only the index field of the command registers. With that, and
with the TX power estimates fixed, the hardware TX power control
(ht_txgain_idx=-1) keeps TXPCTL_CMD_C1 at 0xe019 as with wl, and a
BCM4331 holds its 2.4 GHz target power of 19 dBm from the SPROM: the
TX power control status registers report 19-20.3 dBm at gain indices
14-17.

Fixes: 60e8fb9233e1 ("b43: HT-PHY: implement controlling TX power control")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/wireless/broadcom/b43/phy_ht.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/broadcom/b43/phy_ht.c b/drivers/net/wireless/broadcom/b43/phy_ht.c
index fab8399c64f7..412e520bbcec 100644
--- a/drivers/net/wireless/broadcom/b43/phy_ht.c
+++ b/drivers/net/wireless/broadcom/b43/phy_ht.c
@@ -555,16 +555,23 @@ static void b43_phy_ht_tx_power_ctl(struct b43_wldev *dev, bool enable)
 	} else {
 		b43_phy_set(dev, B43_PHY_HT_TXPCTL_CMD_C1, en_bits);
 
+		/*
+		 * Only touch the index: the enable bits are in the same
+		 * register for core 1
+		 */
 		if (b43_current_band(dev->wl) == NL80211_BAND_5GHZ) {
 			for (i = 0; i < 3; i++)
-				b43_phy_write(dev, cmd_regs[i], 0x32);
+				b43_phy_maskset(dev, cmd_regs[i],
+						~B43_PHY_HT_TXPCTL_CMD_C1_INIT,
+						0x32);
 		}
 
 		for (i = 0; i < 3; i++)
 			if (phy_ht->tx_pwr_idx[i] <=
 			    B43_PHY_HT_TXPCTL_CMD_C1_INIT)
-				b43_phy_write(dev, cmd_regs[i],
-					      phy_ht->tx_pwr_idx[i]);
+				b43_phy_maskset(dev, cmd_regs[i],
+						~B43_PHY_HT_TXPCTL_CMD_C1_INIT,
+						phy_ht->tx_pwr_idx[i]);
 	}
 
 	phy_ht->tx_pwr_ctl = enable;
-- 
2.56.0

