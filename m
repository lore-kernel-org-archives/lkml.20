Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BEC55D870
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790091151; cv=none; b=GGQvmLJLBlCRy6s6XwRsd6u9JHrauama94gXAskEIAg+IUl4l5U+4O2uqgT5PynOPujzSVwE5YzxnvNsdmGqHxhnlqzgMnuxMVFKlwHUS4K0HI8g9cdT86pwpx6ZzD4x8p3f7TpbTaRAm68qzXfRXJbRwgxCvDJ872EXNamU1rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790091151; c=relaxed/simple;
	bh=QWiYTLoT7AkiN37vBI/AE7LlJlRi/CqB8G17hwaEjjU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NczdzUBQPRhNbR359QsE8PSSVeDNltrLjNo631pQEGH/Fmm9lCn3lIVwgXUIMzzaLmU8SK5y6BRMUy2i/ON/n3+Tto0VJb3+SLMWI/x9ntLiq3MSSv+uHycxhGxkbaldO5IqR8NSbbLyNoLNZE4ngfRCXoqCVmXlAA13YV6Qcxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RXCpsOKb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZRGsbZ06; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RXCpsOKb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZRGsbZ06"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEjoQH3952917
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:32:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SHoCPwg3yKGYoepxE62TQiEAKgIIh9UVY9jZRidEOuw=; b=RXCpsOKbcS1DLbaX
	DQTUgqXgUfSI/qXQtTiE0v6RCizspHNo90j1R5AfqDAhkGQmrnXqWSntnUibKOS3
	m6p6/SON5c6VVRd8oMxt5BNYZNLUTXoLX0UuQp+YmrAumGTElBLCc5dUNGCnSO1H
	78TQTLhE2lm+CDDB8DxAPsmxOQ8dHeKm7pKppPj7qmRWZbrBN9GpSRO9y+VzhV9L
	Iz19Sd6XfB8+w5scYUXXSXEQdQ41emEe+TlGlutdypIwAJ+5+ZprhLYmGL4nePZV
	b+dltydYmwBVdP98NpU9j0X91EyxEXbP+62YWjMUIK/0wieJfml4B5VDxSjRdtBg
	P9cQcw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gufsqba1w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:32:28 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2db87f759c5so80765235ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790091148; x=1790695948; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SHoCPwg3yKGYoepxE62TQiEAKgIIh9UVY9jZRidEOuw=;
        b=ZRGsbZ06zz6CfxwKtjI/aWG2plvPDQqgxDfIQYyB2/Og2oh9erQ14XsfYjxUwFpN2F
         hZnHp67D7QE/3kvbl2/KNLNcsRlkwTmaKr2WpSqlKsqRWjA7NAsjpwEtVI5dUdgYS39/
         o2JxdD7Z1HKOJjswc3aW167NqIcDTXF5qML2/1HwywIRQxAy8NvO1lnaScTn7Zl3NZ+i
         rCYny8aG8lgwnhZ/4vdZFZ47PbI5usP6orx35JPFLBkIlnUNYWzbxd1w3daE3H6Y2qEn
         IxBc6SUYHPkd+lEmy3GZkJU8/C552jX5uvWwXbZ2XZwUfYnINMYCbLHce13lGXQJMdhf
         mTtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790091148; x=1790695948;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SHoCPwg3yKGYoepxE62TQiEAKgIIh9UVY9jZRidEOuw=;
        b=0gGZV5wnNcigynMvGtNAfELGzeXPngUUYC67z7C1BK9029gRfp7ZgmIHCdC5w+j9i+
         CYPQ6JbO7GqIQ8ofsykrn4L4ryAFtHnfCpplKx37SQFoMZoOkLmgnzOgQaj/9S/ybHpa
         1vJD70YyaKBNgTshalJUmduJugE9QHBjTGPChTbI6JRcPEMi5D3vkIVhtMXzBArh83BY
         w3nUOiWAnCLcXo8rkLmbBf5fRg6Yu8SDovPTXF0oekuaAZc04JVStzZgSOxOp1nYuZuP
         THbl3AACD/VY6vAqEem50n/o1bMVjwroy/+c1+zyEiYJz11U4FCsrdbRXZFmOioDEOh1
         a09w==
X-Gm-Message-State: AFuF++ko40KHLMIUv0uEm6CroxJLxC6c3BeETz5W62uJt+lgkxKHtHfs
	LTQLUXCzLyekYuglN3wa0KLBYCUnnBAeRIHXoknGTBIBaGHg94O2zGT7llfXEniv0lwS7Z8RVCr
	zdFEjzO/LaEjEMIJmwD5Pv+piSAm29mXH7LG17EKYre7u5D8tW632nB54JfmIWuIRrdo=
X-Gm-Gg: AYBFou3O9ZpJ064bD849DnvcNA4XaH1NkjBH4Nv56nGOK2k5YFwXc8VH+pn53dqitED
	6Ebo5HbnHnxReR+j7cw3qY3DsXcqI4vza1FZZZ7TO2FpUxbDQRbpRMuIDGOIrO+7GxunmkIMwau
	6O/A5BrnHPB7Z7a3kXDUENJ9jAIXRp5Gliv/LVtqcG9PohpIXVs0jon+i4V1dUosP661uv3mstS
	x/PA51ScIWSpE2YXHYcptBvhCMn6N2j1CU3C0FxH02UAu2Ky0mragZM8OmK+5OtCwIP4u6Pybdp
	vc/Qgg/tvidvhnYTdAXGdC0PXZ6sUFSbpvY/2UgckJSjO02HLh9p3xkqMj4lJ6pVfOKjIviaYty
	Rt32hryd3VoDWpfE2T8g5Xbx5RODnEePIvZw=
X-Received: by 2002:a17:903:230b:b0:2dd:c100:b2cf with SMTP id d9443c01a7336-2df60b7e85emr18775415ad.58.1790091147655;
        Tue, 22 Sep 2026 08:32:27 -0700 (PDT)
X-Received: by 2002:a17:903:230b:b0:2dd:c100:b2cf with SMTP id d9443c01a7336-2df60b7e85emr18774875ad.58.1790091147100;
        Tue, 22 Sep 2026 08:32:27 -0700 (PDT)
Received: from hu-ssmaurya-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5d047c40sm12334945ad.50.2026.09.22.08.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 08:32:26 -0700 (PDT)
From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 21:02:00 +0530
Subject: [PATCH v3 2/2] regulator: rpi-panel-v2: Add vcc-supply support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-rpi_reg-v3-2-9214321c4070@oss.qualcomm.com>
References: <20260922-rpi_reg-v3-0-9214321c4070@oss.qualcomm.com>
In-Reply-To: <20260922-rpi_reg-v3-0-9214321c4070@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790091133; l=1681;
 i=shashank.maurya@oss.qualcomm.com; s=20260828; h=from:subject:message-id;
 bh=QWiYTLoT7AkiN37vBI/AE7LlJlRi/CqB8G17hwaEjjU=;
 b=oQQWORenSVY+VYcyM+kJov0+Ffqr2lgTDDLrH9fI2K9UIJo07yqAwPyOpFgNw1oORFzYPjuPa
 JvGHfCS+ClJDQhFfizHLxJlmJo+wDZuKHJTi9TEw5xsD0AHaZuU6raB
X-Developer-Key: i=shashank.maurya@oss.qualcomm.com; a=ed25519;
 pk=xld72d+QYBwDMDcn3+QLCb5AUsj/D0j8klGIuxWd860=
X-Proofpoint-ORIG-GUID: lLymKcATNASGDc0NitjlK-__uQlIA647
X-Proofpoint-GUID: lLymKcATNASGDc0NitjlK-__uQlIA647
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIyNiBTYWx0ZWRfX+FCCwHPyF6gH
 eSSelQUKM/lpt8myI8ImUOjXc58AAsWzhpQYUKJZgj9lgWT6GRMCHHILlyZtRRdZxgKAf7U680z
 GB9jsTbMN3ud2dFigdVJP23NeLUSDk8=
X-Authority-Analysis: v=2.4 cv=NKBAaE6g c=1 sm=1 tr=0 ts=6ab29f8c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=RYO69U5GnIJllgjd4B4A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIyNiBTYWx0ZWRfX5tmBucjeGmfA
 ynBEOTMQJm0OofDh/itzXSApgWSQnRp1hJTZTlE6NoAY6H4elok+/hRT+fPevzIjvvPMxepsBvF
 +ik3qBAMerAnZuXtvMXdVD4WkRTtDnEc0FbNZ1tUI3Xo99HGq4uLBGg75AGuEpkoFtygybvIcIr
 zk9Gwp+uiLaoLHFD3KAdOBiBsKNZkKyuYNcsSi1/1EEJdAvFwjp1Mh39mHOLkuNDuQ7MfyN5g/L
 R8Sb0Pn9BKgR3CBi0DM5eI6ZBSoTZ1mtRTwqzWYVH7U380hXUCi4tEDNG0IXRiSgKr2sQBtRgWC
 /1Ueucp8Wxvq4/1QeEAFD4OdIEIFujSkb4lYQuIlF4jpRn61WLByB1910BjRTDZnx/kqKrdf8Nd
 RBr3hzzSkoOdopdpkLPBnWtiYDkdk4uwBQB7S5sHvcjiGMlYf5kl1nGNnH77Br4WpBtj+XV2OMv
 CXVKA5S5UK/gkOwJKOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220226

The Raspberry Pi 7" touchscreen panel V2 MCU is powered from an external
power rail which has to be enabled before any I2C register access is
attempted. Use devm_regulator_get() to obtain the vcc supply and enable
it at the start of probe.

devm_regulator_get() returns a dummy regulator when the supply is not
described in the device tree, so device trees without a vcc-supply
property keep working as before.

Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
---
 drivers/regulator/rpi-panel-v2-regulator.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/regulator/rpi-panel-v2-regulator.c b/drivers/regulator/rpi-panel-v2-regulator.c
index 30b78aa75ee3..e54d675962e7 100644
--- a/drivers/regulator/rpi-panel-v2-regulator.c
+++ b/drivers/regulator/rpi-panel-v2-regulator.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/pwm.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 
 /* I2C registers of the microcontroller. */
 #define REG_ID		0x01
@@ -66,10 +67,21 @@ static int rpi_panel_v2_i2c_probe(struct i2c_client *i2c)
 		.parent		= &i2c->dev,
 		.reg_set_base	= REG_POWERON,
 	};
+	struct regulator *vcc;
 	struct regmap *regmap;
 	struct pwm_chip *pc;
 	int ret;
 
+	vcc = devm_regulator_get(&i2c->dev, "vcc");
+	if (IS_ERR(vcc))
+		return dev_err_probe(&i2c->dev, PTR_ERR(vcc),
+				     "Failed to get vcc supply\n");
+
+	ret = regulator_enable(vcc);
+	if (ret)
+		return dev_err_probe(&i2c->dev, ret,
+				     "Failed to enable vcc supply\n");
+
 	pc = devm_pwmchip_alloc(&i2c->dev, 1, 0);
 	if (IS_ERR(pc))
 		return PTR_ERR(pc);

-- 
2.34.1

