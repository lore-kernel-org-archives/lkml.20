Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139454E06FB
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646113; cv=none; b=n+Sa8Cn0OMiy7fH+4DaoeiuSpFVbCZUAmHO9evpNRX4P8712eSnTjW7pSmvpi/mWJ+zdT3nkhY160V27NwXB/wL6z8TXxTOVNBf3jjqldk4hjAe0Z40alyIYRj7d4UqrovwiD1pI0l046VxuxCZlDPjkHyzrFj6FPLpXgbqgBEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646113; c=relaxed/simple;
	bh=jIHPRpMEkaV9mAQmwuXnsCksTtsHuY/XKo46rkvTq0U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=COaW+2Xf3zO+xzZC3/bgS/JKZBygwPvhUjLiV0jzo57Zpj31TZOjkWIEhUwQGv3ZMgQsqoo4lB/6YJ5ObtwVayi0C2iFe1RaRNFTA0S+STs+oRdlOatlQm77S3TBUxAr8Uw/G2mQkCBXy8qx1n33C3BeMZzePyL6y3AhgyrV9g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TjrDdsTx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TDGO41pJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TjrDdsTx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TDGO41pJ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9a3uh1390661
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:54:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wTLzzh/gRKPHbedm5Fr3dn5OxXC/FCfqyO7/oiN+9Jw=; b=TjrDdsTxQdgQ0Fe6
	iF/oApQJbeCesnvfww5DZwnFxYvGmYwT3yMd9GxwBEL2LsBdeL2pY3jP7eJeoWyP
	yZyRTFtRbfcNTuvONto32nENbn9I9OcTQ65BNw1P1neib/hh/pXdt6/lX6E1ThZp
	R0hbxekVaHHJ0eVLpVH6+eJx8V7OuLNO6o9t+W9d+cmvPEpYSH2e5x15nKWU9//e
	BBN962KmWhuOSWkV5fIiIT6f+2lYedlwYNkFZQPWsTJdHVnIP6TdTohgiQKozfXc
	oLuwdCe0zOXFxk6FwpS9WRASyTY8ui2LTiE6c9QQSUxh7FW+uP+f6y314M7nvqFT
	QsTdQQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy2d47se-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:54:58 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1b6f65dacso702435a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789646098; x=1790250898; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wTLzzh/gRKPHbedm5Fr3dn5OxXC/FCfqyO7/oiN+9Jw=;
        b=TDGO41pJSnPJrsZ52ZcHXKIqvxvAtd5pfkHT/7svH/rtZs0ygH9B/QqgJEWf/cZbEg
         ioDrKsc+RROZLDLHiDEIEWAHreKT5rZt+EgtJezSnP1gs2LiMVBOC700iZDfNdnIRW3x
         Ndoh59w02X7Dfuwc7ecaQ5koZetjMoI/1/ziYcYqJovXdFySMLVFbjKcfPTd+UEGEphY
         zTxo0cFaQCuGqo0M6WYmuIU33NizlYC4mGabubvossy/6NBG0+HQwfxWUr/GeSeWIcLl
         i5TvX9Ty9rlsnpdV/ThZpzcgnFuQwHCz9/r7v2DfUDEtBLZt0ztcpzgUxzD1W9DHQOEO
         XvFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789646098; x=1790250898;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wTLzzh/gRKPHbedm5Fr3dn5OxXC/FCfqyO7/oiN+9Jw=;
        b=KfRy36MyqbxkWcjLwaL3NR81l3AI166eNY6avH7/9eryOZYkx5HokfxjR/+jveCaDE
         xde0N1GnpyfzlGazb9ZN4P5Y2KvGnO/NPCc//hqUvCcoMr0ETgjf/StpYZ6AdH4cYp0s
         qe969vibbZ50KVkjmslStitlx0Kjv6ttirv7AM0yqNkLcQzXbd7PC6SBrDzDp4dGdVOG
         5/E6mFpEVnkY9GBd+oMAFcinfwj8E/+dIIj9+C3NChtECqz3UXX/JTr6bfigRqiRA2nB
         n2U2gGXkvqdzmO/X4PBuqgrpDJNEKZueTIO+bfHFp/Lwj2yN87ZCkH/IujZhqNFFeAJn
         /xrA==
X-Forwarded-Encrypted: i=1; AKwUvBxkxVzMEq3NTBjpn20I+JX1s3XY47dF+ggvP8VHOTEuKUrCYIzQzufKnB4ehPpaHkNP4rY6uQWXB2OjnEI=@vger.kernel.org
X-Gm-Message-State: AFuF++n7p19d0tfn3da1cJd3EOxLfefmBCvAsniq/HiDkh8gGlXOe792
	loW+ONlA5S3wJDh4cKuRFpOMxW8054cp0+qkcftnpM0eKrJvRNibB6JtbuADYivvGDZQglcaM58
	orQzn0LI8XkGzdNb27Jioz8LsXsdRSyLL75QAjJIDTXPccIL7zylk/adLNnFm5V3MnjsN4seoiO
	o=
X-Gm-Gg: AYBFou0nQ2Xc82L2x8DoWFDsC2pQfNIn3mWgqBL1Ibs+m1gMJtjxz2t4CHm0fPnGaY0
	oqsn9NCrFgevHdCri7HeWn/HPp1pj00px631KeIlWeQrJc8fUgTYU11YK0OLxwSg8tkaLXlG5qO
	tt68FbpzVKcQIs3/Al2OpuPJmyds3PWgmIpmLnkhBPVgaqj9ftui5aknosptMTUTKo9ZVR+fJ4P
	UOdnnos0Uqpkv0N4y7ObCkRfgkyyIDtFrJ+aDs9iSbcv5qriAWAg4osmoZX9XuBl0tBPGBW4kuZ
	G/HZKsEtw+4+2ljkaTeWD2GlkYIchCv+J9KCvgBK4a8WhcAdWjZCynCZzUQRxOA9SmaxRHLf5Rc
	vffk8bnULsyqj8E+ys2rnxZ9Ts1s6qB3jfQ==
X-Received: by 2002:a05:6a21:7d01:b0:3d3:ad3c:49a5 with SMTP id adf61e73a8af0-3dd5f73c983mr15880982637.19.1789646096552;
        Thu, 17 Sep 2026 04:54:56 -0700 (PDT)
X-Received: by 2002:a05:6a21:7d01:b0:3d3:ad3c:49a5 with SMTP id adf61e73a8af0-3dd5f73c983mr15880923637.19.1789646096135;
        Thu, 17 Sep 2026 04:54:56 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf596e1f6sm18249500eec.1.2026.09.17.04.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:54:55 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:24:13 +0530
Subject: [PATCH v2 05/18] arm64: dts: qcom: sm8150: Fix PCIe WAKE# GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-root_port-v2-5-0d627d0856d5@oss.qualcomm.com>
References: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
In-Reply-To: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789646072; l=986;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=jIHPRpMEkaV9mAQmwuXnsCksTtsHuY/XKo46rkvTq0U=;
 b=mdyAI+9wdGhhqa9FSeWfBG0ZLp9n3A7owGqgcmyDh7SDZ3NkSNWvZivPLcKCBU7veSsG2PDql
 do5xxHjz4MxDkUKx6hIvdrhB75srv0wuL5ZcdQ6u56ll6z84pkWad7E
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: q--WxCBZlLiLkvTbbJD_CGc49Zq7Fmwx
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfX4FSZ12QYIuH6
 ucJ5qWWNwD6fOtaxRodO9xnF2JOCKs/3NvYbDWwGe9vC/4f/dr1HKngO9PBKS/il7vIY0Ph2hTi
 Hxxw3l+CFC+C1Dxr16tSrewxd6yyyvI=
X-Authority-Analysis: v=2.4 cv=HbeB3SE8 c=1 sm=1 tr=0 ts=6aabd512 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=bu6UjZ7a5GH_BZZocUYA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: q--WxCBZlLiLkvTbbJD_CGc49Zq7Fmwx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfX8kD2i1KrARy8
 kihdOVgVu5Wr8QqaQe9jSTXPa/3irqh2w1EKnYJAjT05W3an/S6eCwjfAs1HbDWc3iQOO2YScQZ
 Dh0xLQ6Xx0ivCY696dsVNRTwai9foyAAlnI4ivzotdrmjvzQmCxx2ncZ0rYt82KmNTm1r7H3PXJ
 A5xUavBwW5x6/RtP+qKWNH4orT2yKJG1eoBimCv/p+7iV15nEn7InyeHjK/Ze4qUIHj+IN3z7zt
 9bbpG2gWVKp1pbQ39nLtUmof0BS9HEfdSXfl8cNCrbS6gktTwLRn2uIB3XkHxk6oOOmpXU6w4a1
 XYU6KpmXmvCW8tW5Z1xHA9p9mYnIT3MvBuQikozm6cMEkUsYb5Z4DvmfseAgRFvSzpYsYbFaURh
 JGWUjI2MQ3IcGOYBqYSpXG2RvnDt2ws/sk4MxouY6ZBQlVSCqrjzFTJwifiSSxtQbH7rk5NHNiN
 m5P/Lc2aA5UChNSirUQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170166

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 94a3b02cb289..74df5cd86f04 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -1905,7 +1905,7 @@ pcie0: pcie@1c00000 {
 			phy-names = "pciephy";
 
 			perst-gpios = <&tlmm 35 GPIO_ACTIVE_HIGH>;
-			wake-gpios = <&tlmm 37 GPIO_ACTIVE_HIGH>;
+			wake-gpios = <&tlmm 37 GPIO_ACTIVE_LOW>;
 
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie0_default_state>;

-- 
2.34.1

