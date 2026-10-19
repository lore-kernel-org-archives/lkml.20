Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA404D9F90
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405684; cv=none; b=PeHYpzb/kwx8Ylf3JcN9OmMLVltSvmP1/nMpxd8WVFzyXyREsmlce/OzMLdodfUZH1TtnbxEBGOm7sfC7Hi9XQ8037ur4m4xn7szmIIvgIvURzhGNg900aP1NBoBC5pwEpzpBLovNJ4loBF8nWTFKNPBMCxgEkCXiqYs7HZfnLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405684; c=relaxed/simple;
	bh=kh9tVQY45GrFiUF1ke5Gy15WoD3EZQssJNTVFnwj+Lo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FFd67FtfgX20rn5u1AEK/qQOa7zZkRirM6uF5WlWxwPEh6EQYSwM1DWI4j6UbanYdO3mY2TSsYAd34ZdYxMitO70Z1XQApt4ppvtB2ZCM2fOTzX3t9Qs9SHRGv/dqfpW8i1hgkpZT/tlCkZIxN+6qwuU7c1BPFjuCQTNFUXzRGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JnDWjQ4k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aXEn/Bxs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JnDWjQ4k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aXEn/Bxs"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8YgiZ2688704
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:28:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wq6D0np2UJn8vl+gR/Dp8dr5QQvgLmXdT6JzLOTCLAk=; b=JnDWjQ4kO6XUsV/v
	5kM1gqbSRdE+yDtqxpwEk5PDtcGB87T7XauBrx5qwzkB74yNaAZGtBPgWu46gaBL
	yrX9dN+EVXy2UxDFzwCmnF3BDFXaPtk1amqrbtmgAYyPvSiAQW3Ub1Jr+jXcYHzO
	Z1QAZLp/fVbMvXw4xASG98RoQ54x7QwrhZakug22CD6RHsWSESrBbwZY943E27PL
	gUno98tIJtj3x2HMM5Gl3oSmara2n3xMsPMt+vJ03LH7b8qtYfkZ7v3A0cfu93Os
	2rbUvHYxTIQZ91vejt2WFFAhezTZtXDUIdRWS9WvJc4vXZRD1geKwO7a/qMpRfv0
	QCyGNQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdftn0e8e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:28:01 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e80f7acc67so16475265ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 03:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792405680; x=1793010480; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wq6D0np2UJn8vl+gR/Dp8dr5QQvgLmXdT6JzLOTCLAk=;
        b=aXEn/BxskgHNgTuOU6EflywR9ImI/H9dW9RbN5tL8mq6m0xfJJyq3jo/WTcjtwI2Hq
         aW86YCzJ/MEDvGw6wGLsAF2MZ+JH9i52br48zlsUJFc/gPdvyH+qh6rZecCNI+5ja/FC
         dmvoBFRLOOn8T3LTQsAmOeYFpIYSBhnSYn0AhKj6N2FPeVW4aLiYex/ZMY8Z2CeOOjEY
         pdYNgdZRa7aoDoN3OB6IfogA/aYbZsJCnvyNWuBlO44RnoowsOlsHaaebPlaqbMNIxiU
         7NXvwFIAqiIQ/SBHqdcC0EH1nAiNR9RfwmcMbg/cG6negvoOUYLumLCLjFfCMoRGo+Kx
         2B5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405680; x=1793010480;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wq6D0np2UJn8vl+gR/Dp8dr5QQvgLmXdT6JzLOTCLAk=;
        b=TRUCIBTOAT0mu5vkc4iPS9+wJP6Avvr250fEmj2OmDlaOzoGS7LTq9aYqf6jfnUc0n
         G8Jz39XiUxF2ZPBcEhT/XqVjL4FGwF8/tNb/deXeuCvz1+mEROyMtIAEpyDW74QxFAhi
         YnUdkoYz7HwKMNaT8YFPvPy+Rtrbazgp46IOX4x2HagZQlkVZtR9hlFxajpqAhBbIbU3
         Ow/ZHKDMm5QMoA/J+CDUbssiQmz1cpXQNllF/7KmpyGJDpkFA7Gs6ActVT0yc5Z/hJVi
         2KivEwJrD63TkOAT+KEJIeA6ouCy/LA/x44uXZZwyPysPnPwexpkBURgHQgLMF1wdBaB
         Fo8g==
X-Forwarded-Encrypted: i=1; AKwUvBwnVjAsQZEgpJaRuTEQcx0Ff/1Kvxs6TEJVNFQ4hDFn7NXpShp9OCmfhnHG7aaZcU4PTAZfSuKFJ7qqvNw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgZXCw0bIIGSdf3SXZfEma27xrsVbaAofIbLshv93Fgz/61Fl/
	4CvPYF1mKSGG0aZtK7e/lzVw0fB5HwACGel9uUyEaW6uiYSC2N2F6ZlVoAD16JQ5MITt7bSbr8o
	YA48MX628Am0jDCVrDPXfW1k+IoU7i3OqRq65kiPUInJTCKyfYoRY0E3Y1IdEKV4ipRg=
X-Gm-Gg: AYBFou0qsUeCgW93nldOz6Fp7Hh4zPYdJK7JdsSDUXF4c+0R23Rd7ThP53pkNdBdaZ7
	MWk+HiqAK9ELhy+EztkYX24pqmseofq+lWcGV2aLV7ZuI9BTNsJ7FdbcehI+zjNWwClys4tRTPN
	WYs3ob9pVuMyXjyJ0re+1Z5Rvo5ppQewIeFLY7vo5jz5OjGuxx5DS4BRH2lxqwWgFzfoibBFX3U
	Uctvl4dySDm4PrnjHcMFxEkD12zLOvjhe97FcElekcmVp9y4QQUkgddqB3ecfViv7tSBmeITKHf
	wwSgFFxiC26cGpKtElEEliTWh6zG/6FwqYCBiXcTl1qrTsLYM+2jcx2WX1id4spX8Ju485IuK/R
	YeE+Z5T6k0HS2rxQSTgT5E1Ab2jtycFxVm/1u7g==
X-Received: by 2002:a17:902:e948:b0:2e8:4f03:dbce with SMTP id d9443c01a7336-2e9a70585cfmr51669305ad.51.1792405680216;
        Mon, 19 Oct 2026 03:28:00 -0700 (PDT)
X-Received: by 2002:a17:902:e948:b0:2e8:4f03:dbce with SMTP id d9443c01a7336-2e9a70585cfmr51669195ad.51.1792405679717;
        Mon, 19 Oct 2026 03:27:59 -0700 (PDT)
Received: from hu-gthawre-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e5d7ef1sm36359785ad.3.2026.10.19.03.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:27:59 -0700 (PDT)
From: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 15:57:32 +0530
Subject: [PATCH 1/3] dt-bindings: arm: qcom: Add LeMans Draco EVK board
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-lemans-draco-final-changes-bringup-v1-1-dcabe94f1074@oss.qualcomm.com>
References: <20261019-lemans-draco-final-changes-bringup-v1-0-dcabe94f1074@oss.qualcomm.com>
In-Reply-To: <20261019-lemans-draco-final-changes-bringup-v1-0-dcabe94f1074@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792405669; l=848;
 i=gopikishan.thawre@oss.qualcomm.com; s=20261019; h=from:subject:message-id;
 bh=kh9tVQY45GrFiUF1ke5Gy15WoD3EZQssJNTVFnwj+Lo=;
 b=DwTof/h1vzH5Akmys70qASYAZ6TGtPsc+jfUBRIrmZF6EmdnbAhzunQNEldstBP86IJA/fEpf
 gLV3DFxYCH/CsQkwWG/EvQXeY93qQPg0Cjxf408hyXpWlzb+KXXWg1/
X-Developer-Key: i=gopikishan.thawre@oss.qualcomm.com; a=ed25519;
 pk=l7diN2ZWn/39T24vZixhPPrGDEUF6RKc19MsWZubM6s=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfX5BhxVPPw0ost
 9jVEFvCNFybH3P6Sugp6/Vf+oYx1s4nFQY1dD+uLHnij3/SSHP9RWWTZw3gduBNjdJfBdc2NY7c
 MDEXii6tj7mkiszp7JKNG1fhD036qGM=
X-Proofpoint-GUID: arrrmos-ociSGtnLBSE-RTUshp40KzH6
X-Proofpoint-ORIG-GUID: arrrmos-ociSGtnLBSE-RTUshp40KzH6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfXzR3k73Z4u8QJ
 qG9IDFaXL8SYuGNQidtWmakWHqUBG8F+JIyT6JfJ3POBSTi48eI46Eg/L0dXe9KrrMRMAIgALIZ
 h6Ld2n9OKRCgqF4NP6Gf+9sM88BD8gLNQp8akXH+ehe4H6Vc2W3CZwH3HLg9WkUTHYWg4FZ/QC9
 2vxjBqZ6pnGvktRo7B6tvWjx7i5/cUTG9X9KOpT5z+RI3Zlf3HWieT34i0lr1UewXCywSBCW2Rn
 WfrpR6smnOaKga8VgB69sU2XBPCTyFBDBz5BmeZ+OXROIUywPNESkqTmX6xKWw7ZSyI99/jlA/G
 Br7QHhWbgcrdAoO/+ChOW0TXNzdiuxXdGUEUK1WaH7NzfMJwphaUc/+hyfyx/InZcCUxg+jeRvw
 bO8Br8nMctQlzefMt2TmbHDQDTNqkt3oyGyLHoZJv7q45pEkgMXJfmrkuL0vCPRbQF3BKv5QuO0
 URtOMU68IOffXeJ1dQA==
X-Authority-Analysis: v=2.4 cv=OvTaWC/t c=1 sm=1 tr=0 ts=6ad5f0b1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ghiYM7v6OCwGtqAZdvUA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190041

Add the qcom,lemans-draco-evk compatible string for the LeMans Draco EVK
board, which pairs the LeMans Draco EVK SoM with a common carrier board.

Signed-off-by: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 07ef7988b068..1efd6ea34c3f 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -498,6 +498,7 @@ properties:
       - items:
           - enum:
               - qcom,lemans-evk
+              - qcom,lemans-draco-evk
               - qcom,qcs9100-ride
               - qcom,qcs9100-ride-r3
           - const: qcom,qcs9100

-- 
2.43.0

