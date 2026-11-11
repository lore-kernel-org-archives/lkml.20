Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.158.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794363137;
	b=oXsfuqUVfSw0qtaTC2c+23jq67z6eXpI/XWnm48GTbW3ben8Ek9kvUuw7yi5sjCWe0eU
	 1O6DCzLcsKmK5JJXxw/J4F/ORBjlsLWslHynzy4jPe/SDwKoJi2/tfh35Umac2iwuFTYM
	 8IhjewMcXZXiXUpaBEGhP33GqLngFH/6NaGgO45rob+Ht4hIxCRWIIEH9EGItAHPyOsaN
	 mY0AZrRw1j6a+QKrtPfGtCWWjQ8locRw2Mt1+eAV/87jL52FxF4sp8AOvB8D5o6KY/F2D
	 FhhRyjusnOUjkRM4+fUfBQZWvjW2s/Zzs+v3n6Wk8RsHnJnwlUCHRZS9QhABbuVbyNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794363137;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-SNPS-Relay:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qvUqrU4fec6L7/JMRT3UFkPpzmbLsrCf6gtFOY022kQ=;
	b=oLrFVuGfduE0cYjSxZ2FQiwO3oSQlUSGTPrdYq9/gaOiuM4cBAnGCuv2+pFJ06vgQDdH
	 y/uIUDuC0j3goWT7QnaYhR0Kl9p0eG9dzZTidIHv46KiQbDKbdTryhSA9cOqmH2XGtZ+Y
	 3DMBQmKw2377Jg60Nucyays9M61Wc5bqSk1zZc5lam087BqPJ6izCCWLPy8DI7YnV986y
	 Rpoz9ob+omoXq7gDNb/jhNygq6tP8KfEDZhH+qhhY3lvwhakh4WjSv1DN0kNzyP6PcFnz
	 ndq7UAEFxT0vtFi5Cr8wcHd5pvDZnGbZ07rdAu+bM2LpiUN7S9tordp8ib+YNv0VjSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=synopsys.com;
	spf=pass smtp.mailfrom=synopsys.com;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=TFjypjka;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=SGsvb1j4;
	arc=none smtp.remote-ip=148.163.158.9
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15478606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:12:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15478606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=TFjypjka;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=SGsvb1j4
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB1vjGI105268;
	Tue, 10 Nov 2026 18:12:00 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pfptdkimsnps; bh=qvUqrU4f
	ec6L7/JMRT3UFkPpzmbLsrCf6gtFOY022kQ=; b=TFjypjkaWep+OgHW5D2TEFeb
	FXMOckcApLejqz3+X1fTT2PTfWE3I18asdeE31uzMXhQomIvgIy6GAJixmdovbEV
	A5Bu+zSFO3soAhx+wU2kbX3J6aDnan4N7feJ9DhSeegTOmF3DM/A+QkOVCTR7T/b
	YJbmAUHAit2ReTZtgU21Ut+PLlfd9EbdvXYvOE3Arb38hmAl0j6iJl7mKBn7QOtw
	EB07LWpsd5+OIDgLcj6TVQRItl8huBSbYV8BRBVV7kyTCD/Pw871bAzyDoX9AYJ8
	rsp0PuNbJk6/iVliINP92kVCbUKXw8yQtvz6P5kkUHWB6dJJ1atX3l/iR5OFKQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4hv6ypbqpb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Nov 2026 18:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1794363119; bh=Z4Eu8lEbXj4Q2sh57UImvHC2PzcM8RTnhlI+KZBLI9g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SGsvb1j43p7Mx+HgUJrkvv84oiwrMiDq1rDAerCg1tTkaeOSGrZftd8lJSS/2lR4o
	 Md/BLteYjIBkmsIjMuhK44ax7BkqfaEMu9zIQG+FelpZHlwAmic/zJ/Mq1B2F2dd8X
	 m1t8IAZLlgJPckH0mQGmHpOW479PNCxS6ox4RoCvjFrVq58qsSIt//sHI8bPh02Vm9
	 cp6+tG5z0/XZGgNXFuLVr1l/l3FLbbXp4qwsRVT44iuNCAF+6oXE55eyQThPsOVMeI
	 k7dDl5J6f4Qi/JQXY5e1WOEdWbs6XoVP4jt7i0sEj9qFjnEDw64/TQFk1xNntuzZGE
	 L2U88TA/y/TMQ==
Received: from mailhost.synopsys.com (eudc-mailhost2.synopsys.com [10.213.161.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3996540693;
	Wed, 11 Nov 2026 02:11:58 +0000 (UTC)
Received: from Ubuntu.internal.synopsys.com (unknown [10.150.8.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mailhost.synopsys.com (Postfix) with ESMTPSA id 489C0C129A;
	Wed, 11 Nov 2026 02:11:55 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Dineshkumar Parameswaran <Dineshkumar.Parameswaran@synopsys.com>
To: Dineshkumar.Parameswaran@synopsys.com
Cc: Frank.Li@nxp.com, alexandre.belloni@bootlin.com,
        linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
        Dineshkumar Parameswaran <Dineshkumar.Parameswaran@synopsys.com>
Subject: [PATCH v3] i3c: master: dw-i3c-master: Add HDR-DDR support to Designware Controller.
Date: Wed, 11 Nov 2026 07:41:51 +0530
Message-Id: <20261111021151.58380-1-parame@synopsys.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261101005243.4739-1-parame@synopsys.com>
References: <20261101005243.4739-1-parame@synopsys.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAwOCBTYWx0ZWRfX4dZE6dKtVxcH
 6+hDc5Qwlpv7Wh/Ju16/7txpj0ZuIjIDASx4wpBhkWXLvTxt5UFnp0YpB4RMaMLUo9SVX/0yDyO
 KOqJcptv7MOExSwNDOl066nxeLvdVlbtOHhFfu2qzYxIg33t+aL8pl6nqlSrXgtxK7/kyyy/eiB
 LioC9pYdkKKvX+8FYDOHGhu7D8ssPjMHYj5hHNwbtgjGYVK9mmxT3VF0gjWTM7+tYkFOKwOqbVy
 TDUd/d3i8jgXg3blvszNntGnDXJTC75jJG6OE5AVkvX1lBUOosAM5zYjtwDZf5yonKzsHSQHHAB
 +t+NCwRyXXa3q2XsZew5iyY2UVA5iIVheWTfX79vhCzAWdTvWR5saWU4j+QBQETVcywck6OrFHr
 /bXEup3ZPZYycqSzmxDF3nzABtVgBWKLssBsKbNMH1OKycO+oUeOJTPyqfA7RwiMc7BMiGV/4zn
 ERDxV0uzV1wSTTU6XXg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAwOCBTYWx0ZWRfX3Bp4I5wFLDMx
 3EOSpGMAhr+j2EZ3vlAtELe74hZvYot/7Ai2ZkjUr0BQZg7K/kzLMeeCYhvGJuJsiS5B3Wql2vV
 NKOuBFd97a3i+K4Lj8ACui51ygLMjZs=
X-Authority-Analysis: v=2.4 cv=Y6ptIReN c=1 sm=1 tr=0 ts=6af3ceef cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=zJRp6_cAMcgA:10 a=qPHU084jO2kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22 a=jIQo8A4GAAAA:8
 a=fP0m63MfXcOeATsXSlwA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
X-Proofpoint-GUID: b_Y-wSIjn9MBMccKRU9DVI7H921_fdXq
X-Proofpoint-ORIG-GUID: b_Y-wSIjn9MBMccKRU9DVI7H921_fdXq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 impostorscore=0 phishscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2611040001 definitions=main-2611110008

Implement HDR-DDR transfer support for the DesignWare Controller.
Only support for private transfers and does not support sending CCC
commands in HDR mode.

Key differences:
- Sets the speed to HDR_DDR_SPEED(6) and COMMAND_PORT_CP to do
data transfer in HDR-DDR mode. Hardware will generate the ENTHDR0
based on this.
- HDR exit pattern will generated from the hardware when it sees
the TOC on HDR-DDR mode.

Signed-off-by: Dineshkumar Parameswaran <parame@synopsys.com>
---
changes in v3:
- Updated commit message.
- Sets the HDR-DDR Read and Write based on cmd.

 drivers/i3c/master/dw-i3c-master.c | 29 ++++++++++++++++++++++++-----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 05584ddaf104..d4a0b1d316a9 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -65,6 +65,8 @@
 #define COMMAND_PORT_DEV_COUNT(x)	(((x) << 21) & GENMASK(25, 21))
 #define COMMAND_PORT_ADDR_ASSGN_CMD	0x03
 
+#define HDR_DDR_CMD_READ		0x80
+
 #define RESPONSE_QUEUE_PORT		0x10
 #define RESPONSE_PORT_ERR_STATUS(x)	(((x) & GENMASK(31, 28)) >> 28)
 #define RESPONSE_NO_ERROR		0
@@ -232,6 +234,8 @@
 #define I3C_BUS_I2C_FMP_TLOW_MIN_NS	500
 #define I3C_BUS_THIGH_MAX_NS		41
 
+#define DW_I3C_HDR_DDR_SPEED	6
+
 #define XFER_TIMEOUT (msecs_to_jiffies(1000))
 #define RPM_AUTOSUSPEND_TIMEOUT 1000 /* ms */
 
@@ -381,6 +385,11 @@ static void dw_i3c_master_read_ibi_fifo(struct dw_i3c_master *master,
 	i3c_readl_fifo(master->regs + IBI_QUEUE_STATUS, bytes, nbytes);
 }
 
+static bool dw_cmd_is_read(u32 rnw_cmd, enum i3c_xfer_mode mode)
+{
+	return (mode == I3C_HDR_DDR) ? (rnw_cmd & HDR_DDR_CMD_READ) : rnw_cmd;
+}
+
 static struct dw_i3c_xfer *
 dw_i3c_master_alloc_xfer(struct dw_i3c_master *master, unsigned int ncmds)
 {
@@ -726,6 +735,8 @@ static int dw_i3c_master_bus_init(struct i3c_master_controller *m)
 	memset(&info, 0, sizeof(info));
 	info.dyn_addr = ret;
 
+	info.hdr_cap = I3C_CCC_HDR_MODE(I3C_HDR_DDR);
+
 	ret = i3c_master_set_info(&master->base, &info);
 	if (ret)
 		goto rpm_out;
@@ -995,28 +1006,36 @@ static int dw_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
 	}
 
 	for (i = 0; i < i3c_nxfers; i++) {
+		u32 rnw_cmd = (mode == I3C_SDR) ? i3c_xfers[i].rnw : i3c_xfers[i].cmd;
+		bool rnw = dw_cmd_is_read(rnw_cmd, mode);
 		struct dw_i3c_cmd *cmd = &xfer->cmds[i];
 
 		cmd->cmd_hi = COMMAND_PORT_ARG_DATA_LEN(i3c_xfers[i].len) |
 			COMMAND_PORT_TRANSFER_ARG;
 
-		if (i3c_xfers[i].rnw) {
+		if (rnw) {
 			cmd->rx_buf = i3c_xfers[i].data.in;
 			cmd->rx_len = i3c_xfers[i].len;
-			cmd->cmd_lo = COMMAND_PORT_READ_TRANSFER |
-				      COMMAND_PORT_SPEED(dev->info.max_read_ds);
+			cmd->cmd_lo = COMMAND_PORT_READ_TRANSFER;
 
 		} else {
 			cmd->tx_buf = i3c_xfers[i].data.out;
 			cmd->tx_len = i3c_xfers[i].len;
-			cmd->cmd_lo =
-				COMMAND_PORT_SPEED(dev->info.max_write_ds);
 		}
 
 		cmd->cmd_lo |= COMMAND_PORT_TID(i) |
 			       COMMAND_PORT_DEV_INDEX(data->index) |
 			       COMMAND_PORT_ROC;
 
+		if (mode == I3C_HDR_DDR) {
+			cmd->cmd_lo |= COMMAND_PORT_CMD(rnw_cmd) | COMMAND_PORT_CP |
+				COMMAND_PORT_SPEED(DW_I3C_HDR_DDR_SPEED);
+		} else {
+			cmd->cmd_lo |= (i3c_xfers[i].rnw) ?
+				COMMAND_PORT_SPEED(dev->info.max_read_ds) :
+				COMMAND_PORT_SPEED(dev->info.max_write_ds);
+		}
+
 		if (i == (i3c_nxfers - 1))
 			cmd->cmd_lo |= COMMAND_PORT_TOC;
 	}
-- 
2.34.1

