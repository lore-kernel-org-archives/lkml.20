Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A631F38238D
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 05:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791264591; cv=none; b=aAADbSbF5qiKcTfEzb5qJieiGjlEXHG3QTDhsBBV2cluov57H02ePbm2oLk1XccvwYcSTHZH8drRGrQGXmiCtiPLsWnKIqKjfiblOwPp48UVL8/PeK63fuNeEpQz85E3gix3f/VQNokGJzww5czStF2vr/TtF/nhhX+LzQV2J0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791264591; c=relaxed/simple;
	bh=0STYxAxDE1NjmlumOdbThi5YeoSWS5eKyqTdJTbik7I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lEC+mncNzT9+CNfjMfz75V54K7mi9Tto42mYO5NdwyMM8fqLsiGv3wRS5lTPsTQmRxSs/B8qDs13vlPilT18Z1JbL9mfYMgW5TmKuJvtjWDaxqZPmex+L+pRuA4aJZsVIY8KSrikFju5nGBIhSU49oV/uJMrqRWvFUGuTUzN5v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IggwAbbW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A8Glr8Wz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IggwAbbW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A8Glr8Wz"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6963AZqS094027
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 05:29:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y6PDhPtXFIAM/ccyT8/MEF2gGuCNuVMLTbOdYMac8XU=; b=IggwAbbWmNdtGWOt
	NZC1t16nsCCoDYvnR8PWijwHWTARmJZ+I0kKybQ+YJCfNg1nSkJxG82NM6NlUsKz
	/5XlUuoojCMkS38u0RPhGQOLVPGDdN9dfVtnf7J1eqOG2HzEl9NA1jesG1giI7zo
	4ZocwQoE+kURRbfyE7NFOaAKEEXPUKKp6eRVTCaZoskU/DFehwxGMwTEIJef2gk3
	KizFKkyAj+qnlcu7LqARfzlnUydr7CuGjlS7IePVT24pA+8ngb61nlgPXFwBke6T
	SDxovIc3xEaHOiplc7CKH79NheqISOdu22BNHhFgkdRLSgOGWFSMLdq1X4KE8EuH
	V8cRfQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h49tvursx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 05:29:48 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33713e5e6daso2901141eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 22:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791264588; x=1791869388; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y6PDhPtXFIAM/ccyT8/MEF2gGuCNuVMLTbOdYMac8XU=;
        b=A8Glr8Wz8+/HjlT9odMJYuuO9nX5psr0hwn2OQGEgfWNo+lO71xzotcokPUfagNqpM
         bN319WRs8k0VAUFZQ8machCcK+nqGCV/Gk4zF8OeGePp6LbvfFHhVhNO9QnE1IYtWuNt
         cG5T+TF2JCgWpaPi1HSo4Yj3qBLIM7KNx9O1C34IL2D52DhHFXLVat8IzIHlN3haOStY
         1wWX7S9ehSI+ewy8tS7h31fMKllqLZ4GCK7wkfyIP0waml6jXBGTZO1QFH8if/7fV19b
         dwT+YOLdyqnQzkLmiPrqzr+wGVjueYUjzM2H+nom7P1pyCoF/CNN2S5faGAxERGo04+8
         xGSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791264588; x=1791869388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y6PDhPtXFIAM/ccyT8/MEF2gGuCNuVMLTbOdYMac8XU=;
        b=JZVlNqmNcSIsxSmWDXGA2pGpsxbrrsUj+YtQbiAP9xws8DSaMBOgvuVJtf3HJgGWMR
         WjoQ7kEywQ4DyRD1VzPCT5eBvbPvKeBr6YNMn9jThCVOqap+G7JiqF4s2ohGmbDyKpo2
         yP+x4+5p3w472IL+NMYjei1SZVTgXnnM/HH0fKZnGIBuafdYAR/cun1L4qFpf+Oiv9s5
         frYumwW9ibJ8MqZ9hr9kHzupj7L5PAKT+i/Q1IanFFG7ozvBTOAUnfdMGaCF+8YX4FKU
         SfIFkXPDrbdKvv959KINa/lRvRhTIS5BVKf/tU5++QkZGAfJV7yFyIyj6XZGTscLhgy0
         Jglg==
X-Forwarded-Encrypted: i=1; AKwUvBwPyHQZYcu0FXnDawgckT9N79vls7kBrN5T0juBs2zcMceKBqAgsEnVlNd8ECpNJZGL+H/RbmacJWh2cNg=@vger.kernel.org
X-Gm-Message-State: AFuF++nu4UBfsSX1AI2xkRQXyQ1qRx8Xc2VfBZDHns0lS/qNHoZkvdvp
	nunAvjXapObEr2IS68AaiH5HBvdCC+HOZ97gOq1epjytInMyHST3cFIrmLiVErkTxzwwFqBQJae
	7u0OeTdGOqo6eoz/m49iaHK8nbKCu1pZ8uBYOvXuBiDWK67u3Rjcc7gnwBLM/wRhEsIQ=
X-Gm-Gg: AYBFou2zAvKQQ8HvwOCNI5GWqmoADzpzPS60KVTy6FJE3hxk5v3nBdEn0eDvWYE6nmT
	tG8fuzrmcge7CP7p7iCgjLKTnq8SNm3sY6765JXFpnfFdWtQ31SQRBj6qhIaCD149rac3luy0kd
	R8F25p9fd4QDSdUAIdS8nCoxLt+kBhNpcgR2l37rIGY2N469pO9iMo7s72JR5/ecEIukU4lbNkV
	zi+11v/y7yl7aYkPff5EbPv/q4hol+O9HgiyIHMCTyez5C5AVMTQ3Dp7X2ISbAgU/63tCigdnI1
	RpwNmWF7GI4MAOPlGKMWrVoh6LJz/WQEpgb/92obHM9Y9PMEYK30q8BP/vHIsQ/ecTyfDR47VcX
	AJ+DaEYDH8gJEf/pOBvdH3LBTry8uqDJKq5ixp1Nh4PaIicpPUq6h7xqIioF+XRTL20SqnooBpG
	VMHfaP+Pr8DeXP1+ArqOpBJ5tNLx8I
X-Received: by 2002:a05:7022:1504:b0:156:3684:96d6 with SMTP id a92af1059eb24-15eca924facmr586325c88.27.1791264587451;
        Mon, 05 Oct 2026 22:29:47 -0700 (PDT)
X-Received: by 2002:a05:7022:1504:b0:156:3684:96d6 with SMTP id a92af1059eb24-15eca924facmr586297c88.27.1791264586924;
        Mon, 05 Oct 2026 22:29:46 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-15d85781d49sm4017403c88.16.2026.10.05.22.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 22:29:46 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Tue, 06 Oct 2026 10:59:18 +0530
Subject: [PATCH v5 4/6] phy: qcom: snps-femto-v2: Fix order of arguments to
 qcom_snps_hsphy_write_mask
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-phy-v5-4-cbe9330a6449@oss.qualcomm.com>
References: <20261006-phy-v5-0-cbe9330a6449@oss.qualcomm.com>
In-Reply-To: <20261006-phy-v5-0-cbe9330a6449@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=aN9lOr9m c=1 sm=1 tr=0 ts=6ac4874c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=GpOyvZhAS4UUCrMfQdkA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: J7bfuQI8bSHTrmU_umz_-Dr3E9r-Qem7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAyMSBTYWx0ZWRfXy2C/dLTHKqLv
 KKqOXqJoArUDpfDdaxgbHdYZQRgTA2umvd7aaOPoEVtBl62OBBg6TRoRVg+s3e8hodpuB2KcERD
 zMHtfHdlGwe6W7KVhClwGLwLodLRSqzhQNNNECgRP76pPbDGdfj8PXylswslp/lkj6G/VaTzCSL
 TYCkAgsKhhUFdbNXEEtt0iK9RXlkfohAUwfx10CRtwoMnIBuq/MCKRkpG8Ew+nzCMre3gjLBACM
 jNFT2WxhJ9eM3UNu6xpDajUBs9n2TnQVUF8nFjt7kpjROPf8BBvz63rGQsKburHwDO/DAehoP5p
 4An6joUxwAMZEcRTOi6x2q6kmcfhEjvMWOicJeOBRBq+OY8NQZelNW4pGZwpWEQsK3uXVHbpZBF
 WjC2tsK65nmQjcW3K7u+ZgFlbb/CtO+fyUVc+ddGmZKyg+GqJlQGlHWoV8h5gMRXnmLagu4SRoK
 /R6Ytwe8yAIiZOGGauA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAyMSBTYWx0ZWRfXzQWMxAFSkk4+
 t0yEMxgr7c/+4x7vJJH4XMK46yKosmNKC04sQlCHeb3j92deM8loJbsWIoXs4ZyXBZj/x/Smthi
 rxyNy+dxfYfz/mE1mroacngxJiF1M/g=
X-Proofpoint-ORIG-GUID: J7bfuQI8bSHTrmU_umz_-Dr3E9r-Qem7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_01,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060021

Fix the register bit field mask & value argument order while programming
USB2_PHY_USB_PHY_REFCLK_CTRL in qcom_snps_hsphy_init() and USB2_AUTO_RESUME
in qcom_snps_hsphy_suspend().

Fixes: 51e8114f80d07 ("phy: qcom-snps: Add SNPS USB PHY driver for QCOM based SOCs")
Fixes: 0d75f508a9d56 ("phy: qcom-snps: Add runtime suspend and resume handlers")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
index 980ad1fb1e2e..0ead37c0dcfd 100644
--- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
+++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
@@ -193,7 +193,7 @@ static int qcom_snps_hsphy_suspend(struct qcom_snps_hsphy *hsphy)
 		usleep_range(500, 1000);
 		qcom_snps_hsphy_write_mask(hsphy->base,
 					   USB2_PHY_USB_PHY_HS_PHY_CTRL2,
-					   0, USB2_AUTO_RESUME);
+					   USB2_AUTO_RESUME, 0);
 	}
 
 	return 0;
@@ -426,7 +426,7 @@ static int qcom_snps_hsphy_init(struct phy *phy)
 					USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1,
 					PLLBTUNE, PLLBTUNE);
 	qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_REFCLK_CTRL,
-					REFCLK_SEL_DEFAULT, REFCLK_SEL_MASK);
+					REFCLK_SEL_MASK, REFCLK_SEL_DEFAULT);
 	qcom_snps_hsphy_write_mask(hsphy->base,
 					USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1,
 					VBUSVLDEXTSEL0, VBUSVLDEXTSEL0);

-- 
2.34.1

