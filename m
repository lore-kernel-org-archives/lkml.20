Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C824A1DFF
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788200351; cv=none; b=cqDAxXdfGalyZjTFKnxqGI7Q3SmWlyjnEtxzlYUqaJgK1a8J5iisxDopccmKKkpjWkFyTaUmtHwWO4bkD7qdEB6ERixMalemvG/NOJ50GsM7cEptn/S40M5ylUjJAZzRu873ng7w1qc0Yq+LFjBiaeh6lc4f5AitEZkXKm/xAgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788200351; c=relaxed/simple;
	bh=WeLFcmLA+PEhQHoDsZ64mr9C3T9iy9lVA1j3HwlJKTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OPM7C8GuNAGEdDFcveDJP237v8EfxuKE+tJKspvDQlnwyYh9zmrwnD9OIKpAaDlYsLVtqc0yXztd+rtQ9aZpY+rU+ovnzYLQNA3yobo1AG6fIqCy+KvCkGeHpejkXRCFJ0zJjKSZjHm8Kn4SYF6xfT+aqNRKpDisUC4zFAbwI2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e7E9Macs; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e7E9Macs"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49b0dbfbf7bso27503085e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788200347; x=1788805147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YXzJlXmvBQaDFAHS7wJcExo0wJr0U4H2R7PpT7OWtKg=;
        b=e7E9MacsGqyN4M/qqJDTRcG1+fcwuf5fPDyOm34E8gH0dsV2j7PY8UYLn2EMvaxaRj
         QosUl0PWfk1Gz5B5F/zRyqSlNGtMpdB4ZC4DfLATrNZKoC7g6bZ6dl/3W6iEUNa6sFVu
         0OjpBLrlbojaTBLEPI2FCl0Ds8tRsehJXd7dMpWpKFQ250TnRv3HY/trGxR1w2q4qp48
         +dRFq4qrPnYucbDh1KR+v8tzKEH0YOwpi0XByer6cAlBQTH6fcei5pXE4erNK1g8P6+e
         vVjRR7omyp5xREi4oMTVE5LcTy/Ab+VqJEbiQQaNwVLIcqMR5hPS/VhEh/Frz4/hCA0z
         /hBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788200347; x=1788805147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YXzJlXmvBQaDFAHS7wJcExo0wJr0U4H2R7PpT7OWtKg=;
        b=m/syjqnOV/15wAB6PerYyrpc1ZVAGivFF9t6oY7zOX24f7vaVmGiuFd8cl8q90KGp0
         eAcPJX3lEWH+ihso/p/XK2lnPNJPbHpaxgp5HPh2hwbIZsS2n2Ayd7nxXOQG+69dfUph
         V0TKyY/ZDI32tJM3P1G9DHtJWA5N5wTEZWc4emSJ+xyOiV0wK3MWq96186KQSp4mEYfZ
         yNlb8APqAiF9SS5XZKcnLWDl05uT1pygRZP3pTgI85yMp/HNjmIKoivlj5Q+cmYUaSKa
         s3FHjcazlvs9oAo+l39TWN3bUKXHTDKm9i6SPlI4IRo2G14E4OE4Xg9WbDp8aV0Hoafb
         pWyQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq50CfjCLqgSFeT5ahF6LDGscZ/Iz/ECnZQWyNE2+SzbKwnSAfJfEMhPjpyxBWnJ1TfKEiHlQnDeCpHzO0=@vger.kernel.org
X-Gm-Message-State: AFuF++lI8wL/cowf/fbh8JRT0dxnThaE49+8mtDjlsUneBrNVOG6xFkl
	Vn3xXKR3r+RhvizeoYW8ItpR4EDUmOFAuHN5f/em2eOjFvHp/2eh94WK
X-Gm-Gg: AR+sD11wANgR9V7PhcqbMmovtceZZ9MWPGFjCPEy9y/5Y0Y395i1Eb17jlEurUI/y1D
	CpqI4QAn1oqPV4WB+baqjrbQ4+Qhksi58ZXYI9g0MS9eGEH+AzRL3oCpVNbaRO8OVfIRfzEGZgW
	xNE7aIIQzn3phKxlKIYNHCMLLJTE0LgXz+voTfnQWQhOvVDEPQihDKCn7eqSZ+av5NVeRX5nB3o
	Ho2ihPpXQvzI+Skqqizb5QpHjeG6Mj7x3CWktQ/58JvUnPjOifkG+BL9hnFBNjbjV2dpOrc8qJJ
	442rm4jwqRK0iWM3qvqX24nOm+x8qahgkZYORauctBOLf1IGW4a/muI795TBlZ92MskQ9eTVXTz
	UQrxB8aiiA3kt7m9naUQQOtbxHGZg0g5u3qMSkGtX58hQKBBYPMrPu3jglBlfFR/Yo0yp6et9xc
	ccOOtsIyudKeydNyT87v6agRrhLw3N6o54yMqmsWjnaKd/EJiN0I9/5WBeN/Wn8KHNmY0W3xNE9
	VvGQ6Tk0ydv+6ejDMZ8XSA=
X-Received: by 2002:a05:600c:3b13:b0:495:4d5c:903e with SMTP id 5b1f17b1804b1-49cdc4332d4mr46679415e9.7.1788200346684;
        Mon, 31 Aug 2026 11:19:06 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:5d3a:fe75:a74b:bc2a:bdfb:30ff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce3e4e7sm9041965e9.9.2026.08.31.11.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:19:05 -0700 (PDT)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Arsalan Naeem <naeemarsalan@gmail.com>,
	Jakob Berg Jespersen <dev@berg.pm>,
	linux-kernel@vger.kernel.org,
	Fernando Rimoli <fernandorimoli11@gmail.com>
Subject: [PATCH v4 0/6] media: Enable the OV5693 front camera on IPU6 Surface devices
Date: Mon, 31 Aug 2026 20:18:52 +0200
Message-ID: <20260831181858.325109-1-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720163819.104130-1-fernandorimoli11@gmail.com>
References: <20260720163819.104130-1-fernandorimoli11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This enables the OV5693 front camera on Intel IPU6 Surface devices such
as the Microsoft Surface Pro 9. Six patches on a stock kernel:

  1/6  ov5693: add the "OVTI5693" ACPI HID so the i2c core binds the
       driver (these devices enumerate the sensor as OVTI5693, not
       INT33BE).
  2/6  ipu-bridge: add the same HID so the bridge builds the sensor's
       fwnode graph.
  3/6  ov5693: gate the MIPI clock lane when the endpoint requests a
       non-continuous clock, which the IPU6 CSI-2 receiver needs to
       lock.
  4/6  ipu-bridge: assign endpoint property indices dynamically.
  5/6  ipu-bridge: add per-IPU sensor config matching and config flags.
  6/6  ipu-bridge: use those to request the non-continuous clock for
       the ov5693 on the IPU6 variants that need it.

v4 restructures the bridge side per Sakari's review of v3. Instead of
the ad-hoc "is this the ov5693 on an IPU6" helper v3 had, struct
ipu_sensor_config gains an optional IPU PCI product ID and a flags
field, so a sensor that needs different treatment on different IPUs is
described by the table rather than by code. Patch 5 adds that mechanism
and patch 6 is its first user. Patch 4 is the prerequisite Sakari asked
for: endpoint property indices are now assigned through a running index
in the style of NEXT_PROPERTY() in mipi-disco-img.c, so a conditional
property no longer depends on the sensor having a link frequency.

Patch 5 introduces one semantic I would like checked: where both a
PCI-specific and a generic entry exist for the same HID, the specific one
wins and the generic one is skipped, so the sensor is connected once
rather than twice. Doing it the other way round would consume two of the
four IPU ports for one sensor.

On the register value: patch 3 now sets only bit 5 (clock-lane gate).
Sakari asked whether IPU6 worked without bit 2. It does, so v4 drops it.
For the record, sweeping MIPI_CTRL00 at runtime on a Surface Pro 9
(IPU6EP_ADLP, sensor as OVTI5693), 3 trials of 30 frames plus a
300-frame stability run per value:

  0x20  bit5                    300/300 frames, steady 28.6 fps
  0x24  bit5+bit2               300/300 frames, steady 28.6 fps
  0x2d  vendor value            300/300 frames, steady 28.6 fps
  0x00  power-on default        0 frames, "stream stop time out"
  0x04  bit2 alone              0 frames, "stream stop time out"
  0x10  bit4 alone              0 frames, "stream stop time out"
  0x30  bit5+bit4               2 frames, stream collapses
  0x34  bit5+bit4+bit2          2 frames, stream collapses

So bit 5 is necessary and sufficient, bit 2 makes no difference, and bit 4
actively breaks the link. That last one is why this differs from ov5647's
value for the same register even though the mechanism is copied from it. A
bit5-only value recovered to 300/300 in the same run after the bit 4
failures, so those are genuine value effects and not a wedged link.
Register read-back confirmed the power-on default is 0x00.

This was reproduced independently on a Surface Pro 8 (IPU6 0x9a19,
sensor as INT33BE) by a linux-surface user [3], 30 frames per value,
every value read back after writing:

  0x2d  vendor value (control)  30 frames, 28.65 fps
  0x24  bit5+bit2               30 frames, 28.65 fps
  0x20  bit5                    30 frames, 28.65 fps
  0x0d  0x2d with bit 5 clear   0 frames
  0x08  bit3 alone              0 frames
  0x04  bit2 alone              0 frames
  0x01  bit0 alone              0 frames
  0x00  power-on default        0 frames

The 0x0d row is the one I could not produce myself: everything in the
vendor value except bit 5 fails to stream, so bit 5 is necessary and not
just sufficient. That second set has two limits. It was produced by poking
the register over I2C into a stalled capture rather than by running this
patch, and the write lands after stream on rather than before. So it
confirms the value on a second device and IPU generation, but says nothing
about the plumbing. The patch itself is tested on the Pro 9.

Patch 3 sets the bit with cci_update_bits() rather than writing the whole
register. The ov5693 does not otherwise program MIPI_CTRL00, and this
driver also serves IPU3/CIO2 and Rockchip platforms, so modifying one bit
leaves anything the platform put there intact. On the devices here the
register reads 0x00 before the write, so in practice the two forms are
equivalent. I went with the narrower one because it claims less.

The write is issued at each stream on rather than once per power-on.
That placement seems to matter in practice: in the same thread [4],
setups that write MIPI_CTRL00 once from userspace lose the binned
1296x972 mode, which reprograms the sensor, while setups that write it
from the driver at every stream on keep it.

Patch 6 sets the flag for two IPU6 product IDs, the ones the gate has
been exercised on: IPU6 (Tiger Lake, 0x9a19) and IPU6EP_ADLP (Alder
Lake-P, 0x465d), for both HIDs, four entries in total. The combinations
covered by hardware are OVTI5693 on ADL-P (this series, Surface Pro 9)
and INT33BE on Tiger Lake (the register value, Surface Pro 8 [3] and
Pro 7+). v3 matched all of ipu6_pci_tbl; with the IDs now spelled out
in the table I would rather list only what is confirmed and add the
others as reports come in. Surface Go 4 (ADL-N, 0x462e) is the likely
next one.

Patches 1-2 are independent and useful on their own for enumeration,
and both carry Dan Scally's Reviewed-by (patch 1 from v1, patch 2 from
v3).

Dan, Jakob: patch 3 changed since you reviewed and tested it. 0x24
became 0x20 and the write became a read-modify-write, so I dropped Dan's
Reviewed-by and Jakob's Tested-by rather than carry them across a
behaviour change. Happy to add both back if you are still content with
the narrower write.

Dan, on your v3 4/4 question about matching on PCI ID and sensor being
quirky: agreed, and patches 5-6 replace that with per-IPU entries in
the sensor config table instead. That also settles the IPU3 question you
offered to test, since IPU3 keeps matching the generic entry and never
sees the flag. No need spend hardware time on it on my account.

Two checkpatch complaints in this series are deliberate, in case they
show up in a report: patch 4 trips "CHECK: Macro argument reuse
'index'", which upstream's NEXT_PROPERTY() trips identically and is
inherent to the pattern; and patch 5 trips "ERROR: Macros with complex
values should be enclosed in parentheses", which the existing
ipu-bridge.h macros already trip five times over. Parenthesising a
compound literal would break the designated initialisers.

Changes since v3 [1]:
- Patch 3: write only bit 5, dropping bit 2 (not needed on IPU6);
  OV5693_MIPI_CTRL00_BUS_IDLE is gone rather than renamed to _LP11.
  Set the bit with cci_update_bits() instead of writing the whole
  register. Moved the register-sweep evidence from the commit message
  to this cover letter, and added an independent sweep on a second
  device and IPU generation. Dropped Dan's Reviewed-by and Jakob's
  Tested-by (the patch changed behaviour since both were given).
- New patch 4: assign endpoint property indices dynamically.
- New patch 5: PCI ID + flags in struct ipu_sensor_config, with
  IPU_SENSOR_CONFIG_MATCH_FL() and most-specific-entry-wins matching.
- Patch 6 rewritten on top of patch 5: the HID-strcmp plus
  pci_match_id(ipu6_pci_tbl) helper is gone, replaced by table
  entries. Scoped to the two tested IPU6 product IDs instead of all of
  ipu6_pci_tbl.
- Rebased onto v7.3-rc1.

Changes since v2 [2]:
- Reworked patch 3: gate the MIPI clock lane on the
  "clock-noncontinuous" endpoint property
  (V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK) rather than writing MIPI_CTRL00
  unconditionally, following ov5647. When the flag is absent the
  register is left alone (IPU3 and others unaffected).
- Added the ipu-bridge side that supplies the property.

Tested on a Surface Pro 9 (IPU6EP_ADLP): with the series applied the
front camera streams 300/300 frames at 28.6 fps. That testing predates
the switch to cci_update_bits(). The register reads 0x00 before the write
on this hardware, so both forms resolve to the same value and I have not
re-measured it. Each patch builds without warnings on its own, at W=1 as
well, so the series is bisectable.

[1] https://lore.kernel.org/linux-media/20260720163819.104130-1-fernandorimoli11@gmail.com/
[2] https://lore.kernel.org/linux-media/20260717132021.18034-1-fernandorimoli11@gmail.com/
[3] https://github.com/linux-surface/linux-surface/pull/2171#issuecomment-5298352360
[4] https://github.com/linux-surface/linux-surface/pull/2171#issuecomment-5372616619

Fernando Rimoli (6):
  media: i2c: ov5693: Add OVTI5693 ACPI HID
  media: ipu-bridge: Add OVTI5693 to the list of supported sensors
  media: i2c: ov5693: Gate the MIPI clock lane for non-continuous clock
  media: ipu-bridge: Assign endpoint property indices dynamically
  media: ipu-bridge: Match sensor configs per IPU and add config flags
  media: ipu-bridge: Request non-continuous clock for ov5693 on IPU6

 drivers/media/i2c/ov5693.c           | 25 ++++++++++
 drivers/media/pci/intel/ipu-bridge.c | 73 +++++++++++++++++++++++-----
 include/media/ipu-bridge.h           | 51 ++++++++++++++++---
 3 files changed, 130 insertions(+), 19 deletions(-)


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.43.0

