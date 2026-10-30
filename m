Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793392450;
	b=0avanePOpLJkJqUmHisXZJeIUjv2s6w6KbyG8kHlnOK1iIKj2NqmQFIXemojj4yapFLV
	 pC3qxKFlAiCF9Hwnj4Gyf2JFq3r1Xru6lRCkIsuTk+x+AgRvlsARSWKcikZiTirorL94e
	 /qC0V+DhyR4Z6pORrilkoRjZ3ep/RP1eccvHN82e4Q6VqdcjqELabxVRl72ihU4u4didd
	 W+MrSM9OEBMNW9Cm/KI7yGYLd/4qLg+v0/vH4R1gi8w1pEmn92iSCKWBRmN2pekPfbW4r
	 T6SyWWEwBghWfxnUJK6OxYNz1J9FKIp1oaEOMnJniA8ulYgrVyEvNjEwQG8TelD/6Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793392450;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4Nw8NpVUaIYw76IIZWbK2cq2xyPR6mLCTZOaoZttbUk=;
	b=YXAoNcREIJVzhWWihq0kLgDnUoD4+KWeaMNJB2uqV4MVcZnBSuzLWcVrIOG/1kl3H5iI
	 2ix0UYUb6BppsdJ93gHeWe+8PPhj0vz3QaVXD6S00kbxwA24hetIuR2M95h6QUpDw3Ajr
	 xUOgUAnlKtLTC0+cPh8R8AUeyKLvdSVRrpTgFjT+A45oPPscDN1gy/9MEghvntXmRa7Sj
	 DUNfdgT7jqpxbwPr7ZuULphUJg9AySzeMqqg4mig1HtYWM9Ji0ObdeE3W0PgLjB18cOIU
	 033p8/zeENNSB8ZOQ3az8rZ0p+NqpkFO/txLoeYcUVvbzUHRSXR+FEwCnZRNyisjQLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Prlh1tqx;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB46A606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:34:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB46A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Prlh1tqx
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so1804465a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793392448; x=1793997248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4Nw8NpVUaIYw76IIZWbK2cq2xyPR6mLCTZOaoZttbUk=;
        b=Prlh1tqxN9NJEwFl/0WgLNFvOFVvswkxrWT8RIGJ69ZJy7IxcKRgJ/ZyR4vrmHOGxe
         8YtPysq/hXarIAkD9sGQXkDnrRV17hIse5z4nRGTRRtXgIRSxPLvP4HWIdPVZvN7GF2O
         5ZpPAVFy1e/x+LIfy92lf8VvlnkSjbavHIghgGIfbYSs+ib0w0hdu80SyqB15GKU31yr
         PadK7dRY9nS8DYY99YYef6ty7FLA0HSoNDZ0elKk9urf6QcPVBzFqx3X0njW6d3HGUTR
         UQPy+Fg7DKLfyDBs0WBXrOZv6zQe2vpUdmjRWf3eai9fZfTZEbOI312DeLREB1XraNqm
         oZGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793392448; x=1793997248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Nw8NpVUaIYw76IIZWbK2cq2xyPR6mLCTZOaoZttbUk=;
        b=iIVbwx32cJf/5RLFQaYmREOL7IXuNQAm6oHAoqJr0oOI+L3OxKuKifUNyhJ3N9TAI9
         vZTGuQWcm1SD/XzTguEpjyEzpmT3Y3mg49ODTI7MTk+5hyKst31bf2lx+kJ1mxnqUqxm
         WsN8M3H4zh3mtQPaxoEmVjBfDi0XBeQrQVsfV1QNJ3yXGkIOmI8S8yz9i6DkSKobHqd5
         m3Xpa4rT+jfrIJjdsFaGNRydwC2zKtorbyA4IWLd9DxksOPDTIK96caX2Y5sGE/gbuoT
         T3B0nHuFRN53rixmUCIqIytfImcau78E1uReeY3abld8sI2FdUarFRuXDLEocezbWRdr
         Gtgw==
X-Forwarded-Encrypted: i=1; AKwUvBxPemDKcQUl8F4LqKYvavbnIyuQZtfD/JPL0r0/iuj+HrBlIcb/yOuw1hUEKUUul1OvNx7AqiYvDKAGONE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKxNm+k9cawJNnDRbLcXqIy9V7ifjRCJi0opR2/TY7zYJk/jcOE
	AZkFxuD1rCiGvtfoVnK1TStTaM7/D6pqTCL0f7psH0aZ8MFQWWXWIXA=
X-Gm-Gg: AYBFou2cPSCho0QYJXBSTxITqxVpPuGNZWDe+4LPS+PX9J5DE3VdLvinv2j4oq1m3ui
	0sQbS8p57eWMpc8fzw43CmHgEO5FNIz+T6IgtNvkhQw/hyypzgUnn97b04RRgYO43vNWS87nUwh
	iAbglExS8kMu8W2dxBDl8dF/vc8akxUUw6EoUHUm8+yhTdsK6JuAXHiW0xP2ytDIKhL0jsqTPl0
	jWbsiCPPU79pO6OFovGATINB26ZGPSgiDl6NoSt1EZEn3bprVQsv04l3x1LmupxNTkVRGfEb3Fk
	Zq70BCBBSinYpxKyaHnelYltr81KItmiP53/fxxdDa3BE9R/tGZRa+c4Ik1FnsWZTsboWyHhc9F
	RLRnd7tnHPJ0aueTaJsrnSC4mV601XPdhZ1AnELwZvGwPPMahkAeoq3UA7wnxuygt9XdgI/B+9h
	p56xO0NCgVI1qYFG7GKV8aDD/EQKa57lOKz++IFP0JuzPm4oAYtiwdMnSC3V1xBx8IbrKswOHM5
	32wIaIdIltW3M+V/CTmzOuR9xduwUdSmk9huxl6+l7wi/PRXgj2nvOAbcJEcAxrv1KpAJL9cx66
	im9VVNDIaYa+FHM2GTo=
X-Received: by 2002:a05:6402:74b:b0:6a5:fbc6:cad1 with SMTP id 4fb4d7f45d1cf-6b4d4687f4dmr1772470a12.7.1793392447949;
        Fri, 30 Oct 2026 13:34:07 -0700 (PDT)
Received: from fedora ([46.8.219.5])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec9eebb0sm309091a12.8.2026.10.30.13.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 13:34:07 -0700 (PDT)
From: Vitaliy Sochnev <sochnev.v.74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Vitaliy Sochnev <sochnev.v.74@gmail.com>,
	Mikhail Zhilkin <csharper2005@gmail.com>
Subject: [PATCH] mtd: spinand: confirm ready state on SkyHigh S35ML chips
Date: Fri, 30 Oct 2026 22:33:42 +0200
Message-ID: <20261030203342.91172-1-sochnev.v.74@gmail.com>
X-Mailer: git-send-email 2.55.0
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

On a Nokia XG-040G-MD with a SkyHigh 256 MiB SPI-NAND, UBI reports
fixable bit-flips during rootfs mount without this workaround:

  ubi0: fixable bit-flip detected at PEB 1979
  ubi0: schedule PEB 1979 for scrubbing
  ubi0: scrubbed PEB 1979 (LEB 5:53), data moved to PEB 645

Other reboots also report fixable bit-flips. A tester reports that after
applying the workaround, sysupgrade, multiple reboots and an active
workload produced no such warnings. Long-term operation is unverified.

spinand_wait() accepts a single non-busy status sample. On these chips,
the ready bit can briefly clear before the device is actually ready,
allowing a premature cache read or a new program/erase command. The
fallback status read for controllers with poll_status offload does not
provide a second ready confirmation in the usual case.

Mark the affected SkyHigh parts with a quirk and require a second ready
status sample after spinand_wait() for those parts. If the chip becomes
busy again, repeat the wait while the outer timeout has not elapsed.
Each inner wait has its own timeout, so the quirk can wait up to roughly
twice as long. Leave other SPI-NAND parts unchanged.

Suggested-by: Mikhail Zhilkin <csharper2005@gmail.com>
Signed-off-by: Vitaliy Sochnev <sochnev.v.74@gmail.com>
---
Notes for reviewers:

The two ready samples are taken in separate SPI transactions, without an
explicit delay. The duration of the premature-ready interval has not been
measured. If both samples fall within that interval, the wait can still
return too early. Would a measured, explicit delay be preferable here?

The on-device result comes from a Nokia XG-040G-MD with a 256 MiB SkyHigh
chip running OpenWrt with this workaround. The linux-next port has only
been compile-tested; the other S35ML entries flagged by this patch have
not been tested on hardware with this workaround.

 drivers/mtd/nand/spi/core.c    | 85 +++++++++++++++++++++++++++-------
 drivers/mtd/nand/spi/skyhigh.c | 12 +++--
 include/linux/mtd/spinand.h    |  1 +
 3 files changed, 76 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 133776ba53da0..b051ff1d6be5c 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -710,6 +710,53 @@ int spinand_wait(struct spinand_device *spinand, unsigned long initial_delay_us,
 	return status & STATUS_BUSY ? -ETIMEDOUT : 0;
 }
 
+/**
+ * spinand_wait_ready_confirmed() - Wait for the device to be ready
+ * @spinand: the spinand device
+ * @initial_delay_us: delay in us before starting to poll
+ * @poll_delay_us: time to sleep between reads in us
+ * @s: the pointer to variable to store the value of REG_STATUS
+ *
+ * Same as spinand_wait(), except for devices flagged with
+ * SPINAND_PREMATURE_READY_QUIRK, whose ready bit can flip back to busy
+ * shortly after first reporting ready. For those, a ready result from
+ * spinand_wait() is only trusted once a follow-up status read still shows
+ * the device ready, and spinand_wait() is called again otherwise. Each
+ * spinand_wait() gets its own SPINAND_WAITRDY_TIMEOUT_MS budget and no
+ * new one is started once that span has elapsed, so such a device can
+ * spend up to roughly twice that time here.
+ *
+ * Return: 0 on success, a negative error code otherwise.
+ */
+static int spinand_wait_ready_confirmed(struct spinand_device *spinand,
+					unsigned long initial_delay_us,
+					unsigned long poll_delay_us, u8 *s)
+{
+	unsigned long timeo;
+	u8 status;
+	int ret;
+
+	if (!(spinand->flags & SPINAND_PREMATURE_READY_QUIRK))
+		return spinand_wait(spinand, initial_delay_us, poll_delay_us, s);
+
+	timeo = jiffies + msecs_to_jiffies(SPINAND_WAITRDY_TIMEOUT_MS);
+	do {
+		ret = spinand_wait(spinand, initial_delay_us, poll_delay_us,
+				   &status);
+		if (ret < 0)
+			return ret;
+
+		ret = spinand_read_status(spinand, &status);
+		if (ret)
+			return ret;
+	} while ((status & STATUS_BUSY) && time_before(jiffies, timeo));
+
+	if (s)
+		*s = status;
+
+	return status & STATUS_BUSY ? -ETIMEDOUT : 0;
+}
+
 static int spinand_read_id_op(struct spinand_device *spinand, u8 naddr,
 			      u8 ndummy, u8 *buf)
 {
@@ -733,10 +780,10 @@ static int spinand_reset_op(struct spinand_device *spinand)
 	if (ret)
 		return ret;
 
-	return spinand_wait(spinand,
-			    SPINAND_RESET_INITIAL_DELAY_US,
-			    SPINAND_RESET_POLL_DELAY_US,
-			    NULL);
+	return spinand_wait_ready_confirmed(spinand,
+					    SPINAND_RESET_INITIAL_DELAY_US,
+					    SPINAND_RESET_POLL_DELAY_US,
+					    NULL);
 }
 
 static int spinand_lock_block(struct spinand_device *spinand, u8 lock)
@@ -767,10 +814,10 @@ int spinand_read_page(struct spinand_device *spinand,
 	if (ret)
 		return ret;
 
-	ret = spinand_wait(spinand,
-			   SPINAND_READ_INITIAL_DELAY_US,
-			   SPINAND_READ_POLL_DELAY_US,
-			   &status);
+	ret = spinand_wait_ready_confirmed(spinand,
+					   SPINAND_READ_INITIAL_DELAY_US,
+					   SPINAND_READ_POLL_DELAY_US,
+					   &status);
 	if (ret < 0)
 		return ret;
 
@@ -814,10 +861,10 @@ int spinand_write_page(struct spinand_device *spinand,
 	if (ret)
 		return ret;
 
-	ret = spinand_wait(spinand,
-			   SPINAND_WRITE_INITIAL_DELAY_US,
-			   SPINAND_WRITE_POLL_DELAY_US,
-			   &status);
+	ret = spinand_wait_ready_confirmed(spinand,
+					   SPINAND_WRITE_INITIAL_DELAY_US,
+					   SPINAND_WRITE_POLL_DELAY_US,
+					   &status);
 	if (ret)
 		return ret;
 
@@ -939,8 +986,10 @@ static int spinand_mtd_continuous_page_read(struct mtd_info *mtd, loff_t from,
 		if (ret)
 			goto end_cont_read;
 
-		ret = spinand_wait(spinand, SPINAND_READ_INITIAL_DELAY_US,
-				   SPINAND_READ_POLL_DELAY_US, NULL);
+		ret = spinand_wait_ready_confirmed(spinand,
+						   SPINAND_READ_INITIAL_DELAY_US,
+						   SPINAND_READ_POLL_DELAY_US,
+						   NULL);
 		if (ret < 0)
 			goto end_cont_read;
 
@@ -1196,10 +1245,10 @@ static int spinand_erase(struct nand_device *nand, const struct nand_pos *pos)
 	if (ret)
 		return ret;
 
-	ret = spinand_wait(spinand,
-			   SPINAND_ERASE_INITIAL_DELAY_US,
-			   SPINAND_ERASE_POLL_DELAY_US,
-			   &status);
+	ret = spinand_wait_ready_confirmed(spinand,
+					   SPINAND_ERASE_INITIAL_DELAY_US,
+					   SPINAND_ERASE_POLL_DELAY_US,
+					   &status);
 
 	if (!ret && (status & STATUS_ERASE_FAILED))
 		ret = -EIO;
diff --git a/drivers/mtd/nand/spi/skyhigh.c b/drivers/mtd/nand/spi/skyhigh.c
index bf9ce163e6a7b..19f2380b0427a 100644
--- a/drivers/mtd/nand/spi/skyhigh.c
+++ b/drivers/mtd/nand/spi/skyhigh.c
@@ -88,7 +88,8 @@ static const struct spinand_info skyhigh_spinand_table[] = {
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
-		     SPINAND_NO_RAW_ACCESS,
+		     SPINAND_NO_RAW_ACCESS |
+		     SPINAND_PREMATURE_READY_QUIRK,
 		     SPINAND_ECCINFO(&skyhigh_spinand_ooblayout,
 				     skyhigh_spinand_ecc_get_status)),
 	SPINAND_INFO("S35ML01G300",
@@ -98,7 +99,8 @@ static const struct spinand_info skyhigh_spinand_table[] = {
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
-		     SPINAND_NO_RAW_ACCESS,
+		     SPINAND_NO_RAW_ACCESS |
+		     SPINAND_PREMATURE_READY_QUIRK,
 		     SPINAND_ECCINFO(&skyhigh_spinand_ooblayout,
 				     skyhigh_spinand_ecc_get_status)),
 	SPINAND_INFO("S35ML02G300",
@@ -108,7 +110,8 @@ static const struct spinand_info skyhigh_spinand_table[] = {
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
-		     SPINAND_NO_RAW_ACCESS,
+		     SPINAND_NO_RAW_ACCESS |
+		     SPINAND_PREMATURE_READY_QUIRK,
 		     SPINAND_ECCINFO(&skyhigh_spinand_ooblayout,
 				     skyhigh_spinand_ecc_get_status)),
 	SPINAND_INFO("S35ML04G300",
@@ -118,7 +121,8 @@ static const struct spinand_info skyhigh_spinand_table[] = {
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
-		     SPINAND_NO_RAW_ACCESS,
+		     SPINAND_NO_RAW_ACCESS |
+		     SPINAND_PREMATURE_READY_QUIRK,
 		     SPINAND_ECCINFO(&skyhigh_spinand_ooblayout,
 				     skyhigh_spinand_ecc_get_status)),
 };
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index d7c99fcfb85ef..0767964275cf2 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -492,6 +492,7 @@ struct spinand_ecc_info {
 #define SPINAND_HAS_READ_PLANE_SELECT_BIT		BIT(3)
 #define SPINAND_NO_RAW_ACCESS				BIT(4)
 #define SPINAND_ODTR_PACKED_PAGE_READ			BIT(5)
+#define SPINAND_PREMATURE_READY_QUIRK			BIT(6)
 
 /**
  * struct spinand_ondie_ecc_conf - private SPI-NAND on-die ECC engine structure

base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
