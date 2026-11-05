Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793877101;
	b=snDvcrcvvxOW4zkApNh6JJ/XR7KYGPu+9yIb1df1xPZTjHP7hMlfdH9Hy6ci9i+kgY1p
	 kMUTADRRFOcgUc0m0DVjAVzKAV5dr4hrYuTnT2qJV8B81p284oaNngZ1lduz19ise8faV
	 3VOB+77KXvMcmYaEoUn2DrG3ERvDsbF/Lz0+3wQmN96XU25LFhpDPzV0VtHzjdrYUtrx7
	 K1MO57VHNHAMetI2pfO5+6iUem9+yX7mCfY62mT0mx2ZUxPtQGbG2x1Rm5EFaEk6aMDiu
	 i37S7CuMUmXjnDaiYRbQpsrvuo/zgZfUl0W+pK6sAcD3inbRMkxWW9jv/3JOn0KC6tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793877101;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ykQcj0AQYTsQP8WoNJ3puslG+JpNUOX6RrBb4qGTMJQ=;
	b=3raOnouqG3yHBJIBGBOpqVH03vuOU2GEbRGrJ4kbVS8PoEPaYxbtT650sB4FtHW0/z24
	 5SFn0q9sc5wwFiOUhRYz3I5SujPD9HDWPv9e9hgEAMr3KqPv9X/IU+bSYA7+1ddbK2Nqt
	 BmvEa+Bnry3qyxi2xBp+8LR7HRC9sglS3ykteffNhxHAY0JWl+fFxX/hq15TzUdtIks/c
	 06Q35QUbQ5YlEHScZlYq50Uxq27RJgoUTzbMd3Q+8mQ+7VHUAmIJoiJgvXCB4m0mnrLNt
	 RTHrgUwB48zSDfOTW4J29WsytlNu429ZXx29v2/xy+EIMsk9ADhL26qFuaHbg8OBohA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c4HjtbJv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cSrCZKuf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964F4606A332
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:11:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 964F4606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c4HjtbJv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cSrCZKuf
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5Ai3kg1583132
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 11:11:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ykQcj0AQYTsQP8WoNJ3puslG+JpNUOX6RrBb4qGTMJQ=; b=c4HjtbJvOEEajdTx
	j2WA4SDowGWC0tmbw/I97/O7NmwNUj14QTcUFv/LZBssN1do5KwauiuQbjbdjBzs
	tt0N6NVuDFTSHm6hgbSLA/uWRIAw35D8fWU67fRZ18ln3tVfYJExboI6uSBYL+VK
	nBJ/WYkuNOFtVtkUJFF7KUkgaaIX2SYVNuR5R110kEi052bBewkLQVGWa6j5hvlJ
	pL/f5ZOWZMuSNhZzxk/hKR6aPqwlLZZI6IZ9gNX70svbVFtwQnuMo9CAow3HY8bQ
	R4XHrT5VuMg5kMBFOcC6Nl4D+rj6pWPhlI4McBMbyWPn9B018Nz4CYL259B2DUlD
	Nt+weA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrraar3bq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 11:11:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2c0e6653so337457485a.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 03:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793877099; x=1794481899; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ykQcj0AQYTsQP8WoNJ3puslG+JpNUOX6RrBb4qGTMJQ=;
        b=cSrCZKufS6xLFpzSjaaGkUvHpnQA3DR6Agnpt/rEPqsPAAH8BP4bYPl0oKyh59Jo4x
         vBJxM9rZGUNK/7NZZqRxnkEA1+ggUIXqlwEkOHuUw0KAH2Bc+tL6HHuKYoOp/Q0TPura
         CMj6tKPBF+veK/ieYnaAVGqMpp16b0Vq6KBVUoBia7295VuOxpcKIOf3WybeG5MtebMR
         xE7Bjls+jT3a/DNGOAGkR5k+zVnII7iRSwLj0PfG0x6TScmEllfWxTVSZG6CJEksHnle
         qYq6cX1mOr5ICtlKSn7iwdGwckOMZoceZO+o8G6CFnDMg5ahe+Z5JHFh44ACrh0uWp1/
         qSZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793877099; x=1794481899;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ykQcj0AQYTsQP8WoNJ3puslG+JpNUOX6RrBb4qGTMJQ=;
        b=LG4xQE4yP1E6HGZIvIxYPyLrYbAceT66YpWFHkj9E8wmaygOjdFKnW0eGbqDip1W5u
         3K+tywVvr0CDMUDw/l+Tz4dyxfn7ignuYv3LsDZuNSsCB6RcglyiD0jIsMJQJ0LkLBKL
         7eNDUBSv1i59iHRfxWwy+EB37Fch51tt4KY6G2uqrJ5RDbJfV1qe3Ran6bgCGL/3KVH5
         ycEw9pPOaj1stsFT6yw2SEw+lYH+zmS1KZ3pI7ZAbsWdZdQ2lBbi754/BdAj8NtRmlso
         CTzElp+2npqOltB3zTev11cMqeYx9AK1e0hDFGexYrTnNIJTG3Ol7TXPmOFfUbAw/714
         w4ow==
X-Forwarded-Encrypted: i=1; AKwUvByz2WRpeR0krWbf6B6b8eSyGrZtiIyvb57SIYZBSAn7RNvS5z79BThzeRrZ1KRs9U56UXve5EK7F3J3kSc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+55VAzAMDWVnmGSCMP6wiHOsXJ94t9Ego4rJXEkEjZ2/xFIipN
	nD4RMeSuYWTRfahrv1odZpwR/IyvqGxQtT0CQdOFw1l/uGR7b0oAcrwJcmq68p1vwN5rNNXpIMY
	4ahiEi0vOhMGbLVNlxfquNB2LoNy659/oLkv+miEKo8Vwad1Jt7d69CeDT6xrrss6gVk=
X-Gm-Gg: AYBFou1ayyCPgcre9pegcex//h4vjC/nichmiZLe2NgIPTsAgSZ/WmFtWBu1kmc0qeR
	3ac1haMpQWYjjRayweSJV11wy0DbtztWRF869xJfbPORFTMUBjysvVKStxT9qtbofAIe3nihzd5
	8VQy7UU96/iYau2wxmx3zsvt2xQ8QU4JoroHODb8OGlkz/eiBZ8YaysTaSKqAffD4bI3uQ3LuPF
	xI+M+TqJL6MUd3PyrvjPAUoWQcWk2pHUHQ/AVcOc0+FPGLaHtZ0JfNF8Jhs+1CGN4K+S+3yFBon
	zVDJ221+2r1HIxJ+BEi/FZhaSbhKNdNOGin3DuMFWZNtshyUZmYZaSrGWF1tk2iSnMJM1cSd4B/
	nm/nqlyMpwOK5Txys30FtiEAyq4soRmK9ZroztnMq3PH4VBZCWU0VV9O80ZQrydCVNzEWFbiEFN
	sobybhmdowvHNYbLYTWxG/bWmWLdeyXZHWuhHoN3+R
X-Received: by 2002:a05:620a:26a0:b0:93f:52c5:a31 with SMTP id af79cd13be357-94421802977mr2976181285a.73.1793877098869;
        Thu, 05 Nov 2026 03:11:38 -0800 (PST)
X-Received: by 2002:a05:620a:26a0:b0:93f:52c5:a31 with SMTP id af79cd13be357-94421802977mr2976178185a.73.1793877098432;
        Thu, 05 Nov 2026 03:11:38 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d488f183sm438320685a.39.2026.11.05.03.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:11:36 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 19:11:00 +0800
Subject: [PATCH RFC 2/3] dt-bindings: i2c: qcom-cci: Document Nord
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
Message-Id: <20261105-ccu-v1-2-3accc4b901de@oss.qualcomm.com>
References: <20261105-ccu-v1-0-3accc4b901de@oss.qualcomm.com>
In-Reply-To: <20261105-ccu-v1-0-3accc4b901de@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, vikram.sharma@oss.qualcomm.com,
        nihal.gupta@oss.qualcomm.com, vtumati@quicinc.com,
        bryan.odonoghue@linaro.org, Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793877074; l=3045;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=53/2ZtfsHA+VIBh3y1Kn8crIdUlYDr0140lytwfQVqw=;
 b=0INrlV/BUDtGc6MZEvf3Y6H6D08QeqmW9s8YpX4zWjftwYH8/6aUejLX4mik+ApWDQN+1qeCG
 8eEHyRqGfCdDF+EInZXIuiu3D//4jO4D0QF5ioDwyBtK8BoITnltOfa
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0NCBTYWx0ZWRfX+Gzo1QyQaKB8
 RcB05WlPZ0M7CgRpRBc1NffqGZxG8Ub8gtdBDLEdZAyea6dsW5YZuOgQglRye1NW8RsefRgWR1C
 auINNUjEDdLzozVkxBS+yLUiwPVjSj4=
X-Proofpoint-ORIG-GUID: onuhTYmGOsoyq2PPQoT2Ywk8FnLc13n-
X-Authority-Analysis: v=2.4 cv=U54Hnuru c=1 sm=1 tr=0 ts=6aec646b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=nHM2AM3XuFFpsIOFzc0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0NCBTYWx0ZWRfX2wYR46A43WGH
 LPKj7p+oth5UpOhXSIkrFeCzjulg2xpqwuH1PG4f69vqH3XazbNJQhlmGyKHLbZe10belkIIi7v
 ixlW/4gL823u7mIL610A0z/1jGzPqmsz1A0BACV44nRjBXWFqayQIyX3wKpoUWEaQLRFnSzNjVl
 8C44WX18AZAGy94YbiB/D7F6HarV7FFygTblVqbxnU9Nrd8gA1p8PTx207xxu+iSV367CvU8IEZ
 Gf2/C8jSm8yqoitrqtTcuKYWxDcSlRXw5eCN+rPiEbrYImOWWXN/Qwfj1cUt2b41jEtgSptLweg
 WoyoYCMCqkZUjS/r50Vg8AokxoOcFRg9jN+rOniCkTgTEKLGVO1yk6qXkE17Vlw59GR+p24Rqgs
 q0TpaQjF8iQHUk6Qz7XTI7yPo0ZtJ9biPI6BsI6Mo/0iavBsgstvIb2PIX76/L8fqpi5/olOUk4
 TRfpggm/VewcOuitYKQ==
X-Proofpoint-GUID: onuhTYmGOsoyq2PPQoT2Ywk8FnLc13n-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050044

Add the Nord CCI compatible. The CCI is based on the CCI v2 core, but
is wrapped by a CCU. After reset, the I2C ports are routed to the CCU
and the CCU output mux must select the CCI before any transfer can
take place.

Add the qcom,ccu-mux-sel property to describe the syscon register and
bits controlling the CCU output mux.

In addition to its core clock, the CCI requires the CCU AHB clock and
the camera subsystem top AHB and fast AHB clocks. The top AHB clock is
required to access the CCI registers and the CCU output mux.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 1e8def25ec0ec1ef6b34859709d10a2a36fe36f5..5a25ebe0e61f686b86306a1dc94911e302d9b440 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -29,6 +29,7 @@ properties:
               - qcom,glymur-cci
               - qcom,kaanapali-cci
               - qcom,milos-cci
+              - qcom,nord-cci
               - qcom,qcm2290-cci
               - qcom,qcs8300-cci
               - qcom,sa8775p-cci
@@ -70,6 +71,20 @@ properties:
   reg:
     maxItems: 1
 
+  qcom,ccu-mux-sel:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      On SoCs where the CCI sits in a CCU wrapper, the CCI I2C ports are
+      routed to the CCU after reset and the CCU output mux has to select the
+      CCI before any transfer.
+    items:
+      - items:
+          - description: phandle to the Titan CAM_TOP syscon
+          - description: byte offset of the CCU output mux register in the
+              syscon
+          - description: mask of the mux bits of this CCI, set to 1 to route
+              the I2C ports to this CCI
+
 patternProperties:
   "^i2c-bus@[01]$":
     $ref: /schemas/i2c/i2c-controller.yaml#
@@ -131,6 +146,32 @@ allOf:
             - const: cci_ahb
             - const: cci
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,nord-cci
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Camera subsystem top AHB clock, needed by the CCI
+                register interface and to access the CCU output mux
+            - description: CCI core clock
+            - description: AHB clock of the CCU wrapper the CCI sits in
+            - description: Camera subsystem top fast AHB clock
+        clock-names:
+          items:
+            - const: ahb
+            - const: cci
+            - const: ccu_ahb
+            - const: fast_ahb
+      required:
+        - qcom,ccu-mux-sel
+    else:
+      properties:
+        qcom,ccu-mux-sel: false
+
   - if:
       properties:
         compatible:

-- 
2.34.1

