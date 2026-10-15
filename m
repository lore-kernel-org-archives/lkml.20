Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871F3146A66
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792023539; cv=none; b=UcWE4YbCV8YvXJOY+V5AiWJQalHidnITiN+xgiXe/nzprxYCeeXCv4wWF7Hmu2EBLq+G0yrB346LlYlN+RNBatBj384fv+J8/6CMMB+MKbDX3Vd2zTRIP1E8tIPiui1Fof5OF9npTGSDm/FgwLwNToCixQTbqFUS6ugxWC/yCNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792023539; c=relaxed/simple;
	bh=Da1d/XmGI8q9ZhxM+3Qdtd9kTixZEF+kq9hLy179Mjs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=gbcNatxGZvjbOmxQCdYz1I9jCj6loek+6YG9KQgDawro9KifinC0v1tMuHAg8i1SErU360G3tkYBUmOD6PLWJcbWoY5bQcTEdp23kBQKg7+9dboRzDBNRkiCrOkaqxCB1oefskyMoDCHah1d+i03tKIbRMl/zm9Wg8jyEY7DP8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KgNunPQv; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KgNunPQv"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ab67ff8ec3so729208a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792023538; x=1792628338; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TQdRWCmeNk4EgwB1qXCYJbZCkL4b8BQjz/PEPZb457s=;
        b=KgNunPQv5wpSnkjV2DdgsD+VyQ9j1ZRGJo0kmAThLw3PNfmrUOOcD2pYVTLBI4ZJzo
         R7W3QXP05iyzG0M/Lu9JxXsjsFFgVoTEXFppAN/jU+6Z5tdFW0iWKSPbDZSZr7LOHj6Y
         ++qmEyRJD3KtbWPz3YuZGqv5LAou1v8ZxKNHbujEy2WF390w59zjtRt3Id69TNDSx2Ut
         hlFNHNGAN3Kn5QmNpk+crMok/MrQMLDjiJw7o7ABFlXrkQEXdaMxQTBaxSnTjRUb2xCu
         m6iYGhOGiAcROpBufbi5/GhirzgMsXnq+RCkdsSDmCk4JZukSJk2TkQJPG3v6qX/P6Nh
         9kNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792023538; x=1792628338;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TQdRWCmeNk4EgwB1qXCYJbZCkL4b8BQjz/PEPZb457s=;
        b=MK0aqFMKGi/KJbS8g7v9AmYHCCV7hXoQi2yE8cUuFmG0Tjhwa9Fr4xoYmKtHdYAIlh
         1BwT7MsrsIm4qmggpwIWpf9snW6b7GFaCc4SHygcyZjUJWEcmu4g6gZdaf/QlBGDVIqv
         5WV1ym/IhSlFP1mqa9l7n52uOiIa1q+2W1m8POlvaPdE5WsaMsxDCEZFQF6/RZHaUDEg
         /UF4tUi22guoyIOm8SZiK9PKDrt+YEhR26CXWsmUsRffs8skF+vATBcnMF+qJnzQKQ3I
         pz9HfeCm9XQQf9d5d63Zx4yu3wQeiBVt/Y84VyJ7g2G8yEIxjTdJHMsVX2f3eJ75CBMs
         +5lQ==
X-Forwarded-Encrypted: i=1; AKwUvBwGldktSZKu46b67yh8HzZaXSaBeML0Hnrr341Qp4V6Aqkz3IzrM7pVGZwuXsTeFxtdyeI7fM+TTZ5AiVM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJEOo2CicndGuIVNQJQ4ZpbfrdzXiicenoEhfzTi5LcMsfYvx0Y
	tSxXnnDHgHjMOpFRk+eSdx8S6j4tMPGqFOuQTgFW7QvP9JmuL+KNOyhS4K30IvQNDBZynEZJQkq
	GuOWuNdbE1uw17T0Dl056Eg==
X-Received: from pgbbq22.prod.google.com ([2002:a05:6a02:456:b0:cc7:d188:aeec])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:268f:b0:3a4:6e84:e7f6 with SMTP id 98e67ed59e1d1-3ab3a32cbadmr14747661a91.5.1792023537520;
 Wed, 14 Oct 2026 17:18:57 -0700 (PDT)
Date: Thu, 15 Oct 2026 08:18:50 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261015001855.3450573-1-stanleyjhu@google.com>
Subject: [PATCH v2 0/5] scsi: ufs: Fix UIC result byte and BSG request handling
From: Stanley Jhu <stanleyjhu@google.com>
To: "Martin K. Petersen" <mkp@kernel.org>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
	Bean Huo <beanhuo@micron.com>, Peter Wang <peter.wang@mediatek.com>, 
	Brian Kao <powenkao@google.com>, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

ufs-bsg fixes for issues found by fuzzing /dev/bsg/ufs-bsg* with
syzkaller on QEMU's emulated UFS host controller and in review of v1,
plus a fix for peer DME retries.

Patch 1 completes failed BSG requests via bsg_job_done() so error paths
do not leak the job's device reference and mapped scatterlists.
Patch 2 clears the reused reply buffer so replies do not carry bytes
from an earlier request.
Patch 3 rejects requests shorter than the UFS BSG request structures.
Patch 4 rejects UIC commands with a non-zero result byte from userspace.
Patch 5 clears the stale UIC result byte and restores argument3 before
peer DME retries.

Patches 1-2 also address the sashiko review of the bsg reply_len patch:
https://lore.kernel.org/all/sashiko-outbox-169843@kernel.org/

Tested on QEMU arm64: the reproducers no longer trigger.

Differences from v1:
- New patch 1/5: complete failed jobs via bsg_job_done().
- New patch 2/5: clear the reply buffer on entry.
- Patch 4/5: reject non-zero UIC result byte with -EINVAL (Bart).
- Patch 5/5: restore argument3 on each retry in ufshcd_dme_set_attr().

Link: https://lore.kernel.org/all/20261013102913.948718-1-stanleyjhu@google.com/

Stanley Jhu (5):
  scsi: ufs: bsg: Complete the job on error
  scsi: ufs: bsg: Clear the reply buffer before use
  scsi: ufs: bsg: Validate request_len before accessing request
  scsi: ufs: bsg: Reject UIC commands with a non-zero result byte
  scsi: ufs: core: Clear stale UIC result byte before peer DME retries

 drivers/ufs/core/ufs_bsg.c | 23 +++++++++++++++++------
 drivers/ufs/core/ufshcd.c  |  9 +++++++--
 2 files changed, 24 insertions(+), 8 deletions(-)

base-commit: 9621cbd332862eb6651e2aba24ed18f66560de66
-- 
2.56.0.385.gd3acb90ef8-goog
