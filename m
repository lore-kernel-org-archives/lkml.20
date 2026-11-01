Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793563360;
	b=wp7WgMRnRih5Tidh2pNDf/s+PJeEHqR00jOVn5hcBR/wCuCUSNoMvO9VKqOEgvmZt+Wa
	 Jdx2TkkgwTNQfufw45VtgwivrX9BFgsWcwAxwIDhJjDtgGy/0S6Cd7tl+d98sMhbXF7Ld
	 fegvgv7XbShFNQWJrkI43qheUbipW4Q4TypuX3qkbeuFheZXh3/GIT1zICFBNqp/Wl5WX
	 J0n8gNHZ6U6sDdvUBVpEdrQuK3H3nwijUXZFCb1vW6M+NSFAGcf9XCE0EXWoTDK6e32sF
	 lhYL/+mB2aHofCdhNbXwfsdr6EKEyyqEX6+QgK39FTxq8k0t6TQodY9MGRns7ZEtRiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793563360;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=r9kXE3edEuG7texiLMa4Fjt3yBbJi3QC7DKXeD2lXPg=;
	b=RyK6o6fLCmPuGw6scn/VIJzaK4p5h9aBY1QOQS/j5mFsS1DS3XbyzxN1P+f49qK4BYrS
	 PGuF1Suk4td6gAvNTle/CMiaxyd/SXlBRKiefa/LzEjZAjUgCKWnYuO5chtyFltbCdJxa
	 sln+hvYU4cCbbFXDDIGln4Ywf3WHag/607p3vmexE9MGquZPtRn66DHGGtiGDIs4BRCqX
	 Cnq/1BFxT9dl7PyBUb74sVPlZ65jCAAucZ6Luo6bYYD0yaYXWO98NcaBmixvvQmJTZ3Vu
	 dX6uG+gYzTcm4d2x1on7ATfwsoEJNQ2cISQpoDWBLahrR8+D6LSyCsSG1XjWuyRZcqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RnrS5jaD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UzOF0+TP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E98606A335
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 20:02:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38E98606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RnrS5jaD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UzOF0+TP
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1HQa9k1100271
	for <linux-kernel@vger.kernel.org>; Sun, 1 Nov 2026 20:02:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r9kXE3edEuG7texiLMa4Fjt3yBbJi3QC7DKXeD2lXPg=; b=RnrS5jaDMLFh7yHb
	FOvBqHQ6sm9ULkxVT77GWRj2czp81Wf8heSGdy5Ptog9z5cO5T36BxYcY+/0Miuc
	UqguzFzwPRBlVyqdDjlUuyup0qkBKCeuUZwgPmpqsnT9JWPS9jp827eSETH0I6Sv
	lrzdYZ4irG0o2n2HYj4Vc6s39gt1klFRI1dVRyETAARiIetbu8Nrtg/tJLWPf8xX
	28qAUuisyifYubKnhQsSRacC7gS1xzlKjLonJQmQN8OpWfUzHAh8Np0ZkdZlkxIB
	m4id8oYhSwed+zqKxUz63I8JuQVJ86NSujmqBBeN4PpuYLNzsXdnGNJXDs2CME4n
	wZiE4Q==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7nfv71t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 20:02:39 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b2d1b27544so13204837b3.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 12:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793563358; x=1794168158; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r9kXE3edEuG7texiLMa4Fjt3yBbJi3QC7DKXeD2lXPg=;
        b=UzOF0+TPAclUTvLux3kmfar40Ay7f7D0EFJC/28AjBIhRdqKtnL0ZnrYuDtSJO2V5b
         Okb0SKcVZ8CP7NYyA3RJr3GUYI0bXLOKZmWobK2eFM/g6VOyNNgZm8jWJ4lFJqDkRjhW
         GjWgcxiFiVBQPlI9bAqD9AjW/PM5iShEQxBB1bJvwSbglDoBmE9Luf8KR9o144BTZNua
         sPh3sT7eOTSdjE/f6spqYeI0qr872n3fGBVnOSFuLgvx5YsqM1+We9MFmGAXxGfa+x8E
         nwxuCxJf4nFkyJWlUIXhVX3488Bo8+Ld9THs561fE/kUGc6+6Zj6HrTMWn9wvzywnFGc
         xrrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793563358; x=1794168158;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r9kXE3edEuG7texiLMa4Fjt3yBbJi3QC7DKXeD2lXPg=;
        b=bR6netmR8x3XuD/3iXTq6UU+ZhlD6ZC2/4sacyMZ3aPo+hC8WWwOToon1CCOkOAU8g
         hEn/QA2HD0jymZ/xn5+Ha1HT9Z7pP9urC0FonLpUQmNeWdpr4tSgt1vGFILyLLa2aGlH
         ithm0HFwY9QKTwYVwdc/3jTdHYgWOvxo8Gu53P3aiFJq90Ucj1tEiqfAYPMn6LgvYpLE
         iPBlygmKOowwVIZ1bRrEOKk7XucJof5vkzO8j5KUaNhzts5TSXZ69HxtybjT2CctJpcl
         9/ImYhAvXLZvol9+3plxU7TwVOv9gp/VzfXx9ljS1SXVoDR4llIHhWVQGEyggDzMzzOY
         B4ug==
X-Forwarded-Encrypted: i=1; AKwUvBw4SyMVRQMHGHEMvdC8X83hOzoL0RyzNTiu9nFd2YvWL1D/djTz8WTF4RKBZ8+ZfqOVk9Ih1w2vdChR4o4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rglBsCwQni3P999rJ3oCYJcMTOCL+0Y93RH2z/g7naaKluFau
	BzdjLjZoakCev2vi38mFFhzk4kOAoFT5nreR/3LkWfBnLp9MHnVoUWgXx6UcIojuLt8Y9E9qX+E
	2AyDvpv3lxEWKQ3JYjDCsr2YCmVIT0RiB+i4hX9QzCDZS4KompXt/zdI4YhcZC/dyFvC1nzB/t6
	g=
X-Gm-Gg: AYBFou15I1n/K7UBjENrR/7fhKT+vHJdKJEOIwqqzuVx4tXg3AzwJYev10KBWOc5biV
	hS8VE+zO4OP4RprNCyUE+IX21vQQHuh7ZDLYRWTc6d0OaCTCaWw//6xPDGTN+UuKwDDqMy0esqn
	MC3zuFmx7n2vv21G0MoLGx0/vmayy3HgZVY0MOtdDkj/UCUlt+cNOK4i12DNqBOEr+YycYd5dDG
	U3G7Rb5DEXiy89w8J1i+bpsP4OEynO8vOHWZoSaeTHKIPu1rKrpcGgKaMWgXUVS9G+noXGro3Ak
	7f8S3Gjt+iwTnd46uY9FpmTWKd14T9Sq1MmCQe+z90wnmxE81FYU2dIkZsewMEOqy30oeSUJa4y
	pBnjfbkwvpz1S0h2/hF2Jfh8UPIVSfGkaF9x2JYieEBh9xhRHIEDHjKkNXJAS3bzyBA==
X-Received: by 2002:a05:690c:ee:b0:8b0:a957:80d4 with SMTP id 00721157ae682-8b2b66eccf9mr38371627b3.20.1793563358609;
        Sun, 01 Nov 2026 12:02:38 -0800 (PST)
X-Received: by 2002:a05:690c:ee:b0:8b0:a957:80d4 with SMTP id 00721157ae682-8b2b66eccf9mr38371387b3.20.1793563357976;
        Sun, 01 Nov 2026 12:02:37 -0800 (PST)
Received: from [127.0.1.1] ([2600:1700:b450:a0df:c754:9665:1e1e:bbad])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b7198c65sm41034807b3.36.2026.11.01.12.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 12:02:37 -0800 (PST)
From: Jason Pettit <jason.pettit@oss.qualcomm.com>
Date: Sun, 01 Nov 2026 12:02:34 -0800
Subject: [PATCH v2 1/3] dt-bindings: arm: qcom: add HP OmniBook Ultra
 14-kg0xxx
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
Message-Id: <20261101-hp-omnibook-v2-v2-1-1b99767deda0@oss.qualcomm.com>
References: <20261101-hp-omnibook-v2-v2-0-1b99767deda0@oss.qualcomm.com>
In-Reply-To: <20261101-hp-omnibook-v2-v2-0-1b99767deda0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA3OSBTYWx0ZWRfX0Jl09Uya16cu
 43mNjVYBk05uvHtwSz9zXLVG87RO+Gxf0OyPFv00HxDzf5vQQJW7VpZcZtf8bJE239LlLTq+8gp
 F+OIOlx+6tNnmstsrnszw334j34zZB8=
X-Proofpoint-GUID: PVT6Cw0nC70Im_byJpkJr1ix8xxZ2zsk
X-Authority-Analysis: v=2.4 cv=FJ2OVOos c=1 sm=1 tr=0 ts=6ae79adf cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=ryRoqLvdJD4GBdKZh0kA:9 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-ORIG-GUID: PVT6Cw0nC70Im_byJpkJr1ix8xxZ2zsk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA3OSBTYWx0ZWRfX+DpnFC40fZUK
 jL+ziZTJMoqnWnQiF6jZlV83Ax5ryBZdV1hZuABhS96uIRjRrZ4MDuzSS7Apx4w4u8xHZByxEBJ
 Xyr3vA29d2qgtTEB1bv0ZWAX7qxoFCns4y0eVeh5fVJaOn7eKo3XndMOpPjxHvMzLE3KEtzngmZ
 oDh6iHrC6BhH4OKQxmH4LEWfBFrfgpJqBnSdCu9oK+uOoj3aV4ll79qNyK6CFnXxoJU+GWtoMKU
 fbogt7bp6C7NseBIwC/2hFBKgsgVL3SzUBnQBysK7ykqj3nMiFqZKo7gTBkmTOQDxJZYEXgXUJ/
 zlAH78Kg+zmFqZHl9YQyILzqiz2jKi7y6w5eug6V4LdLDDD8/6OWYWkv7NVg1as2RVNamxe2eT5
 U1W14pM8PXfPNt9ss0RmyRmIzHbairrySyCwxPenmaix9phZW4gZJV0i/K+zpqv3iYOQgYg1Alh
 IqYVlzoQgvnR3xLZm3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010079

Document compatible for the HP OmniBook Ultra Laptop 14-kg0xxx, a
Snapdragon X2 Elite (Glymur) laptop.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Assisted-by: LLM
Signed-off-by: Jason Pettit <jason.pettit@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..ff30fb4a91cb 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -89,6 +89,7 @@ properties:
               - asus,zenbook-a14-ux3407na
               - asus,zenbook-a16-ux3607oa
               - hp,elitebook-x-g2q
+              - hp,omnibook-ultra-kg0xxx
               - lenovo,yoga-slim7x-gen11
               - qcom,glymur-crd
               - qcom,glymur-qcb

-- 
2.47.3

