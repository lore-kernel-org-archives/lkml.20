Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793142345;
	b=ZhbufBeNkkt9djW+eRhEpNdGR9MezVQjVIz7n0XmszuxOEroEogMEc32mjLCK90PQ/xw
	 4t+0uRMmg5Z/q7XWB7A3ibSW9ctZIMidVpHP07LSr8XsHupAExFY65g1f5DHf2UqRtsWv
	 fYpbXq4mBLFZ1CA0CKL4BBB3sQd2xC/gUzSnXjMyl5hzMXa1GlZkFi6giz7gKWamecJoF
	 V6EIupUeqlKe+IxSw1WORnioDl4if/7VIZPwFLpRJiXsQUFJy+ODDl2Bz7XZlknE5iemy
	 EPCcBs0vfkNaURAgvIH7KkyxOPEjFpQqCoIxfisSjLC0q7n8DS7Sq/rQ7Rq+5ej4SKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793142345;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=pV1f3+gzRgGvdb3V8PW5kPXYcDo6WZ/i+3ryF+G/nqM=;
	b=zf73xqBFoRggww1CMj3I5UjyKAS0wJ0gb3hKedcqXgM+Uz9yW2eNMpUagR/pHRQsA3m9
	 iUKRIsIKujlfEBRWOOdqW9C3iAgd8m5SmVAuLhaDgjDI0KS4klB4ShqjLILLFLlqnKTP9
	 w9baCkujQd4JTstF+s82XsEEamf44dRleQwfppO9YO4owGP3jeFht94M6hXKd3en/74sT
	 G2ZQxtjgM8msM7ZllG/3b6n1ivek86vXFJQmBRqjxySEXa/AAhUjtpe9Ndq/Tee+oHwq8
	 HuZBKs3BTDdLwjH3AXh4eqv6/SpLipN2ZzIXFWJD6nkD1CbR0QUb/5f+b1Zo6wTMvvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fVUjkkI8;
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAA1606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:05:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CAA1606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fVUjkkI8
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-854b6e2e41fso179997a34.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793142343; x=1793747143; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pV1f3+gzRgGvdb3V8PW5kPXYcDo6WZ/i+3ryF+G/nqM=;
        b=fVUjkkI8d46Y/jdU3DK6ZYGqFL6AoqRiovDb8IZIpgtHBgQwVH6J9BVQppupxVv2lh
         bmIt7pWq/DmWflYCqAmkaY12s5n4LmDeJF8G98Plx364dfaVmdUV7WOrXflIPPFE22EM
         b7BZzLcajySyjAxv6yvulaeq1Ka4rjB1nGtZEMCRJ8sB47o2slcv+4PM8c2ycXPlK4Bs
         iMlpI1OrX2sJVV1iJFcO+TIldb1O3oq1J6ceQG7VVYh1whJo3yfALUG4wU5onCnpWMVS
         n6wDRa4O0mRe814BOvca5kP8RTfgOjUkiNXjAYjWuQQqJ3JEsBjCUpHiSd+S2sOfYqss
         UPAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793142343; x=1793747143;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pV1f3+gzRgGvdb3V8PW5kPXYcDo6WZ/i+3ryF+G/nqM=;
        b=qtMHf6A45Fv0epsOwVfJEIey5MUc3j7xko31maPYemTkqmF7MHOtqJoQQ4DY7dneMI
         nbHYWS4iTEXCfsfffDvOy7f4HPlh2uUp5z/CkQLCUtFgG+ulfRZo/alWOszx5q85r+eX
         7kfXi2+P5mhCviRqnHvJI6hui15UADd2YFHlzhRiKCbnm3l1z39cnnaQCJ0gJ+ifEboc
         IZehDNirTDNHiB83nkt10CdDsrxZf8HiZIONy8bCoxHi7hvOfNGfmSIcYAH7SxzMqk4q
         yf5vmgW6Fi0XBbDpvTGsHxfQHBi29oEJNLHCERNp0+9lYY7OmSa/96XINFxCqXAh+9vO
         1jbA==
X-Gm-Message-State: AFq9FYJwXrxWskIScPxIDJGvT9/hxK4sBcPAaUEhQ8T1mxXLrIHchZn/
	MAVgn2AduKsn64fu3aanqsUwujI1xXBoJY9N3QTCDtmaEtxtwBsfaFvq
X-Gm-Gg: AYBFou3LngFRxsvStpTZ1Jhwzq3qZNRWodn1+vvwIdgKLgPYQdWIxOmur39DrhZGkkA
	bYgSXdTtC3iTNUOpmQkRFaHMPcNjz35X1Aq3hCEjIh2Ye1+QnhYVBLtserFzmo3XNkqQqCXswvJ
	NY90ux2X+XPxTD13N7FmQNhMnsp3rqiaOkZR2zHE2lNRv1Nseb/uutUVPmVB9CUJ9sp7qN1dFUd
	fwHE+JxDi1vHFwD643N08y7hkGkZtshgYdqB++QJZ/D2mw+8SkrPkjUQWm81x7AEhsUrc/DmbCH
	/HqXot2isktqk+c1FTAPdQ67DyIm6o09DWYD81hbnZTZyiiOI/qeGviP4XjFyyyT2rTMi5mJ8pm
	4xoBVLkNrq6v22SGDeEbVtIIFQhPOhvZN8RfwDRp4bOhCL7aGfxQbAa273ddgldTQFognwJmzPf
	lQ9hJ8hfEgVcCBhkVhPWw0YX6kO1ACVFzmQsP4ZJ6LqN/6YGlF/uly41It2BGZdqcOTcHdegxyC
	Sq+CRiJ2iR23qmeFPNqSOmhi0cX/rSmvjnynRBWc7VhH10QyMFNjK/hPbZKHxmYOT5+c3HokeV1
	eDoBUKu07GCThjBjU7tiYHh/r1OEItUD3Hlp6E7nWcWQ/rjYPbZDSg201fP83AKbDumheS/KM1o
	X/xkU/cVmSorsOwATi9gPpwodPrzo0h3Z5Wn0IqACHFbIK/nPdhQbsgWT5kK96LGRr7OpQldMIz
	YWPw==
X-Received: by 2002:a05:6830:449e:b0:80c:d30f:97b with SMTP id 46e09a7af769-85abeab270cmr903574a34.28.1793142343158;
        Tue, 27 Oct 2026 16:05:43 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fb0741c9sm12093328a34.10.2026.10.27.16.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 16:05:42 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v4 0/5] serial: 8250_dw: describe the Allwinner H616 UART
 configuration
Date: Tue, 27 Oct 2026 17:05:28 -0600
Message-Id: <20261027-submit-h616-uart-fifo-v1-v4-0-d37e018fd0a6@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42R3U7DMAyFX6XqNUb5T5kQ4j3QLpzU2YLWFZKuD
 E17d9JuExNiCCk3VuzvHPsc6kwpUq4X1aFONMYc+20p1F1V+zVuVwSxLXUtmDCcCQF557o4wNp
 wAztMA4QYehg5eI3Bt4G0d6wu42+JQtzP6JflqS6zr+SHiTd1rGMe+vQ5a4986rvIyNsy5TEgh
 dIhCXLYPK86jJt733f1JDOK/4JEAWFg+kFqpozUP0HyGqT+AMkCEo0JnrvGS8+vQcfT5oned+W
 2w+kctcNMUP4LcFEZp5xWMiBvrLbiwaK32qAJZMiooJlxtlEKp5N1lDPOoSyqx7M1e7E2RYkba
 IRm0H5AG0ucfZotKuCguOUKrSau8dvi0y2s+g2b9kOKK9jEQEPs6BwIByt5MdlqxmR7zV4ej1/
 X+joJYwIAAA==
X-Change-ID: 20261022-submit-h616-uart-fifo-v1-c5afcdfe5cb0
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

H616 has 256-byte UART FIFOs, but lacks the DesignWare component parameter
register used to discover their capacity. Its debug-divisor and RS485
registers also overlap offsets used to probe optional DesignWare features.

Add an H616 compatible for the integration-specific setup. Keep the
existing 16550A port type and describe its fixed FIFO depth in platform
data. Use common Allwinner helpers to configure the transmit load and
receive thresholds from that depth. Configure automatic flow control,
preserve the BUSY-safe integer divisor path and keep the UART gate enabled
during termios changes. The H616 configuration uses PIO.

The series first introduces platform setup callbacks and a shared RX
trigger conversion helper, then adds the binding, H616 setup and SoC DTS
changes. Based on tty-next at 6b4b543fa187 with the posted RX
trigger callback-lifetime fix [0] and DW BUSY-safe divisor fix v4 [1].
Platform setup runs before installing the BUSY-safe divisor setter.

[0] https://lore.kernel.org/r/20261024-submit-serial-8250-rxtrig-lifetime-v1-v1-1-731b78d5003d@gmail.com
[1] https://lore.kernel.org/r/20261027-submit-serial-8250-dw-divisor-v1-v4-1-41714a75e15a@gmail.com

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v4:
- Introduce common Allwinner setup helpers with the fixed FIFO depth
  supplied by compatible-specific platform data.
- Rebase onto tty-next at 6b4b543fa187 and the posted DW divisor v4 fix,
  installing the BUSY-safe setter after platform setup.
- Use an early return for FIFO-less DMA setup, following Andy's review.
- Default to generic setup when platform data has no setup callback.
- Select Octeon's optional-register discovery with IS_ENABLED() in its
  setup helper, preserving the existing 32-bit and 64-bit behavior.
- Extract the shared 8250 bytes-to-FCR conversion, including the
  unsupported-table check, into a preparatory patch and use it for
  H616, following Andy's review.
- Set the fixed 256-byte FIFO depth in H616 platform data and omit
  fifo-size from its binding and DTS, following Krzysztof's review.
- Precompute the Allwinner RX thresholds during setup and retain the
  sunxi FIFO-depth helper for filling the table. Use named FCR encodings
  in the helper, following Jiri's review.
- Share threshold-table initialization and callback assignment through
  a sunxi RX trigger setup helper.
- Group and comment the H616 trigger and RS485 setup.
- Link to v3: https://patch.msgid.link/20261024-submit-h616-uart-fifo-v1-v3-0-286fc1b8c3c1@gmail.com

Changes in v3:
- Introduce a platform-data setup callback in a preparatory patch,
  replacing skip_autocfg and preserving the existing Octeon setup.
- Describe each H616 UART's FIFO capacity with the standard fifo-size DT
  property and use the value already read by uart_read_port_properties().
- Derive the Allwinner RX trigger thresholds from the FIFO depth.
- Use an unsigned trigger index and conditional runtime PM guard,
  preserving error propagation when the device cannot resume.
- Rebase onto tty-next, replacing the earlier DMA prerequisites with the
  posted RX trigger callback-lifetime fix.
- Separate DMA enablement into follow-up work, retaining PIO operation
  for the H616 FIFO configuration.
- Link to v2: https://lore.kernel.org/r/20261023-submit-h616-uart-fifo-v1-v2-0-af0593504635@gmail.com

Changes in v2:
- Keep PORT_16550A and set the FIFO size, transmit load and capabilities
  during setup, following Andy's review.
- Select H616 setup through the matched platform-data pointer and remove
  the type and DMA burst-size platform-data members.
- Use get_rxtrig/set_rxtrig for the 1/64/128/254-byte receive thresholds,
  with port locking and runtime PM around register updates. Keep the
  standard half-full FCR default, selecting 128 bytes on H616.
- Advertise UART_CAP_AFE so CRTSCTS enables hardware automatic flow control.
- Rebase onto next-20261023 and declare the posted sun6i pause/lifetime
  fixes and their prerequisites for DMA enablement.
- Link to v1: https://lore.kernel.org/r/20261023-submit-h616-uart-fifo-v1-v1-0-e4a3bae2eba8@gmail.com

To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jiri Slaby <jirislaby@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org
Cc: linux-serial@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev

---
James Hilliard (5):
      serial: 8250_dw: select port setup through platform data
      serial: 8250: share the RX trigger conversion helper
      dt-bindings: serial: snps-dw-apb-uart: add Allwinner H616
      serial: 8250_dw: configure the Allwinner H616 UART
      arm64: dts: allwinner: h616: describe the UART integration

 .../bindings/serial/snps-dw-apb-uart.yaml          |   1 +
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     |  12 +-
 drivers/tty/serial/8250/8250.h                     |  16 +++
 drivers/tty/serial/8250/8250_dw.c                  | 138 +++++++++++++++++++--
 drivers/tty/serial/8250/8250_port.c                |  12 +-
 5 files changed, 151 insertions(+), 28 deletions(-)
---
base-commit: 6b4b543fa18757297ac756a6fe6e64f506b7844a
change-id: 20261022-submit-h616-uart-fifo-v1-c5afcdfe5cb0
prerequisite-message-id: <20261027-submit-serial-8250-dw-divisor-v1-v4-1-41714a75e15a@gmail.com>
prerequisite-patch-id: d8219673210dac82d3adab41578ff2f76f5862c9
prerequisite-message-id: <20261024-submit-serial-8250-rxtrig-lifetime-v1-v1-1-731b78d5003d@gmail.com>
prerequisite-patch-id: 9a9395c715c2bf7bbcae5bdd16a339d7f2af6269

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

