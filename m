Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391743603D3
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 06:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791182234; cv=none; b=JBlJtNex7BQSarFX3iVOJ/qOQb3fQ98z4uhJ/XZr27tNXr3NGCpBrksklk6kik1kMwwwDGcbx3AM6oELFwSLpj2qIbhQ9WM7Q1LWm7KRMZdDlzC9WgXmZl1Udv3TqBSURJ6oRFmt8M1FJeTFDJiHvP6yKyYFFGygsiZtDSoN4G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791182234; c=relaxed/simple;
	bh=3g+p/+TLsOgWJR/fZcC79lC3qyFtFEfuh1Chjww+45Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NADC42110ItYFYNbE6YBaW/coi/twrDm+ucdmEYS/Wv9PqrtSxT7se98ZJ+Nkf71N6JiMs85ecjcTd79NtEOxe9J6NnrInvds3gFwFR7twFxWthhFgPZedL3yF3MsApYoyvsP/DxuaoSFh2wJRO9vrRksSRyo+PhwdRwGDaWyFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DMIkyNKo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OXHbplpD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DMIkyNKo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OXHbplpD"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695108Ij3242506
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 06:37:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KEj9Iq84bNDgFjxx2TW4jH1N7L94Cfc45qqugk6RYqA=; b=DMIkyNKo2Xp2unci
	+gf+e2aWEBV7C+TcF9ESV56tGvfxHbriFDDVPX7HoBZLPKSMDFv4iygFhyn0ZnXP
	BCio4aO7pNDbbxUUB20WtWzsSop4iOKq3GzUoVV0jXj4kxsR2MtlD5HrnHFw/PrF
	1NPZbXURF+bo50E+Dx8TVOAltHLstStSzF1MY0o6WmE0NuYqqNtBLTbWS6rVUuBf
	WJfGY6mGEVaytdnba61UgndZuMcoeGbhE27pbwfC8VwQsEaVKd3nUSdbdZsz3ZD3
	v0oDr+EAw46CQncxfltuCduFsxcOtVcPN6NnZZtqNq+EN2gnuYD/qLSWd7Ixr+Oa
	r4KFGA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2tvevkq0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 06:37:12 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3510a481ae9so2712608eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 23:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791182232; x=1791787032; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KEj9Iq84bNDgFjxx2TW4jH1N7L94Cfc45qqugk6RYqA=;
        b=OXHbplpDd20emiR2dxrBm1Iu8mwT2FNlUE0aM98EjEdY5dTOlufTpGzLgyvlTVwvWN
         jIKFyeYODjyRg8rg+lLBl+1IKx+G4GY1jrkmoJnDuoa237ifAVI2vS2ElMl+ZfkRHegd
         JZ84kMsuGHN9d6+AVThDqkLzAzGc+JySJBI9SW962fUkq2sB5cPSXnisi0/09YllWGoP
         H4LPKxnfLTdx+4roemTydQdUM4P//HrLgqiaKzByaeFP9jt29s0h0Jp0DVY2r3dmDQwY
         6iXM4v0Z89FNUPw3CovbnmAWTLAfHUCJhZft78lHJj+DKRYoSSf7/GkstB+PsCEA2rtB
         jkSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791182232; x=1791787032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KEj9Iq84bNDgFjxx2TW4jH1N7L94Cfc45qqugk6RYqA=;
        b=uY7mYt165L5WMcN2XZozLCW4udgomNSpZ4imMp6kNZ50ng1iF+JOBq+hGYAM2TaXUM
         i3km67BRiuRNVhAytSJvQ8BYfx8DDOX1fDxBlXeZysmBtWgd985HuXTVDMObAE60pevE
         d/aPOBttBhsvrgIKpmyfMFQw4rrwFl45nsAbODB72gneCdR+sa1VwgiiyRVZJsEPCMPX
         Mf/MyoIhrmUzIGK1qdzLBjtg9ikZamPofVdS8OGiOJOIxrZtugJwsbnv8lp1UFJKNkhW
         gNkLHJOr+sBjU/n6YxdWUCWQKpfvY6JWhyzgxdg82Wb/pwxWYcF6j6+D5td8W8Mgo2ew
         TD2g==
X-Forwarded-Encrypted: i=1; AKwUvBzr/l6WxQjMOgcEfJmXgKR8cvjqvJipXhZnQH6vAGEOXGXLSsKpDfi1jr+dRBur9KREpAhWtKPtHV+CB0k=@vger.kernel.org
X-Gm-Message-State: AFuF++lfm50yEyyAVMfcuVb1018l5xJH9yAA3Fp+0H29RGvNDQJFgI9W
	7nloWD+RS1ZXowMdryXyM0tuaFjTKAmqj+NMXzYpLlMWEegKU4NNlpYEX8HKEiizcNgJloNxhzC
	EbmE+OT+nrErjPYhHDMK+EBdE9VT5HQIY6LIe9oRFsgykpvIEwF9x7UJBnLKlh2580qM=
X-Gm-Gg: AYBFou28XxU5Ztmgm+I10tPJxAR3qjgiJxfL9gBmzhzWGUkSsxS+/51wm6UuMLBotgs
	UqylgvkFH81T7YfjsDgtBl0Xw3H6ZiQA50b/MxkrXGUY6IPQlFx6pYyXa0xqCcGEhgkOJNe2c+j
	g1CFyGPsQ0dZh3VI2RjtaJ6YjfubhHaElGvFBf7fpEqKUDeKLkGKFTKbqAX3a8R4sv+taWO7l7B
	yMnA6bpuY2U76JespUMWxF1gRBdv/TqBA3t5eJyK2v17nGzbQ+s3PIr82sTPvCJ4lShpLD01J9f
	hyTNTorWT0p+qzFCfIXG2UijBErRM1BJhOsVh4VooLGlo1CFaOgKXv8+4WLEg0i5U6D3armsmhU
	WDupOJElHrJBdFcfsgVqzrwZjZ37rOg9LErtFOF+hjGr60FgZ1qu7ms8wXWhnYYSRD9eMVVAJmu
	j2in7rpXECDzuJVAbkklQbe+2l6XAe
X-Received: by 2002:a05:7300:c00d:20b0:351:1230:508d with SMTP id 5a478bee46e88-3511230707emr9761598eec.13.1791182231771;
        Sun, 04 Oct 2026 23:37:11 -0700 (PDT)
X-Received: by 2002:a05:7300:c00d:20b0:351:1230:508d with SMTP id 5a478bee46e88-3511230707emr9761566eec.13.1791182231222;
        Sun, 04 Oct 2026 23:37:11 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3512718d9edsm11185821eec.19.2026.10.04.23.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 23:37:10 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 12:06:29 +0530
Subject: [PATCH v4 4/6] phy: qcom: snps-femto-v2: Fix
 qcom_snps_hsphy_write_mask argument mixup
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-phy-v4-4-b04c4123ecb3@oss.qualcomm.com>
References: <20261005-phy-v4-0-b04c4123ecb3@oss.qualcomm.com>
In-Reply-To: <20261005-phy-v4-0-b04c4123ecb3@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: zOIocNf7lig_mtot3bWwWuAnthYM-Ck9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAyNiBTYWx0ZWRfX/imGBFHSC0LY
 IofsugAF7We+4ovHhNuxI6LiLlF0gvfDWwgoLZHVV7jijBazN0Z7VjATxXuqAgR3yp57Rn58hog
 fjkYJdoFsWaRD+AwywMEhz5a6vz21x4=
X-Authority-Analysis: v=2.4 cv=YoGa1IYX c=1 sm=1 tr=0 ts=6ac34598 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=GpOyvZhAS4UUCrMfQdkA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAyNiBTYWx0ZWRfXyW/oEsY2hGCh
 Zwzu/cjGeB6C0Z4TRbU9E0CvGg3991Oxme4d7FX3OHy8hvr8j7vFBxtib9bGQKNCMz8CjqgCm0l
 rW1W+18XzSu28S8grIY6CAy0iN7q1QqsmAnM1ih6IPUzfHvbFCdWIX+li5/ZvK4e3UcvjA5Iq7L
 6QBkJmc/r5Jr1AeX1lx9dWkruB8kBXehmuUd5wOfhdlNiJEM3CQmPQgMxKVYm730s7BZOf3bbhm
 L9tK464Bsg7Y84B6iIJicHH98MIO01WmSRtgnSFoEluyF62N6GVyFHsTU8otOCyCXPZX0XssK3l
 BDQBwOPpvLn7sSF61FnKEcLQyCquToj5d4vKnIon48Ff+acoTjhORR5N2myuKbWaKk3roi1sawl
 vT2DjlMwZm9jq716uJ6aVYI/BDd686L3oS2M1g7yuK0/0ojk9TiEIHjEpXfFHzusTSqDbkCGaTw
 u/FdZd4rdPb7yT0VHUA==
X-Proofpoint-GUID: zOIocNf7lig_mtot3bWwWuAnthYM-Ck9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050026

Fix the register bit field mask & value argument mixup while programming
USB2_PHY_USB_PHY_REFCLK_CTRL in qcom_snps_hsphy_init() and USB2_AUTO_RESUME
in qcom_snps_hsphy_suspend().

Fixes: 51e8114f80d07 ("phy: qcom-snps: Add SNPS USB PHY driver for QCOM based SOCs")
Fixes: 0d75f508a9d56 ("phy: qcom-snps: Add runtime suspend and resume handlers")
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

