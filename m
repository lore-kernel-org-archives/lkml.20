Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755B152120F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 18:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788547870; cv=none; b=GUyBPJkJmzT9tvtBxx1yFYGaynf/329yZZpHfNPoDciaW0Hc6DbLgaxR+r2Q5i2MAYcdi0D2u4zg3JoJ9hD3aVOScOzRnVCQaipGGjymLJaxzQd+vpcddaNsUUhSb1I+tJhRxLBQMseQGFFVl/eNKIw3J9WHnpuCdW015jWRYLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788547870; c=relaxed/simple;
	bh=aaiDp08wzVTG6QAhHolSezVwUSY3moqF09bwcCevu9Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XWHupNsHkbmOP76GkSVKZSSY+mjskEd0L/YEREUNrWgd0ZnhYfSYDEvNdRbP67IvZtsq+nnxcM38vXTepYRVXLQOOiAmlfZb549a/Hyebeg73feBpMOLtFtWI+nj1M1k+t35wRUkk5/VN6srjacbH1p6ULiu/9isfLCuDVSsNVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bGMSDfJG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fZa37lLF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bGMSDfJG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fZa37lLF"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684HHoXd1151888
	for <linux-kernel@vger.kernel.org>; Fri, 4 Sep 2026 18:51:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pptcmirIY/g7PI7VGtqSACzE2lVXKtQbfWk/d8jbwiA=; b=bGMSDfJGRl/waEDd
	VyDGTXmcSydQtDAbgI18fCKz+gg5FCE3SZRMPZRMyHRxgDuzG1myzyfzlPTj2hth
	hb9paaopP1b4FSjB/e2F9fVFMtZ+hvnQ7zUUbdvK2fzZVpR+7/et3QGHelZOhG5o
	m2gkApQtmvzrZZiTbWiThRXS2yZ0X/gmlXvdozyGLRiUG0DhCvLAJHULDMlsFhHq
	gy3jiXx1KIksJQ+GGiP+Ki5OSxiO7X7LGnwgmpb3mXIRO6871UZHaJstVHb0piqt
	uZvkNJ75wGN5MViBio8gtARVvnM0pQvaa22JEReORJ76Sl9bpfvme5nBp9woZwrS
	s0K1UA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg00ys6ky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 18:51:08 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-398dcfabbf8so2548727a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 11:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788547867; x=1789152667; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pptcmirIY/g7PI7VGtqSACzE2lVXKtQbfWk/d8jbwiA=;
        b=fZa37lLF91ZWeNL2H9QR6sUIwQbH8K+WZqRSjGavSzszCBm5ZxxeuvrEh5hPuOHpdm
         IMzpTgbMmeTouXa5DQ/6VIXYnW3/8AswB7TO+Cx8/1M2adqApPsqZk0CK7cDkxNl5C08
         DZFu+OGkp1Ll/CMF2aSq7x/yywTsGh1HMcqxNTlFat4kn13TRa3LkkhkZ2lk2qX5WJ37
         jEsjZBmny2Z4r3/RUuLin1iHsJ5sBi3K4yoBvOHG+W+z8QG84Qpc84h7JOgdm6lvPKx3
         ORTKRVbUyk2TTaDUyrfZ2Zog7LJAuY3HbdNLwnk2eiBJ5yDqYp3dzyARzM2nvYchArPk
         dXng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788547867; x=1789152667;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pptcmirIY/g7PI7VGtqSACzE2lVXKtQbfWk/d8jbwiA=;
        b=ISxLDIYRJAzm2S+f9bJTk2XQEGEY/Pb8IuBPlobSPgWkf8q3IhGiM2PPVIu1eY0GP1
         uckmmKt06mG3aLDvHufdU9xumr30V5KDpNmrmaXFJH/VzaE0Ba4ayP2dFOiMl+xSon3C
         jrCghb2knAqapL0zIagh4cs+8mz2DzZF+ZNopytyFjWicFNxhp7bO5YWcKhEh2B73wOw
         yLFtfW4j6pmi3fpX5qTWmOWEp2C9WRoKnJvjqzua3sMrsMpLzM7kdgOIM7x9wm1X+fuM
         f4Pqnz52yzUKwDQxxS82CgTNQyeqC+CRhioMFj+QoHQPoM8rueJIPMzSm4eskQTZ3Kca
         F3lw==
X-Forwarded-Encrypted: i=1; AKwUvBx/HzQIX3tDxvIXoUIj8gXKIC61I8GLbu7VJVA3Xev/17ff+25ye+OFTNfdf1h4yrUYrylXgg8DtwE3Wpo=@vger.kernel.org
X-Gm-Message-State: AFuF++nJimeoTN1M+/RMTyNWYtzZJ9+CPZvFcL31jp6FHCf22fAH1crk
	nLWckOktv/AFq2UPwjgdXk6fhKOGhI34mR6YjvzRVhjQ2JUD0kNk6AOucA2nOkkH+GpAG2mdPnK
	xV2opnMW/dYv/0o7Cai/GCyM5d3OD9rCYwbrpRrXd4XI1Md4Jx7V36tByeTWMKah0JOY=
X-Gm-Gg: AYBFou2hc7Ha7DsJ2UdNMi8sGeeP82e90rn+sl6akUni01syqGg0R2DQ1j3gctJRctM
	RXWAy7wv4fD/88QfMJOu2XWlLZi8F9wq9IWP3zuL0s9DW5TgXAkJB5HzivICH0q/3/YPkxLATgK
	lXUZWaI5zziSNCyx/+HHQqUqWheuwikHgI2tjdzez1MsDm4HdPfE0Roki4gXnd/1LG4F9K3EMD8
	Uol1EY0s39SNdYmtXp4taitUCFy7lH96mijSj1kecJcrOy7VzP4v7noFY+wX1Vg7L0H7PDtGl09
	OVXEUSCciDxKkuylrIu5qG/0WTP/uQXxzUlqVYWNZHaSCnNUk38Uv9x2nfkSmiQvkvIHaYAapHF
	FbalQ3RH8kosd19jKxf7dRVaOwU58yrs=
X-Received: by 2002:a17:90b:2e0e:b0:398:9be5:b419 with SMTP id 98e67ed59e1d1-39b2622bfecmr12140326a91.20.1788547867089;
        Fri, 04 Sep 2026 11:51:07 -0700 (PDT)
X-Received: by 2002:a17:90b:2e0e:b0:398:9be5:b419 with SMTP id 98e67ed59e1d1-39b2622bfecmr12140259a91.20.1788547866683;
        Fri, 04 Sep 2026 11:51:06 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b9f68e4sm8682644eec.24.2026.09.04.11.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 11:51:06 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Sat, 05 Sep 2026 00:20:43 +0530
Subject: [PATCH 2/4] clk: qcom: rpmhcc: Add LNBB clocks support for Glymur
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-glymur-ufs-clk-changes-v1-2-cdff2c67a8c2@oss.qualcomm.com>
References: <20260905-glymur-ufs-clk-changes-v1-0-cdff2c67a8c2@oss.qualcomm.com>
In-Reply-To: <20260905-glymur-ufs-clk-changes-v1-0-cdff2c67a8c2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=baFbluPB c=1 sm=1 tr=0 ts=6a9b131c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=XYjrdpVuIsIQvarJBHYA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: g8RIKn9Pemsx5gqE_3IA-hAKUT8rhSzi
X-Proofpoint-GUID: g8RIKn9Pemsx5gqE_3IA-hAKUT8rhSzi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE3MiBTYWx0ZWRfX+oqZkBhuGI8V
 PVLdPyOoz9Y3H40iMccKZSsTgGNz6xZ/tiTh51Er5AChhl0fcBmH+mZlGFsXezXJG7u91Z8bMMv
 NAsWQvICzBI1riR11mUCfymUn9y87cHL9qjlx3LXOMvDB29tPUz1XWUaJBGzqIgZ4yI4Gl0fljJ
 FpRVXDZ79DwqkEGCgN72GqWaBiH5ZpitMyVZlV3CBINR03zMqB9g5Fe0b6Uf4YlToIpGHMalq6S
 5uEEFCrNvBtrjWKS9c/nSO4GSFq71U1DbYH/iEVCphAJVKaC0fM8K3IoF3ZxNdQ7uYBpoI6uo+S
 wrCeYiIXprbqNS9uQET80uiZyhXkhDqcbXympNmk7fuZMvy6pN670pVx2+09HTvV8Jv24p0bYJ3
 9BdBxMJol8X6jBb5G/r/50D2DJ7BC+Hx8FJYGa7IVQrMgZHdPEJpnW9vmqWn0M7Ua22Oi5OHbQE
 gukm+wKpU0wP/XT8u/Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE3MiBTYWx0ZWRfX8RSbaThn8tSB
 UuB6HRxOinfNgHQxoPHSFqPXuTCfZLqO/Cp9xuf375WPeaqtqPCioRhaVGFmklIZb/v3tfwQH3T
 AhfzE8/p1Ikug8lsypSAK13i1/jOvv4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040172

Add support for rpmh LN_BB_CLK2 and LN_BB_CLK3 clocks on Qualcomm Glymur
platform.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rpmh.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index ec8700b6186d8d6dd1911b7a33f086805770284a..3db81c709729b547f288eb10d4aa5dcf63d9e951 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -393,6 +393,7 @@ DEFINE_CLK_RPMH_VRM(clk2, _a1_e0, "C2A_E0", 1);
 DEFINE_CLK_RPMH_VRM(clk3, _a1_e0, "C3A_E0", 1);
 DEFINE_CLK_RPMH_VRM(clk4, _a1_e0, "C4A_E0", 1);
 DEFINE_CLK_RPMH_VRM(clk5, _a1_e0, "C5A_E0", 1);
+DEFINE_CLK_RPMH_VRM(clk7, _a1_e0, "C7A_E0", 1);
 DEFINE_CLK_RPMH_VRM(clk8, _a1_e0, "C8A_E0", 1);
 
 DEFINE_CLK_RPMH_VRM(clk3, _a2_e0, "C3A_E0", 2);
@@ -902,6 +903,10 @@ static struct clk_hw *glymur_rpmh_clocks[] = {
 	[RPMH_RF_CLK4_A]	= &clk_rpmh_clk4_a1_e0_ao.hw,
 	[RPMH_RF_CLK5]		= &clk_rpmh_clk5_a1_e0.hw,
 	[RPMH_RF_CLK5_A]	= &clk_rpmh_clk5_a1_e0_ao.hw,
+	[RPMH_LN_BB_CLK2]	= &clk_rpmh_clk7_a1_e0.hw,
+	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_clk7_a1_e0_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &clk_rpmh_clk8_a1_e0.hw,
+	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_clk8_a1_e0_ao.hw,
 };
 
 static const struct clk_rpmh_desc clk_rpmh_glymur = {

-- 
2.34.1

