Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=138.232.1.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792956324;
	b=ua5ff6xeT+V11yJ0tPipDR30Wom/AAalpQpoP0StQoihnczk+tY+7ViNRDmkl7CMw5/y
	 7ZiJyfL6KoqxgUVz/HBU32Z879iZrcKlI7+dMiHmoF7eCkFyn29aDUqFQOFigWh9kZSwO
	 5nXE+xJMMYXpkPoaQ97gvX71H7Eg/AGtJ52LnzJ7UWxJUaUAAkTHI1LNeahoGoAaeGyJT
	 X0IIiG/6nC1QFz8NV2JetrzA7SyErIcN0mZVlCHA+/xGOVaGSn+cikBO0LWqgpS8tdxAl
	 scBrqfkbYVuGaZKCOY9MHtlgmmHhNaQNCOLsaVkgYByEUdvTLP0vJjCeK6hE7mUKEgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792956324;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Scanned-By;
	bh=rx0kNluFVfEI8wtH3p88g/x3YwvrLtdIgkt5bcVoCpk=;
	b=qc2m9DaqyJdvy7YNwcr/afhgW4EAf6RRF36xerqbswUZBm4TjaTPyBh9wSmCvARwiwf1
	 j0Q4GPieE2W0/EcUx1ppOoq/m0SJJLQ1R1NL6pHMqcJtzjT7cwRbkWbBbf0xQ1hLLERS1
	 yEZN7Q+4HcD5LvRfOB2FWQzT80JlY6LTYOUENIyN6n4wlgcDfbTFS7x7NO8qbzgA1+q0T
	 NRof2YfVVYoL5R31kG+eV3CCs2CM7OWzXNw2CUyhXTjN93gTnagXsnqcHhyFoMZZeLjHz
	 jvVzypPnpQpGhkijaoNskg7orq500HOVg9SfjyobaO1yztjXjgqpSgc9O23zDniUs2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=student.uibk.ac.at;
	spf=pass smtp.mailfrom=student.uibk.ac.at;
	dkim=pass header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=Xw7DbgBO;
	arc=none smtp.remote-ip=138.232.1.140
Received: from smtp.uibk.ac.at (smtp.uibk.ac.at [138.232.1.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830D360A2605;
	Sun, 25 Oct 2026 19:25:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 830D360A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=Xw7DbgBO
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJP8Ek519288
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:25:14 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJP8Ek519288
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956315;
	bh=rx0kNluFVfEI8wtH3p88g/x3YwvrLtdIgkt5bcVoCpk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Xw7DbgBOUVv0qqVCxHCqd+h4Pnyqz831zwVNnomQb3Xl5ZDa5U19lEAurKLVBaVoX
	 +wknyh9wqyAdFwNtvJRmBmj4H9hTtcVFXb2bnAi7f4Sks64OcvjZP55sFuhc4MOD0S
	 8FVHGXOQ25UGKqhcMKXiEfy5H3t80mlV74soKTNM=
From: christian.koever-draxl@student.uibk.ac.at
To: zhentao.guo@amlogic.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 02/11] dt-bindings: media: amlogic,s4-vdec: describe both decoder cores
Date: Sun, 25 Oct 2026 20:24:58 +0100
Message-ID: <20261025192507.210058-3-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261025192507.210058-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261025192507.210058-1-christian.koever-draxl@student.uibk.ac.at>
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

The S4 video decoder has two cores: VDEC for H.264, MPEG-1/2 and MJPEG,
and the HEVC core for HEVC, VP9 and AV1. Update the description and
name the individual reg, interrupt, clock and power-domain entries.

Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
 .../bindings/media/amlogic,s4-vdec.yaml       | 24 ++++++++++++++-----
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml b/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml
index e3c2ab4000aa..6c98d7013029 100644
--- a/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml
+++ b/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml
@@ -11,15 +11,19 @@ maintainers:
   - Zhentao Guo <zhentao.guo@amlogic.com>
 
 description:
-  The Video Decoder Accelerator present on Amlogic SOCs.
-  It supports stateless h264 decoding.
+  The video decoder (DOS block) of the Amlogic S4 family. It has two cores,
+  VDEC for H.264, MPEG-1/2, MPEG-4 Part 2 and MJPEG, and the HEVC core for
+  HEVC, VP9 and AV1. Both run microcode that the secure world loads, and
+  are exposed as a stateless V4L2 decoder.
 
 properties:
   compatible:
     const: amlogic,s4-vdec
 
   reg:
-    maxItems: 2
+    items:
+      - description: DOS register block, both decoder cores
+      - description: DMC request control, gates the cores' memory requests
 
   reg-names:
     items:
@@ -27,10 +31,16 @@ properties:
       - const: dmc
 
   interrupts:
-    maxItems: 3
+    items:
+      - description: HEVC core
+      - description: VDEC core
+      - description: third DOS mailbox, not used by the decoder
 
   clocks:
-    maxItems: 3
+    items:
+      - description: DOS bus clock
+      - description: VDEC core clock
+      - description: HEVC core clock
 
   clock-names:
     items:
@@ -39,7 +49,9 @@ properties:
       - const: hevcf
 
   power-domains:
-    maxItems: 2
+    items:
+      - description: VDEC core
+      - description: HEVC core
 
   power-domain-names:
     items:
-- 
2.56.0

