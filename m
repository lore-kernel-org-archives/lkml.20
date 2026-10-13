Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCFD4F68B7
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791895187; cv=none; b=Jwuz7rh6Ox4Rfvo+P4LCY9FlmiJdOxrRxN4AxAUmZ/N87F09wK+4fYuWbBTH0vCUzQiEPqjiAbfNdEUS5BUkxx7HWe2WLru09l5HwcYmheYhdPPFmlDXrSzN7HmDeCseAMvBRJPTORqlptqYlwUcC9A9DTXkjmPdcp29Px8X1Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791895187; c=relaxed/simple;
	bh=aTmjXjJ6hKV1sW2eiPQlZVKg6oxo9CXTmfCOnYeU0CY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Kr4h+Jm5akU8MS8KwD3Ya9y4dff7RSNHnyIafPWOLbHMJc/h6/iub81qd4UN3WN9mBHB15nawmtiRaZI7pLltgPxOv8R4y8eIoyfjtCIqz3Z8VP5YKaNUlaWzdEensMQinheSopkV0t3dPO+2VO72E0NKycSWric8TPjGpWoyDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LKEOvseq; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LKEOvseq"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48b02a2359aso2739815f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791895185; x=1792499985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ks3p5RPBRw4A8G+7k+gqUrfe8aHMaRZX4Sxb6Rgzl4I=;
        b=LKEOvseqbwA6p7UUUDvPzwEACUXmf63Lpnx0Ufec63BMemznOJMCSwmpjqNdEs+Y2u
         MREcmOchmRpY/LDs+qPfwKgsRhG92UD13lC+StJVrwM985ABANiqD8/fisohX9GaErrI
         QvBnCi+md1QpJqxwgnnTdVBCIn144tq+aQMfUprYsTEsh3p9r4uNWe8t7HSqDojcu+ps
         ACIs+3Sz85QYClkNRnJdV3JFLy1Cdd9WHgpEKrmJ1Zc0GsV+BBgrV7GSbmeOEeqO0aaY
         AVGn3RmKpwLPgvkpo/LCv2p9kFYoc5SzyFRrqO13z60HvQnL1GhzjVGiscQl4IUi6oBt
         Wk8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791895185; x=1792499985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ks3p5RPBRw4A8G+7k+gqUrfe8aHMaRZX4Sxb6Rgzl4I=;
        b=HZdzd+GIoTkn2if9gNuOsEGR3emYCb8Z/8LSputvrPwIjfZ+5H0qpsLf3OLpkBJo+r
         BgaGTcbADO5gbhRkk5NcMSZc4fJOOT6zE0HS/NNDM9VcPu6DekCkO/uaEyxZQV8QXxHH
         xzWkp2oIDlGN979TsJP9QCHZt+feQ5RC2HEdcvrDZzxNjit5vZC5Ndw4RgHahmAjUEdG
         8vArtSCpZJc3ED3q72S17u/QIRhWN8wAasK+NBgmk/ZyoTdL1mxaQO4N3RxKq7lUAeqh
         IXAUeQdzNgBe60WqJr9iC3O8Zpe8UjKTp0f4GGviPE3HytawtIFoUrzBsNPDGzdOrjNb
         tA9g==
X-Forwarded-Encrypted: i=1; AKwUvBx3utOPmvsyAyT1Ty6EUCnpGS5MI6GiBiuSXHPDeR85N5ItFp7d4Jd++ZRqs0O7STtP95a0Gq/ouaCbouM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwK7WVAG/WGpea/HateK2vtiB2cFqy6a3jLRrMHUnn4qfAxWIF
	F0h+7miEEV7SEUloRrKxQeS6Ety+6qzsvbstnhjy345M8dJl+T1bqkn6
X-Gm-Gg: AYBFou3RB7ocu2VzY1OI/FEE7LJ+m8a4f37I2eI+g4E6JZGQ30b2eAz4SqlvHNPYUwP
	+5ezMgMBVWX28rhhtfsy5oCmZBKovNVmYs25plAJfDP3lSksJxzrtz1vlMqFdzs1GLrRLgmaGPP
	TS9RBJ127ApvoApn8uRDjBj2Tx7IozPmwq0yb37inej4IT1DFAy2VJBStojCgP7FWBPwQfqmm3i
	eU9Am4Pxy+K9AjeQnh+cZVSm6PUmjSL1hf/lCVI00vhN3zu3oVyz8oLnNbm6ypvxC+hxuxE7SdZ
	6yXPJd1Y+auM6OcQQ6SJNXjl5uGiugedhyH/N4BIIXq/BIzukN90oWPjrqK/iIuX0+j5cHz9gkE
	3yTkEtdW/9d6ft/Unln5UFI7jfVzbJmM9LAkhE9Bhi34ODegt0uLlXQ8yv7ybOI26WRWMdLQD3S
	+XTeigo/Ps2VOAUYVuIGTbvvJjaqBI+wZvOvQKgP20B/fM3LPcJen6Ko9PiEKyDnNenRNpM/2MM
	ROzZVpVvU3VqkOC9AHlo2cazQNy99ZzXKLaBrXUEHCKfrJGYJNDfZJs3A==
X-Received: by 2002:a05:6000:200f:b0:48c:5669:747b with SMTP id ffacd0b85a97d-48db9465ffdmr28384885f8f.8.1791895184376;
        Tue, 13 Oct 2026 05:39:44 -0700 (PDT)
Received: from localhost.localdomain (87-205-122-125.dynamic.inetia.pl. [87.205.122.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc7299sm4179440f8f.53.2026.10.13.05.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 05:39:43 -0700 (PDT)
From: Kyrylo Biryuk <illofspeed@gmail.com>
To: dm-devel@lists.linux.dev
Cc: mpatocka@redhat.com,
	snitzer@kernel.org,
	agk@redhat.com,
	bmarzins@redhat.com,
	dlemoal@kernel.org,
	hare@suse.de,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] dm zoned: fix two idle reclaim problems
Date: Tue, 13 Oct 2026 14:39:37 +0200
Message-ID: <20261013123940.952-1-illofspeed@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v4:
- Patch 1: added the Fixes tag (Damien Le Moal), and the Reviewed-by tags
  from Hannes Reinecke (given on v1; the code is unchanged since) and
  Damien Le Moal.
- Patch 2: added Damien Le Moal's Reviewed-by.
- Patch 3: re-arm the idle poll in dmz_schedule_reclaim() instead of
  open-coding it at the end of dmz_reclaim_work(), as Damien suggested.
  The new branch uses queue_delayed_work(), so zone allocations and
  "reclaim" messages leave an already pending poll or immediate reclaim
  alone.
- Rebased on v7.3-rc7 and tested there (see below).

Mikulas: patchwork shows v3 as accepted. If v3 is already in your tree, I
can send the patch 3 change and the Fixes tag as follow-up patches
instead; please tell me which you prefer.

Changes in v3:
- Patch 2: reworded the comment and dropped the redundant
  dmz_nr_cache_zones() test (Damien Le Moal).

Changes in v2:
- No code changes; only my author address changed.

These patches fix two problems in dm-zoned's reclaim worker, found while
running md RAID5 on three dm-zoned targets on 27 TB host-managed SMR drives
(WD Ultrastar DC HC680), each target with a regular cache device.

1. On a target with cache zones and no free sequential zone, an idle
   target keeps copying random zones into other random zones, forever
   (patch 2; patch 1 makes the resulting -ENOSPC back off instead of
   spinning). After a full md rebuild every chunk is mapped, so this
   happens right after a rebuild: the idle member read and wrote about
   72 MB/s nonstop for hours.

2. After a reclaim pass that ends while the target is busy, the idle poll
   is never re-armed, so zones filled under load are not reclaimed when the
   target goes idle (patch 3). Users notice it as "the buffer never drains";
   the workaround has been a timer sending "dmsetup message <dev> 0 reclaim".

Testing on v7.3-rc7 (kernel built from the tag, in a VM):
- reproducer with no special hardware (scsi_debug zbc=managed, 64 MiB
  zones, plus a 1 GiB loop cache device), idle target with no free
  sequential zone, 120 s: stock module 500-660 MB/s of read and the same
  of write in two runs, zone counters unchanged; with this series 0 MB/s:
  https://github.com/illofspeed/synology-host-managed-smr/tree/main/repro
- a small md RAID5 of three dm-zoned targets on emulated host-managed
  drives (tcmu-runner ZBC handler), LUKS and XFS on top: module swapped in
  and out with the files' checksums verified each time; after a 2 GiB
  write burst the filled random zones of all three targets were reclaimed
  within two minutes of going idle, with no "reclaim" message.
Earlier versions of the series have run on 7.2.6 on the three real drives
since 2026-10-05; the v4 form of patch 3 has not run there yet.

Related, not addressed here: the double-free in dmz_load_sb() reported on
dm-devel on 2026-05-30. Also not addressed: a "reclaim" message sent to a
suspended target can already queue reclaim today when reclaim is needed;
with patch 3 it can also queue the idle poll. If you would rather avoid
that, I can keep the re-arm at the end of dmz_reclaim_work() instead (as
in v3, with queue_delayed_work()), or send a separate patch that makes the
message do nothing on a suspended target.

The problems were found and the patches written with the help of an AI
coding assistant (hence Assisted-by); the analysis, the tests and this
description were reviewed by me.

Kyrylo Biryuk (3):
  dm zoned: back off when reclaim finds no destination zone
  dm zoned: do not reclaim a random zone into another random zone
  dm zoned: keep polling for idle reclaim after a reclaim pass

 drivers/md/dm-zoned-reclaim.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

-- 
2.47.3

