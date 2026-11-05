Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911933;
	b=1A6nX6NKVSs1vDbDM92oSbAjTU9Q8X8eFlzJzDAg4ToKmRXemaJ2tLs6zKjTXVZJsQZn
	 8XH5mZoX5uTZI2Afw69oR/BC+ddrevyeokfGFmosPIdgWUI/qaEO2hB7k3oEPB8Smp0XD
	 CMntJ77wDGj4B3lSkYc4YkINi/gRkwmCuqTAcwDCOyBSe3/0cDqTd3XX07niBCqj9UNFI
	 2g5QUc6kJtF3LjPvZry1OW1ptHYVuJPmsga6fsWW7ENYYFK+Mc8HBZOi1fEFNrYM3kJkr
	 c0HxD01AnerM2zAJkmJg7fHUCHVIjh1cqnfzSL+KawOi4ouJ0lqD7ii2c4gQoCbif6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911933;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=etFadpZxb3K3Koio+rWn9A442pWi/regcd29GY8GRBI=;
	b=UA+W6xveuB8i5q7/soIAuoC7WUqEGwDMRbM6Vvu54yu22vUIuDV0FRTQm/WjgU4BaNgr
	 7wIhiZuKrlhitU/LsBtE/lppoXnFcfLZNJ7FmmXxd7pWIlGkHqjhGp+E2QAurrRz4fxKx
	 jkww1o/0E9s2bUnbMI2QKWZ1nwvOVzGv3foLHSgCUm0FW2ikoEVUbX2dfKyx19t9bAQXy
	 nwvJzAvlT+6+IeJ8+PA3/w/U3J3u16jgKewWMIySEF/8hEFwzpqrWoRaocPaFIXfdvKmm
	 M1F4NJaisAl97sI6AhOozFBigpX7XX775Eihgo8uTj+30ZEDwLM0NG03MXeHkp0xheA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K2zetxKQ;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65661606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:52:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65661606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K2zetxKQ
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-84d5e56f876so1331a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793911932; x=1794516732; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=etFadpZxb3K3Koio+rWn9A442pWi/regcd29GY8GRBI=;
        b=K2zetxKQP3pk0KG93LZyT3LeTq9+OdutjEiHq/H2WKTLkqFWpo6ueWS8Bvs8Geclly
         BzJ2Cm0pg5kxc5St4ECXaR2MQaXc+VkdWRgjMokPtVyterMMqMrQOrx/36ZPkjcrlx+E
         jqMVS6TnoeB6g/EBXKhkAEN3BylncFfMuGF+mHMDboguQ0cqZeZ8yOzCC8p37KdbHNfL
         cgy0Id5JrWncq89kIjHC7+0C8a8OzqnlBuylUaQ7hAdNjFqKHKANnS5BOTpP4qbMbAk5
         f6O0RHf4t5cskxGdRYAC7hial9RDep9YYIog1eSlBXMb78eIj0G4008v2b8d8S+H+4wf
         UquA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911932; x=1794516732;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=etFadpZxb3K3Koio+rWn9A442pWi/regcd29GY8GRBI=;
        b=AS4dKlbavT3UfBUfazmr6bDix2J0EyOVx/YcH5yiUFZfWJn5/B1KZz796nKQuMAIQK
         zlSS4zWBUZvrFky0AbO3pUhYiOzhpDtu3cJIXBf7fVEOfXT3tULWl/EJ36UL2mFhQjJy
         fTiUhXscuHTXNuZ2A+7DM/g+u2eZOlquhz2yNoajFc8BpJewoj1Xx/lqLD0pTKIVSZgo
         AyC7L0xjmm+JxM5wXqRdXYg5QtooOESvvhSLYcZJqVsIoz7D4g7JcM2dmgzifRcS3GP6
         hpHJLYKgxTaKrarFjMAjKZ477eaqio1oH37ecW7T/7MBd9xIvEGbdwvYn9C0nppdKy6/
         T+IA==
X-Gm-Message-State: APuU4Z8rsTzmI/lLSMljuwna643NEcNm1Qnq7fBBQRIlw8Q6r53aMOTQ
	8KStluKaMDA3rUseyTYwN5rfwtMV/4EsnZsN0BTcK5N9S++uLtmD3m6y
X-Gm-Gg: AYBFou1XwkIWgp0Bk9X7Vj0D1CXOQjd2FDz2nL4084MkP2EssvrCgcYR8xKWkOMKKJH
	/N2qbzWd2Xf8VgDhIrCE+GrBHocp/7TgYI510V3oEXjvGIzvIMoJgxZu1ouvq9OxroOqZgj0jzG
	A5y/kv369/l9u97DJBPLIF//UA024fbAU9CAPKfHJ3iMxBeZ6VhSimnFVbOnGZMwauBRUOWpxsH
	vPCeuI/Ed3JrwY0RagUZ5qf5CpRaxmsnymVP3Jzv5wLpwC9h2ov1tL3sN4H4wJJzQO9VaozhaNY
	bKkoQpbtr68lNmSmo/g356MvgBcqah7KG8lrZcR/YK6XVjwlRD3VT+1GvsO6LeOm1J0oxQrTy5b
	/btQqOuodBrMc5gGOXr3tBlUlIdW3fBajVieYUjPymusMI7BbGQ+7lqMOr2gyD0zLxOlKDYD+ih
	J3In8OgzHU6uZwSfjCMgFls9UXtSUjlKHPJdh8w9STglKhS1NVHXkZix4mas6hjJh3OlsrGzauZ
	T1fZXLrt2z70/znIdwq7WpVP6/VM41Q+Qu8nFv8zWCC1Kwg/vHf1hxFEs4lCczmLqmYOx3+iGDm
	6ciYJB54nDoLmnDmxXOqE9PHRD1UHLsQz0b+xWX+PaL2co07Nzh2kZUrcM5ImlESCUxfj1XztZ/
	srwbtAYwJkeBASguKCNHuGwZ3v17YBzTzw7cqP9GeMlwrgd0sNeOA2PFrb+WPhcQt+NGv6hKDuV
	gGZue6054A3bp/RRcYhVapdYh0PqOciMVY9jdIxTdZKzgWXjbl11plgInG7uYrMXbQBVJEK+Qz
X-Received: by 2002:a05:6830:3114:b0:7fa:ac4f:79a with SMTP id 46e09a7af769-85f1d0ac516mr699871a34.22.1793911931772;
        Thu, 05 Nov 2026 12:52:11 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbb298fsm292276a34.6.2026.11.05.12.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:52:10 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v8 00/11] serial: 8250_dw: share RX trigger setup and
 describe Allwinner UARTs
Date: Thu, 05 Nov 2026 13:52:01 -0700
Message-Id: <20261105-submit-h616-uart-fifo-v1-v8-0-14024d2b184b@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43S3U7jMBAF4Fepco2R/+1WaLXvseJibI9bo4aAk
 3ZBqO/OpAURAkRIubFif+OcnJemx1qwbzarl6bisfSlu6eFv1o1cQf3W2Ql0bqRXFrBpWT9IbR
 lYDsrLDtAHVguuWNHwaKBHFNGEwNv6PhDxVyezvS/28uazt5hHEZv3LEr/dDV5/Psoxj3vY9RP
 4+hhzPUoAKgxAD+77aFsr+OXduMY47yt5AkCDI3a2W4tsrMITWF9AKkCJLe5iiCjyqKOaSnkFu
 ANEFJOeTC58TBziEzhdYLkCHIqKCVAgwhf8nIfkAkLUB2/LTxxwalbeBxDrkptBS2IyiuUWqfr
 DefMzpd2lHx8UD9Gy6VaQL0yOg9gZuVtdKjSzraIE30iQISShtUIHmSwss1ADrUY61a7Hs4F3e
 zupmnPtYd9sxLQ1H/Z6lQ5bv6lr5gWjihwRkUBj6u+OcnVn/H1qehli3bl4xDafGttII5JYLzy
 XCu0tS+PZ1eAVq4jVyHAwAA
X-Change-ID: 20261022-submit-h616-uart-fifo-v1-c5afcdfe5cb0
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

DesignWare UART receive thresholds are one byte, one quarter full, one
half full and two bytes below full. Describe this mapping in dwlib so
CPR-described DW and LPSS ports use their actual FIFO depth when reporting
or setting rx_trig_bytes. Widen the 8250 threshold tables, setter byte
counts and sysfs parser to 16 bits to support larger DW FIFOs, including
the 2 KiB configuration.

Enable the same interface for Octeon using its fixed 64-byte FIFO depth.
Expose rx_trig_bytes for ports supplying both trigger callbacks, including
port types without a static trigger table. Retain Octeon's special register
accessors, optional-register probe bypass and existing DMA selection.

Reuse the same trigger setup for the Allwinner integrations. H616 has
fixed 256-byte FIFOs without a readable FIFO-depth register. A523, A527
and T527 have different depths across their UARTs and report each port's
depth in the FIFO Clock Control register. Select the fixed platform-data
depth when provided, otherwise read FCC, and validate the depth before
building the threshold table.

Dedicated compatibles select the Allwinner configuration without probing
overlapping optional DesignWare registers. Keep PORT_16550A, configure
automatic flow control, preserve BUSY-safe integer divisor programming
and keep the UART clock gate enabled during termios changes. The sunxi
setup uses PIO.

The series first prepares setup error propagation and platform callbacks,
then widens and shares the 8250 trigger conversion, enables callback-based
sysfs controls, and adds common DW setup and Allwinner bindings and driver
support. The SoC DTS changes are deferred for a separate submission through
the platform tree.

Based on tty-next at 6628e7d4c6b2 with the posted RX trigger callback-lifetime
fix [0] and DW BUSY-safe divisor fix v4 [1]. Platform setup runs before
installing the BUSY-safe divisor setter.

[0] https://lore.kernel.org/r/20261024-submit-serial-8250-rxtrig-lifetime-v1-v1-1-731b78d5003d@gmail.com
[1] https://lore.kernel.org/r/20261027-submit-serial-8250-dw-divisor-v1-v4-1-41714a75e15a@gmail.com

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v8:
- Defer the H616 and A523 DTS changes for separate submission through the
  platform tree, following Krzysztof's review.
- Separate the dw8250_setup_port() return-type conversion and caller error
  handling into a preparatory patch before the platform setup refactor,
  following Andy's review.
- Place the RX trigger table first in the hardware-configuration members
  of dw8250_port_data, following Andy's review.
- Group and comment the fixed-depth/FCC selection, and use the conditional
  operator for Octeon's default FIFO depth, following Andy's review.
- Carry Andy's Reviewed-by for the H616 driver configuration.
- Link to v7: https://patch.msgid.link/20261103-submit-h616-uart-fifo-v1-v7-0-c9e248d685c1@gmail.com

Changes in v7:
- Rebase onto tty-next at 6628e7d4c6b2 (7.4-rc1), keeping the latest
  posted DW divisor v4 and RX trigger lifetime prerequisites.
- Keep the shared conversion internal to 8250_base now that both callers
  are linked there.
- Move callback-based sysfs exposure ahead of the common DW trigger setup.
- Expose rx_trig_bytes when a port supplies both trigger callbacks, even
  when its port type has no static threshold table.
- Initialize Octeon's FIFO-relative thresholds from its fixed depth while
  preserving register access and DMA selection.
- Widen the 8250 RX trigger tables, setter callback and sysfs parser to
  16-bit byte counts for the larger FIFO depths supported by DesignWare.
- Move FIFO-relative threshold construction and the trigger callbacks
  into dwlib, and use them for CPR-described DW and LPSS ports as well
  as the Allwinner integrations, following Andy's review.
- Share FIFO-depth validation and propagate setup failures through the
  DW and LPSS probe paths before registering a port.
- Keep the existing integer loop in the extracted conversion helper,
  following Andy's review.
- Use explicit fixed-depth and FCC-discovery branches in sunxi setup,
  following Andy's review.
- Clarify that FIFO-relative RX triggers are shared DesignWare behavior;
  describe Allwinner FIFO discovery and register-layout details separately.
- Link to v6: https://patch.msgid.link/20261102-submit-h616-uart-fifo-v1-v6-0-25afcb346b0c@gmail.com

Changes in v6:
- Export the shared RX trigger conversion in the SERIAL_8250 namespace
  and explain how driver callbacks avoid new legacy port types.
- Lead the H616 trigger description with the FIFO-relative mapping
  and include array_size.h explicitly.
- Name the trigger divisors and full-FIFO margin, reusing them for
  FCC depth validation. Explain that the upper bound follows the
  current byte-sized 8250 interface and can be widened with it.
- Describe the fixed-depth platform-data field independently of sunxi.
- Carry Ilpo's setup/helper review tags and Krzysztof's A523 binding ack.
- Link to v5: https://patch.msgid.link/20261029-submit-h616-uart-fifo-v1-v5-0-53b433aebbf8@gmail.com

Changes in v5:
- Reject FIFO depths that cannot produce positive, byte-sized RX trigger
  thresholds, report the invalid size and propagate setup errors to probe.
- Add the A523 UART compatible and use it for the shared CPUX UART nodes,
  including those inherited by the A527 and T527 boards.
- Read the FIFO depth from FCC when sunxi platform data has no fixed
  depth, preserving the fixed H616 configuration and FCC clock controls.
- Explain why the per-port trigger table is derived from the FIFO depth;
  use the same sunxi helper for the FCC-discovered A523-family ports.
- Move the shared RX trigger conversion helper into 8250_port.c and
  export it, following Ilpo's review; retain Andy's review tags.
- Use FIELD_PREP() and an intermediate trigger value when building the
  sunxi table, following Ilpo's review.
- Select the DMA setup helper directly for the 64-bit-only Octeon
  platform and match the single-line comment style, following Andy's review.
- Carry Krzysztof's Acked-by for the unchanged H616 binding addition.
- Link to v4: https://patch.msgid.link/20261027-submit-h616-uart-fifo-v1-v4-0-d37e018fd0a6@gmail.com

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
Cc: linux-kernel@vger.kernel.org
Cc: linux-serial@vger.kernel.org
Cc: devicetree@vger.kernel.org

---
James Hilliard (11):
      serial: 8250_dw: allow port setup to report errors
      serial: 8250_dw: select port setup through platform data
      serial: 8250: widen RX trigger byte counts to 16 bits
      serial: 8250: share the RX trigger conversion helper
      serial: 8250: expose RX trigger controls for custom callbacks
      serial: 8250_dw: derive RX trigger thresholds from the FIFO depth
      dt-bindings: serial: snps-dw-apb-uart: add Allwinner H616
      serial: 8250_dw: configure the Allwinner H616 UART
      dt-bindings: serial: snps-dw-apb-uart: add Allwinner A523
      serial: 8250_dw: discover Allwinner A523 FIFO depths through FCC
      serial: 8250_dw: configure RX trigger thresholds for Octeon

 .../bindings/serial/snps-dw-apb-uart.yaml          |   2 +
 drivers/tty/serial/8250/8250.h                     |   4 +-
 drivers/tty/serial/8250/8250_dw.c                  | 116 +++++++++++++++++++--
 drivers/tty/serial/8250/8250_dwlib.c               |  94 ++++++++++++++++-
 drivers/tty/serial/8250/8250_dwlib.h               |   4 +-
 drivers/tty/serial/8250/8250_lpss.c                |   4 +-
 drivers/tty/serial/8250/8250_mxpcie.c              |   2 +-
 drivers/tty/serial/8250/8250_port.c                |  27 +++--
 include/linux/serial_core.h                        |   2 +-
 9 files changed, 227 insertions(+), 28 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261022-submit-h616-uart-fifo-v1-c5afcdfe5cb0
prerequisite-message-id: <20261027-submit-serial-8250-dw-divisor-v1-v4-1-41714a75e15a@gmail.com>
prerequisite-patch-id: d8219673210dac82d3adab41578ff2f76f5862c9
prerequisite-message-id: <20261024-submit-serial-8250-rxtrig-lifetime-v1-v1-1-731b78d5003d@gmail.com>
prerequisite-patch-id: 9a9395c715c2bf7bbcae5bdd16a339d7f2af6269

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

