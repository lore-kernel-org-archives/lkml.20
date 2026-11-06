Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793987768;
	b=Df3uGOCtgQ6eQBZZOxaODBSOo0OaWpAJTSLi2600HavvtoIqD7Ypzi9oJxemFVOUNCzY
	 Ui22mxrkm7+q2GUYcQqn5YrztqCM7gfYespjV+Iak2M/JDOOdiN5wkCfHaDw33jupfGSA
	 mfA/D7FrjFdE8vczwTb3oWUxsnr99t1J38oEXaTVyPoH0sIbTVFpsPZI9Cc7Y1heefkyw
	 u/Yso5QgrHXukqvmZbkKdHCRXT6gANjijhXjSglWPyi3m0+0gVUzqTidb43dQVEZ0p5K7
	 Xtpa0q0b+46k0MzHwbh0AE3gsikJSVajyJVeb4lYEsqR0N1zGrez2RP4tQlAzgGYiWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793987768;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RjB3LwZzxEuGJFQm9nKda7FlL6d4DBHlBEZNuNA4128=;
	b=NreRccdQW8D+xdLBh5awNduJf13CMrLETfCExgcCP6REXErdF+yLouXhRv5jOjpJExsl
	 YVTU4N3jANU+N0iCkhUHq9XtJFmXaZTlfROW1WcTSGtAoFy/wqzAev/KP8pWlMEwXWrFn
	 XKMqw9/TjRBtf4iP/e22tJTyv+MeYl70K1a5mEhfXy7BRQUBypoUbeFShqmDCPL5SLF7D
	 jGn71HGqaof/mzaUOFXeCv9wgMQhWdKlYAA06CtQkO8o2iZQ+cbcqvNvbNqUB5uLwOCtU
	 G7l2GqSqAOP0RWSX2lbK0uy7Uk+rUWojf0kCSifU8ZVFgHyuUdI53/8iPzeNT9b/sYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JJ04Jo98;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD35606A336
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:56:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCD35606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JJ04Jo98
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-492f0a1b685so526916f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793987766; x=1794592566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RjB3LwZzxEuGJFQm9nKda7FlL6d4DBHlBEZNuNA4128=;
        b=JJ04Jo982Z4RDDmlzz+Dje1vhQSA5oqF0L1kZsorXI54ruOpMg4NkVjlSr49EflGuj
         GlR+1KATWJjd+j/Cebv65TWQmQfFY6LyFSqChNdhiitwEAODefziDW5Q9BCVxv/cPend
         AOg0G7VTygcfJzPilB4kJxNDk0+86VXyu//dSGE25pjefslfXz3xTuHClGDSkv1lulG+
         iuDtud1D5yPTikZaIHSyODzc/Dq2uZ/ZWiBnQJN1CnVSZ5dkEcu9Y10LLkhC4PPgI5zj
         XUH8BLHuEyuPS0R2E9X1vhPb5XsLSMpVo+0WF1/xdsPseFoUHvjPl1LmgQrcg2gQM7yS
         +s9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793987766; x=1794592566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RjB3LwZzxEuGJFQm9nKda7FlL6d4DBHlBEZNuNA4128=;
        b=tQmDn0tPms9gHgMTsNKcPQkuTvAJCUVzVgm0mGA4cku6mmqmNWC+BOV9btnOzQHjcA
         bAFYM+SXmKcK3jHtx6jpEDaMvFHQq5MKwViAaMa0SEDbmmTUPTVmYlf8YFIdJ3IyccX7
         xUPEaNUj4a144/H6kJ7/EPS+HVx7nqX90BujQHV8tBKDdbqNSGu7y4UgBq7u3oz3AaDJ
         2kd22utw7m+bP1xsEHi5FwuSwOXmnsq3l2NUkFRcPbUWqgo5T9m35qIyMdz/o7js9pmG
         VASKZEITnsBdV+QfOyuCW5F7xsUtvNMNNKs+IOLsBGA9SHtVLOobnnpd4O7Gwj5ltEkF
         mW6g==
X-Forwarded-Encrypted: i=1; AL+hErEbEi2e7DzhhP59ePtextojhANFJs/dCxQHy+/T1E7/NoTCllPZ8YWXiQtxfWnEGe8+3QoUJLMO37+4Rog=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FXD+E7m0JBLY/jZ38EgBBGks/IwjMrpfiZncrFPa0Ct0I6PzV
	9iKTeSrz/wt6aE/mPNF+3LEXjtVOS/7RLia8mOGP8eEsJYG+flagzCFv
X-Gm-Gg: AYBFou1rbalXXJB+MPwIC4Pyk8EXpNr/lKggBHAhGnd8YkJZ6K9B1TQW2Eq3XSfOena
	f0zPkMAql2+jpUkDOIlCBipIaIvDElFwd4Xpbco5itsBjyVs+NK7g/vhVngyoRrSYb6Yk9ILmHK
	0MLOLJoIksjqp6nWumTZ6nnWPCUBoD9DBSzbLer3lgUWYynZ1JYqIRptc3+5ZuoL2kUDF/VGA7a
	piMi2ra5Uazf4wlrNhHlI0yD8gJiP+VHG4YRp0BdiWxmnl8NMU40Zi5KcAwyXzNVCILKaD/0z73
	mXRbFzgO21awkBFTp1uSN7JivWJugD5hCAYRjCuU2g209v289o4aFYWE8oYmVhTFSuIXS8uImqG
	6NP32s1Bna/3i21ODOjd6R5bvNbfr7hXFLg3CNXkP6wUn7NhygaSRobw6ERJT+O1QSwNRZnXBus
	b6nMuTELNBedodb4+XuzNnytgP9VXWQJ80zfh2GqlKFrbi2omnelISCto3AVxR+Lko03sRxK+xK
	/FgCIgTXRc6EFEIgMMFu+Q5VG+ylseS5bmqJfqzK6TDog+VX0Il7fEcvQjqNjs29uDSlIlNudRY
	+iyoAlHPqei7cGKtwPXbsfcWPC+XdGM=
X-Received: by 2002:a05:6000:144c:b0:490:88e5:92d6 with SMTP id ffacd0b85a97d-49277f881e8mr7918178f8f.49.1793987766143;
        Fri, 06 Nov 2026 09:56:06 -0800 (PST)
Received: from hp-z640.fritz.box ([64.43.161.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d723283dsm4649612f8f.23.2026.11.06.09.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:56:05 -0800 (PST)
From: Owen O'Hehir <oo.hehir@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Hal Feng <hal.feng@starfivetech.com>,
	"ziv.xu" <ziv.xu@starfivetech.com>,
	Conor Dooley <conor@kernel.org>
Subject: [PATCH 1/3] dt-bindings: rtc: Add StarFive JH7110 RTC
Date: Fri,  6 Nov 2026 17:55:58 +0000
Message-ID: <20261106175600.3877614-2-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106175600.3877614-1-oo.hehir@gmail.com>
References: <20261106175600.3877614-1-oo.hehir@gmail.com>
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

Describe the RTC in the always-on domain of the StarFive JH7110 SoC.

Signed-off-by: Owen O'Hehir <oo.hehir@gmail.com>
---
 .../bindings/rtc/starfive,jh7110-rtc.yaml     | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/starfive,jh7110-rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/starfive,jh7110-rtc.yaml b/Documentation/devicetree/bindings/rtc/starfive,jh7110-rtc.yaml
new file mode 100644
index 000000000..95edddea1
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/starfive,jh7110-rtc.yaml
@@ -0,0 +1,85 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/starfive,jh7110-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JH7110 Real Time Clock
+
+maintainers:
+  - Alexandre Belloni <alexandre.belloni@bootlin.com>
+
+description:
+  The RTC in the always-on domain of the StarFive JH7110 SoC. It counts BCD
+  time and date from a 32.768 kHz clock and has an alarm, a frequency offset
+  adjustment and millisecond and one-second pulse outputs.
+
+allOf:
+  - $ref: rtc.yaml#
+
+properties:
+  compatible:
+    const: starfive,jh7110-rtc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: Millisecond pulse
+      - description: One-second pulse
+      - description: Alarm and calibration events
+
+  interrupt-names:
+    items:
+      - const: ms-pulse
+      - const: sec-pulse
+      - const: rtc
+
+  clocks:
+    items:
+      - description: APB bus clock
+      - description: Calibration reference clock
+      - description: 32.768 kHz counter clock
+
+  clock-names:
+    items:
+      - const: apb
+      - const: cal
+      - const: 32k
+
+  resets:
+    items:
+      - description: 32.768 kHz counter domain reset
+      - description: APB bus reset
+      - description: Calibration reset
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - resets
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/starfive,jh7110-crg.h>
+    #include <dt-bindings/reset/starfive,jh7110-crg.h>
+
+    rtc@17040000 {
+        compatible = "starfive,jh7110-rtc";
+        reg = <0x17040000 0x10000>;
+        interrupts = <10>, <11>, <12>;
+        interrupt-names = "ms-pulse", "sec-pulse", "rtc";
+        clocks = <&aoncrg JH7110_AONCLK_RTC_APB>,
+                 <&aoncrg JH7110_AONCLK_RTC_CAL>,
+                 <&aoncrg JH7110_AONCLK_RTC_32K>;
+        clock-names = "apb", "cal", "32k";
+        resets = <&aoncrg JH7110_AONRST_RTC_32K>,
+                 <&aoncrg JH7110_AONRST_RTC_APB>,
+                 <&aoncrg JH7110_AONRST_RTC_CAL>;
+    };
-- 
2.43.0

