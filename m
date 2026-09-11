Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E608044780F
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141135; cv=none; b=YaJOxN4FIjNbkg+tafmQlCYl3W6jKiWYkBluB42uuxp0oO7lbjlNFC51ZZtQJqCJNR2cYAQjzvbUhoXdMXzSlGrnEdyQh4OsI2n5xaw6R/JjusX3O2uJsDYNieLbvUgJaS2nY/5A3aXjIL1cuPzzicLJfbEdVczdz11vreHms20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141135; c=relaxed/simple;
	bh=CrKvfbaILEML0/XxKBQWTQNqscCnfIE0NSr6QPB6VwI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IJ46OYr0OZ+NEHTrJU8G3WXMpUt+qR4e6dkF911VwYsfvXfAz1BQkCMGHeAboTu1ttFxp9+r5x/I2UbwC3S2IxND/YJFgV1MghX6V9yKv0LdkrWFljVL1/5Vr74cbpMnyjLcFigfrXz1N3zrM9DVHjUbcgLsek3+zzDZvefCYAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cAwVgFbr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Basjw3VA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cAwVgFbr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Basjw3VA"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEmEIx3780630
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:38:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5NxuIBW575W0eOajYRS3D3fuU11r9CtXlXrtxeBTWyI=; b=cAwVgFbrxyx1ddw1
	WrNGrpTh836+8VxMQDkvHRfWVkIIOrYKxX/cICdOiwy8lC67CrYUJH3tA3aOgCC1
	UDu6atn1GvanNEYh/IquKYfs7qFBL75gfsaa8+GbJgzbpTSMZdKKRZ4Uk7Fr8rk1
	MuEKiTBHTG2ixukBphSsSHMsBC72UMYc5IxWTfD4F6jNYQgWgqnTcUYxkRfMrDax
	FLqXPlQJ7TSmRb+2KVp9DV8JMB9hrABGk3oY0GQtZIDmzvJGTCzAuQZctE19nIrw
	GTzoBOG+9mzBgs5UhiFja5YHpphJMxUF/yrvZYK0bzg6R+J2EP1gfvBAxK6Xksqo
	m6wGMQ==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmcgfj7u9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:38:47 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-464fb819ac5so999549fac.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789141127; x=1789745927; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5NxuIBW575W0eOajYRS3D3fuU11r9CtXlXrtxeBTWyI=;
        b=Basjw3VAwsLVTuIst08U7SZ8bRhlFFFztMiEKxFtXX6AFLRF/zqHTmk//xxDzYaGrz
         Y7SdwsN6YfXei4kwZZ1tIRcvGz81Oo0z/e3Me8fLEOlWrFJ5ftBqYtARNupJWKWnw3r2
         nPZmlF3gk4I0RIFDasNPvTT2KvCpMRv4f5yf6iA65xvteu+rDLOUF44j45uXHExGX8E7
         ZxeRQoX1/o6bS3slD0bmzDIvOFxeSYzA9bob4hFOrb7lG9ulBkN9hD6qNynSuFfpY42l
         93lhaK1qZn6xWm2LWdyMsXlzEH38NNY1V4ND+hgPLLIzTz/OFQn3WiYJv7p3pe+0c3QC
         AggA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141127; x=1789745927;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5NxuIBW575W0eOajYRS3D3fuU11r9CtXlXrtxeBTWyI=;
        b=adGWYOb0flVE727wPuQaybRA7qX3GaVXDvgyNTAxayVnwqFiB8Dz8n5QqiFtl/b9oX
         0+K+CF8u9iGP+FqbD4ggw1b6ffHEIg54M1b6O2OamJv7Bbi6BSvC+b4kRNV8q/s2cfag
         ZzyfQqlstSCjQLFAQH5/t20yFJjxE/RAkXGJbgCzLZqW9lOP+ld6nP00AYStBJ1+Wbwz
         Q29svetQLnOkZv3GZrLHIF8DZLCSNZISYpADMTg/lYq8lnqBZ1A+q5WjbMMiffAdrRhK
         sqKsy5BG+95mJHZgye9Lt9g+94SMWuO/XMRRcwhHA8Mhm3ojHktaVdvBn8ek6GWaJxST
         xiQw==
X-Forwarded-Encrypted: i=1; AKwUvBxodPJnl9u+mnN2TTQZ5pbDzLPyEcxWeKDF82ElssgO8l6pODcMrQHpsocc+Jv0YAbLE7W26q5JhF+VIpo=@vger.kernel.org
X-Gm-Message-State: AFuF++msQA3EQn951ZkGVSd4fDvSxTBqyntoxXYGVLJTm4XnERK7HHDe
	4YMXWpEogGBYjqclRNlLxWv4mmQOlXOZY56gpPA9qu48xBx9Zc99uQHYArGbavLB8Zze/dL7Wv+
	REXz7std+NO3DLtLy3nbqcb4LByTfAzS/5dyjlDvrpkkJ5Rei7QX/OTsEfqX1GQ5HsiU=
X-Gm-Gg: AYBFou0I9+KVFsA0kNlB7A1R53rr70MMLzBpZb/n/tKxd7jn7mFS4wijKmG3LT2B8C9
	jfbEbSg3Oq1nL4G5ll7Gmazmhkvk5EbG1lcs3csgUdNfIlgnPwffqrKcd4v3WI9aknCQzzTDJ3E
	rwO+p7Rf2u3rPBHP6vcjcf7KqtG2gBqhc/f9kNGVBEhWd1e0zJod1Fp72S1brbh6641SxVbzHhp
	moLKiY/M4mtKH53enyi0nV+YZM8cuYufuhEVKzdrxUWptYRndkpZBbjU8+xOMp7tUYqP2wsA2nf
	8YNGD18l0oxGtXRIpTTfc43Ny2WMJPPqaOd0Xiby0Sb3IHWqsl4kp0TfX8tPfr2nBUat5BlIylJ
	3dQd4E95gtU/DgniaBLYm9kizVWM=
X-Received: by 2002:a05:6820:7092:20b0:6b1:89ff:8a1a with SMTP id 006d021491bc7-6c0b9b541c2mr2653057eaf.3.1789141126650;
        Fri, 11 Sep 2026 08:38:46 -0700 (PDT)
X-Received: by 2002:a05:6820:7092:20b0:6b1:89ff:8a1a with SMTP id 006d021491bc7-6c0b9b541c2mr2653018eaf.3.1789141126125;
        Fri, 11 Sep 2026 08:38:46 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df90ff148sm1882160fac.14.2026.09.11.08.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:38:45 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 21:06:42 +0530
Subject: [PATCH 11/17] phy: qcom: edp: Add Nord PHY power-on and reset
 state-machine callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-nord-drv-dt-v1-11-e25c073cf1b6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789141012; l=1878;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=K21vnVfWi3gJkL/oAMBFt2meTnwDXfVTNB9ot4N0Fng=;
 b=vc3SiT3OwSc+YhqE+td40cxikmsldcWKufYbhRHCLviUwyr2w89FqbTA0uHqR50TW9d2QTk05
 tb4Vf47coz7DcwHh50iiUINbuEbeKui2v8SnRU3cwWtZ7O2+fInAqaz
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfX6SPrI7w5bdAn
 WnMX2c5vvwSzTC2qrNWNnKsUKNy4PnMARHu8GNCJlM0ssUJN/u0J/WrlR08R9CMfoAmQg94DnMo
 QNiK2rCbidA+Eb7fD1zP8jdfCcR1IAbO4ShuUaaYOEujtdd5JO72qwsBbqB/gmgKdD+MRp7OR7D
 KykjXZx2khUBT0XzXkylvUZOgIoGVRpAoRL7qybMr4k4m7sRHkT/+wFS64+E52UMtnk/lm1Sjvc
 zB+876FEiahukK+m56rZ+mdKV7bB7OiiXceZfUM/79f3KkBb7Ww6K8/cgA84j+UnDIPgbDwFZW7
 UFB0lL240yF72sy5pdajZ2HgQ/rSmc0wUHhE6F2JJGNf+cj4MRLd7i4wLETjXuk5LW89hPbgCMp
 KD2yFH7+u/siBazZoaGIoiEsVQJZ7VU4UJWFXSqfU13/XpVHNiYPXMAyjOn/aTeXchWffgH+Jwr
 /yE7LIsXGL7S8rs4APw==
X-Proofpoint-GUID: q4yRpgSpD9Ux2o8ZZbpADKtcGdhevtSr
X-Proofpoint-ORIG-GUID: q4yRpgSpD9Ux2o8ZZbpADKtcGdhevtSr
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfX14eM6pWyjyeB
 X063ag5gFqu1XcmM7zRqTrp0qMl4Qa6b/tpjS7vAiskVnzmT5oI7wsn5vIBghwdr7sHrhb4cqRE
 S6lEvMI7X7jvw8GMKpJDAVnq7ef8/8Q=
X-Authority-Analysis: v=2.4 cv=ULtIjyfy c=1 sm=1 tr=0 ts=6aa42087 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=X8Wa9jmQWlBxTcu95m0A:9 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110218

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Nord relocates the QSERDES COM CMN_STATUS and C_READY_STATUS registers
so the generic sequences cannot be reused.  Add
qcom_edp_phy_power_on_nord() which powers down all lanes and polls
CMN_STATUS_NORD (0x1d0), and qcom_edp_phy_com_resetsm_cntrl_nord()
which triggers the reset SM and polls C_READY_STATUS_NORD (0x1f8).

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-edp.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index 64878398f43c..6cac4b55b66f 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -1612,6 +1612,31 @@ static const struct qcom_edp_swing_pre_emph_cfg nord_dp_swing_pre_emph_cfg = {
 };
 
 
+static int qcom_edp_phy_power_on_nord(const struct qcom_edp *edp)
+{
+	u32 val;
+
+	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
+	       DP_PHY_PD_CTL_LANE_0_1_PWRDN | DP_PHY_PD_CTL_LANE_2_3_PWRDN |
+	       DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_DP_CLAMP_EN,
+	       edp->edp + DP_PHY_PD_CTL);
+	writel(0xfc, edp->edp + DP_PHY_MODE);
+
+	return readl_poll_timeout(edp->pll + DP_QSERDES_V8_COM_CMN_STATUS_NORD,
+				 val, val & BIT(7), 5, 200);
+}
+
+static int qcom_edp_phy_com_resetsm_cntrl_nord(const struct qcom_edp *edp)
+{
+	u32 val;
+
+	writel(0x20, edp->pll + DP_QSERDES_V8_COM_RESETSM_CNTRL);
+
+	return readl_poll_timeout(edp->pll + DP_QSERDES_V8_COM_C_READY_STATUS_NORD,
+				 val, val & BIT(0), 500, 10000);
+}
+
+
 static const struct of_device_id qcom_edp_phy_match_table[] = {
 	{ .compatible = "qcom,glymur-dp-phy", .data = &glymur_phy_cfg, },
 	{ .compatible = "qcom,sa8775p-edp-phy", .data = &sa8775p_dp_phy_cfg, },

-- 
2.34.1

