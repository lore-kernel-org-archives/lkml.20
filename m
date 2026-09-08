Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0CE379ED7
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 05:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788845253; cv=none; b=sSFv5Mwnf9S4by4Ye5nSrMtvr4qQcnME0aM7hPCHnA6vIKf03wvfJo5qhwXijzmx1gLAu2cl/cDRP34FVa1xg4ng32WQ6B4Om0GGPWlZ+j7rpdUGkjWM5Q0C7aNTedMzCQtXIVLCcud1SlCwtytpQzjN6dVz777QiZkggMFbPao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788845253; c=relaxed/simple;
	bh=fjyYAKrA9xZ3oFHLIxjUPnbIcj2DikHpK634Qm6CIMw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lFsBRfBZ9cBXkcEvmwKkDmFQiRkfYpYL7NjZaJaVCeqSnLv6AlL8aXJfqzw+wzE/fUWMri88wKN2/MZLsFvhDK2eRx4XptIS4AYo1WliYpsm0Ml2R10N1AoICP8pQYElnPeDC2eGMqYCIslPj7lp2hPVqyySB5KIKnPJKI+YDWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZAPxwCQ7; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZAPxwCQ7"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-ca7c1176317so3386604a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 22:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788845250; x=1789450050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qMXY7RVPMRlOGVUE1GxTzGvnZE4FGesxKUeRlJf9LaQ=;
        b=ZAPxwCQ7dy1j2j5YzaKqu8G8ne/0AC5OUjagEGvTs505gPC/512dH+ugOz4sC4KxH5
         8gD8J1Aqwt2cZ2tuVzKwlCenN6NWdHbX5Yv2c17Kjb1miPQ16boIzwGRro0ixe6l7ge4
         eVrDMfMrIVKjzOkW8p2dK84C6StKzXgjI7EY5Ge3OKQsNQoApOjakWFeMLQp8ovDChxe
         i6abU+Ri7+UkufdsPocMyFSJGvL4OotdDL9S2rkcBqTvX3VYwXMY6Yy/2DrMGKPZ11cC
         I77muEnDBl/U7QFLWBgDRe5WfVREgHNi9rbXmrvkMeMnSuA3YL5dHOOZ4zYk6BOw+zad
         i7Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788845250; x=1789450050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qMXY7RVPMRlOGVUE1GxTzGvnZE4FGesxKUeRlJf9LaQ=;
        b=WaGrErrZIgy1+PeXW4amLo6vJ0MFYS+3FVwXbQAclsryycZDf/EOIF8J8kicf9qGhH
         0L06+oTON5L64OtCfmHezQfLA6DpYjV0a3g5/ZkW9SQrHiSrW9B+61u7mwmHiAoSKFav
         antZeUk++9pBMUhG3RwoEAFJGuO77arpsejjowx/ctsnfI+oiTLIyRQRpvLvY53zFaRF
         7iyeKcj79Ylxz4N4jL5L/x7eYiLTYlx7cZKEqFKHIc9/8+Gx9q/nywL5DmybHkPGP31q
         KtQLu0WZDyDUo2rdo4CcfOwYBwy8GuLR0yn46IXcFvsnypw64dV/WGZrohUVbB7pBeIH
         n4Zg==
X-Forwarded-Encrypted: i=1; AKwUvBwkcctyg/CWp1salVtMIp5ldbu5AALetWElw7locgMAJQDuBmoWCBm9vA/FZah6fyPdV7gkiKSTDNIaKOw=@vger.kernel.org
X-Gm-Message-State: AFuF++kUXSe3DnTkZ5vC4WoqSLm7VTHdUvTBn0Elz2I4OjM5NR3Hw/U2
	bQ7MTZzNZyJqP9KzfbT+SlCL2L+SgvCJ1p/TlbvfFZdh22HYZ6jKLuOv
X-Gm-Gg: AYBFou0xoH/x+XuNKb2MfUEaCv4FCAX/NWD31VBnHm40d4sytAKZcd3fh3HgBsRWfrV
	UmM4ppzRLbCUzq7uirlNSKcwcMWKXB3izknrsGExHfR9slIyLl6JWlND7+CYxB/ReejSs/GloFS
	NKUrU0XmybpJIvsau3wPYTulWFViXOTcUnCs0lfuDccqOr3E5PJiLm9+pu4cONOGOtgi1zoNdXG
	1ELhVgBvnpL1a6Mp5MKvKnkYFUYpeVPGFbmP8T11Gt8Ahmk8WX6uLeYv9IN2R79TCDOBPRLBW6H
	REwed++69lIzmun66gCslVRjaXD2lusptmtOYH7YoT0h+RmfnjvCZfJZWFpt6jWXr1QawHr1Xgm
	wVM+smE4xHjkUCJs/DHe+YEoNIJ12GleFtUZY2TZZHCQBKoXFJONq20HE+3VRahvEFH3q6LjWNO
	cQE+1Rs9I01dOJEbto6Q1etS21nGmyZZ+0fxm4QqBzaJIHtVHtoBBo5z/xMuPH6bZwtTP22gnkB
	i/X4QxCqH0Osg==
X-Received: by 2002:a17:90a:d44b:b0:396:4cbf:45bc with SMTP id 98e67ed59e1d1-39b26203f11mr43064219a91.16.1788845250288;
        Mon, 07 Sep 2026 22:27:30 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14340a69666sm11720586c88.9.2026.09.07.22.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 22:27:29 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Chris Snook <chris.snook@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	GR-Linux-NIC-Dev@marvell.com,
	Geetha sowjanya <gakula@marvell.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jian Shen <shenjian15@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	Manish Chopra <manishc@marvell.com>,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Rahul Verma <rahulv@marvell.com>,
	Ratheesh Kannoth <rkannoth@marvell.com>,
	Russell King <linux@armlinux.org.uk>,
	Shahed Shaikh <shshaikh@marvell.com>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	Sudarsana Kalluru <skalluru@marvell.com>,
	Sunil Goutham <sgoutham@marvell.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v3 09/10] net: atheros: fix typos in comments
Date: Tue,  8 Sep 2026 10:56:01 +0530
Message-ID: <20260908052602.27497-10-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260908052602.27497-1-hemanth.selam@gmail.com>
References: <20260908052602.27497-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix misspellings in comments, found with scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Comments only, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/net/ethernet/atheros/atl1c/atl1c_hw.h   | 2 +-
 drivers/net/ethernet/atheros/atl1e/atl1e.h      | 2 +-
 drivers/net/ethernet/atheros/atl1e/atl1e_hw.c   | 2 +-
 drivers/net/ethernet/atheros/atl1e/atl1e_main.c | 2 +-
 drivers/net/ethernet/atheros/atlx/atl1.c        | 2 +-
 drivers/net/ethernet/atheros/atlx/atl2.c        | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/atheros/atl1c/atl1c_hw.h b/drivers/net/ethernet/atheros/atl1c/atl1c_hw.h
index c567c920628f..8f03bb561d44 100644
--- a/drivers/net/ethernet/atheros/atl1c/atl1c_hw.h
+++ b/drivers/net/ethernet/atheros/atl1c/atl1c_hw.h
@@ -659,7 +659,7 @@ void atl1c_post_phy_linkchg(struct atl1c_hw *hw, u16 link_speed);
 /* INT-triggle/SMB Control Register */
 #define REG_SMB_STAT_TIMER		0x15C4	/* 2us resolution */
 #define SMB_STAT_TIMER_MASK		0xFFFFFF
-#define REG_TINT_TPD_THRESH             0x15C8 /* tpd th to trig intrrupt */
+#define REG_TINT_TPD_THRESH             0x15C8 /* tpd th to trig interrupt */
 
 /* Mail box */
 #define MB_RFDX_PROD_IDX_MASK		0xFFFF
diff --git a/drivers/net/ethernet/atheros/atl1e/atl1e.h b/drivers/net/ethernet/atheros/atl1e/atl1e.h
index 9fcad783c939..6b0066f47e9e 100644
--- a/drivers/net/ethernet/atheros/atl1e/atl1e.h
+++ b/drivers/net/ethernet/atheros/atl1e/atl1e.h
@@ -381,7 +381,7 @@ struct atl1e_rx_page {
 	u8		*addr;   /* receive rage virtual address */
 	dma_addr_t	write_offset_dma;  /* the DMA address which contain the
 					      receive data offset in the page */
-	u32		*write_offset_addr; /* the virtaul address which contain
+	u32		*write_offset_addr; /* the virtual address which contain
 					     the receive data offset in the page */
 	u32		read_offset;       /* the offset where we have read */
 };
diff --git a/drivers/net/ethernet/atheros/atl1e/atl1e_hw.c b/drivers/net/ethernet/atheros/atl1e/atl1e_hw.c
index fa89bc27f62d..25d3e7469058 100644
--- a/drivers/net/ethernet/atheros/atl1e/atl1e_hw.c
+++ b/drivers/net/ethernet/atheros/atl1e/atl1e_hw.c
@@ -369,7 +369,7 @@ static int atl1e_phy_setup_autoneg_adv(struct atl1e_hw *hw)
  *
  * hw - Struct containing variables accessed by shared code
  *
- * Sets bit 15 and 12 of the MII control regiser (for F001 bug)
+ * Sets bit 15 and 12 of the MII control register (for F001 bug)
  */
 int atl1e_phy_commit(struct atl1e_hw *hw)
 {
diff --git a/drivers/net/ethernet/atheros/atl1e/atl1e_main.c b/drivers/net/ethernet/atheros/atl1e/atl1e_main.c
index 40290028580b..cc6c262868a5 100644
--- a/drivers/net/ethernet/atheros/atl1e/atl1e_main.c
+++ b/drivers/net/ethernet/atheros/atl1e/atl1e_main.c
@@ -2117,7 +2117,7 @@ static int atl1e_suspend(struct pci_dev *pdev, pm_message_t state)
 			wol_ctrl_data |= WOL_MAGIC_EN | WOL_MAGIC_PME_EN;
 
 		if (wufc & AT_WUFC_LNKC) {
-		/* if orignal link status is link, just wait for retrive link */
+		/* if original link status is link, just wait for retrieve link */
 			if (mii_bmsr_data & BMSR_LSTATUS) {
 				for (i = 0; i < AT_SUSPEND_LINK_TIMEOUT; i++) {
 					msleep(100);
diff --git a/drivers/net/ethernet/atheros/atlx/atl1.c b/drivers/net/ethernet/atheros/atlx/atl1.c
index 98a4d089270e..179d74e93efd 100644
--- a/drivers/net/ethernet/atheros/atlx/atl1.c
+++ b/drivers/net/ethernet/atheros/atlx/atl1.c
@@ -628,7 +628,7 @@ static s32 atl1_phy_leave_power_saving(struct atl1_hw *hw)
  * Resets the PHY and make all config validate
  * hw - Struct containing variables accessed by shared code
  *
- * Sets bit 15 and 12 of the MII Control regiser (for F001 bug)
+ * Sets bit 15 and 12 of the MII Control register (for F001 bug)
  */
 static s32 atl1_phy_reset(struct atl1_hw *hw)
 {
diff --git a/drivers/net/ethernet/atheros/atlx/atl2.c b/drivers/net/ethernet/atheros/atlx/atl2.c
index 5560d5cc3169..c9aca219ec9c 100644
--- a/drivers/net/ethernet/atheros/atlx/atl2.c
+++ b/drivers/net/ethernet/atheros/atlx/atl2.c
@@ -2591,7 +2591,7 @@ static s32 atl2_phy_setup_autoneg_adv(struct atl2_hw *hw)
  *
  * hw - Struct containing variables accessed by shared code
  *
- * Sets bit 15 and 12 of the MII Control regiser (for F001 bug)
+ * Sets bit 15 and 12 of the MII Control register (for F001 bug)
  */
 static s32 atl2_phy_commit(struct atl2_hw *hw)
 {
-- 
2.48.1

