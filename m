Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F5E448B90
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790181264; cv=none; b=KrnRMpP9mu9Dh8zFP2tsE/ZfQ/Gonnue0NfZWr4OnW3gjpBTr0Ha5xrVPAGx5BbcVipPRQnvmJl0NAWC48fP5JWOMdbmXsBFHot8D1MhrAddfDBb8g4Xj8cI2O3h47NMVlL2321XuWVfOrO2aToFvC7GRmgqF70hDfGQjDpKbMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790181264; c=relaxed/simple;
	bh=bZFCmikbhjibr37QyYsw1BYnrmuWJX2eRfQcgt38jzw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qSpbWVTZGkBJT94LUczlCwKCGWJLe6MO4FCT8NDr1QOfv5dDTAk0Dj9l17zgOd/vgyMzbB6OSoEJwyK/sxrzfSBZh+IEJ1euP1wI5MGbxWOL6nCsF6pH+qWYsLxCzdSAAPB4PoJHhUrOkDZYa3yrahiCyWdByz0pnyiQG8xyjDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nahf0l9F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BESC2Wq0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nahf0l9F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BESC2Wq0"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NGTkPV3665741
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:34:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d0pBwxzDmGvmNSPMqwBbxTyOwURg+F3QxfDPjVKyU68=; b=nahf0l9FZwqO/OFE
	YtKXTqp3WUrfiS6yFO7MwJoQSV+O8vg1FEkNYZZoJiPrc6kIb1vYwu0fGqql/9Wf
	IdZG6Q0qROLFo5bTn4CZ0hoIpWHDMRbv20dueCA+U3VZb1nYN41lsPsa6u2hLRkL
	9GyOXAuRRBThbUCYjDLLZkFBFUtfYnE1SJ47+6g5ghMJzElhqvrUBOt1dnMVP0C1
	Fn+bK6artLcmN0agK4NsXccxSNZnUb/DlWNOhEUFOGLkEp3T/0UIw4Bs/F9ak4e2
	vAKX2XYofATsoLY07hkk7bqM20PyfqJMwAKA9dDsNOgcL49OiUOOBIgv3LgOmL+1
	FA+vyA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbwasvmg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:34:12 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d6fed0652bso9547555ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790181251; x=1790786051; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d0pBwxzDmGvmNSPMqwBbxTyOwURg+F3QxfDPjVKyU68=;
        b=BESC2Wq0iW/1Mp94ToovqSiBdTSZqtuYRHI9Q8+JxQUCZBzIxHnXcLiqf9w99e3l+h
         O1fEz+mcYxsvvZBQvylcHi/dBDAOmDSKK43fcvBXxK4R/gtNqCC8fHmi2GYqphEQBFci
         56lTfLoVZyb+0nNo1WawSbIuzecm9y84AmCn6XEVg3iWC9kzIt9VZk7dtS0sVTXRI8Z7
         LRPj5ARQX7pSQXRwPp68MccaaMWRVh0d1jbZQBepfrqDVsr9fc+x45SZYW0A7GA4nkhh
         LYICSW1rj897VA7P79Tu/hEO8D+2yAiNH0AgHVdecZKh3gYxzzLsRSpe+R2NShnh58O4
         +M5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790181251; x=1790786051;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d0pBwxzDmGvmNSPMqwBbxTyOwURg+F3QxfDPjVKyU68=;
        b=VyXf+JNjvkty7sNCMjdstqyt8N2+e16XplND4cdVweDPe1KMYRvK9ib5FBvH3J3Ef/
         oBQUFty507kOSdoCqrsxV0FN/uAracjHl9FEb57Ck+46S3g5Ujf5OcIo57QLQsTgdY5X
         UnPb8k43+rgBfstzS9bqXUrX6KRx6wbaKtsU3lDhbipDaFabQPEFmKtBEheNyUQvkl1J
         CUQByw7EVgp9tEG1FmRgOjpl0ibJysHZE0j0dDq1ID+WnWiXAQqL7S7y+QYVNw2+ooII
         wewda/guBBreyG/BCRqst0AIwMqazzlYFfOZo9ng76ZoIZmpZrY9pSUEN1oAbyE4X8yL
         QXGA==
X-Forwarded-Encrypted: i=1; AKwUvBw66O0u0pE3bbk7C+1YRf9R72goLxjsAWwJd/mgXNA00SGqG2ZXaV1T7lJVO/dSjY7QraRuOX70F4bmJcs=@vger.kernel.org
X-Gm-Message-State: AFuF++lCAFms8hez0MVLw3ME5obxsTpzORqffVQBJ+RjrNRVUeudtZVW
	paO4X6JtFbIDrzAfKrRG9PfoaQ5LwNj54BVHaA6FaaQZvecYTxdKRxcWmIAoaLF+hARV7Kap12N
	y5bagOYNDl+nDEQ9N4xi8VYbi5WYibOPpcRYLAjO4jM/5YTIBeJrdgalu+cFAnJWVtLU=
X-Gm-Gg: AYBFou0JOpetQjN8uE0e9Wmdoj4Viha0PFzLsNQ3e8q9l76C4Q1+bTzbC+MDTnCVL/L
	KlTZHpmSD9jQNburSpysQo2lBHMygwCh36lLYEjGcxdkx3O7pdKb0Ams4G30MFmWfARdYnnF/fq
	aemKgjnpfQTSIHaXOLz/N2v/GqbPEqjobB9twjWHiQnf9DlDS6iDv/b9m86FjLenLUmduIRO1n5
	g2oi64WEIRNCLHJsIP8ZIOjLewYO4TJk7irijk375lIlJD4HDu990on+tRnSuzQmKrRzaxIUpdH
	ue3a7nNtcXAaCkVrPQc88TXX3wJbTKn2xP/nG0CmLPUore3FAgez39g4ijHDYvCRfFukmTcQeln
	9LvCK+hvfgWdy4kTcJ+IbgCHUo38=
X-Received: by 2002:a17:903:3503:b0:2dd:c053:e0f3 with SMTP id d9443c01a7336-2df69ddf227mr25747705ad.34.1790181251372;
        Wed, 23 Sep 2026 09:34:11 -0700 (PDT)
X-Received: by 2002:a17:903:3503:b0:2dd:c053:e0f3 with SMTP id d9443c01a7336-2df69ddf227mr25747375ad.34.1790181250803;
        Wed, 23 Sep 2026 09:34:10 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5a6d35sm13994895ad.19.2026.09.23.09.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:34:10 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 22:03:40 +0530
Subject: [PATCH v6 3/4] ASoC: dt-bindings: qcom,q6apm-dai: add
 memory-region and relax iommus
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-vmid-v4-v6-3-3d61a0319b1c@oss.qualcomm.com>
References: <20260923-vmid-v4-v6-0-3d61a0319b1c@oss.qualcomm.com>
In-Reply-To: <20260923-vmid-v4-v6-0-3d61a0319b1c@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ajay.nandam@oss.qualcomm.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2NiBTYWx0ZWRfXx8Z/+2/nmEQV
 myaQk3+SqrxyC0ydexOulRxyFMKSg9tzuUjjWAEX1FYy3Mh1WeOH+0MmKkI9U54B4KNaqwMedbc
 iHGi/bdPxDci4ey1wnxS3Hw/GF32kg9cWoBoAhG/6FTI6t93/Tu3ssbdVDlUFWwg0zoDuQI6yYa
 nmU0PkmtLEmMa/1g6XQUmgg2F33iGPLq+72wcL9X2f3EVkqD63Hxbw00KDYPF09Q5JLHzanKTTt
 KrkEctfOOZjhetX0dndFeB9oTHpSJQ7BVJF5Oesx4Pk/eQv7HADUmMq5MA9YqLS+Op20kBsJF4o
 RF9oZLnO2z5uhvu1sihEelzL0HxX6svEhLF3LGKMPydnSFdlQctrPM1jKFgrbYwv56K+QRw63uH
 0IfKs2h81wLo02UQfShgbKxa8asiYqerO3og98hNOvLd4HPRWLzZxFWGV+w6BJo8kBIK0RMynKx
 +YmSilKNb0AzTALUgCA==
X-Authority-Analysis: v=2.4 cv=HfuB3SE8 c=1 sm=1 tr=0 ts=6ab3ff84 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=d-o4ErlZh7ezHBmBfcwA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: AEriVi1jrM8uqegSQnW7rPfYeMCbWi71
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2NiBTYWx0ZWRfX1Fq3pPxNmIKq
 mGMw433a6fgyZ4XmUegV9YAIOwM8W7gaw5UtU2vF9tlXsKfm1dni4ET3iiBVQiPE/0pgwxSGsfW
 okU2JcIkO2wU6cocEtVRHmgVbY6ifvw=
X-Proofpoint-ORIG-GUID: AEriVi1jrM8uqegSQnW7rPfYeMCbWi71
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230066

On modem-DSP (mDSP) platforms the DSP runs in a stage-2 protected
context and cannot use the SMMU. PCM buffers must live in reserved-memory
carveouts that are SCM-assigned to the appropriate VMIDs.

Add a memory-region property (1-2 entries) for the control-path and
data-path carveouts, and require q6apm-dais nodes to describe exactly
one access path: iommus for SMMU-backed systems or memory-region for
mDSP systems. Remove iommus from the common required list since mDSP
platforms have neither IOMMU nor VMID DT properties.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 .../devicetree/bindings/sound/qcom,q6apm-dai.yaml       | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
index 9e5b30d9c6e6..c1f9fc9eab64 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
@@ -20,9 +20,24 @@ properties:
     minItems: 1
     maxItems: 2
 
+  memory-region:
+    minItems: 1
+    items:
+      - description:
+          Control-path buffer (audio_heap_mem) for platforms where the DSP
+          runs in a stage-2 protected context (e.g. modem-DSP).
+      - description:
+          Data-path buffer pool from which per-stream DMA buffers are
+          allocated.
+
 required:
   - compatible
-  - iommus
+
+oneOf:
+  - required:
+      - iommus
+  - required:
+      - memory-region
 
 additionalProperties: false
 

-- 
2.34.1

