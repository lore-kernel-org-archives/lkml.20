Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=138.232.1.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792956196;
	b=NAnLbChKLUZ2CFkJEMMSJ+EuJajxL5Xeg+gIjxod1Za5GsyIo9ZuYinHOM8lPT4vD5vd
	 5Gp8/6vfWXHd6vwvwbErJBf+e9fKJk7MXrUl/cyA7sbVojJ5tuArIU2RhYmIYyN2i6UHz
	 paYIU7kOha9DOdA+X/a8kynF9vn+F34Yr68C5a8YQSU+bfmPxhzooShQfOkCf2EtZbLlH
	 ak7ZrS5f7Ofbi4awGyn2hF/tWdrEtqvoG0y5zbY4+SPVamrql1TlJcTi4PR7XVryCKEUZ
	 Al7jPUhfeXFTSgfboxA+Wo1+64qaRfLXQJLSmn6ZCiZdzs5NHtYBh5wa8gUoa3G2jfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792956196;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Spam-Score:X-Scanned-By;
	bh=OePOO/AairIE6VYNQHXufMPh7i0CvJP15rs8HYGLpJo=;
	b=Vd3Md7dqIkh0OrX6z1qRXJqn2M712fpdV806EDlDKG7+xofLPcwsYe42NriBcVoenMOi
	 chgqx7LP2hkCTsVnTdjmqCAguYtRbGmuLOZ+yd2l7A78KqPu679nzv5kVMIKOI2gkYf01
	 f6fd+9vtaQn8jdWMMUbnsnBI3Xut9u308JLCCILPQ+8iWvCNHqj6md5U5MdVKMVGajjvR
	 grQEJ4I5dElJW6tFoAmrwje2zWArCnvxdMNFolgQuRAnQhMAA+8ZEjoJf3ZrxP6E2lCm6
	 mloGBXvjZkvTFop6zQcaqN+3FZtmk9RlfvrRrhDxMwOs3hlrc8yYp6TSY/uJflAdYIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=student.uibk.ac.at;
	spf=pass smtp.mailfrom=student.uibk.ac.at;
	dkim=pass header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=Qv0RepYa;
	arc=none smtp.remote-ip=138.232.1.140
Received: from smtp.uibk.ac.at (smtp.uibk.ac.at [138.232.1.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F98606A32E;
	Sun, 25 Oct 2026 19:23:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96F98606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=Qv0RepYa
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJN4g8517646
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:23:06 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJN4g8517646
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956187;
	bh=OePOO/AairIE6VYNQHXufMPh7i0CvJP15rs8HYGLpJo=;
	h=From:To:Cc:Subject:Date;
	b=Qv0RepYagJAYvsdZs6Q1nFPq8slv2305eQ7/o24xSrfYbAMaeNb+xkmJ84kpYhjtx
	 ntJh1Tw3FypJGfTgyDhlD6PGM3+UjjmIljwMduwTNMXp9z9LrH3CrPc8/hSOd2Rf1T
	 uDc/6965zP/WvoFcAFQ2sPMAoSlRoWh7VdgZ9VEs=
From: christian.koever-draxl@student.uibk.ac.at
To: neil.armstrong@linaro.org, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH] dt-bindings: media: amlogic,axg-ge2d: add S4 support
Date: Sun, 25 Oct 2026 20:23:02 +0100
Message-ID: <20261025192302.209354-1-christian.koever-draxl@student.uibk.ac.at>
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

The S4 GE2D is compatible with the AXG one, but sits in a power domain
of its own. Add an S4 compatible with the AXG one as fallback, and
allow a power domain.

Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
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

 .../devicetree/bindings/media/amlogic,axg-ge2d.yaml    | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/amlogic,axg-ge2d.yaml b/Documentation/devicetree/bindings/media/amlogic,axg-ge2d.yaml
index f23fa6d06ad0..22decb67879d 100644
--- a/Documentation/devicetree/bindings/media/amlogic,axg-ge2d.yaml
+++ b/Documentation/devicetree/bindings/media/amlogic,axg-ge2d.yaml
@@ -12,8 +12,11 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - amlogic,axg-ge2d
+    oneOf:
+      - const: amlogic,axg-ge2d
+      - items:
+          - const: amlogic,s4-ge2d
+          - const: amlogic,axg-ge2d
 
   interrupts:
     minItems: 1
@@ -27,6 +30,9 @@ properties:
   clocks:
     minItems: 1
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg

base-commit: 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614
-- 
2.56.0

