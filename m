Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793307749;
	b=GNThsqZVV/44fCX741Vd7SowF0v+aXv4pdbIMAtiGvh586hTe5QM9DW6fUrlWSooeC3r
	 0b/l4KKXB7cPEjIhJZyxxYG+wUCBXiSQEUOWrnRZHVg3M3kyhyV+draJaEVT5l9zU+Hcs
	 9km6iR1lfPwyUuPrYawj0GE5MWYFs+mZ4VbnJvv7B6gD1tBo3ltB1nxJcrNCO8ORAkqAJ
	 xtMVH9lOEnlqH/+jWRwi0z5K47Yi/Xgev/xmDn9+N4RfaZZ6JMZlnIltAihjr9VePzfJQ
	 Myqc4p6kohaDNeJBfJxvVbmm2jny42nUtCSHs6LbwvbwJPKRDB+mml30x5bnuGk5KGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793307749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5sDaF1agk97PzrXPmnOhapbuVIAtpwilBBKflUvKbnU=;
	b=pQuKBmiX88OXy4znhvB7KrlyUh1en69HSBnwIU8yCFuedURQFYlGgfb7DmRF6Z0LaHpu
	 5ET+QdGx7o3CCihz+6FOoiukzMUHqS2QmzWklHk213s7u81e9lYqEp1vRg23fQ/yJv+kT
	 UWYmmEX8rNbivVXOcrDO72bZLTrVRnixiRTu0/xmU7vd4MwPCwjwj4csR9V6VZ/ubaQMm
	 jCd4t5iJa3p0b7KXIxYP5Nr1ffT79KBrti/6l0hn+HAwt136NvKwYdR3mxYzNfA4+fHb+
	 2WRiXoYUuJfEELJgAk9qD/usVbF9QK84H52wsmm00Jqw8FCFx3PL8wNxVxhUTXH8pEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DaNvVkc2;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8471606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:02:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8471606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DaNvVkc2
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a5348aaba5so14505e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793307747; x=1793912547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5sDaF1agk97PzrXPmnOhapbuVIAtpwilBBKflUvKbnU=;
        b=DaNvVkc2DVlszxJKMxzmzJHaKYXCrKbETCiSbpA9Cxnahz/kXA5u7IeHPrY+NjH4M6
         N+DIZEDhNhMmKtmHu3DQ4NQ8WUeSBXuRfBCA/B1zxvDzmv4ab85Zgt+HU5hyRJjIG6uU
         Ku+sCVIBspDzEaJmjtD+wT1uscNPj4fMagiRQeQVjnZHlnkvG5/afd/a0dQCGUBbE7Zv
         uwEQN9oAXawd4JQi1blLFOlXOPlup5QkZvMq1VhdHt9q1im7FMp0Pt2Fwl3WTduvXtiS
         EccGwBWUdF7fo8Jso266f785wVzYnDF4+3Z095ih4VLQuQjCnkHucJlXhilGxrG1FqKq
         PQhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793307747; x=1793912547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5sDaF1agk97PzrXPmnOhapbuVIAtpwilBBKflUvKbnU=;
        b=jfyA4JN3p0kUXNUSE7FUjh27gdM05jkkx6mVBBBeNtscr1J+pi9o7IDwKw5aPBSDO8
         9rWS04bW4ePxX6oM3TpBADrIaQlH85KHa5p8w7+npcFkNOEhL+E1aXRCldcxG6w46C07
         m0iQxip1ykBMDK1wnUagT80S9X77JKVeKdQJCggCKD/NL8ljGkDJn7V3WqVVkyJysw7n
         IFQEbZZChYqLXfBBiEWSB6/GmRiZwj+Om/i6Q+KhQtnv9KR/VVpkI/ZihTE23XDte/lq
         lEOSUDv+sudpbBNUxJnEcJ7HYVpHY3SXc95UNlY8nf/rK4xAZtFJj7h3cLs0sUVNmfNJ
         0ccA==
X-Forwarded-Encrypted: i=1; AKwUvByt9g3shOFc/10MezhKAJ7bQH6oTH99hRfS6Dzhd40DScrrm6XMJ4gDqDD009R98sDkt4qE7xRWBJqrwmI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKcZHHSLRgjKt1xc61F6bFYl99VE0Q/bXw7MUKmtCwTrubzLdGK
	4TinVdZxJ0VHp6x+egLyMHieIFuNhvss2Jt3YcahnefY48G3guer+4jP
X-Gm-Gg: AYBFou0jrcLkz0BxwZ69AyFNcv1Qsd6cvc9kMdZmDlyb6b6SMn40vNwH8fPxHhQljdR
	GlaKVjSdEPeuiYGSRykShH2atpxMj+Nm8ZFGGwPBULclwbRZTPfsSkmQVFIuzmkbceeCKd8HGSO
	0JAvtM2hzim/1U/+/hlCZnYpDD93z1/eb+P1TKgp6qUhrzHjsocDLEv2AK7h0nvOXk9n6Xj8DUO
	/obsO80llhG1p/O93EZ5g10BZsS0DJJGHZFFYJfjafWsTDLzmz6vv4STWK997iALxvuTInKaP+c
	o/NWgdQZLuTiPw5sECuJ0jnajUFM5QXdTeSHj/2zQ6vnSUXHuVP1XLSHVEVaMSJeKiD7Qnlv1bp
	xX7SEEj37Qd08bdIHjr87PYxhqb7qdr7Iozfe3VidvzNqlBr+fGhsAMLLB7ThsPgWFKk45Cbrez
	qushB+fv/1itXd24YgfqVcPE7bLrJKABi/X1O9PecGbzolbqZJmEDFnZu0LcKiZmpaMyVq3X1fI
	Io2fB2uyqVdT87OdiozdNEzfIFKt3x0yhzapuipe92CHTaYRSEQRLTxKJN0iJzefOEb20ZVsZ3i
	7Q8uzkaDoK5GUDY5Uzj8wee+b1LCk8GjuW7D0vqUWWDCmhAaUg==
X-Received: by 2002:a05:6000:188b:b0:48e:6651:d82b with SMTP id ffacd0b85a97d-48e6e2c5febmr1487266f8f.2.1793307746852;
        Thu, 29 Oct 2026 14:02:26 -0700 (PDT)
Received: from L-P-ITAIH2-L-RF.rf.local ([193.169.70.108])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e6eb834aesm614767f8f.30.2026.10.29.14.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 14:02:25 -0700 (PDT)
From: Itai Handler <itai.handler@gmail.com>
To: mwalle@kernel.org,
	pratyush@kernel.org
Cc: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	takahiro.kuwano@infineon.com,
	tudor.ambarus@linaro.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v5] mtd: spi-nor: take the flash lock around spi_nor_restore()
Date: Thu, 29 Oct 2026 23:01:53 +0200
Message-Id: <20261029210153.3986211-1-itai.handler@gmail.com>
X-Mailer: git-send-email 2.34.1
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

spi_nor_restore() runs on reboot, kexec and unbind to hand the flash
over in its power-on state. It runs without nor->lock while the MTD
device is still registered. Tasks are not frozen on reboot or kexec,
and kexec -e does not even stop user space, so the restore can run in
the middle of a program or erase. This causes two problems:

1. The flash can be left in the wrong state. On boards that do not
   reset the flash (broken-flash-reset), the restore exits 4-byte
   address mode, but a busy flash typically ignores the command, so
   the flash stays in 4-byte mode after the reboot or kexec. After a
   reboot, a boot ROM that reads the flash in the power-on 3-byte mode
   gets the wrong data, and the board fails to boot. For example, the
   GnuBee PC1 (MT7621) has a Winbond W25Q256FV, which ignores the exit
   command while busy, and the board needs the restore to reboot, see
   commit 90dedc973b86 ("staging: mt7621-dts: allow gnubee to reboot
   cleanly."). A busy flash also ignores READ ID, so if it is still
   busy when the secondary kernel probes it after a kexec, the probe
   fails ("unrecognized JEDEC id bytes"), and that kernel cannot use
   the flash.

2. Data can be corrupted. The restore also soft resets flashes that
   support it, which can abort a program or erase. For example, the
   Micron MT25QU512ABB8ESF-0SIT QSPI NOR flash advertises the soft
   reset in its SFDP, and its data sheet says that a reset aborts a
   program or erase in progress and may corrupt data. If an application
   is writing data to the device when the system kexecs into a secondary
   kernel, or restarts, a sector can be left partly erased or programmed.

Take the lock, so that the restore waits for the operation in flight.
That alone is not enough: the next operation would then start right
after the restore, and could still be running at the kexec or be cut
short by the reboot. And after an exit from 4-byte mode, it would still
use 4-byte addresses, so a page program would write to the wrong place.
So mark the flash shut down before releasing the lock, and fail later
operations with -ESHUTDOWN. The CFI drivers also refuse operations once
they have reset the flash for a reboot (see cfi_intelext_reset()). If
the SPI controller removes itself on shutdown, spi_nor_remove() runs
after spi_nor_shutdown(), finds the flash shut down, and does not
restore it a second time.

The wait is usually short, as applications and flash file systems
typically submit small requests, such as a single sector erase. It can
be long, though: spi_nor_erase() holds the lock for the whole request,
so shutdown or unbind may wait for a full chip erase, which can take
minutes. If the lock cannot be taken, warn and restore without it, as
before.

Backport note: before v6.4, the lock helper is spi_nor_lock_and_prep(),
and it has no _pe and _rd variants. From v6.4 on, apply this on top of
commit f594a33f9721 ("mtd: spi-nor: Unprepare legacy controllers upon
RWW wait interruption"), which is also tagged for stable.

Fixes: 59b356ffd0b0 ("mtd: m25p80: restore the status of SPI flash when exiting")
Cc: stable@vger.kernel.org # see patch description, needs adjustments for <= 6.3
Assisted-by: LLM
Signed-off-by: Itai Handler <itai.handler@gmail.com>
---
Changes in v5:
- Fail operations after the restore with -ESHUTDOWN, so that none can
  reach the flash between the restore and the reboot or kexec.
- Warn and restore anyway when the lock cannot be taken, instead of
  skipping the restore, as I offered in my reply on v3 [1].
- Use a helper around spi_nor_restore() again, as in v3, and the v3
  subject.
- Say that the wait can last for a full chip erase; v4 understated it.
- Drop the long code comment, and rewrite the commit message, with
  examples and a backport note.
- Use the v3 form of Assisted-by.
- Rebase on mainline.

Why the lock is not just kept after the restore, which would also stop
later operations: it hangs the reboot or kexec on boards whose SPI
controller removes itself on shutdown (spi-fsl-dspi, spi-bcm2835,
spi-ath79). spi_nor_remove() then runs after spi_nor_shutdown(), in the
same task, and waits for the lock that spi_nor_shutdown() kept. With
this patch, spi_nor_remove() gets the lock and skips the restore.

Testing:
- Built with W=1 for arm64, on mainline and, cherry-picked on top of
  f594a33f9721, on 6.6, 6.12, 6.18, 7.2 and 7.3. The backports to 5.10,
  5.15 and 6.1 build cleanly too; I will send them when the stable team
  asks.
- In QEMU (v7.3, ZynqMP GQSPI, n25q512a11 with broken-flash-reset, and
  the flash model patched to stay busy during an erase), with an
  application erasing and programming the flash during a kexec:
  - Without this patch, the flash ignores WREN, EX4B and WRDI, and stays
    in 4-byte mode.
  - With a draft that released the lock after the restore, the next
    erase went out with a 4-byte address. With a 10 s erase, it was
    still running when the secondary kernel probed the flash, and the
    probe failed.
  - With this patch, the flash obeys EX4B, nothing reaches it after the
    restore, and the secondary kernel finds the flash, with both a 3 s
    and a 10 s erase.
- With the GQSPI driver changed to remove itself on shutdown, as
  spi-fsl-dspi does, a kexec with a draft that kept the lock hung, as
  spi_nor_remove() waited for it. With this patch, it completes, and the
  flash is restored once.

v4: https://lore.kernel.org/r/20261004104311.2196527-1-itai.handler@gmail.com
v3: https://lore.kernel.org/r/20260915113811.2429311-1-itai.handler@gmail.com
[1] https://lore.kernel.org/r/CAFpOueRGN2TSNo+m3319qn00p-BYn8w7OQ6OPt4XTcVG63-uUA@mail.gmail.com

 drivers/mtd/spi-nor/core.c  | 43 +++++++++++++++++++++++++++++++++++--
 include/linux/mtd/spi-nor.h |  2 ++
 2 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 90524c58602e..3109f89b35f3 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1230,6 +1230,11 @@ int spi_nor_prep_and_lock(struct spi_nor *nor)
 		ret = wait_event_killable(nor->rww.wait,
 					  spi_nor_rww_start_exclusive(nor));
 
+	if (!ret && nor->shutdown) {
+		spi_nor_unlock_and_unprep(nor);
+		return -ESHUTDOWN;
+	}
+
 	if (ret)
 		spi_nor_unprep(nor);
 
@@ -1290,6 +1295,8 @@ static void spi_nor_rww_end_pe(struct spi_nor *nor, loff_t start, size_t len)
 	rww->ongoing_pe = false;
 }
 
+static void spi_nor_unlock_and_unprep_pe(struct spi_nor *nor, loff_t start, size_t len);
+
 static int spi_nor_prep_and_lock_pe(struct spi_nor *nor, loff_t start, size_t len)
 {
 	int ret;
@@ -1304,6 +1311,11 @@ static int spi_nor_prep_and_lock_pe(struct spi_nor *nor, loff_t start, size_t le
 		ret = wait_event_killable(nor->rww.wait,
 					  spi_nor_rww_start_pe(nor, start, len));
 
+	if (!ret && nor->shutdown) {
+		spi_nor_unlock_and_unprep_pe(nor, start, len);
+		return -ESHUTDOWN;
+	}
+
 	if (ret)
 		spi_nor_unprep(nor);
 
@@ -1366,6 +1378,8 @@ static void spi_nor_rww_end_rd(struct spi_nor *nor, loff_t start, size_t len)
 	rww->ongoing_rd = false;
 }
 
+static void spi_nor_unlock_and_unprep_rd(struct spi_nor *nor, loff_t start, size_t len);
+
 static int spi_nor_prep_and_lock_rd(struct spi_nor *nor, loff_t start, size_t len)
 {
 	int ret;
@@ -1380,6 +1394,11 @@ static int spi_nor_prep_and_lock_rd(struct spi_nor *nor, loff_t start, size_t le
 		ret = wait_event_killable(nor->rww.wait,
 					  spi_nor_rww_start_rd(nor, start, len));
 
+	if (!ret && nor->shutdown) {
+		spi_nor_unlock_and_unprep_rd(nor, start, len);
+		return -ESHUTDOWN;
+	}
+
 	if (ret)
 		spi_nor_unprep(nor);
 
@@ -3250,6 +3269,26 @@ static void spi_nor_restore(struct spi_nor *nor)
 		spi_nor_soft_reset(nor);
 }
 
+static void spi_nor_lock_and_restore(struct spi_nor *nor)
+{
+	int ret;
+
+	ret = spi_nor_prep_and_lock(nor);
+	if (ret == -ESHUTDOWN)
+		return;
+	if (ret)
+		dev_warn(nor->dev,
+			 "Failed to lock flash, restoring its power-on state anyway, err = %d\n",
+			 ret);
+
+	spi_nor_restore(nor);
+
+	if (!ret) {
+		nor->shutdown = true;
+		spi_nor_unlock_and_unprep(nor);
+	}
+}
+
 static const struct flash_info *spi_nor_match_name(struct spi_nor *nor,
 						   const char *name)
 {
@@ -3632,7 +3671,7 @@ static int spi_nor_remove(struct spi_mem *spimem)
 {
 	struct spi_nor *nor = spi_mem_get_drvdata(spimem);
 
-	spi_nor_restore(nor);
+	spi_nor_lock_and_restore(nor);
 
 	/* Clean up MTD stuff. */
 	return mtd_device_unregister(&nor->mtd);
@@ -3642,7 +3681,7 @@ static void spi_nor_shutdown(struct spi_mem *spimem)
 {
 	struct spi_nor *nor = spi_mem_get_drvdata(spimem);
 
-	spi_nor_restore(nor);
+	spi_nor_lock_and_restore(nor);
 }
 
 /*
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index b3e3c6b10186..6f5d2e5c2118 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -361,6 +361,7 @@ struct spi_nor_flash_parameter;
  * @read_opcode:	the read opcode
  * @read_dummy:		the dummy needed by the read operation
  * @program_opcode:	the program opcode
+ * @shutdown:		the flash was restored, refuse further operations
  * @sst_write_second:	used by the SST write operation
  * @read_proto:		the SPI protocol for read operations
  * @write_proto:	the SPI protocol for write operations
@@ -402,6 +403,7 @@ struct spi_nor {
 	enum spi_nor_protocol	read_proto;
 	enum spi_nor_protocol	write_proto;
 	enum spi_nor_protocol	reg_proto;
+	bool			shutdown;
 	bool			sst_write_second;
 	struct sfdp		*sfdp;
 	struct dentry		*debugfs_root;

base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
-- 
2.34.1

