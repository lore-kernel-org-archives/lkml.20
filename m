Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792534555;
	b=OwC+owktcq/fN97WlXpCPO42wBE/f2mCZuC2kCeyqKMa4VDsTHqgz0ZnHIIP61ph3Ets
	 bg7uvhtaq8rSwMh6uc1piHNfKNkfmXX93H8EUe7Mj1jTFKC5cVz8l4HJ5w1Dh+BgAX1Fy
	 JvsPfigLLO0GESlzwPq96T1iUbU1yxt0cVvL8KilnQc0M3eTsuQaS8gidxW3lsoKDZClU
	 x32w+/jmmoQUePDz6Y8R4i+AdRDtjtRrjMhfozGEkQAXFq7cmEKCJCiuCU9ovIUzxpuTZ
	 MmivahJphJcaPZqh9GYw1zKus6mM0YNTxZ0Sa1FsIlZ2HeF6ZDs4Kg3k3y1fRvOrIPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792534555;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BOERBX4irxAK4WKXyDkoVTPC39eehwLpXtOXPRCNgv0=;
	b=FGi3uwnEDJn8CNQTibs6KLjbMeGQuCnETgCjCNLJG2CIAjckU2lhB9c0mHqmhh3fRvzh
	 9/8O/xDdnLmDGq1epcqUgoKF8mcre8f76eCwGWu3Dd+7sFyXrg7ucRkzWWZtsZFDPEILj
	 +S12tIIGynGsoUnMRCXmqARKmLMVpesOcXBTnedRClCs9oo0r3l92SnpYtR8g/Alo1yqu
	 onmm8uB7z+qOqeSFLiSVQ/lx/qCY8AjSKTd/AIgMV0hWctvkjqPMFUXu1Cy0hTe2u/AlL
	 pxgcuXQSiuF3tP4apIR3IpQtho155H6L3dVgEcdrVnr9i3UP5TX+4YteO0W9YmKdOJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gDUQ49gJ;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2F6606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 22:15:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB2F6606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gDUQ49gJ
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2dd76b1361dso737175ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792534554; x=1793139354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BOERBX4irxAK4WKXyDkoVTPC39eehwLpXtOXPRCNgv0=;
        b=gDUQ49gJcOcdn2BoDnxJv0Q4HiSZ2FG9wxgwoSwpwTJyFyZReMKPLgR1gluh+O3L8u
         QuUXz1qTP+x3HK698yGzw2MnRFFhXYkGunXa8ZBKUpPLnmtIkZYieQVxihtjgt+GaGX9
         Us/i/hXHRWJswCsG+zQe9V1HfHNTERNP2yQ8QvucIijkZZZr2ojmKmj7FaCqJESqzgCO
         ZtFkVB8efmLIVoJ1CInYDbf5nNctGcmHGI3C+vlb4kp1pa+6ujzOld4VEsebhI8mcR+P
         t7prJnVpHX2wwFxyy5pQyvF50zVV9b/s5MiV/rCca5MwcpDmzvjvxAAEXOhlSkZq6mCC
         7QqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792534554; x=1793139354;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BOERBX4irxAK4WKXyDkoVTPC39eehwLpXtOXPRCNgv0=;
        b=XAT0eb//eEeb3wb7s0e6kh2/vb+qFKVlSSsjQFTMFdJG+oKRidhPSW09tGOWSKwNGT
         h+dR2rHTS1n4EVxeCRlaNVV3h/MmrhIoT6xqQ1n4Ct+pcJErKDntS3qz+CE2LEdvl6Zb
         UoL2nhtmmJLz+ignyDyJKq400VWAhSq5tnKTamj17TKWdglICKns8coU281as5kuGmHH
         96q7DM1a/VVU8Dz254a9W5c/CUnD5rAU8e3ndOnJgeDOaHSLhFNG1Y/gaY+/JKtxO/8h
         EiBguWEUiBrgAVnw2uUPOwHIXsKCio4QpKzjeX60ybW8gYqbhN3B7xbBonv0qesd97eM
         ZtNA==
X-Forwarded-Encrypted: i=1; AKwUvBwn0vNaQzB145Ndf6qeq+PCg0jD6ZRj8TZkWGQ4XNn/9bbDgxZgNQgdcM9SfeSmvQtq/z+fs1TKeRPmAQc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKjcsM9tgFIF3FkJkr45XyuzQe48gFkgfm0yf9tJ1HZGvtRT010
	BDFuwg1ipBJ3TBU7SKOEgJHtW+KzhyqwN58XsbrGG7gshNmfhAi2esgo
X-Gm-Gg: AYBFou1hiFCIrdy2mL1+wKfSju1jAWLd4oXfLoxK7QkXG6BO9mlZSiQpKW1sE41paGg
	EcagBR6gGmOdXAyt1L/q6ymBGRjCEwZ5IELVb1/tzRQz1YHdvJ8Le7cYG/ladom614ccUUXXatO
	+gxzIK/PWrG+j4WcBThDtqVBeGe2TMatshAk+Yr54uStY/3YJs+ZgnlnCVEI/YtadfRZYBeyYmp
	VutG9L7NcAZVjZ6jOSBiCMuPj+EZce77oyV5AI6hRStUZVlIm3aHvb/wOg8hrG36dAXO9739YBi
	WHMWGt9dAyVh3XRywMFg8tiFcJyETzyj1VbPStLjekyXuVHVTpmeh+cY6YuWgCFmicTTopnWC6z
	jtbkZH094MCCSK4t0luzfbsa230RRhStNnmBy0GdPg0FLGBuQbrYreEHpV/N1VNiK9GIUi6PKDa
	eG1Z3AAz5KNsRJIXgv4eQDb3tIy0dOEM6HlQhfXPRFR5HSH5pglBstaT7nwF/BkXXmOW/4kdWYW
	CX3W9zICk2yTw==
X-Received: by 2002:a17:903:2309:b0:2e6:943:39de with SMTP id d9443c01a7336-2ea43e259cemr964625ad.30.1792534553877;
        Tue, 20 Oct 2026 15:15:53 -0700 (PDT)
Received: from Alienware-m16.lan ([45.153.102.184])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b410659sm3556285ad.22.2026.10.20.15.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 15:15:52 -0700 (PDT)
From: Andrew Luebke <andrew.luebke@gmail.com>
To: Hannes Reinecke <hare@suse.com>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <mkp@kernel.org>,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrew Luebke <andrew.luebke@gmail.com>
Subject: [PATCH] scsi: aic79xx: Fix NULL pointer dereference in device reset
Date: Tue, 20 Oct 2026 15:15:30 -0700
Message-ID: <20261020221530.2606178-1-andrew.luebke@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Commit c67e63800446 ("scsi: aic79xx: Do not reference SCSI command when
resetting device") makes ahd_linux_dev_reset() build its TARGET RESET
SCB with io_ctx set to NULL, but the function still calls
ahd_set_residual(reset_scb, 0) a few lines later, which is
scsi_set_resid() on the NULL command. Every call of the device reset
handler therefore oopses and kills the SCSI error handler thread; all
further I/O on that host hangs until the machine is power cycled.

Hit on an Intel SE7501WV2S board (on-board AIC-7902, i686, v7.2.9) when
a failing Ultra320 disk made the error handler escalate to a device
reset. Both disks on that channel then stayed in D state:

  sd 1:0:0:0: [sda] tag#287 Attempting to queue a TARGET RESET message:
  BUG: kernel NULL pointer dereference, address: 0000009c
  #PF: supervisor write access in kernel mode
  EIP: ahd_linux_dev_reset.cold+0xee/0x26e
  Call Trace:
   scsi_eh_ready_devs+0x538/0x8d0
   scsi_error_handler+0x3a2/0x3b0
   kthread+0xd2/0x120
  note: scsi_eh_1[78] exited with irqs disabled

(0x9c is resid_len in struct scsi_cmnd on i386.)

Removing that call alone is not enough. When the target accepts the
reset, ahd_handle_nonpkt_busfree() (or, in packetized mode, the task
management completion) calls ahd_handle_devreset(), and its
ahd_abort_scbs() walks the target's pending SCBs - the reset SCB
included - reading and setting their transaction status and freezing
them through the wrappers in aic79xx_osm.h, which dereference io_ctx.
The same walk runs if the reset times out and the error handler
escalates to a bus reset.

Commit c7f4c5dec651 ("scsi: aic79xx: Fix up NULL command in ahd_done()")
taught ahd_done() about the NULL command, but not these wrappers.

Drop the residual write, and let every wrapper that dereferences io_ctx
accept an SCB without a command: the transaction status reads as
CAM_REQ_INPROG, the SCSI status as SAM_STAT_GOOD, the transfer
direction as DMA_NONE and the residual as 0, while setting a status or
the residual and freezing the SCB do nothing. The reset SCB then
completes through ahd_done() as that commit intended. The SCSI status,
residual and transfer direction wrappers get the same check so that no
wrapper can be handed the reset SCB and crash; the only path from the
reset SCB to them that is apparent is ahd_handle_scsi_status(), should
a packetized LUN RESET end in a status error.

Tested on the SE7501WV2S with the same change applied to v7.2.11
(i686): a device reset sent with SG_SCSI_RESET_DEVICE to a healthy
Seagate ST373453LW logs "Bus Device Reset Message Sent" and "Device
reset returning 0x2002" (SUCCESS), scsi_eh_1 survives and the disk
keeps working. That run goes through ahd_handle_devreset() and
ahd_abort_scbs(), so it exercises the transaction status and freeze
wrappers on the reset SCB. Not tested: the packetized (IU) LUN RESET
path and the bus reset escalation. The oops was not reproduced on
purpose on an unpatched kernel; the crash above came from the failing
disk.

Fixes: c67e63800446 ("scsi: aic79xx: Do not reference SCSI command when resetting device")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Andrew Luebke <andrew.luebke@gmail.com>
---

Notes:
    This analysis, the patch and this changelog were prepared with an LLM coding
    assistant (Claude Opus 5.5, Anthropic) at my direction; I reviewed them and
    ran the hardware test described above. Build-tested with W=1 for x86_64 and
    i386 on mkp/scsi.git for-next (db8b4d2bf2d3): no new warnings. sparse and
    smatch were not run.

 drivers/scsi/aic7xxx/aic79xx_osm.c |  1 -
 drivers/scsi/aic7xxx/aic79xx_osm.h | 19 ++++++++++++++++---
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/scsi/aic7xxx/aic79xx_osm.c b/drivers/scsi/aic7xxx/aic79xx_osm.c
index feb1707fe..4c603ad63 100644
--- a/drivers/scsi/aic7xxx/aic79xx_osm.c
+++ b/drivers/scsi/aic7xxx/aic79xx_osm.c
@@ -819,7 +819,6 @@ ahd_linux_dev_reset(struct scsi_cmnd *cmd)
 	reset_scb->io_ctx = NULL;
 	reset_scb->platform_data->dev = dev;
 	reset_scb->sg_count = 0;
-	ahd_set_residual(reset_scb, 0);
 	ahd_set_sense_residual(reset_scb, 0);
 	reset_scb->platform_data->xfer_len = 0;
 	reset_scb->hscb->control = 0;
diff --git a/drivers/scsi/aic7xxx/aic79xx_osm.h b/drivers/scsi/aic7xxx/aic79xx_osm.h
index c6eb2b97e..b47aa6c98 100644
--- a/drivers/scsi/aic7xxx/aic79xx_osm.h
+++ b/drivers/scsi/aic7xxx/aic79xx_osm.h
@@ -508,7 +508,8 @@ void ahd_cmd_set_transaction_status(struct scsi_cmnd *cmd, uint32_t status)
 static inline
 void ahd_set_transaction_status(struct scb *scb, uint32_t status)
 {
-	ahd_cmd_set_transaction_status(scb->io_ctx,status);
+	if (scb->io_ctx)
+		ahd_cmd_set_transaction_status(scb->io_ctx, status);
 }
 
 static inline
@@ -521,7 +522,8 @@ void ahd_cmd_set_scsi_status(struct scsi_cmnd *cmd, uint32_t status)
 static inline
 void ahd_set_scsi_status(struct scb *scb, uint32_t status)
 {
-	ahd_cmd_set_scsi_status(scb->io_ctx, status);
+	if (scb->io_ctx)
+		ahd_cmd_set_scsi_status(scb->io_ctx, status);
 }
 
 static inline
@@ -533,6 +535,8 @@ uint32_t ahd_cmd_get_transaction_status(struct scsi_cmnd *cmd)
 static inline
 uint32_t ahd_get_transaction_status(struct scb *scb)
 {
+	if (!scb->io_ctx)
+		return CAM_REQ_INPROG;
 	return (ahd_cmd_get_transaction_status(scb->io_ctx));
 }
 
@@ -545,6 +549,8 @@ uint32_t ahd_cmd_get_scsi_status(struct scsi_cmnd *cmd)
 static inline
 uint32_t ahd_get_scsi_status(struct scb *scb)
 {
+	if (!scb->io_ctx)
+		return SAM_STAT_GOOD;
 	return (ahd_cmd_get_scsi_status(scb->io_ctx));
 }
 
@@ -566,13 +572,16 @@ u_long ahd_get_transfer_length(struct scb *scb)
 static inline
 int ahd_get_transfer_dir(struct scb *scb)
 {
+	if (!scb->io_ctx)
+		return DMA_NONE;
 	return (scb->io_ctx->sc_data_direction);
 }
 
 static inline
 void ahd_set_residual(struct scb *scb, u_long resid)
 {
-	scsi_set_resid(scb->io_ctx, resid);
+	if (scb->io_ctx)
+		scsi_set_resid(scb->io_ctx, resid);
 }
 
 static inline
@@ -584,6 +593,8 @@ void ahd_set_sense_residual(struct scb *scb, u_long resid)
 static inline
 u_long ahd_get_residual(struct scb *scb)
 {
+	if (!scb->io_ctx)
+		return 0;
 	return scsi_get_resid(scb->io_ctx);
 }
 
@@ -631,6 +642,8 @@ void	ahd_platform_freeze_devq(struct ahd_softc *ahd, struct scb *scb);
 static inline void
 ahd_freeze_scb(struct scb *scb)
 {
+	if (!scb->io_ctx)
+		return;
 	if ((scb->io_ctx->result & (CAM_DEV_QFRZN << 16)) == 0) {
 		scb->io_ctx->result |= CAM_DEV_QFRZN << 16;
 		scb->platform_data->dev->qfrozen++;

base-commit: db8b4d2bf2d3e02b4ff78bbf69d00e11795840de
-- 
2.47.3
