Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793270482;
	b=46PSiYOdAO9XPNCgO25EpnfS0UHiqU02RDeaZFHtdmdUzjCJ1o0Kjja30yDGJwOXMR2y
	 BoxcjCKxGUG6Kana255XGxvnh6Znn2zGVMaVfUGU5Zv6inPiTFQaG8LiZCHs5EXDYjDfi
	 gA0Y6o6+RoKBEwVKAwSP6B+aqX42akYnCWs9UQEmlLqKO2L9Cog9VoUfqI/Nj6DVVWHmX
	 JfSOIsK0yiijt7bxFTvwA31gs+Pp1xoVYnnc8T4LR9RYFf8hdZ40p6MJZd+kSVgXk1NWh
	 aRjUWuiS3zB7pyKo7nFZwfipNBNO5vc0cxEqkV94RRxhtqRAVm18EwGqeIE0VLYfyjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793270482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=1GBfM0eKacIoY2Tlnstd7Edn5tI2qGts/W+1HollEPI=;
	b=zktgMoSQdaG0KLXbOSo7IcKHGl/3idRSDFXZtMKLMIOReBc5OSpObKSqNJnMweDHhv+O
	 BZKVo+Y140fpARDd4wRb15mDZBpzB7B4QIKPsuXuwk3DDMY7wTRfc7egrTUn8qCoJbzKM
	 q18Uv2a9AFP6YDMdCDaiQlEj79kR1ptXer5JCFiAL540JMq2LMMfM0uXOVo5+dm06rb1j
	 K20OGULcCu0sLjx1ld+IyOqCFhsYSL7rtZNsRZSZRJenkTk9y3Uer6kB+TeAyuwTjxHwK
	 f4SVIkNASPj0qkGl3u3c4qly02ct2OfS+9Yg9wLo/fDzmcoV+OVhdCnqzkrECw1/7pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b="6Bn/Kuld";
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5703606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:41:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5703606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=6Bn/Kuld
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48b042c0728so606661f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1793270479; x=1793875279; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1GBfM0eKacIoY2Tlnstd7Edn5tI2qGts/W+1HollEPI=;
        b=6Bn/KuldATbvZx5/x46Wzq5RdmL5JKboEdKPE+tY1X25mGG1YoX7Icb1W0s9znEyDk
         GMqNkYOAcmHgiXgQYvl8ahdnb/Ur2z7a0/6c/oToa/9dIWUgjkkBFRlX5ZpGQ5+7FcGK
         seAKOjUSQyRnnzM+4O1a7ggg/G4RzrP1eVKQkDPc1kCMUHry54fQH3aJLWnXb0b0+9Hg
         BeGsTyyf1zcP1hLM3ihGDzQ6FLnDkSHjH722+MQwrCANKDzR46qcsaAa9cbFFDFZE6d8
         azf/T9o9AIg899Dtly+1FiVCdXrr7Ju5KXryv6cCdBt7fIA+diPZ4S830NELI6pUKhNn
         cCog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793270479; x=1793875279;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1GBfM0eKacIoY2Tlnstd7Edn5tI2qGts/W+1HollEPI=;
        b=0W11smHdnKyrpB3JlKTiuRi3Fq7ZZ+NgILwqg2Jp/WtEY6im+rb/lfGJsPqgr7t8EW
         Tqdy7GL/xBfUd3VWpk3NXfKOsCuUXtwqQE6op+Yu523/sU0WgqBORilu9oYaHiNmIMtM
         PTx1owVu98lwqdUyg3MWJiq4dQgB9z1WkgfW8xq3YdZ1n/WhKU42vtajbzcUuK2AQWLe
         I1ozqKhhsoRu5DLabO3wZFir5LZ+SfjXYpwLj+/IPplTaLEUbk/lbJjxE4GOTou0ljiK
         MFj8a30XjDAvFcn09A5/8o6vPrX+lecNS1X6GFXfzTXnl+m0zWt71XZ+6AFQ4UVE/q4q
         vNNA==
X-Forwarded-Encrypted: i=1; AKwUvByjS8a/iR1KkXk72pzl6cLHG+1PYLPdyxvnoQ6lr1vLqgNKzphZSQS5/dOt06fpAh5EBgU7MUkQ536kI+I=@vger.kernel.org
X-Gm-Message-State: AFq9FYKlFga/6VZ952t95HDAKNPSSeeWpCTqtXbFl2EyJUPnxNF4qzC9
	jWHSN06ad2K/9k9lpcYyheUKgptR1bx7VAtksfUdszWVfgfLPmqI1dCOS6Sno12tkInMdIflXHZ
	4nFky6Ew=
X-Gm-Gg: AYBFou04yW8DSEsxkcOINZiwXecvSaeqB/cKjRVSND7YdF+7MRSxsZ4ticPcek5rVAS
	jfQU0ACrFoNLlurjQUns23Xpv18PFEFhlZebiUkh5HoiexJqmqnr3GowdvUcbYNWvFaCv5BaleI
	8oDxquNrRw+7oy5frB8wAmYu0CKzAIw5mPdSdEKKZHdIQ+6foLqPg3YgF733Ena7DGLpN37CYar
	pvlmlTrXTxjw/Xq46aefsC7vAQsDcbA6yo5qRUMO4Zj4YqN7edAz+c417QlStzpdtAjBioXeap4
	+T9R/VdXfoN512xqKwlT0qkHdTjvi1ZHTurGXL0QgYuTDtO7brvxVhxuBr2AiMussSntrb1h/EW
	BTVatjQYsXOM6NOIuhxKDuz8X7dr8bplOw4kGT5Q4kiNER0LqHwoRGQs0F0bbfAa/5gUr+gd4kF
	hNqru6Tga5lOykEXJtcUzzQRtUIxbn1wQP7HzmndR+hjPJKRAsHrGyvY9k7W2GlxUkNCVJFeV0G
	29eoTOdgOIzLUR7DrhIK2aMgggshX02d2nTP+cBuQU0akynyuCadzZh3FScDoQ4j5MReg8XKU0f
	IpzS3ivvBaEkJhJeQHK/rShb66PbLnYHS+f9WGPf3DmM6iKYCyqu0LGGfbLo03o2WivPMoE6Rx1
	3PNzC4KSv
X-Received: by 2002:a5d:5d13:0:b0:48e:5d8a:d1fc with SMTP id ffacd0b85a97d-48e5d8ad467mr10436651f8f.31.1793270479121;
        Thu, 29 Oct 2026 03:41:19 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3dcbsm32635454f8f.14.2026.10.29.03.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:41:18 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Thu, 29 Oct 2026 14:41:07 +0400
Subject: [PATCH v2] scsi: core: Clear power-on UNIT ATTENTION on BIWIN UFS
 devices
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-biwin-tua-quirk-v2-1-4d71af956ac5@flipper.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ6CMBBFr0Jm7RimYhFX3sOwgDqVUVOwLagh3
 F3AtcuXvP/+CIG9cIBjMoLnQYK0bga1ScA0lbsyymVmUKnSlKoD1vISh7Gv8NmLv2Nm99nOmkI
 TaZhXnWcr77V4Ln8c+vrGJi6ZxWgkxNZ/1suBFu9/fSAkzHVekTJFXRhzsg/pOvZbxxHKaZq+q
 SSScMIAAAA=
X-Change-ID: 20261028-biwin-tua-quirk-4f543fc96116
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <mkp@kernel.org>
Cc: Bart Van Assche <bvanassche@acm.org>, linux-scsi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6482; i=alchark@flipper.net;
 h=from:subject:message-id; bh=CmZwifz/a5qqTnDaVS8ayinRKHQwprKtTLA6l6hL170=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQ9Vjq1f5/ljZ7fB9wtf1/g95m8av/2adqFx71SbgT29
 wfwWl6a2jGRhUGMi8FSTJFl7rcltlON+Gbt8vD4CjOHlQlkiLRIAwMQsDDw5SbmlRrpGOmZahvq
 GRrpGOsYMXBxCsBUT5vP8D/28c0YyxXzLSI6b99zOH3ltcQNodgTsxzXh0XtDOO5vMaFkeFYYFf
 g2xp5ya2+kjc+XdvGks2eLdB/QE+wkuEpY2/5CSYA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

The SCSI core retries a command that receives a UNIT ATTENTION and relies
on the device to clear the condition once reported. The BIWIN
BWU2A0526B128G and BWU2A0516B064G UFS devices do not clear a power on or
reset UNIT ATTENTION when reporting it to a WRITE. After a device reset,
such as on resume with the UFS link off or in UFS error recovery, writes
then fail on every retry for the full 180s retry window and end in I/O
errors. A TEST UNIT READY or READ clears it.

Add BLIST_TUR_AFTER_RESET for such devices and set it for BIWIN models
starting with BWU2A05. Send them a TEST UNIT READY from the device event
worker, which already runs whenever a command reports a power on or reset
UNIT ATTENTION: that way the commands that fail with it are covered after
every reset, whoever performed it, and the TEST UNIT READY is sent from
process context once the device takes commands again.

Skip a device that is not runtime active by then rather than waking it up,
which would only reset it again. Until it is active, only PM requests can
reach it, and their senders handle the UNIT ATTENTION themselves. A
command that keeps failing with it holds a queue reference, which aborts a
runtime suspend, and reports it again on every retry, so the worker runs
again.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
Changes in v2:
- Rework the quirk to put it in the SCSI layer instead of UFS (thanks Bart)
- Link to v1: https://patch.msgid.link/20261028-biwin-tua-quirk-v1-1-767a12c9b9cc@flipper.net
---
 drivers/scsi/scsi_devinfo.c |  1 +
 drivers/scsi/scsi_lib.c     | 31 +++++++++++++++++++++++++++++++
 drivers/scsi/scsi_scan.c    |  3 +++
 include/scsi/scsi_device.h  |  1 +
 include/scsi/scsi_devinfo.h |  4 +++-
 5 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/scsi_devinfo.c b/drivers/scsi/scsi_devinfo.c
index cfc259fd0141..6dea39bf2f87 100644
--- a/drivers/scsi/scsi_devinfo.c
+++ b/drivers/scsi/scsi_devinfo.c
@@ -136,6 +136,7 @@ static struct {
 	{"AIX", "VDASD", NULL, BLIST_TRY_VPD_PAGES | BLIST_NO_VPD_SIZE},
 	{"AFT PRO", "-IX CF", "0.0>", BLIST_FORCELUN},
 	{"BELKIN", "USB 2 HS-CF", "1.95",  BLIST_FORCELUN | BLIST_INQUIRY_36},
+	{"BIWIN", "BWU2A05", NULL, BLIST_TUR_AFTER_RESET},
 	{"BROWNIE", "1200U3P", NULL, BLIST_NOREPORTLUN},
 	{"BROWNIE", "1600U3P", NULL, BLIST_NOREPORTLUN},
 	{"CANON", "IPUBJD", NULL, BLIST_SPARSELUN},
diff --git a/drivers/scsi/scsi_lib.c b/drivers/scsi/scsi_lib.c
index ab39514cc0c6..863ae93f2618 100644
--- a/drivers/scsi/scsi_lib.c
+++ b/drivers/scsi/scsi_lib.c
@@ -20,6 +20,7 @@
 #include <linux/pci.h>
 #include <linux/delay.h>
 #include <linux/hardirq.h>
+#include <linux/pm_runtime.h>
 #include <linux/scatterlist.h>
 #include <linux/blk-mq.h>
 #include <linux/blk-integrity.h>
@@ -2713,6 +2714,32 @@ static void scsi_evt_emit(struct scsi_device *sdev, struct scsi_event *evt)
 	kobject_uevent_env(&sdev->sdev_gendev.kobj, KOBJ_CHANGE, envp);
 }
 
+/*
+ * Some devices do not clear a power on or reset UNIT ATTENTION when reporting
+ * it to commands such as WRITE, which then keep failing on every retry. Send
+ * them a TEST UNIT READY, which does clear it.
+ *
+ * Leave a device that is not runtime active alone. Until it is, only PM
+ * requests can reach it, and their senders deal with the UNIT ATTENTION. Any
+ * other command that keeps failing with it holds a queue reference, which
+ * aborts a runtime suspend, and re-arms this event on every retry.
+ */
+static void scsi_clear_reset_ua(struct scsi_device *sdev)
+{
+	struct device *dev = &sdev->sdev_gendev;
+	struct scsi_sense_hdr sshdr;
+	int active;
+
+	active = pm_runtime_get_if_active(dev);
+	if (!active)
+		return;
+
+	scsi_test_unit_ready(sdev, sdev->request_queue->rq_timeout, 1, &sshdr);
+
+	if (active > 0)
+		pm_runtime_put(dev);
+}
+
 /**
  *	scsi_evt_thread - send a uevent for each scsi event
  *	@work: work struct for scsi_device
@@ -2728,6 +2755,10 @@ void scsi_evt_thread(struct work_struct *work)
 
 	sdev = container_of(work, struct scsi_device, event_work);
 
+	if (sdev->tur_after_reset &&
+	    test_bit(SDEV_EVT_POWER_ON_RESET_OCCURRED, sdev->pending_events))
+		scsi_clear_reset_ua(sdev);
+
 	for (evt_type = SDEV_EVT_FIRST; evt_type <= SDEV_EVT_LAST; evt_type++)
 		if (test_and_clear_bit(evt_type, sdev->pending_events))
 			sdev_evt_send_simple(sdev, evt_type, GFP_KERNEL);
diff --git a/drivers/scsi/scsi_scan.c b/drivers/scsi/scsi_scan.c
index 8aae12fd38f3..22a68fd9a57b 100644
--- a/drivers/scsi/scsi_scan.c
+++ b/drivers/scsi/scsi_scan.c
@@ -1066,6 +1066,9 @@ static int scsi_add_lun(struct scsi_device *sdev, unsigned char *inq_result,
 	if (*bflags & BLIST_IGN_MEDIA_CHANGE)
 		sdev->ignore_media_change = 1;
 
+	if (*bflags & BLIST_TUR_AFTER_RESET)
+		sdev->tur_after_reset = 1;
+
 	sdev->eh_timeout = SCSI_DEFAULT_EH_TIMEOUT;
 
 	if (*bflags & BLIST_TRY_VPD_PAGES)
diff --git a/include/scsi/scsi_device.h b/include/scsi/scsi_device.h
index e6fd6bc30644..8433880cfc84 100644
--- a/include/scsi/scsi_device.h
+++ b/include/scsi/scsi_device.h
@@ -250,6 +250,7 @@ struct scsi_device {
 	unsigned rpm_autosuspend:1;	/* Enable runtime autosuspend at device
 					 * creation time */
 	unsigned ignore_media_change:1; /* Ignore MEDIA CHANGE on resume */
+	unsigned tur_after_reset:1;	/* TUR clears power on/reset UAs */
 	unsigned silence_suspend:1;	/* Do not print runtime PM related messages */
 	unsigned no_vpd_size:1;		/* No VPD size reported in header */
 
diff --git a/include/scsi/scsi_devinfo.h b/include/scsi/scsi_devinfo.h
index 1d79a3b536ce..12186f851270 100644
--- a/include/scsi/scsi_devinfo.h
+++ b/include/scsi/scsi_devinfo.h
@@ -71,8 +71,10 @@
 #define BLIST_RETRY_ASC_C1	((__force blist_flags_t)(1ULL << 33))
 /* Do not query the IO Advice Hints Grouping mode page */
 #define BLIST_SKIP_IO_HINTS	((__force blist_flags_t)(1ULL << 34))
+/* Send TEST UNIT READY to clear a power on or reset UNIT ATTENTION */
+#define BLIST_TUR_AFTER_RESET	((__force blist_flags_t)(1ULL << 35))
 
-#define __BLIST_LAST_USED BLIST_SKIP_IO_HINTS
+#define __BLIST_LAST_USED BLIST_TUR_AFTER_RESET
 
 #define __BLIST_HIGH_UNUSED (~(__BLIST_LAST_USED | \
 			       (__force blist_flags_t) \

---
base-commit: 151a134a4e6ec66f69db8750c66006f5207f7a9d
change-id: 20261028-biwin-tua-quirk-4f543fc96116

Best regards,
--  
Alexey Charkov <alchark@flipper.net>

