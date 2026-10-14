Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C376D4D8DA0
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791969240; cv=none; b=oa/WEFGvUnpbWa4A5/4VRPzmViDDMt6RTFMJ4rLkZFvFslBEx088Ae+xO9niu/eTcshbelyej55zg2sC/J2ZmP60qf7s6YNskRvCT/7m2oXYBfjL+UhkmSVLc2/+E9lGi8L/orpirD4RCl4YY4vWWiUDwoCltHjMFxS9oVAZr1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791969240; c=relaxed/simple;
	bh=EW7mv5boTd2XPeglGx1Jj1JeQwIoToXRbQ3gO0Z4r1g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UGtKgE2VD2UfLqyzNJUjYmrLAOuzP5oAbXSFx7M2l1eYB8px177niNDVGtlvbfjRI601xyjESAewIvLxISrnk8YqKnC0PdV7vfqCV3ZX0sldOBN8WNgoyUo7SBL3LIBjG+7fJDVClicgmBuOU4e5hTn76iY35H06MddOgsT1mic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hWsGnRxl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hs7UcgMO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hWsGnRxl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hs7UcgMO"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E4eIxR806980
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:13:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9BftUQ7vtLSNZVUVEtcP5CnaG49A+3gbZmJ1g+cbuRE=; b=hWsGnRxlNzCozimy
	DiDvlID0aYwJPhKxGfVTCtcUYAPq4CJEUb+YvbCAT7LZ3CgBuZG3eQJKPUNDVMcv
	EK36BWQ2t4VlVDeGr6XEG7pBCPYT/oubbufArjwAltg4exWS+SiSnFL0nmlB9JXK
	6r2F/MqK9hZZHtTYbHnCRzmooqaQ7Yf2TVYGjXJ4PvDdLJyczW9auGTEyUNFL3Vx
	gPpGpMOKYXXIUq1tz5OcT5BKBY6YLVpYtdlwFwI1fX3EAy4EqtEyoPR8hie1xboX
	57n6Ycsv8ZXj3lsgXfRUpe15HgBHAvhVqjm1hJZGL3JDyrjDbhBskFd5o+0v9oW5
	0ypiKw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9ud6ap6b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:13:55 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cfa4e4684bso11120205ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 02:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791969235; x=1792574035; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9BftUQ7vtLSNZVUVEtcP5CnaG49A+3gbZmJ1g+cbuRE=;
        b=hs7UcgMO/BYnkB+Gz4pgWl/Frpn6F0RugjXJFbTw7lW1x+MV+DZOEFTMzq0/BwdGgP
         jT+oedirrv4YIp51UbYeB3b0oBBgdvNJAOpaZMG4pM1KznNzjOqBF3xs3ZDmf8X5KC4B
         cOsRr3UJioCxVX0hzfOBYbnOuwUKYNFK2rMgjQQ9xUqh/ftAxBkb8PPYSWIgNoIjiBF7
         CfaWFH+zpGgD7rFUrw8HsW6qqdbD+DRl7ndG4BAExA+0+bmf7tVj6H6dmfLvJXA2+sxj
         +twWk22VFh7hWVUzEF971yJS7Fw09gFE/C/jC6LJhB0D5b/DIYNu6dcXlmmJ1JwNrtMP
         UvaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791969235; x=1792574035;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9BftUQ7vtLSNZVUVEtcP5CnaG49A+3gbZmJ1g+cbuRE=;
        b=RQ451As7mpeEkSy6pH1RYNIdfK9uzZJzaKb5ZtLkx3VBPrl1jCs/fKd57HLjhYS5uZ
         vsQ0EtcSgsZ67OVTPw6QkgG9t3QTK9f/qBeeUt5cJzvW8b/iobE6D6qwWYyHub2wumBl
         AvN0JBfhy1pMWig2UYUyxDdvirPpKexEEbhrSKK2Axqiwkxp0FKAumd2oEi0rZ1+He5C
         ElQKWId1BaioQKu9LdR6hcEiqEf6MGGbLjwLPRqbGQLYwpheIntfy6O2UDjdhgPk4+9N
         /Pbh5+8CH88xuThnbZzlsAUlBEGwSYXpZiQ5H7OOSis4MWykO8pUxoYnE1LeJ4a07WDU
         zyVw==
X-Forwarded-Encrypted: i=1; AKwUvBxzyp6MtLJsHq5AIvwVpt7LQD0YkQruF2r+ZYZ4RhMLvlB21M8tHC8mWWcGm1BjNok3AF1TJkXV2KIGYDg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJpsYDGpaM2QyOdREDhpJeyV5JU9RoYF9aVo3Q3bichd8BEEGIg
	A3ruB7wVtdE2Vo5UnhgsUBk8j7IG/lK0IO2npNB1UwOp76PrzA+MeEm1fA+WOUUWIwWIaVRUPtR
	GMGRUwdqlCov0YDcqPgX4AWlNCHIwiYWqpUohpKqZpSjDNd2pd1WXxS5I+/99+jC8qjk=
X-Gm-Gg: AYBFou18qjRZTPJfLKzi0ez0AWID2omDcf/ATBn2jE8SuRxjo4ro+CG0PYIZ74haZOd
	4ldiMscOB6ldcdy02/4KqzXkyzAfnpfQ0HCh4clbng3Se3nm59+0kCi2fiogZY5o8KKHAcAt9hz
	JH0tr6TpHcmhYUotFmJhPOfh8eIjquxKjrrw7dCg2IBnufh02pbV3fcFV32W3N7Ti+P9sdD2WWq
	kKNaEzL4ggy18HyxQjspZ8mlrdhwMdP/Ylhc3I/12d/G35iQ4c5yr5gPNI5bbxiJ0g8EFTf5zd9
	Y3V66bZIQqIxkxe0Wfpsda/datM7RbAtGs8G+iRhr2BizPHHN1NaTPfjZHzGwKXOh0WwwgzxGE+
	vK85rDDj6AVid+luD4gMrlTW4hIMReNdW3A8=
X-Received: by 2002:a17:902:e884:b0:2e8:3281:6464 with SMTP id d9443c01a7336-2e842cfe9f4mr135960475ad.32.1791969235031;
        Wed, 14 Oct 2026 02:13:55 -0700 (PDT)
X-Received: by 2002:a17:902:e884:b0:2e8:3281:6464 with SMTP id d9443c01a7336-2e842cfe9f4mr135960305ad.32.1791969234623;
        Wed, 14 Oct 2026 02:13:54 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b16b3sm67088595ad.30.2026.10.14.02.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 02:13:53 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 14:42:47 +0530
Subject: [PATCH v5 1/9] ASoC: dt-bindings: qcom: Add Shikra RX and VA macro
 codecs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-add_shikra_support_v5-v5-1-fb9f0667e613@oss.qualcomm.com>
References: <20261014-add_shikra_support_v5-v5-0-fb9f0667e613@oss.qualcomm.com>
In-Reply-To: <20261014-add_shikra_support_v5-v5-0-fb9f0667e613@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791969222; l=2747;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=EW7mv5boTd2XPeglGx1Jj1JeQwIoToXRbQ3gO0Z4r1g=;
 b=H2dFrhuaXScuqH5pwr4ZP5j16WfbMwuxwGu/YTxpegxr48UqHl/fyWZ9xRcoDy1TtQ1IAhw6/
 /v99FG/AM/0DRuCrAA/Ycdp6VJinfacmtIKoItaYoK3D+GKGTz7bhD0
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-ORIG-GUID: BjwMkMm6-0W3OAj4bAEwP7zTywuPEPms
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzNiBTYWx0ZWRfX64quYL6t87tg
 58W0LA7gOMuioYQm0aXf0sZ8z/FiVv+EuLNPvY3QA8vakFhphO5DrI0+2AoV7h6zj3Ti2P5JTmr
 bPoUdn94agpR+x8mmDMyOc4UOY8X+RA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzNiBTYWx0ZWRfXwei8xVlmLYCm
 DGRNR9lev6EzEatFJY55P1MhZwuSIta0WclwrzhdLkJ13N/OzFSqANtRD/2vUIUj8PF+g15Uu+N
 UzdbCGMCwl+ZsJz4jC1AQ8bc0jesRzHibfjmSISxKaqHsCB0rZniqiSrYtlfRaCc8oDyJYRDhp4
 SoarJfiSLwe3uCbxc5AtzKv/6QFpegw55QHQverUisVsSXbIfZfOCKGgtJcO6GHhqtJ2jEpT2NR
 cX848gUVmFEWnYCljskkpEBG9nJs23l8dUAgZ0dZRhPdI5YHleO6nKoQq+UA/q2WNMjtLx5ebZF
 NlZzRKEO+/PG65wUV+qefjQ/x+GKB2cLDJ8CWv8jDzrXMxNEZFuIEFSBctwALyO+KhcexaeUP8w
 HV6itrrT4Gswi2utVQBsDqf/1jSg15/n9B3X84hi6zWU7N4B9Pl49xIdnsW22paEqrFIltGoWCy
 553mhI3yaBJBLu3RK4w==
X-Authority-Analysis: v=2.4 cv=fJ6sTpae c=1 sm=1 tr=0 ts=6acf47d3 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=enWoqSm7ZukIuFDY9bkA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: BjwMkMm6-0W3OAj4bAEwP7zTywuPEPms
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140036

Document compatibles for Qualcomm shikra rx and va macro codecs.
This SoC does not provide macro and dcodec clock so reflect that in
the bindings.

Shikra integrates LPASS codec version 4.1, which is not backwards
compatible with the already described compatibles.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 .../devicetree/bindings/sound/qcom,lpass-rx-macro.yaml  | 16 ++++++++++++++++
 .../devicetree/bindings/sound/qcom,lpass-va-macro.yaml  | 17 +++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index 4988e7ed6..db63a75f1 100644
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
@@ -138,6 +139,21 @@ allOf:
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

