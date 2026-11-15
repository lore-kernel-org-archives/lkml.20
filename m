Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794723089;
	b=ypEQHKi2GO5ztz2b/5cV/QrkdPDaw7MU7xfaVmiaNCzDtXdQDrjZlwEqvXJVuQ5otl7H
	 0aEZJNyytYGfAOv84tz37wWfgeuPIxXOtHlYOkQQxmvdOGwNGhaGFIo8fxzDehUh6YhVg
	 TvTiPl9wKbEA/e0zdtX+g26VvEY5F9f7rMuOGNTojCOiW+PS0+zSDcbgRYdJcdP679RfG
	 9ZHMbrhz6pCLkqeckuOOd07620O+xjOyq5qJXbV9pDVvHWNc2rOwfFZZtFqY7d3gRAu5D
	 +KHEll+ZasP6DrDxMdFCtPwB31XiSysjEq6YJlnDIp38eBshIgN4esZLIkJSlJstNNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794723089;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HyRQC7LCLt2aLLScf7p5/WBb90iUzNQpHgR+zoYi5DQ=;
	b=PgHfkwoxmJ3zj+Eiyk46gOddH0Xf0p87miHsqgit4+H6Wkp+b5VrXgm/XvC+96Mx0EbV
	 nhEWuOupavQIcT3xFdoJn1ajbMBsUxIX9jxLLXnNE77y4gc1O/LDCmuT8FDyMGVm50xDR
	 519jsojwtso51O4MYDOmrFZ8JDNa0yafhVKAyMnMS+QF8K3RtUAMFk41VjCqrMgPTIqZs
	 p2biE+lf25Kzt7ovEH0xe9vtgY5QUszL9HQY0OrwXHK+aRZbxXSSXfok1AsPKdg04JxzS
	 yjSRgYGijfMmU4g+znEpKPR5kMgI6AyZyObphqzw8Qb/cN+hxSojvtMSZHTNJDko2SA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q+gyXwI8;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7713360A260A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 06:11:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7713360A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q+gyXwI8
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so1247975e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 22:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794723088; x=1795327888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HyRQC7LCLt2aLLScf7p5/WBb90iUzNQpHgR+zoYi5DQ=;
        b=Q+gyXwI8LIx7puLPN65lju54JGjmdSj9JiMh/HocFFarinZH4LA1OHXXAQEUVDkCmZ
         RDS8ZdDg00H0s9mcDoeYA/+f+x6lmRW6XxL52XpRXJrcq4cTaEFYT5s9uNDFmuSiF2m0
         UPn/OQs0MwB2BrJfpQ04fCK2Q87z6/N4RPTOmQ80ZoKpxKpios4af4eHOG69lVSXy0as
         VLo1+HMYqJADHUd8Hroxrhf5TmgDAn+Nb7DONC6xq7bMAtPkbfn5i6ykyu0FsvSS6hXg
         4ZAmST2jIYGXN2ROt77w82kJPbly6gEWRGMUQjv5oUKq2tuWlEvOtHs/l/m2JRY8RNr2
         8JQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794723088; x=1795327888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HyRQC7LCLt2aLLScf7p5/WBb90iUzNQpHgR+zoYi5DQ=;
        b=2dHKzfDham/dV/PbgX9wdHvQc/e6ClKLB1bo3tMKppQoTadghlzPWFLjrtyS0zCTav
         Wnfxt/bednbJVClk9Ut5q5MrnrYLJZpI5K7nLQWj+KIDzJfpfHTpjBFigFyMctFuJJJ8
         NDXfXcmBgcXjk2pwvVQ8JwkhE3y/U1Pp5htEXEBZwueml9Nm+NWfsU8UaWiFpCV/2fnZ
         WcX7MnRPKjSgUd3S0WkHIfPW9F7vTzo7VO+fNk+/mIlIYpIni7Uowqg9+KEk+hXXPppH
         +itcWIeL3rT0byNh9PU0+LQJTMU/Wrwsd4qm8dHFSciVy1vFsRbFglABQ34cimLoj3w1
         nDrA==
X-Forwarded-Encrypted: i=1; AL+hErGGiT9tqPaLwvjwA2oQMg304dCePQyd0TbFERZnvzTUTjAt+e70wd8UQ1MHiW60dW2+5tvB4miSQv9koWk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xA8J0Q4DdTi8SOw62KZNtGTwMvxbV0u35qeFWzNQ/Z3zA+P7g
	qnhxmpHf4eeITiCfoicFAGPzrwZsqAOUKjmgX2OhtYi+2JmFIGy0WBk9
X-Gm-Gg: AYBFou3BWpRvpuGA5dMvjlfQ2D37iyvRSZJP0L7YnWU/POumsbf1SbnkJlNxR/Ux/bv
	ikEWOzcTcbWeediSxPN2DUrF3KQG6A5nObOIFzx+ODUvTwhT0eOVdAXxjGhEt2aSYXoSLoQgcGb
	vGdYjgjAl3E/5riXLTsTTYDmApcFcCrCXwLGVPCUqU5Lp/gMSwRyAKoXkXEkuTlqnwfkPFZETH6
	wlE+pap9S3bMvSc/Mb9bHIK/6KSjDGzprhp5QnvSx6Me9wJB/B+O8NbYGcPPv0l1YePPeUa0N9n
	TE4KAMRpj1Zsc7J9MS8gkKkEIXtVWMJ0osxIRPC6gG5UDqLOE4iZO3oy7SWam7fQ1iTs5dIYx0N
	Nz39nXY7e1x5D0kVz7VTj6TsqbaZ027iXhJ2SXQ1HDyYK1/rJlmgadxodbINYdCgD2BgaWfZC39
	NC3VTxd6yE4v51WyTT52SgE1uAY7+j/iQ1YSCgBUlA56Jyvq4XbDQN5sM7GkZXAhmjbUcoJQgiu
	ormqgb0/cPDihtRVPSir2FmeC/8fQIWdTjqaZBBhvYyUvk9diConZywoipSpx4sihiJu744CpBP
	lQiUXnWtetDpaA7qIXxuzOYE6rr/dzlTL6lJZVyvxDXoiS5R3pTRzyyVPJfzyJrvYGVdEnQ1pzc
	tcTR8fqgsUxhNllcO677Qwv5HfKRSfkGkBdgv8xadO7HSS0pxf9GHbwfA5ui9yEjcPCczbrjH+B
	oUv8T8GTcVgDhk6XK9k4M1L/CcGZWk0T5fS1yxX9qdqbMAPewcvOq6UhDZcKqi5CW78VHKxPDnr
	iRsLNhiesLyFw==
X-Received: by 2002:a05:600c:34d6:b0:4a8:f2ad:a9e5 with SMTP id 5b1f17b1804b1-4bb559f609cmr135894335e9.3.1794723087765;
        Sat, 14 Nov 2026 22:11:27 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5ba25b50sm139331075e9.14.2026.11.14.22.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 22:11:27 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	sboyd@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 5/8] dt-bindings: display: allwinner: Add DE33 planes
Date: Sun, 15 Nov 2026 07:10:59 +0100
Message-ID: <20261115061102.229680-6-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115061102.229680-1-jernej.skrabec@gmail.com>
References: <20261115061102.229680-1-jernej.skrabec@gmail.com>
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

Allwinner Display Engine 3.3 contains planes, which are shared resources
between all mixers present in SoC. They can be assigned to specific
mixer by using registers which reside in display clocks MMIO.

Add a binding for them.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../allwinner,sun50i-h616-de33-planes.yaml    | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml b/Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml
new file mode 100644
index 000000000000..0a07cb8a5f79
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/allwinner,sun50i-h616-de33-planes.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner H616 Display Engine 3.3 planes
+
+maintainers:
+  - Jernej Skrabec <jernej.skrabec@gmail.com>
+
+description:
+  Display Engine 3.3 planes are independent of mixers, contrary to
+  previous generations of Display Engine. Planes can be assigned to
+  mixers independently and even dynamically during runtime.
+
+properties:
+  compatible:
+    enum:
+      - allwinner,sun50i-h616-de33-planes
+
+  reg:
+    maxItems: 1
+
+  allwinner,plane-mapping:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle of the device responsible for assigning (mapping) planes
+      between mixers.
+
+required:
+  - compatible
+  - reg
+  - allwinner,plane-mapping
+
+additionalProperties: false
+
+examples:
+  - |
+    planes: planes@100000 {
+        compatible = "allwinner,sun50i-h616-de33-planes";
+        reg = <0x100000 0x180000>;
+        allwinner,plane-mapping = <&display_clocks>;
+    };
+
+...
-- 
2.43.0

