Received: from mail-dl2-f40.google.com (mail-dl2-f40.google.com [74.125.229.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E5D3AF675
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 07:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791098470; cv=none; b=q4nFixgKj/KlpLoMkvybb4uU6ysraoNbSXw1T3dEKLB7q8C5dNZU8cl9P962EDo8yibT0B4fo6aRnbw9IolAVVXnB3wS2o19JgDOZignpwUsVfguKVBeZPbQ2dO+A+on6/lI96idGUTzz24dcfeUeooof382mDCpgSX6GlI7zIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791098470; c=relaxed/simple;
	bh=7pAM0UzmK2ulMNt3EHVbZiCSCsyGCMVmCVgGGsiwG2g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qRZX5McNqIdwa3Ne/enfZwVJoU7HQvo8/Yxlfzc88GHQ/Z+zXP9ZCam8sSHp8CUNXikkmafIOh4bvft2Cwc0QL06F0Lh6U+nMLmaRXJ1GtLlctqEFu3KkTpIBXGsZ8yHEtD2vBxjiM/TEQO9s5ExmtT5Jq/EXwX+8+oP8fu0OMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XGUkEOP+; arc=none smtp.client-ip=74.125.229.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XGUkEOP+"
Received: by mail-dl2-f40.google.com with SMTP id a92af1059eb24-154e9d2d877so115819c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 00:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791098468; x=1791703268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OdRsUg4aEd8z+aIPLHLtgWH8DwChXLilPVarrUw7AJg=;
        b=XGUkEOP+K4u9AUXvWiLpbDV3KdzSiNYdwPjPhc+Tz0G1hn5/SxM+AEGtOiImLUNU1N
         +mMLrOvIlSQK2/jhD7UuMclgUTLpjnyqcyutqH+XzNcJ6DU0Yk/aaVUyj5CZEJsl/+C5
         qmzB18KZipFTt98t7R1hl8qD/f3RckUnkwIJs9r2Gh4WdiIXjYcFYM5yAFNuixuG4JDH
         pNnonAS7CHzTSBliWeMmAMJaYhOOOqdmwlSKH9kFCZKz8pBtyR6T+oTj2v+343WiBEDc
         4O2XP2UWJxrNCWN46P/zuFlwsKBhM/XtxLaPiFrJlHIYAht6pbM3UBYXnIRhUCTZJtML
         PqCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791098468; x=1791703268;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OdRsUg4aEd8z+aIPLHLtgWH8DwChXLilPVarrUw7AJg=;
        b=kXkQEEhpXZxA782nB0vnZCiVrnaLWIq4YSQ+Rp1M5F9UT2jHfPWNd5OQJuf3DzlUPl
         osbvrgEc2NbSFt/owQFfyI6pxq2Lm7d9+NV4O4LUVwgiu2Grr+JESZ9lIrnRbv/DxIIs
         tw4fs+/rEHTL5tHuLru97QaGS8++SAZUvIF0bNW57HNFx6j7Ui7AUlizqy8kFMrOq8+g
         R4bmlJkFUlpkhsIoWewQ/QNcnBnR7iXqcH5Y6wjSD5iZSEHPqA5a4wBJWYt3VQzkyc+h
         Qm0sDmKtr+4c18w0fZJPYgVjI+11VXNRZ+O+y3O9zuuxfePOhRL43ArU9/Chp6cH8GRj
         PZBQ==
X-Forwarded-Encrypted: i=1; AKwUvBxYLYuYiZMGf70bHFcgy2gT1Lpu3USN3Fg2vs6ITbeUpEv7DqSena4Qbsb3KahRcs6IdNVzpyLng2xPFw4=@vger.kernel.org
X-Gm-Message-State: AFuF++m5fcn/+SEOVpr7ZcM9QDo4rnkCN7FtaiTArORsKaSisCojbg9R
	gpZr8nktxnxo5hyNidoUtvzxGdustgMxEehOiOfPWRp8LIpnXVzeqQkA
X-Gm-Gg: AYBFou0T/sphK8F+RkIAahjfoBpbB9clIbwXZteWlDuiIwtH4nkIb3b7/LfAAnn1XDu
	MDvOQ9Re+rRIiKfwWc6cGf/fG46B1H2wAk1af16bQdp0LH10SWmK4Ld4PwK//exC+bAig5xbtQU
	E5M6qho8RmjJTQVr3zWIbYcUh8JjU3AmKCNalCukS7WgfzM0lbjYTm8Qd20dnO5wf4IMNdnNnxV
	afNDTpPIWbtwOZLJ9Krs5pmpDOh45P4xanjy9JJIMzFzfNe63bse8wuwTy6EPnvP6u2MiwI//p6
	tWxCm+OLwgiHtlL/TGoKZii1iqhs2qrjgEAlKJVcvYd0xzdU8jfmgW2B0AiUX+r7M5U6q2/FjdV
	gwWGcW0T1w5+ieDK6NX+aqqDGdXoxF0BdBNzKVxxYAtNZNfRiIG1CMNKjnzQuClZdUjARjEX9w5
	xBQ+2n2jsSFW4OTbLAaNdCkQBJG/dMj7Nr+Lmw+IpcNa4Trh+j2f+oboGd3BhTOXu6z53k8CzDO
	8393cKKPAtzsjOwoyGnQaY=
X-Received: by 2002:a05:701b:2704:b0:144:f096:4dda with SMTP id a92af1059eb24-14f5c9da5abmr10241977c88.43.1791098467702;
        Sun, 04 Oct 2026 00:21:07 -0700 (PDT)
Received: from LAPTOP-450UDG4J ([223.185.132.231])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3512718a18esm3057871eec.17.2026.10.04.00.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 00:21:07 -0700 (PDT)
From: Yogesh Gaur <yogeshgaur.83@gmail.com>
To: Keith Busch <kbusch@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Jens Axboe <axboe@kernel.dk>
Cc: stable@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yogesh Gaur <yogeshgaur.83@gmail.com>,
	syzbot+76c0f0ce8f1e846b4f84@syzkaller.appspotmail.com
Subject: [PATCH] nvme: keep a private copy of the effects log in the ns head
Date: Sun,  4 Oct 2026 12:50:52 +0530
Message-ID: <20261004072052.1574-1-yogeshgaur.83@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nvme_alloc_ns_head() points head->effects at the creating controller's
Commands Supported and Effects log, which lives in ctrl->cels and is
freed by nvme_free_ctrl(). The head is owned by the subsystem, though:
with several controllers on one subsystem it is shared between them
and stays around after the controller that allocated it is gone. When
another controller then (re)scans the namespace, nvme_query_zone_info()
and nvme_command_effects() read the freed log:

  BUG: KASAN: slab-use-after-free in nvme_query_zone_info+0x4fd/0x6f0 drivers/nvme/host/zns.c:47
  Read of size 4 at addr ffff88802ab9e5f4 by task kworker/u8:2/43
  Workqueue: async async_run_entry_fn
   nvme_query_zone_info+0x4fd/0x6f0 drivers/nvme/host/zns.c:47
   nvme_update_ns_info_block+0x1b2e/0x2af0 drivers/nvme/host/core.c:2430
   nvme_update_ns_info+0xc6/0xd90 drivers/nvme/host/core.c:2553
   nvme_alloc_ns+0x1a9f/0x3e50 drivers/nvme/host/core.c:4293
   nvme_scan_ns+0x79d/0x910 drivers/nvme/host/core.c:4483
  Allocated by task 6345:
   nvme_get_effects_log+0x13a/0x280 drivers/nvme/host/core.c:3422
   nvme_alloc_ns_head drivers/nvme/host/core.c:4037 [inline]
   nvme_init_ns_head drivers/nvme/host/core.c:4153 [inline]
  Freed by task 14867:
   nvme_free_cels drivers/nvme/host/core.c:5165 [inline]
   nvme_free_ctrl+0x1e4/0x6b0 drivers/nvme/host/core.c:5183

syzbot hits this with nvme-loop by connecting the same zoned subsystem
several times with duplicate_connect while deleting and rescanning the
controllers. The NVM command set case (head->effects = ctrl->effects)
has the same lifetime problem, as ctrl->effects is also stored in
ctrl->cels.

Give the head its own copy of the log, taken when the head is created
and freed together with it. That keeps today's behaviour of using the
first controller's log for the whole head, but no longer ties the
head's lifetime to that controller.

Fixes: be93e87e7802 ("nvme: support for multiple Command Sets Supported and Effects log pages")
Cc: stable@vger.kernel.org
Reported-by: syzbot+76c0f0ce8f1e846b4f84@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=34a8e8b643a20c2cbde3
Assisted-by: LLM
Signed-off-by: Yogesh Gaur <yogeshgaur.83@gmail.com>
---
 drivers/nvme/host/core.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 5d7dfd7a63d4..f0df4c204e52 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -694,6 +694,7 @@ static void nvme_free_ns_head(struct kref *ref)
 	cleanup_srcu_struct(&head->srcu);
 	nvme_put_subsystem(head->subsys);
 	kfree(head->plids);
+	kfree(head->effects);
 	kfree(head);
 }
 
@@ -4022,6 +4023,7 @@ static struct nvme_ns_head *nvme_alloc_ns_head(struct nvme_ns *ns,
 	__must_hold(&ns->ctrl->subsys->lock)
 {
 	struct nvme_ctrl *ctrl = ns->ctrl;
+	struct nvme_effects_log *effects;
 	struct nvme_ns_head *head;
 	size_t size = sizeof(*head);
 	int ret = -ENOMEM;
@@ -4052,11 +4054,22 @@ static struct nvme_ns_head *nvme_alloc_ns_head(struct nvme_ns *ns,
 	ns->head = head;
 
 	if (head->ids.csi) {
-		ret = nvme_get_effects_log(ctrl, head->ids.csi, &head->effects);
+		ret = nvme_get_effects_log(ctrl, head->ids.csi, &effects);
 		if (ret)
 			goto out_cleanup_srcu;
 	} else
-		head->effects = ctrl->effects;
+		effects = ctrl->effects;
+
+	/*
+	 * The effects log belongs to the controller and is freed with it, but
+	 * the head can outlive this controller and be shared with others, so
+	 * keep a private copy.
+	 */
+	head->effects = kmemdup(effects, sizeof(*effects), GFP_KERNEL);
+	if (!head->effects) {
+		ret = -ENOMEM;
+		goto out_cleanup_srcu;
+	}
 
 	if (ctrl->ctratt & NVME_CTRL_ATTR_FDPS) {
 		ret = nvme_query_fdp_info(ns, info);
@@ -4076,6 +4089,7 @@ static struct nvme_ns_head *nvme_alloc_ns_head(struct nvme_ns *ns,
 out_cleanup_fdp:
 	kfree(head->plids);
 out_cleanup_srcu:
+	kfree(head->effects);
 	cleanup_srcu_struct(&head->srcu);
 out_ida_remove:
 	ida_free(&ctrl->subsys->ns_ida, head->instance);
-- 
2.55.0.windows.5

