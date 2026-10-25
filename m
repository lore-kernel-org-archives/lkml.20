Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792898249;
	b=1aR+nNSEghp6UUGa+zAG+K8ArDI+C5gz2pMnZyxVPoFOf96q50NjNLngzkZdzYDyEcy9
	 JxGQXR2oJsLEkcUNe4gQN0ojJ8EW+OfkJ/5YdQFpjL50goEhDJaUV7EK6pyRyAaRnAZfN
	 iFJJblvnzN/1ZorB2Kohw2uvCv7yb2UtUexy0WvxdQSAMI0f3h7U4+dxhcKvvNMGw3tmo
	 aFI2s4qjGdNsVplHIFR6kbysrBGwRilcIQEbtxIFSmV4Ir9dahPSfDw2r2U2ss502HU1F
	 9oIjs8atNikojAw32H9PRj6wDcVth9v+cU2B/nh1cj3I4EWUIspC4xLdPWOJT7emWiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792898249;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=;
	b=OXHu6lcVpl/zvl/3lv+j0RoyTsrPTNzLOftBTubuWn2vksK7vrUTEaLRThVr6lxPOAVY
	 XXNsevypkHVUHT+iY8GyI8xPyuXoISpJSBlRUYkkC6syfh6SWDnPs/MCmMEM2bSp6leuA
	 6hwnztPiRJVIq5+3UVmwxcY2VZJ1cIpZN8ON8dpTmGYBYLFY32J1csfRbM2AWXMMrxXea
	 kfLH/EOQvSAX4TQoYFYjn3TJilniBBbXiuTtNFO09ITkFTCRTNfaD0OjaWztslf1XjQ6/
	 smHX7wWQLLGMUPM/kDEBpkNpXerpJa41AQFggwFWJSpWTgZ4bMWnlLpFREPFgMrgxnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="SCzBh80/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hqnEsjiJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FF0606A326
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:17:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86FF0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SCzBh80/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hqnEsjiJ
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69P16Js52776127
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:17:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=; b=SCzBh80/mzYWZPwR
	yd9O6sltFqAZzsIQLIesE0CowOho+t5yQXE6m5mFKGspS8Fi2PZ7cm7zhyNR93br
	VVz6x5pz5LK20fiwBFKqPuyPjR9EwpBLbbng1bTWb4XFIuK1FgIoCpAjwXcksiGy
	Y4Q0gh5mcEQcYm3AmQDrlCk8zHDSrAnDQlIp60mHoX+1g6l4wwrkrqj3XtruHX+U
	sez03Wp8SqJOKLVKY5uDnZ5uTGlCHNYG10IP6hz2fDWvTDvABpKYxyToOCHDRpqq
	pH7asf69nlE9oX0TN0dBCsjGl+PUj3ZWXGcowljRlCChzU/WVGWBzlhmkMSvbY9u
	rXbO9g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgm0gjdh7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:17:27 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3662e7a9299so10033199eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792898246; x=1793503046; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=;
        b=hqnEsjiJb2eGk6oh+WKwPWAJ+ZsyhtPjioK0Brme648BNHumSFaAQbnu3YRNRCrBgQ
         gj3CfjrS2CAPnpSSiqJ4eWPfkiEGnTKFt3FWk0bFPV2mDRfkSAr+tVqVbGjfLX2g65ap
         nPysUk07KqG9k8pEVMBOGPPZfBHLEyns1Zu85/F2Z7uMpvDp9d3alfq5Nkl+m+IPoBwg
         AvplkniiVRbq7tu643oSpXH053Y24kWa9Fu4/BbKd7lNsKaC2A5D627qOiU7BVjNpCWM
         pQXCno5WHPIZWKhK5csAaGULbjZlVJ0nSEKxYkjc37znQbqa7DGOStQPk7BXdMmFhj3x
         ULbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792898246; x=1793503046;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=;
        b=RWIqi/sTUbYPQ0wQU/Q0SgdSnDEAOBKUC+DFhc6162vGcBjjmPULe+rm8/PB1YB+e3
         MiRqryjqEmc+pGg5xB/IsEEiamVheBGT+sEzRFAbr/01tp0L9oRevrpPuNLf2q/upwPc
         xVAtesEM72RZCntIa9zYOPGmMxCrcewF1feWbiNvllJ7kCbzMEN9gy3tYCA/fojzC+LC
         KQv81DLiTHkFPzhj/whoLMB4TC+YQRW6otoHxgQLwBVBExYB/CBoYQ4xDqZzkg8zD3++
         zfywCea8SnjrPgN2Vns3YQi6m6pG94fKbKeqBuf8Xs2ZKZCKZpjclkiDZpZgfvJuhAKu
         bgQA==
X-Forwarded-Encrypted: i=1; AKwUvBzxPGq84hg1SQPPHb7kq66SW0cXwTkT8W0MAAV2OnmpuKsl4TWcGdZqfaYR0D/rm/a6XQVibh+/3NUkNKo=@vger.kernel.org
X-Gm-Message-State: AFq9FYK37pd4BHz41/EYzr++6vG0qXA7r2zogcEoQlC/s8H8Bef3L4bv
	IWyPrNBULEM28trmYThDjMEo8RsrNiLyRiLIDV7TBIDl+LyiqSca7qLFdwBp78r71Nzy+FM/vq3
	5o6vYzxyeS+m1Dg07u1M4aSrtfQKgegKchgg2iocFQK5J6gCZ3Dzt+5cWvwOOFHvU/2c=
X-Gm-Gg: AYBFou3W6cydIuI9mG5sU3JHc6PFDHNksYRhjr0cVopCHOfLJ5G+SVQ13Sz4BdkCA/E
	kvhIuCKD14E89iDwu6uFCdIGs+DWbjewBytSC4Zqm04edcCCi5JOqgbdJRYXowB7ykPssOKoR1F
	phzsAdHoNm4PmfNMBipA7DdwfHTpoTcgUmbssbGLvwbVPXD/5YWiqLFj0wJJ/UZxB4/1rT9zIYf
	GCA+N/jdMDI9Qd6VMKJDRHcwstrZ+0rYKeTX2SOWyNhd9ZV13FMl3H8ZdkdaUnxmX+ltwIzE+TE
	dPtqnvHAeVwri4v5K3rEKdLfpMPsksQXfszE2KVkbn0N/e512tst4Omhtv4knk3IPdXC5Z5g/LB
	2hbldQVNQmcsdVuHIMExMdQwmfao6Wi8/CiyK30UKpON9VQbcSo3Rg/dMUVe2c0YE1DsFQgxbOb
	la+gWqtKNE4A==
X-Received: by 2002:a05:7301:2b06:b0:360:db68:3264 with SMTP id 5a478bee46e88-369e848b8a6mr7536789eec.6.1792898246472;
        Sat, 24 Oct 2026 20:17:26 -0700 (PDT)
X-Received: by 2002:a05:7301:2b06:b0:360:db68:3264 with SMTP id 5a478bee46e88-369e848b8a6mr7536761eec.6.1792898245931;
        Sat, 24 Oct 2026 20:17:25 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm24133054eec.23.2026.10.24.20.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:17:25 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 20:17:20 -0700
Subject: [PATCH v22 01/14] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
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
Message-Id: <20261024-kaanapali-camss-v22-1-7da3ea49c8a1@oss.qualcomm.com>
References: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
In-Reply-To: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 7rYi2hEL727j06WAIE-0yJQWyarXGtrV
X-Authority-Analysis: v=2.4 cv=UfTE26SN c=1 sm=1 tr=0 ts=6add74c7 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=mZPZtqNPFm0sPOGUM0AA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 7rYi2hEL727j06WAIE-0yJQWyarXGtrV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfX+Pr2UsGvpYZ2
 8xABFquepM1XnmsYkSAWgr/tse7VU4/4FDNaYpz0E/iB1woSWQokpzzbcZJymbMIDFMJ8BHDoSc
 oqGgqUpd5jCrI5MiEwSEFLy2h48dhAJJeDfYlVZx951UNoaE1E3PJQpdK7og+6mcCoXEm4Uyu7A
 QSyNZin1Sfj11qgUn/8G4JWSiX4ciN9IAkcKkdIhgcWOpvGiw7Ll8RVIJUU7Eo0Bn/0M9pbefpt
 YZBc3POr40edSBPE3ifn+HJN044+qvZyF/Zw1nQGn0TpJPRlTeiqu4DV6FCD7yTFAPADsxXzM/C
 xIFirmEnQYCbDwFFNRMcfCxlAQoDJwFJs5o3Qz4y/rNIC7uvz4wHXtn+tDPAFsP0jBw2znTrMXL
 6fLHBou9K0uOusWV2+iyzQhOMasJW6jrx5aRtfg65Zc3JX7N6XBKCQucjO29IiRxFRWHQsdGlHB
 Yqjjc/OYihgv6g/7wsw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfXzpPr+14a7KDJ
 wdaFJFt3lqJ5aAwLdr+8AvF28mkxcRmOsXT1r8YKgch4z6tgO2KXrJJTE4SBNUFME3lJW16zUej
 LQfBJW1F8qPReV+3d9B7zs6/YD5olZA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-25_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610250012

The Kaanapali CSI2 PHY is compatible with the existing x1e80100 CSI2
C-PHY/DPHY binding. Add the "qcom,kaanapali-csi2-phy" compatible.

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

