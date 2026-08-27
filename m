Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A52023E334
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 20:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787861783; cv=none; b=fSXgpfBfcQ8ayt2q5MbpdER31ZqPat04RKKEHuZkM+D88ykjZ+yVad6zGTVlBw81Ca3TyD49+EXI8uEZvMIqwCPRcGadw2Un+juaf7z3ATTsLGd/2ka/75R5lGUIY2BCnYB0mIQWN9FVTgfI2u2ttBYEU45n9nUL54ztWrhiJbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787861783; c=relaxed/simple;
	bh=sEs1+3kv0SkL/kcWY1NDLycL1KPJmbmndgHyx4qL61g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rekKxbRTddSccr9PTcOT6/n447mFMU26QXpZZoU3mFfoQ+Yc5nzgKboOFgpGGg603D4Qf4JvFGDn/qy8xGs8OR9Qgd5wnbhwXskHS9kPiAkWkJtZUBZN2vbhTgtCtMVgi8TrPrWz6XnpRyNF1khQ4rxKK88OUhjbvOOLaat/+aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bzB1zxkn; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bzB1zxkn"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4815bce4652so205778f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 13:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787861778; x=1788466578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iXvKxCRwrOA7zm77R1LkD/sIJDTYXZSfnd5GgnuNsQ4=;
        b=bzB1zxknVUtP2CuBxGVrX72cK6cbH/viUI0W7h9zhGStWyXwHB199KwIQGyKim198z
         ax6vnw+rJB/JYJ+F4FfQKB46CU0SvuRDevmVpdaJVjal09mQOx16V19ctJ459Mq38KHf
         wuUvN7cGFumLOPBYaIINnTlxICPJ8hqGmqNiA9LeiP00m80yBKvI0Aghf4QpkXTJ0RvL
         aap7zALyzUYglJx1uWRJW2G0mKLN0KF6h0EMx/fpFwWRQtILdUXfT7deZM6qPs2zgvc+
         1cGCrF15MeGl8gTCQDgEHESFqTNbWVqYp94xdgQwPNVHdDpWh5bZWPjdL7kBI43wlGIC
         8PlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787861778; x=1788466578;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iXvKxCRwrOA7zm77R1LkD/sIJDTYXZSfnd5GgnuNsQ4=;
        b=DHeEeb1PxTx/OvYR91+DJY9LIZQb42AAHRJrpvqgJij1MB33weRG4FDR4kHEDKvyqB
         99dtBAjd4XCo1GtgLYkxFzXVkzSBed9qDpG0zzwiC8FLrbEOBIv30+iXAHfqpmZPFrsJ
         Ju4D3g6x3EqMrevN8GUzEqytmfdAssuJIiOQhMn0IkOWPhqK8i1uDOv+TrwrNlZCNFw1
         hvS/m7cIUVuO96cALE9A5p9ztYzCihXbd7kt7b1PRjWUnjizF2QZUbG30+3NzVNasHuP
         WxSRiyPnPfIRJ+azB14l/I4TryMi0EEDQOtXK1qnpM/xWkPQyBc9e61Uzcu8Yz7i0XMh
         jR7w==
X-Gm-Message-State: AFuF++kBcC1kWzsoire6lF4Y1xjefT/XURMT80l/Sj9BCKbterEMvfMd
	AoHcXxZdTlJScM5WgZ8J0fZs50cbmU7/cEkEUUVHMadevlsxSVuEAvY8u9kqpX8VZ0/HfQ==
X-Gm-Gg: AR+sD13QUCZYxZAvFhbIeQVhk1gMcIG+iwrjy8yEWX/f2vE/14Kg5YKDbTHXSdbfZA8
	vxJa/lmPkHzSnMOO/ihQGnCP6zHIydyoKZv6a/TaP9LIvuY++7QZSbDPKjzIwU5bUlq9TSaAgBr
	M0HScEZHr8Av5LDVTE/gaeuvG72uLwi/rEtpHeyLviy39RzJN5uVpUIlYhnxdAJMy3o/+p1YVpc
	EzeA2wM2Sas33jmjEGsiiwcCp/vZ8gcqAbJ1FS7rHiwOgZV+0dT6hvy4iKsRL7/ar+587o4DmUR
	JTDxGROsMS+dITlZVypI19jrwXwpGif1wKfGC3rQ2Qhi1nRaH5mw2OpUV+hI5JEdwqh8fN9JGYI
	BtdU/K+rPaflqub4ygxNJfsgl2oa/XAU/0dsgP/GM2s5DRDB9waMO8dHHI1yNqjBqIUTtbLIn5o
	khbG8RQldPKUpFCaFpWJ+eXN2IKByDSi00M/Q06nk5I8FMJLbRWfoDscZT
X-Received: by 2002:a05:600c:1d15:b0:499:d366:f572 with SMTP id 5b1f17b1804b1-49b91c4338cmr17257705e9.10.1787861778225;
        Thu, 27 Aug 2026 13:16:18 -0700 (PDT)
Received: from TC-LAPTOP ([2a01:e0a:b8a:2610:8824:7cb0:614c:86fd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4961004bsm91899855e9.4.2026.08.27.13.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 13:16:17 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: hansg@kernel.org,
	lee@kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andriy.shevchenko@intel.com,
	v.vitovt@gmail.com,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v9 0/6] Enable cameras on Dell Latitude 5285 2-in-1
Date: Thu, 27 Aug 2026 22:16:05 +0200
Message-ID: <20260827201611.99825-1-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series enables the front (OV5670/INT3479) and rear (OV8858/INT3477)
cameras on the Dell Latitude 5285 2-in-1 under Linux.

Per Documentation/process/coding-assistants.rst: this work was developed
with help from an AI coding assistant (Claude Code, by Anthropic). I used
it to help reverse-engineer the ACPI/TPS68470 bring-up, iterate on the
board data, and draft these patches; I have reviewed and tested all of it
on the hardware and take responsibility for the result.

The series is interdependent (all six patches are needed for working
cameras) and touches three subsystems: mfd (patch 1), platform/x86 int3472
(patches 2-4) and media (patches 5-6). It is probably best merged as one
set - for example via platform-drivers-x86 with an immutable branch that
the media and MFD trees can pull. Lee, an Acked-by on patch 1 (mfd) would
help enable that; I'm happy to follow whichever merge approach the
maintainers prefer.

Changes since v8 (addressing Andy Shevchenko's review):
- Patch 1: correct the subject prefix to "mfd:"; carry Andy's Reviewed-by.
- Patch 2: fold the reverse-xmas-tree reorder in with the unsigned int
  conversion, so it is no longer left over in patch 3.
- Patch 3: introduce a local "struct device *dev" and use it to shorten the
  board-data lines; return -ENODATA rather than -ENODEV when the board data
  is missing.
- Regenerated as a single coherent series (one tree, git format-patch
  --cover-letter) with a proper diffstat, and sent as a new thread.
  Apologies for the malformed v8 posting.

Earlier changelogs are in the v7 and v8 postings:
  v8: https://lore.kernel.org/all/20260826112452.13539-1-tchatard@gmail.com/
  v7: https://lore.kernel.org/all/20260819140107.1329091-1-tchatard@gmail.com/

Tested on Ubuntu 25.10 (kernel 6.17.0-22-generic) and Ubuntu 26.04 (kernel
7.0.0-30-generic): both cameras working in Zoom, Chrome, and GNOME Camera
via PipeWire. Also independently tested on the closely-related Dell Latitude
5290 2-in-1 (same IPU3/TPS68470/OV5670/OV8858/DW9714 stack) by Vitalii
Tytskyi:
  https://github.com/vitovt/dell-5290-camera-kernel/tree/master/patches

Thierry Chatard (6):
  mfd: intel-lpss: add resource conflict quirk for Dell Latitude 5285
  platform/x86: int3472: tps68470: use unsigned int for GPIO lookup loop
    counters
  platform/x86: int3472: tps68470: fix clock consumer registration for
    Dell Latitude 5285
  platform/x86: int3472: tps68470: add board data for Dell Latitude 5285
  media: ipu-bridge: add sensor configuration for OV8858 (INT3477)
  media: ov8858: add ACPI device ID INT3477

 drivers/media/i2c/ov8858.c                    |   7 +
 drivers/media/pci/intel/ipu-bridge.c          |   2 +
 drivers/mfd/intel-lpss-acpi.c                 |  32 ++++
 drivers/platform/x86/intel/int3472/tps68470.c | 109 ++++++-----
 drivers/platform/x86/intel/int3472/tps68470.h |  10 ++
 .../x86/intel/int3472/tps68470_board_data.c   | 170 +++++++++++++++++-
 6 files changed, 281 insertions(+), 49 deletions(-)


base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
-- 
2.53.0

