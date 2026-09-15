Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756093AE1B4
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 11:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789472330; cv=none; b=YBwRcM7OEVh3Wbcm8BA8EFBiyrZaOb3igHsXIjRH6WFjmyoL/peSXm13W6UOc44vEyyTTEA0fx8efia6T8WKt9efRL/2ikzn51+9GAtBhO4ZnMcYcpV0o28H8gaA5u/bwRWHvdj58rzz5j4GYFVDbiw6jcMlCBlN0pMzCQGANFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789472330; c=relaxed/simple;
	bh=gE+Fcg+IgZvXWr4qO2g38IDiaOpjPNINoQFbRMUClhs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RageZof6evByLHBI8hke8KDBJX/6Hl4fZqHzpdHmfcy25rDNdCevbUcl9FoLiaCWyhktCohFhoM3eURDfYRYXe3F8d/4c4A+TuYxzWWR+zz/NF9FqYaX6rX9IjqWhoRI/8ECR6w/3vEoYF8BMHa8md1Q8kA3KMnZZ7cu4btd7+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BXlbACZS; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BXlbACZS"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e71974de4so1042555e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 04:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789472326; x=1790077126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P5LU+QL611XVkEd8eqie07UbWEHcEKmuwpDc2acyE/A=;
        b=BXlbACZSX28MZ0qBAM2GgtcGEuq3aEedxX8aGU3hQ77byo6SsNtFnckUvjTs04hLz9
         Fmvn3qXpw7wiv00Y2JvVbuHl4KpzjBbgaDDiqRUhgS7RjVXRN0VR3C1VEYsiuts+lS7c
         UQhp39xnpLfecnQpC7lZR4+lHJR3fIpYRU0QlyuZ7Vt2CuyP55Lkm52VMuIlVlykoxhG
         KbT+Zh4LKdJAEcwvAI6XqABMI6rKgSthUmRKD5WnYyK6v3QLjSZMehU7pcPlMxNYxrdw
         +PqbnfIg8f5Q7xNAT5EIV/QeL25g+3q0wYMojs3IEhCMok73yNK9ijuJ7/sB8n9eY6Bt
         pTsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789472326; x=1790077126;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P5LU+QL611XVkEd8eqie07UbWEHcEKmuwpDc2acyE/A=;
        b=wPybMupRp2XtuLUkQ0+1pV/3bFvtrG2GsrnJ2wadG8psf0O/4paXYEuE8EMiYzl8b3
         8AJM8snRrpIPG+T+iXF66ro0S5dt0/HkrCQkErQrkOa7VdetxK1NVR7byqpPxVN/mG94
         RsfaHwmWGowjp4IPhaZ9siSI9B6mBkbqq95fZ+gJo1pOR46yvH6xgwD2C37Jjqh4ZUqA
         joIgHjscDABm2X/sbDPlDEVHBaMWt13JF+jcq6sHqYomGcyNk886mU/qMmU/E3CxPYMS
         QHWzVk3pD50c0fc6LqEHDfyQ0nQiFbIgv1cW95HRh54M8dcd44hENtDB50jeR65nK+Ph
         VI3w==
X-Gm-Message-State: AFuF++lABIkDmZf4QW8rne8FlK8uwFB8bmjJ0o8nUAYF5M7zLeU7rIoF
	GDQGImvivQa+CauAiNQS0bHl1uRrOFdZuDP7jQOJr7NAPdsfG4AoABxc
X-Gm-Gg: AYBFou2iW3JFWgbc02b8M9WUakvnSqpYWNNQXKFHVKNSyeMtTXecZeWeujvyVTgnbLV
	DC9W7ZuPLS+cF2Bn2mvOwRrbK89xD3QaDxoZ9ISq9XGdUAIQMZCe/RhLC+PXGqLNCOpBN/31F6g
	lgGYetyRpLjCh3t1OsNuvMKTwWctlt29cn77KYq57YiBo5GUjoGwI6PXuY9rGYxLtTNeqKqvrFP
	r40ZNZP88wP+wwoBloYf3NQaLLUa/QSWNyCUsxwO5ZyBib8pxr2KHr2jVxe2tT/HO5CwicC4Ld6
	midNLl2b4fA6H7tkh5ev6NNgZoTMsngkOG9JYi0SGtynPV/4MQWWggiw5c4hVJWPA1lIO1cQERY
	ZmZt3snic4TH8A03esGib6e6V9u/S/s3l7TV3yzTxtKJCBOFoe00P10C5B0cwZnRxmTUOGfcMbV
	i6c7rKbjyItAz3H6payHrr8J0SDslTOrTsfJvCsRTw4152hRRkQ1+aRpHTLGVfG5eUsx+cIAu00
	RrmWlRXyS2n4QO84oU=
X-Received: by 2002:a05:600c:3b9f:b0:499:d95a:41f with SMTP id 5b1f17b1804b1-49e7a5f41a5mr97454745e9.0.1789472326047;
        Tue, 15 Sep 2026 04:38:46 -0700 (PDT)
Received: from L-P-ITAIH2-L-RF.rf.local ([193.169.70.108])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7ef6bbdasm53917485e9.4.2026.09.15.04.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 04:38:45 -0700 (PDT)
From: Itai Handler <itai.handler@gmail.com>
To: mwalle@kernel.org,
	pratyush@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	vigneshr@ti.com,
	richard@nod.at,
	miquel.raynal@bootlin.com,
	takahiro.kuwano@infineon.com,
	Itai Handler <itai.handler@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3] mtd: spi-nor: take the flash lock around spi_nor_restore()
Date: Tue, 15 Sep 2026 14:38:11 +0300
Message-Id: <20260915113811.2429311-1-itai.handler@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

spi_nor_shutdown() and spi_nor_remove() call spi_nor_restore() without
nor->lock, which every other path to the chip takes through
spi_nor_prep_and_lock(). Both run with the MTD device still registered,
so another thread can be in the middle of an operation.

A busy flash ignores everything but status reads, so the restore is
silently dropped and the chip is left in 4-byte mode. A restore landing
between two chunks of a read switches the chip to 3-byte addressing
while spi_nor_read() carries on sending four address bytes.

Take the lock, so the restore runs between operations instead of during
one. This narrows the race rather than closing it: an operation starting
afterwards still addresses a 3-byte chip with nor->addr_nbytes left at 4.

Fixes: 59b356ffd0b0 ("mtd: m25p80: restore the status of SPI flash when exiting")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Itai Handler <itai.handler@gmail.com>
---
v2 1/3, the spi_nor_rww_start_exclusive() lock fix, is dropped from this
series now that it is queued in spi-nor/next. This patch still depends
on it: it adds the first ->shutdown and ->remove callers of the
exclusive lock, so an RWW flash would deadlock without it. Please let it
reach stable first.

Changes in v3:
- Fold the spi_nor_remove() patch into this one, as requested by
  Michael Walle. Both call sites now share a small helper.
- Cut the commit message down.
- Add an Assisted-by: tag, as requested by Michael Walle.
- Drop patch 1/3, queued in spi-nor/next.
- Link to v2:
  https://lore.kernel.org/r/20260914081149.1916589-1-itai.handler@gmail.com

 drivers/mtd/spi-nor/core.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index ccf4396cdcd0..c891197ffa5b 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3849,11 +3849,26 @@ static int spi_nor_probe(struct spi_mem *spimem)
 				   data ? data->nr_parts : 0);
 }
 
+/*
+ * Restore between operations, not during one. Removal and shutdown both run
+ * with MTD users still attached: a busy flash silently ignores the commands
+ * spi_nor_restore() sends, and a restore landing inside a read changes the
+ * chip's address width under the transfer.
+ */
+static void spi_nor_restore_locked(struct spi_nor *nor)
+{
+	if (spi_nor_prep_and_lock(nor))
+		return;
+
+	spi_nor_restore(nor);
+	spi_nor_unlock_and_unprep(nor);
+}
+
 static int spi_nor_remove(struct spi_mem *spimem)
 {
 	struct spi_nor *nor = spi_mem_get_drvdata(spimem);
 
-	spi_nor_restore(nor);
+	spi_nor_restore_locked(nor);
 
 	/* Clean up MTD stuff. */
 	return mtd_device_unregister(&nor->mtd);
@@ -3863,7 +3878,7 @@ static void spi_nor_shutdown(struct spi_mem *spimem)
 {
 	struct spi_nor *nor = spi_mem_get_drvdata(spimem);
 
-	spi_nor_restore(nor);
+	spi_nor_restore_locked(nor);
 }
 
 /*

base-commit: 50d05c7c76c96b90462f24debacca971d2e86713
-- 
2.34.1

