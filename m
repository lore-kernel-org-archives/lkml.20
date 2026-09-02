Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8EB3546FA
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788359026; cv=none; b=r/1ytqnfXzduq/rf+SKTbaOw5PqtJfvssXfkGQPWnmIjpBvScDIO6ng3ajAoo/9nf5fswrE4lqKrAfN0UBCg7RzvN0+xztOjIWZ11LtoqiD6Qmf2YCX7SH7zVsaUTRPkjvlzkzZvLWpZ4almvJvWuhQdcF2ua8fqgGNow4wHqtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788359026; c=relaxed/simple;
	bh=bazdSdVkFZZU9ehtAhH1O8nQxtLezXXH6UQ5yUTF3Zo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gc7Fn3o12xSDmI4jWRVSTp5NVYp5ptDtsY8ENM9FUu2RNTjuiQyKLil3EByVQsbiaplqjcIiUtq6mUlnQvDmZbrKi5wjasWKwTfbcqhrGQrTHjLzcDrVEUTAFlwM84c3hC/nR3KmlE4stsBzS0meZz9CHkBo7DchqXTxZfNN/zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lgPfG7Tl; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lgPfG7Tl"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-484415c8bf2so896517f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 07:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788359023; x=1788963823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L94FOQ3G0uJhPS62upqaen8sZQWRd6241RfKRZzLwE8=;
        b=lgPfG7Tlbf6SW7kYhaT8tbwgXHUoMDGYRux6UbvuJ4p/pHdcmlVM+pOKztLvqbLt7t
         aRh6fbo8CYl0RoP7mxfBCKXIUXMA6JjZdlUac+pSxIX3KFq7TbLdlZtu0PiRzDN0FHDj
         QS7HD5dxeBKj/XlwNwam+X1nCBqx50xXfmwlEJ91jqjA3sEp9INVnDrfo0l7eZq/8/Mx
         RFLjtPrVRE/HrnDA4HQ4ZjZZYwPByZtLrkZpqsnrFtpniBJQ8gbc9r8F+Ps0XV+HY6L9
         nMWN8d4BAdn5mgt8BdXtxFxf46tmm/iA31WaTGcNAJ/J4pcljQKZKlyBiiulfJBCHDyD
         j+9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788359023; x=1788963823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L94FOQ3G0uJhPS62upqaen8sZQWRd6241RfKRZzLwE8=;
        b=SIoEPb34Hibp/6klES3yH6Lrkqcmuy9yajUwUf+8pvJ7kX/JYDXvvD6XEX+uD0+BzB
         LhKFpfsqUGpyjFJ55kugzQ2FBQ3e2Ax+ujCkMZgcXrXit3NISVUqtb684TTWqjd/y9Zo
         q4DFLlNDzr77VRDE3qi+IEkCn/N7MxuPQ5qX+A4VlWKKoBgAf33DHj6gaJFfySSqt3S+
         AACJv1E5ZQe/m8m1DSMCoju1e7liCeuF/jj7ms+0sXb7E8owCvcBWbm9ts4Q+Va+88ug
         5+X8hByY7luqWUEfjbKv/8Q5swykisEam2VLTBM7OJ6RftwtRD0AldsHWw5YQDPcMD0R
         uGQQ==
X-Forwarded-Encrypted: i=1; AHgh+RoGaSIpsO0+cLuLTnptCRQQ0PPiu2DNtwZFxws4JcfWu/TQEoUU1e+DNPod4r1wt+OgCGe2QCrntieUikY=@vger.kernel.org
X-Gm-Message-State: AFuF++l/0/DUau4HkoMno8pBhSMPAfFnAFMGqrhZ1tp4Fz3ZmVTCZnL6
	GekcjqydH8qTswjJbF+TTTnNCEGZNCKzUcbr5gmrT3mSCcagnnLRkqjtMcXP4A==
X-Gm-Gg: AR+sD114q6EEjCexkvJQsRc0h5wPwcInQUBP0r8KatMcoc9t5mFWNr7YBvK8a33pDVC
	1C+5t0m+p3lP1zagvjH6N5NFc0xqIaAqi/73vavAImc80PsgrgL9W8Fg9jEnRTJPRFv5eocVcep
	T3QtAV4d8coxWraSn1r5u/nNbIDMc5II4TaJ5S+wLGyrmL1/8+gYFXKwAR4WZq08pHp34GiFpOG
	jbhajq7SDJedNc2i0ZSi8c9O0aPHTbsk5BT7lYq/Y2PFawr+dO7YLAD+KrTLB7G4EQON6yocoCQ
	LMYVoegYwlAm2pnqG/pwrZ5ds9EVww2r+Qit6oIkkNmuplYX2rVG4Unc46fNf+1FQJWcc76OUy/
	iiz8jhAecBsW5en9eQR4Af+7Fwc/2ouKkZP0FzWBHze76bJI49xx127J0x/Z+39jtqndIeXBvMd
	yHxT3lvGjeeWIzPGVKPJNYtaf0WigDJ/rU1liXVQFNd20frQQ/qqT+Ja7OYlkG+ccodiUhOqtZl
	UQCWPqoQBf+Bk9EbzMOSEe60Bgeqt2iNhUwTODZ9eTxC0+QMSwopsPf2IVt
X-Received: by 2002:a05:600d:19:b0:49c:edd8:ba35 with SMTP id 5b1f17b1804b1-49cedd8ba5emr17433485e9.6.1788359022654;
        Wed, 02 Sep 2026 07:23:42 -0700 (PDT)
Received: from raviolimobile.tail5f26fd.ts.net (mob-83-225-30-215.net.vodafone.it. [83.225.30.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5927b68sm58999265e9.1.2026.09.02.07.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:23:41 -0700 (PDT)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	dan.scally@ideasonboard.com,
	linux-kernel@vger.kernel.org,
	Fernando Rimoli <fernandorimoli11@gmail.com>
Subject: [PATCH v5 0/7] media: Enable the OV5693 front camera on IPU6 Surface devices
Date: Wed,  2 Sep 2026 16:23:14 +0200
Message-ID: <20260902142322.73523-1-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831181858.325109-1-fernandorimoli11@gmail.com>
References: <20260831181858.325109-1-fernandorimoli11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ov5693 front camera does not stream on IPU6 Surface devices. The sensor needs
its MIPI clock lane gated while idle, which needs a driver change and a way for
the ipu-bridge to ask for it per IPU.

v4 is at [1]. This addresses Sakari's review of patches 3, 4 and 5, adds the DT
bindings property he asked for, and adds an Alder Lake-N entry now that a Surface
Go 4 has been measured.

Changes since v4:

- New patch 3 adds "clock-noncontinuous" to the ov5693 DT bindings. The series is
  now seven patches; v4's patches 3 to 6 are 4 to 7 here, and the Tested-by tags
  are scoped to those four.
- Commit messages cut throughout, per your comments on v4. Patch 5 now carries
  your wording and nothing else. Patch 4 lost the ov5647 comparison and the
  per-machine failure detail, which is below instead. Patches 6 and 7 trimmed.
- Patch 5: the running index starts at 0, each call site passes its own property's
  maximum index rather than a shared one, and the macro is IPU_BRIDGE_NEXT_PROPERTY
  with the enum renamed to match, following mipi-disco-img.c more closely.
- Patch 6: struct ipu_sensor_config now carries a zero-terminated list of IPU PCI
  product IDs rather than a single ID, so one entry covers several IPUs. The flags
  macro argument is a plain value, so flags can be combined. The scan of the whole
  table is gone: entries for one HID are adjacent with the IPU-specific ones first,
  and the generic entry is skipped once a specific one has matched.
- Patch 7: the four entries collapse to one shared ID list, with Alder Lake-N added.

On the enum naming in patch 5: "s/SENSOR_EP/BRIDGE/" taken literally gives
IPU_BRIDGE_BUS_TYPE, but since the macro is not endpoint-specific and may later
serve dev_properties, I kept the group marker as IPU_BRIDGE_EP_*, which is also how
mipi-disco-img.c separates its EP and DEV entries. Say the word if you meant the
shorter form.

Unpatched behaviour, which patch 4 now only summarises:

Four people measured it on five machines and it is not uniform. It is absolute on
three (a Pro 9, a Pro 7+ and a Go 4). On another Pro 7+ it is intermittent, 3 of 20
opens delivering frames inside a single boot, with the successes at opens 1, 7 and
14 and the sensor runtime-suspending in between. On a Pro 8 the first capture after
a cold boot succeeds and every later one in that boot hangs. No mechanism explains
the spread: it is not once per boot, given where that machine's successes fell, and
it is not Tiger Lake versus Alder Lake, since two Tiger Lake machines fall on
opposite sides. The sensor is up during the failures on every machine checked: the
privacy LED lights, the failing runs log no CSI-2 errors where the working ones log
ten or more, and setting bit 5 over i2c on an already stalled stream starts delivery
immediately.

**If you verify this, capture twice.** On one of the five machines a single capture
immediately after a cold boot succeeds without the flagged entry, so the obvious
check gives a false negative. Both testers who hit this asked for it to be written
down.

Two other things worth knowing:

- The teardown "stream stop time out" appears identically with and without this
  series, so it is pre-existing and not introduced here.
- checkpatch flags "Macros with complex values should be enclosed in parentheses" on
  patch 6. The pristine header already trips it five times and the patched header
  still trips it exactly five times, because IPU_SENSOR_CONFIG becomes a wrapper as
  IPU_SENSOR_CONFIG_MATCH_FL takes over the compound literal. No net new instance.

Testing coverage, all scoped to patches 4 to 7. Patches 1 and 2 are not exercised by
the testers, whose machines enumerate INT33BE; the Pro 9 is the OVTI5693 machine.

  Tiger Lake   0x9a19  Pro 7+ (Jakob), Pro 8 (Fil Dunsky), Pro 7+ (Lucas Lis)
  Alder Lake-P 0x465d  Pro 9 (mine)
  Alder Lake-N 0x462e  Go 4 (Kengo Oki), 0/300 without the entry, 300/300 with

Kengo Oki's Alder Lake-N result is what justifies the third ID in patch 7, and his
tag is given for the version that carries it.

The reworked bridge in patches 5 to 7 was also run on the Pro 9 with all three of
its sensors: three cameras connected once each with no double connect, link
frequencies unchanged, and the front camera streaming at 28.63 fps, which is only
possible if the flag reaches the sensor driver through the new per-IPU match.

The Pro 9 measurement of 300 consecutive opens predates the switch from a full write
to cci_update_bits(), but the register reads 0x00 first there, so it resolves to the
same write.

[1] https://lore.kernel.org/linux-media/20260831181858.325109-1-fernandorimoli11@gmail.com/

Fernando Rimoli (7):
  media: i2c: ov5693: Add OVTI5693 ACPI HID
  media: ipu-bridge: Add OVTI5693 to the list of supported sensors
  dt-bindings: media: ov5693: Add clock-noncontinuous
  media: i2c: ov5693: Gate the MIPI clock lane for non-continuous clock
  media: ipu-bridge: Assign endpoint property indices dynamically
  media: ipu-bridge: Match sensor configs per IPU and add config flags
  media: ipu-bridge: Request non-continuous clock for ov5693 on IPU6

 .../bindings/media/i2c/ovti,ov5693.yaml       |  2 +
 drivers/media/i2c/ov5693.c                    | 25 ++++++
 drivers/media/pci/intel/ipu-bridge.c          | 83 ++++++++++++++++---
 include/media/ipu-bridge.h                    | 50 +++++++++--
 4 files changed, 141 insertions(+), 19 deletions(-)


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.43.0

