Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616154;
	b=lrorfb9qTIld1leYtfzsiE6Rj8kENrEQhQ960do6nkveA+utojsBzwOfMDXiTK2THd5Z
	 9D5FZh8xoQw1FTsXY+I/7B1A5yrGmnJKKyun3LpMXgKRRIyEbRLt3yNEbowOj8UaYh6Ev
	 4P+xj1C+uDC5q6Q/eBmoi2d+pEIOU+c1PgMZTdAUnV5EJw3auDpVTTaq0KVTsWoPf9Lt/
	 h/gc3IkBtOWdEPBdQqrdKbKVHP1I7NzV6Vqsnw4Eb2SPjpyCsr/WIJ227yy5mVltfnVeh
	 TjRUl88My7eIVvoUOIwEnAeHaSPrXz9Z4FbVLi1HKmGemClhFEsfcldlLd1kMDNm0HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616154;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZatxASJgP2LkTYNOdR4KsoVlJiV1ZVJXoCNHu7shP6g=;
	b=Bw0U95JpO0tuis+7M/uvDmRZCfqz8jF2N4mSkxkEmrYSdONVSnhyk/i5DvISdb5SmRJw
	 oya0Js72HY4AKNCuiVu00ipjirkhC/xUUbWhSioVVS1F4yHVTmBoBw8Nydp16tXxQ/zhl
	 B3mL5VILAz03FAtAKZQfPyaGJU0Kvqms6oaKKdCLZ5E8NQAa7t/cr4Q/6v6GezDnPVvnp
	 FsI7cF4ZKIdT7IPfRn7C+KXqxqBckuGYZss80Sj23bOAkwt6cvQ7pGyShl7bIcR3R5Jc8
	 n/6/wpu1nH24bEWhhutUiDWUPXWervKBZqxMiIO3iJqYHG+hZcF1AeBP3iwuKeoxgNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UpwnpaHS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LBbNALc7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0375A60A5BC5
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:42:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0375A60A5BC5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UpwnpaHS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LBbNALc7
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A6bL213988
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 10:42:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZatxASJgP2LkTYNOdR4KsoVlJiV1ZVJXoCNHu7shP6g=; b=UpwnpaHSAilrnpNC
	45ac+f1d54RpuYYqvQdisI8oRkg6dlc0WjmS1ZGtYGc6Q1HyuFUlQ52EP8I4JF5p
	YyvbL1Ow+GiHcWsvfMLuysZqP1Qlk2iwa/hZpkOuMuLCs28oK+zCYTdy2o6FR3Cj
	XtwP5cjAUKh5K0Gxe6j1Xi3U2yHBLpWQQXgsYh6tCPbxiJFwXdZ3Y/qmt4hXgrFB
	rQjLc6FX9LeyZETvpFDDocIqAaMhQC2mM2nFBYtgxxI+lt50doQ9yullgPk/ALo4
	vMnfcwCgruxBTjE98/6sOhTU0EHtaKDO8E8FSEN91iBmm78FjCBoCSAMYG3FqLYk
	EjCJEw==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpmf1s6f4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 10:42:32 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b597558c4cso4358593b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793616152; x=1794220952; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZatxASJgP2LkTYNOdR4KsoVlJiV1ZVJXoCNHu7shP6g=;
        b=LBbNALc7XPDE2T0HwJNzNlGp80wjiVnw47+20ENHBf7WQ5MfQK9NxhdmJECX3sb+QP
         kFrT/BhGpAryxBgMvLbnBkntbio79mAnUXorYy2jnHUX1+FS0x9Z/zjhyPWVW8LhU87J
         BYEd1DyxcDIexsAwQ9S009lZnlEK0FTwYQEyASmrZjG3/mF+39X31h6e30sv2oZkR38v
         KVboAua7TaBvTI0WxW22BgpjfJYA3LgOBAXx0KeEZKx8fP4QRe2uoRFWEDzyB2juU3Hd
         1MztwVOiNFNURmBMkIYMAlPSwa8UGVMpm3HyxY+3eOFWtrG2t4lSU2SFu4TszlN8OHws
         tIHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793616152; x=1794220952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZatxASJgP2LkTYNOdR4KsoVlJiV1ZVJXoCNHu7shP6g=;
        b=arDZ7xpb5cTNHYXJjjB2CNoqh8DxHHebCtxwWaPUDd1rhjVTr18ay+0KwQzB/oJqDg
         cMDIuHwbpYN/LVMi7jMFH88vEGOcHEVZGOVkddAvvfLmyeuyn+yDSd5wUfwbEb5JVNOB
         FPagg/sAkaNHvqXjyIcVmfPD3SnaL4E9ZXZ1pgNUkG+jQdO/TXyvDc1c7JgRY9d+HmlV
         VDQK+5fh1eLeNcCbI80lljXOJWUUOG1GF4OdNBfjjPSPJQLU4G5+2FaMvj+z2n3gr02w
         SWE/hmVUR4VKj6JAllBGOzoYHroDtrjvpRJEo7xrkc3oaWKUXW96U02ahReX0rRRl13n
         qTig==
X-Forwarded-Encrypted: i=1; AKwUvByQS/HLcbOnR2mMLKjMYjX9n8GJHF9BEBydebr0HNpsIpOFrvglgHkTmtpUT0CtgouZUY3XRV7buA8/IFs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLu7A+Kze9ib0B+DM7LZTQUrHKFK2MBNhOVDroFFocUIiI0N0N
	EYDBEteZ17JAB9xbChfr9dJt7Tzxz/1RTOCH88+lr9GLcIjj9E+trjnMP8lV3avTGZ+8E1p8ewR
	rijCraT2tAQpNef52SOGNfHxe20VWrenNOczbI+RsQdK6igNkNqOvyf31GrVT+6uM19o=
X-Gm-Gg: AYBFou2/bg0wGyJiyemej8/pn9XIMK1lLT0j1MK7SG6u+WJ3ZxIp9VAfzkY7kuxHEQ9
	K+RHbnm3s/funm29FGuiYr7XMzYa8US0eoeOg+R7P3sG0wUv+Qyt1gxoXNccHsW6zUJmJDvtAkz
	ycudR5WVeI7Rk84i69gvmz3Fe97pl8DYj/3jedN1hzJcKb/wiiu4m6I0X6QxHEmiEMLfJ0EXVoj
	gAvy27wwOqD1nGMq1cn0EKvo3RCfvcfMprE7LhNxqNYrkk/JcCE6KsBeGoQjrRUYzV2Q6nU6nxz
	z0+ypzqxfNsG5feQZ2xtjT9eOUbJ+yLBDD7CFoWqN1hga7fFcCVrpjq7RqIRBTP3Fy4GNhEjxZE
	w6oCSmRaW9jCAX++lv69LTkdYl3k7kLcUEX2FhdUDlj2+PbinOHefKgtxBhKv4KFzSoGc2z596O
	u9K9tarwTkvJAbUQgYQWM74Q46wjFA8jlvZ8osMvjxfvFOXNpiFxaSLzUxIyQ=
X-Received: by 2002:a05:6808:16a6:b0:4cb:f21c:a79f with SMTP id 5614622812f47-5640df8d97bmr5915324b6e.39.1793616151922;
        Mon, 02 Nov 2026 02:42:31 -0800 (PST)
X-Received: by 2002:a05:6808:16a6:b0:4cb:f21c:a79f with SMTP id 5614622812f47-5640df8d97bmr5915303b6e.39.1793616151442;
        Mon, 02 Nov 2026 02:42:31 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fe0fc77sm7447171b6e.12.2026.11.02.02.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:42:30 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 02:42:16 -0800
Subject: [PATCH v24 08/15] media: qcom: camss: Allow CSI2 PHY devices
 without CSIPHY resources
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-kaanapali-camss-v24-8-d6b8f3f6f66f@oss.qualcomm.com>
References: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
In-Reply-To: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Vladimir Zapolskiy <vz@kernel.org>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-ORIG-GUID: w4dHEhZHaEHvmZ3bnytLg-RTyFClODVL
X-Authority-Analysis: v=2.4 cv=bNaDs/+Z c=1 sm=1 tr=0 ts=6ae86918 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8AirrxEcAAAA:8 a=2_0--xn6cTixhlPqFr8A:9
 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfXwznHg3UHd9lV
 AcsWyy3fm3pYXjYfCmJ7piYzDVxV4XbJLFUHVB+bKAbpPJhETs9FakN1ZU3SdOYF5DNneq6QWQu
 Kf3WaI9r/1yLKpQj8D35m5M6GRrwLHpUfYqPYFu7LFzk2uhq/VKupitOlNyHuKyy9dGV+verWkF
 nxEZf1+7+u8QC2IHTygntHXHMCoFEUpBFj1q6QEka2jHp3EeShSymBNypflIFA8+HRj0pxQ33N9
 GetKm/0cZjw5dOhNh7kANd+gYQzt6kzYsDRTx8bew5iO5oO4MqHK7z13u7nxvhyIfB1bUXIwdSF
 uEf9N8JJG8QtiLWFRZ5YBcpvQdRpKMq/ubxKjO7sK0QiaYMVVsMuYNyjMFbjJE651w2Rkj7JsF9
 XXbBx26cHeEgE5Z/gwMnFiMbV85gmEFZ0V9CNCZ6a+/oXUXpT/ddnLmYbzH+Ao26wkVjDtFzZkm
 r34xMwOCd1viyII2XcQ==
X-Proofpoint-GUID: w4dHEhZHaEHvmZ3bnytLg-RTyFClODVL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfX5bUBVixDzOWb
 +Q87saqGgVbFfJSNKgYOLSeOw1AuzpDDZfKSXhsMM3cekhYbAYFbSQWdk/ynn/8VhjqrZXfOJCU
 Ij/kVgeBnV2Y9qVaK+17Jl/DG0686lo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020042

From: Vladimir Zapolskiy <vz@kernel.org>

If CAMSS CSIPHYs are supported by the stand-alone CSI2 PHY driver only,
there is no need to provide description of legacy CSIPHY resources in
the CAMSS driver, therefore if CSIPHY resources are not given for some
supported platform, use CAMSS CSIPHY port numbers as CSIPHY identifiers.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csiphy.c | 16 +++++++++++++---
 drivers/media/platform/qcom/camss/camss.c        |  8 ++++++--
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index f99eea2ef228..8ecd514451d2 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -799,6 +799,11 @@ int msm_csiphy_subdev_init_legacy(struct camss *camss,
 	return ret;
 }
 
+/* Fallback to generic SDM845 compatible formats for non-legacy CSIPHYs */
+static const struct csiphy_subdev_resources csiphy_res_phy = {
+	.formats = &csiphy_formats_sdm845,
+};
+
 /*
  * msm_csiphy_subdev_init - Initialize CSIPHY device structure and resources
  * @camss: CAMSS structure
@@ -808,7 +813,7 @@ int msm_csiphy_subdev_init_legacy(struct camss *camss,
  */
 int msm_csiphy_subdev_init(struct camss *camss, u8 port)
 {
-	const struct camss_subdev_resources *res = &camss->res->csiphy_res[port];
+	const struct camss_subdev_resources *res = camss->res->csiphy_res;
 	struct csiphy_device *csiphy = &camss->csiphy[port];
 	struct device *dev = camss->dev;
 	struct device_node *ep, *remote;
@@ -836,8 +841,13 @@ int msm_csiphy_subdev_init(struct camss *camss, u8 port)
 	}
 
 	csiphy->camss = camss;
-	csiphy->id = res->csiphy.id;
-	csiphy->res = &res->csiphy;
+	if (res) {
+		csiphy->id = res[port].csiphy.id;
+		csiphy->res = &res[port].csiphy;
+	} else {
+		csiphy->id = port;
+		csiphy->res = &csiphy_res_phy;
+	}
 
 	snprintf(csiphy->name, ARRAY_SIZE(csiphy->name), "csi%d", csiphy->id);
 
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 3857515aac7c..30c2a0c89100 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4810,7 +4810,10 @@ static void camss_detect_legacy_phy(struct camss *camss)
 	struct device_node *remote;
 	struct device_node *ep;
 
-	camss->legacy_phy = true;
+	/* Legacy CSIPHY description implies the provided CSIPHY resources */
+	camss->legacy_phy = !!camss->res->csiphy_res;
+	if (!camss->legacy_phy)
+		goto done;
 
 	/* Find first remote-endpoint and determine if its a PHY */
 	for_each_endpoint_of_node(camss->dev->of_node, ep) {
@@ -4824,6 +4827,7 @@ static void camss_detect_legacy_phy(struct camss *camss)
 		break;
 	}
 
+done:
 	dev_dbg(camss->dev, "legacy phy mode %s\n",
 		camss->legacy_phy ? "true" : "false");
 }
@@ -4855,7 +4859,7 @@ static int camss_init_subdevices(struct camss *camss)
 
 		if (ret < 0) {
 			dev_err(camss->dev, "csiphy %d init fail\n",
-				res->csiphy_res[i].csiphy.id);
+				res->csiphy_res ? res->csiphy_res[i].csiphy.id : i);
 			return ret;
 		}
 	}

-- 
2.34.1

