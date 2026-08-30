Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7588331ED1
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 21:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788126981; cv=none; b=Sd4Pvvh3wP8l2TisXLC6HMS2GAfCYAzhRgNv87bnySwiQhypaGwuTI1ZVPMAeDsxHs13RZg+gZ9qfdgr/woF+Otk6amUXSFU4a+k+RQH2fDBkSETX45HwLeXL1YcFxTuWs15ErjzExRigt3YXZDjMFAqsrDxiAwAYmXXKV8eLZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788126981; c=relaxed/simple;
	bh=i4CDdS3NcaboDh4PbI2lZHqoIEVckwLxgeEcZeqa8uI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c1SSrleaSQZQjtMCsO6NW/GT8Y6rIAV/ajyISnVd1Sg78vu2x77bCsiriaa0jSRzcuB7NSkuQFmMvqBu8sT12mnpUOVsPoA1Ix7QYvUqNdeeBWPwKUK0nfmdeGR+JxoPqTG2l6wEZtmr5YDRn2OseTzbN2ktoNp5N3R0WtrfgT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jetLm8vq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jTf9jrME; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jetLm8vq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jTf9jrME"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67UJJWVY1551541
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 21:56:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c1H2AhsQHvE3EqhoZHqt8ddGIg2EcZNaEJyzrvAhEuU=; b=jetLm8vqS1vYwW07
	FxaC1ySiTzEbxsVXfDZJ2X7twO5/bbNMU8/+QRwWQI/sAXn2aoRhDtC9KYuXgMh8
	rxtL+tvwh7iFucVpPzuHBJTRGmxXbd+Z5MqPS3EFqgzMQnsii4TSRTC04/QMkJNn
	+LxHfL6ametiqQLos/TG01kC0LBFwAVUmAJcVNP6lVPK2SJ7xKbFfaL7LbUoLnVY
	1PUeqHEMLls8X0amI9ekM6+Gg2kQ8y5L5/mMPq3BWT0fzd347RxEguarGzmDOxcJ
	qJAN1OPGVGB6Nd7TRzI4LLEZfo8DzHN1nOOzm96okLY8jYskAUG0ObNl+IuoGrOg
	n6Iopw==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqgykskf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 21:56:18 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-836c416b236so40387957b3.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 14:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788126978; x=1788731778; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c1H2AhsQHvE3EqhoZHqt8ddGIg2EcZNaEJyzrvAhEuU=;
        b=jTf9jrME7t/CbzKfXOEzQ9+kOc76SoTd5qNRS6W4Qa1QBWIDsNb8LlhV4r3/IVV7Y3
         DRHCXfzq2iL+dLHy+GicjStGo7fUZ8BP7xqAz5Mu/umMszYZuTqYMHU06WAOXzWqjFbB
         qK/lMVvtzou1lOMriQkvredual1eltjD+wOVqTC/nnow0k9YN/bpJX5GymHP05gZYFAt
         aXUPTa8nCyZRRcCmIf+uT3eWX0JRADzeny+NY30vnbP9dCWjy9eWYRg2pX3gC+Js2mKi
         lCpt9UxTpmCpVTyR5liQiDeheJ0mBI7rdY//zp1KMCNgINItaco13NgzKHXxq+D/XJPR
         T4WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788126978; x=1788731778;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c1H2AhsQHvE3EqhoZHqt8ddGIg2EcZNaEJyzrvAhEuU=;
        b=pqwC85UbYhNG3D/VC3jteyib2bwRpNyN5/hHWAUfUlsTI91eeOBorvRisBi2yhbP8a
         o/C3ONsmAIPru5dCPN95+whrdDQT4LpK0daS6uxOFeCE3lfooB0Q0VCZ1ios37aFvfhr
         b/iRmntTfDDVyNy+YTlz+4Xx4cFDNqAKuY9lGHDh0Z4nPXa+lI5EDlkce45IshSIkRsw
         obf/av2jB4F87peRD6P3b4DAhbwZPnUSVVMv+ipZdnqIjSV0RAr+JRligUPMYIid8+n/
         66o4hFIVkno5az7OuDPsVqdcaOSyZpd/iC9B0/VfkSONROLnsOLAmL3qzC2t4K1edgz8
         x0lw==
X-Forwarded-Encrypted: i=1; AKwUvBxGAo8c5DQAnd5fLLgcI1z/ckRqTrpjFtw/AE5TAinI4f31snjJ7Wu9ah+ZLu3mCw0koN9gd70dX6CY3wU=@vger.kernel.org
X-Gm-Message-State: AFuF++l7uezIdsTtenKW1dv9wARhcG9bHhnUpYTXT887gh+TD2gFlsjH
	sec3+OIjJd2IOjlXMc8N8+TVRJ+RRcZ5+i7/Kci6dMQ+n3UcqoL+LM8WvnZecGN4IdDR+KnncG8
	KgsLedAOWjkZTh69jQT3HK6cfeeVk9JO0kbmBbadtj1mxOZ/b3pEbkG+0/P50V7LrWvk=
X-Gm-Gg: AYBFou1YsrmD3RVd8w7SWMFOE9nHc0ZjMx2vBfueFEb2rtXMKQ89TeGWt8B7yxLPQYl
	uodljE2i2WtIEUH65es5U0NibAaHMo9TSE1TWLHM1rA+Xh3Kd9UB2sJJzRh8eElf5yCD0Frpy+J
	Us4GHdHqLGI/9LzW0INe2KSbvB1vcVoPcoCZN8L0N0hGIUsSCrDOkb/tgU9By62RpdU1rAWtpqd
	R9ChhhObiq57MbWhLPH63P1rN55WGjmVP4lbwp7LjXgeX837c468opF2EJ/QmXbrNTPbNR0hHPY
	vOERngrbySXbp6+8Y7mdb9QAU1+MIDn9/my1wVyGC2LeRasQhzDrREnEksFe8yr5xNhKt4g8gkA
	DNcM7bNgXY0XJn/bZHA==
X-Received: by 2002:a05:690c:3181:b0:85e:6840:4ea5 with SMTP id 00721157ae682-85e6840633amr54853507b3.26.1788126978048;
        Sun, 30 Aug 2026 14:56:18 -0700 (PDT)
X-Received: by 2002:a05:690c:3181:b0:85e:6840:4ea5 with SMTP id 00721157ae682-85e6840633amr54853377b3.26.1788126977652;
        Sun, 30 Aug 2026 14:56:17 -0700 (PDT)
Received: from [127.0.1.1] ([2600:1700:b450:a0df:c754:9665:1e1e:bbad])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e5ed1dc88sm38268857b3.19.2026.08.30.14.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 14:56:17 -0700 (PDT)
From: Jason Pettit <jason.pettit@oss.qualcomm.com>
Date: Sun, 30 Aug 2026 14:56:14 -0700
Subject: [PATCH 1/3] dt-bindings: arm: qcom: add HP OmniBook Ultra
 14-kg0xxx
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-x2-hp-omnibook-ship-v1-1-9feada71dc79@oss.qualcomm.com>
References: <20260830-x2-hp-omnibook-ship-v1-0-9feada71dc79@oss.qualcomm.com>
In-Reply-To: <20260830-x2-hp-omnibook-ship-v1-0-9feada71dc79@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jason Pettit <jason.pettit@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDE5MSBTYWx0ZWRfX3rOT4JdsHXa/
 26L7nKCkiBhF+UVP+MiQbyeMWFTtr01vobf3Tvb1B/Bg3J59NHxdyT+36JCLtaMT5vQPyd3oHG1
 dsCWJkEaXcWD4Yg0fMetpXqDEm+Qjmo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDE5MSBTYWx0ZWRfX+D84kM0nIPKX
 9GLoSp+JrK7ZOwPv9addqI5K3KJ+dQ7igvi9X0JpqHfRdH7yVxN6djpEU224PoQursJWLK1vkl/
 PiwM9Ofz2km5FPKGCRamXADPbntP0UPhH9/4b3ccVyKsLwddjewiMpugzjSuIKk9OqDOlcsZEJ9
 FyFe0GGsxYgo6BzX5DO2hd49eztYN+IyGI0XnEhqHXe00d3F7WbYYu5eJQ9RTLR3ElhnjU5M39V
 xWjKd/02ebf9+4zMGlavF8k7HILv/4fsz/9XdE/WBRiPGvLN6etBhr+2MchA7aJYwk/EpFVQRoF
 WIW0hPP5m8NUN/dl7XQQygg1AjUJD6+UJccOO94G+69mgaAU+wAj65TujBI3MCUkAU2/+ABaomY
 L3pkfoBBEKk9/GbcQaCIbPPeBUDJoJHPOZ3waoEGhbgV4fD0s4mQJLy2+hJ7HBaG0NIAsRkFSG9
 m/BijoBRjFUXcsvMEHQ==
X-Proofpoint-ORIG-GUID: DoBtvc0m9aLDgQDBSx1SHmgdSYyEwm25
X-Authority-Analysis: v=2.4 cv=R5Ez39RX c=1 sm=1 tr=0 ts=6a94a702 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=PXKRhWy-3Sq0_ZefuIcA:9 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-GUID: DoBtvc0m9aLDgQDBSx1SHmgdSYyEwm25
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_06,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608300191

The HP OmniBook Ultra Laptop 14-kg0xxx is a Snapdragon X2 Elite
(Glymur) laptop.

Add a compatible for this machine "hp,omnibook-ultra-kg0xxx".

Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df7862..bd940477fb24 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -87,6 +87,7 @@ properties:
       - items:
           - enum:
               - asus,zenbook-a16-ux3607oa
+              - hp,omnibook-ultra-kg0xxx
               - qcom,glymur-crd
           - const: qcom,glymur
 

-- 
2.47.3

