Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FA53BFAD1
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 22:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791326513; cv=none; b=LO8x7Vojj4nVRrPhVDRqdzzgi0G1fKHPZ2e0EoKxJA8+tZIAsxUQ2TnC1Ksr6mIidu4bzu2ygk+CgYIiNyhjGQ6A6n8t9FVRL/szjiD8H5LwPSX8cDg32x9UjiFFLCiUXIifRAvK1DNsFXXCC2qmGxMxmRne8TGbarBykfXTM2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791326513; c=relaxed/simple;
	bh=J8zX0BosxALREkGuvS73xGXuDFgp939q8bxy9PiCNfE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m1pFhzmZwgQ9ydZJq8EkBiF1bH7NDo8dVQU9qxZzmK0tklGK0chqv4SuuuOtKCOX/DzBafM9v94c7soiYDH1P1Xru0N7hzJqC6O58Ev9w/NHCMTpvg5WuT62nqtYr+JC1UfEXDgrV6OlW9op4+28jeDAzMs2RNNGeVFDDTVwCh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wv8xrl2G reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wv8xrl2G"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696LeH0Z1029190
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 22:41:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=b2TIZsxTZBx
	V/cYkGg07OniicaQBj33MmruE/6U5Zcc=; b=Wv8xrl2GcX1xisJQTIGYh6W7BU6
	/8DG1XMVhOrrTAZs3RSaQGv/vdRrth0rMubey2Tv3JD9l8egP/qYSFxJbTG2Ol7x
	pLnuUh9aw437eFhAwNUKj0FGSCbAaIWP+TNMuej0a5JhOkZ825e7Tjz3kFMGmJb/
	YK8gEAeadwuATnWxoIKBFwGhrIruI3C6BYJ/zcn6s2YPQftEDDLfw6HSaaxF/5KZ
	tpNQpW1fFYqCOEGxk0MLqNz2d810+Z+Xs1Wh6xrzfqRyFoqc5g8wi1bWLwFsrKqs
	f8GVJyV/4Vu7jlC8qSApV9RnrKB76UCddEJuk6I3FRnnxi8B0iDrGiJCrCw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h53ashu3m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 22:41:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ae8e7e546so628323985a.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 15:41:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326470; x=1791931270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b2TIZsxTZBxV/cYkGg07OniicaQBj33MmruE/6U5Zcc=;
        b=1yYvblcUGIzNI4kq7CWQ5iREHThi0j8K6kbpFQW1iIHg/w0B+2nEYahLIgVvHpohBT
         XlE2m/Tg//7e2eVg80vpSecaSG91o42thb0DGae8IZwf4FVf7WI/CZsK34iRIuxDCzyt
         llR/W7JJZYlNycsr/rO2SGpFTS562NjgqKOY10IfVwq5JMd0XD95O6IvHWDT9STvmMfl
         dXMxIQeXGCMDZ7gvIxFpmzVEQYauzlrsnUd3JOTcYm1nfdGTPCXVutPIh99vccira/9l
         tpJGftzaQtrPv02bGaVFWHeoKmEFGttNFhYEgrUqT1qN+rA49kblFDimsM5dvAN94gNz
         As1A==
X-Forwarded-Encrypted: i=1; AKwUvBywMqXmgzwuH1Gj/d8SHpFwQ4Rb6D13z6TS1+67C1/G7/5vXxkANBXba+WpkKq0NU3u31zQsBnplByPxOo=@vger.kernel.org
X-Gm-Message-State: AFuF++mudddZWV67I0bPzI4WHAsiBWQRDHgdE5lE7vtypks/LqgfvHw0
	YNp15fjSwEIadJXKJuhzhV5zjTVk6oHKq5Fgj4BXKvMl8kBoMhwKEsq1H1oOVSV+lb/UtlY28jd
	IqOLRL4SCIdBGbnz8TF1pU+/sLVbF8Xttcrp1FJIvL8enAT/j2lT0bN5tuG6v+LOGGDgt2FPfqU
	+SKA==
X-Gm-Gg: AYBFou2oisI0LnP/8tcVlHxooJ8egXFfroRfmSwQy2z5J7CHVcwEokKN4afwaU58BXX
	eBnp7Lr8yHTohWNZBhXWzgqPKPxvwWuIl6Iy6wIzpU63i1CSlgslDwPGIs/aRiOike/4yjXR1VW
	5MPxKJRNOPlfzJ7DyjEc7cciSlcqi3XGaoF6+iUPn5wyPh7Fp4HXiOmr3IWelgRqao6Tib7Ncv4
	MRRwAgn83sZIDSY5YgZbbMrFiQ1xS6emH4I7KR1a6xIVAz+ECEYnIlRN4sdh/JzfAuemjA5zQ5O
	c+nmalYg0YfqyLWuEogA9cYZQBwm3vOgHblmYD3lRPVIIYO1G4pURrvH09E=
X-Received: by 2002:a05:620a:2621:b0:93c:3862:9924 with SMTP id af79cd13be357-93e9b700e22mr84345385a.27.1791326470094;
        Tue, 06 Oct 2026 15:41:10 -0700 (PDT)
X-Received: by 2002:a05:620a:2621:b0:93c:3862:9924 with SMTP id af79cd13be357-93e9b700e22mr84339385a.27.1791326469589;
        Tue, 06 Oct 2026 15:41:09 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:41:08 -0700 (PDT)
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
Subject: [PATCH 23/45] media: uapi: add Qualcomm IFE parameters
Date: Wed,  7 Oct 2026 01:39:31 +0300
Message-Id: <20261006223953.3382273-24-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: woS9ziiLNAdVknyGTxcxdMu-Yg4s8Aaj
X-Proofpoint-GUID: woS9ziiLNAdVknyGTxcxdMu-Yg4s8Aaj
X-Authority-Analysis: v=2.4 cv=Xt5vqlF9 c=1 sm=1 tr=0 ts=6ac57906 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=Vy616epaR3mJq_vLIv4A:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX+4OU85ldvNTi
 YvDZ+2A04ss5CdRkACsdWsir/mj0nwJZzWxWs9m8zQXHRljTQW6iEVyQLN+fyHutHMKffHyl9Pa
 DBz3PZW2qHE1N7GP4BevW5FTDkDfOHQKfHQsQrqBU6V+/Zeb1HfpogXqvCI8h7UBjMg+33vC8Q3
 Ou24Vl3wD72pHg396djGK2YrSQ+qFRhn8J27P3t/p4E/hTTWk3JouTyQG5b93zJQhaquU1zm+iP
 gcoZKd+GnUUhRzWRpoJ3VvESkyz2VbrkZNEqqQTCldNk4dGH9afqRO2zB+voa4YMxxTHU4Dp/d3
 sSKQo2kzFCPrvLex9h4dY+vTVJZEoRLHFLsA8iZVXswfc8/N6H+6D7rEtrq6tBTp9S94/R6PghE
 8JYrrmxXM/I/A8RsTzchXcwO5ZRtaKZISL1pVAjV75bl3lvHc1ofPsk0nUi9cp+EHFWBCyCk0Ev
 j9wR7ZgvDEZy4A5HMPA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX3sEYxkdQNtYe
 grWkrw4IkXyU0K4ZwIoc6Gbr6ZwtE5wcSu3eata3aufQ2yKI0QZxAO4/10XQYN1AaLJgktS/6y3
 AUi1vCgzYNmQ+/AUmqh3i7TrNtLj4jI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 impostorscore=0 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060090

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Define the parameter buffer used to configure Qualcomm IFE image
processing modules.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 include/uapi/linux/qcom-camss-config.h | 157 +++++++++++++++++++++++--
 1 file changed, 150 insertions(+), 7 deletions(-)

diff --git a/include/uapi/linux/qcom-camss-config.h b/include/uapi/linux/qcom-camss-config.h
index aa3d97cfcc78..b44f80bf850a 100644
--- a/include/uapi/linux/qcom-camss-config.h
+++ b/include/uapi/linux/qcom-camss-config.h
@@ -11,6 +11,16 @@
 #include <linux/types.h>
 #include <linux/media/v4l2-isp.h>
 
+/* Number of entries in each gamma channel LUT. */
+#define CAMSS_GAMMA_LUT_SIZE	256
+
+/* Max number of lsc blocks */
+#define CAMSS_IFE_MAX_LSC_BLOCKS (17 * 13)
+/* Gamma table size for CAMSS_IFE_PARAMS_GAMMA_64 (v10x native LUT width) */
+#define CAMSS_IFE_GAMMA_64_SIZE 64
+/* Gamma table size for CAMSS_IFE_PARAMS_GAMMA_256 (v41x native LUT width) */
+#define CAMSS_IFE_GAMMA_256_SIZE 256
+
 /**
  * enum camss_params_block_type - CAMSS ISP parameter block identifiers
  *
@@ -25,17 +35,34 @@
  *	&struct camss_params_color_correct
  * @CAMSS_PARAMS_GAMMA: per-channel gamma correction curves (CLC_GLUT),
  *	&struct camss_params_gamma
+ * @CAMSS_IFE_PARAMS_WB_GAIN: IFE per-channel white balance gains,
+ *	&struct camss_ife_params_wb_gain
+ * @CAMSS_IFE_PARAMS_COLOR_CORRECT: IFE color correction matrix,
+ *	&struct camss_ife_params_color_correct
+ * @CAMSS_IFE_PARAMS_LSC: IFE lens shading correction,
+ *	&struct camss_ife_params_lsc
+ * @CAMSS_IFE_PARAMS_GAMMA_64: IFE 64-entry gamma correction curves, used by
+ *	IFE hardware generations whose native GLUT LUT is 64 entries wide,
+ *	&struct camss_ife_params_gamma_64
+ * @CAMSS_IFE_PARAMS_GAMMA_256: IFE 256-entry gamma correction curves, used
+ *	by IFE hardware generations whose native GLUT LUT is 256 entries
+ *	wide, &struct camss_ife_params_gamma_256
+ * @CAMSS_IFE_PARAMS_BG_STATS: enable/disable the IFE bayer grid 3A
+ *	statistics engine, &struct camss_ife_params_bg_stats
  */
 enum camss_params_block_type {
-	CAMSS_PARAMS_WB_GAIN = 1,
-	CAMSS_PARAMS_CHROMA_ENHAN = 2,
-	CAMSS_PARAMS_COLOR_CORRECT = 3,
-	CAMSS_PARAMS_GAMMA = 4,
+	CAMSS_PARAMS_WB_GAIN		= 1,
+	CAMSS_PARAMS_CHROMA_ENHAN	= 2,
+	CAMSS_PARAMS_COLOR_CORRECT	= 3,
+	CAMSS_PARAMS_GAMMA		= 4,
+	CAMSS_IFE_PARAMS_WB_GAIN	= 5,
+	CAMSS_IFE_PARAMS_COLOR_CORRECT	= 6,
+	CAMSS_IFE_PARAMS_LSC		= 8,
+	CAMSS_IFE_PARAMS_GAMMA_64	= 9,
+	CAMSS_IFE_PARAMS_GAMMA_256	= 10,
+	CAMSS_IFE_PARAMS_BG_STATS	= 11,
 };
 
-/* Number of entries in each gamma channel LUT. */
-#define CAMSS_GAMMA_LUT_SIZE	256
-
 /**
  * struct camss_params_wb_gain - White Balance gains
  *
@@ -209,4 +236,120 @@ struct camss_params_gamma {
 	 sizeof(struct camss_params_color_correct)	+\
 	 sizeof(struct camss_params_gamma))
 
+/**
+ * struct camss_ife_params_wb_gain - IFE per channel gains configuration.
+ *
+ * @header: block header; @header.type = CAMSS_IFE_PARAMS_WB_GAIN
+ * @r: Red channel gain in U15Q10 format (max 0x7fff, i.e. ~31.999).
+ * @b: Blue channel gain in U15Q10 format (max 0x7fff, i.e. ~31.999).
+ * @g: Green channel gain in U15Q10 format (max 0x7fff, i.e. ~31.999).
+ * @_pad: padding for 64-bit alignment, must be zero.
+ */
+struct camss_ife_params_wb_gain {
+	struct v4l2_isp_params_block_header header;
+	__u16 r;
+	__u16 b;
+	__u16 g;
+	__u16 _pad;
+} __attribute__((aligned(8)));
+
+/**
+ * struct camss_ife_params_color_correct - IFE color correction configuration.
+ *
+ * @header: block header; @header.type = CAMSS_IFE_PARAMS_COLOR_CORRECT
+ * @coeff: 3x3 RGB to RGB matrix. Values are in S12Q8 format.
+ * @offset: Offset values in (S12Q8 format).
+ */
+struct camss_ife_params_color_correct {
+	struct v4l2_isp_params_block_header header;
+	__u16 coeff[3][3];
+	__u16 offset[3];
+} __attribute__((aligned(8)));
+
+/**
+ * struct camss_ife_params_gamma_64 - IFE gamma correction configuration
+ * (64-entry, v10x native).
+ *
+ * Each DMI table word packs two fields so the hardware can
+ * piecewise-linearly interpolate between adjacent LUT entries from a
+ * single DMI read:
+ *   bits [9:0]:   base  - this index's curve value (10-bit unsigned)
+ *   bits [19:10]: delta - signed difference to the *next* index's value
+ *                 (10-bit signed, two's complement)
+ *
+ * @header: block header; @header.type = CAMSS_IFE_PARAMS_GAMMA_64
+ * @table_r: Pre-calculated DMI table values for the red channel.
+ * @table_g: Pre-calculated DMI table values for the green channel.
+ * @table_b: Pre-calculated DMI table values for the blue channel.
+ */
+struct camss_ife_params_gamma_64 {
+	struct v4l2_isp_params_block_header header;
+	__u32 table_r[CAMSS_IFE_GAMMA_64_SIZE];
+	__u32 table_g[CAMSS_IFE_GAMMA_64_SIZE];
+	__u32 table_b[CAMSS_IFE_GAMMA_64_SIZE];
+} __attribute__((aligned(8)));
+
+/**
+ * struct camss_ife_params_gamma_256 - IFE gamma correction configuration
+ * (256-entry, v41x native).
+ *
+ * Same DMI table word packing as &struct camss_ife_params_gamma_64, just
+ * with a 256-entry table matching the wider GLUT DMI address field of this
+ * generation's hardware:
+ *   bits [9:0]:   base  - this index's curve value (10-bit unsigned)
+ *   bits [19:10]: delta - signed difference to the *next* index's value
+ *                 (10-bit signed, two's complement)
+ *
+ * @header: block header; @header.type = CAMSS_IFE_PARAMS_GAMMA_256
+ * @table_r: Pre-calculated DMI table values for the red channel.
+ * @table_g: Pre-calculated DMI table values for the green channel.
+ * @table_b: Pre-calculated DMI table values for the blue channel.
+ */
+struct camss_ife_params_gamma_256 {
+	struct v4l2_isp_params_block_header header;
+	__u32 table_r[CAMSS_IFE_GAMMA_256_SIZE];
+	__u32 table_g[CAMSS_IFE_GAMMA_256_SIZE];
+	__u32 table_b[CAMSS_IFE_GAMMA_256_SIZE];
+} __attribute__((aligned(8)));
+
+/**
+ * struct camss_ife_params_lsc - IFE lens shading configuration.
+ *
+ * @header: block header; @header.type = CAMSS_IFE_PARAMS_LSC
+ * @num_hor_blocks: Number of horizontal blocks.
+ * @num_ver_blocks: Number of vertical blocks.
+ * @_pad: padding for 64-bit alignment, must be zero.
+ * @table_r: Pre-calculated DMI table values for the red channel.
+ * @table_b: Pre-calculated DMI table values for the blue channel.
+ */
+struct camss_ife_params_lsc {
+	struct v4l2_isp_params_block_header header;
+	__u8 num_hor_blocks;
+	__u8 num_ver_blocks;
+	__u16 _pad[3];
+
+	__u32 table_r[CAMSS_IFE_MAX_LSC_BLOCKS];
+	__u32 table_b[CAMSS_IFE_MAX_LSC_BLOCKS];
+} __attribute__((aligned(8)));
+
+/**
+ * struct camss_ife_params_bg_stats - IFE bayer grid 3A statistics enable.
+ *
+ * @header: block header; @header.type = CAMSS_IFE_PARAMS_BG_STATS. Carries
+ *	no payload of its own: the engine is enabled or disabled purely via
+ *	V4L2_ISP_PARAMS_FL_BLOCK_ENABLE/_DISABLE in @header.flags, using the
+ *	grid geometry already configured for the active stream.
+ */
+struct camss_ife_params_bg_stats {
+	struct v4l2_isp_params_block_header header;
+} __attribute__((aligned(8)));
+
+#define CAMSS_IFE_PARAMS_MAX_PAYLOAD				\
+	(sizeof(struct camss_ife_params_wb_gain)		+\
+	 sizeof(struct camss_ife_params_color_correct)		+\
+	 sizeof(struct camss_ife_params_gamma_64)		+\
+	 sizeof(struct camss_ife_params_gamma_256)		+\
+	 sizeof(struct camss_ife_params_lsc)			+\
+	 sizeof(struct camss_ife_params_bg_stats))
+
 #endif /* _UAPI_LINUX_QCOM_CAMSS_CONFIG_H */
-- 
2.34.1

