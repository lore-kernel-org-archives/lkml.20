Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793315633;
	b=pvAQc7kupXw4pakpmNCY9bo23uq1NtAzcZbV147AZtrq2kQNs1LZxTP/Ta42zdM9iK2P
	 1QYdrifwOf0H4oTdicFAPhPuxf+VnDS7IUBYADtgDu3J0QDlAjRAxRRUlZF6nREEh21d7
	 nU6dQJ3XPWDHREeBSFu6AyjEBBMvRXjR5765A+voy1nMhZlSIfadRBEBPkzQ0FbrbSOfX
	 nYD/Af9JD3uKAEFHBZzwWzhmsZHW11VFVMl4HSdokO6RWwDrdjMNOsPYZSYJh/dGiMHfa
	 7liZcwtI1GVi86bRb4ioMhCqVAWKwOaYrZiIS7PVQt92TcY8436ZlTCkPp7AJT2+OTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793315633;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Td9/mME215/4xVyAcQCSwVGtdaBr9meLthZDhvRiipQ=;
	b=AW4UW427zad+77wlRAR9b9lCRd6WFvPCBt746Yi6CP7WSDykO5ZoKomc3OcPwHziWrrN
	 2mjIr5253g4F5NOfsTCT12CXsFOOchm7C+VeNQ9fJWhZRR6YpDUroy/IM8nE8IMloBgtg
	 6olYAMsCDdwsnQcHIfAJ5AcM5tBGYeyUY5YRbJXqOPMHF9OGBsPhYHqCOakbPoA906gPY
	 hKmCYQ6bIHO1VOgAh1uJPUqD4rP6pJP2DWXJaWmytMNnYMAnjti/ywEyq4ppGKbaF2082
	 FJ6QuoVpVd+n797ZLGktsDK3G1Xybb+Pv5ehV5kg8VmRalrRDGT1Lblroh2dO4HpNbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sG+dCFqL;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406CC606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 23:13:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 406CC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sG+dCFqL
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so275276eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793315632; x=1793920432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Td9/mME215/4xVyAcQCSwVGtdaBr9meLthZDhvRiipQ=;
        b=sG+dCFqLbMKVJUT2aa8gkNLHDvSlwirCWAie2GW39VzfzUx80oVv89YQh6jW5O3vA/
         HWWP7sbGdPTRxotCJArGYZ9gAnRkAUb+TACL6Ndv7mNpIXb+vilGBHCSdB/tO1UZYwLw
         t3KBxF1HbAlBDpDMpH1n6ix1vgdpcWeTkiAwyd7TwFRVRloNLq0ac6JyBtm5kdMzSXwQ
         Phib3DXGYKYJUgIH7jVe1leunAMnBiMrA/qvZw6VXFwxuf/VgvZbyfJhfd9OaPzp1UW2
         CUbZBodLUuRCCZiHc+l14lmMxJAJhXX6TCfjO0vhu17u2ehjF+JqbhB8t4/a/kt0Ohdq
         AJbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793315632; x=1793920432;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Td9/mME215/4xVyAcQCSwVGtdaBr9meLthZDhvRiipQ=;
        b=WVtGQJmCrHGfzVZXVK+EryOEpnJOyNrpa7E9RwpTpGjNk6qEMQTXCsBe7elmmb13R6
         ukbXOSynsuEJXDYKwlO7fc42VMT+ZRXCvDR6D3gievJ7xRLaL8yxXk6s0R2nD73f9N0x
         VznkKoq/Hsrk0b/Miu4gfRLaLVwBhEARVttv/JZO9cswc1qIMj3UIp66NLF/+J93E1W6
         HNgXY0LrZg+nzq33QLiyyeKHuzw+x2YJSlS+LfLbrtduCs/tLQVD+VZxBH/LkWheMXUL
         IkQg2Qf1X62J0uDeRszsWqgyMk2YJscMw2CraGaZ7X7RL+2qy6nzQbJuqVXMxirZLPor
         YDUw==
X-Forwarded-Encrypted: i=1; AKwUvBy0pI6wmvzJ7aVKBIfxSjdHGfNJrnfgOyPxJUWHQue+6YyUiZMTqDpSTsax8/AuL+fbxwrCdYdCNJTRG+o=@vger.kernel.org
X-Gm-Message-State: AFq9FYIf0/7dZjnKU+0/3+vILofCixCkZTZ2F8A25wFCaINahuMz+035
	mV8JiU1oKBRPvZlFG8mlS0zzExAaQuNEJxh+PkebMsodBCfEmxfiCzQz
X-Gm-Gg: AYBFou1PYtCVq2g+EU1ppgJjy8lqQpMyKAaYzpdAV3m0DYEn2OwgeN7cmKa/G3pfVXD
	mXGpAMSG2MDQ1e4AUycd+RScgtya47cRpucSChcLgak6jkotr8cS/sihoYJMKXBqYJWOT4tOpd/
	83hcdNkABfbwwJxj1fBqf+ltOF1Imm4/D7m9aT9P4VfhkTm5ayTetwX74nMKQzMoZ6+4fvqTcWb
	tKVOkZILPMg7Hf3XjJjyswS4tS6HxSlrZ+wjpruWLYK+wlFqnoSYK9O1xQuJvbmTNr4yPVGtZVr
	CX7sEgNLeVIGhUTNhkisyuC1oYduv8ZLCni6qqajXAhw+lgpPhShqk9x4TegSACR2FolzRd10wH
	zwfVgI/afnXKYbMP4/soDL1rsoqaujK3QT8fwjWDm/UGvOZUwc0HyT8Fzf6DZPNmjoE86YdjafB
	jOl5bUyGlk0ZQ4Kf+t89+yRiPd/HkYYFrsKldivu5cuDBZkLTjNHOkSse+sl6Sdw0FdO0FrP7f+
	GeW3xESaNQRRjnHqwtFlenPL5fNaX9LzuyTGGj1QD39ZefXRjRt1azQVZk2VngYOxTLXDosEtOU
	n4GFOgkp7sx4lZgMtSzh90Jkvgwpjf/pGGISNkG+lYpS
X-Received: by 2002:a05:693c:6087:b0:369:f420:8679 with SMTP id 5a478bee46e88-36a42440304mr1174873eec.38.1793315631951;
        Thu, 29 Oct 2026 16:13:51 -0700 (PDT)
Received: from debian.prasanth ([103.177.82.12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af1dfsm1662742eec.7.2026.10.29.16.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 16:13:51 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	tan.siewert@9elements.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	andrew@lunn.ch,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v10 0/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
Date: Fri, 30 Oct 2026 04:43:37 +0530
Message-ID: <20261029231339.9497-1-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
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

Add the board compatible and device tree for the ASRock Rack B650D4U
AST2600 BMC. The DTS describes memory, SPI NOR, UART5, GFX memory,
GPIO names, the I2C7 EEPROM/NVMEM MAC provider, MAC0/MDIO, and both
ADC engines with an ordered IIO-to-hwmon bridge.

This revision corrects regressions in v9's compatible ordering and
binding acknowledgement, restores the revision history, and addresses
the UART alias and DTS-style feedback. No new hardware is added.

Changes in v10:
- Restore the binding Acked-by from Krzysztof's earlier review [R1].
- Place asrock,b650d4u-bmc after the aspeed entries, as in v7/v8.
- Drop the serial0 override and use the inherited serial4/UART5 alias
  for stdout. Bootloader console arguments and getty must use ttyS4.
- Consolidate the root node and order peripheral references and ADC
  properties according to the strict DTS-style check.
- Restore the earlier history and discussion links below.

Changes in v9 [9]:
- Enable ADC0 and ADC1 with 2.5-V internal references and pin groups.
- Add the sixteen-channel IIO-to-hwmon bridge.
- Rebase onto the Aspeed ARM DT maintainer branch and normalize GPIO
  comma spacing. This revision inadvertently lost the binding Acked-by
  and regressed compatible ordering; both are corrected in v10.

Changes in v8 [8]:
- Correct the validation report to multi_v7_defconfig with ARCH_ASPEED
  and MACH_ASPEED_G6 enabled; retain the DTS and scoped review trailer.

Changes in v7 [7]:
- Correct GPIOP reset/power/NMI button/control names and remove the
  obsolete F5 reset name; leave the binding unchanged.
- Subsequent review requested the validation correction and carrying
  Andrew's review tag forward [R4].

v6:
- Prepared locally only; no public submission. The sent version number
  moved from v5 to v7.

Changes in v5 [5]:
- Add I2C7 EEPROM/NVMEM for MAC0 and select rgmii-id.
- Use the standard OpenBMC 64-MiB flash layout.
- Add initial GPIO names and the reusable 16-MiB graphics pool.
- Drop the previous RX-delay-only justification.
- Follow-up review requested GPIO mapping/style and threading fixes
  [R2, R3]. Andrew's Reviewed-by applies only to MAC0/MDIO.

Changes in v4 [4]:
- Correct memory size to 512 MiB and add explicit flash partitions.
- Report RGMII traffic tests and select rgmii-rxid; that delay rationale
  was challenged and superseded by the rgmii-id selection in v5.
- Order peripheral nodes alphabetically by label.

Earlier public submissions:
- v3 [3]: board-compatible/DTS series. Krzysztof supplied the binding
  Acked-by and requested preservation of review tags [R1].
- v2 [2]: early board DTS, including UART5 via serial4. Its complete
  per-version changelog was not recovered; the archived patch is linked
  rather than inferring an unsupported change list.
- Initial submission [1]: board binding/DTS, with QEMU console and
  board-identification testing reported in the cover.

Review tags:
The binding carries Krzysztof's original Acked-by address. Andrew's
Reviewed-by remains explicitly restricted to MAC0 and MDIO nodes;
no complete-board review is claimed.

Validation:
- Compiled and schema-checked the v10 board DTB with multi_v7_defconfig,
  CONFIG_ARCH_ASPEED=y and CONFIG_MACH_ASPEED_G6=y, using
  arm-linux-gnueabi-gcc and dtschema 2026.9.
- dt_binding_check for arm/aspeed/aspeed.yaml completed without
  diagnostics in the reported output.
- CHECK_DTBS=y reported no board-specific errors. Two unmatched-schema
  diagnostics remain for inherited aspeed,ast2600-lhc and
  aspeed,ast2600-i3c-global nodes.
- Strict dt-check-style and whitespace checks passed. Checkpatch reports
  no errors and one MAINTAINERS reminder for the new board file, covered
  by the existing Aspeed directory entry.

These are DTB/binding checks, not a complete kernel build or boot test.

Both ADC engines, twelve configured voltage rails and recovery after BMC
restart were tested in a custom Linux 6.18.24 OpenBMC image with the same
ADC settings. That image has separate power-control changes, a different
flash layout and ttyS0 console configuration. The complete upstream DTS,
including v10's ttyS4 console selection, has not been boot-tested.
Voltage scaling is userspace configuration outside this series.

Base: 8db593481c8669eddb8b4e21ea44f3fa11d9f030, aspeed/arm/dt
https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git

Previous submissions and review discussions:
[1] https://lore.kernel.org/all/20260512175019.47548-1-prasanth.padarthi10@gmail.com/
[2] https://lists.infradead.org/pipermail/linux-arm-kernel/2026-May/1129461.html
[3] https://lore.kernel.org/all/20260518033440.17569-1-prasanth.padarthi10@gmail.com/
[4] https://lore.kernel.org/all/20260830182036.284736-1-prasanth.padarthi10@gmail.com/
[5] https://lore.kernel.org/all/20260915013110.4780-1-prasanth.padarthi10@gmail.com/
[7] https://lore.kernel.org/all/cover.1790079398.git.prasanth.padarthi10@gmail.com/
[8] https://lore.kernel.org/all/20261002062933.26497-1-prasanth.padarthi10@gmail.com/
[9] https://lore.kernel.org/all/20261027034911.99482-1-prasanth.padarthi10@gmail.com/
[R1] https://lore.kernel.org/all/20260518-rustling-watchful-viper-b9c4b4@quoll/
[R2] https://lkml.iu.edu/2609.2/00630.html
[R3] https://lkml.iu.edu/2609.2/00642.html
[R4] https://lists.openwall.net/linux-kernel/2026/09/22/1982

Prasanth Kumar Padarthi (2):
  dt-bindings: arm: aspeed: Add ASRock Rack B650D4U
  ARM: dts: aspeed: Add ASRock Rack B650D4U BMC

 .../bindings/arm/aspeed/aspeed.yaml           |   1 +
 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../dts/aspeed/aspeed-bmc-asrock-b650d4u.dts  | 169 ++++++++++++++++++
 3 files changed, 171 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts


base-commit: 8db593481c8669eddb8b4e21ea44f3fa11d9f030
-- 
2.47.3

