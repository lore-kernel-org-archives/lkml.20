Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.206.34.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794798665;
	b=f11rUJU7jZHClCQLtHJqjKz9dNuVyzFEO0qUvqbkoMbuvI/AfjjyFxH8H0BauTBN6wub
	 Ng2ZtfzYY/LMtd7eGKclXFMSfiQ5nFtvtE3D7UbDFSGLjsx3whKhlESL35lQPzx2CgZFv
	 /dq0zi/bbcxK4TQjb7osg9xPYdaQ4QnTRKPFHdpDLNvdeCOQdHMJKmoNdggiTfL9wIMWm
	 CI5Y9r3BMFZNVhjPCHczZ62gPOyac8Wt3VnlP+P/jIUqgKCmyH0I7d6+qH1853r4wPzRj
	 MQFw2bL++dlvg+RuoMF/camYkdPZw8jD1MjNkr86naD3LNRtVfPUakoxSglaBHZFKmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794798665;
	h=DMARC-Filter:X-QQ-mid:X-QQ-Originating-IP:Received:X-QQ-SSF:
	 X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=7dcwnJj2vA9bhQKn9/gRxbwaSZ3/ZpAApP3j+tALvFU=;
	b=H820dhQf7Wf70tMnwHWvn8hgw9iL8fsGHLj3Smeyrvd9HKv/dOmztOnzXznYiE8Ly533
	 QDtDG5H6e/hX+MkLeTCbAWPoV9OoeQ3aAq40w9KwYqY9m6EBt/A0upsafk+74mXsfNqT3
	 aMTjHKd2or3Y5UiF3Zj+B7UfcDvGdntutyaoCMF/Bnep8piBijOGR2EkqtT3Zm7b3FytT
	 TWDPLOgTVikU6zqDYEXmnXF3PmaIbAaWgTqwayrYWvTALPbDNGSA3FsWB6BVLet4c4bD5
	 dEGhYbLdYUk7U4W9uvBLRDmaSUDqQxFWXwVmxFgTPMNMzxdMKQT/imN0K96XcfEfuDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mucse.com;
	spf=pass smtp.mailfrom=mucse.com;
	arc=none smtp.remote-ip=54.206.34.216
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23395606A321;
	Mon, 16 Nov 2026 03:11:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23395606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mucse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mucse.com
X-QQ-mid: zesmtpgz7t1794798614ta6b97915
X-QQ-Originating-IP: aeE7ssD/9CSVG6ndwAzVv5vjZHdZrA8dJkys5mzNN2Y=
Received: from nic-Precision-5820-Tower.tail7b ( [203.174.112.180])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 16 Nov 2026 11:10:11 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6028493024740882600
EX-QQ-RecipientCnt: 11
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
	yaojun@mucse.com,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH net-next v2 1/5] net: rnpgbe: Add basic ethtool support
Date: Mon, 16 Nov 2026 11:10:10 +0800
Message-ID: <67EA420FC9597AFB+20261116031010.1330171-1-dong100@mucse.com>
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
Feedback-ID: zesmtpgz:mucse.com:qybglogicsvrgz:qybglogicsvrgz3a-1
X-QQ-XMAILINFO: Nv1Zs1ssfOILLJkhF4WlDn/GRJJtwFpkAupuWq0hV22I/gDcyVszxNam
	rvrHVJ8FvqWr9WEqQanXhbd5QaeH2pSn9FxVRgxs0++D5KZOtx53JSrY31ziaYqg0lVPqE0
	rm3mId6Q3SApY6Za/8XzURElITknJb8b/NpOHauh4HzEoDr+Y60D0HygF6tT9yVE1OKw4c5
	EvfdUmbC5OEZ/+KiGqN/sR0kMLStoIUlCuBQCO7v+wJ13owM+cOKlYA585rofWv3MAOlySm
	ubfTyCyYBXc3rSQjNRgcmZHfoAts6XS5hNIGK72UJ6EqJBobwRMfZqCq/44rMLyaXgpZzI8
	Hr3vhdQ251X+6bpQtdfN9aawKC1uD8htOqfJs1zj2+UQxLOnDJ0CxepBYbwVATQXKQLf3yo
	IrOldKFVTI6veQDHDUwST+4CNxSfJZBnspQzoN1vaE/fg0Ts9PQt6yXTlCbw4g4uWhv4/MM
	BCfSDz+K2lonvU3/988F2fGlQE8tkeEwBQzGIzJL9MeRl3Gj4H32MyE9zIeUCruO20joeV3
	XteNixTTsue93P00l7sI81Ts0sVRk0YPwiNNLldL69YllU81qnSjm7C279KQfMWjcrGr5yX
	+1opWEc0ps2j1tnvYqOsSuV7bMRsGK72LDvC6Qqj4l6ETbCWDLZ/KwXwJ3zbo4QdqM/+zZv
	EcFbDCfgMJuFFlg6FnDCrMaCKU5JBDQaM7T9w40TAIMswHsihO+YHRBO6sE+QqolxSPTZih
	aABGD0t7MXa0kh60Cf9cLNREA4fq4mmrLzP8XMAhLtjrWwTkELT963aX0AVv0WKAMkTb6EN
	teQpNuWF53Sv1mY4m0buXRQAvJbKEeqWERxcEbSe7VcCEQiBTZB0EOktMOgfjXsfizIdopY
	qXvAI0TediksJgoGwp46iy44jgkYL8Gf38IT6gl52/4uT1O6FgFfALEuSspGZRLDcSqk3WS
	7f2e6gpGOd6r2qX/y3/+tvu4+A+DgoLjnSUgDjvFvUU0GkABHVHnuNLngLFE2ONBn+s6Cba
	LlnNlg/FAhx4dEFWUk99g6NjRetXAcTS0npLeKl0ZwLNHvLL5G
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

Add get_drvinfo and get_link callbacks to report the driver name,
PCI bus address, firmware version and carrier state through ethtool.

Signed-off-by: Dong Yibo <dong100@mucse.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/ethernet/mucse/rnpgbe/Makefile    |  1 +
 drivers/net/ethernet/mucse/rnpgbe/rnpgbe.h    |  3 +++
 .../ethernet/mucse/rnpgbe/rnpgbe_ethtool.c    | 25 +++++++++++++++++++
 .../net/ethernet/mucse/rnpgbe/rnpgbe_main.c   |  1 +
 .../net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c |  4 ++-
 5 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 drivers/net/ethernet/mucse/rnpgbe/rnpgbe_ethtool.c

diff --git a/drivers/net/ethernet/mucse/rnpgbe/Makefile b/drivers/net/ethernet/mucse/rnpgbe/Makefile
index 17574cad392a..4d768324a82c 100644
--- a/drivers/net/ethernet/mucse/rnpgbe/Makefile
+++ b/drivers/net/ethernet/mucse/rnpgbe/Makefile
@@ -9,4 +9,5 @@ rnpgbe-objs := rnpgbe_main.o\
 	       rnpgbe_chip.o\
 	       rnpgbe_mbx.o\
 	       rnpgbe_mbx_fw.o\
+	       rnpgbe_ethtool.o\
 	       rnpgbe_lib.o
diff --git a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe.h b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe.h
index 4e9776b28bfb..2fe76c95da7c 100644
--- a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe.h
+++ b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe.h
@@ -46,6 +46,7 @@ struct mucse_hw {
 	struct mucse_mbx_info mbx;
 	int port;
 	int speed;
+	u32 fw_version;
 	bool link;
 	u16 cycles_per_us;
 	u8 pfvfnum;
@@ -257,6 +258,8 @@ int rnpgbe_set_rx_mode(struct net_device *netdev,
 		       struct netdev_hw_addr_list *mc);
 void rnpgbe_set_link(struct mucse_hw *hw, bool linkup);
 
+extern const struct ethtool_ops rnpgbe_ethtool_ops;
+
 /* Device IDs */
 #define PCI_VENDOR_ID_MUCSE               0x8848
 #define RNPGBE_DEVICE_ID_N500_QUAD_PORT   0x8308
diff --git a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_ethtool.c b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_ethtool.c
new file mode 100644
index 000000000000..506233f62698
--- /dev/null
+++ b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_ethtool.c
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright(c) 2022 - 2026 Mucse Corporation. */
+
+#include <linux/ethtool.h>
+#include <linux/pci.h>
+
+#include "rnpgbe.h"
+
+static void rnpgbe_get_drvinfo(struct net_device *netdev,
+			       struct ethtool_drvinfo *info)
+{
+	struct mucse *mucse = netdev_priv(netdev);
+	u32 version = mucse->hw.fw_version;
+
+	strscpy(info->driver, KBUILD_MODNAME);
+	strscpy(info->bus_info, pci_name(mucse->pdev));
+	snprintf(info->fw_version, sizeof(info->fw_version), "%u.%u.%u.%u",
+		 version >> 24, (version >> 16) & 0xff,
+		 (version >> 8) & 0xff, version & 0xff);
+}
+
+const struct ethtool_ops rnpgbe_ethtool_ops = {
+	.get_drvinfo = rnpgbe_get_drvinfo,
+	.get_link = ethtool_op_get_link,
+};
diff --git a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c
index 708a7297233e..46981ef2542a 100644
--- a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c
+++ b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_main.c
@@ -250,6 +250,7 @@ static int rnpgbe_add_adapter(struct pci_dev *pdev,
 	}
 
 	netdev->netdev_ops = &rnpgbe_netdev_ops;
+	netdev->ethtool_ops = &rnpgbe_ethtool_ops;
 	netdev->priv_flags |= IFF_UNICAST_FLT;
 	rnpgbe_sw_init(mucse);
 	err = rnpgbe_reset_hw(hw);
diff --git a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c
index c6ce9dbee3d0..4a1893792751 100644
--- a/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c
+++ b/drivers/net/ethernet/mucse/rnpgbe/rnpgbe_mbx_fw.c
@@ -72,9 +72,11 @@ static int mucse_mbx_get_info(struct mucse_hw *hw)
 	int err;
 
 	err = mucse_fw_send_cmd_wait_resp(hw, &req, &reply);
-	if (!err)
+	if (!err) {
 		hw->pfvfnum = FIELD_GET(GENMASK_U16(7, 0),
 					le16_to_cpu(reply.r.hw_info.pfnum));
+		hw->fw_version = le32_to_cpu(reply.r.hw_info.fw_version);
+	}
 
 	return err;
 }
-- 
2.50.1

