Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793947861;
	b=MxOyhVexuO9LDM30u9hUJXXAnSlR6096GCkFp1V/RxMX8FWPP2dB9KTaWIItzufH0uGH
	 Z/Qt5Cfjtm2BG1fYdn4Lil81hxmUdEkEoCa01VAP8KM4kInzkkjxaRwIP6M6IkH7BGLf/
	 D8CkkBdNNu3UbaKtp1eOs9LAlex2j0jrPF365KLJCZMcqNruoOLPY8bCgkvZ5U1MYhbxF
	 cGoLCT13CWTXry7SRC650M5nBNTHlqg2FgxwlSyrlav5YDC710oJH2D0AeXGZSl6fPzvf
	 RnlKjbfhVYwEH2zLh3FarW51vXfOOCan0Pd1aFkJmsiuaZj19RVtrCYXfNmuMOwSShA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793947861;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=FgTaumbkJseV8Cy+AMTmURdrUUaRe7Y1v1tbBJFyumQ=;
	b=M4PYuZstDS9N6CnvRGSChaSmC6lZPV66ZQk833PrbDBxl/HuueJXOi2khiGu5FGzcrWz
	 SNuaM2TLVuMKIGfON+YMOsxziOTSrvSonYr6RVT+nNHJQSQoUl3eqK2vOB7/GpZllG+XF
	 7X7ygPISpkV93prf3rW216erHvg1/ylb9hVwSfwJK3X81UtY0bGs2Xot+/bSjDdeOl/vV
	 TeCDUgxjfuzP/qQrhsUOm6tv/A0FoVeYuifA8c8urB0kshWRInNFIAW1X+V02rxwV9SEC
	 0LW0ycZwXIzpc4rd3D4Ci928ApbFGs8TpFV1fqgXwPSxigkOah2fBZg5MjXH7ZezTog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eaD9UBMA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="OXHBAo/n";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D571D606A32E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 06:51:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D571D606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eaD9UBMA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OXHBAo/n
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A63xuvx3775366
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 06:51:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FgTaumbkJseV8Cy+AMTmURdrUUaRe7Y1v1tbBJFyumQ=; b=eaD9UBMAJSVOeRHv
	67OKVKTURwH+iv7egpQZoCg5G3IHE7svYA9zTwuWAMBk2L8ieDGEQnyNDBRieRT8
	e/0L7AvJgHxui7qK/WTCwNpYQfYw9ZwBPBJlfnY2cLYjujLqQuYEi7zvubKFvEPY
	U66nqGI4vlO/vEwfZXqM1N3U8Ak8obddu3W1Ol7EjBHZyF/l7P74qh8BfeTpVJzY
	bGP90fmouxQCKsUedjwT3THlU+b1RiqUE2GLgh/9EFfBvRzet5e2W3BCSz+LMJUS
	r07rfw5NJTBIRRd8QG66cI89PIXu0evuHwVfS4tEwMOWRbR5wO9uhZa+28HihK2p
	SepOiw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9sf9w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 06:51:00 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd5fd34fee0so260848a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 22:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793947859; x=1794552659; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FgTaumbkJseV8Cy+AMTmURdrUUaRe7Y1v1tbBJFyumQ=;
        b=OXHBAo/nMVK2RWzgd3FivT7QEhJoS5LlQP7BrPyVEs7sNY1gj9q0J4tdNdXTweANbC
         8DWzW/HGClaiELMQCuCWLdJrMmb0gr9+Vpe0TKJWejFRnlD0I0x/0JPsA/AzQREzVbj8
         l8l6tKtLjjtPbevRc6TKCon3pGSXE4IpSqEsl3gBLQfpwa45Clk3sB0lImkEH3woehyj
         i273VTee5Gnm3hfU+dub66cWbF/Te4XK7D2hs/hyDA7BKpW6K1b3fNz6O+xJ2UQOOyAe
         MIzbfk4LNQw2e/8DZQkWxvSOVBl+0XxGIW7YMrLZLoyDMtA20MfoIpzgs1xTMBXr0gnq
         DEIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793947859; x=1794552659;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FgTaumbkJseV8Cy+AMTmURdrUUaRe7Y1v1tbBJFyumQ=;
        b=mUSVAoCfSsEX6pe73CKA/Z+OY2YlTUpQo4SVaTf0qbJywxvRaIV0NqtrGkRdFPOSk4
         Dej6NagZEKVDMb90W1nFSmZsQG2vR8Kv3GyAGD3JNEfxF8KAM7Y+WSF8VEmgEkU6W8sM
         ebxfvjvoI5NYoZa4a/L/D6Fjh/4j61JMbc17SHkgBR+BlqsZFkuuUHtCJ484oo4pE0j5
         gUIpGxKeZq8sfV9M8cHIZSdMGqiZyKyx5WqqMmxiJPSJF2JRQV5p92MA/xte4EIB+af4
         NyeCD0f5MmDBno6ZjZQqWK01985XMVPzZrOJ0FJ9ZzzxYG1oqKDnitY/xy8XrLGsNMrZ
         8SUQ==
X-Forwarded-Encrypted: i=1; AL+hErEI8F/2BggCxhpTH4CPygx02e2kPM7e/0cZLiEdoPFfWGhgFx2v4E5gmXGeHH3HxefHnoUEeea3mhnjlGM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xcL/nUJ5wae0GQqvmzp5JpOR+Wv5RYbX8JvG/gufhYNTZzjhb
	k0zlacIo34AbYYu7wdXjKdms/JW2+X/pJyNDBtjnjxvGic6ewa3YlgxyWoGtKFT0DCTM9laKBA6
	UgHH9vhZKn7bwDWjMHtVKt8j18VxQXEDD+S+NuCDsdHxiutRPLu4wjsMTA7Mn6zrVD6E=
X-Gm-Gg: AYBFou0gePtam4xZ9gt+ezjoOyHR3JNdlZsoa4JPnWNgOEkGr1cFfgOQyKVhFiyERiw
	1lWotwlvSu6HbyppBEGmKfUCrbgt20LoeL6/IMCnkvwmgjSXloeTZupdx/u1K7HwKMaqWL+6sgs
	L6V+9rpQDvxxUXAjOz+mw/Ccp9aNJ2DDEiXRMAWIkZ0HctomjzT5NtpzRkK5lcd/U4AAI1T6qwH
	bbFMTsBItgHT+8UWCXT/bBAKm2Ln8cpqL9/iyG/Um0LR+0lHWZMljyNnePOte27I8LtCXIdE5OK
	WI+oGgMF4kj6bc1NedVsQaeJkR9JLdw3l4pEh/4F1w5mWotu01huZSjgvhWPfxcjbtU9hzdzE5r
	1Ji0Px0y8RaiKFFdZQJwhEtmOQWV03bHXQBRJfb7SFVfKwwPNCO9TUTkLpUN8hcgAvnal0btta9
	z+PGtQ
X-Received: by 2002:a17:90b:48c6:b0:3ad:47ce:3876 with SMTP id 98e67ed59e1d1-3b0db71a865mr1318360a91.61.1793947859396;
        Thu, 05 Nov 2026 22:50:59 -0800 (PST)
X-Received: by 2002:a17:90b:48c6:b0:3ad:47ce:3876 with SMTP id 98e67ed59e1d1-3b0db71a865mr1318343a91.61.1793947858870;
        Thu, 05 Nov 2026 22:50:58 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b313c0dcsm6597274a91.1.2026.11.05.22.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:50:58 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 12:20:42 +0530
Subject: [PATCH v4 1/6] dt-bindings: i2c: qcom,i2c-cci: Add Hawi compatible
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-hawi-maili-camss-v4-1-d528c7a797b4@oss.qualcomm.com>
References: <20261106-hawi-maili-camss-v4-0-d528c7a797b4@oss.qualcomm.com>
In-Reply-To: <20261106-hawi-maili-camss-v4-0-d528c7a797b4@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793947844; l=1414;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=Of5la7TwZQ/Mgddi78WKNJ7A1AYscECPq7KHX0+sZaY=;
 b=oc0WJiOjPuecbdNW1PjeNotzAGfBEPLfXzNtndxTCk2cf10DpBvORLSkKxuww98qe+zxAI9A8
 lfekXCGU7PsCp9YWcgzQ1PxbW4ejGV5eowPCbBGqQ/1I2hpLJV7nV60
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAyNyBTYWx0ZWRfX1rx9jZo7nsxT
 wbHLopRrIt4ekgWDAGdW4nEvDcPzIh/wKUqoEseROJLMtgPg4e/w62NI1jVjxuFMrkjw/2XDedl
 +jWbLwckGzfXLO15WaPougp2SiIJw1I=
X-Proofpoint-GUID: VO3rlBVvyRJBWLy6vzzzPEI-9x8dHf1p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAyNyBTYWx0ZWRfXwg7KjelwhE5h
 QGjLGU2teuwLk55XOEduThjpZAAm0ACXL4KBy0wi+FmrcB7HaoYWR99CiXGZZNEpKi0TXFP5WYF
 XrBOr1DJMIf6o8Z+EY8G+ng/TMxKS+U4MZtr9p8LMsUFVRMHps/Jt4gLVlkLq0rz33HYKpjROqX
 x9PM15+Obw6EB2kdnWAJnYZFXZyDWwA2g9+lovdIRL9qGJ7YYUtkinSdsR4Rr9tv2kUexa6W3Zh
 WicqIVvjcOZRC5FbJEWQRpOvOdLW436f0ubGBBEJJNPCkt2NtWlkxm9A7GFiUZaobhsVvfwevhF
 MYKBD31nVy3H/JIqLlzQJalTnKer8Iz/kU26nC1eRKctvQzQ6nDbqqEfuB+6D8P+SeVIE/XzF9v
 865+zGqm6OZBYelZ7oVqVDLfQTtCp0LAuSlqqzOH9HexyJ5ygDn7FHbqPeK5oGBXg06lFtaRL4F
 CUUdv8gYVLWslTDuHow==
X-Proofpoint-ORIG-GUID: VO3rlBVvyRJBWLy6vzzzPEI-9x8dHf1p
X-Authority-Analysis: v=2.4 cv=ZIZCCn7b c=1 sm=1 tr=0 ts=6aed78d4 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=AartCDbB9JJyHY4DVtoA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060027

From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Document the Camera Control Interface (CCI) compatible for the Qualcomm
Hawi platform. Like other recent platforms it requires two clocks, so
add it to the corresponding clocks constraint as well.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 1e8def25ec0ec1ef6b34859709d10a2a36fe36f5..b2b4d4bcf780792515ec153c873bace1764fb3e3 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -27,6 +27,7 @@ properties:
       - items:
           - enum:
               - qcom,glymur-cci
+              - qcom,hawi-cci
               - qcom,kaanapali-cci
               - qcom,milos-cci
               - qcom,qcm2290-cci
@@ -137,6 +138,7 @@ allOf:
           contains:
             enum:
               - qcom,glymur-cci
+              - qcom,hawi-cci
               - qcom,kaanapali-cci
               - qcom,qcm2290-cci
               - qcom,qcs8300-cci

-- 
2.34.1

