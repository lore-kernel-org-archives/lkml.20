Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED80A3E5A2F
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141324; cv=none; b=QYJ/9qtT501JEc48InsPq3jCzbYOFYqG7qQGsfrfERHBZ84+oFooXSuUcBDQ4ED0vkF55HzgTQPZIIGotfPdURNHfeVdyYyfE381IinHx5QW8BcQJrNe0puP9Nn36YTBCDeFuNvWSPoaZnnqQ3jg0fb+B/G3JM0huUcGAnNkXOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141324; c=relaxed/simple;
	bh=ckYyMbA5qrVV29KoZnji8oimJR4kycs/+N+sm5Vfj7M=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=stXjIrrgkLZ9DKcotlcDNptxiDAspuhVjoGYirqEIOM+zLUC/l7+igvRLx+rTy99XP1spKHmaj+xqtzND8RdMdBFg0ihrHOltvymydAqG/38UuWvaBUlZsGQteADJSbkRJRzyVnUEqz7hNYG6FZaTVKe7DNp7bcTwXfbH/Ws+Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BU3uxujc; arc=none smtp.client-ip=209.85.216.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BU3uxujc"
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ab7f1efe5dso5831417a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792141322; x=1792746122; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/Myy+1U6pBdwhlVNx/zaVSdE77IqnEToPWj67mGod4c=;
        b=BU3uxujckr8zi+yXeH/1xbQo4LvchLvEKGgWkpOI+Zc8ryPHwtc5yhERNT3qU01DRa
         n/nePz3grFoWpRuAG+cQF9ED2sq5dLlCCdecppA1e5jWnd0Bteo1CGTlZIYYquZvpSDI
         zsMCJ61D54XuBPpq4CPwktYTbd3zgK0UhNZLaCCKin81IvUXsy8RyV4smikJRy+8HKIg
         7YuxkT6XEsyTBm82Q5ymEJBr41X2vyFArCXjVJR3J9LJ5+wnZYbetruMC+IBscH3m1Ig
         OSlRVHgm0NdWBho1idtk4dLIm/4Us7mOio4z2ujlUqwuyxvC+g46EtHE/dBpC9YnqP8H
         0ffg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141322; x=1792746122;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Myy+1U6pBdwhlVNx/zaVSdE77IqnEToPWj67mGod4c=;
        b=0uveD5OPKHUwUedovh+6DVj85fKMZYwwnenrT6Cw0tv8lPP/pp0miz4LFadPRRzm+h
         Od75xvM1p9jsKXaswvX7el/27gs8ONYOWnbJv9T/+1fqfx0qM+FoLooDLQ4JqAHMfjXh
         ZrctNCNT2mDOPykUg121Bfotv1uILoHF1J9cJ4FLq69j3IJpMTOgriJoJ9eaTSoW13h5
         HrrNeMN1SvOulVYMUQmH2OWot9H4T5lJw/WSajffKVvRnFL1fVLJDZkRDAaH//GMZkGs
         u7xEeIjrkfhyAAFIQtDO5urY+385rUdQ8wi8JtI6QWJNF3BIx31qiy1bIcqikv0Gf/f3
         bCXg==
X-Forwarded-Encrypted: i=1; AKwUvByrs2yCiLk0xMb89CxMvIl0ti7dLEvmHXbpQ2Em/smN12EzVSvKcCCmzaXCtpFq5bKi1bl1P91ZwqIUTKI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLa7owoeOSGBhfzz3cOkvDGcCEwmbJEPYAkhgJEK1+RbrEf6gkx
	lm4ZIjMBNVdTkcivtBL035KnY48M8+fsIVQ0Ye26QII86hQLH8nTYzm6+f5yq2P5sQGP709mCyd
	+5d06BGriz27pttoGdweZLA==
X-Received: from pgbj21-n1.prod.google.com ([2002:a05:6a02:61d5:10b0:cc7:a1dc:d7e4])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:3284:b0:3e0:c346:7344 with SMTP id adf61e73a8af0-3e16befe897mr19741849637.64.1792140845040;
 Fri, 16 Oct 2026 01:54:05 -0700 (PDT)
Date: Fri, 16 Oct 2026 16:54:03 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Message-ID: <20261016085403.1711740-1-stanleyjhu@google.com>
Subject: [PATCH] scsi: ufs: core: Fix double completion in ufshcd_clear_lu_cmds()
From: Stanley Jhu <stanleyjhu@google.com>
To: "Martin K. Petersen" <mkp@kernel.org>, linux-scsi@vger.kernel.org
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
	Bart Van Assche <bvanassche@acm.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Bean Huo <beanhuo@micron.com>, Peter Wang <peter.wang@mediatek.com>, 
	Can Guo <can.guo@oss.qualcomm.com>, linux-kernel@vger.kernel.org, 
	Stanley Jhu <stanleyjhu@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In SDB mode, ufshcd_clear_lu_cmds() completes a cleared request
without clearing its bit in hba->outstanding_reqs. A later
ufshcd_poll() sees the stale bit and completes the request again,
causing a double DMA unmap.

Test and clear the bit under hba->outstanding_lock before completing
the request, as ufshcd_abort() does.

Fixes: f18fac1e2b72 ("scsi: ufs: core: Rework ufshcd_eh_device_reset_handler()")
Cc: stable@vger.kernel.org
Signed-off-by: Stanley Jhu <stanleyjhu@google.com>
---
 drivers/ufs/core/ufshcd.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index bcc2512bf34b..1ae63d123ef0 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -7943,6 +7943,8 @@ static bool ufshcd_clear_lu_cmds(struct request *req, void *priv)
 	struct ufs_hba *hba = shost_priv(shost);
 	const u64 lun = *(u64 *)priv;
 	const u32 tag = req->tag;
+	unsigned long flags;
+	bool outstanding;
 
 	if (blk_mq_is_reserved_rq(req) || sdev->lun != lun)
 		return true;
@@ -7961,7 +7963,12 @@ static bool ufshcd_clear_lu_cmds(struct request *req, void *priv)
 		return true;
 	}
 
-	ufshcd_compl_one_cqe(hba, tag, NULL);
+	spin_lock_irqsave(&hba->outstanding_lock, flags);
+	outstanding = __test_and_clear_bit(tag, &hba->outstanding_reqs);
+	spin_unlock_irqrestore(&hba->outstanding_lock, flags);
+
+	if (outstanding)
+		ufshcd_compl_one_cqe(hba, tag, NULL);
 	return true;
 }
 
-- 
2.56.0.385.gd3acb90ef8-goog

