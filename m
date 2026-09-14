Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520133F8EA2
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789373561; cv=none; b=MWBJP2kfxJs/DwWKORrsFmLpAyTCledGKrEzd8eXeCpcemwIp/DKiZNvhacGgVViHC/a6l1VMDk47SDffl5b1igbGzGeg9a1Q0HzoscxYr9vZyi9iX1TSFyeuCtG/GfW7xWGY5qV2iuJAwngsCOgspX7mwNkOPcdgZtfTR4kzmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789373561; c=relaxed/simple;
	bh=QFaOVSaXo24SfPWobdaFHZRuDdTnE2qTXwVifB86x00=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rvzNzzBULFjnDQT2fprsilU1JAVuaUoOBDMfb4uJN1YpsoeRnJU4eDxwcbW+ePbjpzwxLEvGn/bbIeInj8X2lKV5mgvAFfXqksVCq0uZpvSkjftULtoTO1Xya+c7chz6uY8naBC29xfpFoqDkdQX1nzsUMmDIeBwewS4ip1/Azk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jekJlX6t; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jekJlX6t"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7c6dbc60so31705e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789373557; x=1789978357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Aj7IiomPonUj9qywT6/YurZdwlPYR2aG7U6PbbSw37I=;
        b=jekJlX6tBY33oG2iw2w/02lsBFrVP5pjNjIEaaZ0k7x5tPqSacnT8UnyuD/xLZH8H/
         r3pG+DgiBtKzgsVgVIX/PxcjFOT9AU3jG5C1z9krtacehnIgGWYJC2MHqRBafy2WES6j
         /csH5PyKvUo2ZjqJ1UUVT93vmGvYdlGOUvTtr+vWrkA6Kd2zJVEJg3OogoUeHyito6Rr
         QsNXmmwqR3J7KOYRm668h6sxSoJMeNSDOTrC9c+KM0+Szl/KuX0cA2o5JVESNgElFQ4I
         eYV6VjKgQ5RCFBJRBwPieCrGJHuTT15RWavYUjPR5AjYXxQmFLzxNqXmAh58FlVTVJJa
         yFJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789373557; x=1789978357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Aj7IiomPonUj9qywT6/YurZdwlPYR2aG7U6PbbSw37I=;
        b=CEnRUt6uASIm3fVK0ipFFBufblwMf9MudhFGpqL/7Vf5EgF+fUDEu7zKYWKtZhs4Lu
         5p7oChSxedAP8JcvZDpnt0ysGJj9O7xcpvKJRv61QsmJnBBUyNshuSj9T0Wah1tnDjDC
         bQLL9VQX80WWm+0GqIgD9wkL2jz5k0YmqcrvdLdIySpRH8ylSFz37tF0jGoCCZrYBC05
         Mq1hkpbXtQ1OBPyK2dtqTCVvGv5f42VIc5LTUhOjB0gj03jkVM2ZX9jqGaaWRMJNXKy7
         xFdKIhlD/HgNzfo5Vw4Wj/zgIeD+vRmIl/7apbZtE/OvTQd1o10EmqHfsTjVmIrkFCUZ
         hk2A==
X-Gm-Message-State: AFuF++ndDfawQmaOPYM5k8Jr+xcxnwRgF4i8cbrg4Cc6/R+7pp0vq0mb
	DVwHJVHcjgJF69M948utlTPQja6w853bfGcKaKcNttnWkLgRZZIY8OYA
X-Gm-Gg: AYBFou13UIYBem5ONxsVLLlrTf1EajNj5JMj8WNPNdtcU/ZwGWgMvf/f/R5Rdlj8tVf
	FBdGyXCcbmM0omFL1tAphmKS3aMvFalHoQFGbw6wyTHhf27VD8mPp4GRmUx8wywJF1cRpTt2WIZ
	w2XjqajaecwQQxJUVDCWMbUI8T3DsyEB7Yn48TNiart/uhou27G6ZwazAMBSrIbgjRqjUUGBcnZ
	CCVITZIpl+qdniaN6wIFh6karIQbdw5Vj9kS2JVtClqZwVynLS9zFFiKLiCSPClKtBGEGOPoGR9
	jtf5Nc6zr4cc1MAfqx8ouAAJLFxjXh1R78zCKIQTV+RagWyh5O0nx6601h+77W4qLNkIzFO3Mxa
	YYeIlSIVMsCaU4QoCJ9WrrObzCxpluesFul6g9flGmVENGhC2acMjI4eYZUHeRjbZWrhlufDLdj
	Zw2mVommWNogxtO3/K90hrqbZwC8TWGcNOQOu0n+zZLrl7W7eUMbZLvscj4Pq63cnU7P687v1An
	xSgwR1DYxf+59MjFp8=
X-Received: by 2002:a05:600c:3b9f:b0:49e:745d:5768 with SMTP id 5b1f17b1804b1-49e7a5f1f60mr19047885e9.0.1789373557305;
        Mon, 14 Sep 2026 01:12:37 -0700 (PDT)
Received: from L-P-ITAIH2-L-RF.rf.local ([193.169.70.108])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60acff8bsm301434385e9.9.2026.09.14.01.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 01:12:36 -0700 (PDT)
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
Subject: [PATCH v2 2/3] mtd: spi-nor: take the flash lock in spi_nor_shutdown()
Date: Mon, 14 Sep 2026 11:11:48 +0300
Message-Id: <20260914081149.1916589-3-itai.handler@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260914081149.1916589-1-itai.handler@gmail.com>
References: <20260914081149.1916589-1-itai.handler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

spi_nor_shutdown() calls spi_nor_restore() to put the flash back into
3-byte addressing before the system reboots or kexecs. It does so
without taking nor->lock, which every other path that talks to the chip
acquires through spi_nor_prep_and_lock().

device_shutdown() does not freeze userspace and does not stop kernel
threads; it walks the device list calling ->shutdown with all CPUs
online. Another thread can therefore be in the middle of an operation,
with the restore running concurrently with it. A write and a read are
both damaged, in different ways.

A program or erase leaves the flash busy, and a busy flash accepts only
status register reads and ignores everything else, including the EX4B
that spi_nor_restore() sends. Neither spi_nor_write_enable() nor
spi_nor_set_4byte_addr_mode() reads anything back, so the restore
reports success while the flash is left in 4-byte addressing. The next
boot stage then addresses it with 3 bytes and reads the wrong data,
which is the failure commit 59b356ffd0b0 ("mtd: m25p80: restore the
status of SPI flash when exiting") introduced this restore to prevent.

A read, by contrast, does not ignore the restore - it is corrupted by
it. spi_nor_read() holds the lock across a loop that issues one
spi_nor_read_data() per chunk, each using nor->addr_nbytes.
spi_nor_set_4byte_addr_mode() updates nor->params->addr_nbytes and not
nor->addr_nbytes, so a restore landing between two chunks switches the
chip to 3-byte addressing while the driver carries on sending 4 address
bytes. The rest of the transfer is addressed wrongly and returns wrong
data, and nothing reports an error. A restore may also soft reset the
chip in the middle of that same read.

Take nor->lock for the restore, so it runs between operations instead of
during one: a program or erase has finished waiting on the chip, and a
read has issued its last chunk. This is a locking fix rather than a
missing wait - each operation already waits for completion at the site
that started it.

This narrows the race without closing it. The restore still runs while
MTD users are attached, so an operation that starts after it has
completed will address a chip that is now in 3-byte mode while
nor->addr_nbytes is still 4. Closing that as well would mean having MTD
stop accepting operations before ->shutdown runs, which is a larger
change; serialising against the operations already in flight is what
keeps the restore itself from being issued into a busy chip.

Fixes: 59b356ffd0b0 ("mtd: m25p80: restore the status of SPI flash when exiting")
Cc: stable@vger.kernel.org
Signed-off-by: Itai Handler <itai.handler@gmail.com>
---
 drivers/mtd/spi-nor/core.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 8bc117b46e02..647bf8dce719 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3862,8 +3862,21 @@ static int spi_nor_remove(struct spi_mem *spimem)
 static void spi_nor_shutdown(struct spi_mem *spimem)
 {
 	struct spi_nor *nor = spi_mem_get_drvdata(spimem);
+	int ret;
+
+	/*
+	 * Wait for an operation started by another thread to finish.
+	 * device_shutdown() runs with MTD users still active: a busy flash
+	 * ignores the commands spi_nor_restore() issues, leaving it in
+	 * 4-byte address mode, and a restore landing mid-read changes the
+	 * chip's address width under the transfer.
+	 */
+	ret = spi_nor_prep_and_lock(nor);
+	if (ret)
+		return;
 
 	spi_nor_restore(nor);
+	spi_nor_unlock_and_unprep(nor);
 }
 
 /*
-- 
2.34.1

