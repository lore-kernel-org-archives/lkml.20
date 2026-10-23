Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775021;
	b=H/VWDz9YmLiIvThHwxWebusBHbf+V6Rqgdpw3OO7LE+TaFXlQFKfNb9c6eIIsAoiXNVz
	 nza77QKaRTnpCLtE/4MHPMFnNwmOFF5Ytzu1iaRJKdQE7SLmQo6QIYrH8z2CQKuBsCh8X
	 qdldIiJvRhT/LHrR1gFARZ+8cFzgdFCYFv1kQt1g/OO4MOvs0wgSXKqA0GDDyJErAaM+d
	 jLEPQ751ZVjDj4le731khZNfcBEwsPjOjeZKnaqy7X1Z4K2411JBNwgvqVLR5yE48ptEF
	 qIHb8kzVNFDHGsLePRincJ+DolFJQjl8IqWAcxWV2/xsToc+K8T3Xqwa/4bMuVc3reQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775021;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=polE6Ne+EArcPG4oMwjyWJWJOuFChVzLTjy+aFTaauE=;
	b=VbtB4L28UqktAGKt5yFXazwpgbJXCvythS1OI/u3pj8hZzmmPDo0lVJPlzLh50nqcleE
	 Z6tw1Nv7FgPWFI4WB88Vq8x7c/fNJiC4j3nueSB4542L+QxBjpnY79U36QHvtohPvd5wa
	 JvnPJHdiFI3VSbSIcdGcCEiyM5XTiX5OSs+Jarii9iZnwrzazEQ7DMgN7dlN58BmMorX1
	 7FMEvnAqA7kp6O1Q/EfrynBqjI9KfAbbuprxnEl7IQPtdQIIgN1tw+kxaiHvbv6Gvj4cu
	 rOyKR9dmD3LJ6O4zzfhGLziLefsweDArQuR5x9gE0xlN1IV0aa0TwwnMQQvCnuW3l2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=p7QlVoSx;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E774606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:03:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E774606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=p7QlVoSx
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-185fd3a4ca3so994585c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792775020; x=1793379820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=polE6Ne+EArcPG4oMwjyWJWJOuFChVzLTjy+aFTaauE=;
        b=p7QlVoSxrvi72JoxHcA015BxNnYC5AtEDDNId5wRlZRDWzk8mNTwIeOQwus+HmpCII
         Fva4MAUWU8i9iB/vDIcng0Z0vwwHp1cArmT1wwgE7DeTpvNRQdKwkKYw/sVDZWIQGd4n
         Gag552fY6ZNbv2gXF7K3R7ZfT2qL7hY35gtVy/9UjMzmgDSX6Z98o4NTLaMBDdmxWeqg
         osyoTOBoSnfJrKCj+ymLpC+L3xPaw9T7SFE0250lMgwUIGQTsdsU+iIs20FECa6O/dEU
         viT4C53qcjIMGPEKFRsoa98os4xjwSQuiupJP2w2PB6BTgER2WT/gWYkYfQOnhn/1E2D
         JZxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775020; x=1793379820;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=polE6Ne+EArcPG4oMwjyWJWJOuFChVzLTjy+aFTaauE=;
        b=JEG1nRTB3qjMHewkHNNZHtzot/FdoQkgYir1H790JjV+JvaWFVjma9uPkj2jcXBgp7
         8Rfp2VXQesEP1d96Lk7Sn66QE0KmWvXvQTJZ4wqN6FZIZZwmrdSUsYP1YJ6rpdnYR0UC
         sBSulGnZO6Av9S2TDClY9LSu4euwkidwuB91boPezm9TWAPlvUZtmFAVDMAa0VV5lsrU
         VOa7hNVBzT0Y+hMOrU1aJ8/rPWISPEEoNkZCcqXoBSMR1tjuNGSsSzMbnmuU90BCB3nd
         OyyIRQkt7C76VrknMT3X9fXW/JIiRX9AmS3f8QxYVH0Ij7u7CO/z1Q5Fq4L7mh6XShW1
         t3KQ==
X-Forwarded-Encrypted: i=1; AKwUvBxkjKZRKRjzf74AKR8sXAXaw1zvzjc3gppl7uG+yv5jjh2QDd7MkHm2yYm2SlMc6xLVE/8ZiOXx2oraDCo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJYOCylgmfgfim1tHxFgDvRVQENYPJS5RzHtSqyWAnvAYTjv+BV
	F+Mf+WUtjoj4AN1e6yVXikHZUdGCpwJhF9TJxfNIdmfBPBg4q9Job8lXbVGzV1bW
X-Gm-Gg: AYBFou36vFe55RMwuHKRKW3zlKLgLmYws2ZIsiLqHkHr48FCs8WTDDoiZXw58fGdQvO
	0lXz5i3YXcbAf3grb1lhVIlJTrR0YOwlYGHNanQXaqdV9Cg1KZ2GcNQ7bACPkqlsvysB4vRyL3a
	UTg7BRRKvmBDx9/3yfTN5HapN6eaqh7mF+YirXZ7o5GAax+12JbPnFIk/JTtEhmAQxqaZpz9b5V
	B1GxTqxmJ+ziAmM0N6s/IKNOL6E3y2ryGr2wG+8EVzcbkFblxHYY6Gnh0f0MhYjHK1fypOToVep
	ecjBl0jpnSxYLJfNtP3YBxSXPs2iwjQAucDeXkkzMLUj3ruV3549I9vWBII2LJXVs6uBSC3MCGg
	wJpR5U+g8pWrkIg7PydvnvgyLLLH/0TEEC+T34xrDbynjwpeMibbj0HwQ5cZaie2nV/dMYBUau2
	YOEtlgDJ3Goop9XWULGARGPz2iPEXwIKyig4l2Tn4IkDgshHYJGXSBFRmPeRu4tk41OZlTWxctX
	AG+py5lH/zPihFMNOx6YDKYO2zQ4V2scXoc0fFe3jtyLWAB4wdvHX9Pw4+68q8uCoqHRQ==
X-Received: by 2002:a05:701b:2713:b0:14a:51c8:ea06 with SMTP id a92af1059eb24-195c5bc7828mr3380353c88.29.1792775019432;
        Fri, 23 Oct 2026 10:03:39 -0700 (PDT)
Received: from Alienware-m16.lan ([45.153.102.184])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-197ed12c43asm1308673c88.21.2026.10.23.10.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:03:38 -0700 (PDT)
From: Andrew Luebke <andrew.luebke@gmail.com>
To: Hannes Reinecke <hare@suse.com>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <mkp@kernel.org>,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrew Luebke <andrew.luebke@gmail.com>
Subject: [PATCH v2] scsi: aic79xx: Fix NULL pointer dereference in device reset
Date: Fri, 23 Oct 2026 10:03:30 -0700
Message-ID: <20261023170330.269844-1-andrew.luebke@gmail.com>
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

Making that call safe is not enough on its own. When the target accepts
the reset, ahd_handle_nonpkt_busfree() (or, in packetized mode, the task
management completion) calls ahd_handle_devreset(), and its
ahd_abort_scbs() walks the target's pending SCBs - the reset SCB
included - reading and setting their transaction status and freezing
them through the wrappers in aic79xx_osm.h, which dereference io_ctx.
The same walk runs if the reset times out and the error handler
escalates to a bus reset.

Commit c7f4c5dec651 ("scsi: aic79xx: Fix up NULL command in ahd_done()")
taught ahd_done() about the NULL command, but not these wrappers.

Let every accessor that dereferences the command accept an SCB without
one. The ahd_cmd_*() helpers for the transaction status and the SCSI
status check for a NULL command: the transaction status then reads as
CAM_REQ_INPROG and the SCSI status as SAM_STAT_GOOD, and setting either
does nothing. ahd_get_transfer_dir(), ahd_get_residual(),
ahd_set_residual() and ahd_freeze_scb() have no such helper underneath,
so they check scb->io_ctx themselves: the transfer direction reads as
DMA_NONE and the residual as 0, while setting the residual and freezing
the SCB do nothing. The ahd_set_residual(reset_scb, 0) call in
ahd_linux_dev_reset() is then harmless, and the reset SCB completes
through ahd_done() as that commit intended. The SCSI status, residual
and transfer direction accessors get the check so that none of them can
be handed the reset SCB and crash; the only path from the reset SCB to
them that is apparent is ahd_handle_scsi_status(), should a packetized
LUN RESET end in a status error.

ahd_perform_autosense() also declines autosense for an SCB without a
command. Otherwise a target that answered the reset with CHECK
CONDITION would have the reset SCB requeued for REQUEST SENSE, and with
negotiation pending ahd_handle_scsi_status() clears SCB_DEVICE_RESET on
the way, so ahd_done() would later dereference the missing command.
Declining leaves such a reset SCB to the reset timeout and the error
handler's escalation, which completes it through ahd_abort_scbs().

Tested on the SE7501WV2S with this patch applied to v7.2.11 (i686), on
the disks of its second AIC-7902 channel (160 MB/s DT, not packetized).
Device resets sent with SG_SCSI_RESET_DEVICE to a Seagate ST373453LW log
"Bus Device Reset Message Sent" and "Device reset returning 0x2002"
(SUCCESS), three of them while the disk was being read; the reads
complete, scsi_eh_1 survives and the disk keeps working. scsi_eh_1 also
survives a device reset of the channel's other disk - the one behind the
crash above, which accepts the reset but no longer spins up - and a bus
reset sent with SG_SCSI_RESET_BUS, after which the first disk still
works. The device resets go through ahd_handle_devreset() and
ahd_abort_scbs(), so they exercise the transaction status and freeze
accessors on the reset SCB. Not tested: the packetized (IU) LUN RESET
path, a device reset that times out and escalates to a bus reset, and
the autosense change, since a target here answers TARGET RESET with a
bus free as SCSI requires. The oops was not reproduced on purpose on an
unpatched kernel; the crash above came from the failing disk.

Fixes: c67e63800446 ("scsi: aic79xx: Do not reference SCSI command when resetting device")
Cc: stable@vger.kernel.org
Signed-off-by: Andrew Luebke <andrew.luebke@gmail.com>
Assisted-by: LLM
---

Notes:
    v2:
     - Keep ahd_set_residual(reset_scb, 0) in ahd_linux_dev_reset(): with
       the check in ahd_set_residual() the call is safe, and the patch now
       touches only aic79xx_osm.h (Hannes).
     - Move the NULL checks for the transaction status and the SCSI status
       into ahd_cmd_set_transaction_status(), ahd_cmd_set_scsi_status() and
       the two ahd_cmd_get_*() helpers (Hannes). ahd_set_residual() keeps
       its check in the SCB wrapper: it calls the midlayer's
       scsi_set_resid() directly, with no ahd_cmd_*() helper underneath.
       The same goes for ahd_get_residual(), ahd_get_transfer_dir() and
       ahd_freeze_scb().
     - ahd_perform_autosense() returns 0 for an SCB without a command, so a
       device reset that ends in CHECK CONDITION is not requeued for REQUEST
       SENSE with SCB_DEVICE_RESET cleared (found by the Sashiko AI review of
       v1).
    v1: https://patchwork.kernel.org/project/linux-scsi/patch/20261020221530.2606178-1-andrew.luebke@gmail.com/
    
    This analysis, the patch and this changelog were prepared with an LLM coding
    assistant (Claude Opus 5.5, Anthropic) at my direction; I reviewed them and
    ran the hardware tests described above. Build-tested with W=1 for
    x86_64 and i386 on mkp/scsi.git for-next (db8b4d2bf2d3): no new warnings;
    checkpatch clean. sparse and smatch were not run.

 drivers/scsi/aic7xxx/aic79xx_osm.h | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/scsi/aic7xxx/aic79xx_osm.h b/drivers/scsi/aic7xxx/aic79xx_osm.h
index c6eb2b97e..1facfd238 100644
--- a/drivers/scsi/aic7xxx/aic79xx_osm.h
+++ b/drivers/scsi/aic7xxx/aic79xx_osm.h
@@ -501,6 +501,8 @@ int	ahd_linux_show_info(struct seq_file *,struct Scsi_Host *);
 static inline
 void ahd_cmd_set_transaction_status(struct scsi_cmnd *cmd, uint32_t status)
 {
+	if (!cmd)
+		return;
 	cmd->result &= ~(CAM_STATUS_MASK << 16);
 	cmd->result |= status << 16;
 }
@@ -514,6 +516,8 @@ void ahd_set_transaction_status(struct scb *scb, uint32_t status)
 static inline
 void ahd_cmd_set_scsi_status(struct scsi_cmnd *cmd, uint32_t status)
 {
+	if (!cmd)
+		return;
 	cmd->result &= ~0xFFFF;
 	cmd->result |= status;
 }
@@ -527,6 +531,8 @@ void ahd_set_scsi_status(struct scb *scb, uint32_t status)
 static inline
 uint32_t ahd_cmd_get_transaction_status(struct scsi_cmnd *cmd)
 {
+	if (!cmd)
+		return CAM_REQ_INPROG;
 	return ((cmd->result >> 16) & CAM_STATUS_MASK);
 }
 
@@ -539,6 +545,8 @@ uint32_t ahd_get_transaction_status(struct scb *scb)
 static inline
 uint32_t ahd_cmd_get_scsi_status(struct scsi_cmnd *cmd)
 {
+	if (!cmd)
+		return SAM_STAT_GOOD;
 	return (cmd->result & 0xFFFF);
 }
 
@@ -566,13 +574,16 @@ u_long ahd_get_transfer_length(struct scb *scb)
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
@@ -584,6 +595,8 @@ void ahd_set_sense_residual(struct scb *scb, u_long resid)
 static inline
 u_long ahd_get_residual(struct scb *scb)
 {
+	if (!scb->io_ctx)
+		return 0;
 	return scsi_get_resid(scb->io_ctx);
 }
 
@@ -597,11 +610,12 @@ static inline
 int ahd_perform_autosense(struct scb *scb)
 {
 	/*
-	 * We always perform autosense in Linux.
-	 * On other platforms this is set on a
-	 * per-transaction basis.
+	 * We always perform autosense in Linux, except for the device
+	 * reset SCB, which has no command to return sense data to.
 	 */
-	return (1);
+	if (!scb->io_ctx)
+		return 0;
+	return 1;
 }
 
 static inline uint32_t
@@ -631,6 +645,8 @@ void	ahd_platform_freeze_devq(struct ahd_softc *ahd, struct scb *scb);
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

