Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8831E346A18
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792128055; cv=none; b=j74Y97h+HZdS4/lk1zBl1u4y67UJ39MVb1wyhvUemfekOXs7n8Cv1imp1ZUiVbKk8T/VJNUcawYIBtu6tlUa7opp8BEX1EKhjcc94ZwbNRbDhcMkO0u7J3wbRM6mUsksEhbV36n345oOgYnKkSPHUYFGeN7DpJu1fEdWbStX9ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792128055; c=relaxed/simple;
	bh=SPW0WdfajyH2o2xhaJ3bt7AYFELe4eSCxMl3F57P3uE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=McRhfvV0KQY4iuhmyrW49MQj9tA8Qcr0iOVBrZ1x7/i91n+uD2u+Zqu3o9b2dF4IRWSPbAUdIcjRDA4PYTrBbWgX7LLdwMesOaRXqCJa4REnrrl4DEQHBVwYCA/zWs5xC/7jW8tMz89NbLtrxP/42iUwAloCHCHnYGwqa5nKR9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I6K8tbJd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GaenQrjX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I6K8tbJd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GaenQrjX"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G4GKFZ3462710
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:20:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CMeOnha/3ULmpqySymnxY/
	fHaKJfGvtA31OL5TMEwL4=; b=I6K8tbJd+V+H9u7RSiDr4lOXT9EUXsyVEYv7t1
	YJuUuQf0/K3FnduKIAaZ4b6tVyknbMPziCNL0thh77ex6RaxHaAQ3OrVUj69+19m
	UQIYH9kCREofi9DhG6yH5QbPkq5V2yC8DJay81aw1coz+yBGQr8V7gwkPj6mssGB
	Ymzb4sU/XCaG12F0yN5xtNvypIbVgRl34eQihZh5tj4xazJwVzhUeud/bFl2b2N3
	DU0btvyZU/z8m4RclOcRDoJ6StirCyaJLDdsT6cmCaVGyPaEeHfr7JGsJESIfeI3
	X+MZpsH+tZe9gWt1k/AQZD2v3jKRORgyfTvguvV7B/9hPgcw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hayu6b979-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:20:53 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-147be78cd56so23533813c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 22:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792128052; x=1792732852; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CMeOnha/3ULmpqySymnxY/fHaKJfGvtA31OL5TMEwL4=;
        b=GaenQrjXcnRq9yRBJT4w8hx7kI3GKeVhKYTLF1pofQQ1cNPbcLqxl/1HyyqMkHuSgY
         lrgKjaUuUI9E19eB1ns8GoHu8hNaMGWW+6CakJ9nxW7zE/JXOml40rGPXqhmjYjp+J6q
         gKsv7PrqC4l1gbzur7aLQs/bS+XDAaQZwmy7iUoKZnDdY3aXkJ+z3gvuJifsu2a1BfNm
         4LfrcV3HaUQ8AhB8Aj9qYs5ou+02XDUfuY0got8p/NdkJEpEO1/RcNljyRBW/+giDXoo
         OxaCxt6sGjRy9Oj+07uU1tg+StFnjKpB6CCNYeisc6VSDsnc7ygjeQ8aGWTzPsZ/y5Bg
         XPsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792128052; x=1792732852;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CMeOnha/3ULmpqySymnxY/fHaKJfGvtA31OL5TMEwL4=;
        b=olIOFrOjAqzrGD0uE9CXWUcj2+TCkdqN4yYoZcI9vr8bX4BepF+RcRzznB9rneJXJO
         CVXTJU+33yx7V0p6daBzA4DuG+bilv9CuzEn6SkUWmErLxjozLFmRHoyjWOecOcUbVSt
         0WpElR9l3Eu19MbpMFHU3xSwP0t8sIP4dq58GkIHMkCNjm1rJUE8T+t4Jc0GJGyx0J6A
         hpM+ERCXc8LOu6/MxbMNaA7oYm+xvqaN3EgIi4Qr7UExsLHvyQCbxhg6piP1CrcFfGWi
         mFdiLXZ3phOSqlnq+a+EyFQZZBTVjcnLuSMeRHtF845YcgfCa9QwbpWRD6dKCTQ38vwH
         d+FQ==
X-Forwarded-Encrypted: i=1; AKwUvByLupjdDPBJUST24idWaKGeF9BoHk/BwZAGKhk7zwgjJ/vm+UOM1A/Ms6utXJndYQigWpt4H1YcLJMAfpA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJtp5+Lnrhi2fOZ0YcHVweqFHcy597WbpkGJZplE515PhgGrmln
	sxjOwzrMdhZPERvK63IcqsrgjVkh5AVEoyLK0aQJnU0xPeYqT6J60bYiGX+0BjTGggModTIlQWy
	Heqof+gTNJLJ2aYtGIA4ucVSy5cYRIMNAJggjN3qkgwX9uDWHU5OyDiP59Hndrt9VzB2UOybKVn
	o=
X-Gm-Gg: AYBFou0V8BT0df0BXxiHIx1JjuIS2tZF2uxPE9deMCoIu6xxoR6uZm26Zy5DIc5bJQe
	OBiYNdWtJYQzLUPfy84Gv+4gLcg8VpA7po1CW1vovmSOnrK2XP9YDi//HVHBXmHbdPueYf5zP55
	LqG/gaBpynbKiy8PA8i5CTollUVpc3e4ec+1GbMLfsDWUK3wgPSv32o66uOrZ8DbZNqGZQJD7Vg
	ctO6M0Fc/1V+31F7qYJIlmuYgeaCmibBdyP9yYXJnAZheL/iDmSmyyMl1h+cMiHNyTpo0iRon2t
	4tqZT1DX3E1Vy+gGiK0MlQPHMsGZrR5ZHbNfKprIGdW8ezjLLSmbevC5QQgnFS/ftvZLdzCyyOe
	OP2dH7aW20QfZXdLxa6VAuaxw6GX2nSO6eA==
X-Received: by 2002:a05:7022:b051:20b0:17b:fea8:1425 with SMTP id a92af1059eb24-17bfea8145fmr12395041c88.30.1792128052258;
        Thu, 15 Oct 2026 22:20:52 -0700 (PDT)
X-Received: by 2002:a05:7022:b051:20b0:17b:fea8:1425 with SMTP id a92af1059eb24-17bfea8145fmr12394998c88.30.1792128051612;
        Thu, 15 Oct 2026 22:20:51 -0700 (PDT)
Received: from hu-parihar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36083283478sm2997220eec.29.2026.10.15.22.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 22:20:51 -0700 (PDT)
From: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>
To: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        arnd@arndb.de
Subject: [PATCH v1] arm64: dts: qcom: Remove FastRPC compute CB9 entries
Date: Fri, 16 Oct 2026 10:50:42 +0530
Message-Id: <20261016052042.3755352-1-abhinav.parihar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: AB_4qujP0_L7ExjdiSR1JsCE_rf42w91
X-Authority-Analysis: v=2.4 cv=ff04WEQF c=1 sm=1 tr=0 ts=6ad1b435 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=zYYqb8WEuwc2w2ptBsEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: AB_4qujP0_L7ExjdiSR1JsCE_rf42w91
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAyMSBTYWx0ZWRfX1Zzj72L27P/9
 0aputGI3hKrk4+DkABn2wbJBNr1dzAMHZ/CiRb0koSSq56iCBD484ZzRz2o/2/LgEd5ONuKbyHU
 khKlyG3hQsIX/ipvkONeanfrMLwMrOYhziair8Ae0GLrTQVSTUT2iYfYwnxC6kOThT+P2wN1DLp
 CBP0GTYtNO7KTYusPD3wvRr1GESflh05rP2w/Bc4eLjGdiIAXgXfcZFly8J7loT/8/ch6UAVwKD
 Jfre3FHlt0UvJjSfj1QgM61G7M8GFnV47/1A52/baEQuD8wLFBdmGt0ZsCF0e6RhyWcvbBbsaIX
 y8xl0dm4W2ndASQyVqUKIC+kfJTxkgX0SYVuN/QJbOXQw2cEYxvopOWn/Gp6s+X5srUaE07s81Z
 iKWinO6jm71WHYegZ7tgGdTuXcIvW3ph95ah1h0h680KyQyRT4fGePq0OW8cP7DXhihVKq4CmaC
 u4sXxkdkwJQ9xGo7Ogw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAyMSBTYWx0ZWRfX0VQKc+iqfEEr
 NX3MFLrjCzUk5oGCDJKKilxFijjfurA053PFt5Lna6DSWigAqc+Q/A7vpB9YWDxxgFnze/1Hg6f
 L9O4GppYeRTd/QFgRK/bQY4oIdUlayo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011 lowpriorityscore=0 malwarescore=0 spamscore=0
 phishscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160021

Context bank 9 is reserved for secure use cases and must not be exposed
as a FastRPC compute context bank for non-secure offloading.
 
Remove the compute-cb@9 nodes from the Lemans and Monaco device trees to
prevent clients from selecting a secure context bank for normal FastRPC
workloads.

Secure use case support is not currently implemented upstream.

Signed-off-by: Abhinav Parihar <abhinav.parihar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 16 ----------------
 arch/arm64/boot/dts/qcom/monaco.dtsi |  7 -------
 2 files changed, 23 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 695eae1b7256..5481dfb73454 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -7861,14 +7861,6 @@ compute-cb@8 {
 						dma-coherent;
 					};
 
-					compute-cb@9 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <9>;
-						iommus = <&apps_smmu 0x2149 0x04a0>,
-							 <&apps_smmu 0x2189 0x0400>;
-						dma-coherent;
-					};
-
 					compute-cb@11 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <11>;
@@ -8000,14 +7992,6 @@ compute-cb@8 {
 						dma-coherent;
 					};
 
-					compute-cb@9 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <9>;
-						iommus = <&apps_smmu 0x2949 0x04a0>,
-							 <&apps_smmu 0x2989 0x0400>;
-						dma-coherent;
-					};
-
 					compute-cb@10 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <10>;
diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index cfe39f923224..e73a735f2f13 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -7822,13 +7822,6 @@ compute-cb@8 {
 						dma-coherent;
 					};
 
-					compute-cb@9 {
-						compatible = "qcom,fastrpc-compute-cb";
-						reg = <9>;
-						iommus = <&apps_smmu 0x19c9 0x0400>;
-						dma-coherent;
-					};
-
 					compute-cb@11 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <0xb>;
-- 
2.34.1

