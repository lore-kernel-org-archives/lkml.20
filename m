Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE813845A7
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 01:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791424265; cv=none; b=AHDY4sqLh3nSAaJocnqt8Fr2qmf17XJsrhxzQfmwc4UOrPHiID406Y3moYvLlrLEbyqLW8XfxCzUD6sfqR9oVyFVoqhEkJKMYnaNe3z7u+moVJVM89E4SAKJYKBK5DXyJ/w4q0/ZyJbYgqA0E1i0kB7RpJhEX6Om0RFQDVS4pJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791424265; c=relaxed/simple;
	bh=4xcxFzPvIMc62FhXBW3ZbIQJAwOORkRwLRbjLw+7oJo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p9ARS2LAKLLNA1HT42SN6Gaav9kno9gpyJmNmP+YHKeKtGO1rDFHxqg2Z2nV2F0bqtOISwag/4+YRXl8YLXSxG2gbnUEcK5EVycXtZ9WIFtYLrmF0PNVgQ6YTJQWvPvR5XxZGpb0exhoNQ9O+VdOIUyZR6UZq9E9xxNNETE6vZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i/adctdT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QISRObz2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i/adctdT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QISRObz2"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6981hhCX434594
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 01:51:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LV2BIYsUVUL
	vybE9644thYeT30NIhyAOdd6md90QgEY=; b=i/adctdT60q9QRC/Lt75j45F6HZ
	UayrqAk10lf/8UzhpDFPX5+6esYW+AufyrN1/Tm8gDAns9tH12ALykTBcOWGyuig
	ldbSgb07gMxG6X6Im6lup9IAiVBirU97AdG7srg+5clq5zxZxBZnkqH9xOBIdJt1
	JM8P/ckKeM9xyi1C8OfpYCsiIzSk1OuvCcE4AxnbE3nvok0bIygec3B+KYwwThi+
	309Weolv4xosgO/m7Iz62N/O+tTIGq6ITlHpAX1GOZf4R1X66NGLZ2B10OXZfGH4
	BEbqrfZsTRNAdbtepTF5YYGolHma0WtdWue6oOi1uGPB9P4jI1T0maycpVw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe38jtj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 01:51:03 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3510562ef98so6283741eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 18:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791424262; x=1792029062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LV2BIYsUVULvybE9644thYeT30NIhyAOdd6md90QgEY=;
        b=QISRObz24/Sp+BuxRUgPqb8V18ptyOInUKjKrZrrhNhhErIxk4IQeeAOEv8MCjHuXu
         Bl0FSd3NlPwhyKbX+6AwYGe0WCWz+5NeFCJhPJmJydgQmvivPQJeQklkU5VqokRJzmJf
         y+GD8DOjnX0716lMmEXb3i8neORS9Uh3owFBGKSXg/pWo2qfcqZbhh8On+3cVRcHw3zY
         chRFqqK4rmzUKl5aRJj/OOpAtm1qh93LiN+Xn9R4aYlb2M2QsevGuTXzj4dCX5oiXbTP
         Hptfylco6qo5ZsxKR10ebpJd3yJxrdParR8v9XjMnZCj6pWGpn5yCXq8zCRqp4xYC9hc
         eGqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791424262; x=1792029062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LV2BIYsUVULvybE9644thYeT30NIhyAOdd6md90QgEY=;
        b=NGdZBsx68G4v8q552LtaHfmrLX/jO3h+X/W3pq9T4epzDfDCgmgT9psjgv+zA/WFio
         RKMcQMKqRy4HPa+rFigwYeKemJoWJfZk/kn2gVRYh6QqVPWHW29RzF4Be6lcejvS/gXF
         bymHzAq41ARiqzb6ebgcCmf+J1bYj1cjSwCcw+2kj9D0a75Pcb0N9bAOtc2bLyICMJAs
         vWYhVCuzf6JANc6levl6WAGOHhsCYuA7cB4UXjjUs+hezgdFBNsnacX9v3v+ENeuKEwv
         uCQx8Z3gopcv4eYmQ3glSD0Nti3ECNhiZ3pZtJWGhDZzgZz22FSXC9NxnXr8TMTUry3Z
         ZAzg==
X-Forwarded-Encrypted: i=1; AKwUvBzqEOj2tiVMYSMu2ukTNy4vdEYTjf7wX1SkmA7vTdH91hpRRuawCivr+ZNl3xeJ+jrbPGg7aAagQluUZos=@vger.kernel.org
X-Gm-Message-State: AFuF++nv31rm9h8NSQirLJbG35mxC9jNqGaCRgP5bAhNwkDiLLJbD0py
	rPeXuOfUWxDL/w4V26+gzhlTWBv2tbZC+8aK2k6QoitrgKYayZYk8RYNzCvZoh3UD+7755dsIyF
	1TemhYh5R2bMRdEDWrvDRc/3sVJB2S+FdOjxB/r0QnT7FJqcTAWOfKGQh0yuMb1Nbbz4=
X-Gm-Gg: AYBFou2TGfDgE1lLIxdMs0Tx2LIb2j4k1t9GxqnZeigwBcwSwQOXWWyZvt0usOjDY9Y
	NobACyUI/ZTd/i/b8DjSu0e0kWRDt6QGStlGiGK9DdGUXeTCYep329kTasZjk//D8/IjXUEzXUQ
	O/e2rVy/n54JXtaDbpUrVnBTbib9rw6MMTERsvw4j7WC4y96jTbAXjErrQfelYYk2qHzCO4yiRp
	gBoe1KfZq/DrDMF8tCRTONlJonQCFNwiU3qBwuq4pp7FQPT9tt26juPnmWiVu9OksIEqMnfG+XM
	IwVVQwMTzesfCYv12/dAOK3ld69D26ZwDNbNEvwD68ciy58H/Edw/b5S5Iz6I0aX+JkYVek9slE
	DqJBI28Tq7j2DtvMOmEwrjJWosP4O41qCC47Gjbikl+9mWcfkjaZyXG6CBUc=
X-Received: by 2002:a05:7301:105:b0:351:27bb:271f with SMTP id 5a478bee46e88-3515dd4c451mr4118606eec.11.1791424262167;
        Wed, 07 Oct 2026 18:51:02 -0700 (PDT)
X-Received: by 2002:a05:7301:105:b0:351:27bb:271f with SMTP id 5a478bee46e88-3515dd4c451mr4118573eec.11.1791424261528;
        Wed, 07 Oct 2026 18:51:01 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515abb7117sm11761823eec.3.2026.10.07.18.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 18:51:01 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 2/3] dt-bindings: phy: qcom,snps-eusb2-phy: Add Nord bus clock
Date: Thu,  8 Oct 2026 09:50:16 +0800
Message-ID: <20261008015017.3359804-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008015017.3359804-1-shengchao.guo@oss.qualcomm.com>
References: <20261008015017.3359804-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 4EYmBGeIOh2PseBbJ-jMen5p1sWP2-UO
X-Authority-Analysis: v=2.4 cv=QOz91QLL c=1 sm=1 tr=0 ts=6ac6f707 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=-2z6ypdNruSm38GMId0A:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAwNyBTYWx0ZWRfX3T69R7EuexLM
 p3K4NB+cyaouNQtj/JU8V/7h/LV/Im7Sxz+29BZ3nPKCaxQZCeYuDC0zu6TG1nhI16Z4N1RsdPa
 ZZs6k5T3R9M8PJfiDRQYagBOGI1fm5M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAwNyBTYWx0ZWRfXykdk9BEnZECc
 rgMujiMXyd52UvRULhp+AEpu0EwS3Uj14bO4RmvYEYzIqqMD7aH9vVKCbq9o+VkStqAYrrQc6cU
 i3/oj4n+3yrDwcET8l6SyB/jzNT9mi02ePTk8wIUVM4JoD5siMYPLpyyZoRqTgzI7dT13cUgqU2
 LwsW826XBsPyGKYsqMLKFVU+3vRlh2jLB+56YzkBB8DLuuubXXJ9kBkLN0KJB+hdCkNrLB4I3lQ
 BdVeJ3dmDv9ibdYyjD0P92363eG/DatHfMk7v9nzw3AyDF3STll3Wp8yqlWk7oMPmPLZb+Y4HIm
 cdGbzXcS47Sqro3EZeyy2W+opQNHQzLSlie9OM91ddw2CKrFhzE6pO6tpBft0PDbbTOiSKJQ1Su
 Z90ZWmg+LRRUNGQezfrset8G/bALhOzcW6dAl39qpywNBejvARqHuvT3hUi/oUIDDN4o7xBpdAc
 HNkJbTUS15KK6Xs1r3w==
X-Proofpoint-ORIG-GUID: 4EYmBGeIOh2PseBbJ-jMen5p1sWP2-UO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_01,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080007

On Nord, the eUSB2 PHY registers are reached through the AHB2PHY_0
bridge, which is gated by NE_GCC_AHB2PHY_CLK. Allow an optional
second "bus" clock for the AHB2PHY bridge, require it for
qcom,nord-snps-eusb2-phy, and keep other compatibles at the single
"ref" clock.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../bindings/phy/qcom,snps-eusb2-phy.yaml     | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
index 931cd0e7d297..67f2a587e65c 100644
--- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
@@ -34,12 +34,16 @@ properties:
     const: 0
 
   clocks:
+    minItems: 1
     items:
       - description: ref
+      - description: AHB2PHY bridge clock for register access
 
   clock-names:
+    minItems: 1
     items:
       - const: ref
+      - const: bus
 
   resets:
     maxItems: 1
@@ -77,6 +81,24 @@ allOf:
       required:
         - resets
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,nord-snps-eusb2-phy
+    then:
+      properties:
+        clocks:
+          minItems: 2
+        clock-names:
+          minItems: 2
+    else:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names:
+          maxItems: 1
+
 additionalProperties: false
 
 examples:
-- 
2.43.0

