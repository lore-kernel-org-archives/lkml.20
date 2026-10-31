Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793452274;
	b=Yw1wle4udx47WCbpWcpCMbRD7lVK6Zp2ew7SszYCkN+aXra3IjrwSfsT+d/KsFSPVxG0
	 5RGlPyTUPQH6LmZUyRjEqK7vU1bDC2RF3V5bF63AO9Y8HA5wnqjI19UrQk/IFrXjLQyaq
	 X3ZcaliuD92UKdU6qoxy6ER7DEta4MZ+Y0ZRU02tuhYcx5BWyjNb+c7dWzqvALtZHaq2d
	 go1zntTLtl56GN9p1/fRGRvuFcLaiYn6E9Pw7+X2mLH6B8qnSuc98rfzEHt/84NKkGFVw
	 MGzDGYKDoEgcLGnyT5tsU13udyvxMbFZQKJa0NsiOO8Co5nGH14+5vjTA4m7Ph3fkyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793452274;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZjowRiis49WC5hZioqYWlZTiLLrFCHYTqCaAy9Vq52c=;
	b=NkBBmMysNI8JKJmUrzuQaOysjUCCcv4vxsQzzszl7mYAiZcqcrgf5uJcNtSRzRlhigHV
	 gOhGMnE8Ludauj2WgaBWLeqMdDCT8lsIBCpp/MJx4X3Iu6QxFgUW6u5pQa5adAV3GJhm/
	 jd1NlRKZDf4Tttq6F7wEBuhIMVPmUeOgjYRrpYQvn6pbSU65kwnYMR+apCLqNY1SZPfrE
	 +JhX70n7ooV3f5MBelJGPrqhjLMLCvOYP+dtjm7PAly031vF78Ly3bKOgKyPQl7x/9LmZ
	 Qjy78VY5P96ZHAFh1xFqtc79+TZv+yoOoxBo0djDKk27AWZUzNGgG8aauItP4L3YTRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z2IlnkNz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XkyLmp68;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD4E60A2614
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:11:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AD4E60A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z2IlnkNz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XkyLmp68
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD0i3N2199439
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:11:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZjowRiis49W
	C5hZioqYWlZTiLLrFCHYTqCaAy9Vq52c=; b=Z2IlnkNz5nTuRqCewm1uBBSYzmE
	ly1nW0Hc9e4X7U+W/Gk7hKrvV0m2Tb1Rpbuhzvjw2GJdUHGteLuODn34YWjJdyF1
	sWeaMfFonqa6yC2smjJxH3C80oQSak9Jl3eRSG3J9dl31KRZUAx4lCJZ1wed5tiJ
	bUJrfw9dOnb1Eiv5v8l/6dLY+sLG5TkRh1b7xpQc57GQYlN3RZoUsD2ASGu1agAc
	91jAv6sNlFIFOOMm1UaWXxsXG+S7MMFurv3lQ/hwSBh32/t1EnMqN/fFAUkCWkaZ
	h9XHB6EllVixualzlxDQKs5e2yd/Hh2p4Fbs0TSmXesTVFjnaK+tsUNa/mA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8du94dc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:11:13 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-139b62317d0so1792349c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 06:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793452272; x=1794057072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZjowRiis49WC5hZioqYWlZTiLLrFCHYTqCaAy9Vq52c=;
        b=XkyLmp68UErskm9MQXgNBZWctPGstP9uaTKwwfl1qac0Mp9Pn4jYhfGu98Oox5s0jG
         AhMd+1eT+YRrKPhA0q9soXa0CuSSowT2ryGmYqOx7vzP0yn1+wug+EVIjxiV7qWoN2i1
         eUk0dFha7DBU5hq96DItbz2+hOK4DN/2gNfYJIHj9tnaE6BSMvccj6z8fYiFDlIDq6MR
         YNpDkaD1/jN7i1F8fwXiFdF8AyCpkIIyZw2R2TWOMCHZ2odJuCEu4TdZygR6NKj8n19+
         KJKmkyx+95ZAYBp9B6D01wv0ce3oCJsSeHbV5w9k8cnwiLJRMHgSB4P0eDh28MEAoHZE
         nyvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793452272; x=1794057072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZjowRiis49WC5hZioqYWlZTiLLrFCHYTqCaAy9Vq52c=;
        b=I4YTaSKV7fqLE+xx3s4ofy4azePrbXrOSFkra1XLgTQh01sYtVbbO74Zv6U6KhOljO
         dUmDfqR9bZvZnZv1AlMMRdp5PzieFGCK+OtXRDD8xr046uB10SctqmlHIp8zGJX5mRKE
         JbwbiK82CUiRbDSLz4XBQSTgXd9LL5+VppePU63FdVWLNJ0QqwBCGdIileV0ZW4lL8Rq
         c69v0hfHmR7Y1Igkdrd1u0p4GHHOrDOcjttS6MU44LlecWP/1b+/JQ0A+ccsyGFC2Vqn
         QmXH8GGf2e68FIC2UnMBj6/9mur3NePBdWT2oOvsFvO/nBXhkT6O3G0TCEY8/O4ArDKc
         muGQ==
X-Forwarded-Encrypted: i=1; AKwUvBzZhC5JmY9/HUQVe52eAe4rIJAFpWOf5/0NC9iMVx+lpV3XG0J7sVd99JQ7UvXp7IxTW54jIqXU6ognk+M=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5nubM4M54+NyQqCz+BjioptVCXK6V4qNId6CYXxdziEaQEK+7
	+8NMNMdLUuoUQgvKQta0AvACi/U5Q6fjBfdACyrTNbTd2WU/qBHDdiO21eaAv+9x9LZjYzKp8HD
	rn0n3qc28bL/6ppWyJ+53rffrC4YcIANft9klXZqmPX3Q9N0ogOQDI6TgCGsgYH0C6aMdrUYeQZ
	LSpw==
X-Gm-Gg: AYBFou359YzG9PzAN++V2MMfwx45VqOYLCX70T0mQo9SOI5w16m6YLUPXjz+2CIZB82
	c0kKkUPwCv3oNb0/PbAu8yztAtF6MfaOSsAXRg4oYgQOrXHh4NM+ThTNfMFiuRGbMdgkH6xsqSh
	CT00Te2qrq4aAi1L8FJU0jk7bPN67sRFgZQAWnXsl54pdgy6cP1+b9G2g8gNLMS4OFzdqm+6t+P
	0feb89n3C1E0tOqHLGgGueAQ/wXZ6uhUV/qMkJtzvRZ4yvpBuFFGuKtecIZQuh9Z2cxpEVZ60XP
	dfrIxRB3nrad2Epig68QTGWQPGOuO87SHTgwWQYQfn3wzxlXPxNXIvOkVu75EqU0uLxaLqZZhTT
	LlQUsxzci58nmj+O84TyWW2q6qy80k5pgeza3p0Cgvtj0tYUW1Lz6iNwsjZWYu1jlIkBcc41TKA
	Sm1tF09yuQKO3o3ahq0BpWhuXlXRep0fby
X-Received: by 2002:a05:701b:4519:20b0:17b:fea8:1425 with SMTP id a92af1059eb24-1ac5da753f6mr6938509c88.30.1793452272406;
        Sat, 31 Oct 2026 06:11:12 -0700 (PDT)
X-Received: by 2002:a05:701b:4519:20b0:17b:fea8:1425 with SMTP id a92af1059eb24-1ac5da753f6mr6938476c88.30.1793452271906;
        Sat, 31 Oct 2026 06:11:11 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1845817csm15717872c88.5.2026.10.31.06.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 06:11:11 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 5/6] dt-bindings: arm: qcom: add SA8255p Ride board
Date: Sat, 31 Oct 2026 21:10:41 +0800
Message-ID: <20261031131042.1200862-6-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261031131042.1200862-1-shengchao.guo@oss.qualcomm.com>
References: <20261031131042.1200862-1-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=O6esLx9W c=1 sm=1 tr=0 ts=6ae5e8f1 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=uytbUiI1na4GE1GmpowA:9
 a=Fk4IpSoW4aLDllm1B1p-:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: bbfuaY2tD3KDrRJPkL30dMWutfgLUsSG
X-Proofpoint-GUID: bbfuaY2tD3KDrRJPkL30dMWutfgLUsSG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA1MiBTYWx0ZWRfX6m3cNAuKEUDl
 LQ/4rS5728JXoAnGIjKm9fVmlzI8SloE9GjJJoqkefknoEGJjBytOeMtOOK6YIWNWmipHtYdyE3
 Ca8MGghmZtvx/MWU1a0O3HlACsxUzq/9ObCIgMlQw7Te9Nv4EAf9sr/2VrUbH2cwcMKjETXspp0
 LkiGvlxZlDN+cmF2J7KGjfjpZ1gqRsF4Du+qIs06Fg22T9P3BSpmbIoCJNdfIKBqnRlsXXIxmUm
 54oc/kRJ9qEtrNX+XdWAZQdcXcTSzUu9mVVy6IeEqjOl30xqmINhXhXWEYH/2ZeVvJe+QnMXBTQ
 Z0ZTyzb1CAXhbWPslCEZzJg3OD1NMl0rs9Sq6Q4dl990HSBcVU1DBiu6w/sXDzweeUFY4iVEAVe
 GN5B+5RG4nFvb3QcA29ylpspz2NenFyVrPLgFMvpE+pV3YfATLmeAm62JWJ3l5ntekBxuF/TweE
 pYdlRFuEDWwG03WNkQw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA1MiBTYWx0ZWRfX16Hj9UcvIUes
 XsiZSTvC1muHesO0SQyoEUiuvur3TIbwMWc7I4HBhhCPRvE6jWD5bmsk5A0jgMuOQzaiNs13we4
 TRCHJKdtlutWtIxhr2VBYhTXxHah1Ms=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310052

From: Nikunj Kela <quic_nkela@quicinc.com>

Document the SA8255p SoC and its reference board: sa8255p-ride.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Tested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..415567b085db 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -490,6 +490,11 @@ properties:
               - qcom,sa8155p-adp
           - const: qcom,sa8155p
 
+      - items:
+          - enum:
+              - qcom,sa8255p-ride
+          - const: qcom,sa8255p
+
       - items:
           - enum:
               - qcom,sa8295p-adp
-- 
2.43.0

