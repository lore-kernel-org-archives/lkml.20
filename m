Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDEC4B149A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 14:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788444466; cv=none; b=RENA1w63SYPl9H0DdXWhAzsjt5Y6cOjY+cg9ZLvqal61Hq7UM2rlw+1yynUhD/OdVdEiXN3Pvg7INBbdSdGzyyZXLIe0gi4nC3G4FfKcX01LBuWgZn2oqId8qE20woTnfdYGeMrGXBWCzoB2RglqDhef0Qr4hVtNr08CniuRSZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788444466; c=relaxed/simple;
	bh=taHT/FWrTTmTNXum4aFu4vc3zEZd97waKqjHUDl8gfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=faCJP85W5a4qsR+ymgK5299CTk/zcr+CBs22wE6H5f3LvZTrQzh6AIlHYN4f1JUdHFc+iVdk07nH3PUgvbpPxns/eDkB6hz9BlzhI4AQWSUaKh1tJ5TiKeME0tHMrIdPdDhxv7VymtOLaRSZAIdzPceZFUkTo08xH393HDNV3nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pbLIUqbv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gui5l7tu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pbLIUqbv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gui5l7tu"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DA8vL1704855
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 14:07:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=euO68b8p5f2
	lwR2HBSoTd9oe/4Nd/VdBWR8tOJjtlZg=; b=pbLIUqbvgz5NbLlACLX+l6oJMQX
	xozqop+HFdynlBsXIdRrO98BvaW0c68a9NSSLjdAVBcViv3oUNijTzR89oRStS4/
	Vjm7k7PzYaF1F1bQgx1PWqiaik/f8N6XFuLPP7g7OqqenhPYIdsXXLx7FAQWzuyu
	HDyLDfb0gQfFJ1Pc2zlqiBZtSBKYbQcMeExnAObIuf/2LUmm/A7U1grqXn0XJv62
	evPkUME6FTXBFq7PUl02LjwKxLnC3Kt14pyRi58OtxbwOlXmRgTSeo4ZtO2dSzDS
	NxGfqvwGmKl75j80BZyi46yi38ecS/OsxyNXM/ZpYSw/OIZRAssjDZKgSGw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf9b189pe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 14:07:30 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38ec0f510a9so5503811a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 07:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788444450; x=1789049250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=euO68b8p5f2lwR2HBSoTd9oe/4Nd/VdBWR8tOJjtlZg=;
        b=gui5l7tuJ7t8qLgmMC73E4apbZJ/KHttaMe6gndcUFlYsinlPuxcYTd3KdYjfX81Sz
         pUnAEdDOpQjC3tBzrCtVOLAdDJPQtYth2am3Ij/gty5/JB4a/xyuDWfc/KOUjAdlUmNi
         2wbMVP6BO2FRKdd0R/EEjN3FAELv70xsd9eGZILh40LS1NdZWTWBRQIQGydHvrr2JRKt
         prZiSLc4FRwuWnI9GW3KQPFmQU9SQF0FCEcuvpmutTYbGFlOCDkFa0bu3fR9loOSQfK3
         t2z0j1pvgEdaYQNJFsqwxC/A+CsfK82XOCHiCSsFKybE+V5YHwAQ+YOtOVXFylz91Y5D
         UtzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788444450; x=1789049250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=euO68b8p5f2lwR2HBSoTd9oe/4Nd/VdBWR8tOJjtlZg=;
        b=icoDEZG2fmkFQhJS/gpZMWHmTS/MPRJDflF44QE1MG3Q+bSDrshQw8N1Q0yK8InZXz
         yWe4BUtiJ3m6IpthXak184/Kh0WsBEeFt3TA1LQCk4d1sflRPNvFrfSuD4f3Hm6Zzr2t
         nJL/kzwFAeKW3WFq17Ifu26oaHx1iR4RapqGyx3jK+MPIwdciej27ouX3nMiJ3aIU2IC
         uUsEJgoCBKSzei/R1kriRaE/VXEMVGVwZhKj7J7gRxabkd9pLHfZ3VYmADOFKLNiPNA9
         EnuYhKMzAa02JkPh0C1k7vuza2hVXTrsuXAZ1KLIGQzVFJegsTPOpvuLJHCYDx7XcHTS
         IutA==
X-Forwarded-Encrypted: i=1; AKwUvByZSeWt+1Vlarb5CQktEyZdXOR0ipanmUOkclm0nrpjec0pjzjDTwsLO+e3ZzMN67TrmOwaQvQJcvbJWJY=@vger.kernel.org
X-Gm-Message-State: AFuF++ngd8WvTJ2Aiu6xT8Mjpcs6o0+EpEA7HpZggqXdPiqxQeA7XEWb
	IOqzKClifxGTFTT/yrHJP59sF+5sThr0EHaM4xiNLTlPoiAPkKfThocBr/YbaetWmlV+92Qcw2q
	4nQgeQHpFxwtLtXAeU6fd50MFDZbpbOPOnAGdKBHMr2jrbY8u3sCZbh8DvN1zJBTGdoI=
X-Gm-Gg: AYBFou3Bj0hUfM6637uVC5T+Ooet3wi7Xh73pXKKGf/5fnyAfbwLV4ve83MmBOcBHfL
	B0BEazqx10CuYk/j7wkIuoOORr7KtCyFObqWGqnTRSjgqH2DdbJIy2KGlxFn9tpR/8H7bSa4KoH
	GWcorU7Pz2HV7RPwQuHnDfbzQnN9rwvMQV83SynbmcA+7CHKMuIBjmrANcXkHbb1835sK9Wg/ku
	TxfMVVQfMUCQRDUS+tWpsXs4vKzz2LX8bZPA3Sn2dYSavX/3YZyrpURZ3EYqb4Ywfly3rBr4tG1
	0YDP9l3oZUyvrQP1evQGezxxw8T6PAR6gswvnPGQQ+KeehvLjaqe0AT/qqMgvBR68mL4CJjD/E6
	PdJtQOWBhCpquFOnDJCilZTPsnaWJvT2enCfIE4yu7KETnXKbLbt5yC9PZKws
X-Received: by 2002:a17:90b:2688:b0:398:bdb0:adb7 with SMTP id 98e67ed59e1d1-39aee162e08mr21894654a91.16.1788444449713;
        Thu, 03 Sep 2026 07:07:29 -0700 (PDT)
X-Received: by 2002:a17:90b:2688:b0:398:bdb0:adb7 with SMTP id 98e67ed59e1d1-39aee162e08mr21894373a91.16.1788444448818;
        Thu, 03 Sep 2026 07:07:28 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1431994fdd7sm6809098c88.10.2026.09.03.07.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 07:07:28 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Yadu M G <yadu.mg@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v14 4/6] dt-bindings: arm: qcom: Document Nord reference boards
Date: Thu,  3 Sep 2026 22:06:15 +0800
Message-ID: <20260903140617.441111-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903140617.441111-1-shengchao.guo@oss.qualcomm.com>
References: <20260903140617.441111-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: mrRwnhHHbiB7IWR9W3OBuVTjP20tTh9m
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEyMyBTYWx0ZWRfX/vr0dIGTC5k5
 SDANNNscC191GcX0eB3+YoaTf3/lmJJZ9xJms+82gOk/Bhvy+wsM94uIKQrbNnoz3p75lnGhxX0
 XVeKOXm3fuDQ53NBamdySt71sdIVM5U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEyMyBTYWx0ZWRfX7w5bkgpArej9
 bcs7vXPcEt3Zka9bGrWfy11EPtl0E3D4+d/a+DqQHsPrWQ6mujDF76k46j2sgDvxbbI1/MNIZfI
 Mf4Djwo7LjC/6Wih9Fgl9HpQAFZc5qEsnko8ZZ90u2Bi+kXxh1FmciGUGZOYQS+kUSSqEuucsDp
 euYreLqdcgoNeOlwZtbaW7st2uM0kUatRFWUYuCSNq/CqfGdlUUB+T6LbHYdpJ2retBGrjrLnpl
 coh3uNHOLacAKn5OAjkYs1T89g5O9jwyBBSKhKLkzNUBLfyCLVheMPLCNvLvCCR77xF/TpCiAIh
 JhkUtPQt87PUv4xcD7bP4oq+eiYiDl/T68PxK3A5h90/FjrEddzqUWXrMNawyL7lfASLd3FlCh2
 A33LN4PSZN89e6dMd6jTyqOowRhLrfT70Q0F0o/11HC5S9EZMItXhR9aCkPEc+Ns90XCvp2WMXu
 pb5gMhLju4efDkHQE8g==
X-Authority-Analysis: v=2.4 cv=NNTlPU6g c=1 sm=1 tr=0 ts=6a997f22 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=3mLb7b5QgQ_nS9KBAK4A:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: mrRwnhHHbiB7IWR9W3OBuVTjP20tTh9m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030123

Nord is a new generation of SoC series from Qualcomm which includes
SA8797P (for Automotive) and Dragonwing IQ10 (for IOT/Robotics).
Document SA8797P Ride and IQ10 Robotics Reference Design (RRD) boards.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df7862..198314ddaa84 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -402,6 +402,12 @@ properties:
               - xiaomi,sagit
           - const: qcom,msm8998
 
+      - items:
+          - enum:
+              - qcom,iq10-rrd
+              - qcom,sa8797p-ride
+          - const: qcom,nord
+
       - description: Qualcomm Technologies, Inc. Robotics RB1
         items:
           - enum:
-- 
2.43.0

