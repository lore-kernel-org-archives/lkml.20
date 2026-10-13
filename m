Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDB63BADB2
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791878773; cv=none; b=TYvrP/FjzbrMbgn6T+OYEqOvCzqgtPYUg3LQNr3emrufmCqn/PUf8Vq5D4u7s4TtUm9nBR2XiOpLC6ZFumidFqfsHlVQ7WNu0U7qNXqLETAQEatEOb/nDcj7WIgs7EDWzm+FiCzldBcRT53IwGXgtbbIyCi9+mwDjGDu6S5CkYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791878773; c=relaxed/simple;
	bh=5icz/Osaq4nbrxptLHQ15ei//5WgXiX7yg8tjTBrNwg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CSSI6nXg3somCIl6n6CKONiFVyB6IwSXbFsGPcP4TlmzdlKvh9nBA2x3wv+4gULJC+6XSi6Xtq+vdnFcfVR5wwJhnFKRwWDVK8SKw//YEPSRNS1dwffj5qH1USqZW3V31vQuiDp8sqaEV1HTtQ2DY+Yo0ZZJEjuG316KwxCGx3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=LFgtoK4j; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=B8rtpI2k; arc=none smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="LFgtoK4j";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="B8rtpI2k"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D41XiL3475927;
	Tue, 13 Oct 2026 01:06:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pfptdkimsnps; bh=kR5QykO/
	Vk11bC/9NXruxKVCgYN7g0iJ+LfDGZ2iKFI=; b=LFgtoK4jK+CiBNgix1bbqa9F
	x+lRA7iJm0ZTFXsfHexDFrzojVPrMKAOIq0VuP2ZndOJOK1CZDAiIslTg6/xKSz/
	vR41IxK/QfPYOFWDIFTd9qQBmP2HbkIeW9dcj4XMhI6ISNoqktHaXNCtC5Zuqlb7
	lKGm5nLubTVMr+dA0l7Al4LXNSE0KPS7oNv7yqfZUozZrZOlYcSzWrj8q4+kYZKy
	trKQpeOwmIWLgJ0ZPBvV+ZePD1Qqn8Rn5rc9QA+BFwQNnZcHSzYK2lATmWVM38FV
	JsZQwVUzBOQBPQubbalAMREgfLTy0oM1ENlxcxAZEb6cvi0j9ZIVrmHBjyZdjw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4h9419c24s-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 13 Oct 2026 01:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1791878763; bh=5icz/Osaq4nbrxptLHQ15ei//5WgXiX7yg8tjTBrNwg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B8rtpI2kQUNrbcCEjOeKhyk9Aj+vPXAs55IY8UoltpGPZvhOuHgBXA/fN7yLy1fp4
	 OsYYyxQ94ADHRotJC6R6VIpDfDf2gL5cFvgLgO+ABgMvn3R7TItLqUoQc9LlDlTt34
	 e0yhn11ui0dj3EPD/lK6DXWiuMWvjza6fZ0xIaHyuQTQhRK65OmXP0Cr4R/kTLqYiQ
	 ID0a5MExjjUqkMVnPLDX2n8qk7kd4Es4H6xrveBEMuUxrCKxWh/9ztCnFns5ErEAco
	 UQHuqKKPdqq9yC8J631+OPVrXCvwm8Ast5OQ97Tuyg+wiaHGT+EZQj9Cy/7A0au2/e
	 ZKOhl4SUzmdYQ==
Received: from mailhost.synopsys.com (eudc-mailhost2.synopsys.com [10.213.161.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7D737404F3;
	Tue, 13 Oct 2026 08:06:03 +0000 (UTC)
Received: from Ubuntu.internal.synopsys.com (unknown [10.150.7.185])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mailhost.synopsys.com (Postfix) with ESMTPSA id 6331CC0081;
	Tue, 13 Oct 2026 08:06:00 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Dineshkumar Parameswaran <Dineshkumar.Parameswaran@synopsys.com>
To: linux-i3c@lists.infradead.org
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com,
        linux-kernel@vger.kernel.org,
        Dineshkumar Parameswaran <Dineshkumar.Parameswaran@synopsys.com>
Subject: [PATCH 2/2] i3c: master: dw-i3c-master: add HDR-BT transfer support
Date: Tue, 13 Oct 2026 13:34:13 +0530
Message-Id: <20261013080413.7470-3-parame@synopsys.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261013080413.7470-1-parame@synopsys.com>
References: <20261013080413.7470-1-parame@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzMSBTYWx0ZWRfX8mGMnrshaZIk
 2CecC5L0ilklEIqKCw9+F+GhnN+B68lLBnj6lJz6jvzMNk0KKhEqTZS74dd3HPt0yJoU1n346Ht
 OY3ueim+z/Mct3tlJw5YXkey7+gKnGNhUMpraQ69fl5Osm3D0Ydbm01DbXkoYPeBY0LM9zQfd6s
 +NHHVonQaCCrFsXWVObGTzcJtQtrVpMJvgwHIKOQnEClh8ZGzAOzSfX/QdQ7SnMcvbFxiYFUEzC
 qaxhVD9QtsQhAbiQabiOcthvxnUQpP2D19SFU9Tba+wF70/DH3K+P42wGiSeXXnSNCkekeJie9m
 fpzK2HPObaJNmTsu/oloH0yFnDQ5LLPQoLqfXgZEk3hjC6vGwH8LoY9dFU9KNaucdsNsa9s4FvG
 ClnASjGD4D6zKhelwgb/1fBflhq08f8iD/mZX7wsK9uUr02M0E+FBhT/FbCwpQekRet4Sm0CiSG
 zgvTOz16fuuWB/x/hcw==
X-Proofpoint-GUID: zlyKckK0hSn_yIDtGKLtr0Yl60HvqiSv
X-Proofpoint-ORIG-GUID: zlyKckK0hSn_yIDtGKLtr0Yl60HvqiSv
X-Authority-Analysis: v=2.4 cv=bZf+w+PB c=1 sm=1 tr=0 ts=6acde66c cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=660iZSQnnn4A:10 a=qPHU084jO2kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22 a=jIQo8A4GAAAA:8
 a=9Sy5TLg2mR2rO9kXXZsA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzMSBTYWx0ZWRfX8YMNo344DsoM
 szXf4nz8cdCzGvRAVxY/6TGvKFxhwj8CfhfoVfCPKs79jT4JN1zZ8SDEZFltn2Lb4tyVfdkrsEI
 gqdXAFyPzvtmFlrneDNqNORbwdM4i34=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 spamscore=0 clxscore=1015 bulkscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610080000 definitions=main-2610130031

Key differences:
-Add HDR-BT support for the DesignWare I3C master by introducing the
unified command format required by HDR-BT transfers.
-The current driver builds legacy cmd_lo/cmd_hi command entries for SDR and
HDR-DDR only. HDR-BT requires a 4-DWORD unified command layout, so HDR-BT
transfers cannot be described correctly with the existing path.
- HDR BT mode uses to send data in blocks and protected using CRC.

Signed-off-by: Dineshkumar Parameswaran <parame@synopsys.com>
---
 drivers/i3c/master/dw-i3c-master.c | 146 +++++++++++++++++++++--------
 1 file changed, 106 insertions(+), 40 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 58c54746bbe5..fc58dea8fe4f 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -65,6 +65,29 @@
 #define COMMAND_PORT_DEV_COUNT(x)	(((x) << 21) & GENMASK(25, 21))
 #define COMMAND_PORT_ADDR_ASSGN_CMD	0x03
 
+#define COMMAND_PORT_UNIFIED_DWORD0_CMD			0x04
+#define COMMAND_PORT_UNIFIED_DWORD0_TID(x)		(((x) << 3) & GENMASK(6, 3))
+#define COMMAND_PORT_UNIFIED_DWORD0_RnW			BIT(8)
+#define COMMAND_PORT_UNIFIED_DWORD0_DEV_INDEX(x)	(((x) << 9) & GENMASK(13, 9))
+#define COMMAND_PORT_UNIFIED_DWORD0_SPEED_MODE(x)	(((x) << 19) & GENMASK(22, 19))
+#define COMMAND_PORT_UNIFIED_DWORD0_WROC		BIT(30)
+#define COMMAND_PORT_UNIFIED_DWORD0_TOC			BIT(31)
+
+#define COMMAND_PORT_UNIFIED_DWORD1_DATA_LENGTH(x)	((x) & GENMASK(22, 0))
+#define COMMAND_PORT_UNIFIED_DWORD1_MLANE_MODE(x)	(((x) << 24) & GENMASK(26, 24))
+#define COMMAND_PORT_UNIFIED_DWORD1_MLANE_CODE(x)	(((x) << 27) & GENMASK(29, 27))
+
+#define COMMAND_PORT_UNIFIED_DWORD2_IDB0_CCC_CMD0(x)	((x) & GENMASK(7, 0))
+#define COMMAND_PORT_UNIFIED_DWORD2_IDB1_DB_CMD1(x)	(((x) << 8) & GENMASK(15, 8))
+#define COMMAND_PORT_UNIFIED_DWORD2_IDB2_HDRCMD_CMD2(x)	(((x) << 16) & GENMASK(23, 16))
+#define COMMAND_PORT_UNIFIED_DWORD2_IDB3_CMD3(x)	(((x) << 24) & GENMASK(31, 24))
+
+#define COMMAND_PORT_UNIFIED_DWORD3_CONTROL(x)		((x) & GENMASK(7, 0))
+
+#define HDR_BT_SPD_MODE		0x8
+#define SINGLE_LANE		0x0
+#define SIZEOF_UNIFIED_CMD	4
+
 #define RESPONSE_QUEUE_PORT		0x10
 #define RESPONSE_PORT_ERR_STATUS(x)	(((x) & GENMASK(31, 28)) >> 28)
 #define RESPONSE_NO_ERROR		0
@@ -247,8 +270,15 @@
 #define DW_I3C_ACPI_SKIP_CLK_RST	BIT(3)
 
 struct dw_i3c_cmd {
-	u32 cmd_lo;
-	u32 cmd_hi;
+	bool is_unified_cmd;
+	union {
+		struct {
+			u32 cmd_lo;
+			u32 cmd_hi;
+			u32 data[2];
+		};
+		u32 unified_cmd[4];
+	} cmd_data;
 	u16 tx_len;
 	u16 rx_len;
 	u8 error;
@@ -402,7 +432,7 @@ dw_i3c_master_alloc_xfer(struct dw_i3c_master *master, unsigned int ncmds)
 static void dw_i3c_master_start_xfer_locked(struct dw_i3c_master *master)
 {
 	struct dw_i3c_xfer *xfer = master->xferqueue.cur;
-	unsigned int i;
+	unsigned int i, k;
 	u32 thld_ctrl;
 
 	if (!xfer)
@@ -422,8 +452,14 @@ static void dw_i3c_master_start_xfer_locked(struct dw_i3c_master *master)
 	for (i = 0; i < xfer->ncmds; i++) {
 		struct dw_i3c_cmd *cmd = &xfer->cmds[i];
 
-		writel(cmd->cmd_hi, master->regs + COMMAND_QUEUE_PORT);
-		writel(cmd->cmd_lo, master->regs + COMMAND_QUEUE_PORT);
+		if (cmd->is_unified_cmd) {
+			for (k = 0; k < SIZEOF_UNIFIED_CMD; k++)
+				writel(cmd->cmd_data.unified_cmd[k],
+				       master->regs + COMMAND_QUEUE_PORT);
+		} else {
+			writel(cmd->cmd_data.cmd_hi, master->regs + COMMAND_QUEUE_PORT);
+			writel(cmd->cmd_data.cmd_lo, master->regs + COMMAND_QUEUE_PORT);
+		}
 	}
 }
 
@@ -784,10 +820,10 @@ static int dw_i3c_ccc_set(struct dw_i3c_master *master,
 	cmd->tx_buf = ccc->dests[0].payload.data;
 	cmd->tx_len = ccc->dests[0].payload.len;
 
-	cmd->cmd_hi = COMMAND_PORT_ARG_DATA_LEN(ccc->dests[0].payload.len) |
+	cmd->cmd_data.cmd_hi = COMMAND_PORT_ARG_DATA_LEN(ccc->dests[0].payload.len) |
 		      COMMAND_PORT_TRANSFER_ARG;
 
-	cmd->cmd_lo = COMMAND_PORT_CP |
+	cmd->cmd_data.cmd_lo = COMMAND_PORT_CP |
 		      COMMAND_PORT_DEV_INDEX(pos) |
 		      COMMAND_PORT_CMD(ccc->id) |
 		      COMMAND_PORT_TOC |
@@ -823,10 +859,10 @@ static int dw_i3c_ccc_get(struct dw_i3c_master *master, struct i3c_ccc_cmd *ccc)
 	cmd->rx_buf = ccc->dests[0].payload.data;
 	cmd->rx_len = ccc->dests[0].payload.len;
 
-	cmd->cmd_hi = COMMAND_PORT_ARG_DATA_LEN(ccc->dests[0].payload.len) |
+	cmd->cmd_data.cmd_hi = COMMAND_PORT_ARG_DATA_LEN(ccc->dests[0].payload.len) |
 		      COMMAND_PORT_TRANSFER_ARG;
 
-	cmd->cmd_lo = COMMAND_PORT_READ_TRANSFER |
+	cmd->cmd_data.cmd_lo = COMMAND_PORT_READ_TRANSFER |
 		      COMMAND_PORT_CP |
 		      COMMAND_PORT_DEV_INDEX(pos) |
 		      COMMAND_PORT_CMD(ccc->id) |
@@ -924,8 +960,8 @@ static int dw_i3c_master_daa(struct i3c_master_controller *m)
 	}
 	cmd = &xfer->cmds[0];
 	cmd->rx_len = master->maxdevs;
-	cmd->cmd_hi = COMMAND_PORT_TRANSFER_ARG;
-	cmd->cmd_lo = COMMAND_PORT_DEV_COUNT(master->maxdevs - pos) |
+	cmd->cmd_data.cmd_hi = COMMAND_PORT_TRANSFER_ARG;
+	cmd->cmd_data.cmd_lo = COMMAND_PORT_DEV_COUNT(master->maxdevs - pos) |
 		      COMMAND_PORT_DEV_INDEX(pos) |
 		      COMMAND_PORT_CMD(I3C_CCC_ENTDAA) |
 		      COMMAND_PORT_ADDR_ASSGN_CMD |
@@ -999,33 +1035,63 @@ static int dw_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
 	for (i = 0; i < i3c_nxfers; i++) {
 		struct dw_i3c_cmd *cmd = &xfer->cmds[i];
 
-		cmd->cmd_hi = COMMAND_PORT_ARG_DATA_LEN(i3c_xfers[i].len) |
-			COMMAND_PORT_TRANSFER_ARG;
-
-		if (i3c_xfers[i].rnw) {
-			cmd->rx_buf = i3c_xfers[i].data.in;
-			cmd->rx_len = i3c_xfers[i].len;
-			cmd->cmd_lo = COMMAND_PORT_READ_TRANSFER |
-				      COMMAND_PORT_SPEED(dev->info.max_read_ds);
-
+		if (mode == I3C_HDR_BT) {
+			cmd->cmd_data.unified_cmd[0] = COMMAND_PORT_UNIFIED_DWORD0_CMD |
+				COMMAND_PORT_UNIFIED_DWORD0_TID(i) |
+				COMMAND_PORT_UNIFIED_DWORD0_DEV_INDEX(data->index) |
+				COMMAND_PORT_UNIFIED_DWORD0_SPEED_MODE(HDR_BT_SPD_MODE) |
+				COMMAND_PORT_UNIFIED_DWORD0_WROC;
+			if (i3c_xfers[i].rnw) {
+				cmd->rx_buf = i3c_xfers[i].data.in;
+				cmd->rx_len = i3c_xfers[i].len;
+				cmd->cmd_data.unified_cmd[0] |= COMMAND_PORT_UNIFIED_DWORD0_RnW;
+			} else {
+				cmd->tx_buf = i3c_xfers[i].data.out;
+				cmd->tx_len = i3c_xfers[i].len;
+			}
+			cmd->cmd_data.unified_cmd[1] =
+				COMMAND_PORT_UNIFIED_DWORD1_DATA_LENGTH(i3c_xfers[i].len) |
+				COMMAND_PORT_UNIFIED_DWORD1_MLANE_CODE(SINGLE_LANE) |
+				COMMAND_PORT_UNIFIED_DWORD1_MLANE_MODE(SINGLE_LANE);
+			cmd->cmd_data.unified_cmd[2] =
+				COMMAND_PORT_UNIFIED_DWORD2_IDB0_CCC_CMD0(0x00) |
+				COMMAND_PORT_UNIFIED_DWORD2_IDB1_DB_CMD1(0x00) |
+				COMMAND_PORT_UNIFIED_DWORD2_IDB2_HDRCMD_CMD2(0x00) |
+				COMMAND_PORT_UNIFIED_DWORD2_IDB3_CMD3(0x00);
+			cmd->cmd_data.unified_cmd[3] = COMMAND_PORT_UNIFIED_DWORD3_CONTROL(0);
+			if (i == (i3c_nxfers - 1))
+				cmd->cmd_data.unified_cmd[0] |= COMMAND_PORT_UNIFIED_DWORD0_TOC;
+			cmd->is_unified_cmd = true;
 		} else {
-			cmd->tx_buf = i3c_xfers[i].data.out;
-			cmd->tx_len = i3c_xfers[i].len;
-			cmd->cmd_lo =
-				COMMAND_PORT_SPEED(dev->info.max_write_ds);
-		}
 
-		cmd->cmd_lo |= COMMAND_PORT_TID(i) |
-			       COMMAND_PORT_DEV_INDEX(data->index) |
-			       COMMAND_PORT_ROC;
-
-		if (mode == I3C_HDR_DDR)
-			cmd->cmd_lo |= COMMAND_PORT_CP |
-				COMMAND_PORT_CMD(I3C_CCC_ENTHDR(0)) |
-				COMMAND_PORT_SPEED(DW_I3C_HDR_DDR_SPEED);
-
-		if (i == (i3c_nxfers - 1))
-			cmd->cmd_lo |= COMMAND_PORT_TOC;
+			cmd->cmd_data.cmd_hi = COMMAND_PORT_ARG_DATA_LEN(i3c_xfers[i].len) |
+				COMMAND_PORT_TRANSFER_ARG;
+
+			if (i3c_xfers[i].rnw) {
+				cmd->rx_buf = i3c_xfers[i].data.in;
+				cmd->rx_len = i3c_xfers[i].len;
+				cmd->cmd_data.cmd_lo = COMMAND_PORT_READ_TRANSFER |
+					COMMAND_PORT_SPEED(dev->info.max_read_ds);
+
+			} else {
+				cmd->tx_buf = i3c_xfers[i].data.out;
+				cmd->tx_len = i3c_xfers[i].len;
+				cmd->cmd_data.cmd_lo =
+					COMMAND_PORT_SPEED(dev->info.max_write_ds);
+			}
+
+			cmd->cmd_data.cmd_lo |= COMMAND_PORT_TID(i) |
+				COMMAND_PORT_DEV_INDEX(data->index) |
+				COMMAND_PORT_ROC;
+
+			if (mode == I3C_HDR_DDR)
+				cmd->cmd_data.cmd_lo |= COMMAND_PORT_CP |
+					COMMAND_PORT_CMD(I3C_CCC_ENTHDR(0)) |
+					COMMAND_PORT_SPEED(DW_I3C_HDR_DDR_SPEED);
+
+			if (i == (i3c_nxfers - 1))
+				cmd->cmd_data.cmd_lo |= COMMAND_PORT_TOC;
+		}
 	}
 
 	dw_i3c_master_enqueue_xfer(master, xfer);
@@ -1162,15 +1228,15 @@ static int dw_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
 	for (i = 0; i < i2c_nxfers; i++) {
 		struct dw_i3c_cmd *cmd = &xfer->cmds[i];
 
-		cmd->cmd_hi = COMMAND_PORT_ARG_DATA_LEN(i2c_xfers[i].len) |
+		cmd->cmd_data.cmd_hi = COMMAND_PORT_ARG_DATA_LEN(i2c_xfers[i].len) |
 			COMMAND_PORT_TRANSFER_ARG;
 
-		cmd->cmd_lo = COMMAND_PORT_TID(i) |
+		cmd->cmd_data.cmd_lo = COMMAND_PORT_TID(i) |
 			      COMMAND_PORT_DEV_INDEX(data->index) |
 			      COMMAND_PORT_ROC;
 
 		if (i2c_xfers[i].flags & I2C_M_RD) {
-			cmd->cmd_lo |= COMMAND_PORT_READ_TRANSFER;
+			cmd->cmd_data.cmd_lo |= COMMAND_PORT_READ_TRANSFER;
 			cmd->rx_buf = i2c_xfers[i].buf;
 			cmd->rx_len = i2c_xfers[i].len;
 		} else {
@@ -1179,7 +1245,7 @@ static int dw_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
 		}
 
 		if (i == (i2c_nxfers - 1))
-			cmd->cmd_lo |= COMMAND_PORT_TOC;
+			cmd->cmd_data.cmd_lo |= COMMAND_PORT_TOC;
 	}
 
 	dw_i3c_master_enqueue_xfer(master, xfer);
-- 
2.34.1

