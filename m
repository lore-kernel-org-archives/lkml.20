Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794895487;
	b=tGgvmgZGDIwHxd3wmoVxyS6MzClRLysOWgSnlUXqxBvNkpQ5jgdvd7Ko5MXwNzQnl1Y7
	 gEoCau14FPtO0rWbsJJTF8LYOmDkqS0SA1vKNKuxpx74NJg6rpDQKMqPcEGBS8RNA/Naj
	 +Njz+8ehM1ukDsAWuK8fcVrGQ+91lgxTyq9ZJ3vYsXz9CSfHnTBSSUTVFp9pegxMtz6dN
	 n/wAbpzyURfJmR8hteeyGdu+UGstycRgL+9JcPc1RK0bjFUNYNNp2i9v/Of9+94Wjtk2p
	 J7SaD3jyBc8R2hVIv0riESt1LM0w2abm4mw86EVTcAOq+OwHJQhnYS6MyKOEBbqqoKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794895487;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=I/x8LEUqpZp5u81LwtMSwPVHBo6HG3KXpoxOATLQPFE=;
	b=IYJa7ROF7tN0XwuZ/AyLH3tzUgs+Y6UwzRb5GpO1Vjk+6nv9BpLkSY+TIS4R0MAgrx5n
	 8DODJInnMxuUrPBBpse1iWkGcsSAr06Mbr/x+jB/rw2xyaMONo3zirASoelZB3VzGvGI6
	 2faHosJkLdylFTwn07jtIbCvLEfPQ9s4LXNo2gemFoKNgRMwhYYuq7+6iOB5ia2e9iEKb
	 0JmlAwmVMX/M5UD9SQPpalPpJu5jOnT8GBHfS4/xGboEkuIwcLwHpIhozk81rx6u5HYIA
	 ASul6XP3rTYAvDG2kg1PhzYjqElX/XejB8DAoUqD3XlYGW+tAV7ucdT3VM/PpsxSLRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JTf4MgUM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Fh9BtcXG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD895606A332
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:04:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD895606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JTf4MgUM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Fh9BtcXG
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH53GDq3458198
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:04:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I/x8LEUqpZp5u81LwtMSwPVHBo6HG3KXpoxOATLQPFE=; b=JTf4MgUMhanr2stz
	WZoKX1UXoAU3fwC7cmkDCcIRIiyDT30rnF+4uWHideMVBeXtAeuk47rq9VYZn3A+
	A1WZSSUBA4eP3IJREAVddrJqfC2mayu99RbBo2v9qSlOJAblMIuLYGxDEiFCQ1qY
	UM7VtfdgXIWRnufmS98c5IdC+t08JMvufeIEQXVf6r2R3xqRDRE4DtD5ToGMsVdN
	5K/PJ/BSshl8C00/9cdfQCiN2cs/k8fF7UgjxTy+gCzd+NOnvAnc6tVfKbKdQmc7
	yNQs4HObt/Jjw0BYDW59mKFUeg9tYpt+rtSkT3EhESVy38oKbGqE28TgUPl0INuy
	7yhUnw==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0geh8698-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:04:44 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4cc89e86e4dso5338526b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794895484; x=1795500284; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I/x8LEUqpZp5u81LwtMSwPVHBo6HG3KXpoxOATLQPFE=;
        b=Fh9BtcXGUWHcwvh8r8rzJujVBi6kBUT3pyLH870uAUMX/Lk6pC+OjAtAyXEqTCUXpZ
         MiTJ9jNRLFNf96ig8nmU6YPYsQPaJk7eJnZs/lC/xlov1tdl8COA/bAwTkpHyHx42JJR
         eGDmoKpSNJ1ual2T00jXeaAyaJYAhfPr0zL7bXYTERpk2sk7Q4ACFMqy574cMe+/BxRZ
         yZtzaMOJissxGRzV6I0qfLNZHHkxPoTHHxVHQAvGWuldZjd75X6DKX0sTe9U540M3R01
         AQ5UR2/OTPx371+pH/6twsjqnvSeytmTxqzuFf2ht2Ua1WoMiQWDDkp+D4VdUgh68UfF
         BtoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794895484; x=1795500284;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I/x8LEUqpZp5u81LwtMSwPVHBo6HG3KXpoxOATLQPFE=;
        b=dzKzPZ+dfmhYumroCpUk1Vasn/6loaoxec17JUIWIQ1KY5VSnD8XQnc3xNM7Invo4F
         lDEyrQSee5B+NaRF0+CuM7XfGm4BNr39JpCbIYYwB/I1m+mMZc2l/EOT5eaQLZayrqGB
         BMHvDn+m/brYljyiwP+yIljHf9AFRVTfshFecMfjguZlhyvhpWLbx32MQgouYy8xXg6c
         dEMUbf3c7GOmEOoY30UUVCMO20SobfksOJT+1g1ygIYml3jnBYA+JWhsif4RDat3chKO
         k6Zw0gFeNv2JzUuv/Kz6LktbTiOYDyDVeLr4ZsPGVYrhJp9tGYTY+UzioGPbQnChPOrZ
         eBeQ==
X-Forwarded-Encrypted: i=1; AL+hErF8absQxIjaQgmCZ644azaDo+6lCoW2+FgNr/xVUnopAaqK0DCHF6DpxTRzTpTTxTJVbsT1bQOQocnN6sI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BlUUy34bxMYCMj362XZxGPNyy5pQ//WPMAp32vT0bARuirNNQ
	/Jk+CScXqGTKJVnxWQFDRAC+AOvVk2iAj1D3/cWO6ok5zEIanTAUT88owFnc/rRzGKJRs7mE6Nc
	ih+ybKNDBHwbqICfIUmytOQx7n/t5t4h6FG4vn4Y2y/KpoDJu6dAUrCJCfmEcR8+8yAs=
X-Gm-Gg: AYBFou3s/bP74eU1i3KNGL22H03OZU6tnGJt6NVLe13hAnyc3dEnkg/QnEmtZAOFNTj
	QfxB/vvN7kGyMfUS3vDyPe/HoomIr9MdkD8g60sN5RhTVaRzvRQqHRfIg9QYzoJIzWEzSzGj4Iv
	zG68X5N/C+/ropGkA0ka9tgwjco5SqR8ZzlPfTQIfiG6I3Ii2fv6T/acS+eTlCzYfimkoShbyxi
	fqU9v9UspdRLoB/ObrpynNVBodSsnLyjqwRpb1ZG6RUtWClBEhDIImTb0B5SA0gBQ/oglpebGgZ
	2LU4Swhi1v4xEXuqMKSc5TAaPwFTy/1aBAUq0no5TvuNEXSZ6lYA4rRqe4yrqrDXafPPTimzXQe
	vf4XW7yc7BwJyrRRSVUpEtuKlpEVv6vNNwbboZmqoafSDzvPUb5MIeeVCelIIEJDd9v8XA27RHc
	PpDcF+Ge0qZvV3d2m0PugjqnWe6I8isw05
X-Received: by 2002:a05:6808:50a0:b0:576:1161:dedb with SMTP id 5614622812f47-5761161e0bfmr1203204b6e.52.1794895484058;
        Mon, 16 Nov 2026 22:04:44 -0800 (PST)
X-Received: by 2002:a05:6808:50a0:b0:576:1161:dedb with SMTP id 5614622812f47-5761161e0bfmr1203191b6e.52.1794895483672;
        Mon, 16 Nov 2026 22:04:43 -0800 (PST)
Received: from alfred-sh01-lnx.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e70243e1bsm11903464b6e.7.2026.11.16.22.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:04:43 -0800 (PST)
From: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:04:34 +0800
Subject: [PATCH v3 1/2] dt-bindings: nvmem: add byte-mask property for
 non-contiguous byte selection
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
Message-Id: <20261117-nvmem-byte-mask-for-split-macaddr-v3-1-c02177658f66@oss.qualcomm.com>
References: <20261117-nvmem-byte-mask-for-split-macaddr-v3-0-c02177658f66@oss.qualcomm.com>
In-Reply-To: <20261117-nvmem-byte-mask-for-split-macaddr-v3-0-c02177658f66@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hongmei Xu <hongmei.xu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794895477; l=2591;
 i=hongmei.xu@oss.qualcomm.com; s=20260917; h=from:subject:message-id;
 bh=F7vBDFWg5et6LEE+ankPhw+4UDGYmm0gEALDX/+QSlQ=;
 b=GfUMN1LG7ZG+eGhGobnPVqPNHP7T2u9brXdaKaiCep+ba+Z3iYu53jVzoGJpQcShH4vKejsQM
 zjkkAYMyh4IBPNreveMpa+eFGOVv5b5fab/bF/mdHyReTtzoOmRQvxO
X-Developer-Key: i=hongmei.xu@oss.qualcomm.com; a=ed25519;
 pk=8J3IzbyuOOHSwLvktng8AEQIdStEQDAGNCSOlkASmk4=
X-Proofpoint-ORIG-GUID: rLiuJ3aket8kfjrHQJ30SNe1ifjhPvKV
X-Authority-Analysis: v=2.4 cv=dLkzC+Zb c=1 sm=1 tr=0 ts=6afbee7d cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=2RO16J5LXPjieTe9OccA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-GUID: rLiuJ3aket8kfjrHQJ30SNe1ifjhPvKV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyMyBTYWx0ZWRfXxp4txPfq/N0i
 aRvfMoB/u5HmAfsLlDbOpwBFgyWbeysFNKWJbLzXIa5ZA4VDHTw33lTqhoj6m2s0jMghHEIupKs
 XBuCRV0cRmH38LBuX0EMqpadl7T3RZE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyMyBTYWx0ZWRfXzKOM8/DgeYgq
 zUI13TVOD6hCOXoFtWEdAO+mgc9Ieg0PCOfDges4cpxE/GyoNaCFFlXBFodqMc9mYk0HfxNU5X5
 o4yei21wXxUp4YT20C/q0gJO0jNpSZbBo5FNMlCgC/pyUpm+HhmxnBETKXmNozk7jv6xoWOe5Ao
 CMH2RojhUy2AARRBHBMuj75AqzD0+e/cLhnIp45Tcx8PDLq2xp+SzbKwTYevScV+798Q9Cca5FD
 ZG7u4wgUlmne+uP11PHCPzQtTt+ERsRtncfmvDIPFYKYNeYCLtHObse61R+9RriGCtp3se7jwc0
 c+PBlPurkT7a3W6KKvfPhMVEuxPnjo32i67truJAoBSQ88/qLKiNH7NrA34W9LH/pI4yA5uhRTm
 VhmW2zsjnFBqx5cdaTqIgYceMBS81bP6IP+5ysHlGWvp0SGNIrGyDkYiHT5pCYPzZ7PCdQWEqdV
 z1ZLwnrohB+uzxSueIA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170023

Add the byte-mask property to the fixed-cell binding. This allows
selecting non-contiguous physical bytes from an NVMEM region to form
a logical cell value.

Some SoCs (e.g. Qualcomm efuse controllers) store a logical value such
as a MAC address across non-contiguous physical bytes, with one or more
bytes in between reserved or unused. byte-mask lets the DT describe this
directly in the fixed-cell binding without requiring a device-specific
provider for a common pattern.

Bit N set in byte-mask means physical byte N relative to the cell's
base offset is included in the output; selected bytes are packed into
the output buffer in ascending byte order. The number of set bits must
not exceed the cell's logical size given by reg. byte-mask and bits are
mutually exclusive. Cells using byte-mask are read-only.

Signed-off-by: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
---
 .../bindings/nvmem/layouts/fixed-cell.yaml          | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml b/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml
index 38e3ad50ff4f..46e1101ee98a 100644
--- a/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml
+++ b/Documentation/devicetree/bindings/nvmem/layouts/fixed-cell.yaml
@@ -34,6 +34,20 @@ properties:
         description:
           Size in bit within the address range specified by reg.
 
+  byte-mask:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    description: >
+      Bitmask selecting which physical bytes within the NVMEM device region
+      contribute to this cell's output. Bit N set means physical byte N
+      relative to the cell's base offset is included; selected bytes are
+      packed into the output buffer in ascending byte order. Byte positions
+      are relative to the cell's base offset and limited to a 32-byte window.
+      The highest set bit must not reference a byte beyond the device size.
+      The number of set bits must not exceed the cell's logical size given by
+      reg. Cannot be used together with bits. Cells using byte-mask are
+      read-only; write operations are not supported.
+
 allOf:
   - if:
       properties:
@@ -48,6 +62,13 @@ allOf:
           const: 1
       required:
         - "#nvmem-cell-cells"
+  - if:
+      required: [ byte-mask ]
+    then:
+      properties:
+        bits: false
+      description:
+        byte-mask and bits are mutually exclusive.
 
 required:
   - reg

-- 
2.34.1

