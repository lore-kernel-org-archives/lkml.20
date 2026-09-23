Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2CE3DD854;
	Wed, 23 Sep 2026 08:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790153211; cv=none; b=uPrXSai7I0pR7nReO2oIBOA3B8Ky6IOJgwBpRnJZaenHlKucyyyKa1NvkgUa5Kk3yflmk7PPgXfvbWDGDbMfwoSe0X2+WLsDfQQXfNhiA7MosM3YW3AmZVJUC8YHtpxWbNjHAQecygeYFyo0dq5Qibd6jCcNDoRESmpoct2XRIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790153211; c=relaxed/simple;
	bh=NoAyKVM7bxxTsDCF1ZnzN4S6Dv61vfu2kj/XW5dNLL0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b5DmiIxOY4d1cpwVlgC/TqE5iVux+Rda1bYjpAq/m1Z3VyDCTPoZs4ttbwWv2cpmff9fngPB5zNN8fc5hJOTElNmTg1ucQjGzBmCYVd6JCyYbT5HZg3cKJJF7jBdQh7mP9wYv/FN/EKBbhtUHyTiGehShvovQW/dx1pOGqNFi1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EfB+NicR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EfB+NicR"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8JpqT1387767;
	Wed, 23 Sep 2026 08:46:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rbL3/ADmksM
	6zthu2N5QOuRTVS+v27iPMKRCYNgc3L4=; b=EfB+NicRT94y7Vmstd0SsySK0Jf
	NTlBwc8M8iDTExxqobZHg9cNB2p/9T9jcNn0rahHeiihXuDNDhJq2OKdHl9zDnyB
	WH1IoLTEiAynw1ze80kWce1LUZua31vPZ0xiLSknXibd0+McYT5PW8kVQI6oZzk7
	RCw7bP2oxkNpH6L5+5c7DSz4hxARw/oHj1g02fezYpRoasR7OBIjimPOqLs7lbE+
	gAijh8IIvvQhZeXFYrJ1nIwWgb4GZjdjq8L2TYaV6pRzNLC6bf3YRHMcveiQeK96
	FyL437QTYONE53g8/70GH1n9Wu3XdvD5PdRWRZfIC1EzPBszqyA7JAIfUAQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guyma2xtp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 08:46:39 +0000 (GMT)
Received: from pps.filterd (apblrppmta02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8iYgk1726206;
	Wed, 23 Sep 2026 08:46:36 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 68N8kZU01728414
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 08:46:36 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 2B4DB643; Wed, 23 Sep 2026 14:16:35 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Subject: [PATCH v1 3/8] ASoC: dt-bindings: qcom: Add Maili LPASS macro codecs
Date: Wed, 23 Sep 2026 14:16:22 +0530
Message-Id: <20260923084627.748920-4-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260923084627.748920-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260923084627.748920-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: DVMMQEU59qxViJ5xiyCSCWA_HLEr8MQP
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzNCBTYWx0ZWRfX4I19pGNKUhyk
 9iyBZ7MPIgagCyNnCidWBrVBBC0gdnWMoNEO+r4kMZWDRfebXVWTHdR6XOK32Q0V407K4KoAPfq
 C/R0ztzecxLtlnnIRM2GpMcTbMJWuQ4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzNCBTYWx0ZWRfX3SzTBLkPXKhr
 5sf2QU9/0NLmyH/yLDWVDmLZ7klLhRr2/4WrYKAkv5BvoOSJXpj11xLrv+ydDZ6/1sApThZ2HMz
 OGbXbuFtcbfnp3z07trjgHZ0NGra952Kou5wPwjkUnaybAjDGGd0p4u6GhmLJpX2JVnHUrrYwN9
 Pb+0AIgYkPjRP/fjxaVvXzz9ufqFoq7J2zWlHKfGUz0GK+uQXawu85y0Ephp7vAEQU4EFe5rUO4
 qRiP00Ww63HmErP/Vz+A/423fCfBGm+VDweSjIjIa3ewcd17lki1DMEi+75RR8t/hffcnjI8uiZ
 KVA6HBV2HeYS5tyIH1GOdQDEo1Ou0anKgxEX4hLoMW/OjwHvAHvIeQf/pjUfBbSuDs0g0e6nFOP
 Kx5MLeVEOqIu3VtlbTwbzrfc9HHlkqQWQGsyT+e3zhYW3uKeRBjf4L5aPkoLjDFZvLPuvnxbtsS
 tTkqpbwxqv0/Rq3rOEw==
X-Authority-Analysis: v=2.4 cv=N828hG9B c=1 sm=1 tr=0 ts=6ab391ef cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=WGZyT7xzyh4_t1xe9HgA:9
X-Proofpoint-GUID: DVMMQEU59qxViJ5xiyCSCWA_HLEr8MQP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230034

Add compatibles for the RX, TX and VA macro codecs found in the Low
Power Audio SubSystem (LPASS) of the Qualcomm Maili SoC.

The Maili RX, TX and VA macros are identical to their Hawi counterparts,
so document them with the corresponding Hawi compatible as fallback.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 .../devicetree/bindings/sound/qcom,lpass-rx-macro.yaml         | 3 +++
 .../devicetree/bindings/sound/qcom,lpass-tx-macro.yaml         | 3 +++
 .../devicetree/bindings/sound/qcom,lpass-va-macro.yaml         | 3 +++
 3 files changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index 6aa8ccd60c01..de65a3159380 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -29,6 +29,9 @@ properties:
               - qcom,sm8750-lpass-rx-macro
               - qcom,x1e80100-lpass-rx-macro
           - const: qcom,sm8550-lpass-rx-macro
+      - items:
+          - const: qcom,maili-lpass-rx-macro
+          - const: qcom,hawi-lpass-rx-macro
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
index 2df72450d36f..0838ed63cb22 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
@@ -28,6 +28,9 @@ properties:
               - qcom,sm8750-lpass-tx-macro
               - qcom,x1e80100-lpass-tx-macro
           - const: qcom,sm8550-lpass-tx-macro
+      - items:
+          - const: qcom,maili-lpass-tx-macro
+          - const: qcom,hawi-lpass-tx-macro
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index 7d56f9c36056..481b76504c6b 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -30,6 +30,9 @@ properties:
               - qcom,sm8750-lpass-va-macro
               - qcom,x1e80100-lpass-va-macro
           - const: qcom,sm8550-lpass-va-macro
+      - items:
+          - const: qcom,maili-lpass-va-macro
+          - const: qcom,hawi-lpass-va-macro
 
   reg:
     maxItems: 1
-- 
2.34.1

