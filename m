Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2333F46D09A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 07:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788247911; cv=none; b=RXi/yzhDxSiVm3j1S09OW2pEeWc1khdghcb+r+C4+6JPXN9hml+sopYnJ8HrNDnEJji+ZryvheF4GFfUOk1ygfkQEbFzscmSS/Ug/TUk1bDAGS2eUxZ+uDfLekJBom8ILwPhneICUFbLTdeo5W8mL2un40y6sJs+0SnNX5/sDYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788247911; c=relaxed/simple;
	bh=ykUUSv77OEo5PaKCMO9ysrO1o42/MAKasnMbnUkbxUk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CX2OojHOW1WDMdhErrLV6RJWSFbo+PQKO0mDsKB1LhlR5AWerQSkszTSTrQapMkptL6+rjGcSt7EfUlGLodWRwclRWdIKEOr+9Kobc2P0PGy0qMZx2CPv+phqqDw4v6jJ83kvqjhlKZb6bui6L7+A5G28JyOaWKC8njx2XOui00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BYXfowsC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ePPJG0Tu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BYXfowsC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ePPJG0Tu"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179JUU1975498
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 07:31:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SZDO19ey1PFMEeLfuEOzBYiZLgBVDFsoMKyTR2K1raU=; b=BYXfowsCjkV2AhHu
	iIy75VKD5tTwU47aHjSdcQ2pu5caxE4PEkUr1Q9js3WJ06OuazdX9MY4yOgj4dWp
	9Tx0Pgf7V4qHxXMEuClcLpMKEYw5r9mDjenJC59E6qFak4HPNNw3NSxruIQrb47p
	gYeD+TeblnCF6ZHiqweZ+LN5GiuCTvXeDyLl8cz+FxjxMWXPT9Gqnx2067NanRFg
	rCQhB986hPC8issXO7MVSbn275nRoNyIqZz5OC1SSSVp9u/PDhTADlaPPnnaTCIQ
	4nDUMWTq0H1bgFoKx02qKG4RBPMMsUIy7htDVW1xM1HtUxLoWtGT3+AqPUam72Pg
	mqP3DQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp7r11y3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 07:31:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-938153538caso111938185a.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 00:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788247906; x=1788852706; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SZDO19ey1PFMEeLfuEOzBYiZLgBVDFsoMKyTR2K1raU=;
        b=ePPJG0TuvI5GEboN2jY7jufleXaO9RgZcaYsZjMOkqXh2vlibICYq5E6kmAkjZFaf+
         1kRgR2AgYEClRJHlwj4LAWU8t8YimeHut/hFbA+dBdxohA/fMqOsku+RU21hAhTqdaFX
         vXTZvKNyo2cNa0dLX631Pds9po0OhX2WYnbydbhHR7jn4M11LNTXyxOg2YUy4RS7uM/0
         OfNI8u2TLhweO58McDLknyAdtuRrW8+hD9wUvAm587Vy+DRtFTqcA7Pq3mjAvk3C42T1
         ldy9+4+gWI8/XzG+tILvHkjrvE8zBJ16FS4BnNmwI2o1ccHTQdrK/IMm32kx2RJDzQV8
         TIsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788247906; x=1788852706;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SZDO19ey1PFMEeLfuEOzBYiZLgBVDFsoMKyTR2K1raU=;
        b=cpSQScEOxAEFAZNftjuQi2pIov8oMUf/vDIdXcMiUvH5XHzFezm36e3ph4tdHw0dPz
         ng1qSto44vvCrOmIjJQN8zub7NpZ3on1orMQ8xGuFwnEDf48L/EVulQX6IdzxsErQmoh
         4a5L8m4dN3WeNBMOdKP/Vqg/ycl98p12PiEK5ckW8fqHorEzB930vzq8QWOwnNn2Wbd8
         3n5G7Dk2NJWKoGZLbOTMHepqyHb1LRqzu1KuYGx0HZgruIJyAYrglyHxDQqmv8mIoG46
         C/YiR/urJvKX8kJkfrUFHWzaVIvo8Z3db8qw137aXvAn40XHzpghJmNoUFYLisgQKYvO
         69hA==
X-Forwarded-Encrypted: i=1; AHgh+RpjNPZF++Qj03dfwuTQAfBETZdT4OjZVm5PP+BoX/ZStxVF/ZabBV8Hz4jDIK6v1/X9QkpkdyanU0uiqmw=@vger.kernel.org
X-Gm-Message-State: AFuF++kPkU25uRhuzGfnkfdLBVchZEZMPhUIHsn0+33YtgONF2jGWB7j
	K07sBVXqgCAL3Np6ggYuOPXKMC9/9aNS6+IZXpx0bAVt9nO6bQbUmG6u8wW0bXVot7PvwohheGT
	cATJcan9lxhSnYoiDqCqRZRJpD0Ry4BvP3zG9luLSpXPgG3AR3qzq34yvmS9QvCMs2iA=
X-Gm-Gg: AR+sD12MaMuW+6UY3czgn4qjQy0hlsXdpu+NKeLEj76kaocLXEAe4BEVbXcmI+Qiu/1
	+HF19T0Wy66ml3AHxI8CpU7Rzb/Z2muuskSw6avguB9uzDGR7gPwlA0vqx1ghmX8ZHaOs+UX/1t
	lOrX90AFHsonQlwBTmeS5d0s0SI69rfgtsRWoNF11Ocyo5rnXu0XKpyBoyBqh7xLtvsrv6i54Sh
	I1rgtnDE+Ji3CAcOfCjrBiKhQZ7vexkHCU+39MnnzSGYgyhTFrr0UuVQ581f1Tsnp61xIL+LcE8
	ohdO/oCaMU+tXGPJFI3j7vLpXqjpellEEnCXKCmSYYQQT9vNmobUa0nT6COs9p7rHOxvM6fkeAz
	x08PZX07Fnr2lHAY0y+6mwR8my0Cvuzj0/jrBnsw2B7IhCSvn+rbZB8bRJxTJv7cWHZ7o
X-Received: by 2002:a05:620a:a0c9:10b0:939:595:e132 with SMTP id af79cd13be357-939137b133amr2890136085a.5.1788247906107;
        Tue, 01 Sep 2026 00:31:46 -0700 (PDT)
X-Received: by 2002:a05:620a:a0c9:10b0:939:595:e132 with SMTP id af79cd13be357-939137b133amr2890132585a.5.1788247905602;
        Tue, 01 Sep 2026 00:31:45 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93918b0f825sm946766785a.40.2026.09.01.00.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:31:45 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 15:31:07 +0800
Subject: [PATCH RESEND v5 4/4] media: i2c: og0ve1b: Add support for
 OmniVision OG0VA1B
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-og0va1b-v5-4-b0400a9bac01@oss.qualcomm.com>
References: <20260901-og0va1b-v5-0-b0400a9bac01@oss.qualcomm.com>
In-Reply-To: <20260901-og0va1b-v5-0-b0400a9bac01@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788247879; l=13942;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=ykUUSv77OEo5PaKCMO9ysrO1o42/MAKasnMbnUkbxUk=;
 b=y+wnv5eh9De4dz2jijNaQZKZ7w4zlCdfDq/mUiBCS4dtbD7QSF0dPnc382Iyk9QLm6RwaH7zk
 9YowMxvG6YSCsx93cuvyV7NyrMGhNWjf0wT8g7Bae/RZzLj+BZ4xgec
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=beZbluPB c=1 sm=1 tr=0 ts=6a967f62 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=kvSDJSb0XTZWr82cfuIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA2NiBTYWx0ZWRfX95VbeC6f4mH6
 R5MeC6Ho5ksf2BagxUT3RtQKSsc3gMIuI0ykWu8m6wGa9IZF0ElINb+6i8s+JBkgypIVMP2BFRK
 7WHSulF6xq9zVyuEzGayx6KMLTTHdJhb/yd8dnHFfjJ2179ETrS91VR7+4M65U4XRVK1eeczqyU
 KcS0Cf9pECRj1tlQiPpdpAhKzsJr2VTamLqPUXiboFlAXoO4/Br3QQB98s1VeG/IC7nv0jBgliI
 TlgjD325U7fqbGFQSAn6qsABpsDveLnQCob2ydpKHIZbLhd16oQy7k4gUetJwuulzmbXP2eOAWF
 5mXq/1pfJN1Ckw2dyYsz8EX8EPOLLlrK75n6zl7P5gjhYUAjgtFVJoJTBajTTigHblNEFLURn9C
 tNtI/0pXUSq23FNPsPGiLdZIPAt6tO2xdt+sTTpoRijNQAXbVakl2xrfgEh3BaOKtYI1kDQ5nGA
 3IiPykcu5C/XR1Rz/8A==
X-Proofpoint-GUID: KTXz_GUiqOScxOM6mVCgF7yD-EWHXDLU
X-Proofpoint-ORIG-GUID: KTXz_GUiqOScxOM6mVCgF7yD-EWHXDLU
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA2NiBTYWx0ZWRfX83qwKLnLp4Is
 IqqhahhPNPAmTmLjdJ6daBWFfvLYIAbqS4G5KB9QrmljVZcVE0WduQ5buZy/IR824WCJL9wy5zK
 dBagwUfVqsf9XkEusreehVz/GncxNXo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010066

The OmniVision OG0VA1B is a monochrome image sensor closely related to
the OG0VE1B. It shares the SCCB control interface, power supplies and
the single-lane MIPI D-PHY description, and differs in its chip id, the
test pattern register, the register programming and the output format
(10-bit RAW instead of 8-bit).

Add an og0ve1b_sensor_data entry describing the OG0VA1B together with
its 640x480 60fps register sequence.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Tested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org> # og0ve1b
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/i2c/og0ve1b.c | 278 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 266 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/og0ve1b.c b/drivers/media/i2c/og0ve1b.c
index f560d5d90fda94abf4bc622c5e4f861b078b811f..7b8555a833c255652204d5f4c87c8d701c3008e6 100644
--- a/drivers/media/i2c/og0ve1b.c
+++ b/drivers/media/i2c/og0ve1b.c
@@ -15,10 +15,14 @@
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
 
+#define OG0VA1B_LINK_FREQ_480MHZ	(480 * HZ_PER_MHZ)
+#define OG0VA1B_MCLK_FREQ_19_2MHZ	(19200 * HZ_PER_KHZ)
+
 #define OG0VE1B_LINK_FREQ_500MHZ	(500 * HZ_PER_MHZ)
 #define OG0VE1B_MCLK_FREQ_24MHZ		(24 * HZ_PER_MHZ)
 
-#define OG0VE1B_REG_CHIP_ID		CCI_REG24(0x300a)
+#define OG0V_REG_CHIP_ID		CCI_REG24(0x300a)
+#define OG0VA1B_CHIP_ID			0xc75641
 #define OG0VE1B_CHIP_ID			0xc75645
 
 #define OG0VE1B_REG_MODE_SELECT		CCI_REG8(0x0100)
@@ -46,12 +50,18 @@
 #define OG0VE1B_REG_VTS			CCI_REG16(0x380e)
 #define OG0VE1B_VTS_MAX			0xffff
 
-/* Test pattern */
+/* Test pattern - OG0VA1B uses 0x5100, OG0VE1B uses 0x5e00 */
+#define OG0VA1B_REG_TEST_PATTERN	CCI_REG8(0x5100)
+#define OG0VA1B_TEST_PATTERN_BAR_SHIFT	2
 #define OG0VE1B_REG_PRE_ISP		CCI_REG8(0x5e00)
 #define OG0VE1B_TEST_PATTERN_ENABLE	BIT(7)
 
 #define to_og0ve1b(_sd)			container_of(_sd, struct og0ve1b, sd)
 
+static const s64 og0va1b_link_freq_menu[] = {
+	OG0VA1B_LINK_FREQ_480MHZ,
+};
+
 static const s64 og0ve1b_link_freq_menu[] = {
 	OG0VE1B_LINK_FREQ_500MHZ,
 };
@@ -74,15 +84,31 @@ struct og0ve1b_mode {
 struct og0ve1b;
 
 struct og0ve1b_sensor_data {
+	const char *name;
 	u64 chip_id;
 	unsigned long mclk_freq;
 	int (*enable_test_pattern)(struct og0ve1b *og0ve1b, u32 pattern);
+	const char * const *test_pattern_menu;
+	int num_test_patterns;
+	bool cache_test_pattern_reg;
+	/* Exposure register unit: OG0VE1B 1/16 line (4), OG0VA1B whole lines (0). */
+	unsigned int exposure_shift;
+	/* Pixel rate multiplier: OG0VA1B uses CSI-2 DDR (2), OG0VE1B keeps 1. */
+	unsigned int pixel_rate_mul;
 	const s64 *link_freq_menu;
 	int num_link_freqs;
 	const struct og0ve1b_mode *modes;
 	int num_modes;
 };
 
+static const char * const og0va1b_test_pattern_menu[] = {
+	"Disabled",
+	"Standard Test Bar",
+	"Top-Bottom Darker Test Bar",
+	"Right-Left Darker Test Bar",
+	"Bottom-Top Darker Test Bar",
+};
+
 static const char * const og0ve1b_test_pattern_menu[] = {
 	"Disabled",
 	"Standard Test Bar",
@@ -116,6 +142,196 @@ struct og0ve1b {
 	const struct og0ve1b_sensor_data *data;
 };
 
+static const struct cci_reg_sequence og0va1b_640x480_60fps_mode[] = {
+	{ CCI_REG8(0x0302), 0x31 },
+	{ CCI_REG8(0x0303), 0x02 },
+	{ CCI_REG8(0x0304), 0x01 },
+	{ CCI_REG8(0x0305), 0x90 },
+	{ CCI_REG8(0x0306), 0x00 },
+	{ CCI_REG8(0x0323), 0x02 },
+	{ CCI_REG8(0x0325), 0x68 },
+	{ CCI_REG8(0x0326), 0xd8 },
+	{ CCI_REG8(0x3006), 0x0e },
+	{ CCI_REG8(0x300d), 0x08 },
+	{ CCI_REG8(0x3018), 0xf0 },
+	{ CCI_REG8(0x301c), 0xf0 },
+	{ CCI_REG8(0x3020), 0x20 },
+	{ CCI_REG8(0x3040), 0x0f },
+	{ CCI_REG8(0x3022), 0x01 },
+	{ CCI_REG8(0x3107), 0x40 },
+	{ CCI_REG8(0x3216), 0x01 },
+	{ CCI_REG8(0x3217), 0x00 },
+	{ CCI_REG8(0x3218), 0xc0 },
+	{ CCI_REG8(0x3219), 0x55 },
+	{ CCI_REG8(0x3506), 0x01 },
+	{ CCI_REG8(0x3507), 0x50 },
+	{ CCI_REG8(0x3508), 0x01 },
+	{ CCI_REG8(0x3509), 0x00 },
+	{ CCI_REG8(0x350a), 0x01 },
+	{ CCI_REG8(0x350b), 0x00 },
+	{ CCI_REG8(0x350c), 0x00 },
+	{ CCI_REG8(0x3541), 0x00 },
+	{ CCI_REG8(0x3542), 0x40 },
+	{ CCI_REG8(0x3605), 0x90 },
+	{ CCI_REG8(0x3606), 0x41 },
+	{ CCI_REG8(0x3612), 0x00 },
+	{ CCI_REG8(0x3620), 0x08 },
+	{ CCI_REG8(0x3630), 0x17 },
+	{ CCI_REG8(0x3631), 0x99 },
+	{ CCI_REG8(0x3639), 0x88 },
+	{ CCI_REG8(0x3668), 0x00 },
+	{ CCI_REG8(0x3674), 0x00 },
+	{ CCI_REG8(0x3677), 0x3f },
+	{ CCI_REG8(0x368f), 0x06 },
+	{ CCI_REG8(0x36a2), 0x19 },
+	{ CCI_REG8(0x36a4), 0xf1 },
+	{ CCI_REG8(0x36a5), 0x2d },
+	{ CCI_REG8(0x3706), 0x30 },
+	{ CCI_REG8(0x370d), 0x72 },
+	{ CCI_REG8(0x3713), 0x86 },
+	{ CCI_REG8(0x3715), 0x03 },
+	{ CCI_REG8(0x3716), 0x00 },
+	{ CCI_REG8(0x376d), 0x24 },
+	{ CCI_REG8(0x3770), 0x3a },
+	{ CCI_REG8(0x3778), 0x00 },
+	{ CCI_REG8(0x37a8), 0x03 },
+	{ CCI_REG8(0x37a9), 0x00 },
+	{ CCI_REG8(0x37df), 0x7d },
+	{ CCI_REG8(0x3800), 0x00 },
+	{ CCI_REG8(0x3801), 0x00 },
+	{ CCI_REG8(0x3802), 0x00 },
+	{ CCI_REG8(0x3803), 0x00 },
+	{ CCI_REG8(0x3804), 0x02 },
+	{ CCI_REG8(0x3805), 0x8f },
+	{ CCI_REG8(0x3806), 0x01 },
+	{ CCI_REG8(0x3807), 0xef },
+	{ CCI_REG8(0x3808), 0x02 },
+	{ CCI_REG8(0x3809), 0x80 },
+	{ CCI_REG8(0x380a), 0x01 },
+	{ CCI_REG8(0x380b), 0xe0 },
+	{ CCI_REG8(0x380c), 0x01 },
+	{ CCI_REG8(0x380d), 0x78 },
+	{ CCI_REG8(0x380e), 0x08 },
+	{ CCI_REG8(0x380f), 0x30 },
+	{ CCI_REG8(0x3810), 0x00 },
+	{ CCI_REG8(0x3811), 0x08 },
+	{ CCI_REG8(0x3812), 0x00 },
+	{ CCI_REG8(0x3813), 0x08 },
+	{ CCI_REG8(0x3814), 0x11 },
+	{ CCI_REG8(0x3815), 0x11 },
+	{ CCI_REG8(0x3816), 0x00 },
+	{ CCI_REG8(0x3817), 0x01 },
+	{ CCI_REG8(0x3818), 0x00 },
+	{ CCI_REG8(0x3819), 0x05 },
+	{ CCI_REG8(0x3820), 0x40 },
+	{ CCI_REG8(0x3821), 0x04 },
+	{ CCI_REG8(0x3823), 0x00 },
+	{ CCI_REG8(0x3826), 0x00 },
+	{ CCI_REG8(0x3827), 0x00 },
+	{ CCI_REG8(0x382b), 0x52 },
+	{ CCI_REG8(0x384a), 0xa2 },
+	{ CCI_REG8(0x3858), 0x00 },
+	{ CCI_REG8(0x3859), 0x00 },
+	{ CCI_REG8(0x3860), 0x00 },
+	{ CCI_REG8(0x3861), 0x00 },
+	{ CCI_REG8(0x3866), 0x0c },
+	{ CCI_REG8(0x3867), 0x07 },
+	{ CCI_REG8(0x3884), 0x00 },
+	{ CCI_REG8(0x3885), 0x08 },
+	{ CCI_REG8(0x3888), 0x50 },
+	{ CCI_REG8(0x3893), 0x6c },
+	{ CCI_REG8(0x3898), 0x00 },
+	{ CCI_REG8(0x389a), 0x04 },
+	{ CCI_REG8(0x389b), 0x01 },
+	{ CCI_REG8(0x389c), 0x0b },
+	{ CCI_REG8(0x389d), 0xdc },
+	{ CCI_REG8(0x38b1), 0x04 },
+	{ CCI_REG8(0x38b2), 0x00 },
+	{ CCI_REG8(0x38b3), 0x08 },
+	{ CCI_REG8(0x38c1), 0x46 },
+	{ CCI_REG8(0x38c9), 0x02 },
+	{ CCI_REG8(0x38d4), 0x06 },
+	{ CCI_REG8(0x38d5), 0x5a },
+	{ CCI_REG8(0x38d6), 0x08 },
+	{ CCI_REG8(0x38d7), 0x3a },
+	{ CCI_REG8(0x391f), 0x00 },
+	{ CCI_REG8(0x3920), 0xaa },
+	{ CCI_REG8(0x3921), 0x00 },
+	{ CCI_REG8(0x3922), 0x00 },
+	{ CCI_REG8(0x3923), 0x00 },
+	{ CCI_REG8(0x3924), 0x00 },
+	{ CCI_REG8(0x3925), 0x00 },
+	{ CCI_REG8(0x3926), 0x00 },
+	{ CCI_REG8(0x3927), 0x00 },
+	{ CCI_REG8(0x3928), 0x10 },
+	{ CCI_REG8(0x3929), 0x01 },
+	{ CCI_REG8(0x392a), 0xb4 },
+	{ CCI_REG8(0x392b), 0x00 },
+	{ CCI_REG8(0x392c), 0x10 },
+	{ CCI_REG8(0x392d), 0x01 },
+	{ CCI_REG8(0x392e), 0x78 },
+	{ CCI_REG8(0x392f), 0x4a },
+	{ CCI_REG8(0x391e), 0x01 },
+	{ CCI_REG8(0x389f), 0x08 },
+	{ CCI_REG8(0x38a0), 0x00 },
+	{ CCI_REG8(0x38a1), 0x00 },
+	{ CCI_REG8(0x3a06), 0x06 },
+	{ CCI_REG8(0x3a07), 0x78 },
+	{ CCI_REG8(0x3a08), 0x08 },
+	{ CCI_REG8(0x3a09), 0x80 },
+	{ CCI_REG8(0x3a52), 0x00 },
+	{ CCI_REG8(0x3a53), 0x01 },
+	{ CCI_REG8(0x3a54), 0x0c },
+	{ CCI_REG8(0x3a55), 0x04 },
+	{ CCI_REG8(0x3a58), 0x0c },
+	{ CCI_REG8(0x3a59), 0x04 },
+	{ CCI_REG8(0x4000), 0xcf },
+	{ CCI_REG8(0x4003), 0x40 },
+	{ CCI_REG8(0x4008), 0x04 },
+	{ CCI_REG8(0x4009), 0x13 },
+	{ CCI_REG8(0x400a), 0x02 },
+	{ CCI_REG8(0x400b), 0x34 },
+	{ CCI_REG8(0x4010), 0x71 },
+	{ CCI_REG8(0x4042), 0xc3 },
+	{ CCI_REG8(0x4306), 0x04 },
+	{ CCI_REG8(0x4307), 0x12 },
+	{ CCI_REG8(0x4500), 0x70 },
+	{ CCI_REG8(0x4509), 0x00 },
+	{ CCI_REG8(0x450b), 0x83 },
+	{ CCI_REG8(0x4604), 0x68 },
+	{ CCI_REG8(0x481b), 0x44 },
+	{ CCI_REG8(0x481f), 0x30 },
+	{ CCI_REG8(0x4823), 0x44 },
+	{ CCI_REG8(0x4825), 0x35 },
+	{ CCI_REG8(0x4837), 0x11 },
+	{ CCI_REG8(0x4f00), 0x04 },
+	{ CCI_REG8(0x4f10), 0x04 },
+	{ CCI_REG8(0x4f21), 0x01 },
+	{ CCI_REG8(0x4f22), 0x00 },
+	{ CCI_REG8(0x4f23), 0x54 },
+	{ CCI_REG8(0x4f24), 0x51 },
+	{ CCI_REG8(0x4f25), 0x41 },
+	{ CCI_REG8(0x5000), 0x3f },
+	{ CCI_REG8(0x5001), 0x80 },
+	{ CCI_REG8(0x500a), 0x00 },
+	{ CCI_REG8(0x5100), 0x00 },
+	{ CCI_REG8(0x5111), 0x20 },
+};
+
+static const struct og0ve1b_mode og0va1b_supported_modes[] = {
+	{
+		.width = 640,
+		.height = 480,
+		.hts = 752,
+		.vts = 2096,
+		.code = MEDIA_BUS_FMT_Y10_1X10,
+		.reg_list = {
+			.regs = og0va1b_640x480_60fps_mode,
+			.num_regs = ARRAY_SIZE(og0va1b_640x480_60fps_mode),
+		},
+	},
+};
+
 static const struct cci_reg_sequence og0ve1b_640x480_120fps_mode[] = {
 	{ CCI_REG8(0x30a0), 0x02 },
 	{ CCI_REG8(0x30a1), 0x00 },
@@ -276,6 +492,17 @@ static const struct og0ve1b_mode og0ve1b_supported_modes[] = {
 	},
 };
 
+static int og0va1b_enable_test_pattern(struct og0ve1b *og0ve1b, u32 pattern)
+{
+	u64 val = 0;
+
+	if (pattern)
+		val = ((pattern - 1) << OG0VA1B_TEST_PATTERN_BAR_SHIFT) |
+		      OG0VE1B_TEST_PATTERN_ENABLE;
+
+	return cci_write(og0ve1b->regmap, OG0VA1B_REG_TEST_PATTERN, val, NULL);
+}
+
 static int og0ve1b_enable_test_pattern(struct og0ve1b *og0ve1b, u32 pattern)
 {
 	u64 val = og0ve1b->pre_isp;
@@ -288,10 +515,31 @@ static int og0ve1b_enable_test_pattern(struct og0ve1b *og0ve1b, u32 pattern)
 	return cci_write(og0ve1b->regmap, OG0VE1B_REG_PRE_ISP, val, NULL);
 }
 
+static const struct og0ve1b_sensor_data og0va1b_data = {
+	.name = "og0va1b",
+	.chip_id = OG0VA1B_CHIP_ID,
+	.mclk_freq = OG0VA1B_MCLK_FREQ_19_2MHZ,
+	.enable_test_pattern = og0va1b_enable_test_pattern,
+	.test_pattern_menu = og0va1b_test_pattern_menu,
+	.num_test_patterns = ARRAY_SIZE(og0va1b_test_pattern_menu),
+	.exposure_shift = 0,
+	.pixel_rate_mul = 2,
+	.link_freq_menu = og0va1b_link_freq_menu,
+	.num_link_freqs = ARRAY_SIZE(og0va1b_link_freq_menu),
+	.modes = og0va1b_supported_modes,
+	.num_modes = ARRAY_SIZE(og0va1b_supported_modes),
+};
+
 static const struct og0ve1b_sensor_data og0ve1b_data = {
+	.name = "og0ve1b",
 	.chip_id = OG0VE1B_CHIP_ID,
 	.mclk_freq = OG0VE1B_MCLK_FREQ_24MHZ,
 	.enable_test_pattern = og0ve1b_enable_test_pattern,
+	.test_pattern_menu = og0ve1b_test_pattern_menu,
+	.num_test_patterns = ARRAY_SIZE(og0ve1b_test_pattern_menu),
+	.cache_test_pattern_reg = true,
+	.exposure_shift = 4,
+	.pixel_rate_mul = 1,
 	.link_freq_menu = og0ve1b_link_freq_menu,
 	.num_link_freqs = ARRAY_SIZE(og0ve1b_link_freq_menu),
 	.modes = og0ve1b_supported_modes,
@@ -332,7 +580,8 @@ static int og0ve1b_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	case V4L2_CID_EXPOSURE:
 		ret = cci_write(og0ve1b->regmap, OG0VE1B_REG_EXPOSURE,
-				ctrl->val << 4, NULL);
+				ctrl->val << og0ve1b->data->exposure_shift,
+				NULL);
 		break;
 	case V4L2_CID_VBLANK:
 		ret = cci_write(og0ve1b->regmap, OG0VE1B_REG_VTS,
@@ -360,7 +609,7 @@ static s64 og0ve1b_pixel_rate(const struct og0ve1b_sensor_data *data)
 	const struct og0ve1b_mode *mode = &data->modes[0];
 	unsigned int bpp = mode->code == MEDIA_BUS_FMT_Y8_1X8 ? 8 : 10;
 
-	return div_u64(data->link_freq_menu[0], bpp);
+	return div_u64(data->link_freq_menu[0] * data->pixel_rate_mul, bpp);
 }
 
 static int og0ve1b_init_controls(struct og0ve1b *og0ve1b)
@@ -413,8 +662,8 @@ static int og0ve1b_init_controls(struct og0ve1b *og0ve1b)
 
 	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &og0ve1b_ctrl_ops,
 				     V4L2_CID_TEST_PATTERN,
-				     ARRAY_SIZE(og0ve1b_test_pattern_menu) - 1,
-				     0, 0, og0ve1b_test_pattern_menu);
+				     data->num_test_patterns - 1,
+				     0, 0, data->test_pattern_menu);
 
 	if (ctrl_hdlr->error)
 		return ctrl_hdlr->error;
@@ -621,7 +870,7 @@ static int og0ve1b_identify_sensor(struct og0ve1b *og0ve1b)
 	u64 val;
 	int ret;
 
-	ret = cci_read(og0ve1b->regmap, OG0VE1B_REG_CHIP_ID, &val, NULL);
+	ret = cci_read(og0ve1b->regmap, OG0V_REG_CHIP_ID, &val, NULL);
 	if (ret) {
 		dev_err(og0ve1b->dev, "failed to read chip id: %d\n", ret);
 		return ret;
@@ -633,10 +882,12 @@ static int og0ve1b_identify_sensor(struct og0ve1b *og0ve1b)
 		return -ENODEV;
 	}
 
-	ret = cci_read(og0ve1b->regmap, OG0VE1B_REG_PRE_ISP,
-		       &og0ve1b->pre_isp, NULL);
-	if (ret)
-		dev_err(og0ve1b->dev, "failed to read pre_isp: %d\n", ret);
+	if (og0ve1b->data->cache_test_pattern_reg) {
+		ret = cci_read(og0ve1b->regmap, OG0VE1B_REG_PRE_ISP,
+			       &og0ve1b->pre_isp, NULL);
+		if (ret)
+			dev_err(og0ve1b->dev, "failed to read pre_isp: %d\n", ret);
+	}
 
 	return ret;
 }
@@ -732,6 +983,8 @@ static int og0ve1b_probe(struct i2c_client *client)
 		return -ENODEV;
 
 	v4l2_i2c_subdev_init(&og0ve1b->sd, client, &og0ve1b_subdev_ops);
+	v4l2_i2c_subdev_set_name(&og0ve1b->sd, client,
+				 og0ve1b->data->name, NULL);
 
 	og0ve1b->regmap = devm_cci_regmap_init_i2c(client, 16);
 	if (IS_ERR(og0ve1b->regmap))
@@ -863,6 +1116,7 @@ static const struct dev_pm_ops og0ve1b_pm_ops = {
 };
 
 static const struct of_device_id og0ve1b_of_match[] = {
+	{ .compatible = "ovti,og0va1b", .data = &og0va1b_data },
 	{ .compatible = "ovti,og0ve1b", .data = &og0ve1b_data },
 	{ /* sentinel */ }
 };
@@ -881,5 +1135,5 @@ static struct i2c_driver og0ve1b_i2c_driver = {
 module_i2c_driver(og0ve1b_i2c_driver);
 
 MODULE_AUTHOR("Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>");
-MODULE_DESCRIPTION("OmniVision OG0VE1B sensor driver");
+MODULE_DESCRIPTION("OmniVision OG0VE1B/OG0VA1B sensor driver");
 MODULE_LICENSE("GPL");

-- 
2.34.1

