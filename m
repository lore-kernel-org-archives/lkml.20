Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F337C3A8388
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 14:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789915086; cv=none; b=q5wtKyBjFIo/n8gVIjCholS1hbjnJQ/tOKXSoQrkUCS5zEKUr1ZE5GkMYzmr/YOq/w0f1s+UYIvVv6jJ43anO5NNZ9w2jQDEdnbm6U9TviEqFOaEMy/STwcPXZqa2XwPhG2b+QRVGpXZSYNx83HFCe1iaMg+kKocbZc8yONYa0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789915086; c=relaxed/simple;
	bh=Frn8F3/WSjB/2UM38//Jz9U2YswF2AZpqHhW/mkWanE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ATtfkQNuwO5We6tMFhXrD037uRB+kQEq4Gw1HYO+c1ehdNC/KNRP2Vn+TtnsjMSf625IVaJzvjwEF9pTuSIpinmyTMCDjpIyYD5/ZVQRti2BhxjS5klhkER2Fa+t40bMthiLLq4Kqw4y+HZELiSfonorQm7ItuY9eJXoaftNCwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UGqixn4B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YFZaPWly; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UGqixn4B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YFZaPWly"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68KBoMp91640252
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 14:38:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rOtJc6KOwiBetJpPNrfLYP
	AYSiuWhf9sniFGWhrMdfM=; b=UGqixn4Bv8Ozbg3dLs4C8Y+ztZzI2apKW2R4G+
	3oDCn2tEMFy4i9smgnC4hEbPEfpLn5irBYUy2d2pO854GMVZH1rKfofLeX3aBm/t
	z+pCBdtdGS0/z9JLzZRY0QzwjuxDMCi93vvi5exK9kY/FCWNgxJgLfe0bxSALbe5
	PlcQPrQx1I+ovWlKj+sJq23mBx1xtW56MYcJMeU5IrazIZ1Zo08lMsniTk7uLvL/
	lbQLPXA+LBGfl/nUz8PeLw9vzKYVHVSCa7yDOXlcBC1BDJMC35ks0sdteAAxg5h8
	W7qOodtT70AoFOHHvRJuAnrS14u03eUUbcqMu2jaHUEyALcw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsjs834a0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 14:38:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a1e564fd5so393863685a.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 07:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789915080; x=1790519880; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rOtJc6KOwiBetJpPNrfLYPAYSiuWhf9sniFGWhrMdfM=;
        b=YFZaPWlyQ7PpJiOtLQCsVbAKIADkhFtotgnprz9Pgn5K+/untjr0AcWuHTYEAlGq79
         iyTNdA4kiubjZ92mmmfTAdszwVE3Rs0wn5EhI2GZDPyl3BYJXEIsPkW9KiGorn0nQTIF
         xP5VnUGfbZ54ruJM3/THWpI+ONImKNR9ix2OX7qLqcnc0f64jk22p8SMkbnrrsa275NO
         vpN4mqyWGEd5rP026vB83rJ2H+kfYnwhBe6TUNS2xmNfdSi8Wa+I9A0a/c8asXI8MoeR
         yW506+WwWMh3bUbgcskTeRVXNIt/TXeaOxr5SS3L+lXZu0HQv5EGKM26kBR3XNNLTO0r
         eUZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789915080; x=1790519880;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rOtJc6KOwiBetJpPNrfLYPAYSiuWhf9sniFGWhrMdfM=;
        b=Gx7xS4ZcMTBlTFEL2leQ1OglHRUbAcY1F+JyzpncRZfEOTpkpRdLOUSs7Ky7HJSh5Y
         awkOxTCA5HKWmGaTu65t3LFzpJIf6Xx9IMCo714x89f4boXd5a0Cr7MRhLAvYjshDR9h
         kdXjcTDESgJ6S12BG3gatd0c7P2CB6OzzP/1uzyVR5cCPM8e98MgINauuiDGBhiJubmb
         I+rY5JAFmsoUm6Ub5GUB31lcP+UEXoHIpI82SfKmvf5vQQ0VR0B5Ztvk1ipKBL/kn0Tg
         MzABour/kei+5urgD597yMhsPML2RBjOgG/UPneE2EjgheAs3KXaKSgKlbtT+NAxZnq8
         AOkg==
X-Forwarded-Encrypted: i=1; AKwUvBzCmyRS09wnpjm/HJmtB/eIW/QSdtNfRSRir29n+bKoPDQzCoLee4Vd3gTOyIXkNe5QThQfFd94+7SXgw0=@vger.kernel.org
X-Gm-Message-State: AFuF++kaJt/nbhxBEFvTttdEunEgy15VzQfOWA8+GjW/BkjKcauSsBv1
	KVe8hhjSS/J/ecwE4tx6NlsKBaUpKa4aD7rZ2dpZAY/kWnWKmlRznFV5IJ1V1nXrZfmwfN0gA2M
	rqP0ex9OJyRT6xnxTXbF1pVty85rTSBrzlcXu2wVVH/pGiRk1dNUVkNkEBmId5Y8kW+NqV8f3Rj
	Q=
X-Gm-Gg: AYBFou1CrDIwbxoqbWfPRRotmuub6E1AB4FGlGcNmNmNC3TaNiORh/eZEdpQZLdjFdw
	D9byec+xmcMJBaQth8Hg4i1qe1c8QfuyD5H+7bCsOMO8zFzkb/LJ6v/ojM8kfuDhM/cs7sXIFRj
	K4byr4xxw60MW0adqTzmf4fi9qMhb7rf/5lyLtg4NwRc4zGYLwfUQoZVWVT4rSRcUvXJe4fADR5
	nnRwQUE1MMlRZm/mhclLJoL5zaXKJ9RWqh+JoSuB7ctS4c8IlDInrk/kykXLH03l3XoKCVQuqV/
	LJkqsNje9MgJBQeLu6lgE5hpTHBHOklSsrfoMlGWA0UvToLWRIsie9miPwZJztrzGej2zogBSIh
	/Z2A5wGVJqcDdblYuBH7tTfnFKUkzoAnWmtKXrgYT536RnjBmEa3nBRGbDhIObjvOnQeHOKemD4
	OsC8RHYO4tdT94
X-Received: by 2002:a05:620a:6886:b0:93b:d7a2:83cc with SMTP id af79cd13be357-93bf576b39fmr570054685a.59.1789915080285;
        Sun, 20 Sep 2026 07:38:00 -0700 (PDT)
X-Received: by 2002:a05:620a:6886:b0:93b:d7a2:83cc with SMTP id af79cd13be357-93bf576b39fmr570051685a.59.1789915079858;
        Sun, 20 Sep 2026 07:37:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8c78c1549sm1251055e87.4.2026.09.20.07.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 07:37:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/2] dt-bindings: usb: qcom,pmic-typec: two small fixes
Date: Sun, 20 Sep 2026 17:37:55 +0300
Message-Id: <20260920-fix-tcpm-vbus-bis-v1-0-cc9347bbe81a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMPvr2oC/y2N0QrCMBAEf6XcswcxUmv9FemDiVs9wVpzSRFK/
 91T+zgwOzuTIgmUjtVMCZOoPAeD7aaieDsPV7BcjMk7v3etd9zLm3McHzyFohxEGYddjybWTd0
 6st2YYNKveer+rCXcEfM3tBoJr2JnedWW5QMJnpGAigAAAA==
X-Change-ID: 20260920-fix-tcpm-vbus-bis-e83fe7c57590
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=693;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Frn8F3/WSjB/2UM38//Jz9U2YswF2AZpqHhW/mkWanE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqr+/EB7HnvhDIrbk/6YKk+41kYownOr8vK3cUL
 PUdiVhEoCeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaq/vxAAKCRCLPIo+Aiko
 1exVB/9pV35mxhnr1crJqWnl3F/iv8dZX4M7ZSGb8oC107Hx7eoFAqqn2hwrKnVRv8hGu7NB72C
 QamXoFER0NCWfvVpqxIFfq6nPCNwLUna7Knij0U0Dft58+bZy42qOmeGDPWztXok/uonzkKeMy0
 uXHcvdIf5Z+xDezZkJXJvFqeCdW/iOnVjJSdoP8c6wd9RqOm3XUv3VDUu+NGKCjtI9/rlXV8sAv
 VJRI4LaBvuXq/het5dvO9SD6faJ320CmUvvMJ6mw83wEpDzhL1K9050Zla0bfEXMK+ld4zFoolE
 dq07y4zXB+fqd2fSD6porLbCGQjVp3ymQI074LrCOapyzc9z
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: s1HSKo2GUH0LkAF68y1R0UILvnim4rpr
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDIxMiBTYWx0ZWRfX2ymOlOYvRmt4
 6AaFN83e4QJPMEeUM7X/ApKuEaesJN+HEJYDcov1zZGx0bEBXXxbiBZm36AZjCXeh2vPTipX7Db
 qCwAqubSMJst2qh/h/pk9NzaQuQgbxs=
X-Authority-Analysis: v=2.4 cv=YqWa1IYX c=1 sm=1 tr=0 ts=6aafefc8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=nSv7VxSjxcQYhaeNqXUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDIxMiBTYWx0ZWRfXwCXgHgzWdrsm
 J2FTFAqzFv9fZDltJpCt5tXYGBRBRvl581NyLOjbPpZq/twxqYXpb7bgFj7EOIPTgBvcRDx99Mi
 mYff/D2Vu4Rtpn8FrSHpS+/aZ038lih/WJqePgfOnkU0ExP6kHizB3YsSQj8OEIb28FkPbaD+q5
 DKCeiY2Yl2f6QWjUvN0zE/HPED4dUTQL4tIOaq2oHQCyastK4olBJNW7f5dmUQLU8/vzjxjN/n5
 vKUgLJi5QCsZc1sL9oORJbkzIGotEJTSmCwxqe3YXSMD9oVEcMO773rGirqvAaphpSetyhVvDet
 jxFNSzTZ+MrW1RUbdbdfcQW/ycsBs4+uGHzlP4Kw1wVgokPSMkq0Iix/ylaKpEZQBPXyWEtwGU+
 NT08VAQoSw6jNO+GPN4j94IMbAn84UPAFx0FAq6yVTWV7L/FiwL4lnQ04MMQ5QHQlzyl6js79XN
 xL+GdW+3/EWbFm2Ve6g==
X-Proofpoint-GUID: s1HSKo2GUH0LkAF68y1R0UILvnim4rpr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200212

Two fixes for the Qualcomm PMIC Type-C VBUS rework ([1])

[1] https://patch.msgid.link/20260519-fix-tcpm-vbus-v1-0-14754695282d@oss.qualcomm.com

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (2):
      dt-bindings: usb: qcom,pmic-types: require one of the VBUS sources
      dt-bindings: usb: qcom,pmic-types: make example use generic VBUS property

 Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)
---
base-commit: 3f2425f5b5bbbdd991ca9cdfd5502e68d8895998
change-id: 20260920-fix-tcpm-vbus-bis-e83fe7c57590

Best regards,
--  
With best wishes
Dmitry

