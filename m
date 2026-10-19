Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64D859A1CE
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792420778; cv=none; b=OKbVcUbuwBUGxbmA7qkkU2ce1CXJH5NgqlJMM44GiXNFX+C3tsp+ew+mj+fKz9aa9wBt3noRkndFLyMA4po8XT9fv4DsFe61OZXdA95mgF9P/tU/qgrvOOIqtmqv+l0pVSGjbvgAY9Cgn/AzV96KVtsVG3s3DmG3RuNvLt9egIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792420778; c=relaxed/simple;
	bh=W88aFyXLVL2s6jefU+R6NEkeW5WeUYxK4fu61wyaQLI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sJLDc8+hgxFU8bcr/5RqdTM/2fs3mswnLUikgO5qPU507CZm8rF3yN5wcd0kmNsX3OF40SRYDnTza3ZNrtyqaSGug9d+3J9U8uT9lLD2rGfKgW9UhQoCnDYhabQQSjp9vUdrfnP3BVdFP71wwK0t1RIXD/lTUKvvn7d3XZeLhIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IN3hRBxa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CrIlxNYe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IN3hRBxa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CrIlxNYe"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0haZ1904082
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:39:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	seWH79pPmvjDQRYnMxX62IYmBu0NmcGCDHCEkLyHmhk=; b=IN3hRBxaWfM8zoOl
	a85MCSkfA/xZnluqWAKlufnyTVGnsVpGD5533TUydIB4rf8gVKVPu6C3y7WAesS/
	+UJ2xLUEtxDvndh4mtoianrM+O7wXTlxLqL9FmJ5QhvtqJs9C/geC36pzd0GtPde
	0CiC7FpQfiI312Jug9S8EMyUm9wqryOidGhyDADXuSol7J8WLdZWCLjfPgmrzhKN
	j6p5ImOSvDRZJ4FHwStUD5CxuoT9iQPRYD4JviZRa2kExQn029+TzHuX4yU3OQnG
	jl8LHFhFip+HEhW43s9GAMIY/c3Jrpd/zKqn27VJTpp/gov6F/Qb/czvCZWXNiqk
	DpNRwA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf5c9ntf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:39:35 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91be1227fdeso43856806d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792420775; x=1793025575; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=seWH79pPmvjDQRYnMxX62IYmBu0NmcGCDHCEkLyHmhk=;
        b=CrIlxNYexGRRD6JgP7CmuNMLyvnoU+OGGU6PfShJYnJHoJ66NTpTUMK+8blDkbck1+
         rCLCGiTiYCGzbyzNbR8FP9PqPcAD5yinm5fJvUULJNaEadDdM6dskNwM11qgdHFgxm6J
         Yj/6Ru+JLQ3tjx3gRPvxRpTUBqTJ2NV4Z7i6cZLz+agycP2fMUgE37wx5jILQdDuKKui
         kNWebKQt964PuQMODFEZxVMBKTo9GdDOozLpPt8W5HdR7zfLA3k5zaC1pHos02IrCsq/
         CPLhafgB7Nrrn+rt5mGBsHaPCPxVGQxfEYUqg/LXhIYVjGvqk36jEdpYclmuJ6whrkre
         z6eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792420775; x=1793025575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=seWH79pPmvjDQRYnMxX62IYmBu0NmcGCDHCEkLyHmhk=;
        b=Ja33P8JU12lw+nvlRSdfm64TIXCJESuzKnRmELpZJLHvRvo5WxWXihNkmzgzHV5Ou+
         kj7XmOYGAWJwS4XUQKzLEGj+NN7aqaVl0chWfNJDxQezSQoaylR2nb7opuAev00DQZQp
         ZMNy9ams2Pc14d2UZAZAAMpBXfnW1FCEEKYLFNn9cTfyOmYDfAo5HGtgzwdpG7RQVZ9J
         W4YJ3fyQ+5bPwZ/eJ2shCYN7Oi6IIghKw1XdcCZ1NJCeS+ND5+eY/JtkzuuOOKHSgfLa
         jk23Wy9wd/Q5/cg/r5U4AE5ESAApM4MN6Mw1eJFLtFO3iN1PgpmOVHK5Yt7pmAOwB7dF
         EuTw==
X-Forwarded-Encrypted: i=1; AKwUvBxkuLt9mG9l9mQqlR/B1DItT/E22RVK1jIadEcBTuTZnIrKS+7i9EQPVrPwuR/BPgU2mMQ5jf7ZX5Y3jro=@vger.kernel.org
X-Gm-Message-State: AFq9FYLmrenqO5hPJSy0j2PJ8urmjF3sUacOt7YI0dYi3wQjRhS86J8h
	6GY75wmIkJBYvWrCMZww2topbnmIFG28ka+n2jKg/8QGSlb7Tp0yeSgYbFstOpYaR9QuerhvmGi
	xISXCPeg5KQzzMPINOl4aswjYhtdlLR4wvWZnDgAg/Ry6WzqSlRxqFNINBUPuc4OYbF2EreAXpl
	I=
X-Gm-Gg: AYBFou1v7wrVZQjC+adwqfcDZmUCheHrIS4V/jwgQZUjqpjxTfSj0PCLMKYmGrrgcDE
	0kkVnMagtWHJWz5BJpb6nwbHSpHrYRZboYUFsPEDXBIbsGEjLs+WQGiIcDfK1MksZfpKVxFXXw3
	/H6f7VQCb03kiCaNQQr9HEwJqEjByNU2O0BesoHdsuFVpwYL6MQauJLXfHzpgogRNG7rnwYgiyv
	3oya0qLTOETQhjoiGXMwjYFr/c+WcnOV18k5917WrxJuoAavgQq5yR+JAhZw+Z3lMYh2ic9rHhQ
	4XkDKrxBBFxkRg86vS/W7IYV3wWrA0kERunLAd08kEfkQbVHGmJNscn0Ced8ldEMrxj93zKTqpK
	gFRRxSObqKE2X/9Cv9D2thSs3A2uGdasy11KFKnxjNwVga/NI5Dyu8IBnYR2ZCgf4Xmm0g03Fbq
	TANfzes5cS0tzt
X-Received: by 2002:a05:620a:288d:b0:939:c1d4:e2e1 with SMTP id af79cd13be357-93f29cc979fmr1361950485a.25.1792420774751;
        Mon, 19 Oct 2026 07:39:34 -0700 (PDT)
X-Received: by 2002:a05:620a:288d:b0:939:c1d4:e2e1 with SMTP id af79cd13be357-93f29cc979fmr1361944085a.25.1792420774130;
        Mon, 19 Oct 2026 07:39:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a63aa17sm2033436e87.69.2026.10.19.07.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:39:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 17:39:21 +0300
Subject: [PATCH 3/3] regulator: qcom_spmi: don't take a sleeping lock in
 the SAW IPI
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-fix-qcom-saw-v1-3-9c7ba3fc2493@oss.qualcomm.com>
References: <20261019-fix-qcom-saw-v1-0-9c7ba3fc2493@oss.qualcomm.com>
In-Reply-To: <20261019-fix-qcom-saw-v1-0-9c7ba3fc2493@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephan Gerhold <stephan@gerhold.net>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Clark Williams <clrkwllms@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ilia Lin <ilialin@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rt-devel@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3759;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=W88aFyXLVL2s6jefU+R6NEkeW5WeUYxK4fu61wyaQLI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1iuZtT0j4U+vB60NcH0N6Mt6dwmk9o+rrkmzd
 aZqq2RrKV+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatYrmQAKCRCLPIo+Aiko
 1e4WB/9NOR1ZG4GiaNnX3KgtFpggU+x2+0DyhdeGzSrb+MHoLL0mO+CAWCR6eknlrB5Yp5izPKr
 WKxT2ijDfEKgiwVCWJhD/dfq3iP+BNy9lk6/r17SuYX/TOgL1ux3+fvWO2gcTIEa5M/gMaI6OwG
 X94tM0/jtXMODQqwlmG36ohEBBDxIw9Y8lSzyHNELF4GndTBuuc6GSMtjBS7Csz+sE2DO2T42wx
 OVaqh/LNfkAywcuAvDm2GqdUPjvaGv3JvXvJ8jHZ+zvC4/aknuARzIm0KvxA9UOmEHlzYNRsaOA
 WAtMXjztO7zuKQHCYur1pA0KWIxy5KP6fa6/KNRtHqxn0HMN
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1OCBTYWx0ZWRfX8OpNmnZUM+Gj
 t3YInTWt3sydV90HDmjyFUFoq/nsxrW8fzNlSAUymQ2m0tt5O1dqaEqAM/bUS2N3ULfI4Pc0xK0
 hvQ6diBIwCrLwQqs4xKvUrlRg0I/uqs=
X-Proofpoint-ORIG-GUID: tqdL9qpOvUH1htQuxmSixT8oqsS5dYpq
X-Proofpoint-GUID: tqdL9qpOvUH1htQuxmSixT8oqsS5dYpq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1OCBTYWx0ZWRfX7PrBI1uuP6TQ
 izurh2cIghm6xJ/y+G3ujmW86+OXVTj1IFpKuctfeTW0wmZNYUNa37hi3UoNF8hJZM4XfEtU3YP
 LRyn/pDJhY2idLmgw28IuFdshgLSyAWD7RsqH+ei8IIS1q2+MHfEYXJ0+qfWQQRPZtZPvdNVUqd
 czFMsuweV19PIWeW9eKQNrTgSRBnx7TCkS5Vorirbzxvk4H6aVim1+IMozUEpT07v3UFOCy8E1R
 rjGj78xd/hgBxmGpXVG0xJB1Q3cdmITgEI1Q3e170WjX0xHXMY8Nc51TryTwinx+/qDZsbRoLwy
 T6m80SDAUJYhMz7jSVsrKTIrmOIZaHeMB3UA3ub8GJTYW6U/kj595gViBJwAcAteEL/WD8pDOi+
 sKDn2p+8Eofvq6tVKEEtzWw2dU0nSt2sPXQjEot/2WPrJwd5dbuuyJiWBJ2NCyeuqL2o7MYp2xa
 T1G7sFT5DoJYsXyByKw==
X-Authority-Analysis: v=2.4 cv=K6O3jCWI c=1 sm=1 tr=0 ts=6ad62ba7 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=jFepld1HPJdq18AQ2i4A:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190058

The SAW voltage change runs on CPU 0 from an IPI, but it reaches the SAW
registers through the syscon regmap, which is protected by a spinlock_t.
That is a sleeping lock on PREEMPT_RT, and lockdep complains as soon as
VDD_APCC actually changes voltage:

  BUG: Invalid wait context
  ...
  regmap_lock_spinlock+0x18/0x30
  regmap_read+0x3c/0x78
  spmi_saw_set_vdd+0x50/0x1ac
  __flush_smp_call_function_queue+0x1ac/0x334

Map the SAW with a regmap of our own that uses a raw spinlock, and fail
the probe when that cannot be done instead of carrying an error pointer
around as the SAW regmap.

Fixes: 0caecaa87202 ("regulator: qcom_spmi: Add support for SAW")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/regulator/Kconfig               |  1 +
 drivers/regulator/qcom_spmi-regulator.c | 35 +++++++++++++++++++++++++--------
 2 files changed, 28 insertions(+), 8 deletions(-)

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index be6b72daa76f..83a76b78e58c 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1210,6 +1210,7 @@ config REGULATOR_QCOM_SMD_RPM
 config REGULATOR_QCOM_SPMI
 	tristate "Qualcomm SPMI regulator driver"
 	depends on SPMI || COMPILE_TEST
+	select REGMAP_MMIO
 	help
 	  If you say yes to this option, support will be included for the
 	  regulators found in Qualcomm SPMI PMICs.
diff --git a/drivers/regulator/qcom_spmi-regulator.c b/drivers/regulator/qcom_spmi-regulator.c
index c1a41ce70b36..a04ddb1eac94 100644
--- a/drivers/regulator/qcom_spmi-regulator.c
+++ b/drivers/regulator/qcom_spmi-regulator.c
@@ -12,13 +12,13 @@
 #include <linux/bitops.h>
 #include <linux/slab.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/ktime.h>
 #include <linux/regulator/driver.h>
 #include <linux/regmap.h>
 #include <linux/list.h>
-#include <linux/mfd/syscon.h>
 #include <linux/io.h>
 
 /* Pin control enable input pins. */
@@ -1335,6 +1335,14 @@ static irqreturn_t spmi_regulator_vs_ocp_isr(int irq, void *data)
 
 static struct regmap *saw_regmap;
 
+static const struct regmap_config saw_regmap_config = {
+	.name = "saw",
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.use_raw_spinlock = true,
+};
+
 static void spmi_saw_set_vdd(void *data)
 {
 	u32 vctl, data3, avs_ctl, pmic_sts;
@@ -2504,7 +2512,8 @@ static int qcom_spmi_regulator_probe(struct platform_device *pdev)
 	const char *name;
 	struct device *dev = &pdev->dev;
 	struct device_node *node = pdev->dev.of_node;
-	struct device_node *syscon, *reg_node;
+	struct device_node *saw, *reg_node;
+	void __iomem *saw_base;
 	struct property *reg_prop;
 	int ret, lenp;
 	struct list_head *vreg_list;
@@ -2523,12 +2532,22 @@ static int qcom_spmi_regulator_probe(struct platform_device *pdev)
 	if (!reg)
 		return -ENODEV;
 
-	syscon = of_parse_phandle(node, "qcom,saw-reg", 0);
-	if (syscon) {
-		saw_regmap = syscon_node_to_regmap(syscon);
-		of_node_put(syscon);
-		if (IS_ERR(saw_regmap))
-			dev_err(dev, "ERROR reading SAW regmap\n");
+	saw = of_parse_phandle(node, "qcom,saw-reg", 0);
+	if (saw) {
+		saw_base = devm_of_iomap(dev, saw, 0, NULL);
+		of_node_put(saw);
+		if (IS_ERR(saw_base))
+			return dev_err_probe(dev, PTR_ERR(saw_base),
+					     "failed to map the SAW\n");
+
+		saw_regmap = devm_regmap_init_mmio(dev, saw_base,
+						   &saw_regmap_config);
+		if (IS_ERR(saw_regmap)) {
+			ret = PTR_ERR(saw_regmap);
+			saw_regmap = NULL;
+			return dev_err_probe(dev, ret,
+					     "failed to set the SAW regmap up\n");
+		}
 	}
 
 	for (; reg->name; reg++) {

-- 
2.47.3

