Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462E54A2065
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 21:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788903940; cv=none; b=F36VHQCwNUyNI3vg+WPtVUUlX8PktumqsjeugLj5phcF7ZFa/XcDzn5NtnkIa7GCogUYmFTtpG8VJ1j3nrsuDR8v06rfM3MgL3kknmUF6BwqHfLvrqLqOeYaqhSs9uL6hqOTrH0Kd67c2hvqvxgLPgL2dFHcj3AaGEjFBt1xUSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788903940; c=relaxed/simple;
	bh=R8g1dZY/ggKCMjit7jScrhBDCd+gAII9ItpPUFnKBRI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s3OkU0/BBuAan3veWnbRacQVkToyIkpZJwiSqAPc9S6X8lc6BhN61g58LWw+q8LTbaxFfn5TNXCBEEl8KfwIi3WdSq/M9mCt3ndqBw/r5J/ZvIIT0an6pAEAfIMmg14JM6CEq1YbIF+jLNfHFc39murllxV0Tq4w53pv3WgTOIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rJM9GFAz; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rJM9GFAz"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccdaea75so494115a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 14:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788903938; x=1789508738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SaN6XVxvP97I/EahdycgHKF+2oKgGUfbpldf6OV9k48=;
        b=rJM9GFAzf44zx+kdVzPY5aUUn4KtZByV1BZOWlLdjY+t1wHWUW9dI96KOdzZJQf3vM
         d0aP2XyvcR43oVIkN1N9lFmjJKxcuq3BCVnWPdXKS30F/74DI7Gkr71MjdfVQxBo3F2n
         devWsTo2NiE+eH5Y4WPkgZcrhuNPJG8qAIdbUWuemBj4dpmXYNE0uzTLDF/nAxj1hRcc
         V/FfzLqqIhyIWkzhlcxSKShIrT82iZZfM7zrtyN8l0WILZ8CEk4PhiiWCWIdwz+VrFd2
         4GX3yN/KY/+NPoZ9RjzHwjundWhMxGqb4Lm2VzLIISkpbUtPUptEQ0d9BVNdfv9vfk0m
         v+xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788903938; x=1789508738;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SaN6XVxvP97I/EahdycgHKF+2oKgGUfbpldf6OV9k48=;
        b=ijK4GO6NHR6mMLi5j59olYHkg9oxoKf+WKEIhixOoARVaAX0nXA8AGy0S+l4QjHwyd
         Fnbzw/NX7xN2BnMNW5MsvOwRHx2vRx3wQkmwoii4tUF7jkxxrLSzi1VqaTAHXjjrfrwV
         ZiJTJzK+5rHDVrfuAIAkyk8qOaDZksc/aw0kf0W3ditSi8yn3fmajo+uQI9BfO8N7lAq
         BwhYuhrJknDjvSAjh4K8i6nn7FhOyDyvwx2KQcUthCPIORa6PW+GoF44bh2WbLMRPgp3
         HxWkTKSKl8pnXyDvfHj3AmRwJMpDsGRkn5rUWquRnEfJirPiv6g/Jce0yAHrXMbLwTn7
         MX5w==
X-Forwarded-Encrypted: i=1; AKwUvBzb6TsmrKgPq2skEs/ioNxvZo5hyGHcQm11BxkuJL6m4KR/s/XPOHQ+CEOUkXZADfYhnDkbIM8Ew17mzZ8=@vger.kernel.org
X-Gm-Message-State: AFuF++lidIbrLIgWQ9N5bY4a8S3Nps+/dJ6g9mIk160/dTK8jN+FxjzI
	+/X4qF8YGRsCY31M6VX+mL2skY4TMFVjdrXnmIt0sci44wCUoqriIx2i
X-Gm-Gg: AYBFou0solJcacM0XGw4tUL87bLJ1OyJrm7x9T9b9mp4i9cG7Al8XNoT7/ZdOGOVdMr
	hHM99djjh09mLUsut1afCMrc/MCumOb2Y4SRTjAX94w88lU1k4+dTVwHHXurBc0mPpY6Xra+ozf
	T5/FENgIYSIsTE7Y7xLqDKGoB4ZVj4PTuFCAxH6aOBwWfWp7FQ7fCUmI53Lm/PKBR2OUK2iPiqz
	ysLPtJUVi316UOo1OyzOLQhosaGIkymztbNrDAE/vnqrCHz+LyU9AneLSTaXxC5cMxL2M+3o3Ge
	VP5lE3p5Mm2Di/ylklzTZ+FWdv+UT7w7WwKVSicg73s90k3JnHNI8LB1fr6KBh+kaf3+GC6ThW1
	vdUqeL23zZLNzSZqMor4NOigoP6L3RDgCyLBrm2kCL3l1i05lXyUd4KegZt6dph2CbxB1xUqnUF
	BsqTctMeL22ARSFNtrHDbYE6ixbHPEb8FwAJttSgjm7Bc3zqSmDAIYU98f0WGSPIaMapaent6dT
	yfrv5eSVlbqjD/ECR8H+tbfb9ajv5zR0zLYQk+AjlY5S2WWZ7cMVFIdyDEJDuSsfFmP/F7gRHqH
	C/GlwqaNQCI5whg6SrbxFqv2b1wd+EHSa3kYTg==
X-Received: by 2002:a17:90b:4b06:b0:398:9bd3:d6d6 with SMTP id 98e67ed59e1d1-39b8bf67006mr7365462a91.16.1788903938460;
        Tue, 08 Sep 2026 14:45:38 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b84cce64fsm10245204a91.3.2026.09.08.14.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 14:45:37 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-ide@vger.kernel.org
Cc: Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Mans Rullgard <mans@mansr.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] ata: sata_dwc_460ex: preserve sactive_issued state across ISR invocations
Date: Tue,  8 Sep 2026 14:45:36 -0700
Message-ID: <20260908214536.598823-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Zeroing hsdev->sactive_issued on every ISR entry destroys the NCQ tag
tracking that must persist across interrupts.  This field is populated
in the NEWFP (DMA Setup FIS) handler and used in subsequent DMAT (DMA
Transfer Complete) interrupts to determine which tags have completed
via the formula tag_mask = (sactive_issued | sactive) ^ sactive.

With the zeroing in place, sactive_issued is always cleared before a
DMAT interrupt can read it, so the NCQ completion path never identifies
completed tags correctly.  The command completion then falls back to
the non-NCQ path using ap->link.active_tag, which works for a single
outstanding command but produces wrong results when multiple NCQ tags
are in flight.

Remove the spurious zeroing and fix the NCQ/non-NCQ discrimination:
when tag_mask is zero but the active command is NCQ, all tracked tags
are still in SCR_ACTIVE and no completion processing is needed.

Fixes: 2d20da00c324b ("ata: sata_dwc_460ex: get rid of global data")
Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: resend as standalone patch
 drivers/ata/sata_dwc_460ex.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/ata/sata_dwc_460ex.c b/drivers/ata/sata_dwc_460ex.c
index 8a1d80ac906a..6cce790516cc 100644
--- a/drivers/ata/sata_dwc_460ex.c
+++ b/drivers/ata/sata_dwc_460ex.c
@@ -465,7 +465,6 @@ static irqreturn_t sata_dwc_isr(int irq, void *dev_instance)
 	int handled, port = 0;
 	uint intpr, sactive, sactive2, tag_mask;
 	struct sata_dwc_device_port *hsdevp;
-	hsdev->sactive_issued = 0;
 
 	spin_lock_irqsave(&host->lock, flags);
 
@@ -517,8 +516,11 @@ static irqreturn_t sata_dwc_isr(int irq, void *dev_instance)
 	sata_dwc_scr_read(&ap->link, SCR_ACTIVE, &sactive);
 	tag_mask = (hsdev->sactive_issued | sactive) ^ sactive;
 
-	/* If no sactive issued and tag_mask is zero then this is not NCQ */
-	if (hsdev->sactive_issued == 0 && tag_mask == 0) {
+	/*
+	 * If tag_mask is zero and the active command is not NCQ this is a
+	 * non-NCQ completion.
+	 */
+	if (tag_mask == 0) {
 		if (ap->link.active_tag == ATA_TAG_POISON)
 			tag = 0;
 		else
@@ -534,6 +536,12 @@ static irqreturn_t sata_dwc_isr(int irq, void *dev_instance)
 			handled = 1;
 			goto DONE;
 		}
+		if (ata_is_ncq(qc->tf.protocol)) {
+			/* NCQ commands still in flight; no tag completed. */
+			ap->ops->sff_check_status(ap);
+			handled = 1;
+			goto DONE;
+		}
 		status = ap->ops->sff_check_status(ap);
 
 		qc->ap->link.active_tag = tag;
@@ -612,9 +620,9 @@ static irqreturn_t sata_dwc_isr(int irq, void *dev_instance)
 		tag_mask &= ~(1U << tag);
 		qc = ata_qc_from_tag(ap, tag);
 		if (unlikely(!qc)) {
-			dev_err(ap->dev, "failed to get qc");
-			handled = 1;
-			goto DONE;
+			dev_err(ap->dev, "stale tag %d in NCQ completion",
+				tag);
+			continue;
 		}
 
 		/* To be picked up by completion functions */
@@ -1051,6 +1059,8 @@ static int sata_dwc_hardreset(struct ata_link *link, unsigned int *class,
 
 	ret = sata_sff_hardreset(link, class, deadline);
 
+	hsdev->sactive_issued = 0;
+
 	sata_dwc_enable_interrupts(hsdev);
 
 	/* Reconfigure the DMA control register */
-- 
2.55.0

