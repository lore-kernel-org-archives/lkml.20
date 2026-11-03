Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793715552;
	b=wZ8r1IfrNTCR0DIN6zlhy9IrTY1CqIn4NtTna4BvEUjXoiF2gkbHd2uUUlXp8dQt/Gua
	 flffmkxa41OlIfmYYkfT3W1/ToPDx48RyLJTQZoFMRcT64DSrTz0CA/IR3HW4C1wyIoPY
	 Y968jfvQ4q4DZFGvWVCkI1++r37Pz9cyqbvMhs83nopjAD/zSe7Xx9XiV7cJDkWNcMu1L
	 afFTZ3pu6vt97f8HEkNrVdtVNcPu6eyTP7L487QOM5c8qF4Sr3kn5Aknidz/khG/uaZLn
	 w4pNYhFd9t/agYK9d+6sJzNxYYgKqKSB+Wo4fIrRasHhQcIn/9KAywhXLQjjTl1s2Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793715552;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xnlIiT/rfVkZ5TORtokGoyofx/3bXHZA3Md9PXbjv8I=;
	b=BVDl51qN0MeV45p/6pEjVPVT4sX4iDg0S7oFnDso4kqg7kkWI+yOt/KYQY6TVGOVIh1G
	 g1M7DGYipMIEWM2g9xpYGKHRY74sxFZSUUUTpbCYxU5O+PQ9GEXUoY//AuIMrKiahiiiY
	 a+qQgx6e2pgJciLuy08N/+CugGDlQqQzlLv78WHKvyFPh0MShSt0qE7NuPvZX3daK0ICX
	 SglBa009gzg509ljWwNh/JYuQSozWALezy1DU21zAilaqSPDIW4MtdnkVRXVcm0Ngso3W
	 dXLNDIu02ejhVe+8z9YpO2SE21pZjOOKHJ0zRa/iB4vELIdbQfa/katGnQ9r4QZeacw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Brrp6+A8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QywyPK8e;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6830606A331
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:19:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6830606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Brrp6+A8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QywyPK8e
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3E9tv62119603
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 14:19:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xnlIiT/rfVkZ5TORtokGoyofx/3bXHZA3Md9PXbjv8I=; b=Brrp6+A8H+6CMoCP
	eHdD3BxF2jybKqgoZG2kv+4hitRr+IDBgkq4lr4oe3iTF9AcMGXb+0mbaoG4C7nl
	z/xcLyrrJEcVgXsx8RXrie/W5/lmGGDzTOuRmoA9tWHDLKdTbR0eiZ7meCM4bIxs
	EkhoPadVyHLm2Mz+/LgPRY71LaLcdne61Ey2bUFqJ3kaku2RnCiI/ZIu9d3YCoWD
	uRxB0fYdjS5+DSmnuVfE/9SOeMRUT54Me1VKLJ5kbDkzz27RzbsimCCApWoiKe/v
	kfskcF2Mk8xqkHHwYDPABLzPgmRWDIkenp7247C4CCG5g6q60jYmpoFpZ5ryqr4V
	vL8/Bg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqh2br249-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 14:19:10 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a01e2962a1so3357357b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793715550; x=1794320350; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xnlIiT/rfVkZ5TORtokGoyofx/3bXHZA3Md9PXbjv8I=;
        b=QywyPK8epgqlb2xJsdwfGcifqzllIX0wp7YYus0IXswuk81TVSGIUmfbD9TepwSZQe
         HcDHbfXWeg5Z4ucG3vTGQrTOrCbf0IFL5asj5qZ1Dmz0wKcACPU7opiq2bo9OWYr+mrs
         T4t9xCchJct0zvg2kzPTzVlNpGVA7/ahBfdn2+3aqiU6FIhNbE9VWxfO48HfDaClkudI
         tNCS3a9LTxGPuZCa1/YUqBDirYe6+nSjY/mSM7mZt/AoyTSq+k2snj5vpH2goWn3pEfL
         iOZhEKAtVS9/1EtCMliCQTSsgOZV3S/6wudlwIelxULYgAYDWSaO4gdm8Z9aJk6JAint
         ccGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793715550; x=1794320350;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xnlIiT/rfVkZ5TORtokGoyofx/3bXHZA3Md9PXbjv8I=;
        b=nCHZ9r7dZ+bcND9bYeiGUS7w6TEuWthJWjgTNb0IA4lf+akWJM+EulrEVRvmEb9g3L
         swKOmJsxYlS/mjIhY7HanCdKbCoYWzoo5JcrOIXwGpqilVIFRZkKB/A9LNAKWALfsL2O
         oDufX9gWAWYFEzG4B9Nz3pRzOv1q8JjT6rlUZBsMW4ExpOdcp2CzFoYWEk2x7WP55vJ2
         lD5Ks5xLh3TIHuQ973AlsJ9NuiwC9WkRhv+0qgwKcsrYFnQJSk8LPt9YXrsC2AxbXuuf
         2b7oGOfti2OR6XBiNuZdQrjZoqwV4rfJecbKClYaz4+lxiqcyBZPhEHJgWGn7sat0LtS
         ostg==
X-Forwarded-Encrypted: i=1; AKwUvBwPo4PMD4+JkCkeqqfzgOd2Czu4xdkjKJ4lDHzDvJbw2NxN4bGlp31VMvBifmB7yBL99v3NJjVpR7VyTQ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jIPt1EKmLxK35mA4vl4N4Z57w90oRmwDMVIyrwZdXbwEoq4t/
	aUlIoVuf1yZ9c2qvXuDQtdP7jDiRoO5PLL3PiJUq1g4D+a3pcT0HIZ5wQLTrYV1HF7WiN/wZ94P
	WMVTfL6AD3Gb04sJbAI9ISLXE2XmNHuZgoa/F5/SDVb6IAzOhDyR3I6guDS/MvRiCsbJnrXmEJZ
	8=
X-Gm-Gg: AYBFou2cuk9OvhlhYaA4wWCbwXPWQVvVdNctVo7tRm5V95xaS/K+DiXRTxSrl2z6oUm
	5oKvQVGcbCW6bevIsijpC+fx31Z2xXxMeSjs/ipHaTUMNZiE1ckOCJmAodEi1JHKTiTeI3Z6soC
	i+8BLsH/WiOsrysEWc/k+NxVuOIGjMhTxGkQlizFmBbCJH2w/eD0vCC/wPdwAccrf4rH6FTeOml
	ojqmuSa6gKpD2BDgGSB/BkgjoCKZyZRD6IYKJCbWowiX8AocapGI3DOpTEnwJgo7LgywhZ2bFx9
	Lsxx4CbXhwGbYwSxiwsrnUhzp4gTZlID4ViV3NkaEyKdx+9NBRSW99ut7m9QtXX4eY0AMcVdgIx
	vIpjqUAAGemQLeHOmIJKW6ShHYZsm/8U3njTxoy5oldEJvE4Lcc3h06/TS/wj9nyFhSG1b/UllS
	tR07pPGoue
X-Received: by 2002:a05:6a21:a94:b0:3dd:85a9:55a3 with SMTP id adf61e73a8af0-3e928d40f81mr10710251637.37.1793715550197;
        Tue, 03 Nov 2026 06:19:10 -0800 (PST)
X-Received: by 2002:a05:6a21:a94:b0:3dd:85a9:55a3 with SMTP id adf61e73a8af0-3e928d40f81mr10710224637.37.1793715549697;
        Tue, 03 Nov 2026 06:19:09 -0800 (PST)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb36468be4sm1442126a12.12.2026.11.03.06.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:19:09 -0800 (PST)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 19:48:41 +0530
Subject: [PATCH net-next v4 1/2] dt-bindings: net: qcom,bam-dmux: Add
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
Message-Id: <20261103-qcom-bam-dmux-vmid-ext-v4-1-3690cc5ca0fd@oss.qualcomm.com>
References: <20261103-qcom-bam-dmux-vmid-ext-v4-0-3690cc5ca0fd@oss.qualcomm.com>
In-Reply-To: <20261103-qcom-bam-dmux-vmid-ext-v4-0-3690cc5ca0fd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793715537; l=2657;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=wycrMmj1886KQq8u+EMdY4E91b1IT2gBezsXLoyMxGA=;
 b=4i8kfHwG77skvWIuzZ94uNVY0TqxEDO10gVtsBd/DjUH1uid7Ce4wpe8wQUTWyCJBW80Ibbl0
 AVcOPRXn5PrCFq4ooInnK0vqBPnomE3i5UvnIDa3Jzy9S4VEuLbZkYx
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1NiBTYWx0ZWRfXxCjvHPsNyztq
 A+75oBz+xchpu0l5QVX2DpdAc1qoaaQvyMe0/evBBIPPnkBXC+ZIEbeSaJQXSvfecagN/qqkBYJ
 xAmiUbJ72kjZjGgUrerpMaNzoGay0Nk=
X-Authority-Analysis: v=2.4 cv=AKV9GsJK c=1 sm=1 tr=0 ts=6ae9ed5e cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=t_mNxi-BVxZHgpyDufwA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 8-igkkvYMXVDQjXhBe_TTozp4gUlAwnf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1NiBTYWx0ZWRfX0EHO2/3qtgds
 DK0MyczzToPFYltNYdKMkrj493DXQ1sFRL5myySNGVHlXM3S7Gg09lRlO9lUjycGly4a9hOuldL
 LljfdP76raT6yFE+BbdHbGDC2++UZ0TxbBIbAX0Hqmkxvz/FmmWIx/rQy/61cnXtJ0iaB5qqDgj
 tgHufhOkITyx2dJZSBil+GCfeS+ipyfrNhU4SY1yExgeCIvccVogFkOIOzXeIoul+o7qQbzTqcE
 +p5phy4I5iqz/q/EEWzeo5PJFP+zDhPiwaN5imK3QX64CxoRZXOw8OC7FTBy14yhSVVkJNQ4qLl
 1hg9Ls2oazKvF0+h3JcGwonvpY1shJt4LC9ihCpE5inhq7TzAd1bqxktcu35f42TRheEwRVAa1h
 vl73Dm/GIMIuCI9XFL3DdgeYgLdPwB1JpsIcLDcY75aF6YdBbTSf2zojakhB/zAJhAnVUCNOIGv
 MGQR2oRur1AN2D6wk3g==
X-Proofpoint-GUID: 8-igkkvYMXVDQjXhBe_TTozp4gUlAwnf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030056

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

