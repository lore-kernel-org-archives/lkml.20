Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793609476;
	b=evj7UKMI7gbLJcckSAlHIJuR5jN5Txte/33MwUfbt09roSmeRTE0WwxFetWaUI5tcZY0
	 K0cml4GOZgyRbuBkjfYbGonDWHgxpXJt61mJoOaYZPDcqQaoYJgFbx8b20q6QSSeCvO0l
	 Uw8ep3Le0+xfRWxA36tBK0fMzRTelrCpEbk80ZmQdwoUHJoipn3Jo5YyNbMslBTA+jfKg
	 tWshQnvl4ZpNlL+JV3hQbziScf1Bf0i9sdnCHko97y4nLFAADlfr/gAt+fa1v8jxpuYaD
	 O4cX9CPc1vHXQ6F8h2kc1sEyelJ+ycaZsBgjydbDQMrFo08sIaS3Vw6iwMIbvqkpkpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793609476;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dsKsMW0C6bchg345GQg0IfKku8bRtK0xn8bcBWXbV7w=;
	b=W32Ph5NvWXCGXvl7MaZtYh2lfhfgfT0QMoiZ66bX8rfxJRkprdHFap/qWln43rI9u2+1
	 kh8WukeOoSzqIly/9Bk+kqG1keEFFl0q5NK71mW4OZJ86B/nCbxjBLCYQPNf2sZTR65Yp
	 yAJeyvOJNfUf5d/vGBqkjl6Aajh1WpulCWhfe7J3z05nB1v4XcYXkHDDhNs1hqEIjf40K
	 4MqsgcNFuv/EARfkhnKsZkjhyzG/fTlp7C7tJsfaV3gpF2QXy2S+d6eaiUM+qBKfjLe3T
	 DCLFEWsgMJQLogpBLZUOiVLSwiQbThzmYOiOOLhEtbDrZ23JbgKpgpPtapp12OQJU0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VNhLNm37;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pb9PUmko;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D310460A2606
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 08:51:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D310460A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VNhLNm37;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pb9PUmko
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23vFsx2753354
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 08:51:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dsKsMW0C6bchg345GQg0IfKku8bRtK0xn8bcBWXbV7w=; b=VNhLNm37fnrvyNIT
	/IqFk026HbODb+2ybfhnOheH4oo3SHwGHxEDO9q8rojslBEbMFXxsR2kYX8OJJhd
	h+WLny1U6duobn2E3SGZf9acqTGwXPwj8R0vSD1nwfLhxYK0zUZorL8gOR6LcAvm
	pjQwEOdyDjUuiBM76QZL3cnb26voJy49lSH//EXUkRr5bVE1XZZ++6DCR/Iysx4a
	1dEnjaX1EyxosCe+IjXraVH5vC4cXyCLKMuuQlkhLAM+hTNE6SZwvst/Tto80+AF
	/8ZueCaw1xtzTiYHvnMzst6kOwk79dapvm+9NkTmDjTf/QA1EqUhf53JR/nVIT5U
	551xhw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpg201g0n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 08:51:14 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a01e2962a1so2341731b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 00:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793609474; x=1794214274; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dsKsMW0C6bchg345GQg0IfKku8bRtK0xn8bcBWXbV7w=;
        b=Pb9PUmko0nQIwMUcdqwMy1WyThNMBivIaO2Rgz8NJ/FKIeIf4t/WwIdtvO4OoJG6ua
         3yc5zUgogW7vitW0fq38JomaVpY3eoVG6YvYgEgCFiy05IxBXNolCORuiTvEIffagT5Y
         AuIsvjJcQcro9hkQsR6rPafd4xMP0ZRKfYLZPjYmAWNvQsMNgd96BQpPeMdcIJRMzTct
         W1h+CF+i/+i0pJyU2uohTg7INRlk5eiGd+GLbNa5d1HrwpVrTS/uO78bV7gtqp0lzNkT
         oFQbZtTzJJZCLqz1BfajUkopQVBzZyLiDYqLl0XLtSQTYDeXHNIF0UgPNigFSAAujezm
         roBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793609474; x=1794214274;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dsKsMW0C6bchg345GQg0IfKku8bRtK0xn8bcBWXbV7w=;
        b=wfiOjWUZxZrB7Bmeg6d5HqYi8IaTquE8ym0Yz5EgO76M3PoxQEbhEY5PIE5VhPuEgc
         sL8vt5cSsVmmNHiLZsuTLMX/XhWzVoQPsAxeEbU8F16lFqYjJnlBW8itl+edLPFw6Mle
         FUKVUWyn04v1PM1nP4SYdzJR7dxOwQekRVmtdA06lmk+AeR3PZIeyHzdPzb3n5cnAkvk
         nPM0I3kKwoVpO6wnBx1hBeapFAxJHHSuFPSmNaW3xtYa+DOkeXqN1zear7NWIemDwnPV
         mcW4Qg2D1Ax2/NqKmRkolQGdV/ePP2QsV6QDQiUrs2rCRk+Bgk/COZfkpOPRRAzUmC0A
         PdzQ==
X-Forwarded-Encrypted: i=1; AKwUvByWynb70pU7+9QcGdcGlE/yrIqlmleXCIlMXWrBFDrjMNh4Swo/mcYNSLzHme3QxFJgL0rKG5bN5uIRrOw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LKdg8PNFz1f4TgW5PM71r7pPcRlOXSCwUtuzyp59RwDS6tkIK
	NJwc7vPTQIM8iPqD/GQ8H1gKPIW3Cd/V3cAsPWSJd/LmJtH1ZsZRpfu3nAFG57lR4ehOWNFjnb4
	qIkjVrzSFTDlqFP1ZjqToFTBWorNAyaClH673o1BQDnow0ozPy3za/CF9RszhbbpEVIY=
X-Gm-Gg: AYBFou3kvgpgSxecYOEIbw0FcNtRZtd9dK8wWecE402tNthhrcKKWhNFlxCR6VlCGox
	sJhP8xaBRnjobJkHoZv7yl+zep8rslBke8/1uvIldID2p2auPiRGcaK9xuVGtzbjUciPL4TKDvo
	VdsggqXF76LVeQS7hS+c+3ID9VEAfW5MR5vydphMmzSK2tkz4AVt7Bjey8+/HBQr/QhfOlH7iSF
	o01KVbcW/KRuhp+MXxBd0a1s96FmMmnOOiH13GJ5fNF+WNhxw6AKyEXVDlhXOTh/NlfIPKZ1Q9x
	Ll3akZcZzu54vN+zzLqmQMUDKJDmRIfNjwALed/vb5Il7o5Iwjo0mjnIb99IUb3no3mhbPCGkXl
	HrFfPOPZ/GnGHO4p4q0HShOk2crm4NnHWEJFtI+lyY885O8qsraro1Xu/ynmOMWP8i3VvcXNXmP
	02LaE=
X-Received: by 2002:a05:6a00:418c:b0:899:3439:c8d5 with SMTP id d2e1a72fcca58-8a9bdeb95c9mr7833182b3a.14.1793609473792;
        Mon, 02 Nov 2026 00:51:13 -0800 (PST)
X-Received: by 2002:a05:6a00:418c:b0:899:3439:c8d5 with SMTP id d2e1a72fcca58-8a9bdeb95c9mr7833161b3a.14.1793609473334;
        Mon, 02 Nov 2026 00:51:13 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad963cfccsm1748329b3a.9.2026.11.02.00.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 00:51:13 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 14:20:58 +0530
Subject: [PATCH 2/2] media: qcom: camss: Add Glymur specific resources
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
Message-Id: <20261102-glymur_camss-v1-2-fcb619fc7319@oss.qualcomm.com>
References: <20261102-glymur_camss-v1-0-fcb619fc7319@oss.qualcomm.com>
In-Reply-To: <20261102-glymur_camss-v1-0-fcb619fc7319@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793609458; l=2389;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=gx4iBMo3xMucCz5yKVhvNdxdYc+wJNDGJub02KdWYCc=;
 b=975Yh010KlKYMET6jPeNA9yjFlHt1wfvVknX/qBwLZHAAMnv8BEJNIrm1kkPkMz0pEJ55snwC
 VwA23XXsN5JBXypYh6zylL5w2DhvE4irMRIFqXNI/HbstJ11K2Ir66O
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: FqNpIwdUCvEu1UDZLxixitx5baAl6tFm
X-Authority-Analysis: v=2.4 cv=fZY4WEQF c=1 sm=1 tr=0 ts=6ae84f02 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=gsiCYcxyybwn9cVciPUA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: FqNpIwdUCvEu1UDZLxixitx5baAl6tFm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNSBTYWx0ZWRfXz3qlohKg9KeQ
 td/IvR3i4b0Y6npGD3LHjMSmqPfMBydCHk6XSXGmHU1+QgtMM4YyCoxhJjJtMzj/VaHgOW3jsox
 nkh5XrJ/ZTc8b84603p7hJFdrr5oHA/uUqkeTeGd/uT0HSNs9jwnSn1AamWsSGWZ0ehFnmkyPwT
 ahYvgOPTfW8ag2fK6jgDOOSZjtJVkIRwJ/YRoJAPV6vkIQf1jA6njhZmVwEewPtsGZvXOBzo0ev
 vr8rLKj91VEPjeqb9EAKiGIQCuRRK+0gXcUsvZU5i1RhQsorE9XPY/BBx73qkGiqHxQgF2/UmNh
 KPS2WLJ012EOuPnzl8hcvOBowvA9nZoIwBeE5sigaa2BKjKHOAvvfNgpRcDIET+gy5lnDkWKVh2
 jVcbyjtg+fP4IKcF9czvHpYv1FyDl6HnqLRpJhRoeFrMgcdOA7piXfMzxUxXzAZ9NbZH4FcKtcj
 UD3skfPvSgafDuPvE/g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNSBTYWx0ZWRfXznIBNiiPws9n
 42xIttccXnf+6mKg8HTfRVObBqXMiiwokFnrzAe1MwXDM70TT68iZ228z0vCuEop5Zw9tt1+FAy
 f0K4UBqTGW89v4/wWaF/JzuIdSQQbfQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020035

Glymur uses the X1E80100 CAMSS resources, but its CSI2 PHYs are
described as standalone PHY nodes. Reusing the X1E80100 resources also
reuses csiphy_res[], where port@3 maps to CSIPHY id 4.

Add Glymur resource data without reusing the X1E80100 CSIPHY resource
table, so the standalone PHY path uses the graph port number as the
CSIPHY id.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 1db66976e51b81edeb223cebb6bbe84995d102c2..4f705a056eedbc7b09d2630ee6284b8d768cc6d5 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5800,6 +5800,21 @@ static void camss_remove(struct platform_device *pdev)
 	camss_genpd_cleanup(camss);
 }
 
+static const struct camss_resources glymur_resources = {
+	.version = CAMSS_X1E80100,
+	.pd_name = "top",
+	.tpg_res = tpg_res_x1e80100,
+	.csid_res = csid_res_x1e80100,
+	.vfe_res = vfe_res_x1e80100,
+	.csid_wrapper_res = &csid_wrapper_res_x1e80100,
+	.icc_res = icc_res_x1e80100,
+	.icc_path_num = ARRAY_SIZE(icc_res_x1e80100),
+	.csiphy_num = 5,
+	.tpg_num = ARRAY_SIZE(tpg_res_x1e80100),
+	.csid_num = ARRAY_SIZE(csid_res_x1e80100),
+	.vfe_num = ARRAY_SIZE(vfe_res_x1e80100),
+};
+
 static const struct camss_resources msm8916_resources = {
 	.version = CAMSS_8x16,
 	.csiphy_res = csiphy_res_8x16,
@@ -6049,6 +6064,7 @@ static const struct camss_resources x1e80100_resources = {
 };
 
 static const struct of_device_id camss_dt_match[] = {
+	{ .compatible = "qcom,glymur-camss", .data = &glymur_resources },
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8939-camss", .data = &msm8939_resources },
 	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
@@ -6068,7 +6084,6 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
 	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
 	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
-	{ .compatible = "qcom,glymur-camss", .data = &x1e80100_resources },
 	{ }
 };
 

-- 
2.34.1

