Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255F13CB569
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789455276; cv=none; b=O779NVIFDmrNOxiO3NcbEniHhj1zee4ifPM+Efdbn7OHovRlruMDEf869XA8aQEFGu08NIbGJYZttFbMqE/TsEQhFGAh4wRIZRajE/7acLyIhwiD0Rjh21T2o8DLpuz9FxtkIwjrGlc6SuZA2Wawd9Ryfsx7FmrRrd4RMrS+PoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789455276; c=relaxed/simple;
	bh=mP3bvWznXxIIzJowlzW6vQNAZA58uoi4wI4gneF7fkU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pA8AvwSygjciHAtP1fQp2I/IF/AILVJfUCM5/cuOXWO3lJaswgIh3D3nfGxE5ZpwPyTsfk1VZtwCkWWYlEhjajtsdQ4DIEc/krJpkzJ3pGV5oRcFllBVAXp5KTM3cTE1BXILFmS9NoFXcuqK0VwECZ/BKaJLWb8ejkG9Q/Sebv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hIwqDK5D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=claDr+zW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hIwqDK5D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="claDr+zW"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6ZFbO3487022
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:54:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lVpUj42rxzk6HnjxEmo+9uxYZw6TMzwtLr+g/Cafst0=; b=hIwqDK5D28l0hmHL
	mI9nyrwHLdvrKWvdYt/AVwWwNjSuOlZp40Mu+7hyP0Wl9rLwnJh4Q+hcAFyq0rxu
	1UA1kQbNJjp4xnZ1Oqu913QitCWabmN/HzSrQWzAxFlkrU8kZcqaXiFLd+MFh0TU
	/wbAiWUIbGcNt9HLdsLQFQAkmyMgZEGfCmLE1IOWqqJln1S0nw09q4N0VoWlwlg7
	3XgbIgL4gPH0+Nioae1HEcHgPvZ48RGk9LHYwnW5swoWxuNekCXFI0m+dzReGjaD
	IexrujzREzH4ui8bNCrLwzMDa8mUmKsNCe9GehnnqwKv9uJ4Y7Py66hLEYvB4lAS
	r/zuyw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq0jer52b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:54:31 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39e087a18deso417233a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 23:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789455271; x=1790060071; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lVpUj42rxzk6HnjxEmo+9uxYZw6TMzwtLr+g/Cafst0=;
        b=claDr+zWqBFQPRxYOPKKc6wsXrrhryMLFdF4+xKMWASdppMnbrrUxbInnUMWKuoopL
         3L4kPQ2KDJ2GnYKxKnD5vj7xwoFKCIv0pJUwyXst/3mbactr2kaqIJ4cVPUQ+X0WGx7O
         oSTKCYqYpb8FbbR57fdySDB2SNeICykbt3rEuRRSJ4wBlGHcPtTVgDgEo0iVLc4ybdmj
         mrGQRnRWbtC78uhM0IpuXVA62hhb85Mbn34BxYJDOTBQ/zmLAuoJP5BwWymELvEss1vP
         18R29Mxjn4rq/lhS6T1ShiO8c3rNR72RHRd6MWy4P1GwVUn3deOGmVFcN0eDKoZpI2Nt
         P4Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789455271; x=1790060071;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lVpUj42rxzk6HnjxEmo+9uxYZw6TMzwtLr+g/Cafst0=;
        b=WL3deRbDHCrN1pIOQlQxoWd0LQ1uCWcu8FFWvrTqGdQ9rKmLMuPXvbf1DsxlsThXDQ
         s0mJVYHHX0fw2Uk1aB3Nrp6giBunEi++Ce2D1CAib0FmBIlct+G7HG0nSzojM4Y4xlpn
         LKbIp6Tbr7gyaLd1gKYpDMM7ZHSLGZR79nIVXLjalg210bYCnSRwOD/WgpVTMmoUYWHB
         FADW5y9ISYhyxnaBny5U2cIDiaZvGl6WUvgUQn7UCuaPorK7yBCySnBBYfSR/a9EtI37
         JvO0FAleX1oeolBfWu7eZaQ+c4ZhBddItHPlIY4cZZ9J9S2pfXidf1Nwic+P7vQtgBUz
         E5aQ==
X-Forwarded-Encrypted: i=1; AKwUvBy2E6CyQKGKBVyZy39P42I/pwyzM0BxlHsJ3Icvj/RyXvJzLqhqzE/APivZ6NiR+RKEJioS9Td4QPD0vE4=@vger.kernel.org
X-Gm-Message-State: AFuF++mKInhMq1eo4f2AVuvGAqSCvLrsiuYT2GYm+fABnHJfJYNlmTTJ
	dNO/ynk3s2hA19MstY2tTNhCiKnmPjF7f8J/IH09yThdAE8B461a5iBVLA2B+UcyUogALE5wtQP
	6kMl9OPkfGb6lTFeMz/8guMM9d8wVLJDSOjZeLW/6RcSCIJFbLDYFdd/8GvKqjrDEvdM=
X-Gm-Gg: AYBFou0h5W1Vz30bpYfEXInQZaEDOB1dt3iEWizvkdTI7ijlAtmaVSZDgp4yRNTTKak
	74/IRf5nbIZhgOTl5qRbXE7slOxUW2Hbr60k+30EnnoBrSeZcbeL1to6BsXgIG2bLOVhZ8xutgV
	I2+yKCmSUpjd5SYzLdqMoRDZRNd7COl4DA54ojNf2C1P5h642mU9oHU2XTT7yhITkHu0TMHAg5x
	SjfpkdkTTNpuAJiBf7fvSozaJkplhKokbmxJ0isJYL/7kVyzjh5FugR3H5bkRVg0AJFzMlZLMaZ
	zawfcxV6tpG9zvIWNDjSXzPeVqGggeWEFLE69xK/7d2lZ9FffrGOrHje+QwS9+nxNEs+oe020GR
	0/PLbS11zLfxS+MpQLZPC9sfD70yw8QD3
X-Received: by 2002:a17:90b:4f45:b0:381:1c96:829b with SMTP id 98e67ed59e1d1-39debf6f167mr11325608a91.3.1789455270507;
        Mon, 14 Sep 2026 23:54:30 -0700 (PDT)
X-Received: by 2002:a17:90b:4f45:b0:381:1c96:829b with SMTP id 98e67ed59e1d1-39debf6f167mr11325533a91.3.1789455269485;
        Mon, 14 Sep 2026 23:54:29 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfda39eb4sm3249725a91.8.2026.09.14.23.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 23:54:29 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 14:54:13 +0800
Subject: [PATCH v7 2/3] media: i2c: og0ve1b: Introduce per-sensor data
 structure
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-og0va1b-v7-2-3a4b6d7360ec@oss.qualcomm.com>
References: <20260915-og0va1b-v7-0-3a4b6d7360ec@oss.qualcomm.com>
In-Reply-To: <20260915-og0va1b-v7-0-3a4b6d7360ec@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789455258; l=10306;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=mP3bvWznXxIIzJowlzW6vQNAZA58uoi4wI4gneF7fkU=;
 b=a6bJ44M/WIph5Z4npnYSmtc02Fks+Mc7zhNhdOQ79+WgGLLN9Z0Mv8wlnnuDQk72lKylcvw/s
 315EWsRuFkkCJc8aqEUPHCDimNpY7ttT08fWz3YLVzdQrZGN5XOAz5p
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDA5NyBTYWx0ZWRfX/x/brO3VZ3K1
 05vC5R2Ex5p9VqaKBTkcaSKssqeBmHvmVLT7fgDGjyXHGGVwPrxTx3zHQR79rJ6aHCT/UyzguBS
 p2yy9z6IjMF17/qJSKDq9fEXeN+VOXs=
X-Authority-Analysis: v=2.4 cv=Kr/YSmWN c=1 sm=1 tr=0 ts=6aa8eba7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=aIh3vjFOF9panSEBuokA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: jL-rbQ20M2i15qGjqd9kZU5qXSCj44BG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDA5NyBTYWx0ZWRfX3DBCJdFN1Z4F
 2NSmIsV61DjZHagHdby9vSH9Yc+uGj2FfO9rODdDGF4kcPm8SknR/vbS7R94suZ6RVJbTf03VoD
 K1lLa6VByQLIGt5f8LPK6zzhaa8WPv0YzOiQbBHKr7j2kc3dSMJxeQywqiTQ4mZwNtAQQX64tbq
 icYjgHoVpcDnEk5OWFNDNIvTkyJ1rGSoEZ59sYrg4Cmc9v1UTYDVeW3WJi+/vMlIrXJFRhbTkja
 8pRGPUFH472mN5kvZK5DPH+GTTEjfRGy2v1dSAj+HK2n0TYaZOqvj+AQYIzf5tJgNoiE8bQrYEd
 dERmk5PtbD9G6FkoFu0VgNAGWyqJ+rpSf19ushxkeQI0fDzVKifGgqNAJj6H5UxWJo33fiGFVjL
 lU3KpCojxDUdlAevKa+j12BaXC2lesqYsnTDUm6HFNc3zcG9yWYLoF2YjJcPpyRpUw0C4ebHVm9
 poXXmvlWwBevTpez0lw==
X-Proofpoint-ORIG-GUID: jL-rbQ20M2i15qGjqd9kZU5qXSCj44BG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150097

Refactor the driver to separate sensor-specific data from the common
driver code. Introduce a sensor_data structure, populated through
i2c_get_match_data(), to hold the chip ID, MCLK frequency, link
frequencies and supported modes.

Test pattern programming is described by a per-sensor callback, and each
mode stores its media bus format code (rather than a bits-per-pixel
value) so that sensors with a different output format can be supported.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Tested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/i2c/og0ve1b.c | 100 +++++++++++++++++++++++++++++++-------------
 1 file changed, 72 insertions(+), 28 deletions(-)

diff --git a/drivers/media/i2c/og0ve1b.c b/drivers/media/i2c/og0ve1b.c
index 84a28cdcade10f8fbcf945999e88f84641b9bc0d..7ab57a3d8d6d0ffabd286cc12fcbcb17dd56d72f 100644
--- a/drivers/media/i2c/og0ve1b.c
+++ b/drivers/media/i2c/og0ve1b.c
@@ -5,6 +5,7 @@
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
+#include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
@@ -65,11 +66,23 @@ struct og0ve1b_mode {
 	u32 height;	/* Frame height in pixels */
 	u32 hts;	/* Horizontal timing size */
 	u32 vts;	/* Default vertical timing size */
-	u32 bpp;	/* Bits per pixel */
+	u32 code;	/* MEDIA_BUS_FMT code */
 
 	const struct og0ve1b_reg_list reg_list;	/* Sensor register setting */
 };
 
+struct og0ve1b;
+
+struct og0ve1b_sensor_data {
+	u64 chip_id;
+	unsigned long mclk_freq;
+	int (*enable_test_pattern)(struct og0ve1b *og0ve1b, u32 pattern);
+	const s64 *link_freq_menu;
+	const struct og0ve1b_mode *modes;
+	int num_link_freqs;
+	int num_modes;
+};
+
 static const char * const og0ve1b_test_pattern_menu[] = {
 	"Disabled",
 	"Vertical Colour Bars",
@@ -99,6 +112,8 @@ struct og0ve1b {
 
 	/* Saved register value */
 	u64 pre_isp;
+
+	const struct og0ve1b_sensor_data *data;
 };
 
 static const struct cci_reg_sequence og0ve1b_640x480_120fps_mode[] = {
@@ -247,13 +262,13 @@ static const struct cci_reg_sequence og0ve1b_640x480_120fps_mode[] = {
 	{ CCI_REG8(0x3f47), 0x35 },
 };
 
-static const struct og0ve1b_mode supported_modes[] = {
+static const struct og0ve1b_mode og0ve1b_supported_modes[] = {
 	{
 		.width = 640,
 		.height = 480,
 		.hts = 792,
 		.vts = 568,
-		.bpp = 8,
+		.code = MEDIA_BUS_FMT_Y8_1X8,
 		.reg_list = {
 			.regs = og0ve1b_640x480_120fps_mode,
 			.num_regs = ARRAY_SIZE(og0ve1b_640x480_120fps_mode),
@@ -273,11 +288,21 @@ static int og0ve1b_enable_test_pattern(struct og0ve1b *og0ve1b, u32 pattern)
 	return cci_write(og0ve1b->regmap, OG0VE1B_REG_PRE_ISP, val, NULL);
 }
 
+static const struct og0ve1b_sensor_data og0ve1b_data = {
+	.chip_id = OG0VE1B_CHIP_ID,
+	.mclk_freq = OG0VE1B_MCLK_FREQ_24MHZ,
+	.enable_test_pattern = og0ve1b_enable_test_pattern,
+	.link_freq_menu = og0ve1b_link_freq_menu,
+	.num_link_freqs = ARRAY_SIZE(og0ve1b_link_freq_menu),
+	.modes = og0ve1b_supported_modes,
+	.num_modes = ARRAY_SIZE(og0ve1b_supported_modes),
+};
+
 static int og0ve1b_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct og0ve1b *og0ve1b = container_of(ctrl->handler, struct og0ve1b,
 					       ctrl_handler);
-	const struct og0ve1b_mode *mode = &supported_modes[0];
+	const struct og0ve1b_mode *mode = &og0ve1b->data->modes[0];
 	s64 exposure_max;
 	int ret;
 
@@ -314,7 +339,7 @@ static int og0ve1b_set_ctrl(struct v4l2_ctrl *ctrl)
 				ctrl->val + mode->height, NULL);
 		break;
 	case V4L2_CID_TEST_PATTERN:
-		ret = og0ve1b_enable_test_pattern(og0ve1b, ctrl->val);
+		ret = og0ve1b->data->enable_test_pattern(og0ve1b, ctrl->val);
 		break;
 	default:
 		ret = -EINVAL;
@@ -330,10 +355,19 @@ static const struct v4l2_ctrl_ops og0ve1b_ctrl_ops = {
 	.s_ctrl = og0ve1b_set_ctrl,
 };
 
+static s64 og0ve1b_pixel_rate(const struct og0ve1b_sensor_data *data)
+{
+	const struct og0ve1b_mode *mode = &data->modes[0];
+	unsigned int bpp = mode->code == MEDIA_BUS_FMT_Y8_1X8 ? 8 : 10;
+
+	return div_u64(data->link_freq_menu[0], bpp);
+}
+
 static int og0ve1b_init_controls(struct og0ve1b *og0ve1b)
 {
 	struct v4l2_ctrl_handler *ctrl_hdlr = &og0ve1b->ctrl_handler;
-	const struct og0ve1b_mode *mode = &supported_modes[0];
+	const struct og0ve1b_mode *mode = &og0ve1b->data->modes[0];
+	const struct og0ve1b_sensor_data *data = og0ve1b->data;
 	s64 exposure_max, pixel_rate, h_blank, v_blank;
 	struct v4l2_fwnode_device_properties props;
 	struct v4l2_ctrl *ctrl;
@@ -343,12 +377,12 @@ static int og0ve1b_init_controls(struct og0ve1b *og0ve1b)
 
 	ctrl = v4l2_ctrl_new_int_menu(ctrl_hdlr, &og0ve1b_ctrl_ops,
 				      V4L2_CID_LINK_FREQ,
-				      ARRAY_SIZE(og0ve1b_link_freq_menu) - 1,
-				      0, og0ve1b_link_freq_menu);
+				      data->num_link_freqs - 1,
+				      0, data->link_freq_menu);
 	if (ctrl)
 		ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
-	pixel_rate = og0ve1b_link_freq_menu[0] / mode->bpp;
+	pixel_rate = og0ve1b_pixel_rate(data);
 	v4l2_ctrl_new_std(ctrl_hdlr, &og0ve1b_ctrl_ops, V4L2_CID_PIXEL_RATE,
 			  0, pixel_rate, 1, pixel_rate);
 
@@ -407,7 +441,7 @@ static int og0ve1b_init_controls(struct og0ve1b *og0ve1b)
 static void og0ve1b_update_pad_format(const struct og0ve1b_mode *mode,
 				      struct v4l2_mbus_framefmt *fmt)
 {
-	fmt->code = MEDIA_BUS_FMT_Y8_1X8;
+	fmt->code = mode->code;
 	fmt->width = mode->width;
 	fmt->height = mode->height;
 	fmt->field = V4L2_FIELD_NONE;
@@ -421,8 +455,8 @@ static int og0ve1b_enable_streams(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *state, u32 pad,
 				  u64 streams_mask)
 {
-	const struct og0ve1b_reg_list *reg_list = &supported_modes[0].reg_list;
 	struct og0ve1b *og0ve1b = to_og0ve1b(sd);
+	const struct og0ve1b_reg_list *reg_list = &og0ve1b->data->modes[0].reg_list;
 	int ret;
 
 	ret = pm_runtime_resume_and_get(og0ve1b->dev);
@@ -484,13 +518,14 @@ static int og0ve1b_set_pad_format(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *state,
 				  struct v4l2_subdev_format *fmt)
 {
+	struct og0ve1b *og0ve1b = to_og0ve1b(sd);
 	struct v4l2_mbus_framefmt *format;
 	const struct og0ve1b_mode *mode;
 
 	format = v4l2_subdev_state_get_format(state, 0);
 
-	mode = v4l2_find_nearest_size(supported_modes,
-				      ARRAY_SIZE(supported_modes),
+	mode = v4l2_find_nearest_size(og0ve1b->data->modes,
+				      og0ve1b->data->num_modes,
 				      width, height,
 				      fmt->format.width,
 				      fmt->format.height);
@@ -505,10 +540,12 @@ static int og0ve1b_enum_mbus_code(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_mbus_code_enum *code)
 {
+	struct og0ve1b *og0ve1b = to_og0ve1b(sd);
+
 	if (code->index > 0)
 		return -EINVAL;
 
-	code->code = MEDIA_BUS_FMT_Y8_1X8;
+	code->code = og0ve1b->data->modes[0].code;
 
 	return 0;
 }
@@ -517,15 +554,18 @@ static int og0ve1b_enum_frame_size(struct v4l2_subdev *sd,
 				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_frame_size_enum *fse)
 {
-	if (fse->index >= ARRAY_SIZE(supported_modes))
+	struct og0ve1b *og0ve1b = to_og0ve1b(sd);
+	const struct og0ve1b_sensor_data *data = og0ve1b->data;
+
+	if (fse->index >= data->num_modes)
 		return -EINVAL;
 
-	if (fse->code != MEDIA_BUS_FMT_Y8_1X8)
+	if (fse->code != data->modes[fse->index].code)
 		return -EINVAL;
 
-	fse->min_width = supported_modes[fse->index].width;
+	fse->min_width = data->modes[fse->index].width;
 	fse->max_width = fse->min_width;
-	fse->min_height = supported_modes[fse->index].height;
+	fse->min_height = data->modes[fse->index].height;
 	fse->max_height = fse->min_height;
 
 	return 0;
@@ -534,13 +574,14 @@ static int og0ve1b_enum_frame_size(struct v4l2_subdev *sd,
 static int og0ve1b_init_state(struct v4l2_subdev *sd,
 			      struct v4l2_subdev_state *state)
 {
+	const struct og0ve1b_mode *mode = &to_og0ve1b(sd)->data->modes[0];
 	struct v4l2_subdev_format fmt = {
 		.which = V4L2_SUBDEV_FORMAT_TRY,
 		.pad = 0,
 		.format = {
-			.code = MEDIA_BUS_FMT_Y8_1X8,
-			.width = supported_modes[0].width,
-			.height = supported_modes[0].height,
+			.code = mode->code,
+			.width = mode->width,
+			.height = mode->height,
 		},
 	};
 
@@ -586,9 +627,9 @@ static int og0ve1b_identify_sensor(struct og0ve1b *og0ve1b)
 		return ret;
 	}
 
-	if (val != OG0VE1B_CHIP_ID) {
-		dev_err(og0ve1b->dev, "chip id mismatch: %x!=%llx\n",
-			OG0VE1B_CHIP_ID, val);
+	if (val != og0ve1b->data->chip_id) {
+		dev_err(og0ve1b->dev, "chip id mismatch: %llx!=%llx\n",
+			og0ve1b->data->chip_id, val);
 		return -ENODEV;
 	}
 
@@ -624,8 +665,8 @@ static int og0ve1b_check_hwcfg(struct og0ve1b *og0ve1b)
 	ret = v4l2_link_freq_to_bitmap(og0ve1b->dev,
 				       bus_cfg.link_frequencies,
 				       bus_cfg.nr_of_link_frequencies,
-				       og0ve1b_link_freq_menu,
-				       ARRAY_SIZE(og0ve1b_link_freq_menu),
+				       og0ve1b->data->link_freq_menu,
+				       og0ve1b->data->num_link_freqs,
 				       &freq_bitmap);
 
 	v4l2_fwnode_endpoint_free(&bus_cfg);
@@ -686,6 +727,9 @@ static int og0ve1b_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	og0ve1b->dev = &client->dev;
+	og0ve1b->data = i2c_get_match_data(client);
+	if (!og0ve1b->data)
+		return -ENODEV;
 
 	v4l2_i2c_subdev_init(&og0ve1b->sd, client, &og0ve1b_subdev_ops);
 
@@ -700,7 +744,7 @@ static int og0ve1b_probe(struct i2c_client *client)
 				     "failed to get XVCLK clock\n");
 
 	freq = clk_get_rate(og0ve1b->xvclk);
-	if (freq && freq != OG0VE1B_MCLK_FREQ_24MHZ)
+	if (freq && freq != og0ve1b->data->mclk_freq)
 		return dev_err_probe(og0ve1b->dev, -EINVAL,
 				     "XVCLK clock frequency %lu is not supported\n",
 				     freq);
@@ -819,7 +863,7 @@ static const struct dev_pm_ops og0ve1b_pm_ops = {
 };
 
 static const struct of_device_id og0ve1b_of_match[] = {
-	{ .compatible = "ovti,og0ve1b" },
+	{ .compatible = "ovti,og0ve1b", .data = &og0ve1b_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, og0ve1b_of_match);

-- 
2.34.1

