Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426CA3B8BD9
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 22:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791326552; cv=none; b=EzMamINk+rp6/XfGCciRfxkQGuKhrnhjsxDyVDhNsKlpkcVSR6Ty7zgHKgsKlmQynz1DZQz9dPmG3Jy1n2b6yb9YgLLRUK6LLKuNAbOkDIQXz2/ItKAL9gpsah2/h290KlYFsIxh9rzPSSP04D5hNkQ9TcRxtKsu3gk+7TfzT7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791326552; c=relaxed/simple;
	bh=dJsSd7a5i7G1/y33AhG3b0Z4OMcgXzJzizV55A04grU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FWeB8kt+svSmtNySEK0MdxkknbfBajexkwkhxR1GVFQ8yACuDSm7Obrf2OpL/6Nl/B6qOtVbCeTebjHkllJWkbNimURsrwcrANpSVKNOFL5sk98MaFBvzmAZtu2Js7SbOqaeLl7ruEgc2eo0lhlyEcDrr1SgLRDBIxL1pHhJ6oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QckXkjSO reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QckXkjSO"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696LeRHb3050170
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 22:41:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lrelFzLPzi8
	wcs+eP04VelixkewI+a29sXyDch5pde8=; b=QckXkjSONadPT65LtxT8IMRNBVZ
	wr4TspE7jCXpVjsYqBc1K4EEP49kix2he6PlaaEyact0y98BOg5GaBb7uAaIJdqM
	2Ae5fWLsvss7oQp2MoYVxYif/cxGcKaasshnlHvDL9YlYsItYeMzDfM+4xQLrzeC
	dOAhfFPHdMj8ijUlhFa6v9c7lU1JlXzEJ/xqhK18ervMBwYT1349GChR+c+2pTu7
	Js7xGsohM3I2xbLLqJM5weB1clFs1ocPRWtMnknuWq6DXUAv/LL3pCGrssbzWDTD
	6w/ZcdubieszhCoSQ2SmcKV3CDXhYDCt2/r9kB7DT8knA/J0TB8CW0PeLMg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xc531bv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 22:41:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e92aad34aso185607385a.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 15:41:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326492; x=1791931292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lrelFzLPzi8wcs+eP04VelixkewI+a29sXyDch5pde8=;
        b=wd9wzUj5DKSS+YYuyvWZDkueKJw9psXlP1vj1qFbbfik8fsmUnWRfmf6PhOGSK4lcm
         USyC8/VnA+TSu4ch4r/59btuQSvZ4gvG9qIlWWPPL5fNVJaP9rhRPPACBmp/FUVMwCsN
         zUlpme/Y+dfRquWWiJj/kOgJnhTb92tUJUxbL88FT+KMIsyVfGx58BAxf/E0NlogbXCb
         WNTOqKjgxoXg1ZzZWhGjn4D0E/O5yKstdfsW9LLohi9/pkw1j3c56N60dNBImQM+sPLR
         WfmMmVVK+rXQ7ZGgdXwyTQH5XQBcamH472S0uV7rPs5AQlDE0A1X2XRMqFC5PZWVP04G
         ETaA==
X-Forwarded-Encrypted: i=1; AKwUvBzLTsJyCc799oXeeJsiJCZqSD/ozeugm1lXBuI7n5S0z+OquWc18sXdEO1nnaIB5wGpeEcOLo4RaYRcTgw=@vger.kernel.org
X-Gm-Message-State: AFuF++l9KYfd1Q/4B8oYxwB/qkIzgB9LfXLFgvuGZ0bpti1CBtiwL7Kr
	51UTPA1DjJj//nWM/VyaLLwXtO4VrSTHkyu7Cq+KC4CzuPgqvck4W8mycJoU+danom3zBF8/AG5
	EbKuWQ8N/KM1UDwCgPjDuj1PIMADXSq/HFx/XKF4cMK4DGamLTw4EVUleAFvFDcLTV30=
X-Gm-Gg: AYBFou2DE9qWb8UrlVtQ37bQKaimHUlF5V+9qGvn2i/SbYY0Cbg1YtxjKsLcwzv6nUO
	4jF4Px21Ukem3MZX1dKqh9nOw5y3wuO2P+Th0glPJPHmBBEuDt9yL1ul1fnEOTieUwWc1n5F/kT
	JgFwwemR47aFKLDq5yveAkypK83cKM97if877RjOmcxZzCJ4b8WY6iMSEaayHYD89o/lZujEL7o
	AKlw1UTJVOAVkjyoH5rKhcsXV9s5OGNwfpjmn/YFL/20h0+FdVw5rb2RK5EjVjSzZaoS80JrBxf
	F+cRui85XXMYfMBvoIyfAY0I5caF+REKBR67eZB6/fhaoy3XVu27AfPjbeE=
X-Received: by 2002:a05:620a:6487:b0:93e:9508:8360 with SMTP id af79cd13be357-93e9b71c489mr81780185a.27.1791326491414;
        Tue, 06 Oct 2026 15:41:31 -0700 (PDT)
X-Received: by 2002:a05:620a:6487:b0:93e:9508:8360 with SMTP id af79cd13be357-93e9b71c489mr81772485a.27.1791326490799;
        Tue, 06 Oct 2026 15:41:30 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:41:29 -0700 (PDT)
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
Subject: [PATCH 33/45] media: qcom: camss: sa8775p: add CSID pixel path
Date: Wed,  7 Oct 2026 01:39:41 +0300
Message-Id: <20261006223953.3382273-34-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=X5THu2Te c=1 sm=1 tr=0 ts=6ac5791c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=rgv8boLcVdU40764Om4A:9
 a=NVBY9_DhjQISCgBd:21 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfXz5vLaP2FlDq3
 xCrDeSTqxqRNZpIvayRbDlYo74TKVJ/pRJtltfPf96U7MAG4337aiuhYlLKQtoXJPlCP3ooxjpl
 XevqCfo9YWf0uzfZt5Hu3m+D9g2bRoA=
X-Proofpoint-GUID: C2mFJdZ50uzhGnM-GVrMxJUtrmB2kW6k
X-Proofpoint-ORIG-GUID: C2mFJdZ50uzhGnM-GVrMxJUtrmB2kW6k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfXzU7aeR9mupND
 GwBbFiDclacykp3GnKOQ8NWAT6C8imh6joMZWcra7iDMUd56+245Tz0Kzd3Nw+44OWuvzOTeLu1
 l73Oxz9Q3SXtVhbBgpFDrGzVigXhs9nOAJZeA2W9uLCXM7Dsb1wz8lKPtMnp2nR7Mp1BSTfYXyk
 17Ynr1NK0+KkkjucwDspQEUT6H+uswZaqqb3MLSaysWrMW+eLoSyICCWdUf0uJa/NzYpCzEAmfD
 QrCVHZAMmE/JyroDMN/6yQTj3LFNLSwjYBXfgDoPKjtDR2zqKCTMXwbD8x62PYNxPf2Mi6yAoV5
 J8ee2vAC5tsMLRewctaJJFfTXtFF2V30gG0hXeoM0Vn45OgtfaaOcf0624Cv01jmgW1cIzewQnd
 heDz+jchYicqmvKzGaDpMw3IttoZeKgkmfHgzdhagmNiu24kW9apmXAqdrjhhCed7nJURPJZcvW
 f1BY5tIr3ZBJLtqGcZg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610060090

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Extend the common generation 3 CSID backend with SA8775P streams.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../platform/qcom/camss/camss-csid-gen3.c     | 265 +++++++++++++++++-
 .../media/platform/qcom/camss/camss-csid.c    |   1 +
 .../media/platform/qcom/camss/camss-csid.h    |   4 +
 drivers/media/platform/qcom/camss/camss-ife.c |  23 ++
 drivers/media/platform/qcom/camss/camss-ife.h |   2 +
 drivers/media/platform/qcom/camss/camss.c     |   1 +
 drivers/media/platform/qcom/camss/camss.h     |   1 +
 7 files changed, 291 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
index 0fdbf75fb27d..e44b42215461 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
@@ -4,6 +4,7 @@
  *
  * Copyright (c) 2024 Qualcomm Technologies, Inc.
  */
+#include <linux/bitfield.h>
 #include <linux/completion.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
@@ -19,6 +20,9 @@
 #define		OUTPUT_IFE_EN			0x100
 #define		INTERNAL_CSID			1
 
+#define CSID_GLOBAL_CMD			0x8
+#define		GLOBAL_CMD_START		BIT(0)
+
 #define CSID_RST_CFG			0xC
 #define		RST_MODE			BIT(0)
 #define		RST_LOCATION			BIT(4)
@@ -31,10 +35,12 @@
 #define		IRQ_CMD_CLEAR			BIT(0)
 
 #define CSID_RUP_AUP_CMD		0x18
+#define		CSID_RUP_AUP_IPP0		(BIT(0) | BIT(16))
 #define		CSID_RUP_AUP_RDI(rdi)		((BIT(4) | BIT(20)) << (rdi))
 
 #define CSID_TOP_IRQ_STATUS		0x7C
 #define		 TOP_IRQ_STATUS_RESET_DONE	BIT(0)
+#define		 TOP_IRQ_STATUS_BUF_DONE	BIT(14)
 
 #define CSID_TOP_IRQ_MASK		0x80
 #define CSID_TOP_IRQ_CLEAR		0x84
@@ -44,6 +50,7 @@
 #define CSID_CSI2_RX_IRQ_MASK		0xA0
 #define CSID_CSI2_RX_IRQ_CLEAR		0xA4
 #define CSID_CSI2_RX_IRQ_SET		0xA8
+#define		CSI2_RX_IRQ_ERROR_MASK		0x01bfb800
 
 #define IS_CSID_690(csid)	((csid->camss->res->version == CAMSS_8775P) \
 				 || (csid->camss->res->version == CAMSS_8300))
@@ -54,6 +61,12 @@
 #define CSID_BUF_DONE_IRQ_MASK		0x90
 #define CSID_BUF_DONE_IRQ_CLEAR		0x94
 #define CSID_BUF_DONE_IRQ_SET		0x98
+#define		BUF_DONE_IRQ_STATUS_VID_FULL	BIT(0)
+#define		BUF_DONE_IRQ_STATUS_DISP_FULL	BIT(1)
+#define		BUF_DONE_IRQ_STATUS_STATS	BIT(5)
+#define		BUF_DONE_IRQ_STATUS_PP		(BUF_DONE_IRQ_STATUS_VID_FULL | \
+						 BUF_DONE_IRQ_STATUS_DISP_FULL | \
+						 BUF_DONE_IRQ_STATUS_STATS)
 
 #define CSID_CSI2_RDIN_IRQ_STATUS(rdi)	(0xEC + 0x10 * (rdi))
 #define		RUP_DONE_IRQ_STATUS		BIT(23)
@@ -73,6 +86,25 @@
 #define		CSI2_RX_CFG1_ECC_CORRECTION_EN	BIT(0)
 #define		CSI2_RX_CFG1_VC_MODE		BIT(2)
 
+#define CSID_IPP0_CFG0			0x300
+#define		IPP0_CFG0_EN			BIT(31)
+#define		IPP0_CFG0_VC			GENMASK(26, 22)
+#define		IPP0_CFG0_DT			GENMASK(21, 16)
+#define		IPP0_CFG0_DECODE_FMT		GENMASK(15, 12)
+
+#define CSID_IPP0_CTRL			0x304
+#define		IPP0_CTRL_START_CMD		1
+
+#define CSID_IPP0_CFG1			0x310
+#define		IPP0_CFG1_PIX_STORE_EN		BIT(14)
+#define		IPP0_CFG1_TIMESTAMP_EN		BIT(9)
+#define		IPP0_CFG1_MIN_HBI		GENMASK(7, 4)
+
+#define CSID_IPP0_EPOCH_IRQ_CFG			0x334
+#define CSID_IPP0_EPOCH0_SUBSAMPLE_PATTERN	0x338
+#define CSID_IPP0_EPOCH1_SUBSAMPLE_PATTERN	0x33c
+#define CSID_IPP0_IRQ_SUBSAMPLE_PERIOD		0x380
+
 #define CSID_RDI_CFG0(rdi)	(csid_is_lite(csid) && IS_CSID_690(csid) ?\
 					(0x300 + 0x100 * (rdi)) :\
 					(0x500 + 0x100 * (rdi)))
@@ -97,8 +129,13 @@
 #define		RDI_CFG1_CROP_H_EN		BIT(7)
 #define		RDI_CFG1_CROP_V_EN		BIT(8)
 #define		RDI_CFG1_PIX_STORE		BIT(10)
+#define		RDI_CFG1_TIMESTAMP_EN		BIT(4)
+#define		RDI_CFG1_TIMESTAMP_STB_SEL	GENMASK(1, 0)
 #define		RDI_CFG1_PACKING_FORMAT_MIPI	BIT(15)
 
+#define		ERROR_RECOVERY_CFG0_OVERFLOW_CTRL_EN	BIT(0)
+#define		ERROR_RECOVERY_CFG0_OVERFLOW_CTRL_MODE	BIT(3)
+
 #define CSID_RDI_IRQ_SUBSAMPLE_PATTERN(rdi)	(csid_is_lite(csid) && IS_CSID_690(csid) ?\
 							(0x348 + 0x100 * (rdi)) :\
 							(0x548 + 0x100 * (rdi)))
@@ -106,6 +143,39 @@
 							(0x34C + 0x100 * (rdi)) :\
 							(0x54C + 0x100 * (rdi)))
 #define CSI2_RX_CFG0_PHY_SEL_BASE_IDX	1
+#define CSID_PIX_STREAM_ID		3
+#define EPOCH_IRQ_CFG_EPOCH0_LINE	GENMASK(29, 16)
+#define EPOCH_IRQ_CFG_EPOCH1_LINE	GENMASK(13, 0)
+
+static bool csid_is_pix_stream(struct csid_device *csid, u32 stream_id)
+{
+	return stream_id == CSID_PIX_STREAM_ID && !csid_is_lite(csid);
+}
+
+static unsigned int csid_num_rdis(struct csid_device *csid)
+{
+	return csid_is_lite(csid) ? 4 : 3;
+}
+
+static u32 csid_rdi_error_recovery_cfg0(struct csid_device *csid, u32 rdi)
+{
+	return (csid_is_lite(csid) ? 0x314 : 0x514) + 0x100 * rdi;
+}
+
+static u32 csid_rdi_epoch_irq_cfg(struct csid_device *csid, u32 rdi)
+{
+	return (csid_is_lite(csid) ? 0x32c : 0x52c) + 0x100 * rdi;
+}
+
+static u32 csid_rdi_epoch0_pattern(struct csid_device *csid, u32 rdi)
+{
+	return (csid_is_lite(csid) ? 0x330 : 0x530) + 0x100 * rdi;
+}
+
+static u32 csid_rdi_epoch1_pattern(struct csid_device *csid, u32 rdi)
+{
+	return (csid_is_lite(csid) ? 0x334 : 0x534) + 0x100 * rdi;
+}
 
 static void __csid_configure_rx(struct csid_device *csid,
 				struct csid_phy_config *phy, int vc)
@@ -157,6 +227,133 @@ static void __csid_configure_wrapper(struct csid_device *csid)
 	writel(val, csid->camss->csid_wrapper_base + CSID_IO_PATH_CFG0(csid->id));
 }
 
+static void __csid_configure_ipp(struct csid_device *csid, u8 vc, u8 dt)
+{
+	struct v4l2_mbus_framefmt *input_format =
+		&csid->fmt[MSM_CSID_PAD_FIRST_SRC + CSID_PIX_STREAM_ID];
+	const struct csid_format_info *format =
+		csid_get_fmt_entry(csid->res->formats->formats,
+				   csid->res->formats->nformats, input_format->code);
+	u32 val;
+
+	val = IPP0_CFG0_EN;
+	val |= FIELD_PREP(IPP0_CFG0_VC, vc);
+	val |= FIELD_PREP(IPP0_CFG0_DT, dt);
+	val |= FIELD_PREP(IPP0_CFG0_DECODE_FMT, format->decode_format);
+	writel(val, csid->base + CSID_IPP0_CFG0);
+
+	val = IPP0_CFG1_PIX_STORE_EN | IPP0_CFG1_TIMESTAMP_EN;
+	val |= FIELD_PREP(IPP0_CFG1_MIN_HBI, 4);
+	writel(val, csid->base + CSID_IPP0_CFG1);
+
+	val = FIELD_PREP(EPOCH_IRQ_CFG_EPOCH0_LINE, input_format->height / 3);
+	val |= FIELD_PREP(EPOCH_IRQ_CFG_EPOCH1_LINE, input_format->height / 2);
+	writel(val, csid->base + CSID_IPP0_EPOCH_IRQ_CFG);
+	writel(1, csid->base + CSID_IPP0_EPOCH0_SUBSAMPLE_PATTERN);
+	writel(1, csid->base + CSID_IPP0_EPOCH1_SUBSAMPLE_PATTERN);
+	writel(0, csid->base + CSID_IPP0_IRQ_SUBSAMPLE_PERIOD);
+	writel(CSID_RUP_AUP_IPP0, csid->base + CSID_RUP_AUP_CMD);
+}
+
+static void __csid_ctrl_ipp(struct csid_device *csid, bool enable)
+{
+	if (!enable)
+		writel(0, csid->base + CSID_IPP0_CFG0);
+
+	writel(enable ? IPP0_CTRL_START_CMD : 0, csid->base + CSID_IPP0_CTRL);
+}
+
+static void __csid_configure_rdi_streams(struct csid_device *csid, bool enable,
+					 u32 port, u8 vc, u8 dt)
+{
+	struct v4l2_mbus_framefmt *input_format =
+		&csid->fmt[MSM_CSID_PAD_FIRST_SRC + port];
+	u32 val;
+
+	if (!enable) {
+		val = readl(csid->base + CSID_RDI_CFG0(port));
+		writel(val & ~RDI_CFG0_EN, csid->base + CSID_RDI_CFG0(port));
+		return;
+	}
+
+	val = DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
+	val |= dt << RDI_CFG0_DT;
+	val |= vc << RDI_CFG0_VC;
+	val |= (port & 0x3) << RDI_CFG0_DT_ID;
+	writel(val, csid->base + CSID_RDI_CFG0(port));
+
+	val = RDI_CFG1_PACKING_FORMAT_MIPI | RDI_CFG1_TIMESTAMP_EN |
+	      FIELD_PREP(RDI_CFG1_TIMESTAMP_STB_SEL, 2);
+	writel(val, csid->base + CSID_RDI_CFG1(port));
+
+	val = ERROR_RECOVERY_CFG0_OVERFLOW_CTRL_EN |
+	      ERROR_RECOVERY_CFG0_OVERFLOW_CTRL_MODE;
+	writel(val, csid->base + csid_rdi_error_recovery_cfg0(csid, port));
+	writel(0, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PERIOD(port));
+	writel(1, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PATTERN(port));
+
+	val = FIELD_PREP(EPOCH_IRQ_CFG_EPOCH0_LINE, input_format->height / 3);
+	val |= FIELD_PREP(EPOCH_IRQ_CFG_EPOCH1_LINE, input_format->height / 2);
+	writel(val, csid->base + csid_rdi_epoch_irq_cfg(csid, port));
+	writel(1, csid->base + csid_rdi_epoch0_pattern(csid, port));
+	writel(1, csid->base + csid_rdi_epoch1_pattern(csid, port));
+	writel(CSID_RUP_AUP_RDI(port), csid->base + CSID_RUP_AUP_CMD);
+
+	writel(0, csid->base + CSID_RDI_CTRL(port));
+	val = readl(csid->base + CSID_RDI_CFG0(port));
+	writel(val | RDI_CFG0_EN, csid->base + CSID_RDI_CFG0(port));
+}
+
+static void csid_buf_done_irq(struct csid_device *csid, u32 mask, bool enable)
+{
+	unsigned long flags;
+	u32 top_mask;
+	u32 val;
+
+	spin_lock_irqsave(&csid->irq_lock, flags);
+
+	top_mask = readl(csid->base + CSID_TOP_IRQ_MASK);
+	val = readl(csid->base + CSID_BUF_DONE_IRQ_MASK);
+
+	writel(mask, csid->base + CSID_BUF_DONE_IRQ_CLEAR);
+	if (enable) {
+		val |= mask;
+		top_mask |= TOP_IRQ_STATUS_BUF_DONE;
+	} else {
+		val &= ~mask;
+		if (!val)
+			top_mask &= ~TOP_IRQ_STATUS_BUF_DONE;
+	}
+
+	writel(val, csid->base + CSID_BUF_DONE_IRQ_MASK);
+	writel(top_mask, csid->base + CSID_TOP_IRQ_MASK);
+	writel(IRQ_CMD_CLEAR, csid->base + CSID_IRQ_CMD);
+
+	spin_unlock_irqrestore(&csid->irq_lock, flags);
+}
+
+static void csid_buf_done(struct csid_device *csid, u32 status)
+{
+	const struct parent_dev_ops *ops = csid->res->parent_dev_ops;
+	unsigned int i;
+
+	if (!ops->buf_done)
+		return;
+
+	if (!csid_is_lite(csid)) {
+		if (status & BUF_DONE_IRQ_STATUS_VID_FULL)
+			ops->buf_done(csid->camss, csid->id, CAMSS_IFE_OUTPUT_VID_FULL);
+		if (status & BUF_DONE_IRQ_STATUS_DISP_FULL)
+			ops->buf_done(csid->camss, csid->id, CAMSS_IFE_OUTPUT_DISP_FULL);
+		if (status & BUF_DONE_IRQ_STATUS_STATS)
+			ops->buf_done(csid->camss, csid->id, CAMSS_IFE_OUTPUT_STATS);
+	}
+
+	for (i = 0; i < csid_num_rdis(csid); i++)
+		if (status & BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i))
+			ops->buf_done(csid->camss, csid->id, CAMSS_IFE_OUTPUT_RDI0 + i);
+}
+
 static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 port, u8 vc)
 {
 	u32 val;
@@ -234,6 +431,47 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 		}
 }
 
+static void csid_configure_rx(struct csid_device *csid)
+{
+	__csid_configure_wrapper(csid);
+	__csid_configure_rx(csid, &csid->phy, 0);
+	writel(CSI2_RX_IRQ_ERROR_MASK, csid->base + CSID_CSI2_RX_IRQ_MASK);
+	writel(GLOBAL_CMD_START, csid->base + CSID_GLOBAL_CMD);
+}
+
+static void csid_enable_stream(struct csid_device *csid, u32 stream_id, u8 vc, u8 dt)
+{
+	u32 mask;
+
+	if (csid_is_pix_stream(csid, stream_id)) {
+		__csid_configure_ipp(csid, vc, dt);
+		mask = BUF_DONE_IRQ_STATUS_PP;
+		csid_buf_done_irq(csid, mask, true);
+		__csid_ctrl_ipp(csid, true);
+	} else if (stream_id < csid_num_rdis(csid)) {
+		mask = BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + stream_id);
+		csid_buf_done_irq(csid, mask, true);
+		__csid_configure_rdi_streams(csid, true, stream_id, vc, dt);
+		__csid_ctrl_rdi(csid, true, stream_id);
+	}
+}
+
+static void csid_disable_stream(struct csid_device *csid, u32 stream_id)
+{
+	u32 mask;
+
+	if (csid_is_pix_stream(csid, stream_id)) {
+		mask = BUF_DONE_IRQ_STATUS_PP;
+		csid_buf_done_irq(csid, mask, false);
+		__csid_ctrl_ipp(csid, false);
+	} else if (stream_id < csid_num_rdis(csid)) {
+		mask = BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + stream_id);
+		csid_buf_done_irq(csid, mask, false);
+		__csid_ctrl_rdi(csid, false, stream_id);
+		__csid_configure_rdi_streams(csid, false, stream_id, 0, 0);
+	}
+}
+
 static int csid_configure_testgen_pattern(struct csid_device *csid, s32 val)
 {
 	return 0;
@@ -259,10 +497,14 @@ static void csid_subdev_reg_update(struct csid_device *csid, int port_id, bool c
 static irqreturn_t csid_isr(int irq, void *dev)
 {
 	struct csid_device *csid = dev;
-	u32 val, buf_done_val;
+	unsigned long flags;
+	u32 buf_done_val;
+	u32 val;
 	u8 reset_done;
 	int i;
 
+	spin_lock_irqsave(&csid->irq_lock, flags);
+
 	val = readl(csid->base + CSID_TOP_IRQ_STATUS);
 	writel(val, csid->base + CSID_TOP_IRQ_CLEAR);
 	reset_done = val & TOP_IRQ_STATUS_RESET_DONE;
@@ -282,8 +524,19 @@ static irqreturn_t csid_isr(int irq, void *dev)
 			if (val & RUP_DONE_IRQ_STATUS)
 				/* clear the reg update bit */
 				csid_subdev_reg_update(csid, i, true);
+		}
+
+	val = IRQ_CMD_CLEAR;
+	writel(val, csid->base + CSID_IRQ_CMD);
+
+	spin_unlock_irqrestore(&csid->irq_lock, flags);
 
-			if (buf_done_val & BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i)) {
+	if (csid->res->streams_enable) {
+		csid_buf_done(csid, buf_done_val);
+	} else {
+		for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
+			if (csid->phy.en_vc & BIT(i) &&
+			    buf_done_val & BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i)) {
 				/*
 				 * For Titan Gen3, bus done and RUP IRQ have been moved to
 				 * CSID from VFE. Once CSID received bus done, need notify
@@ -291,10 +544,7 @@ static irqreturn_t csid_isr(int irq, void *dev)
 				 */
 				camss_buf_done(csid->camss, csid->id, i);
 			}
-		}
-
-	val = IRQ_CMD_CLEAR;
-	writel(val, csid->base + CSID_IRQ_CMD);
+	}
 
 	if (reset_done)
 		complete(&csid->reset_complete);
@@ -354,6 +604,9 @@ static void csid_subdev_init(struct csid_device *csid)
 const struct csid_hw_ops csid_ops_gen3 = {
 	.configure_stream = csid_configure_stream,
 	.configure_testgen_pattern = csid_configure_testgen_pattern,
+	.configure_rx = csid_configure_rx,
+	.enable_stream = csid_enable_stream,
+	.disable_stream = csid_disable_stream,
 	.hw_version = csid_hw_version,
 	.isr = csid_isr,
 	.reset = csid_reset,
diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index b7e6bfc58bcf..da13963ef1a0 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -1199,6 +1199,7 @@ int msm_csid_subdev_init(struct camss *camss, struct csid_device *csid,
 		return ret;
 
 	init_completion(&csid->reset_complete);
+	spin_lock_init(&csid->irq_lock);
 
 	return 0;
 }
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index f079956bae8e..2d99b61eb98d 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -12,6 +12,8 @@
 
 #include <linux/clk.h>
 #include <linux/interrupt.h>
+#include <linux/spinlock.h>
+
 #include <media/media-entity.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
@@ -191,6 +193,8 @@ struct csid_device {
 	struct regulator_bulk_data *supplies;
 	int num_supplies;
 	struct completion reset_complete;
+	/* Protects interrupt status, mask, and clear registers. */
+	spinlock_t irq_lock;
 	struct csid_testgen_config testgen;
 	bool tpg_linked;
 	struct csid_phy_config phy;
diff --git a/drivers/media/platform/qcom/camss/camss-ife.c b/drivers/media/platform/qcom/camss/camss-ife.c
index cc5cebfd0862..e2049e00ea96 100644
--- a/drivers/media/platform/qcom/camss/camss-ife.c
+++ b/drivers/media/platform/qcom/camss/camss-ife.c
@@ -1290,6 +1290,29 @@ static const struct v4l2_subdev_ops ife_v4l2_ops = {
 	.pad	= &ife_pad_ops,
 };
 
+void camss_ife_buf_done(struct camss *camss, int id, enum camss_ife_output output)
+{
+	struct ife_device *ife;
+	unsigned long flags;
+	int i;
+
+	if (id >= camss->ife_total_num)
+		return;
+
+	ife = &camss->ife[id];
+	spin_lock_irqsave(&ife->bufs_lock, flags);
+
+	for (i = 0; i < ife->npads; i++) {
+		const struct ife_pad_desc *desc = ife->pads[i].desc;
+		struct ife_video_pad *vpad = ife->pads[i].vid_pad;
+
+		if (vpad && vpad->streaming && desc->output == output)
+			ife_hw_isr_wm_done(ife, vpad);
+	}
+
+	spin_unlock_irqrestore(&ife->bufs_lock, flags);
+}
+
 static int ife_video_start_streaming(struct camss_video *vid,
 				     unsigned int count)
 {
diff --git a/drivers/media/platform/qcom/camss/camss-ife.h b/drivers/media/platform/qcom/camss/camss-ife.h
index 0ca276203bbb..3d35c17fca7f 100644
--- a/drivers/media/platform/qcom/camss/camss-ife.h
+++ b/drivers/media/platform/qcom/camss/camss-ife.h
@@ -394,6 +394,8 @@ camss_ife_pipe_for_stream_id(int nstreams,
 			     const struct camss_ife_stream *streams,
 			     u32 id);
 
+void camss_ife_buf_done(struct camss *camss, int id, enum camss_ife_output output);
+
 extern const struct ife_pads_descriptors ife_pads_v20x;
 extern const struct ife_pads_descriptors ife_pads_v41x;
 extern const struct ife_hw_top_ops ife_top_20x_ops;
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2dc7864ebe07..7a3e5e6f81e1 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5185,6 +5185,7 @@ static const struct parent_dev_ops ife_parent_dev_ops = {
 	.get = ife_parent_dev_ops_get,
 	.put = ife_parent_dev_ops_put,
 	.get_base_address = ife_parent_dev_ops_get_base_address,
+	.buf_done = camss_ife_buf_done,
 };
 
 int camss_attach_host_data(struct camss *camss, struct v4l2_subdev *sd,
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 65582ff7db23..c19e95df0a54 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -201,6 +201,7 @@ struct parent_dev_ops {
 	int (*get)(struct camss *camss, int id);
 	int (*put)(struct camss *camss, int id);
 	void __iomem *(*get_base_address)(struct camss *camss, int id);
+	void (*buf_done)(struct camss *camss, int id, enum camss_ife_output output);
 };
 
 void camss_add_clock_margin(u64 *rate);
-- 
2.34.1

