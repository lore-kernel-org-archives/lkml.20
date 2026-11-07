Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794063999;
	b=owyXfQvTeR/bBfgX/OBjwzysXC9+VixkUdRLZydNGo9ZHKDwvOGQ1XgjGhfCdBvTCr5l
	 UtTGejeExHll5swDJDRvU0NZSPd0/Vg17/8VnENLzCEybNi+7aCzu71LMX2c+Jw+Plyd9
	 gK92tivVrBvUDUkHlvFB0pwmrD2/+aYX2/V4EBOzhvc+iZCqpR/YLsdC5342DXLfHhVZh
	 xXW2GJp0WV1QeZkvpFnQmL5FGImp9h6Qi//fEcd7aCcfPsBVBEXfiZqnS4gu8B7Twuthc
	 ZslI/I3epazvk3ZBUdcsZR5zaReo3bigIh2JlB2zo6+zuwXhkPfO8jKXJuqjK7jm/qA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794063999;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=cxr3dU8XiH5bi2u1dg6SGQxZyh/jEU0GS+krtHvgiEQ=;
	b=06VBJUnki/weQTa88VaBhrNPZOVb+tRoqn/9cDVQoWLWnTVDgKO02Sini0eDQegdanJf
	 Rctj1hY5IeF8TDenVNB5IUv8K5O40xyVfW//EUblsKUQwilodsbCYXE3TpfDX5g8FA20a
	 5/WLK3E+bvUEabsXyXCqgmvlKQ30YQ1c4cPWSMrkGgdSJfiEmlGjRXPJddzAfNWyux3fd
	 n/OCmnEarWNuqDSeksXo3wIubSbairQWah1gyYDjYRBHlZWejQ1oY+CrJrFAYHEL7HlWL
	 qDbhVJ0RzZBNR/j92GKEha2aNWNBn801Y+77Cse037MlRbB+Jv5FECMAQrfRSMCIJnA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RvGZrorQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5790960A2620;
	Sat,  7 Nov 2026 15:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RvGZrorQ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794063999;
	b=u1/fl+N4yU/DaxvVlUFDhjKrNjmEg+Do4FOuLih92TDXuS8yOZR09RLOm/OY5+FR2/cV
	 KVHwU5dxBPRCJh4MFNbIbgJ25SD0QeslH9GUNcSr5l+HQY3SrKHumRjkWicoG3x2Trub6
	 pSmkkMLLLs7OIQaygNenJph1MxhffrDGTLM4TxkJvaiQQyuqtRVoh8XGwaK/ur8daBkx6
	 f5asy0vhJPhFi1B0JdtxPc/AYn2PX2Qce4vYdTUm+s6CSLFZLnmS+h3Ct1aDIIu9lDJwH
	 BTP8g08647mNYFRHrQ5kE+mZQdHX8UybJldMW4MSAB+rk663Ajl5mOZOUncHJK8Shpg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794063999;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=cxr3dU8XiH5bi2u1dg6SGQxZyh/jEU0GS+krtHvgiEQ=;
	b=RXMYWNZVTXVUtFH5yDMjeN67a8D/xhftL7T0XWmYRnjrB/SbEfKOvyY8mMHDw46DaMMx
	 7rtZzwrr6tz6MLn6oSUs+7AXv2TdJljGSjWTFIU+EhTEfoopXlnoveOyKLDh2qbeufnMX
	 yT49R0nJ3Dz9Km1056Xjdps45TY3ICzA5Awgj3CeRId1iTtV8ZAKxOpbjg+tG30QyoE7K
	 zKS2VBIfB5VNipipAvWIeg9cfY397OLrOswUPHxYr8v+/1Cz1Xobm1Vk4vCs8mqtXcYf8
	 Or5pa5HprEKy/JAn2znJnQW1nKHMhzLnriA0G+9L74gf4WmaFZC5SL19yaCHRKMNmWw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A78A41F0089F;
	Sat,  7 Nov 2026 15:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794063999;
	bh=cxr3dU8XiH5bi2u1dg6SGQxZyh/jEU0GS+krtHvgiEQ=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=RvGZrorQy1WVyUVTlPZAHIGEym2mWW++qFiUu0oLDvkFSCKEi1gpBWlSXYxcFEwUS
	 Rvk1ycjAXHGuGpZazav9AhYrsfRXu59TXrJ1WhPNyHou+yakSACacFMype4Gmd0Sbv
	 FTRVolWLJ+DAGTyiCMXByKsvjCb52z3Wf3dKsFilplBXW3JGNcNuCO8FULCZDRqAoK
	 bLkVwe5/0ji3rLzb30BWJPcuYVL91cU4vGKFV4hB6bFmZ94U4GEfnN5ofWrgc0AJql
	 O293jDzuSKPz1C57MjVDwSi3N1vX+gYvAS2Y5FdIxnvi1dOIAqR57vjV22UuKYjfGO
	 UyhMFdbZVq7rQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 39D1F47C43;
	Sat,  7 Nov 2026 15:06:38 +0000 (UTC)
From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero_via_B4_Relay?= <devnull+aleszlucero.gmail.com@kernel.org>
Date: Sat, 07 Nov 2026 09:06:37 -0600
Subject: [PATCH] staging: octeon: fix OF node leak and kernel-doc in
 ethernet-mdio.c
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261107-octeon-mdio-fixes-v1-1-9620a30952eb@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3LQQqAIBBA0avIrBvQEo2uEi3EpppFGhoRiHdPW
 j4+v0CmxJRhEgUSPZw5hgbVCfCHCzshr83Qy94oJS1Gf1MMeK4cceOXMtpBj8poPThnoX1Xoj+
 0bV5q/QDGU87uYwAAAA==
X-Change-ID: 20261107-octeon-mdio-fixes-734816443aa7
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794063997; l=1411;
 i=aleszlucero@gmail.com; s=20261104; h=from:subject:message-id;
 bh=vNQzcWCw6v+GGPCU8kFndUmRbbBQdBJ6gMhfqAvp8Dc=;
 b=FC+6l190WVFl95b+7mKRrFwTrjPz9j+cS6JFhICFLvALpgRLRoLfkU2CmJZ11q6sFVRCFjUEj
 IktMsPrQelKBx6nMVvV9yTFTsTsqdH6t4Wrh3nN00qMNE+qMtbgmvSl
X-Developer-Key: i=aleszlucero@gmail.com; a=ed25519;
 pk=zRzEBMID7l1FXqr2CjfnlIn++3m3N05FuNYb5zPA3cw=
X-Endpoint-Received: by B4 Relay for aleszlucero@gmail.com/20261104 with
 auth_id=1410
X-Original-From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
Reply-To: aleszlucero@gmail.com
Content-Transfer-Encoding: 8bit

From: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>

Fix a reference count leak in cvm_oct_phy_setup_device() where the
device_node pointer 'phy_node' was not released if of_phy_connect()
returned NULL on a probe deferral scenario. Balance the reference count
by calling of_node_put() within the error path block.

Additionally, correct the documentation style of the function by
replacing 'Returns' with the standard 'Return:' keyword to comply with
kernel-doc scripting requirements.

Signed-off-by: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>
---
 drivers/staging/octeon/ethernet-mdio.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/octeon/ethernet-mdio.c b/drivers/staging/octeon/ethernet-mdio.c
index 211423059e30..05bc536ebded 100644
--- a/drivers/staging/octeon/ethernet-mdio.c
+++ b/drivers/staging/octeon/ethernet-mdio.c
@@ -151,11 +151,13 @@ int cvm_oct_phy_setup_device(struct net_device *dev)
 
 	phydev = of_phy_connect(dev, phy_node, cvm_oct_adjust_link, 0,
 				priv->phy_mode);
-	of_node_put(phy_node);
 
-	if (!phydev)
+	if (!phydev) {
+		of_node_put(phy_node);
 		return -EPROBE_DEFER;
+	}
 
+	of_node_put(phy_node);
 	priv->last_link = 0;
 	phy_start(phydev);
 

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261107-octeon-mdio-fixes-734816443aa7

Best regards,
-- 
Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>


