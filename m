Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6EB233920
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792023545; cv=none; b=khKgtOAflEBNiJDNCraWGlM5UPaE5wDVAuspa+C7Da8JGcyq2WRdaH5TdGu8G+dPNw/dEhiA+Sn2lZCjknH1w5XR9fCsmw+8tY/W6T9MlJ8k5uDM6erfjad+IG0VYL0ZOfkY/l54//NnCh9HtCr587c3oQ9fe1+7Ivm/+V9GTLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792023545; c=relaxed/simple;
	bh=151ud4TxhR/44w+dF/Fo4X7IqdSZUdFRW4YkmG37VQg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oGNCFzzE1gFbs53vuD5JiRaxQAmaTdKJGZstKKYhhxAmjdl/Rdj2gsZ9Hbe/YVKRb8Ebfk04BJ3u9KKO+gznqDX/yMgSDnzCS+kBKRVDuuBShd//JhYYN0RzgoD3QXtbBTBUWEiikdKYKiIRBY4gQuxz2jEMmSrdAyvTynzEA4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ChsL1DNy; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ChsL1DNy"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd3b9e70fa4so4142673a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792023543; x=1792628343; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LQ467coIVi/icwn1gSoRQaLRewsTqMBzIfV1t0inAFU=;
        b=ChsL1DNyKGmxx/rA/2b0H0C/q8tFBNpLGv0VorcfN/5r93/NMKAg1ydeBdIqoIItnB
         1fclyM6Wr4eVcg8dTAYdW2WmoO0fwBflHAG6qH42QiNPSxQ4hra9GT31EslMToprm1nI
         5LmdiFP4AEdvUxyAlt7NX/yFy4i7Yn0fY8Ku7g37Zd0PxJORVBqOuGCl4D9lLookK+q7
         F/vHN6q86L4UNuHVo5w/dJtrPbw8FnnzpfmEM0y/8cyu6L43ftmC7qC2rsfe9rBt/SHT
         jLuEGQa4I56sBhraKV6t4HQCqmbp+CXTXWxyVDk2GFunYK6s32PUkrfCuWAUc7DvZsHJ
         uOIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792023543; x=1792628343;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LQ467coIVi/icwn1gSoRQaLRewsTqMBzIfV1t0inAFU=;
        b=YEz+x/hHf1xzBclKgOWIjyA3jwHz+lMjwWhA2mUb/vLQfJ9jUS8P7FWEbbYYiG4dTA
         EhJRcvHzxP0tdR/JTOkFGYkXuUgo7F601K6Aj9zrr2hkBr/URNOV1/x27qX4IN9TMAAu
         DPk9TPQdD0nll5UX1kpo/IBxCyhcvB3P7l5RG4ikH8Mv6h8l+fia2hdnIgi39eoBUEM8
         7732Ob6SDqUEj5+Qp1teqjRoJJ3zO0ZHg/09lfir0HlTcq4C1TFr9zVe9ul4HpX9D6Ap
         E+gJNzcWNHtqlvA4CdFBQ8X6u7626AD2EjWLrZUstlZKaITaXNdI4YjG+mSp2ggJGHrR
         pt0w==
X-Forwarded-Encrypted: i=1; AKwUvBzSw+KnpaJpORQpKRxGLhO0R61tUeLrKR6SwJWC0FeVq2ea96y2LMVNDNhWeqWM/5nqRWpzukP/UXIYnXY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdNzdjYTUDTaXkYEdBLEDutcQCE/Eu4eWNGBmOwvo9W63jcK36
	C1FPUz5g8g/CjsGMBo+ZzrwMd3a3rJ3P9HHu35AwH7qapfU/WhXHtl5+wNPHvqfum6qXsFC5huB
	T7jE8gMl3A2XE2q0o7qnTXQ==
X-Received: from pga17.prod.google.com ([2002:a05:6a02:4f91:b0:cc7:e64a:83f5])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:468a:b0:3dd:ff70:1426 with SMTP id adf61e73a8af0-3e16bb09ae2mr13677428637.3.1792023543278;
 Wed, 14 Oct 2026 17:19:03 -0700 (PDT)
Date: Thu, 15 Oct 2026 08:18:53 +0800
In-Reply-To: <20261015001855.3450573-1-stanleyjhu@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261015001855.3450573-1-stanleyjhu@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261015001855.3450573-4-stanleyjhu@google.com>
Subject: [PATCH v2 3/5] scsi: ufs: bsg: Validate request_len before accessing request
From: Stanley Jhu <stanleyjhu@google.com>
To: "Martin K. Petersen" <mkp@kernel.org>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
	Bean Huo <beanhuo@micron.com>, Peter Wang <peter.wang@mediatek.com>, 
	Brian Kao <powenkao@google.com>, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

ufs_bsg_request() and ufs_bsg_exec_advanced_rpmb_req() read the
request buffer without checking job->request_len, which userspace
controls. A short request causes an out-of-bounds read. Found by
syzkaller.

Reject requests shorter than the structure each path reads.

Fixes: 64d4864714c2 ("scsi: ufs: bsg: Remove unnecessary length checkup")
Fixes: 6ff265fc5ef6 ("scsi: ufs: core: bsg: Add advanced RPMB support in ufs_bsg")
Cc: stable@vger.kernel.org
Reviewed-by: Bean Huo <beanhuo@micron.com>
Signed-off-by: Stanley Jhu <stanleyjhu@google.com>
---
Changes in v2:
- Complete the job on the early -EINVAL return through out_complete
  (added in patch 1). Kept Bean's Reviewed-by; Bean, please let me
  know if you would like to look again.

 drivers/ufs/core/ufs_bsg.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/ufs/core/ufs_bsg.c b/drivers/ufs/core/ufs_bsg.c
index 545ef7b79ceb..0db830e54ef0 100644
--- a/drivers/ufs/core/ufs_bsg.c
+++ b/drivers/ufs/core/ufs_bsg.c
@@ -73,6 +73,9 @@ static int ufs_bsg_exec_advanced_rpmb_req(struct ufs_hba *hba, struct bsg_job *j
 	if (hba->ufs_version < ufshci_version(4, 0) || !hba->dev_info.b_advanced_rpmb_en)
 		return -EINVAL;
 
+	if (job->request_len < sizeof(*rpmb_request))
+		return -EINVAL;
+
 	if (rpmb_request->ehs_req.length != 2 || rpmb_request->ehs_req.ehs_type != 1)
 		return -EINVAL;
 
@@ -142,6 +145,11 @@ static int ufs_bsg_request(struct bsg_job *job)
 
 	memset(job->reply, 0, job->reply_len);
 
+	if (job->request_len < sizeof(*bsg_request)) {
+		ret = -EINVAL;
+		goto out_complete;
+	}
+
 	ufshcd_rpm_get_sync(hba);
 
 	msgcode = bsg_request->msgcode;
@@ -194,6 +202,7 @@ static int ufs_bsg_request(struct bsg_job *job)
 out:
 	ufshcd_rpm_put_sync(hba);
 	kfree(buff);
+out_complete:
 	bsg_reply->result = ret;
 	if (ret == 0)
 		job->reply_len = rpmb ? sizeof(struct ufs_rpmb_reply) :
-- 
2.56.0.385.gd3acb90ef8-goog

