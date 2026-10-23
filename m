Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792756622;
	b=zs/AGxFd+CZUt3xg1raGTfhraxXwB1mK7UCuXQsEcnO4f6Nxflw9xapPYDsucI6KQqZ1
	 3+cIqx16LfNVzZ44IjbXAusHHcWhaNmT0F3+pHkP6gdFag1YZz56s4rCgmg0jetF5B49E
	 ZSgIMf8IY69CCBfXuldZuhYp28ynhGQ6YP6TBvJqsy7WCTbjeoFCA6ZhUkYm3b1ETQvFB
	 7Piqzw76Vkqn3MWUKO5TATttLOZSubrDYsSq0NJUzCYzXn2GiuKo6R5MbiDqMLaHYdPUD
	 K8SurwfSWnwIBi7ZJ81B3+c1RvXqQD3mS8OkJHHvJogRyM7Pvz0yVNIUGUnsTL6cEyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792756622;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QYSnAwHR1vrNUFiRcbl+fsM6n+M9SQnCfusXazqIDBw=;
	b=BLkQHLLRBSdQlXtv6xJewdhKG+bSjQ9bg85HQO8VxcSNXekVUDAevXySKC6Ey5NCSV1h
	 GQ9rAhrP5i+BB25w501kRNTszljp/FopWKNSd94Ryced/u9w7bL0s+gWZ/68TcHNj8fbT
	 53x3BhXwLm8UWDfmGWMAdRQDYwDiLBjhDgFLXppL5nZPUYk4x/WHOBhWbtgV+7/DpNfDi
	 rlg6qk018M7X2zdTUkS8P4uCm3fzsCd8CkjoczK8JIWrO9mXC7qnuhVzy6e2r4MBkWwqm
	 xz08blRLU5XBur8ArgXqdUQFVzUARRGvLUZzZ4bPJDhr7HQyjTled/nDAOVP7xxBo1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RHLt852c;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF951606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:57:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF951606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RHLt852c
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48bbb06e746so419288f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 04:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792756620; x=1793361420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QYSnAwHR1vrNUFiRcbl+fsM6n+M9SQnCfusXazqIDBw=;
        b=RHLt852c7cE2Fin96m5wr4aGMaiMXg9OKRJFP1JXPyByb8y/cnhAazYnpy73aWE6wl
         60QX8giD+dAmg/j0mdI8IzmhaIfoUH2DLP4qcijW4GMLlvvMDIR+R8aKd7rG4j9Yae7Y
         t9kJ2lh7ZwG4ln43zbo074uum0MNPnMHro0q9rPPXYcSauTpBhZh1bP3EcVgxtTe6l3p
         45+ZgytZyVoYqzcoq+O5/VU15CTlYNwkE+FG1fPcVdNP0GmRMfNl1XhkcM6FsWHBfj/b
         fuJyCL2Wk1ag7zZ+lrweQlkFxbdE/vxgE7rLvxYYEMIbU8743sOk15k+4SOAQwq/HfRZ
         t3TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792756620; x=1793361420;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QYSnAwHR1vrNUFiRcbl+fsM6n+M9SQnCfusXazqIDBw=;
        b=p9rWM/e0cOG6mAMe5Ek+uvx33uExrGVPBLYGWzGzv1S0SJQvTV7mv0d+Lq4NDbELiI
         PCeizEPumimV91dwNMiX1JgNnxZ+PhGKpOhH4PIW5knpm2n9sjpQVnMrCm9e+Tuyn2vz
         fmS1xllTk5LIbXocapR+/UmiRuHG84cxHTi7ogYY/JZ8OTeSY4LVMdK8+44IZZUi4EZx
         8nTq38BzRXyeC4TUNNYzzEbZ9TJzRXSLJ5a57/3CMKEkJNv3Rq5WCRUkgw3J4J7FZbBP
         48LB/yHEJoi8JwdDgv4lWFWoPyJevEyyarDec2PWjw9OL99hPRO77Z3+R+yPRc13FuBn
         ogJA==
X-Forwarded-Encrypted: i=1; AKwUvBzfZUBY6qbNjg1pkUM6kfR4/jIHpdwvgMqOE750ZZmZNvKa3Zs1TjtLeFf4sdxgcp1mKehJPxJN6iUcofU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2FU2MKHuZMaoUHbsgpuMF2oc7Ph6DXGhaVPRNRyCiHLXp9pHN
	3k3eksGsfSRcn9p0o81o7f+JsVoUNtQ2gj/4QTHYJ6Lkw6nDfjH8MCkY
X-Gm-Gg: AYBFou1MdEDRuYY91Csu8rOuSIcSD/YZARAfvukdSOp9XfsbmjrIHVPMMsYtfiW6pvm
	rX+G1QIiy5N27u0vFTsF9fhNo+t282kzz86JsDjpwrkJV7PknAxDBv6kYDKrpH1zYdRHauPY/59
	hL/gG6I+ZD7inu3q0h3MeinVNE+tYB07e22a7BhpM5IhnYyzQTWq1bCB8xf7L5Xyb0og6ngMjCO
	5hspwvDvDtCxr3FKYcLKPY1IoYRkb+OZ83uc426GhTRNafG5qJqU9QOEPQi5JtDeN4KaVGje69n
	oLD06rbbN4k/Im7r0Bj8X83Wg7mdGmm65DNJ8CkanmHzZ5T/veno91pk41CBzr6Qdlx2TuHNthY
	65POsFE0Ld7fbsP1sKplEyFtrhbfDSe4RVPLi0d6L9WdkKyx2PLRc8rjR8GbfTNQq3fA9hHi8gG
	i1+EmTJPA+u65s7i85d6+/KgRvzI9JKWxMbr3NYwVTo1i6bSDq3ToLkhkKwHq1jZ/vYTT93N4U1
	l4a4eGrRAmQumwNYniOD3mIkgkP+6VRV/HDyd2AkfkbrDmqxx7hzMiHRmbJh2jURvifVRVFFhcG
	SU+ceXVJdzpW5FI1fI+BvDLBI32OtBDurXdEmCZKzztNChybf+R2sUh2sODI
X-Received: by 2002:a5d:5d86:0:b0:48d:f851:ee5f with SMTP id ffacd0b85a97d-48e385ab429mr3050979f8f.24.1792756619921;
        Fri, 23 Oct 2026 04:56:59 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e380310b3sm5076321f8f.22.2026.10.23.04.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 04:56:59 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 1/2] dt-bindings: gpio: fairchild,74hc595: add support for nxp,74lv164
Date: Fri, 23 Oct 2026 13:56:48 +0200
Message-ID: <20261023115652.700765-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Document support for nxp,74lv164 as a variant of the currently supported
8-bit shift register with the only difference of not having an Output
Enable pin and a simulated Chip Select pin.

These basic 8-bit shift register chips directly change the outputs as bits
are shifted in. Particularly used to handle multiple LED for basic state
feedback.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/gpio/fairchild,74hc595.yaml       | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml b/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
index 451538df63f7..0d5596af0ced 100644
--- a/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
+++ b/Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml
@@ -7,9 +7,9 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Generic 8-bit shift register
 
 description: |
-  NOTE: These chips nominally don't have a chip select pin. They do however
-  have a rising-edge triggered latch clock (or storage register clock) pin,
-  which behaves like an active-low chip select.
+  NOTE: These chips nominally don't have a chip select pin. 59x chip family
+  do however have a rising-edge triggered latch clock (or storage register
+  clock) pin, which behaves like an active-low chip select.
 
   After the bits are shifted into the shift register, CS# is driven high, which
   the 74HC595 sees as a rising edge on the latch clock that results in a
@@ -22,6 +22,9 @@ description: |
                  ___                     ________
   chip select#      |___________________|
 
+  Other chip family (namely 164) directly change the outputs as bits are shifted
+  in.
+
 maintainers:
   - Maxime Ripard <mripard@kernel.org>
 
@@ -29,6 +32,7 @@ properties:
   compatible:
     enum:
       - fairchild,74hc595
+      - nxp,74lv164
       - nxp,74lvc594
 
   reg:
@@ -76,6 +80,14 @@ required:
 
 allOf:
   - $ref: /schemas/spi/spi-peripheral-props.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nxp,74lv164
+    then:
+      properties:
+        enable-gpios: false
 
 unevaluatedProperties: false
 
-- 
2.55.0

