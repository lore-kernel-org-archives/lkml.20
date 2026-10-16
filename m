Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBAD37DABD
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792131089; cv=none; b=NDz5PnuVnhriSfgQzqxsak0gujFXe6Z5E/FCIM2my7RLWW5X+rbAoMJiDrNgrB/mLlOP9sF38opKqvNe1mzawYjNDKzracAziAuMW48n9cbXwmsx+b1+ZeBkbBt/yshrbjVhyiKtFyke6bGW79epac3pO4ITXeS5YhmESpaGweY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792131089; c=relaxed/simple;
	bh=SsI4U9ZL+7Uo8HhhoT2Gu79p5AWbf+Tp7UQOH5gny+U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hfi0P4hP+RKwieJM8xPvzyBW/dwsg1COH3/KrXWWLO5qWL8zMMEDPcbLYDOmcnHgJeCewewXCEPxoyMBROw1m9K+Nib/vEIH1NREr6D2+CPR0x5ZlQRRso9FkvfKt0euKgsUqe9TSflMhF8NyfoXV/aSLU3Bo8qCJQWCRBXZWBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E9IeXBEv; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E9IeXBEv"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cbedd5aece4so351781a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 23:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792131086; x=1792735886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=id/dYpmE9pWZImX6Xj6XFEbwxwZmT89xDoMqxLDgKrU=;
        b=E9IeXBEvXZDk+SY08ZjvBwE+6+xVo9BL9PtlX1FGprDLeJJi4cRn3N7EgjQ9eFgNye
         6dwDa3tUaHVks1KyZJZSexIX4GIfmeRxDbHBjl23PuEAoDeIwna4jrqHgl7ckH4W9/SX
         Y8gDDuJP71yE+i/jgSwOUFsGUZSGYdplPtdbH8REQf7bQNf7WPmj6LDsEhKj1wHMkBKz
         f0yahU11QigXzM/bGI+UaNy0SViQtwqaz3aLLVBlbE4N+9cTRqoLqmyzlfGlwDeKsGVh
         cG0XgRFstB0j+2bsnRZB3nVQ+WgTNfHwbxQGPXhIB8k4J1Nz7h+nLQdKgYdSbPRFZsV1
         Rh9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792131086; x=1792735886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=id/dYpmE9pWZImX6Xj6XFEbwxwZmT89xDoMqxLDgKrU=;
        b=AujpbrmTP1/rEGNWOgT1HcYKtw2ZOOccx8PheUiBSN8wjaUSmXLHDsVN0NVbcqhstI
         N/6CiN3n9jB8hoAO8mlnCmH9kb2zf61bF7RjBOn6mbROdqCsE2v2YUxbzfd972h6tdi6
         9BNlfThCkPzN57adQ47a2Hm+ai91cybRWtNlgVbOo7WrVKry7U31QmFJ60hhK5TNAJch
         TZGnn/IL1+Yu/nISxK06e7E6JLu5rN0FHQAb73+pI1Sz4BdMBiL0Wf0Jh62FfVib/EjQ
         GruMVsMBTGgGyqhHmuIebJHXPVNY99X0OSlikBQ9WW32AQ7VW6jbNpM8i9TnmtZ08/9i
         Zj3Q==
X-Forwarded-Encrypted: i=1; AKwUvBwSEkdsdzXd1iD8IedNfhTZnjADKSuIOdJt8J1E9aDY9nBKpYKLg0SRFzn9E4iZVjr/upG9zdUqmKUqw0k=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVvkejCOYcC+htOm56+5AU8vJzLZWn2DNKsYPfFojMsgv+jBQe
	gS7Ay6sWu4MOlEw7rZ6fEHlFC5TDbaNlYYkrhXAy9ttxE0sVdsFxQWeN
X-Gm-Gg: AYBFou0i67iDU3qfjAdNCvJ0JSEKzuogd6H+S/4RFOKmnuK6Su3jnPhBdknlVK6q1Iq
	TJj1IpVRzWG2UuC6gPkeK8Efs2asH3yObrUN68XMFS1AS6sFffH9+zQ4TUlgdNyBkMPEkOLEQAW
	xAVLIB57vf/emefZo4vnY70mxMr73u8sXXYaZqdLg1P6K/d3YfP3d1jiObuQEodXTJ14esiOdXZ
	RWb177ppLWnt142Fxjnxy/DmD+3mkC31zOB1nJ9zL7PJ4VOKUasm0SoMvQXF/UCHprol0SqoPJ7
	sKhHSBQoQYsLgzKO/56EFh+wOlwUmWmCcTOD8y0wffh08V8g2KF6S5mnnHuKFvvbCcHOffweXYe
	mZwi/GjALigDUhCK+BhhfZV8hQArguWFDrUIIhqLtKVm4y6j8oQGibl9AKVYpLXDw20g3v7MxWH
	duqg01cWSxfIth6RD6hXapxyL0XuhrwWNLT/soRMYV2zBpG3Y6Z8w46sADLWVN8NWlUPvQDs8i3
	TKQaNAcujE=
X-Received: by 2002:a17:90b:2ec3:b0:3ac:9d83:8858 with SMTP id 98e67ed59e1d1-3acbb933bbamr1924825a91.41.1792131086541;
        Thu, 15 Oct 2026 23:11:26 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd654621dcbsm546633a12.0.2026.10.15.23.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 23:11:25 -0700 (PDT)
From: Daehyeon Ko <4ncienth@gmail.com>
To: Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>
Cc: Naman Jain <namjain@linux.microsoft.com>,
	Saurabh Sengar <ssengar@linux.microsoft.com>,
	Michael Kelley <mhklinux@outlook.com>,
	Roman Kisel <romank@linux.microsoft.com>,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mshv_vtl: reject poll files with multiple waitqueues
Date: Fri, 16 Oct 2026 15:11:14 +0900
Message-ID: <20261016061114.1686153-1-4ncienth@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MSHV_SET_POLL_FILE invokes a file descriptor poll callback with a poll
table backed by a single embedded wait entry. A poll callback may,
however, register the table with more than one waitqueue. pipe_poll()
does this naturally for an O_RDWR FIFO.

The second registration currently warns but then inserts the same list
node into another list. The new insertion overwrites the entry links while
the first waitqueue still points at it, corrupting the first waitqueue and
causing an invalid callback traversal when that queue wakes.

Reject a second distinct waitqueue, remove the first registration, and
return -EINVAL from the ioctl. Repeated registration of the same waitqueue
is treated as a no-op. A rejected replacement leaves the CPU slot
unregistered, consistent with the existing remove-before-register ordering.
Single-waitqueue users such as the OpenHCL io_uring poll file keep their
existing behavior.

Fixes: 7bfe3b8ea6e3 ("Drivers: hv: Introduce mshv_vtl driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>
---
 drivers/hv/mshv_vtl_main.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/hv/mshv_vtl_main.c b/drivers/hv/mshv_vtl_main.c
index 6e3c11c681717..158409b67a046 100644
--- a/drivers/hv/mshv_vtl_main.c
+++ b/drivers/hv/mshv_vtl_main.c
@@ -72,6 +72,7 @@ struct mshv_vtl_poll_file {
 	wait_queue_entry_t wait;
 	wait_queue_head_t *wqh;
 	poll_table pt;
+	int error;
 	int cpu;
 };
 
@@ -458,7 +459,19 @@ static void mshv_vtl_ptable_queue_proc(struct file *file, wait_queue_head_t *wqh
 {
 	struct mshv_vtl_poll_file *poll_file = container_of(pt, struct mshv_vtl_poll_file, pt);
 
-	WARN_ON(poll_file->wqh);
+	if (poll_file->error)
+		return;
+
+	if (poll_file->wqh) {
+		if (poll_file->wqh == wqh)
+			return;
+
+		remove_wait_queue(poll_file->wqh, &poll_file->wait);
+		poll_file->wqh = NULL;
+		poll_file->error = -EINVAL;
+		return;
+	}
+
 	poll_file->wqh = wqh;
 	add_wait_queue(wqh, &poll_file->wait);
 }
@@ -468,6 +481,7 @@ static int mshv_vtl_ioctl_set_poll_file(struct mshv_vtl_set_poll_file __user *us
 	struct file *file, *old_file;
 	struct mshv_vtl_poll_file *poll_file;
 	struct mshv_vtl_set_poll_file input;
+	int ret;
 
 	if (copy_from_user(&input, user_input, sizeof(input)))
 		return -EFAULT;
@@ -496,6 +510,7 @@ static int mshv_vtl_ioctl_set_poll_file(struct mshv_vtl_set_poll_file __user *us
 
 	old_file = poll_file->file;
 	poll_file->file = file;
+	poll_file->error = 0;
 	poll_file->cpu = input.cpu;
 
 	if (file) {
@@ -503,13 +518,18 @@ static int mshv_vtl_ioctl_set_poll_file(struct mshv_vtl_set_poll_file __user *us
 		init_poll_funcptr(&poll_file->pt, mshv_vtl_ptable_queue_proc);
 		vfs_poll(file, &poll_file->pt);
 	}
+	ret = poll_file->error;
+	if (ret)
+		poll_file->file = NULL;
 
 	mutex_unlock(&mshv_vtl_poll_file_lock);
 
 	if (old_file)
 		fput(old_file);
+	if (ret)
+		fput(file);
 
-	return 0;
+	return ret;
 }
 
 /* Static table mapping register names to their corresponding actions */
