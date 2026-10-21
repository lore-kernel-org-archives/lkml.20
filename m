Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792564807;
	b=sl6zXGhX1GeN/2srzxQZC1JnEHUjrd6OFnGy7tEu/RT/+d2jHtMt3KmwPByR/y1xYbkx
	 TRFxw3q3SkXu1pOscYMC4c58aCtInZslP0zPvC11TvmN2OUqp3IzCXdSONfNCfOLqwCN2
	 hfgTUi8LTWmxNqsVtPEtrgE79LpH/lfpvnAgl/JOVwfCJ4IdDmpOtuPU3pO0yXiVj7Jel
	 CyH8Rj+Pgj4vd6RB9N9mc4vRL8USNsDAvm5L23AGQAQ9oA4cQzZy4zHeP5xMyHVAoDqrV
	 qbM3DQuLvUpCs4lmN9EhZI+bjCcoz3JTzq5rgFypKKMe7Gn7eG2MBodn8/0zYOiS+FA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792564807;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9xGaxJuBomS0ZcA/d6E32VSCGzfFIwUHw6NSEAEPgy4=;
	b=Ny8pgmqX4K/ZitsMi2v7fZ4xgktLlr/tChUNv6fYOC7swuUhxFmG6uh1iSVZtAGG/Y2o
	 5x1xjx0LeBZPx6bSdMVIt67tw9XdrdQYnOaE5plzKhz4mMPLcDl2f47MKinmfSbomLajm
	 jZ69OP4p3TQLjqTpGClRHSQ/U4gBj8J6qsUFkzhyWhZ2KZv7F9yR5zA58U1szq9uxF5+d
	 2lXCEcf6DeFY7VbWLgaLtwkj043yZmdtjkPqd3JaZtf47iPrdn+5otDYYhGbpF76JcsPt
	 o0GYnhdmZppkVIzE40h1I1fB4yXaNkuMVzW7ZTU+53d7PCOwZ9gcqZiZhcYPicQWIoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GzQVn2af;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FsQluqQl;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D2B606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:40:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61D2B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GzQVn2af;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FsQluqQl
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j0bc3355556
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:40:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9xGaxJuBomS0ZcA/d6E32VSCGzfFIwUHw6NSEAEPgy4=; b=GzQVn2af4SZ+1aG9
	YDNcPFj+QGm+2SeTuamJD9faEAL/7Qw4q7ddHKcXIFx2VCq4vQqu++2AKhn6gcHz
	HI0zgrwsPZTfPDdJmiYy1/xdfMhM3aMmZaipiPQMUZbIbclaAO3NkEnL8OUmHpZ3
	pXY3TcwW7/eFoDoJXeutKtMkD9NIpdjgQubDuMXqYSXGEwTTWdftjoW0v7/Zv1UD
	WQKMTyy1UczWCsHq4kY4se/4vyCblm6FppDfEQSQyNy7ny/VcB0NwQCyUiVWPgq9
	8URlvStwZuNqdio3TuJo+DitlsoLRF35DcU7pcF4pXg9iHy8AXe3EvoTe3MmR8IR
	9rPIDA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda0jbqg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:40:05 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd63a7cdfb3so289025a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792564805; x=1793169605; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9xGaxJuBomS0ZcA/d6E32VSCGzfFIwUHw6NSEAEPgy4=;
        b=FsQluqQlUeMEkHAWlgJXuDZKemNUyHyJcq/5NYZ/64Jx2muUJ/PUe3rcTLxbCyGIpy
         kV87oFtH7trN9M9OE8ug/1lMz0MycDmoqnemTBm774fcte0/XoA4RKCOu/o+0dj798vX
         nZohtbeIrrL+LQbzTszv4Zqk09EoZfLxokrYZFKWE8T/8RH8MaxgiN1ST1AdxvCAnyAJ
         HiSUR6iZFKTYcT4YkSQGxGV2ntsvua68xesJhVebTVBMY54SHsKP+9EqtV9h1+WfB400
         /7WMNl3/fmsfEXWaEJimZ3PBCUYNlf2YARnx659SM2YKrWOvwHB5oTGCZIJ6I7wPzs7i
         DMRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792564805; x=1793169605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9xGaxJuBomS0ZcA/d6E32VSCGzfFIwUHw6NSEAEPgy4=;
        b=bdeenU0Mkeen0ZPp+woXGZm7WtMhasXc6hCfDPnmgldL/1nuxVV50AAi53OIm7YpoP
         S+wWhB3jVmyQMipHpJa/MBqIFG45QQD/LMhbSzgwsZPYNAYUihv9flA5v2rnoLYAkx9z
         8sKB4CRjeFgd0hSXynA8UWxpk4eZThkW0LMtjdb/CDToR1DtRIDP/ZuS4dsuq2rTzDF9
         Z8U5jOR3Kk6XqSAyPX5C0vkRhl0W/fGf2Soehy5iYu8Fef90oEqzc8YQijYITgmIk8NP
         4rgLWOBWjP+6iSZcU10jctGOIver79BaVCtQi7WFKKQIYXL+FmdqES9rUlJchlhJeoWf
         24OQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQmtkUKTfPFlpF/h/50AGv2oTo723vZTC8mj/XfOpqU5fejRM+++l4nqBpfZB2fGpSTEmGicXC366NWEI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKoxOCvTuDOJvmuNoPaY3dLxbuXILQup0HvFTtW4m9SQW4Kmfmr
	pEnC0dxIbfjIBWoHdwnWG1WdyL47ZXFByYUT02VGbS6IMQrePID0+RzBHtuQLxQ0RG77MOntWca
	FtiPyT46AacH6L39xHQ2mtiogTfyHv/uhFRVrAhFnwq1bH21Yyv3/qFl/tHtgvTSxpbg=
X-Gm-Gg: AYBFou120NvPOUjODKmfSdPdmbq4BefXPlAvdehTFznfvl2I4CDaMwdkiWKc2bsMqD3
	hNLEbsxwXdcHExWpHKdqv+idXjGkdYM8pTI8yrF2rnZ61f+GMPh2qWz2Wd2p/O2jzbvIV8vc8T5
	m+dbVSbYed4tJ8sszIx30mkc1r8z88TMqhlawy0cM1XNE5Msqkg1O4m5XPYO79ubPEU205/yXhB
	Dw5wyVhrbr2ypvq9cwetwfNLLUNaA77WMnHRTELu9ehTJfFfqPvZCjWlMwuDhfj8bRDW8SHbjc2
	mlVvY+SUxhJo8uwBP+urWRZTDLHxtvcqRFtf6Dq5YDBBhEaFwf9JJ5greTnU9A2VKVq+Q1MML9+
	H+Gig8Z+rOjMFWUTEAb/7rR6NPjqpbDEYkBU=
X-Received: by 2002:a17:90b:2886:b0:3ac:7556:8eda with SMTP id 98e67ed59e1d1-3ad86ed22e0mr880876a91.26.1792564804683;
        Tue, 20 Oct 2026 23:40:04 -0700 (PDT)
X-Received: by 2002:a17:90b:2886:b0:3ac:7556:8eda with SMTP id 98e67ed59e1d1-3ad86ed22e0mr880851a91.26.1792564804142;
        Tue, 20 Oct 2026 23:40:04 -0700 (PDT)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad82f0c0b1sm1163101a91.0.2026.10.20.23.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 23:40:03 -0700 (PDT)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:09:43 +0530
Subject: [PATCH net-next v3 1/2] dt-bindings: net: qcom,bam-dmux: Add
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
Message-Id: <20261021-qcom-bam-dmux-vmid-ext-v3-1-cedd1f681102@oss.qualcomm.com>
References: <20261021-qcom-bam-dmux-vmid-ext-v3-0-cedd1f681102@oss.qualcomm.com>
In-Reply-To: <20261021-qcom-bam-dmux-vmid-ext-v3-0-cedd1f681102@oss.qualcomm.com>
To: Stephan Gerhold <stephan@gerhold.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Eric Dumazet <edumazet@kernel.org>, Eric Dumazet <edumazet@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792564791; l=2584;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=+H88cOWbCsr1Tojb6ZNHvvkjVXxKmA9tV/JYivC1jLI=;
 b=jvqnU06bPNXWGokvta/iNg5fJLjcazoX8uHlm/aUb/z/8bSBNChDA7YL3K1sf7iMBoDvfgFk4
 V3alficaPAhDo9Al8/f3faCfBrepXb06z+NeHUJUwuRMx7KtAcwJSqO
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAyNiBTYWx0ZWRfX5AKT0uPjfdsm
 wKKrYtNpBV+kB9VaZjoDCo0FVL5DikRti8/ROE8SdD+xjdn7Mz1Z+H0N/vqSKRDGCgskJLc7/3y
 oHgf32mn12xfKs6IjEWKj2j7UzDFf4v/cSV9u2pg81JG32oH04pfxjBDfsfP8ICmLaBzJDXcwYU
 uhtVhBXuCXXXWYFFvFjo29Oim3W9sEfoXeCzGMIl66SWqVVjo/NVhnegppD3GmpeW8uK2SHDHrj
 kvvdwijbRCCkbFFy6hB78Pm2ec5kM6n9j+aWG6sqpZXP0jZIu2g+Wi3Z7ZhSZsQQN2FK5kNaqTT
 Uhpx0g/e81Jl30ctbgiZcXY2cAVaM/c9SsUeScBVyc5qUNK1RqZezc2y6DpXCpGYVD8X4hXOy06
 t+U3nZ+BDMU9SVdduQuYn585CWrG7TlH+ODMtW2zkplVkqqUqBTXy9O93McPAgnIQbB6O09omp/
 3kFguOV5SOh7n/BtR9w==
X-Proofpoint-ORIG-GUID: S8cD5p4BL-Ib6A51HDb9gA4msplntypq
X-Proofpoint-GUID: S8cD5p4BL-Ib6A51HDb9gA4msplntypq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAyNiBTYWx0ZWRfX5ebTNZunV55w
 2qCL0JyDxVlRyYKbcepUF4E5+isyQZcHckKyZiyFGK/0NSpjdyreRxxBuAmnJ5pFu0evII4xdgE
 BdX5KF0awF/WGMdeGb+GUFpXAxHjV+A=
X-Authority-Analysis: v=2.4 cv=HL5WhYtv c=1 sm=1 tr=0 ts=6ad85e45 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=t_mNxi-BVxZHgpyDufwA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210026

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

