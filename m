Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=138.232.1.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793960389;
	b=C6MmJUloJu4RhG5wp8zDLmmwqPQCs1rd2SLItOgrgNIofiBKs5cY2N8/VCUde9ugi4py
	 nAqOq8kjukqgoyZ1ym6JPa/J9SaXPMltruFXyKurNdxQJmBAkGvgJqY6m5N7xrqFTOv0X
	 Kc57hcQOrOKiaskzuxYhjPVCNezGA1Cg3S7Mu+aFBPTGJhrYsHXODRLRV6rFYhG/uHETF
	 pujkLc1mWfF5LurM5/c1GtT+nnBPvqJeMtz1U7zJ2TZbzm+ZjXgRQYm9sc/qsoSxVx9NV
	 LMQTitshEgh+RB8k8dqQrjWP3xlDF2KVYzB8Oqv4y6Ai9xJMSeYNxZAUsXykk1oRGuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793960389;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Spam-Score:X-Scanned-By;
	bh=B4LJ/E2CNayxcnde10w3NEe0+jzbRDwBsFbsVBG7Tl0=;
	b=itmYEHTT8kb3wyLgGz1DqRrV01ZRaM9jRGj6FlHUHLupLbFMvU1dhT6Ca5IPV2R4L7l7
	 NRqeGHdaFyNTjEg0B6CY12bKdLzC2GW3BCa8zquy6YbdoI/C1y0H/dXgvYta8hztqAUB2
	 0OkH31K5IkNzjEE5hvxmRdS0kYmsZzBH1dkfkLGMoEsc+X/gBsHD/q/a9sgUmH9N3789X
	 sjUdmyIsAcjgT/RnrLpfTviP1SaugXFptuxJ/38hlmyRKGg5MZvUSap95OCigo7n1M07y
	 YogpPO1nMafZMwUg//OVgqfKiNT2HwZPA3GB1M6fEsiQRi7P8XFhzBAQK0wo9KQBBYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=student.uibk.ac.at;
	spf=pass smtp.mailfrom=student.uibk.ac.at;
	dkim=pass header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b="L/WdqTbN";
	arc=none smtp.remote-ip=138.232.1.140
Received: from smtp.uibk.ac.at (smtp.uibk.ac.at [138.232.1.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0F2606D801;
	Fri,  6 Nov 2026 10:19:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE0F2606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=L/WdqTbN
Received: from surface-pro-5 (ydWLT-U1-95-184.uibk.ac.at [172.25.95.184])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 6A6AJaEC1864224
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 6 Nov 2026 11:19:38 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 6A6AJaEC1864224
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1793960379;
	bh=B4LJ/E2CNayxcnde10w3NEe0+jzbRDwBsFbsVBG7Tl0=;
	h=From:To:Cc:Subject:Date;
	b=L/WdqTbNaikvEwen+wMG8wZAlMDjoSPap+nH+YLn4wGByY+R7zdrU9ymS10kfAL1F
	 +nFY7WK0XiEMjevUvy9Y1Bdoicm57cVjbesq0CL+NYcjKTqlErLPAq2CPz+6n0zJ3y
	 9lHbCApdogmnZuSnZ0dY3HT6ilOj1Qn42cN/8B1k=
From: christian.koever-draxl@student.uibk.ac.at
To: neil.armstrong@linaro.org, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH v2] dt-bindings: media: amlogic,axg-ge2d: add S4 support
Date: Fri,  6 Nov 2026 11:19:35 +0100
Message-ID: <20261106101935.46816-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: () -14.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at

From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>

Add a compatible for the S4 GE2D and allow a power domain, which the S4
block sits in.

The AXG GE2D is a special version that does not use the canvas to read
and write buffers, so the S4 one is not strictly compatible with it and
gets no fallback.

Only the S4 block sits in a power domain of its own, so require one
there and disallow it for AXG.

Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
Changes in v2:
- Separate compatible, no amlogic,axg-ge2d fallback: the AXG GE2D does
  not use the canvas, so the two are not compatible (Neil).
- power-domains is required for amlogic,s4-ge2d and not allowed for
  AXG, which has none (Krzysztof).
- Link to v1: https://lore.kernel.org/r/20261025192302.209354-1-christian.koever-draxl@student.uibk.ac.at

Tool use (Documentation/process/generated-content.rst):
This work was done with the help of an AI coding assistant, Claude
(Anthropic), used through Claude Code over many sessions. It did a large
part of the hands-on work: it read the vendor kernel and the firmware
interfaces, probed registers on the board, drafted the code and the
changelogs, and ran the builds, checkpatch, dt_binding_check and the
tests on the hardware. I directed the work, reviewed every change and
the final patches, and take responsibility for them. There is no single
prompt to quote; the sessions were of the form "find out why X fails on
this board, fix it, test it on the box".

Tested on an Amediatech X98Q TV box (Amlogic S905W2, S4 family, 2 GiB),
vendor U-Boot and BL31/OP-TEE, Linux 7.3 plus this work.

 .../bindings/media/amlogic,axg-ge2d.yaml        | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/amlogic,axg-ge2d.yaml b/Documentation/devicetree/bindings/media/amlogic,axg-ge2d.yaml
index f23fa6d06ad0..f3fe99f1fc95 100644
--- a/Documentation/devicetree/bindings/media/amlogic,axg-ge2d.yaml
+++ b/Documentation/devicetree/bindings/media/amlogic,axg-ge2d.yaml
@@ -14,6 +14,7 @@ properties:
   compatible:
     enum:
       - amlogic,axg-ge2d
+      - amlogic,s4-ge2d
 
   interrupts:
     minItems: 1
@@ -27,6 +28,9 @@ properties:
   clocks:
     minItems: 1
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -34,6 +38,19 @@ required:
   - clocks
   - resets
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: amlogic,s4-ge2d
+    then:
+      required:
+        - power-domains
+    else:
+      properties:
+        power-domains: false
+
 additionalProperties: false
 
 examples:

base-commit: 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614
-- 
2.56.0

