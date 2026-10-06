Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2C738AC65
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 22:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791326422; cv=none; b=BwVn0VOBwIfDNTH1okcuJcRNo604XTkNBKoznrlCVZcnomL+9Ee0Y4f7XDaexKXky+0uRdavjqrWPpw/IILQVIYLCMEKYK4WynHB5bDoViqf5ZqcbFMR7e3Z5f2HvObd3iBhdCRrcIWYO3i5IOgBP7NDbTydtKMtE96i8DK+UrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791326422; c=relaxed/simple;
	bh=uDS6NvY8BydQd9wkPnACmgK57QWetEzA7V9PprntK80=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jQor47ZcHi8I70Da1z4eIecE8ff+30kM4xISv0eiGCSC0ocb/GoZ9htxU+HHIiKsTb2XtbXQ94E5h7G7CeMHBdgzJzzHswQX6114zLninG754P+87M9Dd93rVRq2pu1HDcN04T/jbkZqvE6SI17xNVcHJp0iVT749PP6Oh1yAZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VzuMlf37 reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VzuMlf37"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696LeINr1029248
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 22:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=m4ORaHtDwfe
	CfMgQMt1tP0MTGtzn5BYz/KuLtEclmYg=; b=VzuMlf37JD7yC/Dm7mFDgo7tfG4
	wtCyvrDB/DTVq2LlQ6/fdxGdmJAGRlEXDvnNrlGQeG1Mq7IDeBE5bB3hXTbPW4KD
	0wuOumv+Vngy9Ox6k/D178Gp+RzunWbZcID0dpgXPshzEy228GqtHG0QfWOlIWeU
	lGiBBb44pJ5eDchwnuK3/rcXXffptcveTzipBCUxtp4AKKZgUwCni091GA6ebAkQ
	R1Q25wabvx9Dmf693Y5tRCLWbsOJ90EKA4lpMoux8MznQI7t8sjV9lU0fz7dU5wm
	jxaPq91v4DIbd0DG2WSB4QH1xDtzV40VpoBq0nK3f5brdQ91ntinEHmHHyA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h53ashtx9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 22:40:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a3f673221so865108885a.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 15:40:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326417; x=1791931217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m4ORaHtDwfeCfMgQMt1tP0MTGtzn5BYz/KuLtEclmYg=;
        b=LeT17uzuiYKCGJOXEX6yVGPh1OVGL+iiWV9nAWhFzXaPBPu7pH9mXXpEiPzKFP1LIa
         qc0YZNDaNY6JduzM4JG888TEupHCVyy5pU6iIrTWhS8OF/tN/Whl/4zVDK9bnBBdJYFL
         HUSUiLWtEn3EQt+MX+rmcUw4rNhNSd7AskoaxmV+lQ4zCnWr9F7OLguZ1PM1zL85O2LQ
         usbiW32TSg76N9/4llQQkKU/E9BZahMhmKQ+P+eil/+vJsKLSJPIeG5dHwzOd3WVmyzS
         5DDde+kieIA9Rz42mdvN3v2c9kpC0lADCZ6ltII8CZueeVH+46a3XZZHZSgJGb21OwMR
         IFKw==
X-Forwarded-Encrypted: i=1; AKwUvBz310smMx+OOVCaioCr7Wqye4YtfAvTMViefSj5ER0MaLDmEYR8px0hO1mSqf1yEumSPN3Po6P4RWtxdF4=@vger.kernel.org
X-Gm-Message-State: AFuF++mJ9KdkE3HxxZYCnwr6MWG1SAEUVCa6KB5S6/15aS6pn8ll/0i2
	W89n4D3ov+ZlPD18xlE5lEWewHc8+JGIRS1Jlqwebibs3lGZ7+Emhrn/nJ4k9zc9lfcEQt+q05K
	4pfvUydHOhJwpqc1QEklNuPE6he/d4WtIWiwF+HgiP2IcAgajceDnNVbETtZH62H1ZKU=
X-Gm-Gg: AYBFou2f9HXRethcfWe7D35jcRidKRyV7q+9WqFvo6/e0kxbQMKxq7GhiS2XRDESW7L
	VO/ozUcMNaoyYQvPlh6ub1AGnWST/Lh0l52tB8bhShZgo2rloE6iCLmnKFkeVz9nojypzEkks/z
	zDM0cH20ByG7MNk5mkY+fXuctAtQ1Z+4oDxweyhz56QR+Fu1A3OVZWM8bqfaGMXqWBNzMNj1Wiq
	BwwlwSQV0Fwc/4U9+IyDCkmLMcdKLiRpd7nM0+B66u2OsJlMnjGbLBvaMJMeNaNq9fUqC6rvGAx
	K4GDLfeKX0KIIdY9Dt5kaBGHnVVsg6Wtak6ANk97/oaZFQnbGBXZifaElGc=
X-Received: by 2002:a05:620a:26a9:b0:93c:75f3:e146 with SMTP id af79cd13be357-93e9b775eeemr72709685a.33.1791326416989;
        Tue, 06 Oct 2026 15:40:16 -0700 (PDT)
X-Received: by 2002:a05:620a:26a9:b0:93c:75f3:e146 with SMTP id af79cd13be357-93e9b775eeemr72706485a.33.1791326416464;
        Tue, 06 Oct 2026 15:40:16 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:40:15 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        hariram.purushothaman@oss.qualcomm.com, pshrotri@qti.qualcomm.com,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        johannes.goede@oss.qualcomm.com, konradybcio@kernel.org
Subject: [PATCH 02/45] media: qcom: camss: add CSID gen2 pixel path
Date: Wed,  7 Oct 2026 01:39:10 +0300
Message-Id: <20261006223953.3382273-3-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: mTB8uGu23ihx4AYDBn5iFQjOWnTg_Bex
X-Proofpoint-GUID: mTB8uGu23ihx4AYDBn5iFQjOWnTg_Bex
X-Authority-Analysis: v=2.4 cv=Xt5vqlF9 c=1 sm=1 tr=0 ts=6ac578d2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=AbziWl0U1wrX0ujR5T4A:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX28YLyKt4jMrQ
 muEO9hiAw/vgx5acsPEr77w7IfvQ2RZhLGuUnpxW/KRgQi9AREHCd21W6auxfCqKbwoBjN7dHZ3
 Qn42IOy0lTn1gJh/XgQtCqD1Tm2bWQYUmYzkrNj/G2221hK5CDJGG8gGNvt6PyfkHVedAskanC3
 JD60FkV4twuBYOyf6vJOI5CdCtWWuvLc0OMJNlrmIOSs6fR6/QzAVRG/caTeNIavjgWsHYOIcu7
 b3lgnByaYSeAkIbaDHC9/dJBa0meCIUrVK3j1/rwMDRLwG4sKhsT2EJqHM009wVtoj6SISBgpri
 lFvLG2bUdgIG3McdLSFjDRaCIrL9Nq6QGN47wbwdw4SbvXMR5XbfWtyfC3pVnSjT3folAYdAa7V
 +gV4AdJ15+c2m2ZkV4iLD3qhH09vaofuoyJB5K67ZMeROIRkUIZyW0oG0LfA2+DXKF57JN8JXYk
 VU05kSVu+cZFEhJDX+g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX1WdQevQVQuqv
 YgYcIyhZ5yL9Gf6fO9ars2HTVM7+pJEWqin3+3eXHxD0C0a7EK1vKj/oGTJdSnKRZ7vd6WeQ9Km
 lbDT4FP5SX/bMAOivCZAYI4lBps9wAE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 impostorscore=0 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060090

From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

Add IPP register programming and interrupt handling for the full-frame
pixel output on non-lite gen2 CSID. Use stream 3 for the pixel path and
expose all four output routes.

Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../platform/qcom/camss/camss-csid-gen2.c     | 158 +++++++++++++++++-
 .../media/platform/qcom/camss/camss-csid.c    |  13 +-
 2 files changed, 152 insertions(+), 19 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
index 3af043c38786..72a2b7fc5dd0 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
@@ -12,6 +12,8 @@
 #include <linux/kernel.h>
 #include <linux/of.h>
 
+#include <media/mipi-csi2.h>
+
 #include "camss-csid.h"
 #include "camss-csid-gen2.h"
 #include "camss.h"
@@ -22,6 +24,36 @@
  * alternate register layout.
  */
 
+#define CSID_PIX_STREAM_ID	3
+
+static bool csid_is_pix_stream(struct csid_device *csid, u8 stream_id)
+{
+	return stream_id == CSID_PIX_STREAM_ID && !csid_is_lite(csid);
+}
+
+static u8 csid_pix_dt_to_decode_format(u8 dt)
+{
+	switch (dt) {
+	case MIPI_CSI2_DT_RAW6:
+		return DECODE_FORMAT_UNCOMPRESSED_6_BIT;
+	case MIPI_CSI2_DT_YUV422_8B:
+	case MIPI_CSI2_DT_RAW8:
+		return DECODE_FORMAT_UNCOMPRESSED_8_BIT;
+	case MIPI_CSI2_DT_RAW10:
+		return DECODE_FORMAT_UNCOMPRESSED_10_BIT;
+	case MIPI_CSI2_DT_RAW12:
+		return DECODE_FORMAT_UNCOMPRESSED_12_BIT;
+	case MIPI_CSI2_DT_RAW14:
+		return DECODE_FORMAT_UNCOMPRESSED_14_BIT;
+	case MIPI_CSI2_DT_RAW16:
+		return DECODE_FORMAT_UNCOMPRESSED_16_BIT;
+	case MIPI_CSI2_DT_RAW20:
+		return DECODE_FORMAT_UNCOMPRESSED_20_BIT;
+	default:
+		return DECODE_FORMAT_PAYLOAD_ONLY;
+	}
+}
+
 #define CSID_RST_STROBES	0x10
 #define		RST_STROBES	0
 
@@ -120,6 +152,33 @@
 #define CSID_RDI_RPP_LINE_DROP_PERIOD(rdi)		((csid_is_lite(csid) ? 0x230 : 0x330)\
 							+ 0x100 * (rdi))
 
+#define CSID_IPP_CFG0		0x200
+#define		IPP_CFG0_FMT_MEASURE_EN		0
+#define		IPP_CFG0_TIMESTAMP_EN		1
+#define		IPP_CFG0_DECODE_FORMAT		12
+#define		IPP_CFG0_DATA_TYPE		16
+#define		IPP_CFG0_VIRTUAL_CHANNEL	22
+#define		IPP_CFG0_DT_ID			27
+#define		IPP_CFG0_ENABLE			31
+
+#define CSID_IPP_CFG1		0x204
+#define		IPP_CFG1_MIN_HBI		4
+
+#define CSID_IPP_CTRL		0x208
+#define		IPP_CTRL_HALT_CMD		0
+#define		IPP_CTRL_HALT_MASTER_SEL	4
+#define			HALT_MASTER_SEL_IPP	3
+
+#define CSID_IPP_FRM_DROP_PATTERN	0x20c
+#define CSID_IPP_FRM_DROP_PERIOD		0x210
+#define CSID_IPP_IRQ_SUBSAMPLE_PATTERN	0x214
+#define CSID_IPP_IRQ_SUBSAMPLE_PERIOD	0x218
+#define CSID_IPP_LINE_DROP_PATTERN	0x22c
+#define CSID_IPP_LINE_DROP_PERIOD	0x230
+
+#define CSID_CSI2_IPP_IRQ_STATUS	0x30
+#define CSID_CSI2_IPP_IRQ_CLEAR		0x38
+
 #define CSID_TPG_CTRL		0x600
 #define		TPG_CTRL_TEST_EN		0
 #define		TPG_CTRL_FS_PKT_EN		1
@@ -203,6 +262,64 @@ static void __csid_ctrl_rdi(struct csid_device *csid, int enable, u8 rdi)
 	writel_relaxed(val, csid->base + CSID_RDI_CTRL(rdi));
 }
 
+static void __csid_ctrl_pix(struct csid_device *csid, int enable)
+{
+	u32 val;
+
+	if (enable)
+		val = HALT_CMD_RESUME_AT_FRAME_BOUNDARY << IPP_CTRL_HALT_CMD;
+	else
+		val = HALT_CMD_HALT_AT_FRAME_BOUNDARY << IPP_CTRL_HALT_CMD;
+	writel_relaxed(val, csid->base + CSID_IPP_CTRL);
+
+	if (!enable) {
+		writel_relaxed(~0, csid->base + CSID_CSI2_IPP_IRQ_CLEAR);
+		writel_relaxed(1 << IRQ_CMD_CLEAR, csid->base + CSID_IRQ_CMD);
+	}
+}
+
+static void __csid_configure_pix(struct csid_device *csid, u8 enable, u8 vc, u8 dt)
+{
+	u32 val;
+
+	val = 1 << IPP_CFG0_FMT_MEASURE_EN;
+	val |= 1 << IPP_CFG0_TIMESTAMP_EN;
+	val |= csid_pix_dt_to_decode_format(dt) << IPP_CFG0_DECODE_FORMAT;
+	val |= dt << IPP_CFG0_DATA_TYPE;
+	val |= vc << IPP_CFG0_VIRTUAL_CHANNEL;
+	val |= CSID_PIX_STREAM_ID << IPP_CFG0_DT_ID;
+	writel_relaxed(val, csid->base + CSID_IPP_CFG0);
+
+	val = 4 << IPP_CFG1_MIN_HBI;
+	writel_relaxed(val, csid->base + CSID_IPP_CFG1);
+
+	val = 1;
+	writel_relaxed(val, csid->base + CSID_IPP_FRM_DROP_PERIOD);
+
+	val = 0;
+	writel_relaxed(val, csid->base + CSID_IPP_FRM_DROP_PATTERN);
+
+	val = 1;
+	writel_relaxed(val, csid->base + CSID_IPP_IRQ_SUBSAMPLE_PERIOD);
+
+	val = 0;
+	writel_relaxed(val, csid->base + CSID_IPP_IRQ_SUBSAMPLE_PATTERN);
+
+	val = 1;
+	writel_relaxed(val, csid->base + CSID_IPP_LINE_DROP_PERIOD);
+
+	val = 0;
+	writel_relaxed(val, csid->base + CSID_IPP_LINE_DROP_PATTERN);
+
+	val = HALT_MASTER_SEL_IPP << IPP_CTRL_HALT_MASTER_SEL;
+	val |= HALT_CMD_RESUME_AT_FRAME_BOUNDARY << IPP_CTRL_HALT_CMD;
+	writel_relaxed(val, csid->base + CSID_IPP_CTRL);
+
+	val = readl_relaxed(csid->base + CSID_IPP_CFG0);
+	val |= enable << IPP_CFG0_ENABLE;
+	writel_relaxed(val, csid->base + CSID_IPP_CFG0);
+}
+
 static void __csid_configure_testgen(struct csid_device *csid, u8 enable, u8 port, u8 vc)
 {
 	struct csid_testgen_config *tg = &csid->testgen;
@@ -337,9 +454,16 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 			if (tg->enabled)
 				__csid_configure_testgen(csid, enable, i, 0);
 
-			__csid_configure_rdi_stream(csid, enable, i, 0, format->data_type);
-			__csid_configure_rx(csid, &csid->phy, 0);
-			__csid_ctrl_rdi(csid, enable, i);
+			if (csid_is_pix_stream(csid, i)) {
+				__csid_configure_pix(csid, enable, 0, format->data_type);
+				__csid_configure_rx(csid, &csid->phy, 0);
+				__csid_ctrl_pix(csid, enable);
+			} else {
+				__csid_configure_rdi_stream(csid, enable, i, 0,
+							    format->data_type);
+				__csid_configure_rx(csid, &csid->phy, 0);
+				__csid_ctrl_rdi(csid, enable, i);
+			}
 		}
 }
 
@@ -355,20 +479,31 @@ static void csid_enable_stream(struct csid_device *csid, u32 stream_id, u8 vc, u
 	if (tg->enabled)
 		__csid_configure_testgen(csid, 1, stream_id, vc);
 
-	__csid_configure_rdi_stream(csid, 1, stream_id, vc, dt);
-	__csid_ctrl_rdi(csid, 1, stream_id);
+	if (csid_is_pix_stream(csid, stream_id)) {
+		__csid_configure_pix(csid, 1, vc, dt);
+		__csid_ctrl_pix(csid, 1);
+	} else {
+		__csid_configure_rdi_stream(csid, 1, stream_id, vc, dt);
+		__csid_ctrl_rdi(csid, 1, stream_id);
+	}
 }
 
 static void csid_disable_stream(struct csid_device *csid, u32 stream_id)
 {
 	struct csid_testgen_config *tg = &csid->testgen;
 
-	__csid_ctrl_rdi(csid, 0, stream_id);
+	if (csid_is_pix_stream(csid, stream_id)) {
+		__csid_configure_pix(csid, 0, 0, 0);
+		__csid_ctrl_pix(csid, 0);
+	} else {
+		__csid_ctrl_rdi(csid, 0, stream_id);
+	}
 
 	if (tg->enabled)
 		__csid_configure_testgen(csid, 0, stream_id, 0);
 
-	__csid_configure_rdi_stream(csid, 0, stream_id, 0, 0);
+	if (!csid_is_pix_stream(csid, stream_id))
+		__csid_configure_rdi_stream(csid, 0, stream_id, 0, 0);
 }
 
 static int csid_configure_testgen_pattern(struct csid_device *csid, s32 val)
@@ -403,8 +538,13 @@ static irqreturn_t csid_isr(int irq, void *dev)
 	/* Read and clear IRQ status for each enabled RDI channel */
 	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
 		if (csid->phy.en_vc & BIT(i)) {
-			val = readl_relaxed(csid->base + CSID_CSI2_RDIN_IRQ_STATUS(i));
-			writel_relaxed(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
+			if (csid_is_pix_stream(csid, i)) {
+				val = readl_relaxed(csid->base + CSID_CSI2_IPP_IRQ_STATUS);
+				writel_relaxed(val, csid->base + CSID_CSI2_IPP_IRQ_CLEAR);
+			} else {
+				val = readl_relaxed(csid->base + CSID_CSI2_RDIN_IRQ_STATUS(i));
+				writel_relaxed(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
+			}
 		}
 
 	val = 1 << IRQ_CMD_CLEAR;
diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index bdac29b7af86..b7e6bfc58bcf 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -1784,16 +1784,9 @@ static int csid_init_state(struct v4l2_subdev *sd, struct v4l2_subdev_state *sta
 	struct csid_device *csid = v4l2_get_subdevdata(sd);
 	struct v4l2_subdev_route routes[MSM_CSID_MAX_SRC_STREAMS];
 	struct v4l2_subdev_krouting routing = { };
-	unsigned int num_routes;
 	int i, ret;
 
-	/* The full IFE has only 3 rdi's and pix output is not functional */
-	if (csid_is_lite(csid))
-		num_routes = MSM_CSID_MAX_SRC_STREAMS;
-	else
-		num_routes = MSM_CSID_MAX_SRC_STREAMS - 1;
-
-	for (i = 0; i < num_routes; i++) {
+	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++) {
 		routes[i].sink_pad = MSM_CSID_PAD_SINK;
 		routes[i].sink_stream = 0;
 		if (csid->res->source_streams_mode == CSID_STREAMS_SINGLE_PAD) {
@@ -1806,7 +1799,7 @@ static int csid_init_state(struct v4l2_subdev *sd, struct v4l2_subdev_state *sta
 		routes[i].flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE;
 	}
 
-	routing.num_routes = num_routes;
+	routing.num_routes = MSM_CSID_MAX_SRC_STREAMS;
 	routing.routes = routes;
 	ret = v4l2_subdev_set_routing_with_fmt(sd, state, &routing, &csid_default_format);
 	if (ret)
@@ -1849,7 +1842,7 @@ int msm_csid_register_entity(struct csid_device *csid,
 	if (csid->res->source_streams_mode == CSID_STREAMS_SINGLE_PAD)
 		num_pads = MSM_CSID_PAD_FIRST_SRC + 1;
 	else
-		num_pads = csid_is_lite(csid) ? MSM_CSID_PADS_NUM : MSM_CSID_PADS_NUM - 1;
+		num_pads = MSM_CSID_PADS_NUM;
 
 	v4l2_subdev_init(sd, streams_api ? &csid_streams_v4l2_ops : &csid_v4l2_ops);
 	sd->internal_ops = streams_api ? &csid_streams_internal_ops
-- 
2.34.1

