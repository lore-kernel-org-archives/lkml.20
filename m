Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280393;
	b=X/jqv5i+Pls4AhjdZvn5ANjxnJI+ZJ73xdknkUTQRpIrJPtGIDH7kHkJ0xWObdwsLXGf
	 fHxSHyMhfKGl8N2gaEo1KGPZUmvP0xsoBlSswTJlCbGlpveiEwQmR/pWojRJaGMknJV2m
	 7DPgsVjMme638oqO0lUCbXNrGSRASh8m6oPrzWVqasZLVONWWOSoOMhh6zTtpBjnlAUnw
	 GTizhQm3nCxN12YERbItFtqM2z+/mE11AtmfWB5J6rvMjxg8BN8HpYNNM5kClkwYZ98kC
	 xVCIA2uQdUPzUnZTpmid2NGLWSIc2avdF8OiVnxlJa25u91U41k4DtzzThc3kS2glSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280393;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=kJS+888z9/xW37rRbsLAqP6ADhXzaU9fOkbt37UWOAQ=;
	b=bwAJsP5emJdZP7i/OS/BbhcZzjK/KNxqvpSA607T1IJcJK24TVSHdTkeaEmHxFpiTlAr
	 +NhDHWhKtqehCQjCO+7LJwMJX2OoWEKJX1WyEDl1l0UsUixV+LqlItDSSA6HDQzDV3nla
	 MecVibn614VFhciuXHh6iLzWudgI1GNcT5OiCrEhJXf+jW4R9O0hUhWePAT9nFHKwCv9g
	 zaVx07n177biBRfZ0vG257/Rhpd9TMNzD5UzQwex1bzDuE9vJslOFlEOSAK4e4sRkCZ3D
	 Pt6DubaSf3J/nxcD18Ik8KcQ2CsftSDtieu58Zjy1Hf5nQFpTwnSpI5bnhoMW4SZV7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wlVxPpAL;
	arc=none smtp.remote-ip=209.85.167.180
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B85606A332
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:13:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07B85606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wlVxPpAL
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-5642e0910a3so647251b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 19:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794280391; x=1794885191; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kJS+888z9/xW37rRbsLAqP6ADhXzaU9fOkbt37UWOAQ=;
        b=wlVxPpALLQhc9ogGvK1J78dBXSMNJS2PVOaQtYy6WkdK3YknyN/kQ9X9CPmsExUUaj
         CNZOj2zaZND3kyChJ+cEyjQcN2APOg2IH2MvSX0/Qv4dxXRmHF++d6wUJlSh6YtBLtKr
         A+mxIfPPjbIeh51MHdMCg6+F8wNf81CCjbX1xPB699sBZaWXaC+uA5+Z9dM0N9YW7dZ3
         RBOBxRGQXYKo0nOhvvjqXT+LdHyKFBGhXJjpnWjwja0I+qISuv44ERACUyKNcuGM8mys
         g2OurDvoPBlzorx/4odqPH9nd4dVcLFR4TgFpWNQIbbZEes9XcmW13kGTj4CtlpKdT/o
         ZCeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280391; x=1794885191;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kJS+888z9/xW37rRbsLAqP6ADhXzaU9fOkbt37UWOAQ=;
        b=vWbj8WDI+1YnUG5yy0HJ7aaB78bcdPzbcSIAs44Obka117vSA9pMgGfGfuZCA0J9AR
         VpAD13BdldMTDLxfg+ozQ+zV4AFtu9pPr0E/oVQyQX9iZtJoU3GkYtLxQDGdFf6UqDqL
         9oYnbYdlkFEoWVm/wbya/YwT/I5p8qDS5tnIdj9kGGTu2vhLT/UiX+J5KagGdtaEUB29
         L57lDlpYT8qDUEKDngLq44t7wUZLGbFNckrpwLdxQwHMfJTl7cBlnhp4ufhAJNCOCYag
         FsloQscpSooFwN5RB/KONQZhzwyZTg+fuHaX6d2ApehFp7RRMkdrVnGOK6qfC1WfNoV2
         z/aA==
X-Gm-Message-State: APuU4Z8L5Ri2zCLg9WF+rqTGNYxMD36zGX7yBmvF5FIgUr3IuBnv0Yfd
	073Kkt6XU6cxsyawvTd9Non3s6P9oJNoZxF1IzGs90EvHpTDGC39u5iH
X-Gm-Gg: AYBFou1tbrJo8mpBCVixnXQU9uXnjfO1EM1v5WtOYypNAQgzBiN76372XTFzt5QV+PT
	CyOMLaKEJ8QKqoOLTLF8WaRDe/LqpLmy4tMcucLAI/U2CDUW0vvyuJix200akC+YitCOGpmVFkp
	xen5A8EF2WYTk3aN/ZX5N6B7d3BqgoBWkFa3rUsuoBGd5O/UrNCZA5IB5rwMhM+77ZbKeKURaKG
	KgCz7mB5dKZKmVZiUVrQDicxbxfj5YF7fcqFQWwVbfTWkbWS/izdVEQ8q4zeNIRiHKR+bs/obcx
	7fy3RXJW2EL4B2TcZfo+7EkyKO0k6H51gs3j2xknTdkGiJatIIWW8ngVtwlC/+wXh5yc2dNgRAM
	9eMJ3ONuYSTcGOxRGx41i7inEmeIoo4QMHMIj9m3hcyRyr6n7TDg9BVsvuKbWawMayHUvSP1mcG
	UZhFEUfFJ//wtwYFeiEN5m7gdI8ENp4tKCYTRAJnYGQAbO32FIGGaVR7HHVt/d66fP//1E/F2Vl
	FeYWb14p8Ds9kMTj6N4Z7JtVh2/Kfuu+72KjTe5FvPGzXs048f83/w10WZbE/Q8nNdCCbun1XVH
	ms13p0gz5MB9C6L8w3aVMmTZLaWtpyM7SPLHJo1pVQBIBsm2xIh34jW/DOcahmPKnrpoIUgWGK5
	KZTDO1imTByHjsJ9uQyP/pXGGOoOTYzuS6I4O79fgIjx8DctlnbhneJl9a6144K5fUUNFfK+Ify
	OS8YhgbMgvDJJNF+5A0SdokCU6VSpYN//tE9lXVw3tsfqlZH4zzBWT
X-Received: by 2002:a05:6808:30a0:b0:4c4:3997:ef2f with SMTP id 5614622812f47-5683cbaa305mr1043116b6e.17.1794280391467;
        Mon, 09 Nov 2026 19:13:11 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905736b92sm1019236b6e.8.2026.11.09.19.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:13:11 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v9 00/11] serial: 8250_dw: share RX trigger setup and
 describe Allwinner UARTs
Date: Mon, 09 Nov 2026 20:12:49 -0700
Message-Id: <20261109-submit-h616-uart-fifo-v1-v9-0-3f03961dae8a@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43T22rjMBAA0F8Jfq4W3SWHUvofpQ8jaZSoxPGu7
 KRdSv59x0mXGndrFvwyWDpjz+W9GbAWHJrt5r2peC5D6Y8UtHebJu7huENWEsWN5NIKLiUbTqE
 rI9tbYdkJ6shyyT07CxYN5Jgymhh4Q9d/Vszl7Uo/Pd9iuvuCcZy86cS+DGNff19zn8V07m8a9
 X0aejhDDSoASgzgH3cdlMOP2HfNlOYs/xeSBEHmplWGa6vMElJzSK9AiiDpbY4i+KiiWEJ6Drk
 VSBOUlEMufE4c7BIyc6hdgQxBRgWtFGAI+UuN7CdE0gpkp1+bGhuUtoHHJeTm0FqxHUGxRal9s
 t58rZGfQ2YF8gQJTQ1JMgivwxy63Mas4q8TDfJ4m70mwICM3hO43VgrPbqkow3SRJ+o0kJpgwo
 kT1J42QKgQz3NZ4fDANcN2G7ul+2b9gYOzEtDPXtlqdDu9PWjjYJp4YQGZ1AY+PzEh+9Y/S+2v
 o217NihZBxLhx/TL5hTIjifDOcqze3ny+UPfVsWV9ADAAA=
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
Changes in v9:
- Keep the conditional setup call and place its error check outside the
  conditional in the preparatory patch, following Andy's review.
- Use FIELD_MODIFY() to update the RX trigger field, converting the FCR
  encoding back to its field value first.
- Collect Andy's Reviewed-by for setup error propagation.
- Link to v8: https://patch.msgid.link/20261105-submit-h616-uart-fifo-v1-v8-0-14024d2b184b@gmail.com

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
 drivers/tty/serial/8250/8250_dwlib.c               |  93 ++++++++++++++++-
 drivers/tty/serial/8250/8250_dwlib.h               |   4 +-
 drivers/tty/serial/8250/8250_lpss.c                |   4 +-
 drivers/tty/serial/8250/8250_mxpcie.c              |   2 +-
 drivers/tty/serial/8250/8250_port.c                |  27 +++--
 include/linux/serial_core.h                        |   2 +-
 9 files changed, 226 insertions(+), 28 deletions(-)
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

