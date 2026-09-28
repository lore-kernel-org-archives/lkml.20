Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B5D1DDC37
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790577442; cv=none; b=icVzNrrF/GolqNZiNoBUp9c4rCGG+LiX9ZODQ3Ykw+PRWvMu0FQdnc83nq6AxddV8ynQfiTCGM9DJ9oWM2jpkyhFcBd1N9expo1tK+wl3L5aB2uU9tNvDF1zEuJORZ3ScYqr6ca/Oka1ICvG/enuqsYhuuGOwvhEMzGG2RJQJWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790577442; c=relaxed/simple;
	bh=X9UFLy/tSfYGS4+J8pPMCA7NLf0Fczxwpqtp/69dYqY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ON3XHEoJcADb6G/fc1Q+sXhjcIw+OloHCB2hJzkCkNpu5n2gSsBwXW7hkQRXTYB8REatAZAYHBEdnck1Dze37ryiyQ5MYPfR3jO3rlc1WSNXLrwhlmiiFMbGGBYSCrpAvlBChZFgEl5KzdAOQGBlPC7vkW4GXaj4xi+OTvc5ZmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aV7AWv5W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SePm1jMs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aV7AWv5W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SePm1jMs"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S59BoS1501059
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:37:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CyfLly6N1EVgguRmgnD8MhSCQkFeA9yXJVjR7ODJleA=; b=aV7AWv5WNmJw2Ez/
	6Cwr2QYPRV6J6UuTycRgwHauUv9gmo+t01obj4pLJ7GN20SLyocE3WWDFd62O+nK
	aZ4qYasVVTqlU+NX5jJjdY6ZHrHF6uOirs55DwOFCjIvAxKv1XtRaLaxS+80Z/gr
	ZCnW25R2/tRslpszkIlFqBrirkrvPGmmSui+jUPXuHShP0BeC1VaHTyf0HJEhCyT
	rcX/ZDKfE5wZB1mHJVIgc2w/TAv57bqRS6gabH17aYS8FspjLV6NbQX/Xs2hnDeL
	t4/eCRN2RaPiHRGqPTGE1VoDgBMwldYLWQX5/vVVjk3YWvgEcSX0OixDsxtqijkM
	+Ki4Ug==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyhubg8hp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:37:19 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2dd1631d291so27185735ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 23:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790577439; x=1791182239; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CyfLly6N1EVgguRmgnD8MhSCQkFeA9yXJVjR7ODJleA=;
        b=SePm1jMssWi6nzELdEVglYnFaTkWOMQlgQS+6CGN3eUvsUITB2WxDQNG5czMEjYuYF
         eFDXBFk+7zmZtg3QJ/QSXNMlJiolRzWvAPLnx50K7HjNB4+SxHkRbXWooPoBETgWIM7w
         sC2K1cH4phYnW8H92d/OjJfoOSfZb6TFIwXVdUvAb+iSeMHgece3GSVjnGiWomG9TIJR
         QAFUSE+2k1LRjOPwaR2L0iyaD1NpcU574vxfGntgi0v7K00slp/Pd8fyxysnIWDNp3sp
         rIx5gWbtKhCxK4bUhri3UGgfxw3nQKmt8hd94T4BmesH72G9oBCKYpztooZaZ2aBdHJ0
         dqfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790577439; x=1791182239;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CyfLly6N1EVgguRmgnD8MhSCQkFeA9yXJVjR7ODJleA=;
        b=UhpTQyfTVfzAiERkxXguU2Oigr4P+Gtok/cfzMmHKF/IVaK96rhNQHSwQesvym77Mo
         RRvZtDU+N7NSyPi8U7rLhrZ5v9ume4i92QbPy4KLyxbgwqYQpnaDc0+FRns0FzXdlGJt
         XMr7Ng1hOw4tUI//OKSfjT9uK8MU7lHefwf/HYaCEk2v1631D2lFnpFl11L0JtmdTnqP
         43XK2KZJ6RVH9ECvjV94l75hdJlHfH7S5ndS0k1PQIJxjr354fJmeOzwo+471dnPgu1Y
         0B6tY5mouEwzo45CxmGrRHI6HnmnV1cY1uRbYFg3EjJ1+QG7JMn8MdQmVpfujEt4BzND
         Shcg==
X-Forwarded-Encrypted: i=1; AKwUvBx1n4UhWkGI/JIsPCmIbw5fzh1yxZoYmr0JZ52QyBjbboZ2FT8CBq8MYDPDhUafcQglUEHwtHNk2CkAfZk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQh9aXLWgstLqP8rRq3nYTpzyG1aa3byCZckDckCoreEKXiXGy
	mLzrkhmgh3rPPyeOqO4Hiwv4plrWn6HPF4FnAw84/WIxRfQK+Oe7V+sgH+dyAoseLYDVdBX7245
	RnAg22sD5qXRvz6hFq1CYlR0Vpei85e1VUiKQ0s2Melfs0QVgbb9x1e2w7MzbQuVPD18=
X-Gm-Gg: AYBFou1UFWGzyHKA0sqepIRstmZuJghgGQIAGsbS0ONW/jNxJVgYOWNY9HtinOaTqN5
	ycN88aK+oAVfyCu8zE33XdTfg1z/UaE4/PX67YsL+NDsPmhI9gfe6tzK3BtFmQhYxTV9On/uaq3
	KGx5OeZlHs2LqPnqdgFw24DEma3GYq+XK+cRRHp3WFZdl/roOcnd9yrs0SNI/TrW7wYmU1shCzs
	7egZXZnRQGzzFmI0CAf1cOiE7Fb26yzeR7qidDqK12aJEoLrljLCLoVhLV2Ox5TTqhUI+zPeLM2
	77edd/+2qW9N+c+TqaYnM9j4d/SKM7LLerge5s1L5ctbZZrm37DMTQkdWzCbST+uVzxi1WefmM2
	nORQKJuVm1+a68UbBzBDJvUriImDasFm8JwNlerNrAplaIBF19vqdRinmns27DWgEdG8hlVse6X
	7JqSG2XOIbvQS+
X-Received: by 2002:a17:903:40cc:b0:2dd:c053:e0f7 with SMTP id d9443c01a7336-2df7e43e9d3mr99685575ad.38.1790577438834;
        Sun, 27 Sep 2026 23:37:18 -0700 (PDT)
X-Received: by 2002:a17:903:40cc:b0:2dd:c053:e0f7 with SMTP id d9443c01a7336-2df7e43e9d3mr99685285ad.38.1790577438317;
        Sun, 27 Sep 2026 23:37:18 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df91468978sm35292685ad.79.2026.09.27.23.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 23:37:17 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 12:06:38 +0530
Subject: [PATCH 2/3] platform: arm64: qcom-hamoa-ec: Add thermistor sensors
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-ec_thermistor_support-v1-2-d9c1bae4cd0d@oss.qualcomm.com>
References: <20260928-ec_thermistor_support-v1-0-d9c1bae4cd0d@oss.qualcomm.com>
In-Reply-To: <20260928-ec_thermistor_support-v1-0-d9c1bae4cd0d@oss.qualcomm.com>
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790577422; l=4925;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=X9UFLy/tSfYGS4+J8pPMCA7NLf0Fczxwpqtp/69dYqY=;
 b=EPb/q5RPLAsViqDE6Uvnl/UuIaZ59tliKEnlPqYShFnn2utiQCbb41DjQPV4L0ttO5wzHdWu3
 pQenjuz9uUJAGrnFAS1AwNr98t5Qzl81xNozVSLpMijAgqeGFBXxKFS
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-GUID: S5joydj1pQAO5A32sNXZEnJ6oLw9qdU8
X-Authority-Analysis: v=2.4 cv=C7F8WgP+ c=1 sm=1 tr=0 ts=6aba0b1f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=iQKfIWaIXs3HRlposCEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: S5joydj1pQAO5A32sNXZEnJ6oLw9qdU8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAyNiBTYWx0ZWRfX1hyK5Aw3wNKE
 6AeurvLiZRWtMZVvz18+AUR7kx72hg/awkPlOXfQXWyiax7yr9jQbV7p52EQ+dcd3Qtb3IcwHQI
 31qxsZ3eYZYbhVnHhWJUPOXyg3uY+1P+MHJKjTjh24BoaCC1mtdKErVGzEGWvnOktH0QmJrb4tW
 0J78FDXT4SwtB1eu/vdGCGOgKzcBzg4sPfJYuKk1me47/qw6U1GwkzmpVMKGbZo7im9oKJ92xoW
 nFvD3xhgkGGOW7vPA7OCpQx814Ynd8O9o7YWELGQk3Nua6YHFD7vGlQLNEScxPgZXYgVpot/k1U
 x83lxAVoXBf/fFed6Wtq1rUCGbqKr+Le4g/8svWU3nQ7Dkdsy1KqxS+xmLbLBvWfaUH3Z9TVh+a
 HsJWcuBc6qoSqe8QJeSwrtDIjbhZsUamcU5nyYVQlsIwe/DSqdeVwPutxbOWSuPcH5d+53npcs5
 mObLWTaLHMh6c62IYKg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAyNiBTYWx0ZWRfX7uoGwTHTnb+e
 CXx/AoFRl9+51B8aLxIVGf1BSa62diwmvlbn/MIuxFgboMVHVVzd1hI++qUqqvWqHwo6q4q/OXF
 6MDPSObBdsBi8dvJvmloy/XgBneh4y8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280026

The Qualcomm embedded controller has exclusive access to multiple onboard
thermistors programmatically discoverable through the
EC_THERMAL_CAPABILITIES command. The temperature values are reported in
degree Celsius through the EC_THERMISTOR_TEMP_CMD.

Register these thermistors with the thermal framework by adding support to
the EC_THERMISTOR_TEMP_CMD and convert it to millidegree units as required
by the thermal framework.

Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 drivers/platform/arm64/qcom-hamoa-ec.c | 74 ++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
index 4d2ad042a7f8..acf3d7f53026 100644
--- a/drivers/platform/arm64/qcom-hamoa-ec.c
+++ b/drivers/platform/arm64/qcom-hamoa-ec.c
@@ -16,16 +16,19 @@
 #include <linux/pm.h>
 #include <linux/slab.h>
 #include <linux/thermal.h>
+#include <linux/unaligned.h>
 
 #define EC_SCI_EVT_READ_CMD	0x05
 #define EC_FW_VERSION_CMD	0x0e
 #define EC_MODERN_STANDBY_CMD	0x23
+#define EC_THERMISTOR_TEMP_CMD	0x29	/* + thermistor_id (0-6) selects thermistor 1-7 */
 #define EC_FAN_DBG_CONTROL_CMD	0x30
 #define EC_SCI_EVT_CONTROL_CMD	0x35
 #define EC_THERMAL_CAP_CMD	0x42
 
 #define EC_FW_VERSION_RESP_LEN	4
 #define EC_THERMAL_CAP_RESP_LEN	3
+#define EC_THERMISTOR_TEMP_RESP_LEN	3
 #define EC_FAN_DEBUG_CMD_LEN	6
 #define EC_FAN_SPEED_DATA_SIZE	4
 
@@ -39,6 +42,7 @@
 #define EC_MAX_FAN_CNT		2
 #define EC_FAN_NAME_SIZE	20
 #define EC_FAN_MAX_PWM		255
+#define EC_MAX_THERMISTOR_CNT	7
 
 enum qcom_ec_sci_events {
 	EC_FAN1_STATUS_CHANGE_EVT = 0x30,
@@ -64,6 +68,7 @@ struct qcom_ec_thermal_cap {
 #define EC_THERMAL_FAN_CNT(x)		(FIELD_GET(GENMASK(1, 0), (x)))
 #define EC_THERMAL_FAN_TYPE(x)		(FIELD_GET(GENMASK(4, 2), (x)))
 #define EC_THERMAL_THERMISTOR_MASK(x)	(FIELD_GET(GENMASK(7, 0), (x)))
+#define EC_THERMISTOR_PRESENT(mask, id)	((mask) & BIT(id))
 	u8 fan_cnt;
 	u8 fan_type;
 	u8 thermistor_mask;
@@ -81,6 +86,12 @@ struct qcom_ec {
 	struct qcom_ec_thermal_cap thermal_cap;
 	struct qcom_ec_version version;
 	struct i2c_client *client;
+	struct qcom_ec_thermal_zone *ec_tz;
+};
+
+struct qcom_ec_thermal_zone {
+	struct qcom_ec *ec;
+	u8 thermistor_id;
 };
 
 static int qcom_ec_read(struct qcom_ec *ec, u8 cmd, u8 resp_len, u8 *resp)
@@ -183,6 +194,43 @@ static int qcom_ec_thermal_capabilities(struct device *dev)
 	return 0;
 }
 
+/*
+ * EC Thermistor Temperature (cmd 0x29 + thermistor_id, id 0-6 selects
+ * thermistor 1-7):
+ *
+ * Read Response:
+ * ----------------------------------------------------------------------
+ * | Offset	| Name		| Description				|
+ * ----------------------------------------------------------------------
+ * | 0x00	| Byte count	| Number of bytes in response (=2)	|
+ * ----------------------------------------------------------------------
+ * | 0x01 (LSB)| Temperature	| Signed 16-bit, unit of 0.1 degC,	|
+ * | 0x02 (MSB)|		| range -40..+125 degC			|
+ * ----------------------------------------------------------------------
+ */
+static int qcom_ec_thermistor_get_temp(struct thermal_zone_device *tz, int *temp)
+{
+	struct qcom_ec_thermal_zone *ec_tz = thermal_zone_device_priv(tz);
+	struct qcom_ec *ec = ec_tz->ec;
+	u8 resp[EC_THERMISTOR_TEMP_RESP_LEN];
+	s16 raw;
+	int ret;
+
+	ret = qcom_ec_read(ec, EC_THERMISTOR_TEMP_CMD + ec_tz->thermistor_id,
+			   EC_THERMISTOR_TEMP_RESP_LEN, resp);
+	if (ret < 0)
+		return ret;
+
+	raw = (s16)get_unaligned_le16(&resp[1]);
+	*temp = raw * 100;
+
+	return 0;
+}
+
+static const struct thermal_zone_device_ops qcom_ec_thermistor_ops = {
+	.get_temp = qcom_ec_thermistor_get_temp,
+};
+
 static irqreturn_t qcom_ec_irq(int irq, void *data)
 {
 	struct qcom_ec *ec = data;
@@ -376,6 +424,32 @@ static int qcom_ec_probe(struct i2c_client *client)
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "Failed to read thermal capabilities\n");
 
+	if (ec->thermal_cap.thermistor_mask) {
+		ec->ec_tz = devm_kcalloc(dev, EC_MAX_THERMISTOR_CNT, sizeof(*ec->ec_tz),
+					 GFP_KERNEL);
+		if (!ec->ec_tz)
+			return -ENOMEM;
+
+		for (i = 0; i < EC_MAX_THERMISTOR_CNT; i++) {
+			struct qcom_ec_thermal_zone *ec_tz = &ec->ec_tz[i];
+			struct thermal_zone_device *tzd;
+
+			if (!EC_THERMISTOR_PRESENT(ec->thermal_cap.thermistor_mask, i))
+				continue;
+
+			ec_tz->ec = ec;
+			ec_tz->thermistor_id = i;
+
+			tzd = devm_thermal_of_zone_register(dev, i, ec_tz, &qcom_ec_thermistor_ops);
+			if (IS_ERR(tzd)) {
+				ret = PTR_ERR(tzd);
+				if (ret != -ENODEV)
+					dev_warn(dev, "Failed to register thermistor%u zone: %d\n",
+						 i, ret);
+			}
+		}
+	}
+
 	if (ec->thermal_cap.fan_cnt == 0) {
 		dev_warn(dev, FW_BUG "Failed to get fan count, firmware update required\n");
 		return 0;

-- 
2.34.1

