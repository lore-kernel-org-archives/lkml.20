Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794416619;
	b=u36pNwPluNF478aos6SKhm6vwgbeLsz2PqO4M4gLZW89ame9/yRwLO2EFL5WNymn2tx3
	 HZxieokSQMPaEc1mziuUZlANWjIRha05fsugTMaZFZ3vhMGZQrJ43irllcih63iifZk5p
	 75IJifdXWqaGz5pya6I4cauKUH9xSctuHd3UJfYfOInUco3BabaIQfPVJEmgjKuvnOzUJ
	 63kJPcN0/RVClMaGLDg6RUWMUqFtbR632HEbLcr0KNhunfYatuz6S6klp7HqnHuH8duvL
	 SebLgswhCKhXe/AoOsUzqpsf79nzEVuWt4hgtTS6l5ublXd2ooEudNKGP+4ePKmTLFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416619;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=SKMC9U6P5ZQXqneqw6BW3h0sTTYk8IBckDvZQT3FmZs=;
	b=WeTh2tueHFBAmAjNyn75nv5FxFwN855qF+dSVJblKKdJSj/bemHe3ceuWzm1i6+fwO+G
	 u5h9mFBj9X5GJWKgbnsT3JDbvM7X6y0nPBRR9TNNDo8aleCJycz5yCtIDxVQVwTgUX0XG
	 Ik4D9cTOkVgPEkDJUrtcJsMNoYUvT17fP/S1OYnrRKow2LKKrizO4Bwj3vVKeC2rO55NQ
	 G4Q1vF65NdJ5Vv9EznMxOkTRhcCG8Ex648zdxEwOEgQI4QG3dcMXmchzUwkXmfI0V1PYu
	 o5t7Jm/tHzDlUsbxk8azWIqLY4scomdFYW0GeX/OOduzVaGD6bivRqqUmjcTepN1+Vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J6G2X9ux;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CAggYHDf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C9C606A335
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:03:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16C9C606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J6G2X9ux;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CAggYHDf
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF0Uaf2594027
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:03:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SKMC9U6P5ZQXqneqw6BW3h0sTTYk8IBckDvZQT3FmZs=; b=J6G2X9uxxQ1DN+YE
	OCV6FF2EsTQYYEwUQIFFUouS3KYf5NxFRUlyY5SVEuNbgAEXqEchIe73k+JCtjYg
	RY/lhweH8o3igtbK73GmSMPTeMG1td7+gABGjFeOMFk7vBRnRZ+jv3Sp/x+MrTuT
	VGf+OMaQ07gKRnEIv8XhxnbyLMY241lY+TUubxtFv5RkkhoXadolNsnVo6IfjC6w
	fyNK1SwO4MlkteT18dpGUn0Pxgiv7BlX2W7sx1ovRWJBOLl3nAjpfHjzUjhOLqBZ
	gJekKLEIs7qSWg/JfGEhqhZ5ZHftUjfk/7wtRChFj+n3EkE2rvLT2l1LvvBs18j+
	oDw5Tw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvksma8rh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:03:38 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ac8f449d1bso2945907a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794416617; x=1795021417; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SKMC9U6P5ZQXqneqw6BW3h0sTTYk8IBckDvZQT3FmZs=;
        b=CAggYHDfNeDfD5VRPZRPtFPCaPl8+a1noOZ/ICT+sj1hTJR8slOywALNIYF208IGZA
         9fUEyEnuXu5d//oIdH2IEz2ZLWpUTJuZJ/CqXKCm6Xt3Ha0rJq/+Nqd26F+aqfSQJf7L
         SLVfxS/Gvov3DvNhcQC2IFwVhtRyNXacetNA3azBJEdaT4JhbpIdofHYqNBvklmpVAYy
         IW+Ha4vDromkyPU+5Oi8qHuTyC/ZWWzCMRaO7VrQ7/ChmVM+fgxbwRQ+qqx8sI4HsvSU
         yBJT/FaClFmI3qwV1hpTJacn6g3owMCGTtenfAfgZECI8/Ij8563hQkDOMKwsuLdzM0X
         NYYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794416617; x=1795021417;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SKMC9U6P5ZQXqneqw6BW3h0sTTYk8IBckDvZQT3FmZs=;
        b=Gxl9et4ApWbxQaiEbxyQPrNF9ZFuTYqZ1pJsqdi2S/Nv+ZMBlpYiI46SbG99lHCUz+
         Rd8LoFTnm/9Xm+BpEc9+Hgdf9gt8bVpNbwRj3dD1xG1I1OxGQ3cbxC0d6Nw6xpMAlQVG
         6BF2JyGeOlIKEH6Y3k2RoMrmxR/7EbQmJe2aATh91chFViaH1pat3AKB9HpRjOgX58zd
         Nrfh1LnM8PfZwDsZ7u7y9Erdx2dtUCCMooKcq6DqxunGN8/5Sdglzjs7D7Q5Rv6AWA7F
         S3RPStuJUZx4MRZsTJBYq2t8xIun1y2k4MRD3hHGNSO6ruJq7zac2I3Ob/zyeP4lMFDC
         AHMA==
X-Forwarded-Encrypted: i=1; AL+hErHA83dlj9OCfJ2+/133zpN6gFYfhjJuoZEx2NrLgi9mdXFu6rUlcYeWzNBalTZfju5g0ZvbOV2IEev3g3g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fQFCPuK7ZBspi+KQgVURIR6kkh4kd580LWPT9fRyM9gH0pnKK
	0zbEr5bDw1L/9MBtpQkyfMTetgroY/L2SNGABFp0j3iQE04sUIYqZk7EB7JGs77npT6yC33scD7
	kdgK+NHXNboc++xLJALUkojB582RWfFXcyglUBjGBUFnzyE4jILkUvPHDjdkHk7p3huk=
X-Gm-Gg: AYBFou38JjF/yjkk5A9uPTplA9+7azP1Hj5Gcaus1b2O7kW9mJy/ykhBoG+3jtsA24/
	a9X9U8cOu+7HMGLkBpDe4wgFMu2HS2JXjbWP0xlbDQulze8zeg1u0g5yn8dWIJVSAuYTUu0Xdmb
	G6gA3t66QHvz78PUFN8zSoK91Z0tZDWaAoVMZPuPCZQvrLICjYyqHxPciBS16H5lZXPCmSSRVCc
	NvCWZGNdrGWQHAWHmDmmMcjkFtqMurVAZmQhf1hF6vV6j0W2adOnnAFebzE34hFlI/aqvKkCGwt
	TRGOuE9EGzhztHq0VojuasWfCz4mTYVc/ur5RwD9UVi8Rjr6lDwTUi+7eTTIdxLk5a+mNaCw/Pa
	CNI+d+eZ21E9kSsDsEp0njoEeXObVOC2JD8V2Ir+f8GsocgjDwrIgDaMuAqV7udIpSfM=
X-Received: by 2002:a17:90b:3a10:b0:3b0:aaa3:ce8c with SMTP id 98e67ed59e1d1-3b182f660f8mr2801994a91.14.1794416617374;
        Wed, 11 Nov 2026 09:03:37 -0800 (PST)
X-Received: by 2002:a17:90b:3a10:b0:3b0:aaa3:ce8c with SMTP id 98e67ed59e1d1-3b182f660f8mr2801955a91.14.1794416616847;
        Wed, 11 Nov 2026 09:03:36 -0800 (PST)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0f497sm84920a91.8.2026.11.11.09.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:03:36 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 22:32:50 +0530
Subject: [PATCH v4 1/7] dt-bindings: mfd: pm8008: Add qcom,pm8010-i2c
 compatible
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
Message-Id: <20261111-pm8010_i2c_support-v4-1-4549cab1c8e4@oss.qualcomm.com>
References: <20261111-pm8010_i2c_support-v4-0-4549cab1c8e4@oss.qualcomm.com>
In-Reply-To: <20261111-pm8010_i2c_support-v4-0-4549cab1c8e4@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>, Burke Cates <burke.cates@gmail.com>,
        Christian Cortner <ccortner@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794416603; l=1149;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=KZ9fG+H1Q7DY9ESZBQ4IQWSPZb00DXIlq+MsGsgkCzI=;
 b=GJMpxKOfgFElqWzV39z9l90CfE2fgS1uPuTsu08Ouz0/kKKFZ0SnNfwqRAepdTnxxOTzUgNhl
 Z7C8R8Gy0LnCYcd/H7yQfZFQdQldQigDjm5WQr1ZU25GqXRG/PlQ1S6
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-GUID: zrJ7HoVjZep76td3qWU46ofZlwJasSjK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2NyBTYWx0ZWRfX9kmUxk2yPsjc
 7N+YDZQpWgl6rXdzeJ5dengf0gbA4l3j035DCfl3mC2tsYzt3Zcw9BNUnU+ETR1Aaj2M1+QYUKB
 ji9Iza4OACjGLzGKybJMoPUgPNshuxscSSjXeDGF+fnTKtOIiIpxLmUG9ZrTBpjG7/l39pSkglO
 eb5wqxxq3g/WV8sAlyhR32T05ogRUf12Hp/HCv3N8qipM34HUbU3WdYWfMevZircAZMDt6yWCbD
 lOShYckrtsfwW6ppXx9o+QHFMG3Tv8wkM05lmF5fBnJGWyX2Fdorw+BJSNM3zZ4d6oEPgbJ0pXH
 a+6yMkU7bhNDO+FV9RKY2Y0dCgjYXIOwbV6gUmRhm41B3IiaXDvKIvVwqz6TAgHKllqgV8TupLX
 WHIWUdnRy6fIJEWHd/1U3YYVqPGvcFiwPBn/bbChS4l5LpzXdz0UtRafljV+3vClCZUMU5Gid8j
 aY+exLRMZTCSlyzS7UQ==
X-Proofpoint-ORIG-GUID: zrJ7HoVjZep76td3qWU46ofZlwJasSjK
X-Authority-Analysis: v=2.4 cv=O9isLx9W c=1 sm=1 tr=0 ts=6af49fea cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=a7mYcPY1mUh1UVlms3QA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2NyBTYWx0ZWRfX5eoYBn0cGgHI
 NHFzqLpxbOxhaN1E2108vWryPXEBSgnZ23w+/IAcLQEpnDfq6YKb96I/+uElFbd9P1gdVSjDwUp
 exXNJBL1VEHfEnwmkRi7MOsyQrIufGM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110067

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The PM8010 can communicate over both SPMI and I2C, based on whether
GPIO1 is pulled high or low respectively. Since the qcom,pm8010
compatible is already taken in the SPMI PMIC bindings and that set of
properties is heavily tailored towards SPMI, introduce a secondary
compatible to handle the I2C case.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Guru Das Srinagesh <linux@gurudas.dev>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
index 0c6e1870db1d..2701aa755f31 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
@@ -16,7 +16,9 @@ description: |
 
 properties:
   compatible:
-    const: qcom,pm8008
+    enum:
+      - qcom,pm8008
+      - qcom,pm8010-i2c
 
   reg:
     maxItems: 1

-- 
2.43.0

