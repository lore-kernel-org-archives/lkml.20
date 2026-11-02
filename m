Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793654738;
	b=sTTxRDODI4QkfIHEGpAs5RpRA8thYyUY98BLplPWBYIfjf/GPfadIsigSZuzuGYufo2M
	 svu6MKKkTF3xMZvu9FaiXN9TzRJCE1kVU/wFk1OsUgDx7a3LrGfMTnIdGBZQDAUyq3sRP
	 aNh1IhmKG4pUScj026Q966CPGECSnRrzJfWMdyUIF2GAnRNSHkrkbiPb1X6jkorcg6aTJ
	 Ya6DiDs1qJmOtBST/AxWVmQZ8bWWQZTe1gXFlX7y0AR08jyYxaDzHo3mp0hAKU8PjmhfP
	 PasJ0Rf9PwfSty/9E8XWpdQWuxoK4F5shxclpfrYGGgKF+K04s7JdQQ9rVG3FVzWwWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793654738;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=f2iHlmQM8BVjrAqEqrTQxQY1XsehcxpHrx5clmyJcPs=;
	b=g3Xp0vwNrOnJoVTPj3s9dnrcI0xjZkTzL34ncjozVLuUZa0loKA1U6Jc/F9q+Z5VTAoL
	 dYEqa/F0Ff6/uRizO4yTJ7Bc1MeCJvGadZ0VTgS4z4h5WurDn4ctj3LtHa9NOu7uuPKfU
	 LPIuia7epxaBFgX75H9F38GZnCDJKysbT9CAvjKzBnmdIRHT7WVB3LiZy3AbaYK8gd8w4
	 nxG1TfTjEpnupSm6inhk5gAoRly7KjhflGg7lpP1xEVHwOACAn1P0fnIqX8MUJZVNbK9g
	 vLNzZtMfHveR7xzC5FtjK5h1MEaW6xIRyexGhSwmbt3PK12pcrOnRcFGmE+oQ1jMbfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="qbqvB/Gj";
	arc=none smtp.remote-ip=74.125.229.135
Received: from mail-dl2-f7.google.com (mail-dl2-f7.google.com [74.125.229.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E465606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 21:25:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E465606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qbqvB/Gj
Received: by mail-dl2-f7.google.com with SMTP id a92af1059eb24-1b2352df6b9so17954c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 13:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793654738; x=1794259538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f2iHlmQM8BVjrAqEqrTQxQY1XsehcxpHrx5clmyJcPs=;
        b=qbqvB/GjO3e7E1PaLP8+FLSHhuN3anEe3yzjwAOp9wNdlD7DFdJjo9b4fcJooPoSsf
         yuv5+uKOlAd1+wACJOj71CMJTFkB2O6ZFbHunBhL1P+1I/6bXATlwkSUFy6ScHozekuI
         F1nmhY6ve7z4VzQYevHyJyOFz7bwDuHCIEzzsxm25he9grCYuGCDx7w/WUmA2G3C7Jgi
         Oqt+3k9LU/+SN99KAgtNz+csds+tUA7Z2l9BRypViX5muWRBr3fjj4WtVE0IWdOq9CF5
         5duG/WnTtld87Xa2XvtNHz1vNhFCeMBhgTk+iTeh0Gx63v+4ElghLnfxdm13+cWPDJR5
         rtVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793654738; x=1794259538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f2iHlmQM8BVjrAqEqrTQxQY1XsehcxpHrx5clmyJcPs=;
        b=RHZQ6S4+2WDZjjR2qOmMQdtFEW+ErcvMbdtJiy1POs88NpC3Dh97moJkCvX6UlmbxG
         9kvcOrOV579lv56VC8jBxuVJCTBvj+lKCo/Mvgsm/LcGTqCnceUNMvT3O2NCf4BHdtgw
         NUvLcgDTnVc7EVg0Xvon5BotV35kcfDaDKnXVPY/6qkKnlyE4XofI3Fh3vDeyXAaTHHo
         GbJTKZN8bVJxS9VBW2UP1dqERth50LaH/rV9HOvok1YucESc+3X50Ix2nC39voWBuPH2
         VXz2uPZwfWYjDjaGjfK/tInTt3ggrYS9/iLWOYngIRLri2Hk+DTYnkU7kRhBD+Dgpd7v
         kTrA==
X-Forwarded-Encrypted: i=1; AKwUvBxouiR7sagIac2Zz2j1lxhXK1psAc0fUjkGJmkNP21/+CpG5JiYsU8VbBWOZCZ01ttAXJ8ny4N2TZ1pi4U=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/6Q49mcfOeYz8jcpV1icCMwbS1QNAgSrEBpGt+MB76wmdji2S
	UX4/nebkB3UMor/UAIuCQnkPdp8KEzJ5vOIckjOnYBDun0yoMzYPFK0n
X-Gm-Gg: AYBFou1KlCJ7fbzO4jwVUGTf5bHuNxQ4AxnV2aJV1Duv4GeqfHrzvOwo3D4/OQmkxYc
	rTJRVlsuApVUoD61tBRAIt4gyCJAoP/dfU/vjwrJFABUXEXgcXEbTHvte8C+EN6vJzvqmq41HJU
	oi7IeBHnIBZd0pIzcAA5N1ux7RM1qVU+v04qe1kMH+sg4leJswMYtArKk7xTMcWey6JhflMJq7w
	+9hwD8ZT470kLziBAtvc1WDAJ2Pa9soYL40LGgj63unXu52Cg3nllgN1My0GKleWQ4qNRDY76f6
	8O54dA58zU3Lh96yLQdQLQyaYDXZx56ehD6E4u3i3/ehVXa8Fo/FkRHjxCJg5VqCIIPe4xP51ub
	WXfmkxmLQAm67ozYQDTfVFylM9rYN3oGngdE5WytmgY/GXJlEVgD6nrzC8JWQlpqgPQkYEvM4n3
	cGBKuMRbWH38EZoV65q3A9gnxhpfSmqjCHGd94Tjs31415waz1x/w/ZKDSml970rOLyzMV3uwRk
	BVkerldh/eL59KCfxk5ZOGbwM/V439GGRRpQ79mCrBmN/L7YYZWfAdUEmoA8dXPJcWhCzN1AHTw
	hbfKgPheyQvPSYW5eozecbmaiFM=
X-Received: by 2002:a05:7022:b053:10b0:184:19ee:1fdd with SMTP id a92af1059eb24-1ac56302618mr17357629c88.5.1793654737507;
        Mon, 02 Nov 2026 13:25:37 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428fa380sm37195851eec.12.2026.11.02.13.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 13:25:37 -0800 (PST)
From: Coia Prant <coiaprant@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Jiawen Wu <jiawenwu@trustnetic.com>,
	Mengyuan Lou <mengyuanlou@net-swift.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Heiko Stuebner <heiko@sntech.de>,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Fabio Baltieri <fabio.baltieri@gmail.com>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH net v3 1/2] net: phy: move DECLARE_PHY_INTERFACE_MASK_ZERO to core
Date: Tue,  3 Nov 2026 05:25:06 +0800
Message-ID: <20261102212506.3348537-3-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102212506.3348537-1-coiaprant@gmail.com>
References: <20261102212506.3348537-1-coiaprant@gmail.com>
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

The txgbe driver currently defines DECLARE_PHY_INTERFACE_MASK_ZERO()
locally, but incorrectly uses PHY_INTERFACE_MODE_MAX as the array
length instead of BITS_TO_LONGS().

Move the macro to include/linux/phy.h and use
DECLARE_PHY_INTERFACE_MASK() to properly size the bitmap, while still
zeroing the stack variable.

Fixes: 47f848aac4e7 ("net: txgbe: initialize PHY interface to 0")
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 drivers/net/ethernet/wangxun/txgbe/txgbe_type.h | 3 ---
 include/linux/phy.h                             | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/wangxun/txgbe/txgbe_type.h b/drivers/net/ethernet/wangxun/txgbe/txgbe_type.h
index 757d1ce8d3ad..8071464c7b90 100644
--- a/drivers/net/ethernet/wangxun/txgbe/txgbe_type.h
+++ b/drivers/net/ethernet/wangxun/txgbe/txgbe_type.h
@@ -315,9 +315,6 @@ void txgbe_up(struct wx *wx);
 int txgbe_setup_tc(struct net_device *dev, u8 tc);
 void txgbe_do_reset(struct net_device *netdev, bool reinit);
 
-#define DECLARE_PHY_INTERFACE_MASK_ZERO(name) \
-	unsigned long name[PHY_INTERFACE_MODE_MAX] = { 0, }
-
 #define TXGBE_LINK_SPEED_UNKNOWN        0
 #define TXGBE_LINK_SPEED_10GB_FULL      4
 #define TXGBE_LINK_SPEED_25GB_FULL      0x10
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 21afc2082b17..43aba23109fa 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -159,6 +159,9 @@ typedef enum {
 #define DECLARE_PHY_INTERFACE_MASK(name) \
 	DECLARE_BITMAP(name, PHY_INTERFACE_MODE_MAX)
 
+#define DECLARE_PHY_INTERFACE_MASK_ZERO(name) \
+	DECLARE_PHY_INTERFACE_MASK(name) = { 0, }
+
 static inline void phy_interface_zero(unsigned long *intf)
 {
 	bitmap_zero(intf, PHY_INTERFACE_MODE_MAX);
-- 
2.47.3

