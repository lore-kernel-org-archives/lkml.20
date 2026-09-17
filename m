Received: from mail-pl1-f226.google.com (mail-pl1-f226.google.com [209.85.214.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA9A44607E
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789627593; cv=none; b=CvU0YgRDdWDtc+gmJCQMna79U44SWGK7kNFAGVDoOTNC4xvRqL1O6jhY9HYwHoVejP/YXfU6KGMwIZFHUMzZwq9zrjuU7EKAsG0lktU4GItmzj4+48wOSk9RLGEwLy79Axa8qJgTZfVKfd1XxfMN3NASwiLaTiTmuLWnqSejJUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789627593; c=relaxed/simple;
	bh=hvAm2xCTSAU5DU9VIVyYXjPzrlTtE6P9ry4vlMuSLoA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UC2iRCURgToPdZxfsDme9i5dQOOTGGNY4tjh6iOtMIjDdx1GTXwsSXssrzYZNanoCdGXed9toYd8tDBAFWrF30y2jBHJ+fYgZxQ0c6TRnKsQHCFdheKcKf+F24QtGqNCv6D0+zAwvZiG30GmI3ubPSSwAm9wfLv8McQA6ul6SFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=GkX49k0k; arc=none smtp.client-ip=209.85.214.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="GkX49k0k"
Received: by mail-pl1-f226.google.com with SMTP id d9443c01a7336-2d9004f39d3so2962675ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:46:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789627591; x=1790232391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xFer9Ol8ZjeYgrAICccHcidcUPB9Yevz5/PbPEQUt3k=;
        b=U+SUnraiFF+umcNBVLZFCLpTgCS1woTZ0Hyh1YgbfxTlP4RLW42oVKPzuuPkZ972ln
         +ytjRSHD53bZzdaqNvN9tvjBHeVCJHJ85/Ql6Z5XosVyUcX7vFzlHUDpGglP56WT3waK
         2Xhf3t4kIK1Tq2F5pIhgULQyrlLdUDloJz8kASMU0H6CJ2v2iEfjmDfdQIxjrucS+ZBk
         1zucOnkmV5FKbgddlvkOsGluImVlSJQh0dOajdet1MqBUWtjeQN/GcN1bb+szOadJv0o
         fCg/fiHUnl3v39gO2adlMgdty6eiNQciC+JIGcr4FtX9MBMLX1+rt60xC7qogpLBVGnQ
         tZ0g==
X-Forwarded-Encrypted: i=1; AKwUvBxaa3jpRk2kEqZXQA4Un2JiVu2zYO3wAhJwMrrH+gbg9TVJBY3INtgVH+mm36syW/qOV8MIy7cAQ2Iwre0=@vger.kernel.org
X-Gm-Message-State: AFuF++m7wDynADPvL+eLSi3HziiJWFzNNX3e3yCKu709XwtkIOKDtVln
	+w7af1yQgGUnamAOakI6hMvJAsI0hoKwTfsIZF5VYlZzGM25KZ3ymsbfLhHrXWcjfWWvbqpk9dd
	pMKqlxeXwloeu68U/prhdM5aLkc06qaU2z3JRp7OvOszL2JultepIMU5NjuPCqmjBFJH3nCjbdj
	UX1JQg+FLBsM2cnjSAOHIMYfP5qK8tmsAIo/Nnl/LhNKB6E9P+hP+Bl1B6UDOYD7uNSGvV4t1/8
	jVzgLcEhM1jcn5vVQ==
X-Gm-Gg: AYBFou3xOu/2qdFiTbIOn8hhT8hnMS5KA/LHFhVTHpZlCNf1l+PWyogHkt7gbRowsSu
	6Xqst6JgooTBrFMr43S5KrPPqK/SBOVPG9BHnHfoLlenz3DpHwbfgDVz0vAhQ7Wd8OdjAvYl6zi
	mHHkesA8Dmu+dmOTdtJklFXE7CRonB9WXGcIJj/eGNA2hJT22XNiPHMcFaRIUf2WM8McAzCCoFb
	jzPV4ZEYFi+HSj6CkUOmN00FudSH8/OuRTQ/o8tUXxgvoTwm47CjRchIna3HXGANFT73uFnzFVr
	ciDoFJAE8fayZ8xIjP6eYtTXHn7uJ/RzUwjhqMrgJZr3myRlbqA+YDnP9WHDG8XXcmAsI3IIbIA
	Tm0KZZs4aWKtLrt5fftaopvTB/+AyIHHS1fSEVAe+Yz+Ps66x/UZm69guw28JJt0N+MD+1MMApT
	qhF0m0D4TYeHACyZABAhW0TbCkWQhnhN35zG+t
X-Received: by 2002:a05:6a21:32a9:b0:3dd:53e0:aabf with SMTP id adf61e73a8af0-3dd5f7a9b95mr12969770637.26.1789627590517;
        Wed, 16 Sep 2026 23:46:30 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-cc50ad1e189sm2268894a12.10.2026.09.16.23.46.29
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Sep 2026 23:46:30 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c89704da8c7so759221a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789627588; x=1790232388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xFer9Ol8ZjeYgrAICccHcidcUPB9Yevz5/PbPEQUt3k=;
        b=GkX49k0kl0nFDntvn4oChrTUO7TMxb8JKET5T8+bE9H0PUIpnsdgsBZmIUvyL3kN/5
         O1skNy2ihVMq4QsiMyDSY6WBGtB0ixp77B1gDu4BX2pV2mYMnXeBbo5K0Jd7vP7eHsSu
         gOzlcDgEB+OeZUyBcJ43I6yEGQnlnyZmPLcZQ=
X-Forwarded-Encrypted: i=1; AKwUvBz+Oa5oc3MX5hmvd125QFwKk/9rVTiA0+7LIYY84KJlZA8sCmlcgAM3EJU40W24Tjnp96Ko4+9EvPNOwBc=@vger.kernel.org
X-Received: by 2002:a05:6a20:cf83:b0:3db:3e1c:8585 with SMTP id adf61e73a8af0-3dd5f7ac3f9mr15507052637.27.1789627587994;
        Wed, 16 Sep 2026 23:46:27 -0700 (PDT)
X-Received: by 2002:a05:6a20:cf83:b0:3db:3e1c:8585 with SMTP id adf61e73a8af0-3dd5f7ac3f9mr15506968637.27.1789627587398;
        Wed, 16 Sep 2026 23:46:27 -0700 (PDT)
Received: from H5S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50ab960edsm2754293a12.20.2026.09.16.23.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 23:46:27 -0700 (PDT)
From: Vikas Gupta <vikas.gupta@broadcom.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bhargava.marreddy@broadcom.com,
	rahul-rg.gupta@broadcom.com,
	vsrama-krishna.nemani@broadcom.com,
	rajashekar.hudumula@broadcom.com,
	dharmender.garg@broadcom.com,
	ajit.khaparde@broadcom.com,
	Vikas Gupta <vikas.gupta@broadcom.com>
Subject: [net-next, v3 05/11] bnge: add RXFH ethtool support
Date: Thu, 17 Sep 2026 12:15:42 +0530
Message-ID: <20260917064548.773334-6-vikas.gupta@broadcom.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260917064548.773334-1-vikas.gupta@broadcom.com>
References: <20260917064548.773334-1-vikas.gupta@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Introduce ethtool RXFH operations including get/set_rxfh for
reading and programming the RSS hash key and indirection table.

Currently set_rxfh and set_rxfh_fields are supported only while the
device is down. A future patch series will rework
bnge_close_core()/bnge_open_core() so they can be driven safely
from the ethtool path, adding full functionality by applying the
configuration on a live device.

Signed-off-by: Vikas Gupta <vikas.gupta@broadcom.com>
Reviewed-by: Bhargava Chenna Marreddy <bhargava.marreddy@broadcom.com>
Reviewed-by: Dharmender Garg <dharmender.garg@broadcom.com>
---
 drivers/net/ethernet/broadcom/bnge/bnge.h     |   1 +
 .../net/ethernet/broadcom/bnge/bnge_ethtool.c | 276 ++++++++++++++++++
 .../ethernet/broadcom/bnge/bnge_hwrm_lib.c    |   2 +
 .../net/ethernet/broadcom/bnge/bnge_netdev.c  |  17 +-
 .../net/ethernet/broadcom/bnge/bnge_netdev.h  |   2 +
 .../net/ethernet/broadcom/bnge/bnge_vnic.h    |   1 +
 6 files changed, 297 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnge/bnge.h b/drivers/net/ethernet/broadcom/bnge/bnge.h
index fc2f45fa7712..f0b152e6a43a 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge.h
@@ -87,6 +87,7 @@ enum {
 	BNGE_RSS_CAP_AH_V6_RSS_CAP			= BIT(5),
 	BNGE_RSS_CAP_ESP_V4_RSS_CAP			= BIT(6),
 	BNGE_RSS_CAP_ESP_V6_RSS_CAP			= BIT(7),
+	BNGE_RSS_CAP_IPV6_FLOW_LABEL_RSS_CAP		= BIT(8),
 };
 
 #define BNGE_MAX_QUEUE		8
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_ethtool.c b/drivers/net/ethernet/broadcom/bnge/bnge_ethtool.c
index 2467e44de291..f1969de08534 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_ethtool.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_ethtool.c
@@ -10,6 +10,9 @@
 #include <linux/ethtool_netlink.h>
 
 #include "bnge.h"
+#include "bnge_netdev.h"
+#include "bnge_vnic.h"
+#include "bnge_resc.h"
 #include "bnge_ethtool.h"
 #include "bnge_hwrm_lib.h"
 
@@ -740,6 +743,267 @@ static int bnge_set_pauseparam(struct net_device *dev,
 	return rc;
 }
 
+static u64 bnge_get_ethtool_ipv4_rss(struct bnge_dev *bd)
+{
+	if (bd->rss_hash_cfg & VNIC_RSS_CFG_REQ_HASH_TYPE_IPV4)
+		return RXH_IP_SRC | RXH_IP_DST;
+	return 0;
+}
+
+static u64 bnge_get_ethtool_ipv6_rss(struct bnge_dev *bd)
+{
+	if (bd->rss_hash_cfg & VNIC_RSS_CFG_REQ_HASH_TYPE_IPV6)
+		return RXH_IP_SRC | RXH_IP_DST;
+	if (bd->rss_hash_cfg & VNIC_RSS_CFG_REQ_HASH_TYPE_IPV6_FLOW_LABEL)
+		return RXH_IP_SRC | RXH_IP_DST | RXH_IP6_FL;
+	return 0;
+}
+
+static int bnge_get_rxfh_fields(struct net_device *dev,
+				struct ethtool_rxfh_fields *cmd)
+{
+	struct bnge_net *bn = netdev_priv(dev);
+	struct bnge_dev *bd = bn->bd;
+
+	cmd->data = 0;
+	switch (cmd->flow_type) {
+	case TCP_V4_FLOW:
+		if (bd->rss_hash_cfg & VNIC_RSS_CFG_REQ_HASH_TYPE_TCP_IPV4)
+			cmd->data |= RXH_IP_SRC | RXH_IP_DST |
+				     RXH_L4_B_0_1 | RXH_L4_B_2_3;
+		cmd->data |= bnge_get_ethtool_ipv4_rss(bd);
+		break;
+	case UDP_V4_FLOW:
+		if (bd->rss_hash_cfg & VNIC_RSS_CFG_REQ_HASH_TYPE_UDP_IPV4)
+			cmd->data |= RXH_IP_SRC | RXH_IP_DST |
+				     RXH_L4_B_0_1 | RXH_L4_B_2_3;
+		cmd->data |= bnge_get_ethtool_ipv4_rss(bd);
+		break;
+	case AH_ESP_V4_FLOW:
+		if (bd->rss_hash_cfg &
+		    (VNIC_RSS_CFG_REQ_HASH_TYPE_AH_SPI_IPV4 |
+		     VNIC_RSS_CFG_REQ_HASH_TYPE_ESP_SPI_IPV4))
+			cmd->data |= RXH_IP_SRC | RXH_IP_DST |
+				     RXH_L4_B_0_1 | RXH_L4_B_2_3;
+		cmd->data |= bnge_get_ethtool_ipv4_rss(bd);
+		break;
+	case SCTP_V4_FLOW:
+	case AH_V4_FLOW:
+	case ESP_V4_FLOW:
+	case IPV4_FLOW:
+		cmd->data |= bnge_get_ethtool_ipv4_rss(bd);
+		break;
+	case TCP_V6_FLOW:
+		if (bd->rss_hash_cfg & VNIC_RSS_CFG_REQ_HASH_TYPE_TCP_IPV6)
+			cmd->data |= RXH_IP_SRC | RXH_IP_DST |
+				     RXH_L4_B_0_1 | RXH_L4_B_2_3;
+		cmd->data |= bnge_get_ethtool_ipv6_rss(bd);
+		break;
+	case UDP_V6_FLOW:
+		if (bd->rss_hash_cfg & VNIC_RSS_CFG_REQ_HASH_TYPE_UDP_IPV6)
+			cmd->data |= RXH_IP_SRC | RXH_IP_DST |
+				     RXH_L4_B_0_1 | RXH_L4_B_2_3;
+		cmd->data |= bnge_get_ethtool_ipv6_rss(bd);
+		break;
+	case AH_ESP_V6_FLOW:
+		if (bd->rss_hash_cfg &
+		    (VNIC_RSS_CFG_REQ_HASH_TYPE_AH_SPI_IPV6 |
+		     VNIC_RSS_CFG_REQ_HASH_TYPE_ESP_SPI_IPV6))
+			cmd->data |= RXH_IP_SRC | RXH_IP_DST |
+				     RXH_L4_B_0_1 | RXH_L4_B_2_3;
+		cmd->data |= bnge_get_ethtool_ipv6_rss(bd);
+		break;
+	case SCTP_V6_FLOW:
+	case AH_V6_FLOW:
+	case ESP_V6_FLOW:
+	case IPV6_FLOW:
+		cmd->data |= bnge_get_ethtool_ipv6_rss(bd);
+		break;
+	}
+	return 0;
+}
+
+#define RXH_4TUPLE (RXH_IP_SRC | RXH_IP_DST | RXH_L4_B_0_1 | RXH_L4_B_2_3)
+#define RXH_2TUPLE (RXH_IP_SRC | RXH_IP_DST)
+
+static int bnge_set_rxfh_fields(struct net_device *dev,
+				const struct ethtool_rxfh_fields *cmd,
+				struct netlink_ext_ack *extack)
+{
+	struct bnge_net *bn = netdev_priv(dev);
+	struct bnge_dev *bd = bn->bd;
+	u32 rss_hash_cfg;
+	int tuple;
+
+	rss_hash_cfg = bd->rss_hash_cfg;
+
+	if (cmd->data == RXH_4TUPLE ||
+	    cmd->data == (RXH_4TUPLE | RXH_IP6_FL))
+		tuple = 4;
+	else if (cmd->data == RXH_2TUPLE ||
+		 cmd->data == (RXH_2TUPLE | RXH_IP6_FL))
+		tuple = 2;
+	else if (!cmd->data)
+		tuple = 0;
+	else
+		return -EINVAL;
+
+	if (cmd->data & RXH_IP6_FL &&
+	    !(bd->rss_cap & BNGE_RSS_CAP_IPV6_FLOW_LABEL_RSS_CAP))
+		return -EINVAL;
+
+	if (cmd->flow_type == TCP_V4_FLOW) {
+		rss_hash_cfg &= ~VNIC_RSS_CFG_REQ_HASH_TYPE_TCP_IPV4;
+		if (tuple == 4)
+			rss_hash_cfg |= VNIC_RSS_CFG_REQ_HASH_TYPE_TCP_IPV4;
+	} else if (cmd->flow_type == UDP_V4_FLOW) {
+		rss_hash_cfg &= ~VNIC_RSS_CFG_REQ_HASH_TYPE_UDP_IPV4;
+		if (tuple == 4)
+			rss_hash_cfg |= VNIC_RSS_CFG_REQ_HASH_TYPE_UDP_IPV4;
+	} else if (cmd->flow_type == TCP_V6_FLOW) {
+		rss_hash_cfg &= ~VNIC_RSS_CFG_REQ_HASH_TYPE_TCP_IPV6;
+		if (tuple == 4)
+			rss_hash_cfg |= VNIC_RSS_CFG_REQ_HASH_TYPE_TCP_IPV6;
+	} else if (cmd->flow_type == UDP_V6_FLOW) {
+		rss_hash_cfg &= ~VNIC_RSS_CFG_REQ_HASH_TYPE_UDP_IPV6;
+		if (tuple == 4)
+			rss_hash_cfg |= VNIC_RSS_CFG_REQ_HASH_TYPE_UDP_IPV6;
+	} else if (cmd->flow_type == AH_ESP_V4_FLOW) {
+		if (tuple == 4 &&
+		    (!(bd->rss_cap & BNGE_RSS_CAP_AH_V4_RSS_CAP) ||
+		     !(bd->rss_cap & BNGE_RSS_CAP_ESP_V4_RSS_CAP)))
+			return -EINVAL;
+		rss_hash_cfg &= ~(VNIC_RSS_CFG_REQ_HASH_TYPE_AH_SPI_IPV4 |
+				  VNIC_RSS_CFG_REQ_HASH_TYPE_ESP_SPI_IPV4);
+		if (tuple == 4)
+			rss_hash_cfg |= VNIC_RSS_CFG_REQ_HASH_TYPE_AH_SPI_IPV4 |
+					VNIC_RSS_CFG_REQ_HASH_TYPE_ESP_SPI_IPV4;
+	} else if (cmd->flow_type == AH_ESP_V6_FLOW) {
+		if (tuple == 4 &&
+		    (!(bd->rss_cap & BNGE_RSS_CAP_AH_V6_RSS_CAP) ||
+		     !(bd->rss_cap & BNGE_RSS_CAP_ESP_V6_RSS_CAP)))
+			return -EINVAL;
+		rss_hash_cfg &= ~(VNIC_RSS_CFG_REQ_HASH_TYPE_AH_SPI_IPV6 |
+				  VNIC_RSS_CFG_REQ_HASH_TYPE_ESP_SPI_IPV6);
+		if (tuple == 4)
+			rss_hash_cfg |= VNIC_RSS_CFG_REQ_HASH_TYPE_AH_SPI_IPV6 |
+					VNIC_RSS_CFG_REQ_HASH_TYPE_ESP_SPI_IPV6;
+	} else if (tuple == 4) {
+		return -EINVAL;
+	}
+
+	switch (cmd->flow_type) {
+	case TCP_V4_FLOW:
+	case UDP_V4_FLOW:
+	case SCTP_V4_FLOW:
+	case AH_ESP_V4_FLOW:
+	case AH_V4_FLOW:
+	case ESP_V4_FLOW:
+	case IPV4_FLOW:
+		if (tuple == 2)
+			rss_hash_cfg |= VNIC_RSS_CFG_REQ_HASH_TYPE_IPV4;
+		else if (!tuple)
+			rss_hash_cfg &= ~VNIC_RSS_CFG_REQ_HASH_TYPE_IPV4;
+		break;
+
+	case TCP_V6_FLOW:
+	case UDP_V6_FLOW:
+	case SCTP_V6_FLOW:
+	case AH_ESP_V6_FLOW:
+	case AH_V6_FLOW:
+	case ESP_V6_FLOW:
+	case IPV6_FLOW:
+		if (cmd->data & RXH_IP6_FL) {
+			rss_hash_cfg |= VNIC_RSS_CFG_REQ_HASH_TYPE_IPV6_FLOW_LABEL;
+			rss_hash_cfg &= ~VNIC_RSS_CFG_REQ_HASH_TYPE_IPV6;
+		} else if (tuple == 2) {
+			rss_hash_cfg |= VNIC_RSS_CFG_REQ_HASH_TYPE_IPV6;
+			rss_hash_cfg &= ~VNIC_RSS_CFG_REQ_HASH_TYPE_IPV6_FLOW_LABEL;
+		} else if (!tuple) {
+			rss_hash_cfg &= ~(VNIC_RSS_CFG_REQ_HASH_TYPE_IPV6 |
+					  VNIC_RSS_CFG_REQ_HASH_TYPE_IPV6_FLOW_LABEL);
+		}
+		break;
+	}
+
+	if (bd->rss_hash_cfg == rss_hash_cfg)
+		return 0;
+
+	if (netif_running(dev)) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "RSS configuration can only be changed while the interface is down");
+		return -EBUSY;
+	}
+
+	bd->rss_hash_cfg = rss_hash_cfg;
+
+	return 0;
+}
+
+static u32 bnge_get_rxfh_indir_size_eth(struct net_device *dev)
+{
+	struct bnge_net *bn = netdev_priv(dev);
+	struct bnge_dev *bd = bn->bd;
+
+	return bnge_get_rxfh_indir_size(bd);
+}
+
+static u32 bnge_get_rxfh_key_size(struct net_device *dev)
+{
+	return HW_HASH_KEY_SIZE;
+}
+
+static int bnge_get_rxfh(struct net_device *dev,
+			 struct ethtool_rxfh_param *rxfh)
+{
+	struct bnge_net *bn = netdev_priv(dev);
+	struct bnge_dev *bd = bn->bd;
+	u32 i, tbl_size;
+	u32 *indir_tbl;
+
+	indir_tbl = bd->rss_indir_tbl;
+	rxfh->hfunc = ETH_RSS_HASH_TOP;
+
+	if (rxfh->indir && indir_tbl) {
+		tbl_size = bnge_get_rxfh_indir_size(bd);
+		for (i = 0; i < tbl_size; i++)
+			rxfh->indir[i] = indir_tbl[i];
+	}
+
+	if (rxfh->key)
+		memcpy(rxfh->key, bn->rss_hash_key, HW_HASH_KEY_SIZE);
+
+	return 0;
+}
+
+static int bnge_set_rxfh(struct net_device *dev,
+			 struct ethtool_rxfh_param *rxfh,
+			 struct netlink_ext_ack *extack)
+{
+	struct bnge_net *bn = netdev_priv(dev);
+
+	if (rxfh->hfunc && rxfh->hfunc != ETH_RSS_HASH_TOP)
+		return -EOPNOTSUPP;
+
+	if (netif_running(dev)) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "RSS configuration can only be changed while the interface is down");
+		return -EBUSY;
+	}
+
+	bnge_modify_rss(bn, NULL, NULL, rxfh);
+
+	return 0;
+}
+
+static u32 bnge_get_rx_ring_count(struct net_device *dev)
+{
+	struct bnge_net *bn = netdev_priv(dev);
+	struct bnge_dev *bd = bn->bd;
+
+	return bd->rx_nr_rings;
+}
+
 static const struct ethtool_ops bnge_ethtool_ops = {
 	.cap_link_lanes_supported	= 1,
 	.get_link_ksettings	= bnge_get_link_ksettings,
@@ -757,6 +1021,18 @@ static const struct ethtool_ops bnge_ethtool_ops = {
 	.get_eth_ctrl_stats	= bnge_get_eth_ctrl_stats,
 	.get_pause_stats	= bnge_get_pause_stats,
 	.get_rmon_stats		= bnge_get_rmon_stats,
+	/* RXFH */
+	.rxfh_per_ctx_key	= 1,
+	.rxfh_max_num_contexts	= BNGE_MAX_ETH_RSS_CTX + 1,
+	.rxfh_indir_space	= BNGE_MAX_RSS_TABLE_ENTRIES,
+	.rxfh_priv_size		= sizeof(struct bnge_rss_ctx),
+	.get_rx_ring_count	= bnge_get_rx_ring_count,
+	.get_rxfh_indir_size	= bnge_get_rxfh_indir_size_eth,
+	.get_rxfh_key_size	= bnge_get_rxfh_key_size,
+	.get_rxfh		= bnge_get_rxfh,
+	.set_rxfh		= bnge_set_rxfh,
+	.get_rxfh_fields	= bnge_get_rxfh_fields,
+	.set_rxfh_fields	= bnge_set_rxfh_fields,
 };
 
 void bnge_set_ethtool_ops(struct net_device *dev)
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.c b/drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.c
index 91d246c8dcf2..86edb70d323e 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.c
@@ -676,6 +676,8 @@ int bnge_hwrm_vnic_qcaps(struct bnge_dev *bd)
 			bd->rss_cap |= BNGE_RSS_CAP_ESP_V4_RSS_CAP;
 		if (flags & VNIC_QCAPS_RESP_FLAGS_RSS_IPSEC_ESP_SPI_IPV6_CAP)
 			bd->rss_cap |= BNGE_RSS_CAP_ESP_V6_RSS_CAP;
+		if (flags & VNIC_QCAPS_RESP_FLAGS_RSS_IPV6_FLOW_LABEL_CAP)
+			bd->rss_cap |= BNGE_RSS_CAP_IPV6_FLOW_LABEL_RSS_CAP;
 	}
 	bnge_hwrm_req_drop(bd, req);
 
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
index bab706cb969f..c75c0a7f5c80 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
@@ -772,6 +772,9 @@ static void bnge_free_tx_skbs(struct bnge_net *bn)
 	u16 max_idx;
 	int i;
 
+	if (!bn->tx_ring)
+		return;
+
 	max_idx = bn->tx_nr_pages * TX_DESC_CNT;
 	for (i = 0; i < bd->tx_nr_rings; i++) {
 		struct bnge_tx_ring_info *txr = &bn->tx_ring[i];
@@ -883,6 +886,9 @@ static void bnge_free_rx_rings(struct bnge_net *bn)
 	struct bnge_dev *bd = bn->bd;
 	int i;
 
+	if (!bn->rx_ring)
+		return;
+
 	bnge_free_tpa_info(bn);
 	for (i = 0; i < bd->rx_nr_rings; i++) {
 		struct bnge_rx_ring_info *rxr = &bn->rx_ring[i];
@@ -1026,6 +1032,9 @@ static void bnge_free_tx_rings(struct bnge_net *bn)
 	struct bnge_dev *bd = bn->bd;
 	int i;
 
+	if (!bn->tx_ring)
+		return;
+
 	for (i = 0; i < bd->tx_nr_rings; i++) {
 		struct bnge_tx_ring_info *txr = &bn->tx_ring[i];
 		struct bnge_ring_struct *ring;
@@ -2723,7 +2732,7 @@ static int bnge_hwrm_if_change(struct bnge_dev *bd, bool up)
 	return bnge_hwrm_req_send(bd, req);
 }
 
-static int bnge_open_core(struct bnge_net *bn)
+int bnge_open_core(struct bnge_net *bn)
 {
 	struct bnge_dev *bd = bn->bd;
 	int rc;
@@ -2993,10 +3002,14 @@ static void bnge_save_ring_stats(struct bnge_net *bn)
 	}
 }
 
-static void bnge_close_core(struct bnge_net *bn)
+void bnge_close_core(struct bnge_net *bn)
 {
 	struct bnge_dev *bd = bn->bd;
 
+	/* Already torn down (e.g. after a failed open/reconfiguration) */
+	if (!bn->bnapi)
+		return;
+
 	bnge_tx_disable(bn);
 
 	clear_bit(BNGE_STATE_OPEN, &bd->state);
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.h b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.h
index 3c0fea0a7608..d68eaa78d4e0 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.h
@@ -579,4 +579,6 @@ int bnge_alloc_rx_netmem(struct bnge_net *bn, struct bnge_rx_ring_info *rxr,
 			 u16 prod, gfp_t gfp);
 void __bnge_queue_sp_work(struct bnge_net *bn);
 void bnge_copy_hw_masks(u64 *mask_arr, __le64 *hw_mask_arr, int count);
+int bnge_open_core(struct bnge_net *bn);
+void bnge_close_core(struct bnge_net *bn);
 #endif /* _BNGE_NETDEV_H_ */
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_vnic.h b/drivers/net/ethernet/broadcom/bnge/bnge_vnic.h
index af066d8ff156..b2a1d8332a5f 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_vnic.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_vnic.h
@@ -15,6 +15,7 @@ struct bnge_l2_filter;
 #define BNGE_MAX_RSS_TABLE_ENTRIES				\
 	(BNGE_RSS_TABLE_ENTRIES * BNGE_RSS_TABLE_MAX_TBL)
 
+#define BNGE_MAX_ETH_RSS_CTX	32
 #define BNGE_MAX_CTX_PER_VNIC	8
 
 #define BNGE_MAX_MC_ADDRS	16
-- 
2.52.0

