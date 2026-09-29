Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AFED5221CF
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790684763; cv=none; b=i/pE5+wTEb3+i4F8SfmJfYuwAkyac7QUr8LCGlubNMYrTl3mgoMIUqUhFRPVa+XAgifnTIKA2Q0ufYtucWISVIxdLxmJ3f/uUIwA4+TBetUQIKa51gdo43sjJ3aBZzvDfcCYug0bJvyy7H3Eq0pRLB5eWf5P3OS+m/r1nLeoPAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790684763; c=relaxed/simple;
	bh=AiV+UgMZj/8Xbz75FJ/bRBCuJFbHFnWTyvBbyi9SIaA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MlpgkPLJynV7ILP1D0z/pcwJWMoe/EFxmZa1hXZfC+X0t1wVDBP+qmrcwBcm90MDC59kYimjEwZtF1q4WGHKHVTFvXMCj8RlpBft+LNjJj+azaFBdxZr/WWXLGbuEOuB31UTJBuUYw0Fab0WEqF9GymbpK43Uj0HVTfm6kCuAJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UvPyO3Xj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CgF1pLAX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UvPyO3Xj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CgF1pLAX"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCEKpm3206247
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:25:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j0W3hrgF4xqqK3S9Nv7s61X5LJpvgGVvfqcGo/cmYe4=; b=UvPyO3XjTV3JmEU0
	BzDdmnjOhQUerjmnDIk79o7WXrxThdTT0oKSwt6PrjrPIntrK78Q/dOj43x5ps+t
	T58nj83lE4QYC3lFiv3ko1IhKx5g+q6JFjcNk057UtDT2DbTKh2veUu+dZvLxxda
	Yz73S1eMPQN9VeTA+N8cbGhjuDU5oClTd8T5FrJzKk5v06oVTqv6WaZ1QifMX9EU
	mSGOvEssk0ADqQw1fdEs7MfX3eCMXZoSyZSgLgIcWm68jRPkbEPZXRvyaZ6bhSX5
	vJDa6TGtQsNyfbAefjiBu8YSDd2LQxu2haKxHsmEYH85rWQrNJEe20eYhLNDbz2O
	HnEYeQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h02mnan1s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:25:59 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-532c2cac078so67664651cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790684759; x=1791289559; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j0W3hrgF4xqqK3S9Nv7s61X5LJpvgGVvfqcGo/cmYe4=;
        b=CgF1pLAXPg0N9WvZm+2Wmj1BJdtBgGtjojy/YrTSYo8psnuGFNI+4zS2xmoT5IpZ+W
         yVUQFvkdeSWFRckN50m+m0KbptpV1c+O+Z0mVj9SwVnQFspISja9MozhszmQ6F/SFLX4
         fr6vsBzt5YePXoG50Q+gvlvOLxxIwA9vRKFf7h4BvZhRV0JpPv8B9pzqL1V36QCmycam
         VySWjtpJF6Fw/GtJ7/NbcFxnMxCMaC365zGh2yi2A6pkWzLX5uoP66ZcG5mWXfiW0qGV
         XJpKo07izAneCOl6FzQLlACqAXR6yHL5e1Zm5l0LTZ2fEaI6thRA29pgqZ1l5mXwGNDF
         sYww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790684759; x=1791289559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j0W3hrgF4xqqK3S9Nv7s61X5LJpvgGVvfqcGo/cmYe4=;
        b=fm8a3aHfBeEa5clCjoHRhbir5tGSIZYXb9hOE22XL1MDC3EvECV320A5FYLXweRKkl
         TuvwY/BKCDP+DfUEmKsrpmB3YtqJyj7VNHZUPD2nt1IsygTWjcuoS1SlQMwfahOUa1Ay
         FeywbZx7IaIl7BiwK5uyQAr5veqAmcuMW3NOMgeIdzD9AozsTgfDhyIvx1TedjS64/vi
         D2wZzGdcwVZ5vMIdl4a1Y57OccoiFOcsNrOGAU5XNHBYCxUvY9KFouI0Ni2cAuRiY71x
         AfMSJbQEVLFn9ypwgax029c3kRldM5pkr4bFEjkf78EQL5+MZA8e/c1ys29wNEWllJbr
         sP7g==
X-Forwarded-Encrypted: i=1; AKwUvByHdzq316dNOm0oNwli4ccjqa2Drn6yaHMhkIVUU9Q833k0OViPcKoCv4NKtAMgGRgTbj0G0eLU2Z+4UAE=@vger.kernel.org
X-Gm-Message-State: AFuF++kOTZy+RYu/1T0PpFNTUwGQyCvJQAT8fEo3m++4t4fSZCT9ElAJ
	S6fmh6I83Bl5NjQD7qXGrxFBuxjbO0Sceqp2a0P24i6OGMp7mDUcgMTeRhyfdoqjWfLhOh1pv1p
	JbmVWucQjizUnzvPYgpJHVhHIDbTDPglpJ99IdOP6q6M3PBcAxRkTY5S0NXqjS74lDeQ=
X-Gm-Gg: AYBFou2HpBMby8U9+93VmoRb4UvFuW9MD5AY51svI+6PuJ7/1f0XZVEpfGy/CvA6JNJ
	YimdBOPpgNSscXzOzE2gq/VSNAROTz1lUIJZO66aWxTVpBiDbitLlHdS+LtJn08wYfCErlpGVuc
	oBB2REt/by4JZtnzxFFEok+qnRIhMobR29qL66VV7htr20tvIjM8O0RkQGTn1MmHg63rSpqCdim
	dqWuExQw8uy9yiZKSjWWmo9zjdUSw4Oq83+i9LINwVSt9eJe+3qyTcDSP2Sa3D9ZOsP5/oedUMF
	XMHSiqIau1fJ6ubhpNpnGYxWrErVs1kT/ZylWzahRJ7g2a97qgx+dY2BDqpaetZH9ruxbrEqCnV
	62Q+uySrG8G63ilqkSZX4FChooXJUR6vxiNTN83/4/vrSOYKjBiLGPHMtjpDpAGc5+nPBXKb0J1
	hJoRpAnpDEy0JA1QbkoKGZtC31DGIZkuKdZMAL0yAzjmBYMUNhtEs=
X-Received: by 2002:a05:622a:5887:b0:530:f37b:cabc with SMTP id d75a77b69052e-5330b55671cmr281761681cf.12.1790684758498;
        Tue, 29 Sep 2026 05:25:58 -0700 (PDT)
X-Received: by 2002:a05:622a:5887:b0:530:f37b:cabc with SMTP id d75a77b69052e-5330b55671cmr281761081cf.12.1790684757981;
        Tue, 29 Sep 2026 05:25:57 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:5c1f:3897:a4a1:99e1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d302482sm9103956d6.12.2026.09.29.05.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:25:57 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 14:25:47 +0200
Subject: [PATCH v6 3/5] i2c: qcom-cci: Add 19.2 MHz timings for the v2 CCI
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-cci-clk-fix-v6-3-62a268cccb0f@oss.qualcomm.com>
References: <20260929-cci-clk-fix-v6-0-62a268cccb0f@oss.qualcomm.com>
In-Reply-To: <20260929-cci-clk-fix-v6-0-62a268cccb0f@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca@lucaweiss.eu>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, vladimir.zapolskiy@linaro.org,
        konradybcio@kernel.org, stephan.gerhold@linaro.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=X9fHu2Te c=1 sm=1 tr=0 ts=6abbae57 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=butnsgrUGOw-u3YEFNkA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: pLOiPKCAA5PuQgU7AGxtfeA9UMUV829j
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0OSBTYWx0ZWRfX1d4qC2/0z2xK
 6hCaTwByw3TeLgC9ESCIri2Tv4xlx9t7GSZIAf0Wo5S5Hh2JV89IpMV3KyFyhtpVAZCaZMjF/QC
 RKz2X1sse+kfPWc4uQfUiMtijDWUGU4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0OSBTYWx0ZWRfX++ZT3HVeBTqN
 B1l9GyKFDL2HSqZ4Plt6cNDedJcF1q8fyVUGIDB776j8clM5+cBuyvM7Y1LHTlpbCCB189grxgV
 GY1aQ0JKbxzHqMxFcUsBIQf79O7HCOIX0xu3rz1hQSQS9LDdcMtJLQ8nD1qKeOptAfAm5+JhD6q
 twFNMv8V0h2aoMC7wZYXE72Gpk0vgTf8Q96R2tCTTgeYkL+5yt+9u7fzolkRs+DdUwefW1vO33U
 nAvtXIMBm/DUilSAA/TyeZJ6crvDlgyx/M7WOCDWfwlc03XB8jLaqA4ip5cgiyu41/ncPktpc9u
 qTXeS/Ex/o/xpq6SW/rNkfml+n4kZuHiFOG4MM2eE7oFc1asdIY+6hkpjKAwb7DuryWYyzeznc6
 NWqTtnyhnXTU8hVkJrKTccJ59TuPdNZUBfhSEdavjmgYVzNUjXedu+Mxplf3HkkHPwlgMc4ii36
 JWtJMRA6LWzjX/lD6Og==
X-Proofpoint-ORIG-GUID: pLOiPKCAA5PuQgU7AGxtfeA9UMUV829j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0
 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290049

The v2 CCI (msm8996/sdm630/msm8953/...) is normally clocked at 37.5 MHz,
but its CCI clock can also be configured and run at 19.2 MHz. Add the
Standard and Fast timing sets calibrated for 19.2 MHz so that a v2
controller left at that rate still has valid timings for those modes
(Fast+ requires 37.5 MHz).

The values mirror the v1/v1.5 19.2 MHz Standard/Fast timings, which
share the same CCI clock rate.

Note the "v1"/"v1.5"/"v2" labels are arbitrary driver-internal names for
the cci_data configs, not actual CCI hardware version numbers (the real
hw versions are e.g. v1.0.7 on msm8974, v1.4.0 on msm8996, v1.6.3 on
sdm630/660, ...). They only distinguish the timing/mode configurations
used by the driver, and will be subsequently removed.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 1092ce0371429ef64c7cc44cc23a42ba4c135af5..b6fa37a306758ec33ede6fcc39ce4412b86d9a84 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -762,6 +762,30 @@ static const struct cci_data cci_v2_data = {
 		.max_write_len = 11,
 		.max_read_len = 12,
 	},
+	.params[CCI_CLK_RATE_19_2MHZ][I2C_MODE_STANDARD] = {
+		.thigh = 78,
+		.tlow = 114,
+		.tsu_sto = 28,
+		.tsu_sta = 28,
+		.thd_dat = 10,
+		.thd_sta = 77,
+		.tbuf = 118,
+		.scl_stretch_en = 0,
+		.trdhld = 6,
+		.tsp = 1
+	},
+	.params[CCI_CLK_RATE_19_2MHZ][I2C_MODE_FAST] = {
+		.thigh = 20,
+		.tlow = 28,
+		.tsu_sto = 21,
+		.tsu_sta = 21,
+		.thd_dat = 13,
+		.thd_sta = 18,
+		.tbuf = 32,
+		.scl_stretch_en = 0,
+		.trdhld = 6,
+		.tsp = 3
+	},
 	.params[CCI_CLK_RATE_37_5MHZ][I2C_MODE_STANDARD] = {
 		.thigh = 201,
 		.tlow = 174,

-- 
2.34.1

