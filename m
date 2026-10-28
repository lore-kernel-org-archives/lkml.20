Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793200879;
	b=JN5EKUBEG6aNdd0CSvWHD/NLsFpF8BfmH1QlSt+QpwsAkzhQE9W5tZNFoV/R0eow4n6F
	 VgMyywK62zLN/mq1XoTNfj5NB6GYJpj9Cw/i0yD6I4XhaA5N+YOW1t2eHQIrHxZsQueZi
	 3he0XbroJqBjk2pY5+4ArXHNdwZCfLyMn2FcJ4f8fnRyfXeJGxIFMo0C6czvYOFcHxI6X
	 1/4HD8Z6Ru4TSdn9irrFtTbhYsn3EJeA1GzQO25cK4ZFP4EGffmVYs7SDsShqCc6HAR00
	 uH8Nlz9oPvDasmIzMCMrMCH8TqGo0o88OqjxkdMG64HKfA2fuSTSgkDSDhwIqxsujHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793200879;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mtyicMFphg8NIVF2KmS0oSGWOULir4B5NzOfXYC1xoQ=;
	b=fmCaYiya54t0Z3/w+0cqZXywye9kF+QmGua4mUqTPWU/sX5v0Kk/EYa48qNQpluHPUYo
	 IaWC8w5DaI3DIoQU5hLAqP1SRjGggrGRtucoeH5ItonZo2eDAi4DgKRiJIKlWrCyL/YDn
	 x7dJwJcl+vcJT5e06v6t2BnbRmL51178kXzQuSY9gT26ju00dUiDxY7F2HTtmYYps7B72
	 otBlxIq+hFdIPeFsFhQhL9qTgOXw7pGbxgSzqO09VhZ6njEN7KgWL6bj5epNq51lyP0qp
	 1/61dijaNLRtDEzCjDtR9ajgH/oIK9bI8zNzgdJd2GAYVmnk+hbv8o17OTKqJINC2VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F+NFIjQd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O2U8h9Kz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B8C60A2637
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:21:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60B8C60A2637
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F+NFIjQd;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O2U8h9Kz
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFADPA2001635
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:21:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mtyicMFphg8NIVF2KmS0oSGWOULir4B5NzOfXYC1xoQ=; b=F+NFIjQdS2yHtIq0
	XVAfqZLJkJbeyypfqPMoto3ULOCSYsonzYMFk1m7L6oggnOfJrOUO+VPx+Q45x2R
	gskrkkoQ/M3HYqIMW29inufC6KXCHsLz5SS9Uylp+NOcxoAKEujfpyZ+EBJxPRox
	glKj+vL6AcYOMWxplYAktVQHoHWWBPkT71PVgZNGt4w3o2UHmsb6Zxi/zlv3KYaX
	rfTaeUO14fiSwENsSIgvcpp2QbwXQ0DJWEskvLfJLc/kv9l8gPWUgVyDyWj60r/A
	qiytn6nF06/Cx3bWdTW01qYi7eSwYm5xs9CTC1fO4NWLtOV+NM1lpduM4EbQe0b2
	bxbaMQ==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdf7sm4d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:21:17 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-677c4ca2265so1846337d50.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793200877; x=1793805677; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mtyicMFphg8NIVF2KmS0oSGWOULir4B5NzOfXYC1xoQ=;
        b=O2U8h9KzwXl3Drgf1Z0ZkiTDS9BR8I7evYrvg5H+08SJsHOF2uw+tg8wp9nOEa4Fg6
         zZw3Kd1EZItTfjPveXpTPlf90ug4smYK1+0DqtYtaWHxvGHWRD9/53XJzDh0w7DmHJ3w
         wXfQ4sAEAEDBW4l/dGGsftk/Sp5ZJdiyBY0AiZnsXr7l3H8wzIOUHILEMUp+hMzfkfDw
         tXoJoe2fMaeZZ0OjQZj+G8vIyteP44r8C/Efqhe4X9wG9yLYHmskKaL1oRazVdweGg78
         kkCOGPbv268cDge8jzjtuRspHxyl2bPSESr87gA+/nXBvnItizDc5f3g1RaDwvDTyuQ6
         E6Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793200877; x=1793805677;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mtyicMFphg8NIVF2KmS0oSGWOULir4B5NzOfXYC1xoQ=;
        b=PXvPlqO141eSZxRbibSyRmC61SB2kzTUXaw3iMk/T0f8iyaQ4PTD/G6fyCjKgPyQBc
         xuCSk8LFiUmy5dGmqd8wKCeFcv03aM/PitwSLM8vERfgp8D3ap/kW/ZWLeAUzxaSiO0d
         wZm7EzOlWHbmPaZynH53enCubSBTdCqXlHMDz1IVpMko7KAVBWAZ44lJHxZojnsSTtvl
         TY2v2ZwxNWZ7IXLbVtQD95uBqdk+aSkt3nzt6+NvrhSXwmgfYSMAlOekuiulMG+cPv8U
         zMaqrn5LFdKgtj3KAvvYz3/8fsX8TtRumEdyaMTI67AhMfTV6y3CmT+7LcL6BYQQBKun
         RZqA==
X-Forwarded-Encrypted: i=1; AKwUvBwVUVBnj7qeWva5GZNPLyhUffyFUeYqYtVU6yP81SZ7wGYRMBZmrZT9wb2+jcG5EiliFusT/mYW4Ua2Ovo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJDHG3Jx4keEObSEww10tjnJhNINHfUqDrTBVHcL5fqn3PZnSdZ
	JJyAENVwZrv09FacwQQl0Oer0N5QZr+0VmDDUwCBIaaD/PEFRZi2CDakelJ5jGWqmHbbVMZ/AUE
	YC3D57Dgcw5f0BF44LPhN+oau9knPPLv5P9zt6zNZuhlMTthMXbQnFyKFdEXE+Zdkiz8=
X-Gm-Gg: AYBFou264pZe+87qOROX+fjJV5N7dHRiaYNdwKdAbH53BtmTkdNfg3XfXgHmRgjEt9T
	4i3siomlTkt+ggilqj4m/4eY1j+Sq6LjXLeRXIHsNzg3MnrdvC4GuR4nlKw6FvbCMq461+F33yI
	aGXhLo7A5Z6CJZCPoxry4TX5fBGMkJzL0+voBxv+Lqbkpm3aMbC1E1RFKZj0x5SbU9HlGDYpd9e
	GG2eOOPb5PgaKj42LoRzB6QmUDN3Q1IZ6RdVN6c4KZJZvwSXnqgl4yimaIj5juRex1OJNztUoC4
	BorCXgGAXSMvZvfTM1Vjc7uKjS6iUuKe1OLec4vNL3LhMNaQRDCYD50XpSKCvmTX1jiU/MFDaHR
	DfhL/jgQIHgVXr3K6JOZ8T2DnlYvAwzxBHmxKl5Xen84Qvau8aO7G4RGmkXLebLxprABe3rxFGQ
	gK7t8Iycaw6C7BcPA19TpI9cYDHnxArX3WOyw/OUha/c0m5Kmo4HYI4F8jWDCu
X-Received: by 2002:a05:690e:2061:b0:672:d32d:999 with SMTP id 956f58d0204a3-67a7b9b9f21mr1313085d50.14.1793200876530;
        Wed, 28 Oct 2026 08:21:16 -0700 (PDT)
X-Received: by 2002:a05:690e:2061:b0:672:d32d:999 with SMTP id 956f58d0204a3-67a7b9b9f21mr1313046d50.14.1793200875859;
        Wed, 28 Oct 2026 08:21:15 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a803cdd1asm1107541d50.4.2026.10.28.08.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:21:15 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 08:20:40 -0700
Subject: [PATCH v23 06/15] media: qcom: camss: Add Kaanapali compatible
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
Message-Id: <20261028-kaanapali-camss-v23-6-95f250b18612@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
In-Reply-To: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
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
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Authority-Analysis: v=2.4 cv=M4bYuCws c=1 sm=1 tr=0 ts=6ae212ed cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Eph36bqoL6-XvbZcx_wA:9 a=QEXdDO2ut3YA:10
 a=nd2WpGr1bMy9NW-iytEl:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: aWHv5Tzs5w37LJLgvKDf9-oNznezRk4W
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfXy+hCOJxt8qlj
 uurYksEVcUkOPpKaK6BITDwYsSIth6WwMMQyMul6be79NqQ+qCzd+c0X9bVsfdZr8MRomQywtK8
 ttoEYN5zgGGg6mdf/n/MTKVrJsb0GVs=
X-Proofpoint-ORIG-GUID: aWHv5Tzs5w37LJLgvKDf9-oNznezRk4W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfXwAKH8X+6Zk95
 aQYovPxN6HLN70pfFbPsVtAD59cwgicw2BIC9LJRvPNGIj7o/vIcqKvPAXWsQYEF1HlR5xk9qAT
 lTZPw/cP7N6t6tYGmMmf8L8CCPu/I9R+fW1yw8L/yfkzBsBbdZLc53k8DNjN9zLpHFiU6pjU2sw
 GEt8WZiY3QJokTZSaZxwho+ENnnsydvEL3kQnnHARSnMxXPQp6CGKzL06hbTF74L8D0c8bOWcuu
 OFKHHhYErhM3rxdV/SPvePlMoxESa5sjguhjV9NhxeBatxVo5Jq3GQpGsmvtEVeJS4ENMlrOG61
 doxXcTALtvLiIAjZ2KN6LtWCXA1mam8lg8c6IXRJw6Aw0Mui9Xu2MdYW6KdLBffu4llPt+YrOZm
 s1ETdDGcshskFwHuvkjcnM6MorsQqjKCj3ojZQorDARfo6ghmLeuRDueQqxXq45EzCxFLwjJydU
 fjjLwRAyyLlxi2MV0ig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280061

Add CAMSS_KAANAPALI enum, Kaanapali compatible and Kaanapali CAMSS driver
private data. The private data currently includes only basic information.
Later changes will add CSIPHY, TPG, CSID and VFE resources.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 22 ++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index be58a39f4a8b..98ec23c39fda 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -38,6 +38,20 @@
 
 static const struct parent_dev_ops vfe_parent_dev_ops;
 
+static const struct resources_icc icc_res_kaanapali[] = {
+	{
+		.name = "ahb",
+		.icc_bw_tbl.avg = 150000,
+		.icc_bw_tbl.peak = 300000,
+	},
+	/* Based on 4096 x 3072 30 FPS 2496 Mbps mode */
+	{
+		.name = "hf_mnoc",
+		.icc_bw_tbl.avg = 471860,
+		.icc_bw_tbl.peak = 925857,
+	}
+};
+
 static const struct camss_subdev_resources csiphy_res_8x16[] = {
 	/* CSIPHY0 */
 	{
@@ -5589,6 +5603,13 @@ static void camss_remove(struct platform_device *pdev)
 	camss_genpd_cleanup(camss);
 }
 
+static const struct camss_resources kaanapali_resources = {
+	.version = CAMSS_KAANAPALI,
+	.pd_name = "top",
+	.icc_res = icc_res_kaanapali,
+	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
+};
+
 static const struct camss_resources msm8916_resources = {
 	.version = CAMSS_8x16,
 	.csiphy_res = csiphy_res_8x16,
@@ -5823,6 +5844,7 @@ static const struct camss_resources x1e80100_resources = {
 };
 
 static const struct of_device_id camss_dt_match[] = {
+	{ .compatible = "qcom,kaanapali-camss", .data = &kaanapali_resources },
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8939-camss", .data = &msm8939_resources },
 	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 431afeb381aa..97fec24e6804 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -96,6 +96,7 @@ enum camss_version {
 	CAMSS_8550,
 	CAMSS_8650,
 	CAMSS_8775P,
+	CAMSS_KAANAPALI,
 	CAMSS_X1E80100,
 };
 

-- 
2.34.1

