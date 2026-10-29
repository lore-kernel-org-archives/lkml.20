Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793299498;
	b=IuEayTRwIwavXUwKf2k91LLZ1oWoKvVTGVkKS1MM8gG6FZp7itv/GVC4TYJlKqEaEevy
	 fGXK0c27dTOouIzdlnijQ6ElFfNRRAPRggO/4w8wgYhCKsQ3XdhgihtlEGcb79dC9SZ1A
	 s4twTSTqvupTXHtS4kXGoy69q1++X6m76UsZIq7qcbM8imbUlIzeTmBp7MCeWSxKt+RNk
	 FAfeLYjmR5DgS3RlDcqFHC97z/VGfCSl0OxovXuC6rLWVc0syC4lcNfQJ3xzw4bsqOHAC
	 qT6R5XrLfdnr7d4gIn2v1hQlRx0eGaMDy+FuBG/Tz56BmDb+SrwkT7ydqavtVMH042w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793299498;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=YHoHpQQmvqEwVhuQBwmFySvFAaKw6EmVrc8LkjO8rvQ=;
	b=iDAQmozeQRESAFdGwlmJmTZOxfvXKfUyCGtbHCeUvE+C/enZLamkfSo9fRj1AYSbodmF
	 8Q4HVwVvIzm+6jhbbYV0VyTQ7M/V67HmtrpVFRLNjkBZY8kl3C0/KxelT0dPhiTIDYABd
	 cfrgd/1H+2ab8U7jw0f4RuibT1HOuEe1WJWz350J+a5gwCIW6rbn1Cl3bozPDJZyIg4SS
	 Q+GoTPUdlRsHO5ulLpCCG+0QkSerPC9T3hK6F9U8tijAeY/VcvpKvWIV4tvUIqgF0twEy
	 saRESRerq+jNVecaS8KalThFRmF9xn9E649QAnE/o26fyxr6cI0rANgtyUoW4JXhJGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ipylypiv.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YfDKR6ps;
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E3C606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:44:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6E3C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ipylypiv.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YfDKR6ps
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3acd21ba24eso1644666a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793299497; x=1793904297; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YHoHpQQmvqEwVhuQBwmFySvFAaKw6EmVrc8LkjO8rvQ=;
        b=YfDKR6psdc8HAjZnim3EbcPyjiF/5cVACVZjpi4H1FYCLn43l0E9qlY4z3A2e2xJN9
         SrkY9BE1stdliuEr9/V0cb4wDQaJ/FfAuNJ8gPO/1w9WXDLJgnlS+HZIoTO+9frt0T9M
         ytC8wXccFSYIrDjnKNcaBw6P4aTHTUx+rVsCmX3rcpEHaAX9Gu4477GD/R0txdJtn3xJ
         4+LPL5enXkdwAi+aehSt99cpBpKZkCSzG8zuJ9Ff46OKbVHMp6QtbAsGSJCEerUxm7HJ
         DzDgURcBPAz33/7ak2JA+RT6QxmEqG6XieLUdP4KjszTkOOWIEZ87YB4Noqp++DrT7lS
         XtEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793299497; x=1793904297;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YHoHpQQmvqEwVhuQBwmFySvFAaKw6EmVrc8LkjO8rvQ=;
        b=k4QB2Jptb5zU81LpYeJvS9B79nVmsbRzGv748Pis8QWuNqNlund7ZdLN8+1+/TKf2E
         KclGj9k03cVAxwAw0raH6O8IcPSs9ZP98okvI+toCyGxI5Y3EMK+1b5sZRZrakrR1zCl
         nNXLGZCfgoOgXrcYLLNxeC/8Gqb8IV0XqQjgJGNrP094M91Jdy1IvPX0NjBJivLbfZFG
         5AOGoBsXdt65SmzWRFtpNXprWHr/6g0C1H4pi75hJrSI2xwKTBxnriEOzDzbH+yJ7h5z
         fVQgqhyag2MFWY8VsF9QJGUtc8tSBDU+G2wNR3cJ75Ik+S6nk7ese21J3IYz3oyGaMn6
         BICg==
X-Forwarded-Encrypted: i=1; AKwUvBxs8MZX4q+rUu4PIL5eba4HZCfmCROHV1HuUx151T+eOaLJWFrZfWSN5qzAU1p8hYniT8BEduteOs6rlQg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJj3JDjUX1Wh0Q1oCRMQztO5EtkNBRVlX+/ASuA5zebu4dKcG0x
	taDtVaP+amcpuOAr7sCNa8Gu0HRkgtG6VPVuoYRucxCV+lsPyz0zjxVU3/kFDKITfv9YlR9aiWS
	RwLukKziel+gviw==
X-Received: from pjah8.prod.google.com ([2002:a17:90b:5908:b0:3ad:850b:6f1c])
 (user=ipylypiv job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2641:b0:3ad:370f:46be with SMTP id 98e67ed59e1d1-3ae5822b436mr5249932a91.36.1793299496950;
 Thu, 29 Oct 2026 11:44:56 -0700 (PDT)
Date: Thu, 29 Oct 2026 11:44:45 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
Message-ID: <20261029184445.1615717-1-ipylypiv@google.com>
Subject: [PATCH] ata: libata-sata: allow re-enabling NCQ with the same queue_depth
From: Igor Pylypiv <ipylypiv@google.com>
To: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>
Cc: John Garry <john.garry@linux.dev>, Johannes Thumshirn <johannes.thumshirn@wdc.com>, 
	Hannes Reinecke <hare@suse.de>, linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Igor Pylypiv <ipylypiv@google.com>
Content-Type: text/plain; charset="UTF-8"

When ata_eh_speed_down() disables NCQ due to excessive errors, it sets
ATA_DFLAG_NCQ_OFF without changing sdev->queue_depth. Userspace can
re-enable NCQ by writing a queue depth > 1 to the sysfs queue_depth
attribute, which invokes ata_change_queue_depth() to clear
ATA_DFLAG_NCQ_OFF.

However, ata_change_queue_depth() returns early if the requested
queue_depth is equal to sdev->queue_depth before clearing
ATA_DFLAG_NCQ_OFF. As a result, writing a different queue depth > 1
re-enables NCQ, whereas writing the current sdev->queue_depth value
leaves ATA_DFLAG_NCQ_OFF set.

Since ata_change_queue_depth() already checks whether queue_depth equals
sdev->queue_depth before calling scsi_change_queue_depth(), remove the
early check so that writing the current queue_depth > 1 clears
ATA_DFLAG_NCQ_OFF and re-enables NCQ.

Fixes: 45623d33bfc0 ("ata: libata-sata: Improve ata_change_queue_depth()")
Signed-off-by: Igor Pylypiv <ipylypiv@google.com>
---
Commit 45623d33bfc0 ("ata: libata-sata: Improve ata_change_queue_depth()")
didn't add the first queue depth check, but it changed the return value
of the second check from -EINVAL to sdev->queue_depth so it seemed like
a better candidate for the Fixes tag.

 drivers/ata/libata-sata.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ata/libata-sata.c b/drivers/ata/libata-sata.c
index 32fd0e804654..d917242ac136 100644
--- a/drivers/ata/libata-sata.c
+++ b/drivers/ata/libata-sata.c
@@ -1287,7 +1287,7 @@ int ata_change_queue_depth(struct ata_port *ap, struct scsi_device *sdev,
 	spin_lock_irqsave(ap->lock, flags);
 
 	dev = ata_scsi_find_dev(ap, sdev);
-	if (!dev || queue_depth < 1 || queue_depth == sdev->queue_depth) {
+	if (!dev || queue_depth < 1) {
 		spin_unlock_irqrestore(ap->lock, flags);
 		return sdev->queue_depth;
 	}
-- 
2.56.0.317.g454f8302e1-goog

