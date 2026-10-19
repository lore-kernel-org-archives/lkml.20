Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792436492;
	b=ab3OMtMp1EUw6E4G9bB2ET9VAxEPZfZ2V0E3B1e/YM5v3F7QXC7gMJ/+bqZxKijvFm3k
	 vtn4Nd4nh9KIuhHlN/oBLM/Zj/e7vQAV/c+C2UST6fNBpmsFjwTpNerInF/LGwOWQvuSK
	 hsij9czmFkBvh8Ghq7iq9y5y6DF8gQ+qcom1VdM6grYgsF1fVRb7NLnQyq9b2J8WzTAZX
	 DGCmNFbX3sn7iJ7UrZr7bPseaPW9RKQs/E+m7olpjtx5RxljYctwp5+hfS5rL7qGfVrft
	 IqieX/x5t5zCiNA+dsBJMRLHBaSBI9apUyDt6EA5BSTLkc/KvG+nPplkifDxdtjl4Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792436492;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=NlRWSTOFbePBOR+ZW461CZ2nj2CGvQoMjpOv8gpMfng=;
	b=XGJC2zYBWQj73C4PUcMbFSQeUPZz7W5GsXB3iFW7YgGAB7oZc2Oe/krvavWFVR2qcdo5
	 YfoFu4dRq/ptzHckSc1xSiNAnQ19wy6CU/d5unHJPhaCNTMgTYIrz089i8OyNzoGnOntj
	 47V7f8xEJXnNOYGLnRg9yOHlkqzWrLSPB0tJnkKbpsU7UL+ADY0iiC+/3lw1Ir+8Nxr07
	 qiHF4snRbviy0Qjnr5pGskQWu+3mYdulKJQ7CtDsiYCzyYNKjVgxw4bO84D1nQVMc7vrV
	 Iw215syEXp1IZynl3s/wz9NWVmWLJwT8wMSPNK2h9e7ZSJjLapdQEwyLxHT0pcFHgcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=UU8TRiq9;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78792606A32E
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:01:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78792606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=UU8TRiq9
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e5378b281aso12017225ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792436492; x=1793041292; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NlRWSTOFbePBOR+ZW461CZ2nj2CGvQoMjpOv8gpMfng=;
        b=UU8TRiq9DiE8zfA7Pa2TXthgGGAnSHZ05QkxuOtmOR+YCZ74ZTqSrakYcIgXtCp6Wn
         ugys60LhDleJ2o5PjhR63LA1a899ZdGAvoeaHofgc2NEMpZvpF0f0Y6Yq+enCvJBNGwk
         0NZWGQyXRJ46brfn5JZGwLvz5FdYL5EbhWWsA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792436492; x=1793041292;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NlRWSTOFbePBOR+ZW461CZ2nj2CGvQoMjpOv8gpMfng=;
        b=Jdg6CZ3nplbpHQEhDw6hvMnyJt+nivDicAP2tiz/vqDaniSCzBnIW/1TkEUMghJq1U
         iTD9IIM640WB/vKYh0uAvqV3dyd1GD2ZNkTHiIkzRKei4UMR5bnHrDyu++J03DzFs9jR
         QBWDNtVoDEIUbeMqeJa5tqWVqm3yK7nDWrb+H/Jy4GPdXKsGfiHIsmlhq09JJEpnzCxh
         zFK4Fb50CIciq0PDDkXbQ7iNDaCXwD5DhSG1N3af8lug0nLxZHnMAkF+f06Z4oMHYpY+
         jWJlDDh2NMMZP+W7Jds9+LsnGXL051f7LceVRIZuVeeF8aP7cQs7A7exTE24QnbZ6Vo6
         OUuw==
X-Forwarded-Encrypted: i=1; AKwUvByU3NMehl69L5HRIXG2f4trEYh0aqDRCmEEX8dnyhsxO26gaam4rG03ODlLnlAuoP//5Xk708JBfkcg3bY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVj1aQc+2y6uxt3KVgJXTTXlLThgHpPS7eka+ZbElQRQFriv/V
	o4HdNt3Os4FefhgMMRLPSTQW+KzBzXz4C0iLUVY2HXdQEddsOHNSJ3odXa2oYNfCyA==
X-Gm-Gg: AYBFou2ZBoOb+Ti5FIck1TNAhq9cyLtFt78qdm8TMdviJP5QFirtsn6B00a+NYnbuyG
	NMnIEdFpvZD1pkEcTFqX+YTRR54NJKp0I0whNCQ6sPbHrUr3+tqGVbuN+UXbMFMYRWa7TFOtSEC
	lufBj8qbii+92nUtk7GYCcKhLyXLsFN6UX/PQC+PGKwwZwJuhyNklZ5C1mw8bHVQn2FsaXAiD1K
	V/gDmdmMMBcInQSP6Uwfh8syuvSq4opzN9exd/ld0KoSfRiaBbgfVnwICR+magE/i6t+9OX+PlM
	prUaglM+kFhnOOUDrG00K9l05lxeD2znzXvwSn1snG3yZQQyatUvg+D/nCjs1CMclTTARbYRdGN
	nkfnrhgCpmOx9zuKDVtmlr9NBnnAb9RA0/Qp+vsLWwdvxfTriBealICEJgaSpl4kYmX84AoCv1N
	kkTHsowRdULakbNLItkeXU19PFjOyfScWtZg259ZUbi85y4imSas2aGhpgQFf+zyK+yP8c2ebnX
	Jg14KKXsF1eKyA54TiER8B8UChv+2qUuFVws5tBkSpV+p3/M8WVi/7MsInFibNVc6xdiRh+rE//
	wzVVCA==
X-Received: by 2002:a17:902:e84c:b0:2e9:6b5b:3db6 with SMTP id d9443c01a7336-2e9a69e93d4mr78949655ad.30.1792436488354;
        Mon, 19 Oct 2026 12:01:28 -0700 (PDT)
Received: from jingyliang-input-linux.c.googlers.com (218.117.230.35.bc.googleusercontent.com. [35.230.117.218])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea151e1b7esm4473105ad.75.2026.10.19.12.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 12:01:27 -0700 (PDT)
From: Jingyuan Liang <jingyliang@chromium.org>
Subject: [PATCH v6 00/11] Add spi-hid transport driver
Date: Mon, 19 Oct 2026 19:01:12 +0000
Message-Id: <20261019-send-upstream-v6-0-cb9ba4b3d6fa@chromium.org>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPho1moC/23PzW7DIAzA8VepOI8Jm4+SnvYe0w4UTMMhSQUt2
 lTl3Uc7aZ1Yjn/L/km+sUI5UWGH3Y1lqqmkZW5hXnbMj24+EU+hNUOBRiAgLzQHfj2XSyY38b2
 OJoaBwoDE2s05U0yfD+/9o/WYymXJXw++wn36I0khO6kCFxw06KNDsFGGNz/mZUrX6XXJJ3bHK
 v4BUPUANkAjeLIuxmjNBiCfgBL9L1U2wIgBvNI2SL3fANQTaJs9oBpwtEoGTcZTkBuA/gVA/Ad
 0A6RVLgoIThJ1wLqu3/ZCO9axAQAA
X-Change-ID: 20260212-send-upstream-75f6fd9ed92e
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Mark Brown <broonie@kernel.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 hbarnor@chromium.org, tfiga@chromium.org, fqwqf@fqwqf.xyz, daleyo@gmail.com, 
 Jingyuan Liang <jingyliang@chromium.org>, 
 Jarrett Schultz <jaschultz@microsoft.com>, 
 Dmitry Antipov <dmanti@microsoft.com>, Angela Czubak <acz@semihalf.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792436487; l=5852;
 i=jingyliang@chromium.org; s=20260213; h=from:subject:message-id;
 bh=ga6CwkzARUkSvEvRDG0PQmoQD7fSmYRrychrK6mPJmA=;
 b=vBA5OO3tSh7vW0DnhWVDJWpbII+xJtYD5/j1+yxiiJ5vl/UDtQJ3Uk4FZ+YGJnUP3gkXxZnv6
 fjs+9TLMNgCBwXACf0yfOCEkSy7lN5urMp6GOiINJI/amWw+dLgEKq1
X-Developer-Key: i=jingyliang@chromium.org; a=ed25519;
 pk=VTYSdqslTtYOjWWoIGgYoWupGWqNSidrggReKMgfPo4=

This series picks up the spi-hid driver work originally started by
Microsoft. The patch breakdown has been modified and the implementation
has been refactored to address upstream feedback and testing issues. We
are submitting this as a new series while keeping the original sign-off
chain to reflect the history.

Same as the original series, there is a change to HID documentation, some
HID core changes to support a SPI device, the SPI HID transport driver,
and HID over SPI Device Tree binding. We have added the HID over SPI ACPI
support, power management, panel follower, and quirks for Ilitek touch
controllers.

Original authors: Jarrett Schultz <jaschultz@microsoft.com>,
		  Dmitry Antipov <dmanti@microsoft.com>
Link: https://lore.kernel.org/r/86b63b7b-afda-d7f4-7bfa-175085d5a8ef@gmail.com

Signed-off-by: Jingyuan Liang <jingyliang@chromium.org>
---
Changes in v6:
- Take output_lock while reallocating buffers in ll_start()
- Don't drop input reports while a refreshed device probes
- OF: drop mod_devicetable.h, use named initializers, fix alignment
- Move the dt-bindings patch before the OF driver patch
- Drop Tested-by from the documentation and DT binding patches
- Link to v5: https://lore.kernel.org/r/20261009-send-upstream-v5-0-384af01da3ee@chromium.org

Changes in v5:
- Fix request/response races; match GET_FEATURE responses by report ID
- Reset the device on response timeout; wait uninterruptibly
- Validate device descriptor and report lengths; fix buffer sizing
- Honor rtype in raw_request(); fix GET_REPORT off-by-one
- Use hid_safe_input_report(); forward input reports only while open
- Disable IRQ around hid_device teardown; fix a sparse warning
- Use disable_work_sync() for reset_work in remove()
- Cap trace copies at 64 bytes; cacheline-align read approval buffers
- ACPI: select RESET_CONTROLLER, use device_reset_optional()
- OF & DT: read opcodes as u8, use dev_err_probe(), require reg
- PM: cancel reset_work on suspend, wait for reset before
  reset_resume(), fix IRQ imbalance on resume failure
- Panel follower: fix regulator/IRQ imbalance; depend on DRM || !DRM
- Link to v4: https://lore.kernel.org/r/20260609-send-upstream-v4-0-b843d5e6ced3@chromium.org

Changes in v4:
- Extended io_lock scope to protect the shid->hid pointer lifecycle
  against races with the IRQ handler
- Cacheline-aligned DMA buffers, enforced 4-byte alignment
- Added error rollback for failed suspend/resume transitions
- Moved IRQ request to probe with IRQF_NO_AUTOEN (disabled by default)
- DT Bindings & OF Driver:
  - Required a device-specific compatible string in the schema.
  - Added description to explain why opcodes and addresses properties
    need to be defined in the schema
  - Added `spi-peripheral-props.yaml` reference and switched to
    `unevaluatedProperties: false`.
  - Added fallback to default timing parameters in OF driver if match
    data is missing.
- Link to v3: https://lore.kernel.org/r/20260402-send-upstream-v3-0-6091c458d357@chromium.org

Changes in v3:
- Add io_lock init
- Relocate tracepoints to drivers/hid/spi-hid/ and fix tracepoint macros
- Add tracepoints for sync, error handling, reset, and report processing
- Clean up internal includes and fix Makefile CFLAGS
- Add more details in v2 changelog
- Link to v2: https://lore.kernel.org/r/20260324-send-upstream-v2-0-521ce8afff86@chromium.org

Changes in v2:
- Clean up DT bindings: fix formatting and remove timing and flags properties
- Update DT binding example: use a device-specific compatible and drop
  reset_assert
- Simplify ACPI/OF match tables by removing ACPI_PTR/of_match_ptr
- Refactor OF driver to use match data for timing parameters instead
  of DT properties
- Switch to fsleep() for delays in ACPI and OF drivers
- Drop patch 12 as it is vendor specific
- Add a lock to fix input/output concurrency race
- Link to v1: https://lore.kernel.org/r/20260303-send-upstream-v1-0-1515ba218f3d@chromium.org

---
Angela Czubak (2):
      HID: spi-hid: add transport driver skeleton for HID over SPI bus
      HID: spi-hid: add ACPI support for HID over SPI

Jarrett Schultz (3):
      Documentation: Correction in HID output_report callback description.
      HID: Add BUS_SPI support and define HID_SPI_DEVICE macro
      HID: spi-hid: add device tree support for HID over SPI

Jingyuan Liang (6):
      HID: spi-hid: add spi-hid driver HID layer
      HID: spi-hid: add HID SPI protocol implementation
      HID: spi-hid: add spi_hid traces
      dt-bindings: input: Document hid-over-spi DT schema
      HID: spi-hid: add power management implementation
      HID: spi-hid: add panel follower support

 .../devicetree/bindings/input/hid-over-spi.yaml    |  130 ++
 Documentation/hid/hid-transport.rst                |    4 +-
 drivers/hid/Kconfig                                |    2 +
 drivers/hid/Makefile                               |    2 +
 drivers/hid/hid-core.c                             |    3 +
 drivers/hid/spi-hid/Kconfig                        |   50 +
 drivers/hid/spi-hid/Makefile                       |   12 +
 drivers/hid/spi-hid/spi-hid-acpi.c                 |  262 +++
 drivers/hid/spi-hid/spi-hid-core.c                 | 1757 ++++++++++++++++++++
 drivers/hid/spi-hid/spi-hid-core.h                 |  118 ++
 drivers/hid/spi-hid/spi-hid-of.c                   |  242 +++
 drivers/hid/spi-hid/spi-hid-trace.h                |  184 ++
 drivers/hid/spi-hid/spi-hid.h                      |   46 +
 include/linux/hid.h                                |    2 +
 14 files changed, 2812 insertions(+), 2 deletions(-)
---
base-commit: ee9c669f9bf5fd2c24206746ded9382fe810df89
change-id: 20260212-send-upstream-75f6fd9ed92e

Best regards,
-- 
Jingyuan Liang <jingyliang@chromium.org>

