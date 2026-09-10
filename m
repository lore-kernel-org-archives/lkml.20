Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4321495052
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789046987; cv=none; b=rawZh46lpMTbg4cf5cpvCRjQ4Ut3begBqktWveH91/2bPWRK+d3y5jknhx6yHQQbknzhNcjp2MwtSt/ZwC37J2KsD/61N1pydlLX7UZjOUN9cNb14R6UqGjiN16COgoc4GtH4BHXOUQuPhqFEDkMYXmHMB9gWmmiG/cuF536Bo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789046987; c=relaxed/simple;
	bh=8+4xmLOkorsEWAkmC/1FUibHOZhU94NEBX0Mwvgx1z4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H9RwY9xDYrfEzx2vsKnFhQQnPIGgA5l2SgwbU8iteQgLY1EDAQgNBU8lCbYceU6aBnPUBqN200XJAho+JzZvFQGM8Hy17R9DXVlYIeeuCwm0kiQLqr441pJTeqx5dr0wVZZXZakqZjVxUbgw7C9pYd0rVN8n6WkYiWnIWizDjlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QxKDa6k5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AhySwFKz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QxKDa6k5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AhySwFKz"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7ZiM2029098
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:29:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3VP2laIwY2KMI10T3FmBbFvr4EihrkUSqLsipKOh/v4=; b=QxKDa6k51P7V1R54
	60TAiWt4ItSeY1EjYmpFOAbN2GQMJtcaD3wiwrOKMzO4ASBmupPs+KEyKN8Pgw8t
	rf//jOYPrRVRndwHK/SOcczOuhfvlyNIiQMWyEN4R4IkgUf87dh4WOJtx8VWMM33
	lu/XurP7td7KMCPpf5LoCqrlRUv0mAbX1f3iBe84gAU9xYffFE0OEaJIwoDdEPfA
	uiSGbbeU7EXz7wjIBcgp/YsY9fBG8TVl95Ya34B4BmVs08Oisjj9E3NmIQYOWO/j
	GjrfAeaGWbu/BBRgQ4JX0ODmEMQCgtnjHW+bjpQoaqdZ0xuxS+8+AVCQJJXbMgbO
	Eja7MQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyhc03d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:29:44 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3965ba1ba3eso2917143a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789046984; x=1789651784; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3VP2laIwY2KMI10T3FmBbFvr4EihrkUSqLsipKOh/v4=;
        b=AhySwFKz6EquQ5kIKPQXOB37UO1MVryBJQykDwOjoxA+nlMPyGCRCELVl9ix2GjIzK
         gTQvqOUD0is4Ze00QDmN9BydC/XYAB3mz3vd+cEyGplK6HLsW38/PbJEsducpUnNxmPI
         f2QlaFQmZKR8+b4HiujpxuqhOE/XMSVXljz07M/iBSLCg7o+4hTCdZaRuCwzuhsIJ8FN
         zV+6yZuAjasYy6DI9vvO45ZQnsafUO3I60iCecqvaBmuHOYonovrbUCoaBU+JZ4om43t
         qQ82L5pykStg2fykfkeLDCvGzHxjnXUCDIaTgNI+P1NhvrcKk1AS9J3agou5iNQQjKNb
         27rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789046984; x=1789651784;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3VP2laIwY2KMI10T3FmBbFvr4EihrkUSqLsipKOh/v4=;
        b=snmg6NS6ROHdLB9V1PcG5eFdshEalB5bc2Bgq/WFG556cN5nJqEnsYA/C9p+hw1hY/
         dZtvIOMKFyP0Cd4qcIlHfsExm4vYv0W3nb8w+2fV+8xFu/KoFn7hfTrcp6rAlTscNl1O
         yA/dI5xpnjIEVOt1DyyjBoj7oc+QJ/2Zeyj2agPSMcez9It3Pnj8s9IFy1/dUAlgMG+F
         GC49uO1uGm2O/xoaTv37q0WxnGI+yzHU1izjaKR8lWTQ1FlsXJNF4g/cZ3xFnZsGt/cJ
         kOzsIO1NbCkklPzh5nbTwjP8FaoyvMSek3mMhxBZ9XQPP4ssRrgAtyzbnngqTQQd1jUx
         E6hg==
X-Forwarded-Encrypted: i=1; AKwUvBxDtG6Cdhe4UqXHrHsFa5HXLsJ0FQp5oso9ZL4SqNV9Q8r7dI6D8LJyzvqCvVaqSl3OGfcqX4lUd3031WE=@vger.kernel.org
X-Gm-Message-State: AFuF++lxuqBeCTcd4D5lVhmOPOyIKvPja7W3CtJxaxtVlPdzMnb2eJkc
	j25qEoVyZeqYYHJ/LaMWLnZjP9o7f1JMI+WxS6ISDG5AXp0G2/wcjf3oSDorI+54hPOlwMM/Oqk
	xIUhmq1Q5f3tlug9Det7U3lZcyWUGR2twfwcl2dEcB/aoF7kS5nN/25tYV7EGSUCnIA8=
X-Gm-Gg: AYBFou2iU1siA+6NR5bEpLpk7pLeS/+R6Eop8zD6kOPoumZ80/hlQPxFTSdN7a4v4Mj
	xgGwZG1mKED6g5AVQXuvRSVtBIU3N+fTtLG6YWDz0KABXe8FXfyaeT9CpXXyH29UCD5Ti3y2KWs
	nWFTCDKXzZ4ljcOe0HN9lWhx0bZexoxrGvWVKBq5dBpUl+E5jpU4P7+UkeZ4i6zOthVKsD8QIdi
	NT2gse+yIK797qfgmuurMu9vNcBTR+WSQZgWiH37M7ADjLOY/GHNwTQgI0endDw5/nxRLCCXuSa
	vb6tj0fXFqhzcqCB+7AVjFsL9e3W6Xxi5FJiMoOa8CtkZtk+MEPhmaHDerM/AFMqsVYKioWCPWW
	7B6d0zaPAPSvdEbOoGZOBANDOjDUYh73BHd0=
X-Received: by 2002:a17:90a:d44b:b0:398:d93a:b343 with SMTP id 98e67ed59e1d1-39d709e7326mr12719561a91.3.1789046983417;
        Thu, 10 Sep 2026 06:29:43 -0700 (PDT)
X-Received: by 2002:a17:90a:d44b:b0:398:d93a:b343 with SMTP id 98e67ed59e1d1-39d709e7326mr12719490a91.3.1789046982982;
        Thu, 10 Sep 2026 06:29:42 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:29:42 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:58:57 +0530
Subject: [PATCH 08/34] arm64: dts: qcom: sm8450: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-root_port-v1-8-90a252ddbbfa@oss.qualcomm.com>
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
In-Reply-To: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=1321;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=8+4xmLOkorsEWAkmC/1FUibHOZhU94NEBX0Mwvgx1z4=;
 b=8oAYFNZil821doteGcDLsZWB30la3Nbwxl1GTzv0s6CzC03wosJausEjEkmd3a0NZxTYsC2lT
 ZVoAK0SARo9CQsGWy0s0SjgZaG9wdBsi+VrsmsfpylNIGyDDQEk9o7+
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfXztvHeZYJrM0R
 Ecl2E6P5dT9ByZKeBasonhltDOuEgwuqb8F/fmHrL925Zt4dg/C4jj/ifGsC5hzqAxN/nIOwI5X
 x4KTaM+ltTy4yUqKnA80WjbEV0OpY6jwh5E6XZWaZh08i8/GGDyHWpyjtvLZR9XK19BWwkngjEa
 hzKy9LWGvLeepsxArKCVL1sh1+XaLKq33jsikmhxubF2ytw25afu1DkYajo77H9C/BGGi2+M+RP
 3U3vM/hHVXbHr3Y3EbEIHAcXwUeLd9oEC5W9EYiiOXtKlnwFj47anqqqwWsywq52cat5owuBavQ
 5yPI3QRjcb9mDqHvH4NEzhI0/DCYdfENLP7dh9Hrbd3JGc1zTiY0HaFFF6dX5/V6sS79PF2FdIE
 Huk+Zv3VLcQUR7T/hreJI57qG9vIc3h5jC+0sXpyyCX4ROPpPRVmc2d7PgLLUI9oSbc1y4uC/TZ
 JuS2jUGNe99TkfB+SlA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX7aObeWPp29A+
 eUlDc/g6zZ7+E9pofKkS/xbZjveyaiQgriOP7rBPgIuUMX73ip3d8eVfDFX2f5dFXsLK139I6ag
 VBUfg8nvlGR433kStnYdFJJIbaiXX3s=
X-Authority-Analysis: v=2.4 cv=YKgKWhGx c=1 sm=1 tr=0 ts=6aa2b0c8 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: WE5xPjbsY6-lKHYlndD0NYAoduKakmu-
X-Proofpoint-GUID: WE5xPjbsY6-lKHYlndD0NYAoduKakmu-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100161

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index b8793482b181..7bc5f85e7ebc 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -2021,7 +2021,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			phy-names = "pciephy";
 
 			perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-			wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+			wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie0_default_state>;
@@ -2186,7 +2186,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			phy-names = "pciephy";
 
 			perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
-			wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+			wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
 
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie1_default_state>;

-- 
2.34.1

