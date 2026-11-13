Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.128.198.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794554030;
	b=eYan319s7BUqvaFgiAr3PUkDlMRdtT/yS1EDJmHYp4eZdf9bJRuQIULsnbx0UCNFyiSw
	 E5dKq0hr+BymDCmSi93FwC5ZDh5kItSQb3bgHQmp3SnaOh+naxhM/z4JLq6C96mxYSd0T
	 k7qmBvn0Sq+3Lz2JSF9F2GA3vTs9cDVS5btA0qOvZfT2rGVrR3KGeT9qrTSusR9lYdROq
	 /bskR1cbC6GtvTCG51iqFoZOOvopjw35W3dVxJvyXSHdyA0bYXugYFF8STp9V22aO/0vP
	 cH0rLUV1Btt7+feQhekwsyXRFOi25lHtbrX+aS3xBXbaaBgj2XNMlde+Q0nSOVyqz4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794554030;
	h=DMARC-Filter:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-DKIM-Results:X-DNSRBL:X-SPAM-SOURCE-CHECK:X-MAIL;
	bh=QE22+vCD+5ZFlPxh/eG7EteY2wTaowHsKUJq2Ws2oNU=;
	b=wbMV6fGHcjr9auOscPyAqaEykmrig/KESpxQRSZLbmDY8JyJMLfJ2dh1uHauDu8AAU7J
	 OoE+l5f6NqokuHLWDIW6HM/7XvA+XQwTzL42HSQIixVfWXz6DO71jTf+c5OV4hTvk5M6E
	 PLaUdBmN+bjbXq9fx5ZBMg8zV/Fu/0+5sc1d+qBRqz0BlsELZ07wfQunOSFHt8uQTF3J7
	 MfWR4tq09UVNfn96qsUXq0Z2uxxtDFa9rN19K6HIcf+RKl/Rkm6Lr95UvRoSOXPko/1qv
	 jBRfnMPhFQF+1TUyfaf4rNTB6YfqNnIeFq95UZSh2loFvokAq5/7XjrTr20qbjBjD4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andestech.com;
	spf=pass smtp.mailfrom=andestech.com;
	arc=none smtp.remote-ip=220.128.198.184
Received: from Atcsqr.andestech.com (atcsqr.andestech.com [220.128.198.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50562606A894;
	Fri, 13 Nov 2026 07:13:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50562606A894
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (atcpcs55.andestech.com [10.0.1.155])
	by Atcsqr.andestech.com with ESMTPS id 6AD7CR5O059129
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 Nov 2026 15:12:29 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs55.andestech.com
 (10.0.1.155) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Fri, 13 Nov
 2026 15:12:29 +0800
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Nov
 2026 15:12:29 +0800
From: Mina Hui-Min Chou <minachou@andestech.com>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <conor@kernel.org>, <jic23@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <geert+renesas@glider.be>, <magnus.damm@gmail.com>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <randolph@andestech.com>, <cyyang772@andestech.com>,
        <tim609@andestech.com>, <minachou@andestech.com>, <az70021@gmail.com>
Subject: [PATCH v2 12/19] dt-bindings: cache: andestech: update schema for generic LLC support
Date: Fri, 13 Nov 2026 15:11:36 +0800
Message-ID: <20261113071143.1446167-13-minachou@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113071143.1446167-1-minachou@andestech.com>
References: <20261113071143.1446167-1-minachou@andestech.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs55.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 6AD7CR5O059129

The last level cache controller of Andes cores is not specific to
AX45MP. Other Andes cores, such as the A27L2, use the same controller
with the same register interface, but the binding only accepts
andestech,ax45mp-cache. Add andestech,llcache for them, and describe
the binding as an Andes last level cache rather than an AX45MP L2
cache.

The cache-level, cache-sets and cache-size constraints describe the
AX45MP L2 cache, so apply them to andestech,ax45mp-cache only. The LLC
of other Andes cores can be level 3 and have other geometries, so
allow cache-level 3 and require cache-sets only for AX45MP. Match
renesas,r9a07g043f-ax45mp-cache explicitly instead of through the else
branch, which would otherwise also apply to andestech,llcache.

Also add an example for andestech,llcache, and add myself as a
maintainer of the binding.

Signed-off-by: Mina Hui-Min Chou <minachou@andestech.com>
---
 .../cache/andestech,ax45mp-cache.yaml         | 71 ++++++++++++++-----
 1 file changed, 54 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml b/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
index b135ffa4ab6b..da9688cc95f7 100644
--- a/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
+++ b/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
@@ -5,14 +5,15 @@
 $id: http://devicetree.org/schemas/cache/andestech,ax45mp-cache.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Andestech AX45MP L2 Cache Controller
+title: Andestech Last Level Cache Controller
 
 maintainers:
   - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
+  - Mina Hui-Min Chou <minachou@andestech.com>
 
 description:
-  A level-2 cache (L2C) is used to improve the system performance by providing
-  a large amount of cache line entries and reasonable access delays. The L2C
+  A last level cache (LLC) is used to improve the system performance by providing
+  a large amount of cache line entries and reasonable access delays. The LLC
   is shared between cores, and a non-inclusive non-exclusive policy is used.
 
 select:
@@ -21,18 +22,23 @@ select:
       contains:
         enum:
           - andestech,ax45mp-cache
+          - andestech,llcache
 
   required:
     - compatible
 
 properties:
   compatible:
-    items:
-      - enum:
-          - andestech,qilai-ax45mp-cache
-          - renesas,r9a07g043f-ax45mp-cache
-      - const: andestech,ax45mp-cache
-      - const: cache
+    oneOf:
+      - items:
+          - enum:
+              - andestech,qilai-ax45mp-cache
+              - renesas,r9a07g043f-ax45mp-cache
+          - const: andestech,ax45mp-cache
+          - const: cache
+      - items:
+          - const: andestech,llcache
+          - const: cache
 
   reg:
     maxItems: 1
@@ -44,13 +50,11 @@ properties:
     const: 64
 
   cache-level:
-    const: 2
+    enum: [2, 3]
 
-  cache-sets:
-    enum: [1024, 2048]
+  cache-sets: true
 
-  cache-size:
-    enum: [131072, 262144, 524288, 1048576, 2097152]
+  cache-size: true
 
   cache-unified: true
 
@@ -64,7 +68,6 @@ required:
   - interrupts
   - cache-line-size
   - cache-level
-  - cache-sets
   - cache-size
   - cache-unified
 
@@ -73,15 +76,36 @@ allOf:
       properties:
         compatible:
           contains:
-            const: andestech,qilai-ax45mp-cache
+            const: andestech,ax45mp-cache
+    then:
+      properties:
+        cache-level:
+          const: 2
+        cache-sets:
+          enum: [1024, 2048]
+        cache-size:
+          enum: [131072, 262144, 524288, 1048576, 2097152]
+      required:
+        - cache-sets
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: andestech,qilai-ax45mp-cache
     then:
       properties:
         cache-sets:
           const: 2048
         cache-size:
           const: 2097152
-    else:
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a07g043f-ax45mp-cache
+    then:
       properties:
         cache-sets:
           const: 1024
@@ -101,3 +125,16 @@ examples:
         cache-size = <262144>;
         cache-unified;
     };
+
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    cache-controller@e0500000 {
+        compatible = "andestech,llcache", "cache";
+        reg = <0xe0500000 0x10000>;
+        interrupts = <16 IRQ_TYPE_LEVEL_HIGH>;
+        cache-line-size = <64>;
+        cache-level = <2>;
+        cache-size = <262144>;
+        cache-unified;
+    };
-- 
2.34.1

