Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794474837;
	b=REPIJi4U+0i3OgfOCVLQZREnZE4KU14VyssnzcX8TZkS898WpWlcoWt7Pe0FP8ehWlL5
	 BJNjJX6xbZyVYxYhnLXPYkXbdrwNVxe7pZcT+WnOApj12a5wqGmQh3xA0LjXijkRCthH2
	 +Hi5K4JZ30JMIfnGmf/D7ZbeIdfCg3jRiEPThJB+lHANeeJ9Zx1J/x1M6PkTrIzN8SF35
	 R2NwIndPb7k3wfzu1MBRzBwzWRj21bMyUfSQ2tbEhsfBYjEDIfRKKoSb6t6GtjdVPcwOR
	 i5JfjROmtN9b3hUylxKLEHGb0/8EJx2Szw9Ar7tmQaIcsilZ7zD7weIo2Kc6VczCZyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794474837;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xnlIiT/rfVkZ5TORtokGoyofx/3bXHZA3Md9PXbjv8I=;
	b=xQAPYkcDsqIJHk3HTd8UsSl0glOulfxk1uWVUJXRvEGY90RiOmETlAdUKn1lEQMMLped
	 pO5hQn6FnAV+CizL1bypJ8JWE++D350g/JtVCm8pQwFygcs8oVE/FbE7TinGVMDEOuE0q
	 FDtp1RPfodwg+xEnhBSXGL7xf2LKNp0hmRZfeQegtB4jzBGnTUKBlYqCn5iTLheIEMh16
	 ugu4GULbi2JbWhcMe7C7x+AslbrkvM5lWT7C33J4AX66Wn+oPlIzlmQd8plaAxxgWgeI5
	 hM+uo/as2CVjC3R5SetJgb+kJVS3YITBDgi3gu59OBkuGk1GZxxGr1gz/vDhR9SGOZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U5yHE4Mo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dnw1Ajtm;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55943606A335
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:13:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55943606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U5yHE4Mo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dnw1Ajtm
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZO1j4092370
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:13:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xnlIiT/rfVkZ5TORtokGoyofx/3bXHZA3Md9PXbjv8I=; b=U5yHE4MoSrOFQ8dG
	+RXiacuPCJDYVz2lOhHXDsZOSK8Yyqp0SfKoTibM4PUZiyLaMnwW1Ulx85p2U63p
	kBTkcpzDAdP8dBt+B2Zy8mhdCPS8ogTwIdD7izHeYHlkQOjePeRVfUozxzvKARbs
	U1AsGtnrNlj6wTcrxVhNcajS7P6KSOH4O5j50mlarv0odsJyTr6GMgYhQzSBcnp+
	gUyuGYgisBub2hEfvVqMxN3x/5sE9R+ntr7RHvQy2d+BJZxi2sK4lyo8zKrMlfTF
	KOpHPtx3zpgYxYDdL+dTakjHBsCCWzsYiVFKJHIh68vrlzWf+mmno80hzOtQDcFm
	inZdYg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw0m8j4dp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:13:56 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b0a528ca65so3817206a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794474836; x=1795079636; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xnlIiT/rfVkZ5TORtokGoyofx/3bXHZA3Md9PXbjv8I=;
        b=dnw1AjtmU6oWyQrLag7p/C8RuZR24ZbhLPbyGpJCLMD9+/0hWmj8kbp4lMi7YzRYro
         dZiLUDHxF+Ji0JzncfIvSN3s7P7UaalxS+KUG0q4t11OYDLNQnfq9Y82a6onsYrCsR2+
         ZKreWcPdIClhSS/KnB8nCu79Vq0FFCuBupf8Ze4Fq23mlffOKQUz6XCKquG+K9Zo1WUR
         FCSLrVl3B7jd7oZ26d06W55vms3k72/FCUuoArOab7/WkyPQ5tSq+fmqSxiZ/MBmqbRr
         BJGw2T//yh2fCWcsfOD13r1wWiulb0Ri5Sup5ZKbUB8Cc2gOv1NoZDaSW26l9GOQ/rDF
         TNgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794474836; x=1795079636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xnlIiT/rfVkZ5TORtokGoyofx/3bXHZA3Md9PXbjv8I=;
        b=WQGl0Srlx+9Mu9d3w4bdA6yM7DPnoSbr6FymjvEvgipUkn58kA7c90fNUrfFuziSSO
         /VvZaklbtm4jfPmlM/ndcmFnfE6QssXcjVuNQYraigM7OhIJX8yqULNylH2+1HTatQvu
         Dv7w6ArzmEV1Ox4iDwvWV0kO+hNRNl0l4ZbHLonKyKqsf/hu7r5PwtWwzJrPJp006DDc
         1P8iZrQ8OmlrOrnouOYh7OZfjIztn4KBtk7YC+W0zzA92U/r+p8IGlTA3N5hlVkiromG
         N66YNCG/adNZhpai9qJXCWeWpV3sM24mZsjsbujVIY8ZUNAWf9oUqXI4b6JExAurC/2X
         rK4Q==
X-Forwarded-Encrypted: i=1; AL+hErESEetv5tbEVnZB9mMSM6ARBYceIp9JcPvUOaQ1WzFWE0fiE69ED0vklvHojW4rJ5iVkuEgRXk7qD4a/Tg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OJGW0jAXNzP1EaL4zK/gHkDKPaJ0tVYk3sD2jzpoE7mCBWYtz
	LFDkDb6i/R/2aZ1IyWN/U+9voK8R8SpbW1VZXW8XgIoXqWOEWGHeRyyEayVLIuhd4MOV+T0T4O2
	OfjDeCGQ8KVlKzxTQKLTR4eoPaueq6CIn4kFZqIkKnJLmd1nWdPGnMT7tPy40MQviQV8=
X-Gm-Gg: AYBFou0MOcR54FYDcLsXaCXKZ/TZ8nnsFfsQWC47b9KAw7q/lLfvlZxM1VQ3b4/3nA8
	bpdWnaGe+bURLQgiSgo997SR7M8MO4xbbUFrwUMy1AA+mke4Vm52rBihhEOkQ8r8kHZomLMQ7gV
	zqhnnvLXMFhFz1ihqm3UbtR7GA4iLOoUlt8rzzrkmnrucX3N2+NvfvZU0k4Vqs2sGmQ2HT7/2Ry
	i0Ntqedf+YYNJoM6ZOiCLJStFN5ks6+iF9uzoXBwhUVGJ3qRjwLCSW7QESK74uYCBDRusSjgRk/
	k0pRIrx95kDYlWAmVeFDiwaZjnc0VJHqoH5l92sonsYGln8vQr8eKVoPKBETS74KUV50N4YPN0v
	EoZpCSFw/1TtuYl8gTcsZYXx1a8EcjR/4m4spGV/BpcecG03BVOxL9QZuFRxCtZwM7+rairFHco
	NVI7o4Wvq4
X-Received: by 2002:a17:90b:2688:b0:3a7:9adb:2a0d with SMTP id 98e67ed59e1d1-3b182d4462bmr4668301a91.0.1794474835840;
        Thu, 12 Nov 2026 01:13:55 -0800 (PST)
X-Received: by 2002:a17:90b:2688:b0:3a7:9adb:2a0d with SMTP id 98e67ed59e1d1-3b182d4462bmr4668271a91.0.1794474835323;
        Thu, 12 Nov 2026 01:13:55 -0800 (PST)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b19b533540sm3019826a91.8.2026.11.12.01.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 01:13:53 -0800 (PST)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 14:43:31 +0530
Subject: [PATCH net-next v6 1/2] dt-bindings: net: qcom,bam-dmux: Add
 memory-region and qcom,vmid properties
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
Message-Id: <20261112-qcom-bam-dmux-vmid-ext-v6-1-7a16bd3dff18@oss.qualcomm.com>
References: <20261112-qcom-bam-dmux-vmid-ext-v6-0-7a16bd3dff18@oss.qualcomm.com>
In-Reply-To: <20261112-qcom-bam-dmux-vmid-ext-v6-0-7a16bd3dff18@oss.qualcomm.com>
To: Stephan Gerhold <stephan@gerhold.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Eric Dumazet <edumazet@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794474821; l=2657;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=wycrMmj1886KQq8u+EMdY4E91b1IT2gBezsXLoyMxGA=;
 b=B6KFCbpONrzKHQyrEE5pvoEsRxyBgXHPOeZ/QAFWpNbEkxjGPsOfehvl2JQ8MJmARH1yJvFB2
 Zr4yhqBM7t9Acpk35wRgv/AnRqZtrIc9hAxHdmg1ejmssFHMZnk3hj7
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzNiBTYWx0ZWRfX0mbvEpKWkjcc
 09ZEU7d5mDq8Qxu97Sc9vzlN2UNtOy1QPLleTys+XmkTTwuPYtInaBrc4NMt/636zQhjKik44Fc
 WWOw7V9UJTwPBifwuIgjRtz3CVI3pxk=
X-Proofpoint-GUID: GZJT9BiocJFnjmKb-v1nKSokqngfP1VM
X-Proofpoint-ORIG-GUID: GZJT9BiocJFnjmKb-v1nKSokqngfP1VM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzNiBTYWx0ZWRfXzcJl2ObSCZGy
 HSpKKfXkm96cx6okhl+X0eaDbqWXm7E78YR3aEewF7QDSi+4N6Phz0qQTEsDyxSxhfETf5M3l5N
 mIkqu6kQwGnuI2+50nVmBTYjeXQX3zAAxLcM/evo7oqQDeF3Sg9MBsbpFpMjJhMLFY1NoD54li2
 ICGRTz+ki+qdHuJgFbwizryMgS4c1jASnA50DHu+x5g4K0w2LAeGoFBvV4VnD42MjA94/FPgQ/p
 0WmEqT1iAryxSaJIVvLBs1n4YcHRbJIzWfOiY0cyKyse1E8vTFy6ingeIoU18VSd0fW24if0+2p
 xrI4//k7ctp2ctHiI19ZVEhFsuC3so3qNEHgSO4+CibannuJ878YKzPKWNs4lyTl4JhNI4xMEQx
 HC5W2R1KW3SCEU8M/SUy9I4EDiKFDJM/4adjCVFvjyzTwJiCOELn4gg98H9sb5wRlWncn3T5ymY
 Md9UImBfnkxYc1udUBA==
X-Authority-Analysis: v=2.4 cv=Q9dHcI2a c=1 sm=1 tr=0 ts=6af58354 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=t_mNxi-BVxZHgpyDufwA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120036

Some Qualcomm SoCs, such as Shikra, run the modem in a separate security
domain with restricted access to system memory. BAM-DMUX DMA mappings
must therefore be constrained to a designated region that can be shared
with the modem.

Add an optional memory-region property to reference a restricted DMA
pool used for BAM-DMUX mappings, and a qcom,vmid property to identify the
remote execution environment that is granted access to the pool through
SCM.

Require memory-region whenever qcom,vmid is specified.

Add the qcom,shikra-bam-dmux compatible, with qcom,bam-dmux as fallback,
and require both properties for it.

Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/net/qcom,bam-dmux.yaml     | 36 +++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml b/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
index 33746c238513d72366bc52359fb10f275475b331..f7388d24c8612b5a99d5d0e66cfbe2de3b1c9e0d 100644
--- a/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
@@ -22,7 +22,11 @@ description: |
 
 properties:
   compatible:
-    const: qcom,bam-dmux
+    oneOf:
+      - const: qcom,bam-dmux
+      - items:
+          - const: qcom,shikra-bam-dmux
+          - const: qcom,bam-dmux
 
   interrupts:
     description:
@@ -72,6 +76,22 @@ properties:
       - const: tx
       - const: rx
 
+  memory-region:
+    maxItems: 1
+    description:
+      Phandle to a reserved-memory node compatible with restricted-dma-pool.
+      The BAM-DMUX device uses the pool for DMA mappings.
+
+  qcom,vmid:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    maxItems: 1
+    items:
+      minimum: 1
+      maximum: 63
+    description:
+      VMID of the remote execution environment that is granted access to the
+      restricted DMA pool through SCM.
+
 required:
   - compatible
   - interrupts
@@ -81,6 +101,20 @@ required:
   - dmas
   - dma-names
 
+dependencies:
+  qcom,vmid: [ memory-region ]
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,shikra-bam-dmux
+    then:
+      required:
+        - memory-region
+        - qcom,vmid
+
 additionalProperties: false
 
 examples:

-- 
2.34.1

