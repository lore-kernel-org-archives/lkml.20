Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D3132D0EE
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 03:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788577518; cv=none; b=hVCIvBmoKBL0t7PKvvDzfUDMiXMp2AzgSz8CQONH9rRt6wMVK02QYZZQwv3wSyTGlFqoF5L/4ogHPeQds2yTPX3iMWKQfcAjaHTjT6l1MNw3VAN7PXIiGLiVnVXFWu9jU3eO0RF1ICr4UyfRGSpKvEePScq/opkZSIpoTJujMrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788577518; c=relaxed/simple;
	bh=tU/l33+uhGEnj1Dq6N02qgynSR/7lnC2nCAv7+3aGjE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MnrMs3PcuZG828VZCA6rBflcwwl970w0Kn+9KaLoIwOKQ6b2govgdTfSHAKtu6CbDJXz5D5AyYKJNaajOokU4eF3vgupjeY5MQaLxZRukTnNZ2WFRtGLz1X07FJyCtF4LlVHUp/chVpl+auM5PHWVC5gLvpbLRQOEZ9j8eXE9Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hCTMp7Tr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j73b3z1K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hCTMp7Tr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j73b3z1K"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6852pjZb1729005
	for <linux-kernel@vger.kernel.org>; Sat, 5 Sep 2026 03:05:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MfneqcU56t7VS6CqneYMBu/Wx8Su2h+ta4JbErs6gcg=; b=hCTMp7TrTfEo646I
	t7dufddFYj1mDkvr2ufN3w9iKBPHZQD33RxY6PbKyCPOHCF0+baBUHrBsKAWAVS6
	sXy1f7kKk0u+rw0OmjwFTDhgWRcCOLjAaP2xGdZyG2r22s7cacYo3p1Ibngqu0zl
	hLpS1s4gIfCvWHp09EArxAs33hGna8nVru/KM8HmRGn1DE/yd+4uC5TpCdV/G1TJ
	N9RWyo6E3H6m88PIbcBIBY2EGj44NczBZBrfMq72k+s6uEV4qUshsjIbVpj37Z+w
	nBhF9NvszdsYpJgybiY7xJW4VDeeeRu3S4ztdxWTApk1mrz4IyzpT+0uCvS0NiYc
	YoBsSQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggany00ng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 03:05:15 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-395543dc382so2239149a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 20:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788577514; x=1789182314; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MfneqcU56t7VS6CqneYMBu/Wx8Su2h+ta4JbErs6gcg=;
        b=j73b3z1KRZ/qHnZBLClGN/L9WhTUT/fZOem0ZQkUIScGo0n8c7aQOIStfhyHTJ1qxE
         Hp51xRow5I8PBz3vUJTZUvy7eQ5RW4j2AYlYt1XQCvXaQH4fB0RIS3q3xueBYe8tKmWt
         mIGpfzBlhqy95ioBkXux303pJRaLT4ly7WeSbKJpCvlDB0u0kV1phH801ZZqjkWeqPBl
         veSbDBgW6brBv0sZbPz1h/kSF1He0VDL1lHYbDrCl7FeQm2U4RjZIyzTqT79c+t52eNf
         +AmYDufeUeB8ZeHMJhx9oPYfXUYor1ydAn4lG8x13Tl1J17H0W3Hel3uG+KEhtWSPV2z
         ZlwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788577514; x=1789182314;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MfneqcU56t7VS6CqneYMBu/Wx8Su2h+ta4JbErs6gcg=;
        b=c7jpyusaf+8mKuckDyPsXWJUxfplLD49TyiB2/PWW+s+C9pieNO8BQ7fh12ehfxkee
         1UCqYSYGdv6ZfnVgjSePExysxImrQBQwMW8zb8RALCJREL9qZGu8I3lASBGD8OhngYaL
         UhNUlA+1O1aQ1xPBXAz8l30xcdfRlZMsynYeYgkE0mkaGrwwKDx54uALkyTYgENVNwA3
         Upz6inKf5EHRCkYSayUcZmv0XrS1gWN9hxDGpMefc0/Zw7zQMWfI3cgqWK4hFeJyDvBt
         GuAKlYDX7KbjKflZsXjuiUZXk2/e7kXDMFcGx0246L74bjNfRWv8OO0Zv/5E+j8fbOSK
         +1zg==
X-Forwarded-Encrypted: i=1; AKwUvBz0pVY+z6dyhY1RCQU4I7fZRZXBCgPvqlpJyFt3cF2PSPR5JgpPUqFvqd/59PYhrIRWPyvOzVsJY3wVha0=@vger.kernel.org
X-Gm-Message-State: AFuF++nAUyJyDZURrThl+o7LIhTMoCsqb3u6jqDWvCC4hMm/6WhURfE3
	DzGqdzRoZEKwaxgHAsLUlXgr7O0k5MJkOFTY5g20EIoXc2OA1cSURDqvYZUN67anxEQCRcTZcWC
	N7/PxLPkqjaCPJttTq/2x4BvQ3EBNlyrsFJ7D/RAUEZAIi0+trNSxg7DGpeme/6BJKp0=
X-Gm-Gg: AYBFou0dnsGOT1ebjIEf5NTOqbBWelC8u39T/gk3wK42yH3iCc28mYlUR2Zk5RyH5UJ
	X4bxToAmwaynsSWORjzAzGKY6fLh//iSc6mvmL2T/w/QJeiIAt4xsbhHIv9fSOn3cWmcS9l7/kG
	ORt8WG+jYfIsj+pbGd47OABxbY1DM1L0SfO0DIKXZSF2q3SGNEcYxq2GxkoH7DWzCCc+B//2g/X
	R8Y18zGsUo5ChqAf4v8use/C3fVnzPYN0M+9G2fvTvzfYZP66HWoqGsW8Cq14oVD95AZb6MeI2d
	Prun0AbPSnJEgmx9D7KBYzXUA7aV9kYChZOm9G0rPGCauSvurUWYMsYTOMy00tlRvWRQUREbHiN
	AqnS+eLlaUEAAiuXgye6FKGloc8dt/ABWGuZj/k3mYg==
X-Received: by 2002:a17:90b:564c:b0:37f:e326:6557 with SMTP id 98e67ed59e1d1-39b2612338dmr17701689a91.4.1788577514415;
        Fri, 04 Sep 2026 20:05:14 -0700 (PDT)
X-Received: by 2002:a17:90b:564c:b0:37f:e326:6557 with SMTP id 98e67ed59e1d1-39b2612338dmr17701633a91.4.1788577513940;
        Fri, 04 Sep 2026 20:05:13 -0700 (PDT)
Received: from [169.254.0.13] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa36b37sm10066268eec.14.2026.09.04.20.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 20:05:13 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Sat, 05 Sep 2026 03:05:03 +0000
Subject: [PATCH v2 1/3] arm64: dts: qcom: hamoa-pmics: Mark pmk8550_vadc
 thermal sensor provider
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-hamoa-sys-therm-v2-1-1cb8c958c981@oss.qualcomm.com>
References: <20260905-hamoa-sys-therm-v2-0-1cb8c958c981@oss.qualcomm.com>
In-Reply-To: <20260905-hamoa-sys-therm-v2-0-1cb8c958c981@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788577511; l=880;
 i=bjorn.andersson@oss.qualcomm.com; s=20230915; h=from:subject:message-id;
 bh=tU/l33+uhGEnj1Dq6N02qgynSR/7lnC2nCAv7+3aGjE=;
 b=tv+cUWtUhjMWPT1J6SpLZg8w1QBN6JgKwlnKZTCnKJ7dxyRfs1JrKYFWKrA2V+XXJXDyTjKI2
 NsjjToetorAD03R8CkdX/YCRyvH/NN5P8vLH+UH6orI/IjGiH2CO6Uz
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-Authority-Analysis: v=2.4 cv=X45i7mTe c=1 sm=1 tr=0 ts=6a9b86eb cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=dcGlkT_ihmlbwMaWQsYA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 61rkl5Cr1Epq4BJmkIXhXv6cXz6ju427
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA1MDAyOCBTYWx0ZWRfXxFvD1xIKpWD6
 g6PCLhLXeUe92sFnDqq02rkUPgsZMM58KFx1iTAgR71rApZWSZEXOq3C4Fz6Ogkjg88e7/RUyX2
 ODgO6eqEOphZrVRqLAaT58tmVRlgcPD/iJ/xI3552Q+tIxCv7cQ6sIuqOizhAy5QUt9F3nkWIlO
 UGR3fhFX6EzMlxnPYmk35SdTrMoFQ2cK5rWQZPzpsmc9dTU7m7zZZ83RgUElMTHQt5I/lV96b5i
 cJXP/W9aXS9pYskah/Y3KZTOEDZQP8CRe6wNUC3g446ondhlPdv+KjWYdhOLDH/aySD1Sc/G3ns
 nkKoV/1SJMW/WD7z/q703Byp8i4GxHLoYHUzpRGUyv+/4OOCsgdoHSqXLWQkFC0DLiaK7neu0tu
 Wh7H3J3syxqktfG2/Gc3siNryGY/rVnvSd19t9sqPJQosP2/46sRPM8I1UxXcTj2Pc30wLwq9vI
 ht8/6dmtWv/xgI98ucA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA1MDAyOCBTYWx0ZWRfX6eCFt/foPAjy
 Lrm1Pz0hxr9L7O/CKLQR4ul/1Ck1s/vvsxkXGH2i6WH0LUrQ+gM1YTPvvJ97UOW9OHYFqMBdgBI
 r5Jd7jorNMxxApdaEW1nMVkFUbFzqWQ=
X-Proofpoint-GUID: 61rkl5Cr1Epq4BJmkIXhXv6cXz6ju427
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609050028

The PMK8550 VADC is typically providing thermal measurements based on
on-board thermistors, define #thermal-sensor-cells to allow referencing
it as such.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
index 17d754d57e18..7fad4a9b92fa 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
@@ -288,6 +288,7 @@ pmk8550_vadc: adc@9000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			#io-channel-cells = <1>;
+			#thermal-sensor-cells = <1>;
 			pinctrl-0 = <&sys_therm_0_gpio3>, <&sys_therm_1_gpio4>;
 			pinctrl-names = "default";
 

-- 
2.55.0

