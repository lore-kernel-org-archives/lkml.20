Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0EB43B484
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 15:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790697227; cv=none; b=is/vyEe9IpUo7x4oRrqrcZrMEk5hv63rUshoqHPqYpc8GLCVmoFJNpwyQ5e8jCByiaVgaeXEpTVUmtpAAOBp8Q4JtyWBaZ1lirnZu1T8523SohsDFO8v69Qns7IYxfBFH2Fb0+T2yQe0l0Ssyr3zOy1rP0O/321OqIl9erteNBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790697227; c=relaxed/simple;
	bh=aCGu4rJVd2imi2iJu4bW4ciGlLqiifTFBTblwp/3xf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RXGCAjbMWSQRmS2NZm/c4g0yz3eZumchJVxdi73U3WfITCpMdUYVfDrMEMYGQSRYBzetB4kSa+pyPL7zrK565T8MHy4NCDfpb8NKcoCeBPqCDwX6biCMSNOH86VBoHc3YTxk0qCCe02MQdkgdJhpR+WQn4KfHZRgvw4b7kHjZ+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hVFgEsyM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AneswNDg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hVFgEsyM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AneswNDg"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqhbt858095
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 15:53:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pPap05k5rCa
	kTZxFa4Fly1iRrFxq2pnN+HLMP17q9R8=; b=hVFgEsyMXxHhpc2716CBHaFWYZx
	1QSm20i3h0+wrARETA9qImRe37/V0KjS1I/AC+7MkTD2xHMVtbVt/BxWrxCAx/9A
	jfebCOd/kfTWjhlE59suVWFJdFbIPHUBLS5tVqiamW862r80+4Cn/HLDBg5xbR0E
	QQyk+/O/ZH1tI3N+mWVNzOC+OlKUgoP9Bz96MafJ3QSDfeZGK9nvzMsJVldWVMTX
	niCr9bBvnd1yUJK3DLqC9+H2RO2p10c6Gp8DWG+n1EQq7tk1O/W4QuEMOnWjVKJD
	mavl6pwjPCLBPHMKo9TMD9BUE4r7LSBHb/mtCyhLpeOp3V+d7ATsR46orAg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h08e0jasy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 15:53:44 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-34316295d86so7434310eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790697223; x=1791302023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pPap05k5rCakTZxFa4Fly1iRrFxq2pnN+HLMP17q9R8=;
        b=AneswNDgy5oJi/aAy65ZJs7GfJcOYR2YETgw8k3nrpXJKu5BqpCD7bItaZU56onkvg
         WqWNWQFCO5pVY6/ygN1McSB7cqXbwJ4sITt1Mp5c2OLhmFHiGG9b+lm7AHIxeWtqrCbH
         wyhxzGW8ktwn1anSUAUSTAqUiBtBuLWAnsNMbeaZnKUHf8BGAggRw6GM4pVGCPQ0bzos
         w25kfa6PcC8UiQNhFG7kglJfLp+Wt5k+7l52Hs6xDxa3GLLfn6Zonc7gJdnD2Ye6D9EP
         LB9Orfq7jpVTbl6s2Ytizltcb+omtq71DjDVIMjnIhHW9T11iZfXWicldpGYt9a7sON7
         FwBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790697223; x=1791302023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pPap05k5rCakTZxFa4Fly1iRrFxq2pnN+HLMP17q9R8=;
        b=fq8NjOylebj1OsHUGVC6deBWV1nkiEPT1aR4NuWGaWoKvoZxlOCcWQZrbCWFNiGQsq
         JAi9b8WMZJpqDP5Oz6WKY5ymdcYHktMXZItX9l71BAwcA2KbPff9sNxRDN5nCMucv1dc
         bCaVVv3EhB0lYOOqim7k1xYS9BED+J3xaPL1NnnFCbEuvTNbHdnsoi5vSh+XOidFtQB6
         2Fh8Psq775hfWpdwh77Q4q06nXLsw2o92w+upCUceZQwldPakEm1x//rucVwRE04Z5JE
         IR1Fs+MIaDvrRds4+2Rqy58jp5ABjs1VIn9jSP+CYg/FiL9wWnMZLA2LPEarT9sCbgxm
         1yEA==
X-Forwarded-Encrypted: i=1; AKwUvBwv/6fKA6Xey3DbLDdi0PQ0gaDkdRym2l3LaREObfPFqLnW0uQxex+rCQWXar9U9eaL5U+pYuRK654PDlA=@vger.kernel.org
X-Gm-Message-State: AFuF++llShcpQKMsiMNdr3VqRuXDPOMyUQk9dm6S6FPFJOkDp1pSnGXE
	phJ1Sdj/T05SzSLX/MRH2b7YOK4cR5wc9CsMqlbdKeOWGLg+QSRtCvZY7Ujx6N6z9WY/iK4WFRD
	XrNxZW8/vxHiXC5NzctO66Vskgd83Sc5TUMAumYaas+WMHe7b99bPgUWxBJkQodWwkbo=
X-Gm-Gg: AYBFou1NPGK58dDVZxrVeruTTd21nQ+Sj/ihmWHuCw5u0Otwy3o5p2nqK3tXoGMaJjt
	aKMGGKbTW2eUCXF38zVgDdBRiVbw6b3hCeikZu+6u+6tt6CHISa95rF0AXWsBxfRpG1+v7GeCzh
	iPSlzXjcIezaFzvrF6LHf+tdLmrHcs9xF2hBjdm9jn3ce8cvKSLqPDUFCjlRUb0WyTznMPe7KJ4
	gKBHA/2epmwQegLuI5+6kbeK3h3w3DDDV+Wr5cEdIrEULjdkA514KQUMfBjrVnnfqv9tIAMrSGA
	dYqUmYLfYCU/WYiOGlTXyH5FWR68lIgS080jNWdfkjLs1RZBWoi0Y55TiHZqfr8BOob44g9a47E
	0rEMGCrMKEWqfukGaILkp+jE981/n317c/Ep6JYBdHPBJhSp7jX5sQoyYJXA=
X-Received: by 2002:a05:7301:da86:b0:34b:d8dc:430b with SMTP id 5a478bee46e88-34bd8dc5f3dmr1272450eec.24.1790697223336;
        Tue, 29 Sep 2026 08:53:43 -0700 (PDT)
X-Received: by 2002:a05:7301:da86:b0:34b:d8dc:430b with SMTP id 5a478bee46e88-34bd8dc5f3dmr1272397eec.24.1790697222513;
        Tue, 29 Sep 2026 08:53:42 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14c64e7660asm200213c88.17.2026.09.29.08.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:53:42 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/7] dt-bindings: rtc: qcom-pm8xxx: Document PMM8654AU RTC
Date: Tue, 29 Sep 2026 23:51:46 +0800
Message-ID: <20260929155152.1898666-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929155152.1898666-1-shengchao.guo@oss.qualcomm.com>
References: <20260929155152.1898666-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA2MyBTYWx0ZWRfXw7fIMaAwMQfK
 phNOWjBkQEEFTHjmGOuX+1mEIxnj3jJ2Tg4dxss5F6itJQG0D7NYgU6MkUhcNi24nLmN7s9f46w
 vAs78gIDaqWPkQ3GiKsr/fGgc9sxu4Y=
X-Proofpoint-ORIG-GUID: auI_B_Rcf7IXApMpe67b5WAsOcyh-u0A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA2MyBTYWx0ZWRfX5mAtYJ/THPoP
 tAurD6pbjJWzYaM8GGLRo+hCMPYhbdXyr+8wJtsnWdyZ1dlROnahN8s1hrzMSlYsfeduPBc3XCu
 UyuQJu0LrLTz9TTDXGr6UHbjDZGF4jqN4Xz0osovDBLoGR027ayPYCJm4U0Ssz0JDRR8T51eoAQ
 LgpTQ49f+VP3kw0q85g4a1lOjCYN8uVrQnffLcsYLOuN1h5lwz+f749Taa99t5eyuLRsBoYTBtJ
 dUIDw0EL+w983y3IgSr5WpSLJiVLbGQ6Ior6ownvuMVPvgZ2euJu7rAHsVBARXenxH+FCPu3oGv
 QYIkON++oVZ/8MNiM95m9lZ8cJJExtt/BwgAdvtLlwb5Ji0qGfJfHhIrF0xSRh5nSc2DjnZjrps
 4cdVyZ9N+i3IwM2xldlseElZv+56PTz7qa1z6kt8Pcy3HFUlWcD+MisDUpgSZPN6DrdNYG9Liii
 GN+1Wok9F1FAXd68PGw==
X-Authority-Analysis: v=2.4 cv=WJ7qzXsR c=1 sm=1 tr=0 ts=6abbdf08 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=YO0Qr2Knm37rpyWBINsA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: auI_B_Rcf7IXApMpe67b5WAsOcyh-u0A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 adultscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290063

Document Qualcomm PMM8654AU PMIC RTC which is compatible with PMK8350
RTC.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml b/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
index 7497dc3ac5b2..78fa1d5ed028 100644
--- a/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
@@ -17,6 +17,9 @@ properties:
           - qcom,pm8921-rtc
           - qcom,pm8941-rtc
           - qcom,pmk8350-rtc
+      - items:
+          - const: qcom,pmm8654au-rtc
+          - const: qcom,pmk8350-rtc
       - items:
           - enum:
               - qcom,pm8018-rtc
-- 
2.43.0

