Received: from mail-ot1-f97.google.com (mail-ot1-f97.google.com [209.85.210.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA27513573
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859907; cv=none; b=Pr/DmQlhIX31vJ/4wRx4VoT/mRvNCW/2gYeFQbUWznm4zdN/KYlkraNyIoiPDcTHlDUWWAk8inbT7utoiVm+6I5kDsog4zyO6ggKNJ5xFiKmOBRIO0En+Vm0+kKn9ljgwWNkQDUU9ODVYd9s8UcyxP1iuxUQhmPjuiQ2igjvwU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859907; c=relaxed/simple;
	bh=q7GaVPNlXH2TU8bdjImY3RQk3H7foWlU1BfrlnVucZk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QVCM3pLSqHRljVGODtoFHsynObuyKLauXOuRio9++gutKScyHIvG0RyL7g0428u4qnsLvtXtpEek/EY5hU7w9hVPJGYSEWDSy77gItaPCb1jr/cYQ4XDJf1kMCKqMi7pDKJp+lo2I4NBqYtj6JDY1CjYM0WuH/W0shBPY6t3zGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=NOxt3QQk; arc=none smtp.client-ip=209.85.210.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="NOxt3QQk"
Received: by mail-ot1-f97.google.com with SMTP id 46e09a7af769-7f48c750afcso3626276a34.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:31:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788859903; x=1789464703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uA0mEGghtidUh7SAiTUiFP8rmMo+F8AxQ08TFgIPLJs=;
        b=m8HZPKnOcc1g348XltrxYKWlM2EZMrcoCxYcHKm3YX+laV8JmTTJrNRmGpBeCq+DP4
         1z4lXRLa3bduux8dRjOlpBxMKT3Q/YsL9si2AlpykRf2IfikDPHG0tfEjgZ2D4l84LHI
         of5017ubfluZShAKbPYtXZPAJ9t8PW2hhbLaxmACCB7vf0sZzAZ8d1/neJpOMGl8KG35
         D+IoUMJn2SQpcl2iU+ivGZ11jOlCaonZ3FiN5OZX7Oz8OPjMXnOcaI66rI1YLCRWL06x
         i4r63f8P/GvCNWcmQvsbVbhipbkANxFxznCZeRDM7CQ55rdfy4Gd8AlIkL6C8jCfNlze
         ARUA==
X-Forwarded-Encrypted: i=1; AKwUvByFQghhJsT/Tp1WpTiJCBxdkfuA7VObQouiz0Dfj6RAW5blhuyV+H+qVkOfUaM3LPKPWT5fgs6GPyEF8mw=@vger.kernel.org
X-Gm-Message-State: AFuF++laSlaLWBDiZqeI8KDnc/oIkRqZq6Dilaz/fDyZdUfecRT9LMPP
	otFtpxE4AvRBHM9eb9tIDaDYlc51OdVd9Rx7KbzNWudN+bd97DIW8t5W2YNd+sLk/JGmDwJA/Dg
	kQfZEwCLRZi20TtMdsbR4EqPIgeuCunD6gzoxGJUnUjei70yfVEhvQCRDyAOqQARzJ5j+2QBJm8
	sygql4QTH3rM/v/XWZXEnigqEb7Ym50HVWE7T6GkfOx+HxodFP/exXgfqzmq3QjH3PCAHK/N+yr
	UzynlSQFMimBJrhng==
X-Gm-Gg: AYBFou2mr1a2QY4cVPKxKZYiVll9rPQLmy79bDbKxu/8YmkGRNskSotnOBYOlOgvT1o
	wIhy67wKX1cz/mamVvvRKGdNNRVw/dEZSr1Wy8H3dg8TV8gthcga3WyjbOw2ddKSjjS08tbm3ig
	THtSaBEWTNpyWAAGv31zya3pxmaf5JjOTCvg71nOPhn3oSigtPCFie1103fXJu1mJwCr8MtXkxs
	vtR44pM1rZzNgwub0Ehqq28tK9tIPNiuHyHCdlalow0WUX3f5R1H8K+jVtVJkTFXA9H76a2kSO3
	dvCqQMqPshpKbzArxtx+h2yjjW/XF5PgBvK0ExLIOsVWYhPQfC3iD2GXDhqCUr1LEfnYZBQrjZl
	QdBjdz3PcBNQxxJdFvbfAuoRP4lxFplXfQAFpteXZ+1S96jhN47h/6fIRmrtUN5jpinFZsAdSlw
	SMZ0c960umf3wpeFTBEUF8llj6XkJlzJ9PE70d
X-Received: by 2002:a05:6830:6aec:b0:7fc:e94a:a52c with SMTP id 46e09a7af769-7fce94ab443mr7992466a34.29.1788859902719;
        Tue, 08 Sep 2026 02:31:42 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-cc45541e742sm2759731a12.7.2026.09.08.02.31.42
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Sep 2026 02:31:42 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38ec0f510a9so7908678a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788859901; x=1789464701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uA0mEGghtidUh7SAiTUiFP8rmMo+F8AxQ08TFgIPLJs=;
        b=NOxt3QQkzRkAzDJ82saFOJauE9HRAETQFThH9EbeQSVX4lZdAEgykEQcNSvEYe96G6
         /nwTJqJMMm7X2omCkLrSNrcORIEHc4pounA48YB3tpn8AjNNrNjUPUjD54wfMKzI9RSS
         +7SOIZBBdiEhKS/NALYN1BIzcgEWQae6jYffE=
X-Forwarded-Encrypted: i=1; AKwUvByj84H0JbdRXNsQVRW/lpD1eoSZ8PMJn5jB0TsKNOvIkRTFVNzeAyD5un1PnFFxKPb9MTTW+zN3qAsMMT4=@vger.kernel.org
X-Received: by 2002:a17:90b:43:b0:395:5eec:b932 with SMTP id 98e67ed59e1d1-39b26141c79mr44828912a91.11.1788859900665;
        Tue, 08 Sep 2026 02:31:40 -0700 (PDT)
X-Received: by 2002:a17:90b:43:b0:395:5eec:b932 with SMTP id 98e67ed59e1d1-39b26141c79mr44828873a91.11.1788859900134;
        Tue, 08 Sep 2026 02:31:40 -0700 (PDT)
Received: from localhost.localdomain ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08ca63b3sm31493316a91.11.2026.09.08.02.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:31:39 -0700 (PDT)
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
Subject: [net-next, v2 05/11] bnge: add RXFH ethtool support
Date: Tue,  8 Sep 2026 15:00:47 +0530
Message-ID: <20260908093053.2596020-6-vikas.gupta@broadcom.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260908093053.2596020-1-vikas.gupta@broadcom.com>
References: <20260908093053.2596020-1-vikas.gupta@broadcom.com>
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

Signed-off-by: Vikas Gupta <vikas.gupta@broadcom.com>
Reviewed-by: Bhargava Chenna Marreddy <bhargava.marreddy@broadcom.com>
Reviewed-by: Dharmender Garg <dharmender.garg@broadcom.com>
---
 drivers/net/ethernet/broadcom/bnge/bnge.h     |   1 +
 .../net/ethernet/broadcom/bnge/bnge_ethtool.c | 275 ++++++++++++++++++
 .../ethernet/broadcom/bnge/bnge_hwrm_lib.c    |   2 +
 .../net/ethernet/broadcom/bnge/bnge_netdev.c  |   7 +-
 .../net/ethernet/broadcom/bnge/bnge_netdev.h  |   2 +
 .../net/ethernet/broadcom/bnge/bnge_vnic.h    |   1 +
 6 files changed, 286 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnge/bnge.h b/drivers/net/ethernet/broadcom/bnge/bnge.h
index d43c67232a86..d058737fe2b0 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge.h
@@ -88,6 +88,7 @@ enum {
 	BNGE_RSS_CAP_AH_V6_RSS_CAP			= BIT(5),
 	BNGE_RSS_CAP_ESP_V4_RSS_CAP			= BIT(6),
 	BNGE_RSS_CAP_ESP_V6_RSS_CAP			= BIT(7),
+	BNGE_RSS_CAP_IPV6_FLOW_LABEL_RSS_CAP		= BIT(8),
 };
 
 #define BNGE_MAX_QUEUE		8
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_ethtool.c b/drivers/net/ethernet/broadcom/bnge/bnge_ethtool.c
index 2467e44de291..bb7d366a9841 100644
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
 
@@ -740,6 +743,266 @@ static int bnge_set_pauseparam(struct net_device *dev,
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
+		fallthrough;
+	case AH_ESP_V4_FLOW:
+		if (bd->rss_hash_cfg &
+		    (VNIC_RSS_CFG_REQ_HASH_TYPE_AH_SPI_IPV4 |
+		     VNIC_RSS_CFG_REQ_HASH_TYPE_ESP_SPI_IPV4))
+			cmd->data |= RXH_IP_SRC | RXH_IP_DST |
+				     RXH_L4_B_0_1 | RXH_L4_B_2_3;
+		fallthrough;
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
+		fallthrough;
+	case AH_ESP_V6_FLOW:
+		if (bd->rss_hash_cfg &
+		    (VNIC_RSS_CFG_REQ_HASH_TYPE_AH_SPI_IPV6 |
+		     VNIC_RSS_CFG_REQ_HASH_TYPE_ESP_SPI_IPV6))
+			cmd->data |= RXH_IP_SRC | RXH_IP_DST |
+				     RXH_L4_B_0_1 | RXH_L4_B_2_3;
+		fallthrough;
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
+	int tuple, rc = 0;
+	u32 rss_hash_cfg;
+
+	rss_hash_cfg = bd->rss_hash_cfg;
+
+	if (cmd->data == RXH_4TUPLE)
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
+		if (tuple == 2) {
+			if (cmd->data & RXH_IP6_FL) {
+				rss_hash_cfg |= VNIC_RSS_CFG_REQ_HASH_TYPE_IPV6_FLOW_LABEL;
+				rss_hash_cfg &= ~VNIC_RSS_CFG_REQ_HASH_TYPE_IPV6;
+			} else {
+				rss_hash_cfg |= VNIC_RSS_CFG_REQ_HASH_TYPE_IPV6;
+				rss_hash_cfg &= ~VNIC_RSS_CFG_REQ_HASH_TYPE_IPV6_FLOW_LABEL;
+			}
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
+	bd->rss_hash_cfg = rss_hash_cfg;
+	if (netif_running(bn->netdev)) {
+		bnge_close_core(bn);
+		rc = bnge_open_core(bn);
+	}
+	return rc;
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
+	struct bnge_vnic_info *vnic;
+	u32 i, tbl_size;
+	u32 *indir_tbl;
+
+	indir_tbl = bd->rss_indir_tbl;
+	rxfh->hfunc = ETH_RSS_HASH_TOP;
+
+	if (!bn->vnic_info)
+		return 0;
+
+	vnic = &bn->vnic_info[BNGE_VNIC_DEFAULT];
+
+	if (rxfh->indir && indir_tbl) {
+		tbl_size = bnge_get_rxfh_indir_size(bd);
+		for (i = 0; i < tbl_size; i++)
+			rxfh->indir[i] = indir_tbl[i];
+	}
+
+	if (rxfh->key && vnic->rss_hash_key)
+		memcpy(rxfh->key, vnic->rss_hash_key, HW_HASH_KEY_SIZE);
+
+	return 0;
+}
+
+static int bnge_set_rxfh(struct net_device *dev,
+			 struct ethtool_rxfh_param *rxfh,
+			 struct netlink_ext_ack *extack)
+{
+	struct bnge_net *bn = netdev_priv(dev);
+	int rc = 0;
+
+	if (rxfh->hfunc && rxfh->hfunc != ETH_RSS_HASH_TOP)
+		return -EOPNOTSUPP;
+
+	bnge_modify_rss(bn, NULL, NULL, rxfh);
+
+	if (netif_running(bn->netdev)) {
+		bnge_close_core(bn);
+		rc = bnge_open_core(bn);
+	}
+	return rc;
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
@@ -757,6 +1020,18 @@ static const struct ethtool_ops bnge_ethtool_ops = {
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
index dd48c60aeef4..68a93d9f8d64 100644
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
index cc4246b0539d..79a24d12b37e 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
@@ -883,6 +883,9 @@ static void bnge_free_rx_rings(struct bnge_net *bn)
 	struct bnge_dev *bd = bn->bd;
 	int i;
 
+	if (!bn->rx_ring)
+		return;
+
 	bnge_free_tpa_info(bn);
 	for (i = 0; i < bd->rx_nr_rings; i++) {
 		struct bnge_rx_ring_info *rxr = &bn->rx_ring[i];
@@ -2723,7 +2726,7 @@ static int bnge_hwrm_if_change(struct bnge_dev *bd, bool up)
 	return bnge_hwrm_req_send(bd, req);
 }
 
-static int bnge_open_core(struct bnge_net *bn)
+int bnge_open_core(struct bnge_net *bn)
 {
 	struct bnge_dev *bd = bn->bd;
 	int rc;
@@ -2993,7 +2996,7 @@ static void bnge_save_ring_stats(struct bnge_net *bn)
 	}
 }
 
-static void bnge_close_core(struct bnge_net *bn)
+void bnge_close_core(struct bnge_net *bn)
 {
 	struct bnge_dev *bd = bn->bd;
 
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
2.47.1

