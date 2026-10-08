Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCA93822A1
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 01:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791424269; cv=none; b=kWhXDRkmaR07N7uoSv+TUTtbS1po+x0sGH7uLDsM92P33Ed8arJMzgNRxPZu0Ac6xE3ewvEGSYTsWxUbnASJHcsdQJ18bY2FQe5zzFzJcnWMEmdVXWAGdZAK4ABNAXVbkVNrqQeptotjAy9lq7rsYDkxPDZX2DhriO3SgV5MYSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791424269; c=relaxed/simple;
	bh=HwlQ2Ae/9Q3MrPiMkpLKAOXBnuOZJb2psTbO3xR13eY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pYEb9bx/fXNxXZUHsne/xZef6dxqZIBTTQZokGHgH9RyV0SuBTMQwUh5WZlwDRwu4bFAN9Iqb7nK5ZUzTRMopS9APHOoEhH9GEm+RNuRlUMxeIvKV/FyJim84w/5mgMA8yG8rTrYkKRMhdEpXjUPUnZnlZbHZHEwyg/P+tK/nYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OB8xtZ7Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iikQP8hY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OB8xtZ7Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iikQP8hY"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6981hn0L608080
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 01:51:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1DBGEvXjym/
	vyozn2rSt9qSo/eR5/dW4BeP2EzqjvuA=; b=OB8xtZ7YejfTzMOJh+sDy1+BK/y
	W3KwDIkbGLcvHhrW9kg3FYcTqLip59ZG8ZMBVyIk3+P+VfVuWa86fkh99H4vAUx/
	DVL4tqalcVbthzve5yVeDX4lK4URGrSY+KCRNuVRujosLJghs5RxPzoUrUSICb8g
	SaHDjOEKWhy7TCCS2LnW2Mvgnzse1L9vSGf3NMrsrcHMjIH17fYF1aF5VSdZY0Jr
	MruqiQgq4A7rqbwksmJIxzK4/1c0kaRf7/tjr7DIhXvh3GK2iEnrSWjgx5h8dv8Y
	F1pbLOhJyJswgw9EGLCExAg99NIADZxh9bjf3TS3pj6/fQkuaElwpNNtrgg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2rm44-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 01:51:07 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30f1b904861so6198357eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 18:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791424267; x=1792029067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1DBGEvXjym/vyozn2rSt9qSo/eR5/dW4BeP2EzqjvuA=;
        b=iikQP8hYT5OG+gwrO8/wLL3YyLZ8OtXW3YnLd9jGDN2MRUrhR4tZO/97rFDP767dc3
         6Sf20ERVZeCS6kDCb0QxlnnWKZ5e8T5buFofYlYn7Cg09FQ9pY7xT7Psell1caWHO5jo
         5P5NAgl41X3GHvph9sIowKIOeKnSZUeZy47bGivzjnAwSSW+xDjNMNOUyRM+9vx8bzIx
         fHR8kOurvEXc08Jgdjp5eVP5oHLfdgqWhN60Twmh+QkfYmnOvEnmlk0+ZM+I/b0MRWmA
         44gi+0wIPrds2NCi0QB7l1/+JTCuANsLrWPMFs7W9arFcmE2BOpCSCiQVITJqBfg/iwI
         vK6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791424267; x=1792029067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1DBGEvXjym/vyozn2rSt9qSo/eR5/dW4BeP2EzqjvuA=;
        b=tryMogRhey2w+7cgAErWkQ02xflm/5B7PNspWVl1MsH/T2tUX6qcIZ85mJSGfzPTnl
         2eSPtlFegA9gYzw/ricNtjesOzbVIAS3J4xqXexP49cCbe62C08DHMLdBcsFnZ4+Xsro
         8F4aybYE3nECsqYAnuGCMV5I8FP8KYgDn3idS6cg6Ber5z6M6sDaDiqtU+NRQpfvZZEG
         ny0/+uAVTSwno3bdA3vCV4U69NseCT9WRN08ONjjsYghdwWalYsTg6IXkYHopVTeEV+M
         LbxLX25TOuGdNkI/JpTY2bF7/5M6e8ydhAbLgkMwDcOX/1GAB32ZcsmOspcW14FZpv29
         9vfw==
X-Forwarded-Encrypted: i=1; AKwUvBxwrxfi7Z3m+MQgOopSA1uMfWRP6PJSJTuvmsiObQkR/LLh+HIkJvKIPEM/P8X5HQ0Atkqbb1LD2V+smMQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKcszxuHxkJH7lP3/uTrUf0e/TKxT6Mns+ZLR30SRN/xbE8X1Cw
	0br+KgS0vGPPE7QQ0XW31DE1ZT+oivMHNEnTzbhO15IpGYo2o4pSccrdfYD0AmQ4pmHmoE/lP3/
	I/Q6Wzvo4vFa8qDcEVgVTAtgfaHRcIeDao9DtsbB1PSsOCeTW3JeXr9VnCSrpoSWqd48=
X-Gm-Gg: AYBFou2idbVzxTX6DAoh1Si9tpnkEWajdH57xj2rCHR+WYDXH//wSeWErUeBbSbfayc
	UjEjsRMxn7oc+qQx3dEx9AcoHucdhnMfc8FUZ4W1YjjTXzgphungXEklCVcA6BbHHtCqy1hCwir
	gdoZ95pE2Bem4JKM01yJCkR7OrKJwcVUXQZpB6CoPDgbiBI7VnfgrTPkhhQE8QAZMzLgPxWFwBm
	jZdQjN4qhlXhqlDPQY87XlvP3H6hgLDV8FFLioo7ztfJYmJeLRoTT7yNuwHrkaUXR1AwAzrlTl2
	FSiVVUECZ3Ey1mzjD0zpS9H17cw9O2BPSNubMgHoPBhNdDw7V+SQp0bF/T48Vq6mR4b8VRE3i+1
	yWSzWMpGiRM2fPV09WtfhFepkn7baUiuWL5L/nNgCRL/1yTYkIY3Fn1UkdT0=
X-Received: by 2002:a05:693c:894b:10b0:351:3115:c733 with SMTP id 5a478bee46e88-3515ddaa3abmr4700855eec.22.1791424266644;
        Wed, 07 Oct 2026 18:51:06 -0700 (PDT)
X-Received: by 2002:a05:693c:894b:10b0:351:3115:c733 with SMTP id 5a478bee46e88-3515ddaa3abmr4700816eec.22.1791424265898;
        Wed, 07 Oct 2026 18:51:05 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515abb7117sm11761823eec.3.2026.10.07.18.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 18:51:05 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 3/3] phy: phy-snps-eusb2: Enable AHB2PHY bus clock on Nord
Date: Thu,  8 Oct 2026 09:50:17 +0800
Message-ID: <20261008015017.3359804-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008015017.3359804-1-shengchao.guo@oss.qualcomm.com>
References: <20261008015017.3359804-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAwNyBTYWx0ZWRfX3oiwgQJ7lgWe
 u005CODIi7zYwq3mht+QlhvSqb93/KANFpylGj2vgLPGUyEYV8kEG3lGk/B1auDId+UmH9lz8KO
 Yyt2QwnZoXCUP7iTsKk7IF/aDI8rSiE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAwNyBTYWx0ZWRfX3VTtLCneEUD2
 iUamsqDw2ZtTHHnBclKqosUV3kXE/aMnNG5S/tlts7z+z8LvvOQeySAYV1ufrTy+H6+THkjzdAF
 Y4rO6p2C/T+G1wEiyGB1uyALv5mYLltw2vq6BQHdJGw7Lc7zFRx0dobKpGhb2GAkJI6K2wz+Jqu
 2AEVfHrqggqtPJ5WWcdtBysrrXeAMyVWL8ugKvM/rZWuIphmeI2PE9geoZv3z0RPcmYvdrQRLLR
 CqsCtbM2kqggDaYBVg3O5pnCk8NXfxunNI0YCEQIZtWMYrWYyYYR7KeV3FY0X7nuQPV+w6Xzu7V
 FDvpSUydSEzP28ynByK588MsOD1AgQU+rXt5lNxrlH3B50x6KcCkGdvxkXYVwoc8cWzTHl0oqvE
 23oK2x/SIjbFj+eBXjy0crMnpQ6RVNcPqjsi1YKOFsxy/VJXbrvUkl/2gR5JWvF77FyTcD2JyEp
 tZRQA+AjqvTAwDNiYcQ==
X-Proofpoint-ORIG-GUID: RHZi42yezXvBedtXtKfZj9wpboOhm0yF
X-Proofpoint-GUID: RHZi42yezXvBedtXtKfZj9wpboOhm0yF
X-Authority-Analysis: v=2.4 cv=CIm/zhrD c=1 sm=1 tr=0 ts=6ac6f70b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=-9G34wqzeZZRMG-dpk0A:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_01,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080007

On Nord, the eUSB2 PHY registers sit behind the AHB2PHY_0 bridge, gated
by NE_GCC_AHB2PHY_CLK. The Nord PHY currently matches the sm8550
fallback, which only requests the "ref" clock, so the bridge clock is
never enabled by the PHY. When nothing else holds it, e.g. on boards
where only the USB20-only controller is in use, clk_disable_unused()
gates the bridge and PHY init accesses go nowhere:

  xhci-hcd xhci-hcd.2.auto: can't setup: -110

Add Nord-specific match data that requests both "ref" and "bus" clocks,
reusing the existing Qualcomm init sequence. The bus clock is enabled
and disabled together with the ref clock in phy init/exit.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/phy/phy-snps-eusb2.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
index af4fa17ac6cb..8429599f428b 100644
--- a/drivers/phy/phy-snps-eusb2.c
+++ b/drivers/phy/phy-snps-eusb2.c
@@ -452,6 +452,16 @@ static const struct snps_eusb2_phy_drvdata sm8550_snps_eusb2_phy = {
 	.num_clks       = ARRAY_SIZE(qcom_eusb2_hsphy_clock_names),
 };
 
+static const char * const nord_eusb2_hsphy_clock_names[] = {
+	"ref", "bus",
+};
+
+static const struct snps_eusb2_phy_drvdata nord_snps_eusb2_phy = {
+	.phy_init	= qcom_snps_eusb2_hsphy_init,
+	.clk_names	= nord_eusb2_hsphy_clock_names,
+	.num_clks	= ARRAY_SIZE(nord_eusb2_hsphy_clock_names),
+};
+
 static int snps_eusb2_hsphy_init(struct phy *p)
 {
 	struct snps_eusb2_hsphy *phy = phy_get_drvdata(p);
@@ -608,6 +618,9 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
 
 static const struct of_device_id snps_eusb2_hsphy_of_match_table[] = {
 	{
+		.compatible = "qcom,nord-snps-eusb2-phy",
+		.data = &nord_snps_eusb2_phy,
+	}, {
 		.compatible = "qcom,sm8550-snps-eusb2-phy",
 		.data = &sm8550_snps_eusb2_phy,
 	}, {
-- 
2.43.0

