Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAF74D9540
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 09:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790847339; cv=none; b=kViluFK7pqo754bpDPSQGC3XLCEH5Abn1/H/GpIU/5g+eOsA0r++IHGSqvG8M3EJeRQEviteRUAngDRinfsqa0K+d/Efsrg4TcQAB5U+gkhxb9qUyYyLAfcZea/IdLqLZn8fQZS1BQdxwO+Ce20UfTSacGxXrRI06TxgwtwG/ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790847339; c=relaxed/simple;
	bh=uxYrQOYeJnqiMDJLxvTXyzLZKASXHOHpSAmKkbL6k/k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MTL26D/R1opGpmBlC74aLOwBwmBMWBYFhZdFnNHALbypF9jQ6jGcK4c9KzH+se5X0dFi9+RjzKmyvg12inzDd6SbHQbL95QKbhJwPr1mvupUFsjUzrd3uoBGAlAfIYBEXb5eFN/cizbFBB5n0kl7aCTUc4BhI+DvvcUgIVM1rIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PGf3xNt4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f/nUzUg8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PGf3xNt4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f/nUzUg8"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xnpJ396309
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 09:35:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ELdWrxhztmbj7ZPNYMtYOg17dOkRsO8KbkYbW/z+7ng=; b=PGf3xNt4fKnLs3yw
	nXbo1Y4R15/CwiZGOP3z4dU551bgWEXLWtU09vzyY3Qnkertck1rr0b2j1WbtPhD
	goREJ4nLiSS/Z+2DMKfF0U1bdn3QX6ylCMxSW3sVJP20Gt/7o4XBC1Xjhf3d2WST
	eluqYyWG+hP9ZFD8BSTF0t9LV0f9NktAATuXS5WzHMuNB9vwi8PTegDpyeqq+ouw
	yTFlflqenVI7nYgBiT3ccPoSbNmJeYipy5EZvDBlEFbTEeyMcqRy4feyxlek0Soo
	Ti8ybpdlK62xM4j+QjVahbb8jgH2Y13yqOLW3V9+MC86c9KMtW2+Rs0LYUgQAwLG
	f3G1Xw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1bh5a4kk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 09:35:35 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-ca8aee88725so3525040a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 02:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790847335; x=1791452135; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ELdWrxhztmbj7ZPNYMtYOg17dOkRsO8KbkYbW/z+7ng=;
        b=f/nUzUg8nigszVfP5eJC++EsxyASGMmU0QrKHRvX9mAi7zxhHk5v3AzqXsblVru1L6
         5FdTG2LSEpC7Ojx3mkBaR9GtfeCv95hRo55mf2bNewBZJ7swgSzzt8ENiatG5HcxWfWk
         qvrwQpNCPVWh+8InRZfvawRPsRYXJgfKwmNizbS5NiVR5Dif3XiTfOebGjUfnTS4Qnbr
         zV5MrxYIfIprAAFAGQeHKC6AvQ3v//aGt/wifXpmM193l/ZTTEtlKnpk2ObwRx6KkgUn
         fpQmAUsKGWdQ/2+YBmO4b/cwxoxj91poEE9H2YJwi1RIMwAUliVfDMxWZ+zQypYaIUvi
         ZVAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790847335; x=1791452135;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ELdWrxhztmbj7ZPNYMtYOg17dOkRsO8KbkYbW/z+7ng=;
        b=17Vk10hm2n39SQ+4VfhwReiT7tygZyA3rLlvoD2HSj0qLhoW5MHmhiBcoLGY7OL0Zx
         xG/eold4fwaFlhHYMHA7NP8fWrFBYDeQQwGfXH+N9XB5kMtJ5z/jssBH/8VbJRSn88ie
         IY6QuxmrKLBHX5uY+Blr7MNxnQRtyRrWKEvavaW6K/2w6YMc2ful9ztaUsHkX5DZRK6V
         969T3/z5vQ4YVnUZfzMalt16HnnNU76VymYVlQO83QJ62VlzwKNFL8qxlpBJ8B39nXm2
         dZFBlwT7g4pAHliK2hhigwIrV4zYjF9xHDQOJi8Z3cx3UeuaB4uW3mJHhD3Ff8242tPy
         Av4A==
X-Forwarded-Encrypted: i=1; AKwUvBw5rOf7epOUfE241Wypqi1LaMQO8EjYZQo6vGBRG4Yz+bap95QDc73kK90SwZ3C2gjgqZObQXnH2zSUQ1g=@vger.kernel.org
X-Gm-Message-State: AFuF++mFZVFAMnPONjzPXCcE4+ivilzZKOHXyK6cA62q5LXI7QZMxHRC
	fKviavx8FE5TMkZEy+x7qKdhLY504hlfznB86bk0NjBEvJT9GJBHalZSIuNdAt6pLZHkfbwn9/F
	SlWE4jw7EQugO6RZ9/m43rJnrBgN25HuOsXyuQFcjsu1CX/CZcN2GIyO3d9hcALerPdk=
X-Gm-Gg: AYBFou1ipUJ76vgZDJmdnmbDH4EMILOEeJCAJcGZELDOZxodE7YB+7WD/KhH/rHH80n
	P6mI66usfqTWeAvhdLt9aP9XM1s/iwYZO1O1HI6H6dwzcpatO4RAfFRE5NmzmBZd2r3X/2ArErt
	NoGkrbQZ6OASant88VJJFyGrv9cpvwBsj7EM2VukZkrqmVOwP29bXa2nUT/oi7nuVKLm58nDa6H
	GBRYe17OIeeRvKJK3Xl4OUA7xZcJeENuYRzmabDh3RvWG2mIBWSWwJJsd3thZ4Ahv1sLkS33T/Y
	KMIDbPH9CfEwD5PlhtVeOe75D+mruAWNBW2/frlcxcyeSZXvVjFEhcxM3NygB7iQCFMGxPQHvgN
	/tjjNOFq5zi/1ib01Av9K5aU2Nt0=
X-Received: by 2002:a05:6a21:7001:b0:3de:5d79:a64d with SMTP id adf61e73a8af0-3de9e7edbd0mr4185735637.82.1790847335173;
        Thu, 01 Oct 2026 02:35:35 -0700 (PDT)
X-Received: by 2002:a05:6a21:7001:b0:3de:5d79:a64d with SMTP id adf61e73a8af0-3de9e7edbd0mr4185698637.82.1790847334713;
        Thu, 01 Oct 2026 02:35:34 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7e54bf4c4sm1152944a12.29.2026.10.01.02.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 02:35:34 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 15:04:25 +0530
Subject: [PATCH v5 08/11] phy: qualcomm: qmp-combo: Remove VCO_DIV
 programming from qmp_v8_configure_dp_clocks()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-glymur-phy-v3-v5-8-3848c2615d5a@oss.qualcomm.com>
References: <20261001-glymur-phy-v3-v5-0-3848c2615d5a@oss.qualcomm.com>
In-Reply-To: <20261001-glymur-phy-v3-v5-0-3848c2615d5a@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790847286; l=1674;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=7nDdrAfLMVZ+R82NXO9KFSocsJHjCnRF/WR1qq2n7DI=;
 b=8fSBH7rbJg9UdtYHHBdxBa/fGnmx9OrGpik+PWXJ07EtE0KX974LNsEluIG388NVegnCuJywc
 kzgS+t0h/X3CXIVsZ5g4aqSdmzq+TqgnJtvnHOz4rOjkmg3Fsrz2wm5
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzOCBTYWx0ZWRfXw68M6QqU6W8i
 noJx/FvxIrN/5AsbfCU4nwrgDAQj+uEOcL0Cz+I54Zt1UCM31neKAr8jSJH/sweuWes+6g9Sv56
 t0rPhb9akqTGkWLTQpn0coGHxXf5XEeDftvYansMc/uYllWQ89AAv2wEyKZ95NyYYNrWQXn2hZk
 lSkPXZAY34L5O7XiES62MNVUwzVLShG/uxcYWqGUCPnNxT11eFVrR49sqoqn+HeXi1OJl1XhuHb
 Ak/tj0OCIB93dvwZFdp1AymlgKIX5rf1l6stqd9r6+kwRDaeMNO8GdZh/UWVdsc9LbvkXrH2ONq
 iPm7WpVvWoA2k8zIHR0PuqH9Uv7WfUIfDl/yBdcDzRWj/cDd5Kitexb9z/r98PIpSwXp5fQuhjX
 ufcDCPdUObCGWhecDVQJn2ZMOJuH0nWZPR4muHJqVnFmFYzIHAJb59JAdCJf0LsOfGIMpXsv/at
 dOu+zhK21dEmxVIfk9A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzOCBTYWx0ZWRfX4V9S2m4QcHoo
 iMAJl4X49qlAGPn/WpZfcDVwabVqGo6p0Oe0zngF5cW/6pld2cO+hxm79wnxrZ1uuKSVWMNSGKg
 UwVTAjh5Gj7x2xZn/wAQJUoDP9PApXk=
X-Proofpoint-ORIG-GUID: mPEMYDnnGsPvIo8IHWUOmwHQzVEAbyAL
X-Proofpoint-GUID: mPEMYDnnGsPvIo8IHWUOmwHQzVEAbyAL
X-Authority-Analysis: v=2.4 cv=NrJE4MdJ c=1 sm=1 tr=0 ts=6abe2967 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VniZYPIeq2n4UU9-3AgA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010038

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

QPHY_DP_PHY_VCO_DIV register does not participate in the
divider of vco_divided_clk, it can be left as it is- No impact

Fixes: d10736db98d25 ("phy: qualcomm: qmp-combo: Add DP offsets and settings for Glymur platforms")
Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index fc35da80e57f..6f5d32afae67 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -3897,32 +3897,26 @@ static void qmp_v4_configure_dp_tx(struct qmp_combo *qmp)
 static int qmp_v8_configure_dp_clocks(struct qmp_combo *qmp)
 {
 	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
-	u32 phy_vco_div;
 	unsigned long pixel_freq;
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 
 	switch (dp_opts->link_rate) {
 	case 1620:
-		phy_vco_div = 0x4;
 		pixel_freq = 1620000000UL / 2;
 		break;
 	case 2700:
-		phy_vco_div = 0x2;
 		pixel_freq = 2700000000UL / 2;
 		break;
 	case 5400:
-		phy_vco_div = 0x4;
 		pixel_freq = 5400000000UL / 4;
 		break;
 	case 8100:
-		phy_vco_div = 0x3;
 		pixel_freq = 8100000000UL / 6;
 		break;
 	default:
 		/* Other link rates aren't supported */
 		return -EINVAL;
 	}
-	writel(phy_vco_div, qmp->dp_dp_phy + cfg->regs[QPHY_DP_PHY_VCO_DIV]);
 
 	/* disable core reset tsync */
 	writel(0x09, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);

-- 
2.34.1

