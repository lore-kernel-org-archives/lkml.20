Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78BA4AEBCE
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790108373; cv=none; b=qjVsPo21AQBQV2P+TxyJnlWoPZtNEnhEmXB8iJjqUPouGh0mqYMVJwCISVFoPTjOv5sKEC87NpeVxnkP3WInA1rfRoN7oI/jKxLhDg3YkPeJOewWH6fb1+XE3RvjwLmw7R8UopFrpm8xuqcN5kNJcaA/byfW1iDR0NVupBEvCWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790108373; c=relaxed/simple;
	bh=BnsHd2rNEq/nl7zxksb3Mx5SzklZzKqsPweU+rMX1r8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kbG5UAlnEqVKODFrIbhI75gRiYzXWPJF01ka6HMSG8OLugPyFqFZ2fG/u6ufOiya4UZA7mGXSm96r+ICubG8N5uLwR14blvqPScKaJmHn6mKlGfkmJv5RiFJ9fF3oBtAmwIHO/+1bGcgXzbipa4hcY8iG+wlggYqpy4z4mVWEto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OXbplp4L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T7CrDyFi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OXbplp4L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T7CrDyFi"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MJD8VE1166864
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:19:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DoPn9zrhP5yV7lMcM1dqmYXJ7qwVxD2zmvz50gJaX0A=; b=OXbplp4LKDPgjPab
	BgoA2wR9tKGaUNyV6yDOz3/Z8ARLMd0zJdmdjnkEW7L0VIwvPrX/p5wPJ1eWn/BE
	3pZh6GSM+Y59JxPWLpLBD1jP1PZKsaTULBbJzEY3byZFnP0dPF7p9NaY2zjp+jPi
	+VrwwlmCF/pPb70NYEsswtYPPt7dgXVPg4IiZfDY9fs0q/tlxZ0whFVgQ6Y1guNG
	CUWCjmsKKfOie/CnosR3nTNJ2PXCfhwxXTpNBZ/wbCA0InDNYKj5WxxxkYLFukhI
	DwBDF0r+MCwfRCmkkWO5ZwmuKaFwTMit1GDaPoID3nhHjE3alr0+wNEsuDu7HnuL
	1GF1RQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guymw0c9j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:19:02 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-32850005b6bso211472eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790108342; x=1790713142; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DoPn9zrhP5yV7lMcM1dqmYXJ7qwVxD2zmvz50gJaX0A=;
        b=T7CrDyFiu/fBG0PdDh4mTjjEtd4LB1KUmTL5Sp3UC0PFcfP35KLo1JeqGcl2cyOeRm
         DjronCkraVIN06MVibPEeafMK80s965P7UcLa8N2gKaGrxCB5n2hrviF5IMOckvKM3Va
         /050bakC+5iGzlfzFlkaXaDNggt7R5V9Zp0kMQgZ81j/ctsQe4IPn4bEnX+DT31NZDwk
         5ukmEf7Cqw17TOBzPJ3TWh1irvUedkLzEiZ08cAQKvo0F0gST+1tfx1K4n/y9QIpolH3
         kNXWWQw2a81RqSq7saYiMDIpTImyCASSiugzwEZtC+RgLqA/SFsUW2t6n6swictvrscK
         +0Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790108342; x=1790713142;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DoPn9zrhP5yV7lMcM1dqmYXJ7qwVxD2zmvz50gJaX0A=;
        b=OQlkjEUqZBX4odOiWQOPlSzdL2SuCr6LOLR1w/2P/wGXDqSMnpfEQt3OnP9oWrK8YJ
         XiRMwZ2S4pVShCYQpUcPzbwT5Y0NKMhvB+/iMviNUH2ljMP37LNVL6zgd4nDBJ818bCa
         3I3962wwpTk1GXxibwOGhPIb39L2DcTlQfHIlmln6FEIPUttF0DhF3OaPab90IzMvZSA
         OYd5+A7rVutVCdvp9Cr80o4mzxyw3KWPN5tcJuLyNa0na3AqUQrZoUH8EmPeCVvpJH/j
         pMGc3iEV6TIkirkx2z9fE+R9hIS74uF69hSU/ThA+B6C/WRKqBLbHTtRlE0tbeW+RX85
         E9sg==
X-Forwarded-Encrypted: i=1; AKwUvBwp/QEzwmTCXFkx+R/Q9JCURlazLvTKNMs3LE48colq5ZuOIZiamseVi7l/n+eoSFBqhvpiaABHCwqfK6M=@vger.kernel.org
X-Gm-Message-State: AFuF++kOm1nmrYGxLk6J15eR3S1022GnIOx5xFuddO1vza8VjFU5l1c+
	2SWYmOU6YcYDjnsKu98HmyCeLjnVk+u0X6khPFZwViUHQrXNrsUuJTEchmh/v16K6UVebSf/WW7
	WHTzt0TOpanZMHHrhCUgYD5WxnKWvSgzwHU+iibVZdVdJ0+9m/KqPHuUNSVU66KGLUKI=
X-Gm-Gg: AYBFou174oosPl6MENOeEAUuwqTFXAdFFzsSjR4DQ+Z2fTApQ839P+tL4/L97ecC/vD
	RZHv3RD6Idi7f+1psTP5OHI8UVDMWQ5Uzq/pBrZHwk/Yj0e4ze8G6Y4OW+y1im+cHfamCnygUBv
	KTTl8XmCoKY5qVuTMwnyvoqYt7q6lHefVJNLCjnKVX/6ao6/GInq6Zg7WUxoeed1elcH2NPoFV+
	VqBCDeGty5Yfdg1HuXg1bwrck8ot/hGqzteivBNJUrp8+g196kkWQqBh6lD621MAw8nRY8zlAjT
	4Dd584A/6TycHOVutYBtmRBAC0SSXNQsmf0hR+W5tFoqm4CWlrV346cjU+AmAzydN4m0R8KMxO2
	puV9JB45laOWQ76/wPOc54Ckauw==
X-Received: by 2002:a05:701b:4546:10b0:143:298b:ba79 with SMTP id a92af1059eb24-144f91ed3eemr477103c88.40.1790108341977;
        Tue, 22 Sep 2026 13:19:01 -0700 (PDT)
X-Received: by 2002:a05:701b:4546:10b0:143:298b:ba79 with SMTP id a92af1059eb24-144f91ed3eemr477063c88.40.1790108341264;
        Tue, 22 Sep 2026 13:19:01 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f983d73fsm1101142c88.6.2026.09.22.13.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:19:00 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 01:48:35 +0530
Subject: [PATCH 1/4] dt-bindings: arm: cpus: Add Oryon PartNum 3 CPU
 compatibles
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hawi-dt-post-v1-1-e41473b6298b@oss.qualcomm.com>
References: <20260923-hawi-dt-post-v1-0-e41473b6298b@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-dt-post-v1-0-e41473b6298b@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790108331; l=929;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=BnsHd2rNEq/nl7zxksb3Mx5SzklZzKqsPweU+rMX1r8=;
 b=ANeeQPsv2NbzjxheHp6fl7Ay8B5EtBvQTd7xhic8j/izwG1tJhpAxHYB0nlsWvIl30j48gy1v
 AqdbCvzZrWeAgrgo4xuHAG+pFZYGBfYUIJQmY6c6/LE04rhpEnXitJC
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI5NCBTYWx0ZWRfX0Om9y3eoYtc5
 FGl+b7iVnxHGXoqMhzkkbuwjuRh3CklvERCiUoWui9Bgo1+2A54Fexfues18WKAZDCLsviLAhhI
 WxgAjAQRNdxdBD/nAzmSYrSjrSgsjI5DvHojJ6VS0yxGvIJZRmFpqextEUe5qlZGXM7aCe0EKp+
 jGZHesbwtEEckD3qSGwesygamLnThINUQkT/HiURrEwcLo5z+Z6Nn9ldu4CNOYUjjM53H89UyCS
 AoxAyk8OC0PfBvZS2DfHkxNCLXqudrpvxyKE3kR7df+mUynkW9yoglm/i8DcNj66pBS4Nf1OXNv
 oSvaLf6uIFUj3u0M/kPYreyJChnBAqv+0k4YwF/M3YLUBM9M8f90hmIjhIAT/h5fD0K0/8A9Alg
 Z2xwN9l6V1fzw8KT1XvA36apKVTwjdYfG8uG6e9wNAyhAmar+tkjSiODm4NwKH4ei2CiQqVPqrs
 KWaj3mzCQ+Q49bQo7cg==
X-Authority-Analysis: v=2.4 cv=feI4WEQF c=1 sm=1 tr=0 ts=6ab2e2b6 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=qZrVCR7J192xugBBzLgA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: ZYmPmLw8FOsczITrniWnOU9LIZ0sifzQ
X-Proofpoint-ORIG-GUID: ZYmPmLw8FOsczITrniWnOU9LIZ0sifzQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI5NCBTYWx0ZWRfX/nYMToz6AMOG
 YsUHpuzuMZCahaJEGpO3eAj92qVW16rSfNqhlbC0Ltfzhs/m46yEdTx1dZUmmObwAjyrTgn5gqn
 upp0RO7iG82waDPqu0AaVgY1HyN+CNA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220294

Add core-specific compatibles for Qualcomm Oryon CPUs with PartNum 3
following the qcom,oryon-PART_NUM-VARIANT convention derived from
MIDR_EL1 and to be used on the Qualcomm Hawi SoC.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index c3facc98bf83..ead4e3f3462f 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -230,6 +230,9 @@ properties:
           - qcom,oryon-2-1
           - qcom,oryon-2-2
           - qcom,oryon-2-3
+          - qcom,oryon-3-0
+          - qcom,oryon-3-1
+          - qcom,oryon-3-2
           - qcom,scorpion
           - samsung,mongoose-m2
           - samsung,mongoose-m3

-- 
2.55.0

