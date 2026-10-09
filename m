Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6533A47DD6D
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 07:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791531352; cv=none; b=Dtrrx5OmJkM1Bp+oanN4PsNKX7sGnSODVTGGuRRfPMqUInTcGW3EltZrSEDwzyeBDQLzqiE5PZl9IUtE2fsXbRgf+mmiLGD2enBRNEp9+wiAjl6QdGN3TDgX8ncA1knOPDhgVF2h1NYGgvh05iN+dFI0pWQPU3FYtGrVuboZRAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791531352; c=relaxed/simple;
	bh=Pvv537cteRJa8ONribBapnslw73PT1p0fjousE548mI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HX5na/hqkZETh+xO5wKwKQdwRjrwuDhCqvIb5GUGK/TQZkYPqQYCdCtJKpVT8iJ1lM1ILhuEEWTwqDoRdWqyEMlM38afWA8O1PyghqBFuwETvo35Iq4oq3cfjS8ZlxyQ59VKIEFE/npDjJ/IqjgrSy4pDOwka5YWRVZy/EAoZrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ern8Sl93; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fui0tQDE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ern8Sl93";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fui0tQDE"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993H9Eg1598008
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 07:35:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IdA7gug4AyZz/jTkGClkMFslbjtbp0lg2QkRabJ9cuI=; b=ern8Sl93TSHXvs07
	o+mVK6R2yHtcmwrxoRR5boRB+XaaPj1CaapFpBQBzWcA9sQvDXAIl7PhbmXUGFWb
	eQKXlfBF03raT5mkzD/WED5TOBb5lS5mKwrdUYmyETHw22kPD1TJTY5edJEkPJ1H
	kP8SIN/NIX+l/D2uarAz5ltdWuadZlO80AibJKRXswKRCdiXq6r1FTsIT8SKYHrN
	6PteTXq7mF1/8DjL9vJ32jwtQqfM2mG7hhQ9S7lUM+CCSI+AEmdyRud38eEXXb4m
	1mEVzrrXT5+mgVYJeGZ9Bum2ABgDqJefGIhaNBweGVt0mkOZ4MG+7DNiVplWuwJV
	QhmXOQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6nufs9e9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 07:35:50 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33713e5e6daso7419364eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 00:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791531349; x=1792136149; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IdA7gug4AyZz/jTkGClkMFslbjtbp0lg2QkRabJ9cuI=;
        b=fui0tQDEjp83/x7lIfL0ZNVODiOO578PyOtV+rbQQoHFl/ZVKwBojeMAo7sm/uC93K
         yBqMbmHX0JWTP0BUgIBeHRoI4HDgV6BPMj2S6bZkXJX7tA9utt9S8GA0Eo905/XbOovx
         aHef22mLNj8XVXGqro+W7TzkpFloPbBRK1/93wbq9FBcYBwbLcOyh+xN7vPT+cki5GL+
         00ZADJGX6lDv/+sYdPYEUhkfONcicyjsHRvyVQLeNRrT4+Qw54sXreWiT4eBvxUIBd3T
         J2DNjpD5Gqa4uuLYpfUl+hGRxEUwbcosSr1gMmvl9xauOrKnSw8s5zD+io6Aq7vIZXt7
         KfQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791531349; x=1792136149;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IdA7gug4AyZz/jTkGClkMFslbjtbp0lg2QkRabJ9cuI=;
        b=jemVnlKwkNtUiQGoJzLbjKkYeu98k5rPJpxCOj+zeWV88jhh0gy6euNMhRGpTJMN1u
         q/nZeouCFmuQWJqd8qCpthgasFlhRp86LWHJM1fnZ7nUn4vNwxQh/SA0mxKo3F3hkMcq
         ozfEOlsFRc2knNZ7+Un1PV5PJsrpOYJWt81SQhp+8VPfe3dG9n4Nmwe+craQcRHelVfJ
         aHG4e9jST1dWI/bAkAhAZFbr6/dpm+Gv5uGPRuYYIt2LUsyjq9ZeLqdZWatuX9X6Fr6u
         5MLKtXvqp3H85kBGrHxN9XmT2ZZLVVKALhEBrvn8/tyxFy1t5mPmoFv/KSBT/7Z8AcJ8
         dq+g==
X-Forwarded-Encrypted: i=1; AKwUvBzDSnnhGIeVBoavTpooTEVUpthlv2Wi1qOvsrgygeTYGZDIvkSMyig4h5wi9y3q7GA1aV9Vzv7z9tfZrqw=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4tClCR47dQNM2P/DsCHtqyNcnNr8ggz7o9XMHJ7TDc6Cn2loV
	r0VVW77zPR6dgTwToAYmKGmqP7qtqvUpnKq1q4Gg3ikAWjXuwAAlvOlCsw+O5FrtcSwG9Hr2agy
	MFc5WCfYSfqdf8fEVNLi7vxY/f/SPGGeHqclLnnc7St4kItx8zqYWIC1sNOOeeXMuZMw=
X-Gm-Gg: AYBFou0DxvG2V4ZJWn515vwM82lSxm9jKFA9aBQwmKpOvBJcG48kv8bcUpNugmvoXOp
	iB5h/fNK5eAFVwpwQy1BiRJ4hqCu7QACXqVYoGQ78ygy6wxJ4NB8vHK3ALK0+hswtCINw8q0CjU
	6Iyct7+ibsl1ekowEld8uhtrZBvy7oFhkL1jqIBHKLeu3toR6iiWbIADxIYGjxgw9VCr/rqkTv8
	bGmM1S42jzCidIvShWc0NDmq6zJqoby17LC+NVmW0yjF11fGoRL9Btcl9GAN3ZkrhXjGOE0DqpZ
	OBw7C7jE+Us2EVU5mRxPADUSuk3Vb3RQ2wpIY67rq2MD/ZYjBHDzDdn01AqtA3ra3acaKWURJqC
	G3/1rg+t5hAG/FdbP0IawIAACIOd9sC8dfLBE
X-Received: by 2002:a05:7300:cc98:b0:353:5871:25a3 with SMTP id 5a478bee46e88-3537e0ce10amr1735477eec.22.1791531349464;
        Fri, 09 Oct 2026 00:35:49 -0700 (PDT)
X-Received: by 2002:a05:7300:cc98:b0:353:5871:25a3 with SMTP id 5a478bee46e88-3537e0ce10amr1735450eec.22.1791531348885;
        Fri, 09 Oct 2026 00:35:48 -0700 (PDT)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca7133asm5658974eec.14.2026.10.09.00.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 00:35:48 -0700 (PDT)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 13:05:39 +0530
Subject: [PATCH 1/2] dt-bindings: remoteproc: qcom,kaanapali-soccp-pas: Add
 Nord SoCCP
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-soccp_driver_dtbinding-v1-1-40862f7fc58b@oss.qualcomm.com>
References: <20261009-soccp_driver_dtbinding-v1-0-40862f7fc58b@oss.qualcomm.com>
In-Reply-To: <20261009-soccp_driver_dtbinding-v1-0-40862f7fc58b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        shengchao.guo@oss.qualcomm.com,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Authority-Analysis: v=2.4 cv=afn0Dhot c=1 sm=1 tr=0 ts=6ac89956 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=CHE7YESx92GpoR9PaLAA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzMCBTYWx0ZWRfX6q4pCqAak0SN
 KpqmlhtCVrlMeNFGdae+VLVvj9dTj5XM0PcmGTsaa4idYbfXH2XZEhjIt/f76rDwgobWBZBuuIL
 vLwiNdNMC5f2KU0Epe3gdw4s5asKPVo=
X-Proofpoint-GUID: 80cQ7wPG5VtVSaDS7_huIGPQ-A0RltQB
X-Proofpoint-ORIG-GUID: 80cQ7wPG5VtVSaDS7_huIGPQ-A0RltQB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzMCBTYWx0ZWRfX+E7A8shOopiU
 Nwv16bIPHtMMxcDmrnNsI5+wfM2wBTPAGyHbrq1nAHYWOc1UhXRFoEMdGib5xpclxU/4Sc0w1/Q
 T2A6mZ99/g+7RpQdy2jsUsN5brEaUcg104H5UHCX318HQCrh5uS1VnDVU9zT/R7khRuYmSq7d6j
 vUcaHOOBoqoWFO9jcPxadDfXozGOasJmu3Wg3h/KwkeMVSxF7pIrAXWfFC/e7e5xLprZXAFsP9X
 CdcFimsxeNUDUAM00qKxhSGRk6I/KptDgHM62GFK4k/MbcWfBapgQ1n6p/f+V0WzpNv9gNMHcqT
 xM4ZVW/rUW07JnYqqed9xY9obNIh41c+UL1YWiacVwdlDLl5b8Tl5hLM6rLArazlFFhbkQhSsIs
 TLILPeC2isQpIyqAowGMDHLP6/pczRYWTxYq3creaikmTgBeJhbMgEYrKjQXp8/7uNSKN6JpPdP
 WHKZbqg0U6sUgX0dH/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090030

The SoCCP (SoC Control Processor) on Nord handles hardware fencing for
display and other use cases. It shares interrupts, SMP2P states, power
domains, and clock with Kaanapali SoCCP, except that it ships firmware
without a separate devicetree image, so it cannot use the Kaanapali
compatible as fallback.

Add qcom,nord-soccp-pas as a standalone compatible with a single
firmware-name/memory-region pair, while existing SoCs keep requiring two.

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
 .../remoteproc/qcom,kaanapali-soccp-pas.yaml         | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
index e6c78d621d17..c1911124e073 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
@@ -26,6 +26,7 @@ properties:
       - enum:
           - qcom,glymur-soccp-pas
           - qcom,kaanapali-soccp-pas
+          - qcom,nord-soccp-pas
 
   reg:
     maxItems: 1
@@ -49,11 +50,13 @@ properties:
       - const: mx
 
   firmware-name:
+    minItems: 1
     items:
       - description: Firmware name of the SoC Control Processor
       - description: Firmware name of the SoCCP Devicetree
 
   memory-region:
+    minItems: 1
     items:
       - description: Memory region for main Firmware authentication
       - description: Memory region for Devicetree Firmware authentication
@@ -93,6 +96,23 @@ required:
 
 allOf:
   - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,nord-soccp-pas
+    then:
+      properties:
+        firmware-name:
+          maxItems: 1
+        memory-region:
+          maxItems: 1
+    else:
+      properties:
+        firmware-name:
+          minItems: 2
+        memory-region:
+          minItems: 2
 
 unevaluatedProperties: false
 

-- 
2.43.0

