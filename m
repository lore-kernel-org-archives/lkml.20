Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.204.34.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794798687;
	b=vGXHwEICRmKGdAc2mviNFc34wdK87BdMLrIwRVCzs/hnGoUNeVvE7AhWJAMmxmqNmyxI
	 zfdD4oeHpXNk89mU9dj8POM//otQcdOpPmxB7fIqVRk3K7Sesb6O5vBw6PUVGSW14qzjS
	 ZtoIzz2SaJ9MN6is51Dzt2uAPRLxh8HwURxiiKaAQLEFVdNUjIbdYoz23H0sZIFBjJq/K
	 o46EbY7GCO2Wt5nOEGviMPtyHDmMqjQPGg9eDPAjn68u134/SBxIPjA3rnWwNdR99llfg
	 co3dEvn5Ak8Wa3GUP83zjlMARHQOWfY5gdhvSlYkyY5wNfZ1vpqk6dMKtCuAmKywrew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794798687;
	h=DMARC-Filter:X-QQ-mid:X-QQ-Originating-IP:Received:X-QQ-SSF:
	 X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=0vftWO9y6nujweuU6DpPbBswmmYn3Vy5aOPS9dh2DmI=;
	b=GKJ+9JTT/OnjcuzkvP1Q1AMYqCWCEXQvaiyK1CgPHiNUTUle2+4pyet18edGniRhQLDx
	 9GdbWAWaucKSjXIaXNTkadyxyv8sNnk03C0gg7tJ5OjWfNt84KJr/W+dU2qt4RvCzvvWD
	 nHvSuhyy5n1KJScG2MA3HXOYoY4SxyrvAkLYftgGGjesKnD83n2PfAnaol9FuDRZcZasp
	 ofcL5s4FKyh/waQu3EmrVW+SOzxYXm8AaSZJD18wVxhWPWIJKguM4zoNvkDbjrKw43Jiq
	 629AXZ/mmknS5dZHH5OS6mQVTFpcNkPiCC/UMsWKZkxxh/hLFkwciaGRMVbQ0Z7W5Jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mucse.com;
	spf=pass smtp.mailfrom=mucse.com;
	arc=none smtp.remote-ip=54.204.34.129
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9314F606A31F;
	Mon, 16 Nov 2026 03:11:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9314F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mucse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mucse.com
X-QQ-mid: esmtpgz10t1794798636tbbd9b811
X-QQ-Originating-IP: OK7bhT7Ynr0SCpLbwJ89rqUHeqFoVm6+LBM2gCLtJyI=
Received: from nic-Precision-5820-Tower.tail7b ( [203.174.112.180])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 16 Nov 2026 11:10:33 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11794291809042175213
EX-QQ-RecipientCnt: 10
From: Dong Yibo <dong100@mucse.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org
Cc: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	dong100@mucse.com,
	yaojun@mucse.com
Subject: [PATCH net-next v2 3/5] net: rnpgbe: Support copper link configuration
Date: Mon, 16 Nov 2026 11:10:32 +0800
Message-ID: <E783BBD6D9CACAEF+20261116031032.1330270-1-dong100@mucse.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <BD205A7832D36E7D+20261116030917.1329989-1-dong100@mucse.com>
References: <BD205A7832D36E7D+20261116030917.1329989-1-dong100@mucse.com>
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
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:mucse.com:qybglogicsvrgz:qybglogicsvrgz3a-1
X-QQ-XMAILINFO: NHGFjaVOIMm2bcfGA6TmO0HJldrs0TO/EmEZ+D8MXE8LNIl17vOSbq4U
	3XSnW0I6rFDVATzAOP7/RjdgKrqSvCs1lo7BmD/6kWZDcf6fG5yWMehtMY7X0p9Yq78hcJz
	fr7OXgZOJHwf2JQ2ATx6SxUH51fxJykM5g06Ar3khN7CUrhDtmUx9FdRAGEdcoUYGyxu6z7
	DFws9PJC46z0tK6jiBuKmykUK29loILh616VmVbGyTSceW/gu9KZx4o6JWW34OVmQazmm8Q
	vAZxK3l7lkM9rXHx3nXINRAn+CmOeDDupf5EJ6vx1eETKc5hBjWBRxoVHE01eptLie+QGOy
	RNxkS2yfgg22EApLtVY/AGYEms0IQCW1GBp/unM0hbJLCMGKUa61spc0VLW0UqTAS/RtkS+
	zh/6E+Vtp2qy3FVVXH3ZBy7UE21IaxEGq1sjf3lsPs1vOWn1dIXNMOlUAD5ijq8oXHSV2fQ
	fJZzaojcM5aHLF9Rq/EWUklzGLBgWKmMIU5PGkNHQdIlazLvhaQZDLXUtMw3thz1on5ihi6
	TCZ1A8WeFk8yFmKx1E6EWld4wSHGiv4bNq0NCBMaAsfcsVdaN/GTZWnu4ak9D3wPbzk/kZH
	xidsU79UwiROH1mqQ6DmzJUFetXmZjGGFwnkaBvAFX/KDDTaBl7fhijPyOMmBrw0EyKclgF
	hxCf7B88/LRtqyaltleHJypPTzfpXSw08XpgwFTODjuX/hK8RLuOM4TqkIBhtcyh/sPPz0Y
	vZ5ybxNG2lBA97rkb5lo8MSHLu9Ar4io5lyy50uyXWQ/OkB8fKwF3bGOUaPE4TR6Z/6nsUs
	4N5hpRJCEoe4rbkITm5jgkPM2s0GXjVZ80ROmdOUigPBwr1mSpM7m7lCLFPVguxkLctD7VW
	kTcdPolZxGNSbiUw78KM7KLdfoWLoKY9vio1IdlvNV307vT+Il2Ielu1DkZHdDaScDhtPMl
	co623SxyvePIchpmqqgGMKqS6gGCQL0iIKkEpqqnBfQP0IrKfKvcpadhzgJjG08/kZYYAYK
	83aZ5pCXwL6bF3ichEtadbT/YTnML9k8+LlhVEkllYXMc0lwl+Pc8nSFfE+E1aUSq7zSi6B
	g==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

Add set_link_ksettings support for copper ports to configure
autonegotiation, advertised link modes, forced 10/100 Mb/s speed and
duplex, and automatic or manual MDI/MDI-X selection.

Firmware reports each port's fixed media type (copper, fibre or
backplane) through GET_LANE_STATUS. The host cannot change this media
type, so requests to change the reported port type are rejected.

Use the event-coalescing mailbox transport for PHY_LINK_SET because
runtime configuration can overlap firmware link events in the shared
mailbox. Acknowledge a pending event without updating its snapshot so
firmware can report the link state again after the command.

Signed-off-by: Dong Yibo <dong100@mucse.com>
---
 .../ethernet/mucse/rnpgbe/rnpgbe_ethtool.c    | 107 ++++++++++++++++++
 .../net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c |   5 +-
 2 files changed, 110 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_ethtool.c b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_ethtool.c
index 0afeda19f4ea..d856b970e5a5 100644
--- a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_ethtool.c
+++ b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_ethtool.c
@@ -125,6 +125,112 @@ static int rnpgbe_get_link_ksettings(struct net_device *netdev,
 	return 0;
 }
 
+static u32 rnpgbe_fw_link_modes(const unsigned long *modes)
+{
+	u32 fw_modes = 0;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(rnpgbe_tp_modes); i++) {
+		if (linkmode_test_bit(rnpgbe_tp_modes[i].ethtool_mode, modes))
+			fw_modes |= rnpgbe_tp_modes[i].fw_mode;
+	}
+
+	return fw_modes;
+}
+
+static int rnpgbe_set_link_ksettings(struct net_device *netdev,
+				     const struct ethtool_link_ksettings *cmd)
+{
+	__ETHTOOL_DECLARE_LINK_MODE_MASK(supported_modes);
+	struct mucse *mucse = netdev_priv(netdev);
+	u8 mdix = cmd->base.eth_tp_mdix_ctrl;
+	u32 advertising, mode, supported;
+	u8 phy_addr = 0, port = PORT_TP;
+	bool autoneg;
+	u16 status;
+	int err;
+
+	status = mucse->hw.link_config.status;
+	if (status & MUCSE_LINK_TP)
+		phy_addr = mucse->hw.link_config.phy_addr;
+	else if (status & MUCSE_LINK_BACKPLANE)
+		port = PORT_NONE;
+	else
+		port = PORT_FIBRE;
+	if (cmd->base.port != port || cmd->base.phy_address != phy_addr)
+		return -EINVAL;
+
+	if (cmd->base.autoneg != AUTONEG_ENABLE &&
+	    cmd->base.autoneg != AUTONEG_DISABLE)
+		return -EINVAL;
+	autoneg = cmd->base.autoneg == AUTONEG_ENABLE;
+	if (!(status & MUCSE_LINK_TP)) {
+		if (autoneg ||
+		    cmd->base.speed != mucse->hw.link_config.speed ||
+		    cmd->base.duplex != mucse->hw.link_config.duplex ||
+		    !linkmode_empty(cmd->link_modes.advertising))
+			return -EINVAL;
+		if (mdix)
+			return -EOPNOTSUPP;
+		return 0;
+	}
+
+	if (!mdix)
+		mdix = mucse->hw.mdix_ctrl;
+	if (mdix != ETH_TP_MDI && mdix != ETH_TP_MDI_X &&
+	    mdix != ETH_TP_MDI_AUTO)
+		return -EINVAL;
+
+	supported = mucse->hw.link_config.supported;
+	linkmode_zero(supported_modes);
+	rnpgbe_link_modes(supported_modes, supported);
+	linkmode_set_bit(ETHTOOL_LINK_MODE_TP_BIT, supported_modes);
+	linkmode_set_bit(ETHTOOL_LINK_MODE_Autoneg_BIT, supported_modes);
+	if (!linkmode_subset(cmd->link_modes.advertising, supported_modes))
+		return -EINVAL;
+	advertising = rnpgbe_fw_link_modes(cmd->link_modes.advertising);
+	if (autoneg) {
+		if (!advertising)
+			return -EINVAL;
+	} else {
+		if (cmd->base.duplex != DUPLEX_FULL &&
+		    cmd->base.duplex != DUPLEX_HALF)
+			return -EINVAL;
+		switch (cmd->base.speed) {
+		case SPEED_10:
+			mode = cmd->base.duplex == DUPLEX_FULL ?
+				RNPGBE_FW_ADV_10_FULL : RNPGBE_FW_ADV_10_HALF;
+			break;
+		case SPEED_100:
+			mode = cmd->base.duplex == DUPLEX_FULL ?
+				RNPGBE_FW_ADV_100_FULL : RNPGBE_FW_ADV_100_HALF;
+			break;
+		default:
+			return -EINVAL;
+		}
+		if (!(supported & mode))
+			return -EINVAL;
+	}
+
+	err = mucse_mbx_set_link(&mucse->hw, advertising, autoneg,
+				 autoneg ? 0 : cmd->base.speed,
+				 autoneg ? 0 : cmd->base.duplex, mdix);
+	if (!err) {
+		mucse->hw.mdix_ctrl = mdix;
+		mucse->hw.link_config.advertising = advertising;
+		mucse->hw.link_config.speed = autoneg ?
+			SPEED_UNKNOWN : cmd->base.speed;
+		mucse->hw.link_config.duplex = autoneg ?
+			DUPLEX_UNKNOWN : cmd->base.duplex;
+		if (autoneg)
+			mucse->hw.link_config.status |= MUCSE_LINK_AUTONEG;
+		else
+			mucse->hw.link_config.status &= ~MUCSE_LINK_AUTONEG;
+	}
+
+	return err;
+}
+
 static void rnpgbe_get_drvinfo(struct net_device *netdev,
 			       struct ethtool_drvinfo *info)
 {
@@ -142,4 +248,5 @@ const struct ethtool_ops rnpgbe_ethtool_ops = {
 	.get_drvinfo = rnpgbe_get_drvinfo,
 	.get_link = ethtool_op_get_link,
 	.get_link_ksettings = rnpgbe_get_link_ksettings,
+	.set_link_ksettings = rnpgbe_set_link_ksettings,
 };
diff --git a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c
index 469818b83d70..b6a12c673b2c 100644
--- a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c
+++ b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c
@@ -210,7 +210,8 @@ int mucse_mbx_get_macaddr(struct mucse_hw *hw, int pfvfnum,
  * @duplex: forced duplex mode when autonegotiation is disabled
  * @mdix_ctrl: MDI/MDI-X control mode
  *
- * Firmware ignores @speed, @duplex when @autoneg is true.
+ * Firmware ignores @speed and @duplex when @autoneg is true, and
+ * @advertising when @autoneg is false.
  *
  * Return: 0 on success, negative errno on failure
  **/
@@ -236,7 +237,7 @@ int mucse_mbx_set_link(struct mucse_hw *hw, u32 advertising, bool autoneg,
 
 	len = le16_to_cpu(req.r.datalen);
 	mutex_lock(&hw->mbx.lock);
-	err = mucse_write_and_wait_ack_mbx(hw, req.dwords, len);
+	err = mucse_write_mbx_coalesce_event(hw, req.dwords, len);
 	mutex_unlock(&hw->mbx.lock);
 
 	return err;
-- 
2.50.1

