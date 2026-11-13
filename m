Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794548037;
	b=NlzjrZnxtMCDPHDQzw0Xa0uy2dqxVDZ14V/GA3QA/ixz/qTBYkYxSZG/ObX3gwmgRks2
	 4SWPKFERTI0C2Fpnph4PlTYor0384eYfYkefXC8pMQrq8MVLKhArHBJh/opv3ft7YOrYw
	 Xy9qVxBx5862L37n3zCRkjasW84cCZN92qHvGl/UbONNvYine9Iua/w+JIVwcGYH+nhCm
	 5TXqxQhp6lgkbluPltvP8EJlvEELdVcuDKm58AsDH7ibwBoWTZQL27cyrzzcPL+bpk60c
	 4qG0B3Pl3KDE0RTaIyU5u6XqncqfE9q0pKcJZUNdwFXEiRg+RcJzNRDc7kU9lzePi0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794548037;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=czX+scCvulDqANj01Qk8R+CY26BGL/k2NFKRUq1N9R8=;
	b=HdheO7tTmtVrY0lJuKwxjEk+vIMccDNequ+4Qpc/cspWSYzOZsnc/u5/6hYSOv68cXtN
	 AbS+tncowleKI3BJpI74IYbVi6Cw15cOtkQA0jeeAlH2eK4W1fMDeFO+nRv9JvZGeWlhk
	 DTVJbLyjVLcF/yrI8kbLwNJGRxLWo4OH0+MpcZDTFdmjVk0tQmLuUMHMaw2OHb8i/vc7b
	 Sm1MEwANRgyqTM70RKpG7RkL9b/Oh3GQNkY3kUAgYviX2/rHCjHL88MPxQb/qXklcaWGD
	 U963VoZUUbU+St3ARKHyceNIfGBwg3s4mO5eu1vW7xo+A+Wt4k3ofNhLp8MNq1OIooA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZNmtI40X;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cb5+tIGQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96085606A334
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:33:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96085606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZNmtI40X;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cb5+tIGQ
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD57Ag23075877
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:33:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	czX+scCvulDqANj01Qk8R+CY26BGL/k2NFKRUq1N9R8=; b=ZNmtI40XUta6mwHm
	mh/qAmVhftZn/DZ7DEYWNJwDVyzXJj/AIxB8PBaOfRhN+Lj0JUDUig05+bkcCgib
	splyu9LROvBf8WJOCxWFDSElg7V/34r+QfFdwUh7hXcOyXqBh38JOYJRprbyp1kf
	dgY0ANkHPVx8FTwukEAcE0x76NajKU69gr1qrkv49oVXY0eA/Vie4Z0eEtd/ZXsj
	xsJzq3hD/GGGzN4aX7/fktwgM0R0lM7t+r4U/agZ0vUAIVRe5WrYTsrYK0TylbYK
	h0O3GOHIgeTydZveFR2WJLuvmdl6purKpUuRuxYrYQhszDkHl9XdAwd4eHmDKKMm
	a+CeRw==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6re4tja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:33:55 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-4ae40674bd0so389528fac.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794548035; x=1795152835; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=czX+scCvulDqANj01Qk8R+CY26BGL/k2NFKRUq1N9R8=;
        b=cb5+tIGQJz4623R/7xz/bpHAhS9P+r6EfKAEqx0AjL54rkmhXVz8/wBoJlZvTQGIxu
         sqJ9mt4y4xmcEyk/4cXpgKKLXCMeL+Epmq+Cdltyt4ADcTJdq5f/u/byLFxsssq7kbvj
         zF7Wr92KXZlpL7vy22Ez6UlMt35XDCYHX1qHmBthbCepKK5StOZaugbAgv1YoqmU4dVF
         nPnOuFUdnRCgqRXSqdo4/Gp8HGbY3qUyc69iYGXBOrlWjvsS7PPZFRkI3z+BqV6EHswp
         YYiKwC+m1F5B0YN5mSr2CLBaGi0QA+QiVj6h24plhDjhDCWKFICwD3JZpQJBJVT5MM/T
         GpcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794548035; x=1795152835;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=czX+scCvulDqANj01Qk8R+CY26BGL/k2NFKRUq1N9R8=;
        b=XlFzEBpLEdv41N1pOsiCnM+5Nri4a70vlokSiaNQsz8P+AM3fUpUMhBGwQGjnBBBFA
         ozgifj7MoqPN7Yd3siRW2U7qVJepkEbBybOTY5OPdznOsWZEmmetzAqgBphzMuOMZHay
         4PWALsCg3FFVGPktfgx0zdGUWsXHUUnMBBP8/Awl7BjN3WvmX1+lRF4BaTAmsT4rAvHZ
         DTYCGlAZ7KfzXobTO5PmqpGs6vz4FmI/c/Qk0kWg7B5IxG+coNLN7e1YrwoYqIjPNHky
         Oz1n8mvEf/N+e6LdTcJNaSTwsRzeopXG0v75ngz2Ill4s4PTeguizjN+o/r8N0GNucP/
         NX4Q==
X-Forwarded-Encrypted: i=1; AL+hErFX1zKXi7LO/DaxER5/nZHZM+A3X299RBLSjGjJiveQpKz1l67+UE6XgPci5ckQAFpVXEFIG0y0h4Yuepw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bjPfIXl8tWfO01Z9tHb++H/4/wu0oSudPDjgsziHAMX19YP8+
	AGnUm3zivTCWELqxtedezYT1DCuThIF8PCCZzrTO+o+gSyc7DTqsx/YXYdRupcxBHeiYGXn9qM6
	5Web75i6u+rOsFLUK2ubG6imbYfArFfntRimnNCwxn111jFXMI1jOHukIY87rb5e/Jlk=
X-Gm-Gg: AYBFou1Z+5SX0j0sRZqadoKJGUPpwz7DJWZxGR+a2Onbg2CoN8gGb5BoGC5RP7lZ8JQ
	gQLpLmh5dr6adCjP/DpZkG0wP66omQ4frXmKSzLNVmjY2QSwrqFpHsgw79lJWM08Db7Oyksm2Ov
	Gg1x2x1Xi38F+1mGjMUfMowMpH1mcMxpmQXi8X+frwKZHJCznYhYNB3dfco7tmiKoKkhFv8GlDp
	wrLKcf7X8XFLGY7DIaJAPU1zHOznjkips2MczjEcm8uHX4s0KKOIYK4RON92ajPs+cnlNEw9hQD
	NZDaPDcw88cYEEq5mhpG2kWJ2Aa7Vfewr1WcyIlJ/fhzJQN+fKq4r921NP1rFbDL+QjD8BaRsSy
	X86q2nI5H8yVEjy4nAKPrq7lxvoK76su/uRyEbOeYwBmsH8uwp51GmiNVUFV0SXJFAQhnoywseg
	r/4jrP9NYiPtv0vgVm53DNt+xJMXPEpT15kDMe6snfAi8qRZWM6bsqpZsbMVMl
X-Received: by 2002:a05:6870:1d0b:b0:4a7:4323:3fe1 with SMTP id 586e51a60fabf-4afdf49d5b7mr1423583fac.20.1794548035152;
        Thu, 12 Nov 2026 21:33:55 -0800 (PST)
X-Received: by 2002:a05:6870:1d0b:b0:4a7:4323:3fe1 with SMTP id 586e51a60fabf-4afdf49d5b7mr1423571fac.20.1794548034659;
        Thu, 12 Nov 2026 21:33:54 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe22576bfsm803252fac.7.2026.11.12.21.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:33:54 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 21:33:33 -0800
Subject: [PATCH v25 01/15] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Kaanapali CSI2 PHY
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
Message-Id: <20261112-kaanapali-camss-v25-1-1d709f57f370@oss.qualcomm.com>
References: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
In-Reply-To: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-ORIG-GUID: l34ETaCdfHOivd71z6izEe2s5An1EueA
X-Proofpoint-GUID: l34ETaCdfHOivd71z6izEe2s5An1EueA
X-Authority-Analysis: v=2.4 cv=NJhAaE6g c=1 sm=1 tr=0 ts=6af6a143 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=quhYwmWePwexk_oO3l8A:9 a=QEXdDO2ut3YA:10
 a=vh23qwtRXIYOdz9xvnmn:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfX+FNPO/B4OwSg
 TCRbRNO9rb+OmmZiCTWn7YnvqU1EJuQ6YmWBztzJQkwv//ImfgwctKWSYv1a1m/sDmMM6mV3dXS
 Bd+zwpzuDx0pxdjaW7Xei99dYyasXzo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfX0zzeM+XSLaeB
 JLaVpaQXyq0/RS2gmbvKqpNsFYzsa8QVBGVap0qYzPdT048aSbT/xIhdg+pQZY4ciWxCt6fRsaE
 Jx/OaqdWgD/oFvvzxU/G6pw6jXAo/P3Rhrp4Z/DpPneob0WL+u1L/UCW9DNV6rmLm/mZg2B5zTI
 OVgYSBl9sDvBabQKKcUB/Jf6xGqikngp42NllOwhBn8r7VMO2bff7o+VWgYusbRAynyPMxSjjKN
 A6jxjizziukoy0r+G8IBoJ3TQW3wslcsfIL6+FL9+n2CnRVxhYCMaMmj9TwJpycd+wT8ma6A6Ed
 xTwKBj7V66YRFpKkTdH6L5L0uylk62ZWSFtmN8Ce91ssMgIGT4ziQf7QTbErpDwiuLOWS3164Fy
 3rJA3+Q2MB4yFyts4J2IKMN1BfLZrwPqqMd43jd+Xl7kt2rVnxFTcvj6XT5C5jFB2f1lQABVdBx
 /iOAOLxMwRkyoKJR5iA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015
 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130021

Add "qcom,kaanapali-csi2-phy" as a standalone compatible. Its common
status register offset differs from x1e80100, so it cannot fall back
to that compatible.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
index 1f1e2a4993b2..6e9eb8e265df 100644
--- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -17,7 +17,9 @@ description:
 properties:
   compatible:
     oneOf:
-      - const: qcom,x1e80100-csi2-phy
+      - enum:
+          - qcom,kaanapali-csi2-phy
+          - qcom,x1e80100-csi2-phy
       - items:
           - const: qcom,glymur-csi2-phy
           - const: qcom,x1e80100-csi2-phy

-- 
2.34.1

