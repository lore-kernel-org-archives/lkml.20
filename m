Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD0D3D891C
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 08:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792226651; cv=none; b=A9CVx339NLxIFR0C6PIePPzVLsV6BLTJe1l6c9LgshCTm/uHtaiSXOc08pLw2e0o+n0YCgHJ683RY8SgirFytVeXqbVQEGT4PTeQ2zQTktj8webcZuwTnSgZwCiMMkKd+sYxPC7Mej5HTER6ZzeSJEa0HR5ejLNP4QpamkA3v4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792226651; c=relaxed/simple;
	bh=Q/X/QgkPV9GRHvc0llHqXagnyq759chf6kmMWWc+gqI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=E+/Ct70SUQCp5h62QjrcB1ZGDd2+/5erdBJ0CdXEWwppKpcSVrSTnnnwjTuQaZIddheNqpEPp+Fr8qfpcDitUnk472Of0POGGRkra3a8R4gLg6LXEwyfU8/CQrDqCBRmN6SWjTuDfyDRdHExays1gs3JgGy27cDlsKKPfN/r0vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tEoZE3yl; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tEoZE3yl"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd66551e02cso846945a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 01:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792226649; x=1792831449; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oJtE2MOebaI4Aow6a4In64UuLQH5fsqvaP48yIJtyGs=;
        b=tEoZE3yl4CBl6ALJs+CIw7LA0VA8ZxuSHFOJjQG1ePPNkJko9NGAUipJMIXA8R+n3q
         eDgdMCChhXHxqrEhJgUdgnAuYL9r7f27nbaiHKPgK0hiIupFILHBazbLTGC/Sx0EhqCl
         h6suXThG9XGFDUytBYwRjJhMftSkb0qWvx9igQ6LezlXmbR/TFULnT6tAAOk5oye6/yN
         n9/e5NlisuDbauhtrorW3MpPeCc4ipFwPcc8Noz4FOqFgQRAapfv2N5dDkEEwkPfxZHb
         UohRPaUr+aTJXPIBNqRr7JJjgRotHmGX3RhoL1GKT5jTxYoFekDwsPrTIwcxNVyqyNro
         hROA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792226649; x=1792831449;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oJtE2MOebaI4Aow6a4In64UuLQH5fsqvaP48yIJtyGs=;
        b=P+n3IJ+z0iiBCGdLnJpKrPIajgjlBaJ+1eszHNrFJwvxPbXQ0BKK/0/Ue42XWwsulc
         7LqPLv7VztgfF1vq9e/i+dpywG9SevPACRw6Bnx/hccwa40woIuZZ1WR+W9j3IN4kXn2
         hmWvZmz55gPVjgew2EbnCKkjwG5ak9D2diKuhLNIOUS+50wzOZjSbM2eU0Xm0kTrCBtv
         9vgVV95wxp2yMRflh/suO/J7XfiOS98exlHdkjuAHYioCdeBkOFrcYcwe4ZUfqWe1U69
         O2hlaguj+l16+XwusxwuDhTq5k9g8BjxW1dV58AugU2WPho/iTzXmZtI6YSG+OGKrqgn
         arQQ==
X-Forwarded-Encrypted: i=1; AKwUvBwFgAzK4QKzbW4uY93pFQPm+/F/7o0XuIqtXzljJdFWfGnCTkEAhNg4HE17hAdQ5AXo6zIkCG1pO/TBk/Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYI0i0fG597m9o4X7XxTBdWvGdoSZ/EoP945ZzOjhknVfg8Jhlf7
	LXlFYel5UT5uMz/ZpyQjTsuGRXwu3rZJG797LbF1izxN1WGk5ysUljVqnBcIQHlvvjE+1igCp9z
	8va4LE0dg7KFP7eynwVIVtA==
X-Received: from pfbky37.prod.google.com ([2002:a05:6a00:6f65:b0:8a0:582e:68f2])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:6f89:b0:3d8:1f68:59ac with SMTP id adf61e73a8af0-3e225fe8c5cmr1674818637.23.1792226649454;
 Sat, 17 Oct 2026 01:44:09 -0700 (PDT)
Date: Sat, 17 Oct 2026 16:44:01 +0800
In-Reply-To: <20261017084403.875420-1-stanleyjhu@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261017084403.875420-1-stanleyjhu@google.com>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Message-ID: <20261017084403.875420-3-stanleyjhu@google.com>
Subject: [PATCH v2 2/4] scsi: ufs: core: Fix double completion in ufshcd_clear_lu_cmds()
From: Stanley Jhu <stanleyjhu@google.com>
To: "Martin K . Petersen" <mkp@kernel.org>, linux-scsi@vger.kernel.org
Cc: "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, 
	Bart Van Assche <bvanassche@acm.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Bean Huo <beanhuo@micron.com>, Peter Wang <peter.wang@mediatek.com>, 
	Can Guo <can.guo@oss.qualcomm.com>, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In SDB mode, ufshcd_clear_lu_cmds() clears the request slot in the
controller and completes the request, but leaves its bit set in
hba->outstanding_reqs. ufshcd_poll() treats a request whose bit is set
in hba->outstanding_reqs and clear in the doorbell register as finished,
so the next ufshcd_poll() completes the same request again and unmaps
its DMA buffers twice.

Clear the bit with ufshcd_clear_outstanding_reqs() before completing the
request, and complete it only if the bit was still set. If ufshcd_poll()
has already completed the request, the bit is already clear and
ufshcd_clear_lu_cmds() skips it.

Fixes: f18fac1e2b72 ("scsi: ufs: core: Rework ufshcd_eh_device_reset_handler()")
Cc: stable@vger.kernel.org
Signed-off-by: Stanley Jhu <stanleyjhu@google.com>
---
 drivers/ufs/core/ufshcd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 71f4b9d0a850..531309c7fb79 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -7986,7 +7986,8 @@ static bool ufshcd_clear_lu_cmds(struct request *req, void *priv)
 		return true;
 	}
 
-	ufshcd_compl_one_cqe(hba, tag, NULL);
+	if (ufshcd_clear_outstanding_reqs(hba, BIT(tag)))
+		ufshcd_compl_one_cqe(hba, tag, NULL);
 	return true;
 }
 
-- 
2.56.0.176.g3575e65682-goog

