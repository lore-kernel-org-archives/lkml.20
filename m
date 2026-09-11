Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C436477E2D
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141147; cv=none; b=JaSfZ482mUXr4sOzK0NF3fedIew4s1c/Pf5FHv4e1eNMTclFzJ5pTRx/sULts2FdpWJ3xy1RX7jLhGrFdOrcxWEH6xrAxrucG836HjCLkW2NBBXzjTBG81x0bg392zmfH1glezQ4+BB+odBC6/fHz8XiSwbi2TvWxU0bg3SUUjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141147; c=relaxed/simple;
	bh=VIDvYmpBYjxc5zZ8k83mGf8RxzGtGsb7NxMu+ao14lM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LgCuuu6of+QipVHpawjZch1EBZc5ybxlQyO0HVbHQoQlAv8T3aDn2ZXe37bIK0v8IdBhvjMW96QzWTmGnK3oG9s/saXjDo4xa5s9tG6me6TVZZozZmqtaH8+Ij3Y9CnqdIjzT/8uy+XXX02ZDFJ+NxkP5GOQ/nD9QuW++yA19fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l9RMnlMi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iLcZ9aga; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l9RMnlMi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iLcZ9aga"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEm2Wj442908
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:38:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tKaBjoBGU4g+MPA/QMDjAFsVj4rZ70kS5n2KtwM4AkE=; b=l9RMnlMiGOkxW+pa
	4Ss2zASx45Ad2B0m4MI1wJgI6cx4LhDELtFRKnDAvF8xgAHTLtdZ8LM0iwXy9Hur
	2QkAiWqqfs4ppobzZ2pjg5SNRQy6ijn06uaipg9m22bi3yZ8UkAvM0p4lbSanym9
	wAlHdpokJ7ffsjUx2iMuqac9USBA7fq8Ca0stkNE3dIrlR+5Foehw2ypdhzjaLTl
	ft5VMmJkqGxyO25MzFoC22yW0nqc18oaqDMkghNjkI2Znyi090yREDVo25kLsD/T
	T2feXCdUC98mRqE6av9RooZx6PYC/ScCreKWyvRPz3FY8B4wnOvyE+wmm9ixiLf6
	95a0PQ==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmapg2nwx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:38:59 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b26d8d2498so1342752b6e.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789141139; x=1789745939; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tKaBjoBGU4g+MPA/QMDjAFsVj4rZ70kS5n2KtwM4AkE=;
        b=iLcZ9agaMcyux3B3a2nI7eRS4mmk+7F+HyIyojONvQN/7buzpoHy0t90eY0JXkfJOW
         7fUyfVwAkScqwMHE6pYymcEjNNutZpw1eqLIXf4HmEKTrDVbC4vW1nUd1XckRqGZaGkQ
         RBbpo2IPVFIPAKJj1xoCZ89/6TygoujJ6UvhROqAE1e3WnWy3p7qG0pacaeoJbjnfaF5
         8RxS3d5ZQytcoVWX7Kj1PeWsRss0wxRzqZj86yhUELqjU8O1E82pDv+Jn054J8mQQPCj
         h5vhRLW9xHj5RNQYZebu+T96v3cRDTibUuqeo9mrz+y/tP5jLTetBPkgdx7rjq9zc5N3
         ZKuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141139; x=1789745939;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tKaBjoBGU4g+MPA/QMDjAFsVj4rZ70kS5n2KtwM4AkE=;
        b=LKR1Xo1JTmTV74C1zacL0JGoc/l8Ir+h52cNb58jBXxN2Y+M2nG/I/H2vxN0s8ppMB
         +LuvokXtpT3VN1YBf1giyw8BlZY6vL5I5aFjlxD9K9HEup0NTN0cBrtkB2OJVnfciriF
         I3HcG8XGe+SnDxU+Ctdw4ZUUtO8V68126CVau9FN0Xdl2oDKjJA6hL9Mm4I9BqFyrzbm
         GAgBUB66XCB9G/lVVuNT31S+Y3IsOYkwvgsnaxOXe1E/O2eWpMhalMS90OnJcBY9xSB0
         7z39CUslnixA0n1Shhh+8R2ntAxcHdGZGkR8TfufwecJCl/IeV5hdA7SeOZhOvnVepj4
         r1xQ==
X-Forwarded-Encrypted: i=1; AKwUvBziVYPRxsV2dju0POYzMDs372Rtc42JjYtfgyWBXAz8UOdaIXZrrVmayNKCp1hwahac8xIlC6/VGHBZ+mg=@vger.kernel.org
X-Gm-Message-State: AFuF++np4wOVrHjoa8mFGN759TpmuDXb4jsHIfIUyV/sFazI16mKHukI
	CBWCG+LgnIz2mGVwYiSS+qidA/uC7bKaNQySlXPztNKlD9C699zGvfJh5hIGJxicGdYP+lcgmrr
	rxFJRnZAqZRObewwFWISECxkJB/2dCTQ3VZYYONFOgflRo/Fy5YaLYAZJFMc5nmDLfQTmNI0JUN
	Y=
X-Gm-Gg: AYBFou2sxvnA/PtcUJeBs/ueHxMawUCW9enWDNQCOqC+fN6afRRK3+Af2OhkaE0vMgk
	ld4H2ZdaXcTM2rNvS7Xgp2gHJj/PcqHzTDgGRlzE9b1W4cpxJd67HNVPRyOpG/edqTikgCOTpvW
	m10pxiLO1UBiasWPn5dMkmTQpHFiz9GmzqjA38owigz28agDoQQ86WvarZ5UmwtC/zEMjDVuq2D
	MGG0pEMzyo3m/7+wJnhU2fFprpNLCFzmjNTZwNK/uxTaHgx3Zq91dQrw3G5acQsmEr2c9sJT0Mz
	uDHiIeqHaeCCnXx1hp649wv8gqIysONwPdGsvjJBDRvMF4qrIwlSsRvIzczILdVa4Z08bc8ALxF
	o4n8l87fK7TEIFthaZhzJvQn+zuc=
X-Received: by 2002:a05:6808:4f60:b0:4b9:e5fa:890b with SMTP id 5614622812f47-4c31b9f16eemr4174505b6e.30.1789141138643;
        Fri, 11 Sep 2026 08:38:58 -0700 (PDT)
X-Received: by 2002:a05:6808:4f60:b0:4b9:e5fa:890b with SMTP id 5614622812f47-4c31b9f16eemr4174468b6e.30.1789141138155;
        Fri, 11 Sep 2026 08:38:58 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df90ff148sm1882160fac.14.2026.09.11.08.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:38:55 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 21:06:43 +0530
Subject: [PATCH 12/17] phy: qcom: edp: Add Nord bias and clock buffer
 enable callback
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-nord-drv-dt-v1-12-e25c073cf1b6@oss.qualcomm.com>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
In-Reply-To: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789141012; l=1163;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=TJ+MFSHUURH7gOS+pdGimYtOjH3VbFvgcOMzvr6FrkY=;
 b=H1xeQ4VQYRjCAdIOLL7ZZUQ8aeKbS2ViYdolASdA7VKj8S9mICvGiaBIYo7Fsv/BUIAOeWESp
 e8cjF4dHeaOChbU8dcgjgs3RnwXdzjlRc66uRQZhPDgmgXF+iNiD/rq
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-ORIG-GUID: a-oPyhWi7CTIdmOZ8hVI_qzG47-1LXDw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfX7BiuWh7z3dG6
 7EipEcftwPus9FiAZ28UI5Gg8W8Jg8Hkon4HzyN3OpJS5Seu7tVhmX/tfL7sqPOTBKci+F5MPxB
 shyfzL+h4pUOnIJkokxuh6o55wR8X7A=
X-Proofpoint-GUID: a-oPyhWi7CTIdmOZ8hVI_qzG47-1LXDw
X-Authority-Analysis: v=2.4 cv=DLoacCNb c=1 sm=1 tr=0 ts=6aa42093 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=UH4Y3tt_PtaHL7u5GSsA:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfX8CF9MJB3BmvU
 T19zrx2uqEiZiNs68ua35ojD3iyjFE53AetrKy3LGH2AtdNi5nxL3RGoXWWvET6Gu0B/Mrzvpj8
 +zj3TiGz0RjKhb3sDylOGW+FqTR9AdQRlw8i4kVbJYinIL3OEfC9pbfsoW/6BGPDEORLCeOMwN4
 pEC25AhVQ0tgvfgjrFrCATQuf4qG1BgyWrorZeUX/sU+ZRqcSCJXnTprsSeKc6BSyqBx/K24vzL
 mi+ZX9j1A5dRoH1y77plxUkGpvCDzYTL/R+Pg69FgrIGL8MFkzI4FE18F4F9qJvFhgw2j19R9lc
 Yiuw7wq6MNIwo1vpQBRM4ulUpCZ2IXkKihT0ES8wkPP8xEjWkphwbasgUpKiwMJ0CmM1pynyofr
 xdyv8L3X7arsWYkkefEYHxuOerCf1UHGcjvNojkk0k9f64wuIZ/Xo8i8VzFxdvn0rFSsPbgIc+s
 4D9Zrc2uRSzHzAsGP7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110218

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Nord requires BIAS_EN_CLKBUFLR_EN to be set to 0x1f to enable the
internal bias generator and clock buffer, which differs from the value
used on existing SoCs.  Add qcom_edp_com_bias_en_clkbuflr_nord() per
HPG Table 2-1-d.

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-edp.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index 6cac4b55b66f..ec4220cffe69 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -1637,6 +1637,14 @@ static int qcom_edp_phy_com_resetsm_cntrl_nord(const struct qcom_edp *edp)
 }
 
 
+static int qcom_edp_com_bias_en_clkbuflr_nord(const struct qcom_edp *edp)
+{
+	writel(0x1f, edp->pll + DP_QSERDES_V8_COM_BIAS_EN_CLKBUFLR_EN);
+
+	return 0;
+}
+
+
 static const struct of_device_id qcom_edp_phy_match_table[] = {
 	{ .compatible = "qcom,glymur-dp-phy", .data = &glymur_phy_cfg, },
 	{ .compatible = "qcom,sa8775p-edp-phy", .data = &sa8775p_dp_phy_cfg, },

-- 
2.34.1

