Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793035241;
	b=QZRQU2F0UwgBRpcfDVe7VBD4uoP4Tf5T2Z+jolU1XH09CzZNsKbsirm+zgqjxcYpEObV
	 iBGPSLNGZJCIHYBtCCaTzlNqsfiK82ck4YxciDD3joWzqmxWgck1wZuCLnSXpakRHxFVc
	 DkGs/B/+kTA8/hkZollwPznc4Ut7Z33GjSJ0THsQOCkqatrbPYvsAdnybQ768+XtjXAhn
	 k7kWU0gZ8TwVAgWPir5w7wDxiQu7qAhf9mNdMIXQFJxEYjDG/FMMS27RSxpwqvfaqrm+Z
	 qp+ha/DRiHo1wSLXlVjtzkO7ERo/VXhOI/vE97cn17nEhnpdmjqrBSfsDZQAR3Ji+xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793035241;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZT0Bj1ansxkDq0zLewi3OJq5Bnf4fsSjPUxb7R/HFtk=;
	b=rGMYU1jV4QStfh4zeRIfESpzQMH36QKcKOI8luhyEHVXieFAGxdr95K56YuCbmPOeRAS
	 ueUqT0krXypVhIqKi8nHr/iX1O6CWwf6ADz1dXp3zmjrGzqlIv0PGLQapn4X8/PA4sH6O
	 U4lJfgp/u2lzGqlL4weM2cVSttHMuUFRqjajKiTD84ne9AK7xDp0Ei7JQRaEP+s18JMzO
	 EjYtH/IADdW6XGAcHjUUoM2YhGNB+0PcOc4cmV4jqyA4x0xbedAiHX9C+O9IxW4VvUd/S
	 Tw8EJ+uyBUhhYQKKvJxY6gVD9d3ahLuZ8U/RytXrYQlPGDb76Lhc8UrJTysEpgXQaEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Yvl1+sVl;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFAC606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 17:20:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADFAC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Yvl1+sVl
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-19305bcb72cso2359946c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793035240; x=1793640040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZT0Bj1ansxkDq0zLewi3OJq5Bnf4fsSjPUxb7R/HFtk=;
        b=Yvl1+sVlXWOY4zHIL9Pd2ML74mADDJTA4cOLOsZswMBwHnN+ZqqIAcyKjvMccycPce
         rCWcmwSsnwNGpQV4nkf9bG45iBmqPxmUnrko9yJ2Q23tOXWMp1/R02s0Dyu2HdeGl1OU
         Yk9uA6RNWqpfRf3HmL6Zin4N6vk4z9w6dOgERrod30f53YIjgSaVzZg3CPwBiQ3lrm0C
         w209u0Q8voCWS2NG/wCtgJIuwixpZ0gBbVC3IIFRdG/6qoa9XwyvXddp7ZarKheCVNR9
         VffChYl4Hqea8KNBFKZKfiFHIqEYxvnaR1r/vWP6+uguQ6IHtDdt5X+d8A3imix0hBfE
         rMIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793035240; x=1793640040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZT0Bj1ansxkDq0zLewi3OJq5Bnf4fsSjPUxb7R/HFtk=;
        b=Gg8FI+cMxHqfr3hPA9wzhq2RR4CmnHvjcMRDu2K791nkOzATyPZZhc01YEq3KIG64X
         G5kS2LtWPsN434MCTxOIgZXkhJs3N8TeMcTibynrqbJ3yLA1Uvc1vP3z6HP+VOPfcqQJ
         cBhpOWzI78lDYwr6dbbUQrqp4J597TmqhAjXy1Poou+rJZyFL8k7JjTw+7WMnpDq3j/P
         0WjUekwXJ3G9pPiHBvm34gib4yH4+7wGDfCyQlbsUO0+yinTjn/q+BQ3f6rks54RFI/B
         7kpJwwyGFNETkOHawifW33tIk4TMfKkoYcDw8uyLIeQImE/BSTwqhBK52WzwBDjsFVN3
         m2uQ==
X-Forwarded-Encrypted: i=1; AKwUvBxVVTN5Jfz7yFpov7IvFkPg6Nxm+V3xBvY9fZvXV8p6VhCq2fjSkfE1wr6y2icx8HguLzA1FaicTQGC1sk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKHPDKsPT+fQVxJkUeR8AoH5qmxRpImqvSiQFSiRH3vWXLgueOT
	JMeWTDznsmG7LnyM6HBoN7AggrTxAUtDSMTf392voN7wQ867q3y378Tt
X-Gm-Gg: AYBFou2xf4divpMMoBVTrqOLEdrFKwTpvl6Xr3VpZXnI4fAq/i11mSHqd5D0mFy4r9n
	ZhkmZgWm5jofIu4pHAEss2qq0UEHp/gvFDNnFjIelP/lagVl7eWoNoKccbkLR94kgrZsT8hsAzp
	6/U4napQ49RfzpkW8RLSXyyxjKIc3Cb1YHiF5RFL0p7J6yF82FBkFopJL/1E1jtNgb44bitBhHG
	ljPAGi/XKe+ks3Z2sccaLF7GnlW44uZbkV8+shw2SGokbTWz/7xBOxR6dDPkHVOd5nDs/OFYyT4
	0RbC1UKni8mGvXtYzeoQrCk7LDqxLSN+Y54m5QsGIF+P/TmQEDhOxonRHbdFYHmOOGyFDx5qOme
	hJLTT/x4HHQ0v5U8QBtfdeW6CKcOm2eREZHPYAdyW7mJLLY7MbVwBf3gWJ2YI5hqI2mvNWar7Ou
	/od+0Folhxgj02UBu361UUL717gqI683SfIfWy1hcZF+AK+uvswewXKrpEU8xnLmYg7IG5p/y8s
	cmn0WL7YZPpuc0ImyLyK8CySOh98Ocr63NHcKwOkDNv2KHuIZeodFwVwjw906H5zH1YpIzI5KYk
	5EEzvMKRfYjR4wk=
X-Received: by 2002:a05:701b:420d:10b0:166:29a2:f83f with SMTP id a92af1059eb24-19928f14c49mr11062758c88.5.1793035239469;
        Mon, 26 Oct 2026 10:20:39 -0700 (PDT)
Received: from Alienware-m16.lan ([45.153.102.184])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a2e32479sm23622813c88.21.2026.10.26.10.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 10:20:38 -0700 (PDT)
From: Andrew Luebke <andrew.luebke@gmail.com>
To: Hannes Reinecke <hare@suse.com>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <mkp@kernel.org>,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrew Luebke <andrew.luebke@gmail.com>,
	Hannes Reinecke <hare@kernel.org>
Subject: [PATCH v3] scsi: aic79xx: Fix NULL pointer dereference in device reset
Date: Mon, 26 Oct 2026 10:20:32 -0700
Message-ID: <20261026172032.749756-1-andrew.luebke@gmail.com>
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

Since commit c67e63800446 ("scsi: aic79xx: Do not reference SCSI command
when resetting device") the device reset SCB has no SCSI command, but
ahd_linux_dev_reset() still sets its residual, and ahd_abort_scbs(),
which completes it, sets its status. Seen on an AIC-7902 when a failing
disk triggered a device reset, which killed the SCSI error handler:

  BUG: kernel NULL pointer dereference, address: 0000009c
  EIP: ahd_linux_dev_reset.cold+0xee/0x26e

Add NULL command checks to the accessors in aic79xx_osm.h. Also skip
autosense for an SCB without a command and complete it with ahd_done()
right away: the REQUEST SENSE path can clear SCB_DEVICE_RESET, after
which ahd_done() would dereference the missing command.

Fixes: c67e63800446 ("scsi: aic79xx: Do not reference SCSI command when resetting device")
Cc: stable@vger.kernel.org
Reviewed-by: Hannes Reinecke <hare@kernel.org>
Signed-off-by: Andrew Luebke <andrew.luebke@gmail.com>
Assisted-by: LLM
---

Notes:
    v3:
     - Complete an SCB that ahd_perform_autosense() declines with ahd_done().
       v2 left it on the pending list until a bus reset, which does not come
       with SG_SCSI_RESET_NO_ESCALATE (Sashiko AI review of v2). Such a reset
       now returns SUCCESS, as one answered with any other status does; in v2
       it timed out and returned FAILED. This is the only code change, so I
       kept Hannes's Reviewed-by.
     - Much shorter commit message (Hannes). Sorry for the overlong
       descriptions in v1 and v2.
    v2: https://patchwork.kernel.org/project/linux-scsi/patch/20261023170330.269844-1-andrew.luebke@gmail.com/
     - Put the NULL checks into the ahd_cmd_*() helpers where one exists, and
       keep the now safe ahd_set_residual() call in ahd_linux_dev_reset()
       (Hannes).
     - Skip autosense for an SCB without a command (Sashiko AI review of v1).
    v1: https://patchwork.kernel.org/project/linux-scsi/patch/20261020221530.2606178-1-andrew.luebke@gmail.com/
    
    Tested on an AIC-7902 (SE7501WV2S, i686, v7.2.11, not packetized) with
    the v2 code: device resets idle and under I/O, a device reset of the
    failing disk, and a bus reset. The new ahd_done() call is reached only
    by a reset answered with CHECK CONDITION, which these disks do not do.
    Build-tested with W=1 for x86_64 and i386, no new warnings.
    
    Prepared with LLM assistance (Claude Opus 5.5; v3 also reviewed by
    Grok); I reviewed it and ran the tests.

 drivers/scsi/aic7xxx/aic79xx_core.c |  4 +++-
 drivers/scsi/aic7xxx/aic79xx_osm.h  | 26 +++++++++++++++++++++-----
 2 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/scsi/aic7xxx/aic79xx_core.c b/drivers/scsi/aic7xxx/aic79xx_core.c
index 3602a1fc4..4abc79481 100644
--- a/drivers/scsi/aic7xxx/aic79xx_core.c
+++ b/drivers/scsi/aic7xxx/aic79xx_core.c
@@ -8942,8 +8942,10 @@ ahd_handle_scsi_status(struct ahd_softc *ahd, struct scb *scb)
 		}
 #endif
 
-		if (ahd_perform_autosense(scb) == 0)
+		if (ahd_perform_autosense(scb) == 0) {
+			ahd_done(ahd, scb);
 			break;
+		}
 
 		ahd_compile_devinfo(&devinfo, SCB_GET_OUR_ID(scb),
 				    SCB_GET_TARGET(ahd, scb),
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

