Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B563023EA8B
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790326022; cv=none; b=f8kQiJSF727r1g3pGxF3Y3kdrBvN2mqsnpndGasmTTWRZbnFXJoa+Sm7+sJL+/hs0OUXYHknyTeN8Njf75hM14FfyMJ8nN8rF5crQeBbYzsALwN2T29TOBNYN+o8d9S2MsObgV/r4xMqFBedaHWGJV/UmYRAmoKGB73WPXpIXMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790326022; c=relaxed/simple;
	bh=IHl96VfDfSLC8aLKVP1o5N9BHbNNzUMjoemjAMwnB/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F5xdhXakpVZgWDta8CMDeJ9aCRjqnk6gqbRL8m515MTUdHpFACESPU3kA+QHXXg+EMBeWnvl2xHHmU4z+RG36bh0K00kQYY3RcLEwRCih+N86CIgTE7HuWbuerC9qXMl9H13GyP0ZnD7Q6sKu2t/P3E/r7VwqTkLYGug2JM/UAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PFHOJl2V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SDeAik7X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PFHOJl2V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SDeAik7X"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YM4P1055331
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:46:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=eEmsPPYN19I
	2pfZSXr0Sunn8u9Ec3DlWKgauxQhoZ6M=; b=PFHOJl2V/odJamvHBpH1T7DAnCR
	njI9P+boHnY4U97nX0M8nvxKn0adteUOFi6vj4/8grFJAK0nuGbV/fPwJ9AJbUBI
	fQ7teuc1H2mFSEaWZEr8Grzy4VlUbJ8fvZWSeMTArv4lJRnFB7hcfpNTxsNrbAQq
	PSCtqxuvpKeNfzdB8p4FHalUsYMdwKzlI20ruUtxEiL7nM17qACakzHJfyl1eXoJ
	Vsk1rvGPWttafIU3ZoTha3/Vrfh8JrloMpkFqHJKmTGqVUP66g8hRdSSUk5stayR
	kw0bt137xQo/HL16SXVDb4KTJvIMpLNBWOheYCEUjl+24faORc/T1U76Tzg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwce79p4e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:46:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934963b2bc0so149927285a.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 01:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790326010; x=1790930810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eEmsPPYN19I2pfZSXr0Sunn8u9Ec3DlWKgauxQhoZ6M=;
        b=SDeAik7XQ6aBAGo4w4wldCYpvKPp9u2ALEZ8vBMT2BjnoNfsT055aPvpY5ddRWyfjL
         J9I3J2ZGbY5XaKrQTPieUgr0U7GTvtqgkbGnbRp5+XDeofa81Txfuu0XWgqim4e+p8wE
         lhd7uHQtadsGRjlWz35wwcWRI/+6kPNPMArDbD17kr/2PnuG2FgIcr23c8EnMXhtYeU3
         YOC1E1WXvl0OjkyWVNe/82GyZ/1vO2mZSoo3Yj/EL0p2I5vuawEPWm8933ujTyJcJic6
         SL/5f9yQCVa7/qJNMrNWcWdpjy0IFJHajw/UxkPaHuJJb/R97S6izclrngnAwA2Y1ZDh
         YKWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790326010; x=1790930810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eEmsPPYN19I2pfZSXr0Sunn8u9Ec3DlWKgauxQhoZ6M=;
        b=CcqSSk5lQQ7hPQ9tv4gl4BCwQN0pZF7dasE/VQ1vZWTyaQ8dxZlvjcja9zocEV35j8
         LMV5/Luhnv9hYYp3Ad3w6xIXgm0CGQtFZa5CyxAKhp2yYkAMXFuzxTzLPzNl7eAjdUDD
         6Z901P63xVL/EoN2aysj7tkFDHz72VKkMljFDLqbrAO3LsQHp+F2eI4swokmNi0CfHG9
         vCvLQssGiPqlY+sa/gKnU8UcUJ27P8pD/hYX+/MgLXmOd8gZ2qpwbSfiGBjM/ouEmfD0
         wmLe7ES3Px3JDrKXlZSPKMebk2sf/NQkuZ0hnkZa9lDP+qiE6MYxuN0aQzBo2YTf5Ew0
         mvnQ==
X-Forwarded-Encrypted: i=1; AKwUvBzlMYuX3q6Lv3IN6e8zq48CqbxHT5A7vhrKhsR8BdZFMcL6a2FfkNgRMe4v4WW/jtZtRNOLZwHW0STehX8=@vger.kernel.org
X-Gm-Message-State: AFuF++nDLc1db0NwyY861irkqS8xFk65V/kcSQ6c08/FaB2qpr+kTz7o
	Oy5G6OjkLPPjS4bfPEiYp4omiPNJ227astnU2kcx7FiL5zli6N3xLLptylUy/2kEM5Om65KXZ1a
	xzxB7cOfBgvxdB9EeyLzSj2WFZH8+pesXdeNqQix7yUk/mp9Py/0EKi5wPBSuA1OD45Y=
X-Gm-Gg: AYBFou04ZlTYm23vlbJOPAKU2vokNPsupVrbGoahMsKzod0drlZY/4KDA/FSrfjS2/S
	5583AmtbGCkgLzdOWBnIRg5VVvXG0zIAUhW5VLkjTGFa5xTs708uwFjI2G0UeQgP5dy1ryna3B1
	4QBsOjr7Rf1T6ZJt9D/uzqZWR29NF7iQQDdsvlPQpRtkzS+o2050RovgeigufyCMrnHFXJckC6H
	oY94dENznDz723J8mkGS7xgot9t3MxCazV/IcvQ0DRIB4W+D8a4pw4UE04hnWxjL5G51XDWvbx/
	M/LRdI/7YHheUQLvQqzu/bEOA3OtBX2bL9DNh5Mg7gnMHQWP9Eh78hAdCJVQCrXIHhv3WYFho/x
	qCwUECn4Io8c0
X-Received: by 2002:a05:620a:8009:b0:93b:d79a:c465 with SMTP id af79cd13be357-93c43e0fbf8mr320421485a.61.1790326009901;
        Fri, 25 Sep 2026 01:46:49 -0700 (PDT)
X-Received: by 2002:a05:620a:8009:b0:93b:d79a:c465 with SMTP id af79cd13be357-93c43e0fbf8mr320418385a.61.1790326009352;
        Fri, 25 Sep 2026 01:46:49 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a64f9bcsm5281953f8f.32.2026.09.25.01.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 01:46:48 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 2/4] dt-bindings: clock: Add LPASSCC and reset controller for Glymur
Date: Fri, 25 Sep 2026 09:46:33 +0100
Message-ID: <20260925084635.112399-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925084635.112399-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260925084635.112399-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 5mys8VIlexqOtk0-X2ABbWm8iLtrg2PI
X-Proofpoint-ORIG-GUID: 5mys8VIlexqOtk0-X2ABbWm8iLtrg2PI
X-Authority-Analysis: v=2.4 cv=NJFAaE6g c=1 sm=1 tr=0 ts=6ab634fa cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=-l7Lzzg0JijIaF3KBckA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzNCBTYWx0ZWRfXzjNOXWNrC++Y
 1QLpLf2hwzEll1fky/xjSzzR1afIuy7HWXMsnOBq36kMQHJfBy7EGqAhsE4jhUSYrhQRMnCsF/3
 vLDkw7XgDrdOhZiuxwZXTlvmQ3OA5EjdM6p4Okgyu+L+784LuyNJ16gZezQy5gHUiGYitXH/Gzv
 RxYlI8gfPZWz0xynpzxbeL4Jfqt3xLV9rbuHE1z/YeM+Qs+frHROsjw/zef5NZ0fWIBKyabJW9K
 i8c2vB7iuy4xmKRv6IEaR7DYVopr+fkuuBHk8PepeB97Kr8lt1Dn/F5xtg8+kkgpJXYa6wtWKpe
 rBcphehRW9QuSPPwt1stx7Ir2l1hFQFq0nktL2NKDKJECIyLyVA9Dd1C/QuPYHKkFc6vPfHdFol
 hM+QH2WcuCmJmgfG8SbxqlPtHbYoLd8HpbFDGxOLqKSH9K2OgzPN0K5Uk2uuMim6MckBPUYeUvk
 TmGO1a3WSaQCi+BbXGA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzNCBTYWx0ZWRfX36k6b50/UvTn
 8sM3jrZrvXbL0ba5khhLabWYV+K5CH76XuD8L34Zdfptql2iBTSu0dcFzR8JEfASWV/ny0jl9Rz
 1zXXJQJ0aWdts0AWJkKsjYV10WPUrhQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250034

The LPASS (Low Power Audio Subsystem) clock controller provides reset
support when it is under the control of Q6DSP.

Add support for those resets and adds IDs for clients to request the reset.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,glymur-lpasscc.yaml | 10 ++++++++++
 include/dt-bindings/clock/qcom,glymur-lpasscc.h        |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml b/Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml
index c047c0174a93..916ab1b3dbee 100644
--- a/Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml
@@ -20,6 +20,7 @@ properties:
   compatible:
     enum:
       - qcom,glymur-lpassaudiocc
+      - qcom,glymur-lpasscc
 
   reg:
     maxItems: 1
@@ -47,4 +48,13 @@ examples:
         #clock-cells = <1>;
         #reset-cells = <1>;
     };
+
+  - |
+    #include <dt-bindings/clock/qcom,glymur-lpasscc.h>
+    lpasscc: clock-controller@33e0000 {
+        compatible = "qcom,glymur-lpasscc";
+        reg = <0x033e0000 0x12000>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
 ...
diff --git a/include/dt-bindings/clock/qcom,glymur-lpasscc.h b/include/dt-bindings/clock/qcom,glymur-lpasscc.h
index 3006b12e385e..3fc8e7313cab 100644
--- a/include/dt-bindings/clock/qcom,glymur-lpasscc.h
+++ b/include/dt-bindings/clock/qcom,glymur-lpasscc.h
@@ -13,4 +13,7 @@
 #define LPASS_AUDIO_SWR_WSA3_CGCR			3
 #define LPASS_AUDIO_SWR_WSA4_CGCR			4
 
+/* LPASS CC CSR */
+#define LPASS_AUDIO_SWR_TX_CGCR				0
+
 #endif
-- 
2.53.0

