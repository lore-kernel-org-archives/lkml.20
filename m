Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91E62F7F0A
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789971667; cv=none; b=gTmh7JzKxTi1gkKzsZV85FJHccVQNZvTMGBHk0DrO8pY/9gTfnYUZ2OvvvANgRcNQ0bz1aaEBipCqTWOGJYNAKO7hjcVmUW4m3dIFBHptkKRFAY3PvzkQtf7M9Vv0WIS7T4jlRINZCiY6TJD9enPxa2DweWuPiDBPxNNkEv67HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789971667; c=relaxed/simple;
	bh=N63un/lF44JSQFd5hBeUuqeP/RTk7RsvOxT0zvGBptc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aDpQJvRSO92mLtJgyLawrAd1ZPSmnbnXhnthCBAPvcWuy3bBUe5/hCHb0hNFwQpxIbcUDRcLr3i8w5HqcaIUYAbc5Fj2yONeGu6jS84mUMBkHBDKAmCMVat1GAlVps49GQrKSIgdI3zWHroIgcXjdukGPJXoy8Q9iSgsSXVDMKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IGlSz6Uu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NHjx0aS+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IGlSz6Uu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NHjx0aS+"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L3ZhAj635827
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:21:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b25OhBNDuWnGd0/gPjM0hDgSKVy4dyq4uzoFl6nEX7U=; b=IGlSz6UuULfs6HiK
	ZUfn+dWbNfcfTGFYt164x6c1gpRTZgHYIVtufh+GO9QbsNZQ/JxL5IcwpvPrIEen
	c4nz9OL9xRf36cRGY1m0bIsEK29fbm6kI6iHumjZCdnLHVYrPdx4Vzc8xvAN7Ip1
	S0usPhI3PS9EOIbORae9J7oCytcYUfp552S0VySp3PQEPUHrAzFYNQjEZAVMOmcm
	H0SVlwGpQFE6nJfzDUUceeWu3HO1jMo2L4N5muLaVz6npc0Zoo9GWGprMgFtOcfB
	8YmcNywYo9ZQl3c/Os2o/dhgL+hWM4CdUd+1ZxfbKbjoVR9q1lypPCMPiZY3/iD1
	2PMnRQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gshyxw1m4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:21:04 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc73ab90ae7so1519161a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 23:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789971664; x=1790576464; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b25OhBNDuWnGd0/gPjM0hDgSKVy4dyq4uzoFl6nEX7U=;
        b=NHjx0aS+V2aQwzk2UyAxfAa5Al9xmtehf0HDqovvuvEONxYJZcozSzvBVZVlPaTcEU
         0unwbms5lIt7UP3Hqm4YKD1A+JnZvQKOPiyvAoRcOjqfgT/PvSW8dlDUUyOXeZ0SR3uL
         o7r2XwARzNL+rDNLvf//mkOZwjBNw21/bDN6cFcWAbzP0jPwv8lchdOOYOLMfgmOKXD2
         w3pqnhZCcI785rrUU5i8WTaEGUCEB+b9SofLdeg7k0mM+urgEHD0yysDD+AuweaNxy0w
         X4wjjmb+Jj/j25cB3SpT1b7+bitubpgd6NOYCIkXpFTm+jO90gTogPloRlziowPG8yKW
         9Scg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789971664; x=1790576464;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b25OhBNDuWnGd0/gPjM0hDgSKVy4dyq4uzoFl6nEX7U=;
        b=X9FMByM+g3NvcQXK3i1cxiP971YrPP3p/KKE9Ei78icSfc28Tb5/uyUP6VT8beUmfs
         HDp1jVg+9qtvOB/HWYCIqnP5Lrx0iHzJXV0NjDm7/ktOYx6wiZaRyy9gcQCflcBxY4zG
         0K/QiWy6iVyl+VkNK4hc7V02I7s9h2p2tZRUt076/uvId/X2Kq1DppQj+gS8oyOJed1x
         RiYRAxGCsUmqVpmPTKkS364C3tgcCaAT8UqmaU7KhntIYTW2o7Wep5XbTC9ishYsuQFt
         WLgn0kzeqRezrhU/J4HatijCVFK9GfHkPnfqX3AXcwIGJ94b0LuTljemIJSgTw+99IH+
         lRww==
X-Forwarded-Encrypted: i=1; AKwUvByIn70cy4UKu4+gJN2eG/k7BJfI3SHvU6KYVvsYTvnAuWDkVM7hz3FGU9LekDV5d3yzpXpp1tQV18k2FLE=@vger.kernel.org
X-Gm-Message-State: AFuF++kxgnGZm64BFa9xY88marsGeSdDT3Ud2ktXcTiUGSSFL9mEC5Ss
	Sq8QwB2vjBTiYqOEUVb4nFgrsFo8fPFIl0Za50gCnfWzotEPWFxIdJPXYF+bNJtkPUTTYgIJfiw
	GI2WkqbQV7cPTNhrbRZpMAAWFXE4wUkWBjcVsMEZT1JwxZz3X8Y4O8rFjYqL/ZdJZ/Wo=
X-Gm-Gg: AYBFou00DjR7vvcZg0OYIJH2hlEs9OmU/ybAI3i5uJ9HDfPX3zj+lIqZ1xGRnVWA5bG
	Vl2lsXGk9oVg6plKp4HKNA1O06EpfQsecTKE9czZyUAnQ+b4OmUvwIv9WFNQ2nAoNNABFhENJ4l
	lwlGD0W98nXuBTC8C8cK1RrqG8GDYTgzgns+1Iy3TNMtfjQ8GppK3nOnuXXgHSCj1ZQx5SF+L30
	R1CMi5PKc7Dro3+UoPjoJ9xSY0tF7HbCVdMOErb4Dl9T+mYX5byX2Yg56BG2IHKiqWH7Qp5+5yp
	TCNWiyJcPxxknat2BnvEcapHpJ5Hsnq4YfrNmZ7CZzoh/rf1eEdEUMNpEn+yq3dc/QWsPpttaJC
	u87L0XAdGCeI+XQOX9hZgcBBdQBEXpXNKmj4HxfRSIRa1aRlao1uqXlgyVhQQftKJGEyifJJ57r
	frgawt5g49WGPho+Yh67QJftjGuPpZaoWXaw==
X-Received: by 2002:a05:6a20:cd95:b0:3dd:85a9:55b6 with SMTP id adf61e73a8af0-3dd8c5d2212mr15957307637.33.1789971663888;
        Sun, 20 Sep 2026 23:21:03 -0700 (PDT)
X-Received: by 2002:a05:6a20:cd95:b0:3dd:85a9:55b6 with SMTP id adf61e73a8af0-3dd8c5d2212mr15957280637.33.1789971663524;
        Sun, 20 Sep 2026 23:21:03 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331d3f2csm14091444eec.28.2026.09.20.23.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 23:21:03 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 11:49:44 +0530
Subject: [PATCH 11/11] clk: qcom: apss-ipq5424: fix 'ipa' typos
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-ipq_clk_changes-v1-11-d242e3d49648@oss.qualcomm.com>
References: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
In-Reply-To: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Kathiravan T <quic_kathirav@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=PaRqFShd c=1 sm=1 tr=0 ts=6ab0ccd0 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=G9kK3WARaQJXF0m7GhYA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDA4OSBTYWx0ZWRfXwEfxC2d9VdLS
 I8HqInIDNJXxNFdd1Bx/9ppHTuSps4AefCvCkNIfyskgxZJgKKa9bRbViFGf3b8HPP9XD1enU42
 I1Z/Q0WbcgMct2+uMeLmoQ/2UdyYgVc=
X-Proofpoint-GUID: ayNrXZLtcFEnsdEtA3zEq2zEl6RYBxns
X-Proofpoint-ORIG-GUID: ayNrXZLtcFEnsdEtA3zEq2zEl6RYBxns
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDA4OSBTYWx0ZWRfX9ddY7qWkxMtL
 BvSA368yDKZS1Cf1R+5m0BHIF9WIgyUlOcBqSD7PjY+B2QDPSuDiyIb59diP47oGOyAKT1OllKH
 BRItWZJdrmOFvpUIR4N5uYyLFRk3egVEfNRGxS4EHrzvi6pRRyg8NPleoL2wyP/Zup0xG+MZ1aY
 XXqy1YY0uyqVPFE+Xx7K9P7l1Itc7Cnd4sWAxQ1te9GkErBGkwmY5yYoUPgdewQcBg7dhokfUCH
 UWLJ46J9HStmPFfULGg9fiWojZ9piLY18JN2V0/ZK7dZfNQmNKVRiFyX4Jp4C8HBjeAF580eeyt
 g1+YnWCqkaRIJrHmD6QKhBUYgqiWmANOCAaY2QVf/8arVGKpCrZ5tuDBhpArxt/xna88CKakKIb
 rvf+UGhzc7iFaUavNRVSHZLyHe8QynjtsG8qgrvMfJldceyjAvkCL/u22Es1RJNPWi0jI7AiuzV
 rqS5YP8iF9LG/FxLvwQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 clxscore=1015 spamscore=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210089

Replace incorrect occurrences of "ipa" with "ipq".

Compile-tested only.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/clk/qcom/apss-ipq5424.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/apss-ipq5424.c b/drivers/clk/qcom/apss-ipq5424.c
index 1662c83058bc..abc933570cf2 100644
--- a/drivers/clk/qcom/apss-ipq5424.c
+++ b/drivers/clk/qcom/apss-ipq5424.c
@@ -206,14 +206,14 @@ static struct clk_regmap *apss_ipq5424_clks[] = {
 	[L3_CORE_CLK] = &l3_core_clk.clkr,
 };
 
-static struct clk_alpha_pll *ipa5424_apss_plls[] = {
+static struct clk_alpha_pll *ipq5424_apss_plls[] = {
 	&ipq5424_l3_pll,
 	&ipq5424_apss_pll,
 };
 
-static const struct qcom_cc_driver_data ipa5424_apss_driver_data = {
-	.alpha_plls = ipa5424_apss_plls,
-	.num_alpha_plls = ARRAY_SIZE(ipa5424_apss_plls),
+static const struct qcom_cc_driver_data ipq5424_apss_driver_data = {
+	.alpha_plls = ipq5424_apss_plls,
+	.num_alpha_plls = ARRAY_SIZE(ipq5424_apss_plls),
 };
 
 #define IPQ_APPS_PLL_ID			(5424 * 3)	/* some unique value */
@@ -229,7 +229,7 @@ static const struct qcom_cc_desc apss_ipq5424_desc = {
 	.icc_hws = icc_ipq5424_cpu_l3,
 	.num_icc_hws = ARRAY_SIZE(icc_ipq5424_cpu_l3),
 	.icc_first_node_id = IPQ_APPS_PLL_ID,
-	.driver_data = &ipa5424_apss_driver_data,
+	.driver_data = &ipq5424_apss_driver_data,
 };
 
 static int apss_ipq5424_probe(struct platform_device *pdev)

-- 
2.34.1

