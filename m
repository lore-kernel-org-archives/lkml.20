Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56EEA4D9540
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887443; cv=none; b=AKnMfVe7yRokcgRPRVWoNougxm5TQEb21R2qkprE+pt5I5URBuRKzKD9BQGrFV+HUdOw9YHh++Hu0dL0UDo8rjWRrIWtr+/DvmbLRlvsFQQN8UfubS+E2FX9uLcfwn/6fptiXXXBB/dGiHgkhSxIy6YE4HlbjjT7deQ13V0Ru4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887443; c=relaxed/simple;
	bh=9e6MEiIklGJfyndXhTPPr9nVDCPp6b5rGMxzkp0B7YM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RQwzp16yLOeakKB5rL1UhSiyYTe8V+gcbNXE7BnruxzTHKklHLYgL3NJDpPmCWIRk6XY5FK8I/6EXxz1N0PrNExIz9asbJSTPITgitwcUHaiLKuERrztzYMxAg95kl3XZu/8kC2zni0sO8BLCUjvxELOUtDA8M2Epar7UL9f/PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F9DDXyBx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WNjK4RS6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F9DDXyBx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WNjK4RS6"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8jiaZ989363
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:30:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vRfB3REly7l4Yt4+ScKAJ76g8z3HDR/+4IYPDuXkwL0=; b=F9DDXyBxTg4Q8Gsk
	f3hDD37cLqRM6RQHwVbJGGj/xPephT0QSlHtWSW87k0hRkr0djLTnqW823uAzb8E
	W+H7geety4BGl4qwat2G8Y/48YOxrgyyL4BwYHE78vfG28Pwu+t7ldZD3nXkrHad
	hmQaLt691wlCve/SUNVCEBKF3suRc8e2nq5KI71YC+vvhORrXvkoUdcE87L/a/tZ
	Btq4vyhw/X01Jrm7e6wDlC5QAL405C8CPCS3OjskN9IqmIMKbw/3kLP9ya9UPnzs
	2Fp0xMqr6Rvj20RY1sMBd102S1JlYDwzQjP65+01DPiUY6cvEj6qisiiXB1ISQpv
	B8rtvA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98hcaegp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:30:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ca9b53afaso780106385a.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791887439; x=1792492239; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vRfB3REly7l4Yt4+ScKAJ76g8z3HDR/+4IYPDuXkwL0=;
        b=WNjK4RS6OKQA79sa1aw9oAQd0UyOLeFnm4ZhJVkMLTm+W65+TSVzLfOjpGAx4348iB
         1pHeRSadG5ISSd6z0b+0X4xhjZNGanrYlqNtTxxTBkhoncFbVE3lB4CO2uh/VGnlExyV
         DDsuRi2fPbnmECjE42AAiGekDSgWGvo4nRpYzmEqWOF2thCMU8U1FAuR6uEer/XzJv67
         JcPm+daVD7GNYl6zWj6/0lms6PJGGYA29xrAoXKB8c6IxW4/kIWs244Esa7nj90ggoQ2
         HBJ65LGE7NUzHEEnN2RjjNnrMqCgNsqKuRjAtnNFVwzLa5ev5pG3S2YXS+7TrLHX+e2e
         kcoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791887439; x=1792492239;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vRfB3REly7l4Yt4+ScKAJ76g8z3HDR/+4IYPDuXkwL0=;
        b=IWMSgqugzGbOWPBfh5v2JRXtL8xSSWFTtc7U+2CU29JxnWjC0/KiIkmQmkW3sx9Hc/
         arnA6bzWAfrk9zCSngHa6YA/Chia4D4gt6ZIBThVu28xuQ9DpJYvezIG/sk4Noadn7by
         JyFWZCYL7ujihYkfO1t1w5crxYkgj696SRmIn1AdyJ9qTRlquauQ8fRcfR7jxIna2jNP
         OaAuBagcZCgi6bCVgQ9OJJWi7eLLCd4PYgfszYCt9FZkMv2+VwnjfDd+SCfqM7VfTUQz
         yz58YI1glwiR+2PLQo2jSPPAAURd+ZeSi/XY9Ht5CpRhWMGsLlPYprO+dr467t2/iNMp
         syZw==
X-Forwarded-Encrypted: i=1; AKwUvBzPx/NQW4wjKYndxOg0bW2j3lixuO7IwvMsIShlhdZB7MbVhfVxY0sTYH4m9WdBlKNTbK9ZIos2wgQeWP0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJyphN8bSs11aEhq1yRTQEQwZmzjYBLGtWkIJdB4jjVgKenh1EI
	Q4P6Pw7ZkbGKpdWmJwrGmj+Pc2qwA8JeOOx1ayelLGrG1uJtuG/rV7DC25H0vhrkru7SGr/ZDO+
	9/HBXparUDUTQL82tQJP7DD3Hde/K4e1Mb+9ZeiFqDJgTMzekYZoMyshMK/Z9qM7C90A=
X-Gm-Gg: AYBFou0rcmc6PEcExWKB9FgJ0X36ZRLUsrCyaKeRqanw8dQNCsp4k0tUYx9NZX059oe
	rI9D3hZeBpNkm7lX5IOTFHchDyxEfnqssz9k2HFqMW+icPpWPkOSPT29nfn9MvmumMuinaFajrG
	HeyI++xp4Af8X2daZL6pFceAn1oLuZCWeIy+U+l2tIQUqWrPfbcc+x0OybnRF5cm5s+iq3vVN49
	hJb5ImyjttnzrFWFmLxinS5qk/EMeyiV+CjvtlK4Xg/DW7aYP8Jf3/8NuKyPefsxcuC58tftwoX
	mPPdN7x5YoXr5suIqeBR0wD2NmM4aDnp6y2Rf+Yj9O/H2H16qCLrVtwLoVeJaaaj3wgb4WA92Cz
	iLn6uVVZH7khBBIaB492At7hYOOerA5abCZQz14Xy8VBA6JxeEg5kT1Pw5tNh0Tfe1HvdIE0tzK
	QXsSkntdit8CdEDxP0/ZZ+/ftrzmjuGAC32joS1iUUTiWFBsiSVic=
X-Received: by 2002:a05:620a:2989:b0:93b:fde4:4923 with SMTP id af79cd13be357-93ebd2a0815mr1925320985a.63.1791887436820;
        Tue, 13 Oct 2026 03:30:36 -0700 (PDT)
X-Received: by 2002:a05:620a:2989:b0:93b:fde4:4923 with SMTP id af79cd13be357-93ebd2a0815mr1925306985a.63.1791887435261;
        Tue, 13 Oct 2026 03:30:35 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:d108:3895:812b:662a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be964dfsm349955115e9.7.2026.10.13.03.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:30:33 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:30:28 +0200
Subject: [PATCH v2 4/6] i2c: qcom-cci: Add burst write support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-cci-imp-v2-4-6873326b44a3@oss.qualcomm.com>
References: <20261013-cci-imp-v2-0-6873326b44a3@oss.qualcomm.com>
In-Reply-To: <20261013-cci-imp-v2-0-6873326b44a3@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MSBTYWx0ZWRfX8lzL8DPa6Moq
 4nbxIZv+Z7rqGLbLUU1OQGD2c+anYyH0hyGT4/ZiBViJ+3fnLXmdv3yNBb87Ud5UonADd4hRMiM
 USaiHAI8Wt08gXqjVwOocawjz1/WbR354KfQ2gxljkTjkHq9ORmiL9mtmJ01qNqQ9XdlB3PMePo
 Q1RZSVES9fd1NbBg9jB5/MnTlqZxNsVHxqoHLXzFHjajE0JQR9r98TpY7pZj0mvBGIZnDmaYn4K
 /MYw5ddz8MHCC6Wubv3tw4sgPSbL7h2gCf33GVU42ihAqS6VnlNQ3VtAHUR4Ex2RGcloVNHDx9Y
 qhfFWt5mrESEz9VBv3PcZgcgmjuaCuRXS2x6P3lTiIkeAR4dUjE5mIlTy80TmbfdBkCKJYn5Fjc
 6vlzOx1b/4SJ9lcQZt5FkT4mWakS1wCdnc4l2khaBRgj8CuxiISOCSv39046FGX2jsNGx91Fz6/
 NFarr9tmuy6IqC2XYSg==
X-Authority-Analysis: v=2.4 cv=VPVIDNPX c=1 sm=1 tr=0 ts=6ace0850 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=uN0qKeaNodZ6YgCSxmEA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: pzeZ_NU_75kQUc_GtzmZZKy4jy3vtykC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MSBTYWx0ZWRfX+7E9af9imRbr
 8PXQragx6AIno6A7SNkb/BOYLoQJ+2WqbNXxAA2GSGkK6B5h0H5u98OCpU7j1QPR/YX8UuknYMc
 eJwR7WBUxRlTzDn7Uw4nrvXqM+juwFk=
X-Proofpoint-GUID: pzeZ_NU_75kQUc_GtzmZZKy4jy3vtykC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130041

A single CCI_I2C_WRITE command can only carry up to 11 bytes,
so every i2c write was capped at that size via i2c max_write
quirk.

CCI v1.2 introduces burst mode support, where consecutive
write commands (marked as burst) run back-to-back as a single
transfer.

Use this in cci_i2c_write() to allow longer writes across the
whole queue instead of a single command's payload, and raise
max_write_len accordingly for every CCI revision that supports
burst mode.

unlock/lock commands are required to ensure the commands for
a given transfer are executed atomically.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 44 +++++++++++++++++++++++++++++++--------
 1 file changed, 35 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 3bca29f1d2699375a0348b18a5a2e646a59fd94c..27bbd1e196f9c55c1af14168b83eb6e6d51c75ed 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -86,14 +86,24 @@
 #define NUM_QUEUES	2
 
 #define CCI_I2C_SET_PARAM	1
+#define CCI_I2C_LOCK		6
+#define CCI_I2C_UNLOCK		7
 #define CCI_I2C_REPORT		8
 #define CCI_I2C_WRITE		9
 #define CCI_I2C_READ		10
 
+#define CCI_I2C_REPORT_IRQ_EN	BIT(8)
+
 #define CCI_I2C_WRITE_WC	3
+#define CCI_I2C_WRITE_MAX_LEN	(CCI_I2C_WRITE_WC * sizeof(u32) - 1)
 #define CCI_I2C_WRITE_NWORDS(len) DIV_ROUND_UP((len) + 1, sizeof(u32))
+#define CCI_I2C_WRITE_BURST	0xf
+#define CCI_I2C_BURST_OVERHEAD	4 /* LOCK + SET_PARAM + UNLOCK + REPORT */
 
-#define CCI_I2C_REPORT_IRQ_EN	BIT(8)
+/* Largest write that can be bursted through a queue of @qsize words */
+#define CCI_I2C_BURST_MAX_LEN(qsize)					\
+	(((qsize) - CCI_I2C_BURST_OVERHEAD) / CCI_I2C_WRITE_WC *	\
+	 CCI_I2C_WRITE_MAX_LEN)
 
 enum {
 	I2C_MODE_STANDARD,
@@ -521,14 +531,15 @@ static int cci_i2c_read(struct cci *cci, u16 master,
 	return 0;
 }
 
-static void cci_i2c_load_write(u8 *buf, u16 len, void __iomem *loadq)
+static void cci_i2c_load_write(void __iomem *loadq, u8 *buf, u16 len, bool burst)
 {
 	u32 cmd[CCI_I2C_WRITE_WC] = { };
 
-	if (WARN_ON(len >= CCI_I2C_WRITE_WC * sizeof(u32)))
+	if (WARN_ON(len > CCI_I2C_WRITE_MAX_LEN ||
+		    (burst && len != CCI_I2C_WRITE_MAX_LEN)))
 		return;
 
-	cmd[0] = CCI_I2C_WRITE | len << 4;
+	cmd[0] = CCI_I2C_WRITE | (burst ? CCI_I2C_WRITE_BURST : len) << 4;
 	memcpy((u8 *)cmd + 1, buf, len);
 	iowrite32_rep(loadq, cmd, CCI_I2C_WRITE_NWORDS(len));
 }
@@ -537,9 +548,12 @@ static int cci_i2c_write(struct cci *cci, u16 master,
 			 u16 addr, u8 *buf, u16 len)
 {
 	void __iomem *loadq = cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, QUEUE_0);
+	bool burst = len > CCI_I2C_WRITE_MAX_LEN;
 	int ret;
 	u32 val;
 
+	dev_dbg(cci->dev, "master %d write: len=%u\n", master, len);
+
 	/*
 	 * Call validate queue to make sure queue is empty before starting.
 	 * This is to avoid overflow / underflow of queue.
@@ -548,10 +562,22 @@ static int cci_i2c_write(struct cci *cci, u16 master,
 	if (ret < 0)
 		return ret;
 
+	if (burst)
+		writel(CCI_I2C_LOCK, loadq);
+
 	val = CCI_I2C_SET_PARAM | (addr & 0x7f) << 4;
 	writel(val, loadq);
 
-	cci_i2c_load_write(buf, len, loadq);
+	do {
+		u16 to_write = min_t(u16, len, CCI_I2C_WRITE_MAX_LEN);
+
+		len -= to_write;
+		cci_i2c_load_write(loadq, buf, to_write, len > 0);
+		buf += to_write;
+	} while (len);
+
+	if (burst)
+		writel(CCI_I2C_UNLOCK, loadq);
 
 	val = CCI_I2C_REPORT | CCI_I2C_REPORT_IRQ_EN;
 	writel(val, loadq);
@@ -713,7 +739,7 @@ static const struct cci_data cci_hw_catalog[] = {
 		.max_mode = I2C_MODE_FAST_PLUS,
 		.queue_size = { 64, 16 },
 		.quirks = {
-			.max_write_len = 11,
+			.max_write_len = CCI_I2C_BURST_MAX_LEN(64),
 			.max_read_len = 12,
 		},
 	},
@@ -722,7 +748,7 @@ static const struct cci_data cci_hw_catalog[] = {
 		.max_mode = I2C_MODE_FAST_PLUS,
 		.queue_size = { 128, 32 },
 		.quirks = {
-			.max_write_len = 11,
+			.max_write_len = CCI_I2C_BURST_MAX_LEN(128),
 			.max_read_len = 12,
 		},
 	},
@@ -731,7 +757,7 @@ static const struct cci_data cci_hw_catalog[] = {
 		.max_mode = I2C_MODE_FAST_PLUS,
 		.queue_size = { 128, 32 },
 		.quirks = {
-			.max_write_len = 11,
+			.max_write_len = CCI_I2C_BURST_MAX_LEN(128),
 			.max_read_len = 12,
 		},
 	},
@@ -740,7 +766,7 @@ static const struct cci_data cci_hw_catalog[] = {
 		.max_mode = I2C_MODE_FAST_PLUS,
 		.queue_size = { 1024, 32 },
 		.quirks = {
-			.max_write_len = 11,
+			.max_write_len = CCI_I2C_BURST_MAX_LEN(1024),
 			.max_read_len = 12,
 		},
 	},

-- 
2.34.1

