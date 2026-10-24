Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792856530;
	b=tFQrJizP9KhQPptbvPpzv7DV+bKCYgjyKKDrg4QCmL1p/gFk7x9QSNhuNCnowzgNXp+D
	 sobgQh4weF/o5DPyEDcmEDYLUBid0JgVQqk0hg6RT2WDBg+k6fVTsQMqRjKqF//6ypBxO
	 IDkokqNprmiz/2ANDvo07z0GBXGbPVaMma+jfmyRPmMNeTp06YfGMabU//h3hRyuGdzhO
	 Lii3xtJ0X9aqeIIsDhjUHKCMVBWlg4DUvBGT1BTWIHaLhZ14FgmLhCv7rS1/1d+DBOiMb
	 RT+AL2Dsz9EFar7CvVwOznS22+d6NlLi3axqUue/XcqvyOgUuFGM3gzc0EekCQF1SdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792856530;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Y0Zlmu99I73712v7dio42Q8sSfQByYjnANjrYzCm+Jk=;
	b=Q+5MjudcUDgD26ee+p5jIuEztHjq19wDsCkAjvF94nPJyFLJfDT10ksjegAUWS3+R9yI
	 Y5cb1lz0AfsdhfqQDxCi4n2SdEjFPDNrGI4nCljoi1xeuSjt/JOvnPlPZH3ES6vl3v3U+
	 b2g9JC5BQK+OsVyK+cjwYUW7XMrRPMnH+CwdfTZ455HSETxRLT2lahRfRy8iwwSaqsXDS
	 hKwP4+D/31mubo1+I6yQFPQWiSRE+l4LAXlgNSTDAngtv6GOahvmpfEQlL9uMpbkbvXAc
	 h6OkiR9Dmlo2GIP/+O11Sre9lGSj2cMSoRyeHP2KsOxz1VIn+569p1QGutc2rl0kzZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qz41Bwqy;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6A2606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 15:42:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A6A2606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qz41Bwqy
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3535a54bed9so2824842eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 08:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792856529; x=1793461329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y0Zlmu99I73712v7dio42Q8sSfQByYjnANjrYzCm+Jk=;
        b=qz41BwqyyY/FmwudE5RNN6xkRdWr7oi9Arxs3n1P7QJxIqvkOF/V4a/GtFbbVr2I5X
         7LrjYuZ51P+zQ3SQ54qtmKVb+nzsDnS1o+00bLzbAeYhQuYkjQM4g3axy3SGvKAgPSWo
         bvWu9kBrGxYUJ5wszVBlDWC90U0uJATwRiniaX4bMe994yBt5dYBaCHx6NnjOai8/7fJ
         V90Xx/N1FnysApb9zYe+oMBuphsJ3UI/BlLvZeNTbGDqhziGShxzOvaDeja9kXxfJBMe
         6cWI4gpIRNzmbYU8/9qwNOuQ66C3gYn2Co/zwoqdsYWOFbdFam3ktXl5hvaphfcy5mid
         zzog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792856529; x=1793461329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y0Zlmu99I73712v7dio42Q8sSfQByYjnANjrYzCm+Jk=;
        b=Vg3QiUkie4+iU62a4V2dDwL7mFyLnD66ZLzWzGjDmbKJV8sTUmi6EVVTOw+ctCUTHZ
         RqWdBWcAHCqE63DcEUG76XxgRkSKvgg7ODk6dE8ZEmK/nu7aup7/DufPPJD3Ctvv4LNf
         uFjc7i2eePuR0W2Owr1Wy0jrejIsHK3lfqqXPSXzccJ1Llxd0NgECX7zJZ5f7zzgJZ3/
         uf9n8PvtddpvVpBCeU95TwWt5+1o60M0DC9jcK2rQl+pu+mpB+43DXR6+UgG9o1eMSIq
         NiEMPzVqCpiujlUEVkba0uKdFka9qkEX3XJ5w6BQ6KCwlRnzbffs60qkO+x4p0FRtqee
         J22w==
X-Forwarded-Encrypted: i=1; AKwUvBw1SfysZwWSYbsVuDhYBdwiEuyYIAiJlnPiN6lFLfMrmy/aebU6q1aNJMpiBPkcye9RiaetsNVxOlxX28w=@vger.kernel.org
X-Gm-Message-State: AFq9FYIX+bQYB9PkwZcZin1hM7o15FahIn1KdKg0l3wBXht2L3T9TJet
	+OYRLhv8WCFcKi0N5gz9ot/tuy+8kuRnly5vri3gXxiV/U2EXvfjNePD
X-Gm-Gg: AYBFou1hrohVKZypKZ0CVK9yZy7iHmlX/rqCP2ib64Vy15ZpoPOCzR6WMQLn0Tg487h
	7tagcqQiE+5eUpnd/kmnrp5QusaJmGnntpVCYmFkjJj4XyC+DO4y5norIUH4IgQeEO6J8EKF3ko
	pK2doN3il7iNWoBEj9ysoRyXciiu6bpBLc8bgUa03qBueNy33kvHrxs7b9nLxiHlLUJs4fcVzWy
	gJu7jsG+3a/WTKHPUJq4JMQUWik0eqk5Zly5oXFmTz+WJcr4+vQ2SR9hQeB7O09uFeYTeLZ6kI5
	y3KB1vj5FWuAFopcNJ1D0twqMb+sx+8TyzVx0Am7hhLg+oLu3ixyz35pqlRpkdq1yPnbTj7Q1E+
	5vUqJK0f/y99QVUUGC3wNXq3iO7kZu1aUXEfEzoQ2/OXVIG+ftiuVEJ3hKzx3JV0Pqs+pVqONuf
	kCUUMv3XpUargIHGJYFW/cLSj+HTuEWdHERTfHeMOaBiUoUc83mHKqHSOW8uoV0qfv0NeIHZUJ/
	o3lXDIWxgyOUnF/3N3trKpItWwU+n29i8dgB76Jbu3NmTSneCFdsFGKxw==
X-Received: by 2002:a05:693c:80cd:b0:34c:fb30:3e30 with SMTP id 5a478bee46e88-369e842cbf2mr3808651eec.7.1792856528662;
        Sat, 24 Oct 2026 08:42:08 -0700 (PDT)
Received: from plex ([2406:6d00:a27c:4200:aab8:e0ff:fe02:33c1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8daf444sm7766450eec.18.2026.10.24.08.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 08:42:08 -0700 (PDT)
From: Chris Scott <gilroyscott1970@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	pawlik.dan@gmail.com,
	zhengping.zhang@airoha.com,
	Chris Scott <gilroyscott1970@gmail.com>
Subject: [RFC net-next 1/3] dt-bindings: net: airoha: npu: add DMA pool memory region
Date: Sun, 25 Oct 2026 01:41:48 +1000
Message-ID: <20261024154150.45733-2-gilroyscott1970@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261024154150.45733-1-gilroyscott1970@gmail.com>
References: <20261024154150.45733-1-gilroyscott1970@gmail.com>
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

From: Daniel Pawlik <pawlik.dan@gmail.com>

The EN7581 NPU can only address host DRAM at 0x80000000-0xbfffffff;
higher addresses alias the lower 1 GiB. Allow an optional shared DMA
pool, after the firmware region or after the WLAN regions, so coherent
buffers shared with the NPU can be kept inside that window. The
firmware region stays first for existing users.

The original version of this patch was written with Codex; it was
rebased onto net-next and its commit message rewritten with Claude
(Anthropic).

Link: https://lore.kernel.org/r/atCRsquzA1UxSpCc@mediatek.com
Signed-off-by: Daniel Pawlik <pawlik.dan@gmail.com>
Signed-off-by: Chris Scott <gilroyscott1970@gmail.com>
---
 .../bindings/net/airoha,en7581-npu.yaml       | 40 ++++++++++++-------
 1 file changed, 26 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
index aefa19c5b4..21a1a27500 100644
--- a/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
+++ b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
@@ -42,22 +42,34 @@ properties:
       - description: wlan irq line5
 
   memory-region:
-    items:
-      - description: NPU firmware binary region
-      - description: NPU wlan offload RX buffers region
-      - description: NPU wlan offload TX buffers region
-      - description: NPU wlan offload TX packet identifiers region
-      - description: NPU wlan Block Ack buffers region
-    minItems: 1
+    oneOf:
+      - items:
+          - description: NPU firmware binary region
+          - description: Coherent DMA pool for buffers shared with the NPU
+        minItems: 1
+      - items:
+          - description: NPU firmware binary region
+          - description: NPU wlan offload RX buffers region
+          - description: NPU wlan offload TX buffers region
+          - description: NPU wlan offload TX packet identifiers region
+          - description: NPU wlan Block Ack buffers region
+          - description: Coherent DMA pool for buffers shared with the NPU
+        minItems: 4
 
   memory-region-names:
-    items:
-      - const: firmware
-      - const: pkt
-      - const: tx-pkt
-      - const: tx-bufid
-      - const: ba
-    minItems: 1
+    oneOf:
+      - items:
+          - const: firmware
+          - const: dma
+        minItems: 1
+      - items:
+          - const: firmware
+          - const: pkt
+          - const: tx-pkt
+          - const: tx-bufid
+          - const: ba
+          - const: dma
+        minItems: 4
 
   firmware-name:
     items:
-- 
2.53.0

