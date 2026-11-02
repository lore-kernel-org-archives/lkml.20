Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793662997;
	b=WSF4QIuye4F89UabOXOmrtMojvyeaY1VcVG3dj9UbLAWYHOJ2ilKnCiKN9vMtNwO0QJe
	 rPxQV6zZrm2Z2vJavVBffIvbb4Y9TBGdz3mgJ45aWSFQtBpaq3ClOBUfM/lLOdck/Dffh
	 iZT3/kxhbln1B9zvSbbD5SU15vT+rXbU4OCakXmRdRrLqtRB83NCbPcUrJOHZsn5A1LM2
	 R1fmtYFE3FEyI+/Dp3QHsX8E64YwUPqjd+9NBHykieLI8zYOpmN/LnWCMWfOuRE1iKbGH
	 NUqzLdnJWujGSfOFKeOyahjuopFCjWsGlIvrFGIaRJ/SUpx2PLN9PCrO4y9nR6nelFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793662997;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=RCDzNKPwpp/Q/HkSclv5Zusf499nja7ZNvT3ZXN5ATk=;
	b=x+krBXzbGSlOqpHEZKSFaGH+FzG6kM5ezSYLK4OA60sd68pFi9VV13n/6j5BJMiLuF16
	 t2XLb9+HR7d2OThLka3tUekIR0Zk+DhWAuDWT7wRKB5q4mVii1RiC0iwclOY9wCv76nxr
	 pBh8bNtwD9a26A1du3NHExf+7fQFhgd3muQ+xFTWXdnyvWaOavkdqLDWzlihNyVC8Va1R
	 x8XikibdkYyw9rFBDN6whCmw5EKF+LRUDjM6c5j9x7CRHmcH18grQ8kiYcIS5uAwL4+nM
	 1Lza2wpzm/3eF1SKlWcNZ69jK7mETMo84xZXrOgISxfzfh13d1Q02qXBNzES0iMeqQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=f6V6RDuF;
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7374E606A33C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 23:43:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7374E606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=f6V6RDuF
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1aa0fb7f157so5528651c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 15:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793662996; x=1794267796; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RCDzNKPwpp/Q/HkSclv5Zusf499nja7ZNvT3ZXN5ATk=;
        b=f6V6RDuFAv+WlspbK0jUKd9ykn98XIEc5qKjAYKp5AELMfxzAXdvJuC1eaeC7ODgiW
         J+CIPIE/T7NUTZPdC68wG1YT/XGLkJ6EVw5SgV3yy0lNf8SWwUWDTJ0VzEwQN0v5DOAQ
         MaVzAXe7L1dRYfv7JYt09wG2qcxB0CJM8dWOJqe8TpNTMReMbgqBPM/2sXrWYmmiFYSF
         DoLrOT4gRSVnPcCpufrnXITNDBEwDD6WepjE5VQAKA4vr31bXt8QaMOnoRNcnq0RJVB8
         zu9Hd48YjaEztGdG2OAbqpjKC5wj9nnkOIG0S/cZB+03EWgATet3kh2lzJhCrdew39mj
         2DIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793662996; x=1794267796;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RCDzNKPwpp/Q/HkSclv5Zusf499nja7ZNvT3ZXN5ATk=;
        b=t8tsdcEYI4UHP3jlc8MHa6BE9I45p6FPsg51285GCx7931u4cP1EkGuj7/Ev/JHlTe
         YnnyqzziBkVrKxI7Gcd6pOzUiCPHifx2Ode50ZKXah19sOoFXyBRyzSf5YIhcyo0mOh7
         EceQFES6jz/n46d3kB+zN9M6uxzbEf0vNP8vsw8P7L5XCv/o1/epFe83I5xtfSHYYrdM
         FVUS00jOn+OpQW1gALzn0nsHP7LlgVheE2IRYhURLtNdw2O+KW9l/8kfFYcAJvIPGlaY
         QnvqfEgaJpXaW+MPamC9wkkOxQT8VwVuxtOo4ToJQvf+ZAOUSPz/Jb5iG+2DFrXRC6xd
         72jQ==
X-Forwarded-Encrypted: i=1; AKwUvBz3hWEMarKgj7Qt/apVRJoMH0+i4uEYEDrU/kOquDq5lH1MDdVsaDti+GUC2PGDg4F8Tjsq0jcvDL3Rtq4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXp8Aw6xdgFwflkCbWitvC4RpBZUyeQbRfbKMGb9y2CFBmMZJ9
	qCUjCPnRSjFpOgan6B/aVVRDsCBH9SvGDS3UEoL+SXxHt3Ll/l4fSb+BplLyJHm8vFGyWwtW4Iz
	u5sTupvCKiQ==
X-Received: from dlep8-n1.prod.google.com ([2002:a05:701b:4588:10b0:168:3bc7:9e8])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4213:10b0:1a4:fac9:aeee
 with SMTP id a92af1059eb24-1ac56d95c0amr16914327c88.4.1793662996134; Mon, 02
 Nov 2026 15:43:16 -0800 (PST)
Date: Mon,  2 Nov 2026 15:42:59 -0800
In-Reply-To: <20261102234301.2242242-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261102234301.2242242-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261102234301.2242242-2-irogers@google.com>
Subject: [PATCH v15 1/3] dt-bindings: perf: Add Broadcom Raspberry Pi AXI PMU definition
From: Ian Rogers <irogers@google.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Dom Cobley <popcornmix@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	"=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=" <u.kleine-koenig@baylibre.com>, Stefan Wahren <wahrenst@gmx.net>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	bcm-kernel-feedback-list@broadcom.com, linux-perf-users@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Add device tree bindings for the Broadcom Raspberry Pi AXI PMU block
found on BCM2835, BCM2711, and BCM2712 SoCs.

Depending on the SoC and security configuration, these PMUs support
either direct MMIO access for the System monitor or routing via the
Raspberry Pi firmware mailbox IPC for the VideoCore VPU monitor.

Co-developed-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 .../bindings/perf/brcm,bcm2835-axiperf.yaml   | 50 +++++++++++++++++++
 MAINTAINERS                                   |  7 +++
 2 files changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml

diff --git a/Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml b/Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml
new file mode 100644
index 000000000000..08d8c7c7e476
--- /dev/null
+++ b/Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/perf/brcm,bcm2835-axiperf.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM2835/2711/2712 AXI Performance Monitor
+
+maintainers:
+  - Ian Rogers <irogers@google.com>
+
+description: |
+  The Broadcom BCM2835 series (including BCM2711 and BCM2712) features hardware
+  performance monitors on the AXI bus for evaluating memory bandwidth and
+  system traffic. Two monitor register blocks are present: the primary monitor
+  evaluates the System fabric, while the secondary monitor evaluates the
+  VideoCore VPU fabric. This block is distinct from the BCM5301X AXI Trace
+  Module.
+
+properties:
+  compatible:
+    enum:
+      - brcm,bcm2711-axiperf
+      - brcm,bcm2712-axiperf
+      - brcm,bcm2835-axiperf
+
+  reg:
+    items:
+      - description: System monitor registers
+      - description: VPU monitor registers
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    pmu@7e009800 {
+        compatible = "brcm,bcm2835-axiperf";
+        reg = <0x7e009800 0x100>,
+              <0x7ee08000 0x100>;
+    };
+  - |
+    pmu@7c012800 {
+        compatible = "brcm,bcm2712-axiperf";
+        reg = <0x7c012800 0x100>,
+              <0x7ee00000 0x100>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..b8a3cb005c91 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5338,6 +5338,13 @@ N:	bcm113*
 N:	bcm216*
 N:	kona
 
+BROADCOM BCM2835 AXI PMU DRIVER
+M:	Ian Rogers <irogers@google.com>
+L:	linux-perf-users@vger.kernel.org
+L:	linux-rpi-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/perf/brcm,bcm2835-axiperf.yaml
+
 BROADCOM BCM2835 CAMERA DRIVERS
 M:	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
 L:	linux-media@vger.kernel.org
-- 
2.56.0.385.gac671c819a-goog

