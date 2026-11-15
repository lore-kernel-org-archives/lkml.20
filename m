Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794723093;
	b=d4k9boV+XJN0GJX99qZiGfP21d8yEs1Iqg/MuaTmZwEoJXAJEHFZCjC9d3O4FNm0EKbN
	 4k+RmhTFC2o7eSENL0QF+0t3FfIr7yVlqgjDFaEYx+RjTGqK6vCPFxCmq7hwbHslFC/FD
	 e4Aw7VqRuD+3O59f5wcyNC9cJ3sF9oDMlLPcIdlA+/AT4S4nvEhjOWz9gApK8WVvQPsyJ
	 zZ0LOmM2ovrlOhGgAr/hJ6wFlZ416+tCmOXtGkde1/h+WzxZRKfrO9ab/YdDszKp7YGRd
	 jLs6ImoYMrjZJDOT/9sEopl4qCFPIJHGzgAWN97n05jJbIX6mPDpZSikBf4WTdsiJxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794723093;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=togVOXp+Ydg/br8KT/x6g+AKENI3qvKeU0FFIYM4R/o=;
	b=gQx/1Q+YxQLcNudHjZhDfvqEYtGHPrWFffof6cPfZ5yP2AK3i+FZw5nEK1XyxcVEuO6g
	 5dDsBmNvRveAEbdeDl/MrhXDBOmlB2iJpsMSaWbY4/ewZAJ1bJ52KbrabqfrBb1IhAZ8a
	 chNZrzVHK/5k/40jiMEFFn5LHQnZZr+qZXsfby/klnGcaEtJqFkWtDTq2sSHVhPRFlRvp
	 sjAbrfTAFxMJCNVEmbtX5oBTQWym/AALWgq69FRplYLsw1B9YM89lpRLjU5+x4VcFpJlH
	 GLr7iZwyJSvlb/1+YxsWmia4n7Su9n50gQin6WaC6Z+79K1TywBAwr8TLQ6V4xRyDYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T7iYHYzs;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A78A606A886
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 06:11:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A78A606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T7iYHYzs
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso1233525e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 22:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794723091; x=1795327891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=togVOXp+Ydg/br8KT/x6g+AKENI3qvKeU0FFIYM4R/o=;
        b=T7iYHYzs0SdTLxO9JARbT2EQUlNflol4Z/wBrht2nrkpgxOq7clOnt5yLxVsu3Owtp
         4/k7u8k5Xl5rGNEq3TDWzV1gb4QGtxhtBOW5umALj+0wOxIQBaheYQY6BXtQbnmu2wty
         c9yOApQrD1mZDjAMoFPHMoIjvYf6bNfcHu2hPIRhDG4hCS7jnjiZCM8F7YvK4DgBR1e0
         Dm6MxKM9D6zKfRuyojALC0IRZqjKkh0t9TWuCYbCC2nuQBDGBCO2r15JdrUR48afQ5pF
         HLBNqgsIS4//U8Cl9qf+SHTCG5Z/7J9fcoJRWNdiu4GSyEUTcNsAFDhMxTC8dmA0lQHh
         Z5VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794723091; x=1795327891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=togVOXp+Ydg/br8KT/x6g+AKENI3qvKeU0FFIYM4R/o=;
        b=yuOrHJj2kfOqLJgiREJF9it/BsclidoF4Q4+iBCXV51YDyUjBEs9Ds9qUk1jYELkKP
         eO3dXUZ4LX9e2DvWKtDQDlU2hc+/g90Zr2QJ+ZYdb6eMMfmkWbFZ50VhgfDjncETJ/l2
         NYe9BIvPcSQQ46NX/bB5n6cuO4sEb3RZcICbNS26iDWyUrY6OODmjKGaj2DmSsX1z+LR
         rCMefLYF05l6Nz5HQvf6VZZh84JtBmWswLetnOx0jMj3PY2QE4eDzxlRI9ecEO/TM4kM
         hr5jzlmOz6pLtBwahv/Q0ZkSRLWm9zLaPKo80ozzuWmj7/EmvCgUzQaIvjg0SNFuTnkf
         nENw==
X-Forwarded-Encrypted: i=1; AL+hErGmyu8QXFIe9mTbJOCkYlU8qZoHVexoIrCjDQvqSWkaGZe8iB3doslrc7K78yYSUQ/1qRay7K73jyiWpB4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4FjEV9S0tIr37qdtGbvaRJ5WzdVfp7e+SJVdC0z2bo5wtmPmn
	nLtcG+HdtbMsn1nfxMqlG3Zx60u48e933cAq3qScdmP+SgrRmSyreYhD
X-Gm-Gg: AYBFou2p3MS1LteOg1BSNoS0sSiTUnS5dvFb1FqkCReKhP6TIhb310n9EZuhofj+GYZ
	rlgR0ydgC/2vaiI+M+gvN1dUb3HWW5/SpGVCIVSywJWC436JCraZmRM1LFghlXehcJLDOAgG+Yb
	yWPQF9o8U11nJQfUWsoIvMJMsM6KR3r722LwjOCXcv1zMg+8X+hQd14BZCuYu6lO9X56rOZR6lX
	0R6Y0msfbh2qYlN1VoSr8UCXEoEnP2ED6oR/xH552zAiI9+qOJTKMfa8y/RdWYXluZveY5EHI1Y
	b5v5tFzMyam46Sg1+Gy+noqBisj5gzQUXYD3ndyKRxHdV/QqkQxi0g13abBdofUoD+HlI3Z8nh2
	31oqPxdBLCiNZxs1BOFqtEC7S3moKry/XKqfTDtSWonSPWcRtN7zWC3kCCjGW4BFphrhX0BiM00
	58QAm1slStWVs58MDttAC0h4PL4hMk4UBGjkhape0vZgynZLINnyB5zOEsuC/kOgzR4HvgC+KdT
	KVFZwESLRFiyvRS1R5+BXoQrBncXXFDd0UjJaAL4uT2Ac/Ri7XupEpVP9fOYGdCDPCsu/UYLd1C
	MZqkSDN/Hp2zJg1pZotlzS5PMfcadAdvjqaQ0U8efE/SuLUc6zgWkpQci00quKCs5aLFCJgJF+q
	ao5MgZ20G+KLXqJNiNESKUoKC7DAnprEUJTlOPFy4/oEKJ8WnmwivfzjRWGZJqy6vDPLNXZCY+4
	ABqEvTmaOQySgEDysbDZ4O+OqOKgNLP37w8ccFrR5jz9HEkJC0E9tjGxn45xkkA1HNW9ZmXAoVn
	RDxycJND7sdWw==
X-Received: by 2002:a05:600c:3112:b0:4a2:150f:1607 with SMTP id 5b1f17b1804b1-4bb55a4ebfbmr158351435e9.13.1794723091535;
        Sat, 14 Nov 2026 22:11:31 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5ba25b50sm139331075e9.14.2026.11.14.22.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 22:11:31 -0800 (PST)
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
	linux-clk@vger.kernel.org
Subject: [PATCH v3 7/8] dt-bindings: display: allwinner: Split H616 DE33 layer reg space
Date: Sun, 15 Nov 2026 07:11:01 +0100
Message-ID: <20261115061102.229680-8-jernej.skrabec@gmail.com>
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

As it turns out, current H616 DE33 binding was written based on
incomplete understanding of DE33 design. Namely, planes are shared
resource and not tied to specific mixer, which was the case for previous
generations of Display Engine (DE3 and earlier).

This means that current DE33 binding doesn't properly reflect HW and
using it would mean that second mixer (used for second display output)
can't be supported.

Remove layer register space, which will be represented with additional
node, and replace it with phandle, which will point to that new, shared
node. That way, all mixers can share same layers.

This change is intentionally not backward compatible and the old binding
will not be supported by the driver, for the following reasons:

- It can't describe the hardware. Plane register space is shared
  between all mixers, but the old binding puts it in the mixer node, so
  only one mixer can ever claim it. The second mixer can't be supported
  with the old binding at all. It also has no way to reference plane to
  mixer mapping registers, which live in display clocks register space.

- Supporting it would mean keeping a second, mixer-local plane
  management path in the driver, with hardcoded plane mapping, which
  doesn't match the hardware and which can't be tested, since nothing
  uses it.

- It was never used. Upstream H616 DT has no Display Engine nodes and
  the rest of H616 display pipeline (TCON, HDMI, PHY) is not supported
  upstream yet, so the old binding never produced a working display.
  Vendor BSP kernels use a completely different DT structure and no
  other known DT consumer (U-Boot, *BSD, Zephyr, TF-A, ...) implements
  H616 display support. Only out of tree WIP patches used it and those
  are updated together with the kernel.

The driver will print an error, asking to update the device tree, when
the old binding is detected.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../display/allwinner,sun8i-a83t-de2-mixer.yaml  | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
index cbd18fd83e52..064e4ca7e419 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
@@ -46,6 +46,10 @@ properties:
   resets:
     maxItems: 1
 
+  allwinner,planes:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle of Display Engine 3.3 planes node
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -74,22 +78,22 @@ allOf:
       properties:
         reg:
           description: |
-            Registers for controlling individual layers of the display
-            engine (layers), global control (top), and display blending
-            control (display). Names are from Allwinner BSP kernel.
-          maxItems: 3
+            Registers for display blending control (display) and global
+            control (top). Names are from Allwinner BSP kernel.
+          maxItems: 2
         reg-names:
           items:
-            - const: layers
-            - const: top
             - const: display
+            - const: top
       required:
         - reg-names
+        - allwinner,planes
 
     else:
       properties:
         reg:
           maxItems: 1
+        allwinner,planes: false
 
 required:
   - compatible
-- 
2.43.0

