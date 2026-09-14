Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2ED93AD52F
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789373553; cv=none; b=M8MRt/zytMjymYOBdFXWsC4CcTxN7My6Oz/ikEHkAGDUEFkjOzwQOLD9hoUly99mXp9LsDsJ/88d5MNyiJNGEz/aFguXVuFT8SGOAnJTGEG4/aZ9QocxSQOlZ6stjjC4gntotg9XY0fIlWl00uFRPSceOeNzagw8um7Qeh/3TeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789373553; c=relaxed/simple;
	bh=bRWy71teUAqwLcgwZD1j8oe8nBNupPqxBYMN4QKm1pk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iRXEbbXI1PaV3g+4gA+wtMwRyqE57GTa3qfU3i55SU/F4+/WO+kx/GcaEGnvU+6Fpdbq8tlRx0sRptMwXn0QFmhCsf6mmOHL4dAmEuw28dibpKOlEKApPpp4kYDODg2dSE5WVytmW+p++0k7uMXTll2H6jXplG+GZg71Qb9QB7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NZ4FLCu0; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NZ4FLCu0"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482e1b30c94so225703f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789373550; x=1789978350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=urdTA4HjJrGTCEZczwl4Arel3MJiGP/u9tgNaNw6UBk=;
        b=NZ4FLCu0nZFKxavFzeXpBObWGm6xoSkmBMUrlMyIZDl/4Vv+l/cszPdnKtHqKlOdn9
         T6prYiARvrQ4fDJc+VeP0gaDQv3Vgyu+g56I2NhG+R6MNFbfIGvUQyZ698OJyvEZnSZ8
         Tx/vAGqypxYtvCb6ur/nYv0p4fTWXXpnfdedyLcwwutuk+UZ0YuPYoptoVcvpAX4zU0d
         5ugGNis+QR/zZtMgKeNLHMFuPLfFU2c/xOKTSMXvpX0YBe6h1tggDs8K6GXpFzDEvG+u
         jCE/f79KswF+BInX4FP9Ju8q8EyZ5q/oz0FBF6IIT3Qb7QyFLOyv4X1av9DIGz7FN/iu
         YREQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789373550; x=1789978350;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=urdTA4HjJrGTCEZczwl4Arel3MJiGP/u9tgNaNw6UBk=;
        b=aRYFu+ZTpzQcz/moEmbvD37z3XEaoc8njZoC5w8huDLeUOvOPqTRxYnHWKhdoG8KAn
         vsb57FNZ28CdvEhTfTuh3cbfa32CBBwGwNl20f6JbEyk4EvSGBbG2rG4F93I5LW3ISWp
         pIPZrucImCuObGqtKbfTKOt75qV9B0kK/zbptkiNh7koR16JuLT+RX8ddMkgUfxY2rHb
         aZTffuAyWboiWPYaZfJIoB0G0neAv1gH5Yii31dsO4SGwF35nT8gnMTu3mNqza+PzIoU
         cdFIXi5BIizMSh4m0O9MjuhhJInb9msGclqaApVGYTha48pMDgTKRjahK70YzxNLDc56
         h6Dg==
X-Gm-Message-State: AFuF++kVVtNzIdWLqu1OOUwJsXb+egmBFjH4065dMhv6T6kM3X1brXaU
	BBluKT6/UokGjSswOyPb/VCrPYczxRZR/uNC8hGRksh9xEAkaJC1Emlb
X-Gm-Gg: AYBFou3Rh3Tmd2x7+ln8zf1ABa0AT0d7ifkYOQ2dyhDlivuRjc1NycZNxsFEKrp3SnL
	Z7K7KVW8NPurB+gPojQrpf+c+WMW7Db+jFfrvT1V4rPjyWXjdh0wPI9ob4gOOHzuI2wZTw57jXS
	MQ3YYHt17LpcPKhbOznIEvf6nWydEtfyhTRPLQZi5kiqTFx+YsHPdyITqMTtPHhgLPJY/KAGz8z
	qYGH3UuodOXlBXsmkI1y6YaKLK2K0LkGY2ybsMo0vM5EDefU3+9XZQ2F9qvtOkzPvI7maLUh7rH
	INcXMeuNo5435ysB6sveXjxd3H4ijYR+YPunz+nm51zxMz/gmB0R9M27af5SD0xtX9MPh3DUio+
	bNKOF9z0YdYcUZ4xOQHZdwYQ9T6Cuoo6TPBSxIdTBqZ3gjebdDRaLDbe8n05HzcEAzh/sAgAH6v
	Sd0grbVyZL+JKQhfha4oA4bhuFdf/8qkHAQSKhFKInFrddB+JS3cg1z14yi5UTHl3bK/+fhY3aB
	U54jgJhekTrr4BICaE=
X-Received: by 2002:a05:600c:3b9f:b0:499:d95a:41f with SMTP id 5b1f17b1804b1-49e7a5f41a5mr18603755e9.0.1789373549421;
        Mon, 14 Sep 2026 01:12:29 -0700 (PDT)
Received: from L-P-ITAIH2-L-RF.rf.local ([193.169.70.108])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60acff8bsm301434385e9.9.2026.09.14.01.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 01:12:28 -0700 (PDT)
From: Itai Handler <itai.handler@gmail.com>
To: mwalle@kernel.org,
	pratyush@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	vigneshr@ti.com,
	richard@nod.at,
	miquel.raynal@bootlin.com,
	takahiro.kuwano@infineon.com,
	Itai Handler <itai.handler@gmail.com>
Subject: [PATCH v2 0/3] mtd: spi-nor: fix the unlocked restore on shutdown and remove
Date: Mon, 14 Sep 2026 11:11:46 +0300
Message-Id: <20260914081149.1916589-1-itai.handler@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two threads can talk to the flash at once during reboot/kexec and during
an unbind, because spi_nor_restore() is called without nor->lock while
MTD users are still attached. A busy flash silently ignores the restore
and is left in 4-byte addressing, which is exactly the failure the
restore was added to prevent; a restore landing inside a read corrupts
the rest of that read instead.

I reproduced this under QEMU, using a flash model extended to implement
erase busy time. With an erase outstanding, spi_nor_shutdown() issues
WREN, EX4B and WRDI; the chip refuses all three because it is busy, and
each one still reports success to the caller:

  the flash was mid-erase when spi_nor_shutdown() tried to put it back
  into 3-byte addressing, and refused 3 of its command(s):
  0x06 (four_byte=1), 0xe9 (four_byte=1), 0x04 (four_byte=1)

four_byte=1 is the mode the chip was left in, and so the mode the next
kernel inherits. With the patch, shutdown waits for the erase and the
restore reaches an idle chip. The reproduction is deterministic: the
workload keeps the flash busy continuously, so no timing window is
involved.

Two caveats on that. It runs on a 5.10 vendor tree rather than mainline,
though the path is unchanged - mainline's spi_nor_shutdown() has the
same unlocked spi_nor_restore() call. And what started the investigation
was intermittent hangs after kexec on a Zynq UltraScale+ board, which I
have not tied to this race.

Patch 1 is new in v2 and is a prerequisite rather than part of the fix.
spi_nor_rww_start_exclusive() returns with nor->lock held on both of its
exits, so taking the flash lock in ->shutdown and ->remove, which is
what patches 2 and 3 do, would deadlock an RWW flash on every reboot and
every unbind. Nothing reaches that code today, which is how it survived
since v6.15, so patch 1 also stands on its own.

Patch 2 fixes ->shutdown, which every reboot and kexec goes through, and
is marked for stable. Patch 3 fixes the identical problem in ->remove; I
have deliberately not marked it for stable, since nobody has reported
hitting it and it changes how long an unbind can block. Patch 1 carries
a stable tag too, so that a backport of patch 2 cannot land without it.

Note what patch 2 does not do: the restore still runs with MTD users
attached, so an operation starting after it completes still addresses a
3-byte chip with nor->addr_nbytes == 4. Serialising against operations
already in flight is what stops the restore being issued into a busy
chip; fully closing the window would mean stopping MTD from accepting
operations before ->shutdown, which seemed too big a change to fold in
here. I am happy to look at that separately if you would prefer it.

Patches 2 and 3 are independent of each other; patch 3 can be dropped
without affecting patch 2. Patch 1 has to stay.

Changes in v2:
- New patch 1/3 fixing the lock that spi_nor_rww_start_exclusive()
  leaves held on both exits. Without it the rest of the series
  deadlocks on an RWW flash, because it adds the first ->shutdown and
  ->remove callers of the exclusive lock. Found while answering the
  automated review of v1.
- Patches 2/3 and 3/3 are unchanged from v1 1/2 and 2/2.
- Link to v1:
  https://lore.kernel.org/r/20260910184452.895485-1-itai.handler@gmail.com

Itai Handler (3):
  mtd: spi-nor: fix the lock left held by spi_nor_rww_start_exclusive()
  mtd: spi-nor: take the flash lock in spi_nor_shutdown()
  mtd: spi-nor: take the flash lock in spi_nor_remove()

 drivers/mtd/spi-nor/core.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)


base-commit: 50d05c7c76c96b90462f24debacca971d2e86713
-- 
2.34.1

