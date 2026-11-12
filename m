Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794460553;
	b=RqBDzjMZO3iSQsZ2vx4HNsD7owMLyMyrVgNTCeHqzy3K7zpgRLJQsc9GVH8Miwl+G0Pa
	 FJzO7680ShDjHiZf6nS/cmT0gGcDPzto4JWx5Z8TYINJnEsbJ1eAIpSQjZWaIe+9vgU6A
	 kZkG6OIuqSsAssZeL63pG8BRS3iUU6EWYsSHrD5wwdoIgPlMaCmlq8zf599jalvJc1IgR
	 hv0g+hLkK2/UA0eR6rNjVOOtlgX1/vDYAYMUDTq/XFeOXbBDcKCP9qehNK7qR8zDc5ltH
	 RrYFc6ZZ0WlQoUFBhutOiLaMg6ftLCVHAOkSlS5fgc8URq4oXk7Gn8IMyuSJCO+e29g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794460553;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Kss5zYTX8gJ/UL/NQYhNcENTaHA0lrV423hmMcyAORM=;
	b=v7r1wv+riuKt3/jXbSn3CVH771DJGmaocfe7hb6bZC6II1HYUH3YkFWoYvABnXZIhkrW
	 Uk2c3GIu3gl5osxCVLZ1TdeQiorEHJ/Mk6rV1xLpATfZfs1odN3rwwINbXRL6ybz3QGUm
	 vntYeH7wWA69lv2QMilCNVfephxPiBz1jAls3Iahv/bzX9s4cspDLfZK57RcMFUfPVXii
	 47fWA+PmNARjLPOciZ9w51Se/6Z/A0vUosjSxrG41XueH2viIxYXXnOJwWziHekt/l6Ji
	 HTLJB27BUMkxRfe58z6B5bqdh9MPjQ+089rbm6uiB5wvibuX8PInhmrNH1QtAxlxM0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Fl+5NysC;
	arc=none smtp.remote-ip=209.85.216.72
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4042A606A8A8
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:15:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4042A606A8A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Fl+5NysC
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ad53f538d2so3247630a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794460553; x=1795065353; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kss5zYTX8gJ/UL/NQYhNcENTaHA0lrV423hmMcyAORM=;
        b=Fl+5NysCNE4cetjhJNZkHOzmwhkL9ndl2tFlcVOkbe57X6yLtjMB4lRRritkHVMWPZ
         4B0YJZ30Qs2Vw0mlrp3bRPEcp2+Lbl+3aDOhOuGvam6Q2Ea6s0R9BxvSXde03Bns0lhH
         yos0du/Q6gcDwVPOujMuy+fAXjS3C3MBXQciHmYhSOb6LWb0wiyEnK9fAATE5a713FEp
         xg2jPl9TtO0q7qoIPx/JXYrvSBGzYJUnjjFtUKzZ4CREfECVJtj4+K/bAKSxO25lsNY+
         gITSJ1onzgOSZNz8vKdqfUUuri8BQ7QL3xsjj55edFY7Lsf+HF1/Rv/8yeiUQEeRkll+
         mHLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794460553; x=1795065353;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kss5zYTX8gJ/UL/NQYhNcENTaHA0lrV423hmMcyAORM=;
        b=FEU9lOia0PliP6QR9roQ4HpiIaASE8VpD95SSZxh8ONgrrfkCuVzk8UsVACvhYHkmx
         R7x9R0ekGWHvy4uO8nFgI7bN5X0l3gdn153Lu4P2oySSZYr2WamS6nsi+m/yjjtc2MKP
         O1eLTfO4esqvPH/nUTs1sPY/O6Oden5SCk5YDHZBM4h/5sj7LxcPw7xXDqKvNySYRRaf
         Ag09Wi9IKMxPMYgxScPVhYPJ3vyNEnNM3u7hWJUJtFMaw1UnWf8vWXu3OT1qznhWCokx
         XQ+3Y0l8BCUdn/tyx8vsTaN3yUwzr1Ds01SRnf0HTJYIZrpTxgi0aLL3NyYvkm+oBPGB
         nplQ==
X-Forwarded-Encrypted: i=1; AL+hErHSVINjhRsuAKrszRcsJQwVVhvx0/uT93IZrWu6k5Qpmg4K4VbvRTNEFoHMXaIbkSP4sKLFtk7671cjOKU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9c4QnCEgYgM/sBmeD/Qpdd/vEs7n2dA/2RVUpqFaCBcxbiv5O6
	gvSVnCBQdMsVnU49iFo4ZCh0tphQnqwRgRepgmK75CI+r4q2Hf2urKEPkBHwGZexjsnGvITeyxc
	UHH2/BXS5aejioTRam0za8A==
X-Received: from pgfd2-n2.prod.google.com ([2002:a05:6a02:6542:20b0:cc7:492f:3ac1])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:5405:b0:3b1:7329:a127 with SMTP id 98e67ed59e1d1-3b182efada7mr3990080a91.20.1794460552446;
 Wed, 11 Nov 2026 21:15:52 -0800 (PST)
Date: Thu, 12 Nov 2026 13:15:36 +0800
In-Reply-To: <20261112051542.1539779-1-stanleyjhu@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261112051542.1539779-1-stanleyjhu@google.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
Message-ID: <20261112051542.1539779-4-stanleyjhu@google.com>
Subject: [PATCH 3/9] scsi: ufs: core: Wait for the reserved tag in ufshcd_get_dev_mgmt_cmd()
From: Stanley Jhu <stanleyjhu@google.com>
To: linux-scsi@vger.kernel.org, "Martin K. Petersen" <mkp@kernel.org>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
	Bart Van Assche <bvanassche@acm.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Avri Altman <avri.altman@sandisk.com>, Bean Huo <beanhuo@micron.com>, 
	Peter Wang <peter.wang@mediatek.com>, Stanley Chu <stanley.chu@mediatek.com>, 
	Can Guo <quic_cang@quicinc.com>, "Bao D. Nguyen" <quic_nguyenb@quicinc.com>, 
	Asutosh Das <quic_asutoshd@quicinc.com>, Hongjie Fang <hongjiefang@asrmicro.com>, 
	Praveen Talari <praveen.talari@oss.qualcomm.com>, HOYOUNG SEO <hy50.seo@samsung.com>, 
	Brian Kao <powenkao@google.com>, Jens Axboe <axboe@kernel.dk>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

ufshcd_get_dev_mgmt_cmd() allocates the reserved tag with
BLK_MQ_REQ_NOWAIT and assumes that holding hba->dev_cmd.lock makes the
allocation succeed. That lock only serializes the owners of the tag. A
busy tag iterator holds its own reference on the request, and the tag
is freed only when the last reference is dropped:

1. A PM callback, e.g. __ufshcd_wl_suspend(), sends a query request and
   waits for it in ufshcd_issue_dev_cmd().
2. The request times out. blk_mq_timeout_work() takes a reference on
   it in bt_iter() and calls ufshcd_eh_timed_out(), which completes it
   with scsi_done().
3. The PM callback wakes up, frees the request, releases
   hba->dev_cmd.lock and retries the query from a retry loop such as
   ufshcd_query_attr_retry().
4. The retry calls ufshcd_get_dev_mgmt_cmd() before
   blk_mq_timeout_work() has dropped its reference. The tag is still
   busy, the NOWAIT allocation fails, ufshcd_exec_dev_cmd() triggers
   WARN_ON_ONCE(!cmd) and the query fails with -ENOMEM.

The timeout handler is not the only trigger. Other busy tag iterators,
e.g. scsi_host_busy() called from ufshcd_gate_work(), take the same
reference, so the tag can stay busy after its owner has freed the
request. Holding hba->dev_cmd.lock therefore does not guarantee that
the NOWAIT allocation succeeds.

Fix this by dropping BLK_MQ_REQ_NOWAIT so that the allocation waits
until the reference is dropped and the tag is freed. Since the patch
"scsi: ufs: core: Defer link recovery on reserved PM command timeout",
the timeout handler no longer allocates a reserved tag while it holds
a reference on a reserved request, so the wait ends when
ufshcd_eh_timed_out() returns. Also correct the comment about why
hba->dev_cmd.lock is held, and state that the function must not be
called while holding a reference on a reserved request.

Fixes: 08b12cda6c44 ("scsi: ufs: core: Switch to scsi_get_internal_cmd()")
Cc: stable@vger.kernel.org # 7.3.x
Signed-off-by: Stanley Jhu <stanleyjhu@google.com>
---
 drivers/ufs/core/ufshcd.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 6a5f5fa732d9..6d789f3badf1 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -3366,14 +3366,17 @@ static void ufshcd_dev_man_unlock(struct ufs_hba *hba)
 static struct scsi_cmnd *ufshcd_get_dev_mgmt_cmd(struct ufs_hba *hba)
 {
 	/*
-	 * The caller must hold this lock to guarantee that the NOWAIT
-	 * allocation will succeed.
+	 * hba->dev_cmd.lock serializes the owners of the reserved tag. A busy
+	 * tag iterator, e.g. the block layer timeout handler, may still hold a
+	 * reference on the previous request after its owner freed it. Hence
+	 * the allocation may have to wait until that reference is dropped.
+	 * Must not be called while holding a reference on a reserved request.
 	 */
 	lockdep_assert_held(&hba->dev_cmd.lock);
 
 	return scsi_get_internal_cmd(
 		hba->host->pseudo_sdev, DMA_TO_DEVICE,
-		BLK_MQ_REQ_RESERVED | BLK_MQ_REQ_NOWAIT);
+		BLK_MQ_REQ_RESERVED);
 }
 
 static void ufshcd_put_dev_mgmt_cmd(struct scsi_cmnd *cmd)
-- 
2.56.0.567.gdb80ae8cd5-goog

