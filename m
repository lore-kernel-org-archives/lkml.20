Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CF333A70E
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789611379; cv=none; b=jIEw/y7Ffcm9Jb7a2uaIJhVsxazxnwvZzXzXsXEk9lv1CGA5KjSs3ZTkCpV6nCfRY3myF4VhqQ9sgV/1EVvY+Fa/KHnPHnU+IGOu+pLSFwcxo339Adw3IPrmtJn3q46P64TjRNxn16NlJRiqeiODUO0igXPzMmAeObOQhcHvU8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789611379; c=relaxed/simple;
	bh=2W5RObKszArgoD/A87TmkLDGOjvuwEXcOAx0z60Pp+k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z3sGAGWMQ8N1RPQyVf4geG0Ak4VHe1v/Xn02+tE3o0eTLmmjD5WnuaoEMKsb3kU4wlNMrRshtM0mxGEJzMTXcgpPpQoX7eBCrEJ8xNXC9FBi3eghQNqARJJzpDBD1YDJrFQ5Y1JGoEqiYwThOG6tfkvvRkxd6+awMdiULYybS9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BBuWnxio; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j/45cdoE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BBuWnxio";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j/45cdoE"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H1qGYr3897282
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:16:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U+25ut/u/ktG52cH9j/Y9VE3SglkY0dcyP6JoqO5Rao=; b=BBuWnxiotT+QOb1X
	u/orUgxKluow1+AyYeSCXRdW8zYPbgmSd/oJDkJlk6/NaNJax6PsY+hPz64e1egL
	c0OqLl9kqMEplYejF0lnn9HfUS4DKxkTsme5dxfMfYUmTxiwEwS7lNTC9y15Q5/+
	cFIUL+pzjjji4RAgHQ5G1+WSYFBq7ZiBPlROJCHr7h7JCZBrLKj6rYG+P9K/Fv9W
	T4fgNv/qfG6Lv/QhchRuADp7dAsiAoURb7lz3OiqSQD/fIdIrTRJ25wfKZAJ1chj
	rfJi0PZmWdi/tyOIqhaUmn2TPCWDhRGPIWfDWNJE6a6g6bM87to1eo8hoHdT+6TK
	HtiUtA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy6asvpd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:16:16 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8710450f731so467586b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 19:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789611375; x=1790216175; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U+25ut/u/ktG52cH9j/Y9VE3SglkY0dcyP6JoqO5Rao=;
        b=j/45cdoESpZSFZQPV41HW+XuJ159fAAvR8fUKAsfJIQw38bs1DmwFYuk5P2hHjLHgG
         qFyoFhkp12l/+rI6J02iOZLUW/zQOClcEpBmmQoRhsD9Gt6iLl7pHOcgtaxlXMAgObCo
         5UwI+DZGTYEa6b5ipwbJZKqEPKNOfjNXWJb50omQTir4ADTq76Nuf+vB78+5vvGdCj9R
         hTjplPY/90KU4YQXkGiIkzn3YmKZM5/NkwPMal4Yj6hbm6sVVq1EobkOWSvHPZNOzPvQ
         fLbX9EOyANT41QZxXOuXSCjfUaES7Osg3pEgHNNg5qshb8hGhJMHop9A089Wwr8zrxmY
         W7kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789611375; x=1790216175;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U+25ut/u/ktG52cH9j/Y9VE3SglkY0dcyP6JoqO5Rao=;
        b=0wtl6YHOD0aisKM9WkvD3reRUJKJB8tu2VdX0psCYvFijc1wCXwOHB2ydL6EQFgG9b
         kURzgdYPlCaPgqKQTOkTkFK7+3LljsAgaPTAf3Wmy3/S0nPk6uCTlvHOfbzepNqi64Mo
         JDcTLTMk+uK5Lph/iJkz4yEnPR6oMiYz7XyfaXvVYwc0/BdMZlonmQwyQswZwhp0e/WQ
         dX2J9wgCSXDQ8G07k+P1Jh6ZQHwwR8al/W/GlGL5a8wt7Hy/vZOLvK4qyh98ogSvN2jl
         k0RzMRGuHlayRcbZKbC9D0NkXgUJkwGzJdsrUQvK3xXPEi7f3Hm4et31gRTzyRBBXG1m
         OJWA==
X-Forwarded-Encrypted: i=1; AKwUvBwOcWQYxaHHSPTxtIrRsRnavRHtdMwnYBsa/yqIOhR31/MciolWGAZm9BkQY9tRFuGaY+uv9FBREwo82n0=@vger.kernel.org
X-Gm-Message-State: AFuF++mV6g7xlLhVN+IFjXJAzI6DTuwyGoW9d0rRuTvZCMJ0WhR89OnU
	jmPt+dvVF4/iNLORPwrRGjKMSJglP7g/4+88FZhdO567oVlfrnaOy07zSdQfeLt5/8P2tfAcKpe
	J34Kh4CGFQWCyRXKF/uERGgvnI/77dhoDfpzHWA85iVNRS417oeCAyonw9XfhufUuqLY=
X-Gm-Gg: AYBFou0zh7lmS6eGCe3b9z/kAlYyl87OTAN8/a40MdCfS46LbCeh2CZQ4+GBMoY/Jp9
	ngix3GFmMH8v7ITHOYOn6hLBbussgAiIyAL8kOnnB/vStqtFnregmlWUNCC7cUEZlhPTt4/mbhK
	b7Zrt19W9sDb0osHCpM1DUrK0KrBR2NDicYbpLEDOkVeydBZOeQItOmaKkDV87XAYCYQh42ulTe
	9Ba8yZpC7RAD9LB7XX10c6ov7jiiFKRff0HWL6FDX8lhbndCpELONnQbSJPExpzw0Z0F3GsUCd/
	ERwFgGC3vaW6DTfaZpjSgG9a/fMp9rqVPBAIpMvrhdbqCPjXhJoTG3UPwXlqTh0+8+TNyrIbt0R
	/3EYdJbRdBGyiAGDdUnsfl66/s3A4IUGDW50B
X-Received: by 2002:a05:6a21:4d0c:b0:3d3:b00a:6f03 with SMTP id adf61e73a8af0-3dd5f7dac4dmr13014916637.28.1789611375517;
        Wed, 16 Sep 2026 19:16:15 -0700 (PDT)
X-Received: by 2002:a05:6a21:4d0c:b0:3d3:b00a:6f03 with SMTP id adf61e73a8af0-3dd5f7dac4dmr13014876637.28.1789611375102;
        Wed, 16 Sep 2026 19:16:15 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bfb19f8cesm14372881eec.2.2026.09.16.19.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 19:16:14 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 07:45:32 +0530
Subject: [PATCH v3 v3 1/5] ASoC: dt-bindings: qcom: Add Shikra RX and VA
 macro codecs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-add_shikra_support-v3-1-fc0e79c341aa@oss.qualcomm.com>
References: <20260917-add_shikra_support-v3-0-fc0e79c341aa@oss.qualcomm.com>
In-Reply-To: <20260917-add_shikra_support-v3-0-fc0e79c341aa@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789611365; l=2699;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=2W5RObKszArgoD/A87TmkLDGOjvuwEXcOAx0z60Pp+k=;
 b=wKNHIkmZJI741JO5dQr0bnQahikCmBI1jV4CAGTzQQk2lWYuHtnUCpVXmfHE6NRc6cZyyQLqs
 HL499LhxNMpCO19uK9PC8xM8oneJFmDJqplXxDfk0zTjL5Lqk4aLbCU
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-GUID: cxHw_smbi8qq4cLjgFrCByJU6eELH2L0
X-Proofpoint-ORIG-GUID: cxHw_smbi8qq4cLjgFrCByJU6eELH2L0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDAyOSBTYWx0ZWRfX3wEBOSWrqFtU
 Pac/cxD8LCTkhUltrDyShrW+vCdyJVCRlbZo8iu9hud4TTMlkGP4aCvuieWzU3UH7ixQp+v3vuE
 YjLWuMsqL+NOW8skPBROEoCA/onL57db6H41asOgMgPHbqmuIbyY7ZmKlN+geaePZAwvP6cMdUC
 c4QMzcAGejKQ/Tml2r4dQtK2lwaIefKyAoSn0L/lZtMQxpyFvRFvf80KXrCy+yzwrZS8MZfeHGQ
 iMzv85/pTOwN3Rw6r24AcT0vIMQBZmuXrsM8GhJshsl6q+cKayie1OOdPvMhyin6kHTqHKLnra5
 adPKUleTs+3hkhp211/FlY3UcWlRCYMkvCr3jUEAtw9qtlznQHmrqdygKnSpCDUUV3ywilGgCxR
 JJYqJ/TmXrdQ3FN71W9g85xDV4xHIOqea37s07pX4cVBSQaasPHSLhUTiXOD5cXDX5IcjAxDvLn
 FG01f4j+KQTTTSvFhlg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDAyOSBTYWx0ZWRfXzw05qJWRgBId
 6wYz1TiEQB2Lqk7jQ9ce6sSSzswxUDH+KT9HgchwwqXVrc5Dpb/6GIVvLzPhg7MmsIYrJ4y4JuB
 bOtzKz6SnpDwvvz7nlwFI0dB5c+XTZ8=
X-Authority-Analysis: v=2.4 cv=VIRIDNPX c=1 sm=1 tr=0 ts=6aab4d70 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=cvJDH5HnDjnG4tsKpogA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170029

Document compatibles for Qualcomm shikra rx and va macro codecs.
This SoC does not provide macro and dcodec clock so reflect that in
the bindings.

Shikra integrates LPASS codec version 4.1, which is not backwards
compatible with the already described compatibles.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 .../devicetree/bindings/sound/qcom,lpass-rx-macro.yaml  | 17 +++++++++++++++++
 .../devicetree/bindings/sound/qcom,lpass-va-macro.yaml  | 17 +++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index 4988e7ed6..69d7b7332 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -14,6 +14,7 @@ properties:
     oneOf:
       - enum:
           - qcom,sc7280-lpass-rx-macro
+          - qcom,shikra-lpass-rx-macro
           - qcom,sm6115-lpass-rx-macro
           - qcom,sm8250-lpass-rx-macro
           - qcom,sm8450-lpass-rx-macro
@@ -138,6 +139,22 @@ allOf:
             - const: dcodec
             - const: fsgen
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,shikra-lpass-rx-macro
+    then:
+      properties:
+        clocks:
+          minItems: 3
+          maxItems: 3
+        clock-names:
+          items:
+            - const: mclk
+            - const: npl
+            - const: fsgen
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index aea31fbda..683ebf702 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -14,6 +14,7 @@ properties:
     oneOf:
       - enum:
           - qcom,sc7280-lpass-va-macro
+          - qcom,shikra-lpass-va-macro
           - qcom,sm6115-lpass-va-macro
           - qcom,sm8250-lpass-va-macro
           - qcom,sm8450-lpass-va-macro
@@ -168,6 +169,22 @@ allOf:
             - const: macro
             - const: dcodec
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,shikra-lpass-va-macro
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 2
+        clock-names:
+          items:
+            - const: mclk
+            - const: npl
+
 unevaluatedProperties: false
 
 examples:

-- 
2.34.1

