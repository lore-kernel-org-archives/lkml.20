Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99DD3F1AA2
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 14:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789310476; cv=none; b=bMzBGiBj5cKeYILI6dS/JQC5NBhQSY+WOcRjJ7sp2ngAdKd2BdNaTjF0WZ8lveEoBBKDkh1PeUjeVBY8t8wAWU07zK34eCljz9GqtkRA7ypfthT/OyvycHszjggWiN6f6fH9j9w6KOP9ZHA4OIUqWqDVS6vhlsvYmHSRJwBCM64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789310476; c=relaxed/simple;
	bh=9HkS3wxfvgP0/0gQboWN88Ps/r7tlaD0hKV9cwObfFE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SjMN3fhI7B+FDxOEv+T4H3U+UX237BDRcLC523hFojB8x3ymaVSWbf8LfJ/ERvImep8WMbMoTVGhtOhfFwoWkVr3tX0/dKGzo7kbxRRc1DDiIx03yFek67AzkQKFlv8+lgX8dpBJweh+4z3PZmD7WXP3Pn51j4oWnBBlHs+bs14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Eixe3jv3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TANXNwpe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Eixe3jv3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TANXNwpe"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DE06ds1434547
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 14:41:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WmdRTxeOLyf0Pab2r9UoJT0vEIVmxiuf0Wt2l2dbmoY=; b=Eixe3jv3QRj5J4NM
	nA5JvZ/2Wb2ZuNnK66xKiCFeTYDXDKqX4atyKEAjplyCrFwb8XoX4JI5RmCTOOGS
	QN6CJzl4HOG68ouxTNzOTdgJELe+vvude9CGLTQGnbp9NyF5eEgT4nP3DAWxGcv8
	dJeMA3y7xjgxRf/Kq3Ewqhyf/a7LMoJ35snI18+yJL8qUl/W/jB1/1TuixUHMq9C
	BUG9B17AJoqerCtuX3WcptLQro2dgZgVX2PfAFP1x3kY4QSiO0h/ZH79Y2dS3sx4
	mjtyYNLkaNq9YRRtQyq8AdnddNj2GedisAWeO4ZggialQfZOZaW3HG4Rut+y/aUa
	fUuSfQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmygd3h8q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 14:41:14 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so4030356a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 07:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789310473; x=1789915273; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WmdRTxeOLyf0Pab2r9UoJT0vEIVmxiuf0Wt2l2dbmoY=;
        b=TANXNwpeKvDG2eQhJEycO+8gNtkr3ibUF9D/xbQNaX/FJT3G9EO1cXt5VoPuPp4r9t
         5Owd7Hf+NrD4jVboslqKctQOVNosaENiQe0+7KMSWcTOb6+kalMjGEm+jHde/d6ckAg/
         2k2rZXYV6qdIUfqsYkQ/OGfriJiCoqXLhvVRAp6S9ZDVNca/oXVd3xpKuoYuIdqUpElH
         13sIZHPBomJP95aqfxwDAOa1FSfpRcHK97mkzo/ahhRCz6vshxdDoG3mselY6lG+mozs
         RcazHiBFZoHEWdnUAh1EpdTdhite9bB3ef37jADGwvn3f0xpbQyuBiz8CFUkdIk+uwSB
         99Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789310473; x=1789915273;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WmdRTxeOLyf0Pab2r9UoJT0vEIVmxiuf0Wt2l2dbmoY=;
        b=KjYRKnCp6VmWNoYOE1NFYZVOOvD6NHUENVc6gtrgWny+fiQEAarWEvV40Yi65UMs62
         l/9Qv73SLu2qq7xMGxe1ZEDIlsURh34ZqtahBl0KpoNVkVBbmp/z4Bw3+Vfb9eCShG5L
         z4CMIgZi9qryM/d+kB2jDVrtQFGRhtTVUVBSnpXRIodxSxa+SoNWk1mDpaShSfAjTvzR
         9zF2yTELZzsE+JIKI9vIv/GlOt4QEn4/cAPUtzhGtMcFtdbWvBHhcXiuCqUBs9HtfhTf
         M25HtrwGXS4ERhXEhQFaP4tcNFPopmM6hlkvJgrL7DoaOla44Gz5kSL06zKr4NgGkt47
         D3+A==
X-Forwarded-Encrypted: i=1; AKwUvBxrgU0nRO4xsRdi+YvE5QHw3WLhlcudafjrtJeEiQiofvCxXYqaSOvGYHaXiiytIWPdBdqp32CrnlD7vkA=@vger.kernel.org
X-Gm-Message-State: AFuF++mxO2HFcmHfkdJH5klIyZgstEmzS5CvTJ0c+ius5evaCajsoaq+
	Lipe6Ay/DRDP8fhATXPd/7BMd0YokAs3wnE4uOw4FEtQLvQVZxbgFNWVYAJORkYwsumwn6AYnEU
	Pa09SH8NOR0O8bykrHN/CaaRI8a/Usjf3UBMbcNZbFCn6EkmIYyjdWrEIRi/jWwFfrEA=
X-Gm-Gg: AYBFou0C52GhqIUcIZeECIrIPARsMHXnd+G+QWViqYCPpijEhqkWklZEgraI4S+tfiK
	L7LBlRuL/WVUhidsorIbb++4/K5l5Y51FOibCB/KAQNYh9LjwsnuwtO7ORRj/ZNBBiPssp5jsGU
	7DvHnKEwP59sz9fz3NoirDfItn1Ut9wI7xW8IrTExEQdeaPjNV1mwQZUhEEdYLFxes0dgTOzvOs
	W8oVTRdhlz6Xyrz+AgEJXSkhYu+nRTost0uTYKHnukNCzYwv4PIny+AhUG/HKWuqMdI/UU54oEc
	cDCCivynfkbq0mBZ2M8HjZmXCai3Uc7M+0uJAp1SA5m9YRR9NlUQtXu3F0oh278Eo2JkVa0rVgr
	hBA0P4x0Vwn/RVegYNTHR3Ss3jseEpzrWHoT0mLpjYfCTLBMn136OOASW2GKyqAfO0PQcBw==
X-Received: by 2002:a17:90b:1d51:b0:38d:b36e:9813 with SMTP id 98e67ed59e1d1-39dbc1d770emr13606712a91.11.1789310473425;
        Sun, 13 Sep 2026 07:41:13 -0700 (PDT)
X-Received: by 2002:a17:90b:1d51:b0:38d:b36e:9813 with SMTP id 98e67ed59e1d1-39dbc1d770emr13606659a91.11.1789310472987;
        Sun, 13 Sep 2026 07:41:12 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14382741839sm2904705c88.6.2026.09.13.07.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 07:41:12 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Sun, 13 Sep 2026 20:10:46 +0530
Subject: [PATCH v8 3/5] phy: snps-eusb2: Set phy type to EUSB2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-eusb2-interrupt-v8-v8-3-0f505b9c394b@oss.qualcomm.com>
References: <20260913-eusb2-interrupt-v8-v8-0-0f505b9c394b@oss.qualcomm.com>
In-Reply-To: <20260913-eusb2-interrupt-v8-v8-0-0f505b9c394b@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789310452; l=918;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=9HkS3wxfvgP0/0gQboWN88Ps/r7tlaD0hKV9cwObfFE=;
 b=hFTLP85/zIcgbaptlBh/BmvV3xuqMw0s+k6Ph6T8oM3NL+PnmNbm/0eEaDDFGvOmPncgOywup
 G2OVf7ppvxKAuafSuanXxZkWqHK9043pYh8jPNfg8ErIs729ddDDvQo
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Authority-Analysis: v=2.4 cv=RY0FmFtv c=1 sm=1 tr=0 ts=6aa6b60a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=jIQo8A4GAAAA:8 a=EUspDBNiAAAA:8 a=ugjOiUgvsQrqGD8bgbUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDIxMCBTYWx0ZWRfXxskiEjSldpID
 VkM6BNe/8TuuQ12PeRZJSxHfPQJJYv7xP78eXWTHTyGPNZjqwzG6Va3LqSnQTKSCc47811I9xI1
 eVSIqfy0D0lr7GWz2DV7yazeWsP3FqTRhxiLByeWMDDrs78jprPb9Zqe28iFzlCXxWDbAqgLGpq
 hvPEz2zLHxkHSKzF2IQzrgPbuGUzEVvNGVtrFXbLmUVKGKM7Z1pRdN1wg0pPijTR9dVMENof4oP
 f6+49rWaAZ97PjPsgA19Z/WgJttxziDNxlT6b3raT+14BIM+P6VnyxOc4rmUIJZG6N/bds25FvY
 MXRrIwLvYE18KtIPCi8gI0q366vG7TEtkgDKiMxE9S7JlapwSyNuG4A4vqpkvHQzQvqwV9/EGk/
 60KbWS/Tu1hYZsEq5Mksc3N5x2uZA1HhvcNOh2enieYLUAOkE3BaOLqdmkg1gRFwFJChpcldqki
 jd01TYv04iPdB9Quq8w==
X-Proofpoint-ORIG-GUID: P0mezRAyR46lnMdFdT0jPilBxiH8Ynyo
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDIxMCBTYWx0ZWRfXw5aGDQh55x3e
 1rQgYaHwnGt2bG5B6uadR3OnbklhCJ1xq7SrQL4n8wEzYbk2uXFvJkqKG5KeiGU4Lk6QN3o7FXQ
 LrrsHZTpfC+YxNLjnDcle665pvlFiRA=
X-Proofpoint-GUID: P0mezRAyR46lnMdFdT0jPilBxiH8Ynyo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609130210

USB controllers like DWC3 are agnostic of the kind of phy (USB2/eUSB2)
connected to it. Set the phy type to EUSB2 to let the controller know
the phy type when queried during its probe.

Reviewed-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 drivers/phy/phy-snps-eusb2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
index af4fa17ac6cb..ab405108c727 100644
--- a/drivers/phy/phy-snps-eusb2.c
+++ b/drivers/phy/phy-snps-eusb2.c
@@ -596,6 +596,8 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
 		return PTR_ERR(generic_phy);
 	}
 
+	phy_set_type(generic_phy, PHY_TYPE_EUSB2);
+
 	dev_set_drvdata(dev, phy);
 	phy_set_drvdata(generic_phy, phy);
 

-- 
2.34.1

