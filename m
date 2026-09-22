Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C12381E98
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 23:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790119211; cv=none; b=ZRjKIPw8nAqZW6EpI8tXd1BsHi6ueYSUIKY7eqU3xXhXd8lIi2HUZyURbBrDETSZPo4O5iMLoeU4wGDVvcfjULIG8qOGY9xLnl044Sdq3t8lQS+y9ACRZRhjPYzRf35VChNL/oS/WY/YZQ0wxjzi1x/6FCwlvPQSbqhTDPnpbR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790119211; c=relaxed/simple;
	bh=l+ARlOXS2XWaVbDlfHvazDmsre4mloEoMEythuIAEgk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AFl5v2Zu5Tiaaf2U7ZuFaoni3EJIwdMzs5aFNMpbMaj0JzX1O+8yzivMiqteaTRULyUYbTY/ERB/R13kbjSSqLIb3wszpvr74pMg73+bssZcDIYOd2f90KI0TnIq7ezJ0gRH+3nkvXQN2e9mKndQmx0XSiT6LhY99IQ8+wTl+5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H3CxU7rE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G7TnSstG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H3CxU7rE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G7TnSstG"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MJBkSY3897620
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 23:20:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2EwrgEF430cEg8Mo0ngi/Kw0Qhs42PqZHvdu03xpsVs=; b=H3CxU7rEIrdrtTHH
	Wk3YW9AOkO5LlieZHCSh/SSDmByulJdOBCuJiBjzk1Aa6Lt0lJdxyi1jyx9OPGsp
	vhOz6P3MSFMf2t/Mqub6ahWUIDIqXQNeozVvSagjLyCs/DpR46IcqcBf4g7jObid
	yujxCdr4vmIMPfU6tGCJ8Cqd8TyNVQxWad9f64Jb3afh6L3WrA/uRZXkQ5AO17Fq
	G5JmOihbMvaHHRPhM9EDpLFqTKxZ7+oXOkYa2Np2/N/thRyUnE7qc/Pwgl1yHOUy
	P2a5oryUzwHh0tcOd6QzKBEhC1eZ5mUGI2I8amQDQ4GEYax8YAmUvUr0F0EGv/xb
	wYK7KQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guyma1160-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 23:20:09 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-331b2ec616fso1203529eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790119209; x=1790724009; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2EwrgEF430cEg8Mo0ngi/Kw0Qhs42PqZHvdu03xpsVs=;
        b=G7TnSstGOU1XIHM4P+9CzJn9VFnmZLYk1Epzd+pgUkXqzHYnWLpAhYCunGfa2Cp+1y
         6kEph1Ybq8gvS1XYno3PoaGCwOv3Uyytn8l7RYnJwxYbF2/qFOwzh5tQSI686t8Erobs
         1N4tJXN8T1+8A9dnZVYSCBwJx5ioMnt7wAFuTNhMMTBV8CnhFVl2L9vQf9uCEkpDrrt5
         yzT3bcKfWpZUltetKdjBwpcb6IREdjA5m2D2aPUpIsCp1GhN8Tzr7kHLjcdnUUB1TZt7
         jh5yR+aHfBAnZu2jkW8Jpnl5qiMPh0moalD1I60I4l+PaP1CoU2uaE6b2xlwOv4DEFK8
         hnSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790119209; x=1790724009;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2EwrgEF430cEg8Mo0ngi/Kw0Qhs42PqZHvdu03xpsVs=;
        b=UlaP9VeN3rTSAmdd7NUz5BdgM56j+UIxffOz5ML36Byr1w5Vb+FFwSQ2HKMWMkL1BF
         +Yf7EDlItI0vxdqJpQcmutoiyHd7jexvN3aZlY0UuoHuAbifpxR8TJBTdMXsjNa5ZZm5
         cZWaYHRdru6dPVggduJQ3HdMQ778wFe2J4OS8iWBO6esWgtEwr0ud/0koxxaoqEwvRg/
         Qk9COsFvRB5i2eeg7v/0FAXWmNVtg146qDNQvfgCT3hR3jV37YC/5WeDa5kMEJwA2oWs
         zPS94IhjmBDqlhcXvmPT331KO2v4Zkku1J15oY/w6mbr5iYXcEEOdiv2rYXWOXFzra5h
         VDmw==
X-Forwarded-Encrypted: i=1; AKwUvBwS0xZmvaVwD3ppXJWdO1FnwLEHuhg80S+9KzZvxDjH6JS8PaD13WQZeMv81cCt0QifU8H3EUMCiXPSjz8=@vger.kernel.org
X-Gm-Message-State: AFuF++mc83zDbL8H3hDalUG9PUQ1QL+nBmO9x/ehlUtE1P1M48Fo9vEc
	jSgLuObjy0q1vz/4ihhYkFT/pU2llkNEK7jsF2QQaFQyw2A3vL5W5v7deiHrIgMDw8AYfGNnl7u
	huX7hTmN6fHfC6fin3rC8wZJyByjujCX0Se5dSSgqfVbQ2gbNoLVfIqJUyUB5ZQmmlXE=
X-Gm-Gg: AYBFou2KCqiVoslmNQZmrnPiWBG7YObfR/CDhIYgj7xmo96dcpOEPzs1aBKtPKYzdR/
	YqS1no1nXrI4A+DI+tHM90y0FFoqBdSDsOw9RMZrUIi5MSyNhYnZuEP7jE/NqYe3qZaq4uFZ+39
	JRl1EUYBYbxMgtifWE2rwYQ43PEv98dcdSE5OJdAdBHuO7CkQW+jRLf6EmyHj2lAdqZ+ZekqIKL
	EB1j2AyBL1s5is7gNOw4+PCogAP4SkKlN5RMLrVeofJZybF8UAUD+g9NbIG/eSRd1LSPHG3g/0z
	dO6EOBFK/5rBXV8SLqnDl2nV3WJjnEmwiixlGQcXyHafdfmzwL2YCdRe4qj/VWxbqntycgaJB+n
	AuPiztY8puar64/Ea8JJlqj6hI0qIzjFeF2WqzvNIv+YgkXnTbA==
X-Received: by 2002:a05:701b:4511:20b0:143:296a:3ed with SMTP id a92af1059eb24-144f92e1a7emr834568c88.24.1790119208839;
        Tue, 22 Sep 2026 16:20:08 -0700 (PDT)
X-Received: by 2002:a05:701b:4511:20b0:143:296a:3ed with SMTP id a92af1059eb24-144f92e1a7emr834545c88.24.1790119208267;
        Tue, 22 Sep 2026 16:20:08 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96f47d52sm1412845eec.28.2026.09.22.16.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 16:20:07 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 16:19:58 -0700
Subject: [PATCH 1/5] dt-bindings: arm: qcom: Document Maili SoC and its
 reference board
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-maili-dts-v1-1-ac2b1b76bfd9@oss.qualcomm.com>
References: <20260922-maili-dts-v1-0-ac2b1b76bfd9@oss.qualcomm.com>
In-Reply-To: <20260922-maili-dts-v1-0-ac2b1b76bfd9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790119205; l=898;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=eThQjenGT64SgHD+r38689AieVgWjY46GmeXWeTOXts=;
 b=6+17yGkGOYHdda9trnjeOawzjIa09iBG8Hv+8d2KDKm2X8qxA7cHZHZB9zlVB/zq2o2+h/ntu
 ItBTVbJIXyfAMedj5MycJWtWg3JwaLVX/cMqZCiC8fPqf7E6P0r3nod
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: -X5EOePFK9R3EUQ2A2x5CCf203EDGDkr
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDMwNiBTYWx0ZWRfX2GMlxKaJOdMG
 IZMFOb6JqfJ5l8R80Uv4QdluSz7znK9pWp+8n2+SL77bpkWTweI9EEIPD0WDJTLoGjg0kSQ2JR0
 qyuBgfGtOlOdrWmt+0/6YGuOOBLTNzI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDMwNiBTYWx0ZWRfX0H18Ff1Ma6sP
 4+U4ejmLdBdRUFR8H2d4Akc4WEhY4dfg676QXZqlWyyiAYtf9YA89/MYGZYHmu46bVBgnjV0tPP
 krL1Dk+2xqsLpWmNI0DnV1GC9N8esF2BiwsMxMxdqDs9SWM0jDgCiKXNBhEmn2SQTPXZZWEy9ls
 johE1bbhYizgwv4BMlHME7kqZ+mUCTQ9XrNwQfhrgOq4fjJJczw4bw3ydm73/8iZW55rMTSaTz+
 scGK8aQ5CH6AyUanOc3ycFbyBajPDGNWtwD6dDcvJRrYEBEDxzcnL5CD/c+vJynK/t+JigDQ4lM
 Hi17hATXPG1pXyV9Iq+Y5FEEn8OIyJAjdsFkASu/fkCecTORhQBWv6m2AK4ErrdRMTDfsFhFai2
 QdBPS8icj+4vkUa2xBdA+5DP3JYJ/08Jndn463dSyGNkVM4huoaO/itqttJXl2R/ISu8O/B2Xv2
 i7uxmwd0ZLNbfcUeA0g==
X-Authority-Analysis: v=2.4 cv=N828hG9B c=1 sm=1 tr=0 ts=6ab30d29 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=nEm8NXYsWs7wjBKNTMkA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: -X5EOePFK9R3EUQ2A2x5CCf203EDGDkr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220306

From: Yijie Yang <yijie.yang@oss.qualcomm.com>

Document the Maili SoC binding and the board which use it.

Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index eddf87fbd0cc..0e6b4fd8b275 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -187,6 +187,11 @@ properties:
               - qcom,mahua-crd
           - const: qcom,mahua
 
+      - items:
+          - enum:
+              - qcom,maili-mtp
+          - const: qcom,maili
+
       - description: Sierra Wireless MangOH Green with WP8548 Module
         items:
           - const: swir,mangoh-green-wp8548

-- 
2.34.1

