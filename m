Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934B4446055
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789455279; cv=none; b=icsgViqNvzYd4DLLd8oTUvunOWYpzrVxwPNlK1DD6q+z1d1aVGd9308yq3ijD6uoAfKiPyFmHNYK13p4CxfCXqYWTI90VPNl0uYUTIi9IXTc1t1qTbzB4NpsJKrMHytD/1fvof2XMBj3lwt+5+7Fm8AviBa8JjB7inbvn4QUlks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789455279; c=relaxed/simple;
	bh=KkOHNN5y6Bw0YBQ9UoQoIgXQ60+QehbpNVxdInDODMo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YkUVwFzWRnY+/K5FvbuJeWKkUeETqJ6Mf/qI9kqsL8Pcv0bYL3are9Dkb1czQrntHPwNi2nmiV77ZLkjfJJSD5S1o+2Cttsw6Sr3Z9yPzijNx2e8/a45YYyZQzCekYY6VEBaRNNVFKXszNO8N3/94j14armNInv7D6olcdFQ+Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PKkgdnQ5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MgqWRyUe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PKkgdnQ5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MgqWRyUe"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6Z8hw2892415
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:54:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wsYb9rI1fvsJJz9qkf1TUdlooBiRXnlJAMZYQr4RmFE=; b=PKkgdnQ5zhS/4T8L
	bf64LdE89G+cRWK7BrF7GwyFOGzvRV4Z1ojCkbcHvJ5A97lJ414uGyrLlTUzIGxL
	XvBTyv/wnTG756PA77W1SBliFHJFg5v04qBmAw17Nv/ySYaYpnrMUWTywGbngf9P
	nYsCypqYEiGHe33//gCmLPncLABjVHBmZmK2P/P2QB6J7l1fDHyUNBRT47jyVrmz
	o4sVVBRjfxK2zT6O4F6eVzKoibgcAkq+7MfC6NmjfwOF2HS2+/oUzcQfH2j1zzW6
	E1mgjJht1mvI828STGTt4gBRy2q76a58Mr+DTMJu+itT6593klhIlQzR1Eg5oO/Z
	bXmIVw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpg2kv5b1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:54:35 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-398dc3d8f0fso707722a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 23:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789455274; x=1790060074; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wsYb9rI1fvsJJz9qkf1TUdlooBiRXnlJAMZYQr4RmFE=;
        b=MgqWRyUeBgcrysUiPWBK8CMRBPmZOLrfnatHY/BRiZJwLlI1aJKVr9jE/MyUlOauZk
         UFbVuqAl+2Mq6FxFPUiMRqYkxnIqEER50TW63dUK+zJ3mw+sPRdn9mRPa/lxeoAFmLJT
         w6S2sPo+7ftpCenwyYWUCnjDbqb2B/Qd1byVs1Hn6o+6tbdvG2myZ/CXMZHQHyTGhg1r
         3QPRto9RW5VJTquqERqlyhOUVL6TfUU3h2ORqrd8Joxeu7L1E+dNK+fhIlWc5iCxISHk
         SwShwKe5qaN7LR/irHQVpwKgijLZPsvFea4g29MuEXE77IwYieqyx9tvrMNJTuUD8s4m
         v+xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789455274; x=1790060074;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wsYb9rI1fvsJJz9qkf1TUdlooBiRXnlJAMZYQr4RmFE=;
        b=mFEeitbMFSxv/YpH5SNevXiV7n/rkNm5pr8BpgS1GTkWVz5xVVO+gZEzDUaFBkztNp
         W6gSOjrVkLe2CP9U5FIS9bfsPwVeRbNIG/TAkop8gdJRRJ+pg1jF4fIalZZcNwqrQ3Q9
         YHF9V6FppbtSHhHqBeMxHPJAxakQNVEJyiGo/jgXaZTxCB2+zoaWm9ALyDlGwfKBuMhY
         XiODa48mad7QC9qtOjmLInb91vZvXDiF8ZAFdLuLCsOfgZnxyAg02LM9agzFkMKNmJE7
         N7K1caXGHFfuiAfD85ZMdS3TUHmvTf8z92cYpcRT1jQVWgRyQGLySFFhCBBPUQPuyTKs
         hB9A==
X-Forwarded-Encrypted: i=1; AKwUvBxSksDM1d8xxF2A/SkMpUPcwLC1SsxQ0auT7EALQKj7J/MYXGUHhcLo/duZZARh0vWqx4cPY1Bzoe5s5LU=@vger.kernel.org
X-Gm-Message-State: AFuF++nQeCdJsRV2rmAc092WpDTjVni23dd2G3uLxo67nKTwU5jrP2C0
	8z6N+ocenCSrLWPY2ngEB6juGFTcm/AVfSNuIjAuFUCgqdZUWdBvnf3w/7mTrsECokh5BLy0Pr7
	NlEd/usSlgHAhIPbWrLbYUuapkbu6K6LsdjfakeMAkAvhJ6y1BAFscVJRBjdJfw+m+b8=
X-Gm-Gg: AYBFou0Zcfl8DJdHrMxRsIipp7DF7pIgz/hElTAKTjxa7bm8FDiQnaF7b/BUlaaY/fm
	HrFIrvJSwHQJJUTsDkysnKF1V2YCN7hcHw1422Jv7qihmBACVOBMuBJGNYi6ckM2sBw8IjTa2mj
	tKs2JD1vUU9zZIoegFMAgbEjT7MBNzFYjOuooguL4i9t9lQxki9CjPAApDg8foB9Mf+zUY9IwdX
	Qzt8OptdjxBSOvfhlndQDTfoQ2H0DSLMScvLOHhoHCUxlgdtThcYjU0K9x+Yh4H/sLcnpBucuU6
	RxQgoLIaH5qvPDP5i1BYRNHxMF4JhGC4soClKdjeQ2nabSV9a9sdR7Ou/JS7VR/1KvG0H+YuQ5L
	0uUsxGza9u22AiMBEpwaj486KQa1fpknF
X-Received: by 2002:a17:90b:33c8:b0:398:c6e1:dceb with SMTP id 98e67ed59e1d1-39dfe036433mr3823736a91.9.1789455274095;
        Mon, 14 Sep 2026 23:54:34 -0700 (PDT)
X-Received: by 2002:a17:90b:33c8:b0:398:c6e1:dceb with SMTP id 98e67ed59e1d1-39dfe036433mr3823696a91.9.1789455273427;
        Mon, 14 Sep 2026 23:54:33 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfda39eb4sm3249725a91.8.2026.09.14.23.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 23:54:32 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 14:54:14 +0800
Subject: [PATCH v7 3/3] media: i2c: og0ve1b: Add support for OmniVision
 OG0VA1B
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-og0va1b-v7-3-3a4b6d7360ec@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789455258; l=18743;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=KkOHNN5y6Bw0YBQ9UoQoIgXQ60+QehbpNVxdInDODMo=;
 b=eo8jM45xG+OWLpvc3A0YdOG2XCYE1p9RFjymvYx6vTeL7+8FmSMdcYp0qsE2UvVboHVUy3YqG
 74lx2YLy/56A5jpvslObf/iI7gzUl4AMyey4huxxU0axnn0isPqnw3u
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: pZnMymNrvugXZGy4bVanlhvo4XldilZM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDA5NyBTYWx0ZWRfX+m19K+Hx0Ohb
 5H8y3+BCY5XrG0WEqC4OYiV4liW37OmwqnARiaV7WFjF8/2QjsOklFBodMyi9yNC3aMHYb4Wa4K
 aZFoY/jJGcfrothiFHOEhwls0nkWMyradtRD23WYjDd6L5oyooreMIj27wxIuq7lFK3uYXj6BFJ
 P74ifayPWjWNmSfjzHqpU2iaSrYPVWiqjQASLZVjynt9JuRdHI2yRcGHPI/TYFz2TE9aRFScF/J
 zB089zLXaBrtGo0R1+Aq0dqOLP9RXw2uRPA+k0XjHp/igRH8sKGR5cqJMVB8rbm4AkmnTW6a1xE
 HBodCwuWBLRwThGgD8ugtrxBqugjy50T2XGD+DIJaGDbsNnViCIKy3DHXlsmofjLSMFQ5oPrSY1
 5LQFrqUg2/zK9RLmzHUWP8oLRfHT1D+HCYVsHRTnfJzXQAet9xBFRT3jOjgvVudbOb7TN7VRDEu
 jlAqlw1AzEY1TskZw8Q==
X-Proofpoint-GUID: pZnMymNrvugXZGy4bVanlhvo4XldilZM
X-Authority-Analysis: v=2.4 cv=M7TYuCws c=1 sm=1 tr=0 ts=6aa8ebab cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=pqkbOb-j7vkK_spRw2EA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDA5NyBTYWx0ZWRfX162pfVg4HlQf
 0T2Hxsltr1GgdJoxbvgVkZleUQ/mZh1qD/Ul9t+jXBv11WkUH5R9nqet8+3ML9o6UhMEYPDRWup
 N3lrQma7IJsXNbQj7efVeage5RvX+3U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150097

The OmniVision OG0VA1B is a monochrome image sensor closely related to
the OG0VE1B. It shares the SCCB control interface, power supplies and
the single-lane MIPI D-PHY description, and differs in its chip id, the
test pattern register, the register programming and the output format
(10-bit RAW instead of 8-bit).

Add an og0ve1b_sensor_data entry describing the OG0VA1B together with
its 640x480 60fps register sequence.

The control registers (mode select, software reset, exposure, analogue
gain, vertical timing and the test pattern enable bit) are identical on
both parts, so give them a common OG0V_ prefix. Registers that differ
between the two sensors keep their part-specific prefix.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Tested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org> # og0ve1b
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/i2c/og0ve1b.c | 354 +++++++++++++++++++++++++++++++++++++-------
 1 file changed, 304 insertions(+), 50 deletions(-)

diff --git a/drivers/media/i2c/og0ve1b.c b/drivers/media/i2c/og0ve1b.c
index 7ab57a3d8d6d0ffabd286cc12fcbcb17dd56d72f..45e50469ef42e5f651b3aafd463245936028fb84 100644
--- a/drivers/media/i2c/og0ve1b.c
+++ b/drivers/media/i2c/og0ve1b.c
@@ -15,43 +15,53 @@
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
 
-#define OG0VE1B_REG_MODE_SELECT		CCI_REG8(0x0100)
-#define OG0VE1B_MODE_STANDBY		0x00
-#define OG0VE1B_MODE_STREAMING		BIT(0)
+#define OG0V_REG_MODE_SELECT		CCI_REG8(0x0100)
+#define OG0V_MODE_STANDBY		0x00
+#define OG0V_MODE_STREAMING		BIT(0)
 
-#define OG0VE1B_REG_SOFTWARE_RST	CCI_REG8(0x0103)
-#define OG0VE1B_SOFTWARE_RST		BIT(0)
+#define OG0V_REG_SOFTWARE_RST		CCI_REG8(0x0103)
+#define OG0V_SOFTWARE_RST		BIT(0)
 
 /* Exposure controls from sensor */
-#define OG0VE1B_REG_EXPOSURE		CCI_REG24(0x3500)
-#define OG0VE1B_EXPOSURE_MIN		1
-#define OG0VE1B_EXPOSURE_MAX_MARGIN	14
-#define OG0VE1B_EXPOSURE_STEP		1
-#define OG0VE1B_EXPOSURE_DEFAULT	554
+#define OG0V_REG_EXPOSURE		CCI_REG24(0x3500)
+#define OG0V_EXPOSURE_MIN		1
+#define OG0V_EXPOSURE_MAX_MARGIN	14
+#define OG0V_EXPOSURE_STEP		1
+#define OG0V_EXPOSURE_DEFAULT		554
 
 /* Analogue gain controls from sensor */
-#define OG0VE1B_REG_ANALOGUE_GAIN	CCI_REG16(0x350a)
-#define OG0VE1B_ANALOGUE_GAIN_MIN	1
-#define OG0VE1B_ANALOGUE_GAIN_MAX	0x1ff
-#define OG0VE1B_ANALOGUE_GAIN_STEP	1
-#define OG0VE1B_ANALOGUE_GAIN_DEFAULT	16
+#define OG0V_REG_ANALOGUE_GAIN		CCI_REG16(0x350a)
+#define OG0V_ANALOGUE_GAIN_MIN		1
+#define OG0V_ANALOGUE_GAIN_MAX		0x1ff
+#define OG0V_ANALOGUE_GAIN_STEP		1
+#define OG0V_ANALOGUE_GAIN_DEFAULT	16
 
 /* Vertical timing size */
-#define OG0VE1B_REG_VTS			CCI_REG16(0x380e)
-#define OG0VE1B_VTS_MAX			0xffff
+#define OG0V_REG_VTS			CCI_REG16(0x380e)
+#define OG0V_VTS_MAX			0xffff
 
-/* Test pattern */
+/* Test pattern - OG0VA1B uses 0x5100, OG0VE1B uses 0x5e00 */
+#define OG0VA1B_REG_TEST_PATTERN	CCI_REG8(0x5100)
+#define OG0VA1B_TEST_PATTERN_BAR_SHIFT	2
 #define OG0VE1B_REG_PRE_ISP		CCI_REG8(0x5e00)
-#define OG0VE1B_TEST_PATTERN_ENABLE	BIT(7)
+#define OG0V_TEST_PATTERN_ENABLE	BIT(7)
 
 #define to_og0ve1b(_sd)			container_of(_sd, struct og0ve1b, sd)
 
+static const s64 og0va1b_link_freq_menu[] = {
+	OG0VA1B_LINK_FREQ_480MHZ,
+};
+
 static const s64 og0ve1b_link_freq_menu[] = {
 	OG0VE1B_LINK_FREQ_500MHZ,
 };
@@ -74,13 +84,29 @@ struct og0ve1b_mode {
 struct og0ve1b;
 
 struct og0ve1b_sensor_data {
+	const char *name;
 	u64 chip_id;
 	unsigned long mclk_freq;
 	int (*enable_test_pattern)(struct og0ve1b *og0ve1b, u32 pattern);
+	const char * const *test_pattern_menu;
 	const s64 *link_freq_menu;
 	const struct og0ve1b_mode *modes;
+	int num_test_patterns;
 	int num_link_freqs;
 	int num_modes;
+	/* Exposure register unit: OG0VE1B 1/16 line (4), OG0VA1B whole lines (0). */
+	unsigned int exposure_shift;
+	/* Pixel rate multiplier: OG0VA1B uses CSI-2 DDR (2), OG0VE1B keeps 1. */
+	unsigned int pixel_rate_mul;
+	bool cache_test_pattern_reg;
+};
+
+static const char * const og0va1b_test_pattern_menu[] = {
+	"Disabled",
+	"Vertical Color Bar",
+	"Top-Bottom Darker Color Bar",
+	"Right-Left Darker Color Bar",
+	"Bottom-Top Darker Color Bar",
 };
 
 static const char * const og0ve1b_test_pattern_menu[] = {
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
@@ -276,22 +492,54 @@ static const struct og0ve1b_mode og0ve1b_supported_modes[] = {
 	},
 };
 
+static int og0va1b_enable_test_pattern(struct og0ve1b *og0ve1b, u32 pattern)
+{
+	u64 val = 0;
+
+	if (pattern)
+		val = ((pattern - 1) << OG0VA1B_TEST_PATTERN_BAR_SHIFT) |
+		      OG0V_TEST_PATTERN_ENABLE;
+
+	return cci_write(og0ve1b->regmap, OG0VA1B_REG_TEST_PATTERN, val, NULL);
+}
+
 static int og0ve1b_enable_test_pattern(struct og0ve1b *og0ve1b, u32 pattern)
 {
 	u64 val = og0ve1b->pre_isp;
 
 	if (pattern)
-		val |= OG0VE1B_TEST_PATTERN_ENABLE;
+		val |= OG0V_TEST_PATTERN_ENABLE;
 	else
-		val &= ~OG0VE1B_TEST_PATTERN_ENABLE;
+		val &= ~OG0V_TEST_PATTERN_ENABLE;
 
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
@@ -311,7 +559,7 @@ static int og0ve1b_set_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_VBLANK:
 		/* Update max exposure while meeting expected vblanking */
 		exposure_max = ctrl->val + mode->height -
-			OG0VE1B_EXPOSURE_MAX_MARGIN;
+			OG0V_EXPOSURE_MAX_MARGIN;
 		ret = __v4l2_ctrl_modify_range(og0ve1b->exposure,
 					og0ve1b->exposure->minimum,
 					exposure_max,
@@ -327,15 +575,16 @@ static int og0ve1b_set_ctrl(struct v4l2_ctrl *ctrl)
 
 	switch (ctrl->id) {
 	case V4L2_CID_ANALOGUE_GAIN:
-		ret = cci_write(og0ve1b->regmap, OG0VE1B_REG_ANALOGUE_GAIN,
+		ret = cci_write(og0ve1b->regmap, OG0V_REG_ANALOGUE_GAIN,
 				ctrl->val, NULL);
 		break;
 	case V4L2_CID_EXPOSURE:
-		ret = cci_write(og0ve1b->regmap, OG0VE1B_REG_EXPOSURE,
-				ctrl->val << 4, NULL);
+		ret = cci_write(og0ve1b->regmap, OG0V_REG_EXPOSURE,
+				ctrl->val << og0ve1b->data->exposure_shift,
+				NULL);
 		break;
 	case V4L2_CID_VBLANK:
-		ret = cci_write(og0ve1b->regmap, OG0VE1B_REG_VTS,
+		ret = cci_write(og0ve1b->regmap, OG0V_REG_VTS,
 				ctrl->val + mode->height, NULL);
 		break;
 	case V4L2_CID_TEST_PATTERN:
@@ -360,7 +609,7 @@ static s64 og0ve1b_pixel_rate(const struct og0ve1b_sensor_data *data)
 	const struct og0ve1b_mode *mode = &data->modes[0];
 	unsigned int bpp = mode->code == MEDIA_BUS_FMT_Y8_1X8 ? 8 : 10;
 
-	return div_u64(data->link_freq_menu[0], bpp);
+	return div_u64(data->link_freq_menu[0] * data->pixel_rate_mul, bpp);
 }
 
 static int og0ve1b_init_controls(struct og0ve1b *og0ve1b)
@@ -395,26 +644,26 @@ static int og0ve1b_init_controls(struct og0ve1b *og0ve1b)
 	v_blank = mode->vts - mode->height;
 	og0ve1b->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &og0ve1b_ctrl_ops,
 					    V4L2_CID_VBLANK, v_blank,
-					    OG0VE1B_VTS_MAX - mode->height, 1,
+					    OG0V_VTS_MAX - mode->height, 1,
 					    v_blank);
 
 	v4l2_ctrl_new_std(ctrl_hdlr, &og0ve1b_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
-			  OG0VE1B_ANALOGUE_GAIN_MIN, OG0VE1B_ANALOGUE_GAIN_MAX,
-			  OG0VE1B_ANALOGUE_GAIN_STEP,
-			  OG0VE1B_ANALOGUE_GAIN_DEFAULT);
+			  OG0V_ANALOGUE_GAIN_MIN, OG0V_ANALOGUE_GAIN_MAX,
+			  OG0V_ANALOGUE_GAIN_STEP,
+			  OG0V_ANALOGUE_GAIN_DEFAULT);
 
-	exposure_max = mode->vts - OG0VE1B_EXPOSURE_MAX_MARGIN;
+	exposure_max = mode->vts - OG0V_EXPOSURE_MAX_MARGIN;
 	og0ve1b->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &og0ve1b_ctrl_ops,
 					      V4L2_CID_EXPOSURE,
-					      OG0VE1B_EXPOSURE_MIN,
+					      OG0V_EXPOSURE_MIN,
 					      exposure_max,
-					      OG0VE1B_EXPOSURE_STEP,
-					      OG0VE1B_EXPOSURE_DEFAULT);
+					      OG0V_EXPOSURE_STEP,
+					      OG0V_EXPOSURE_DEFAULT);
 
 	v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &og0ve1b_ctrl_ops,
 				     V4L2_CID_TEST_PATTERN,
-				     ARRAY_SIZE(og0ve1b_test_pattern_menu) - 1,
-				     0, 0, og0ve1b_test_pattern_menu);
+				     data->num_test_patterns - 1,
+				     0, 0, data->test_pattern_menu);
 
 	if (ctrl_hdlr->error)
 		return ctrl_hdlr->error;
@@ -464,8 +713,8 @@ static int og0ve1b_enable_streams(struct v4l2_subdev *sd,
 		return ret;
 
 	/* Skip a step of explicit entering into the standby mode */
-	ret = cci_write(og0ve1b->regmap, OG0VE1B_REG_SOFTWARE_RST,
-			OG0VE1B_SOFTWARE_RST, NULL);
+	ret = cci_write(og0ve1b->regmap, OG0V_REG_SOFTWARE_RST,
+			OG0V_SOFTWARE_RST, NULL);
 	if (ret) {
 		dev_err(og0ve1b->dev, "failed to software reset: %d\n", ret);
 		goto error;
@@ -482,8 +731,8 @@ static int og0ve1b_enable_streams(struct v4l2_subdev *sd,
 	if (ret)
 		goto error;
 
-	ret = cci_write(og0ve1b->regmap, OG0VE1B_REG_MODE_SELECT,
-			OG0VE1B_MODE_STREAMING, NULL);
+	ret = cci_write(og0ve1b->regmap, OG0V_REG_MODE_SELECT,
+			OG0V_MODE_STREAMING, NULL);
 	if (ret) {
 		dev_err(og0ve1b->dev, "failed to start streaming: %d\n", ret);
 		goto error;
@@ -504,8 +753,8 @@ static int og0ve1b_disable_streams(struct v4l2_subdev *sd,
 	struct og0ve1b *og0ve1b = to_og0ve1b(sd);
 	int ret;
 
-	ret = cci_write(og0ve1b->regmap, OG0VE1B_REG_MODE_SELECT,
-			OG0VE1B_MODE_STANDBY, NULL);
+	ret = cci_write(og0ve1b->regmap, OG0V_REG_MODE_SELECT,
+			OG0V_MODE_STANDBY, NULL);
 	if (ret)
 		dev_err(og0ve1b->dev, "failed to stop streaming: %d\n", ret);
 
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

