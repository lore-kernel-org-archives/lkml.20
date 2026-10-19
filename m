Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE3749DB97
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792399451; cv=none; b=aKxSzVsUYnkKYUDtaQ2DLOb4HYL5Tg9BJ/l+ng54udcqziXEpruMJMfel8QkyNWK/LSSkUrlEIlxpXBPMPvs1OQ3Wo4frmrZXh7Wnn4ci4gFLSBU2qp5pfMGgLc/MOam3EytTLNgfKBuP0Zg9Z0F29lMd8owSFy9IOJA5jMRWoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792399451; c=relaxed/simple;
	bh=eUlgZa4mByAmqLLYHZlpmODtiKLs/uZsRAEQoW4P2VI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OMmAPFLUe9uv9f6LMpJyhy5T2YriZ9TMKR0Ist5Z9Ro3LTHRmvxa9C6iui6p28dQDqXPVwkXcArnNNbX+MRzC2lylrrH2f7s7/qAPYd+2mzWu/l++40QwvsKYfD/UZPQkxlrzvfHQ3/82cwWR50GgypdvtaqqVRXUtyP26YyWak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=grGRAqts; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="grGRAqts"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ac451e128cso1174862a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 01:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792399449; x=1793004249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aZAjpnZdcieC/RDo5HIFt+JRBt/XWhH9vOMNbiyGsFc=;
        b=grGRAqts5cd0je1D5xiuGm3XQAiM9jaMZkYb+jUUcldIg685f4For9AOSBJgHPKLEP
         QkA6H8h3NotZ3lgZsWfbbPVLNeQ9qNOxfMdGrLV3wwpnw+P8yVweceTP75X412JjvqSt
         3SsvVIPy9sVe27VxYXUkFSKMN5DIQ5AABD915uoNILNf5UyHgn04Yci1TYdvN6IzSWza
         jyq0ZEfaCbbwq0gKDled2ugFpUI9Z5MasWV1JddiQvYqfkERi3tjbprvGVqvYsVeLuUa
         FbQVqk3bh3av03qg3/5LrqhXvVShW2/O9Xkhsh6gXLrvpxkZgOcQSIxTVeK7j7VsDP9i
         +7OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792399449; x=1793004249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aZAjpnZdcieC/RDo5HIFt+JRBt/XWhH9vOMNbiyGsFc=;
        b=y9yYReL/4iYIc7KcBu6ohpxMIsGys4ELpmd7XXBxNzwmeTkQaG6hwFPCkEbHJ9zJOP
         XilGlEgdC+kOD27lmUR/UYz9zYi9M3v8Byl5eEXVLBwKLufN3QYacgWc0B90nmj3NOay
         URUG8bhvDBzTCnO4kpRQ2VkvNxpjbcAbI8QmO7t1GUlNk5rO+kHirk7zkGJg+1zEvwHt
         db1Jwra8YXFIuu7w3GdxL3wIL0jaSSWDQyjeci7MPeLRRtSq+3wNQGnevSk9wr/S6ano
         W1+a92VndCrrPji2tEnlX/Uzy2nCVa9dnJ0unLKKZ8HK/t9kegwFi5yMAqZWwCkoCuIf
         V+qg==
X-Forwarded-Encrypted: i=1; AKwUvBz5dLrQeVx/PpXqmVQaV0bGkPxHWzXYWe1GEkG86zCyxM6Ybio0ETTz4+CnpsRkOw2EIa02VhxwhM6Xb3U=@vger.kernel.org
X-Gm-Message-State: AFq9FYJMTFu3RBfIvhVAxp72r+Mkkv7hIRLw3oPoUA9vE7cY5b5mU4RU
	1YfxsX5kvdfpmbrhhmOsCVzydsMAS/4pOrf4DFbYPcg3QQ6ZMJFdvzBy
X-Gm-Gg: AYBFou2WOODqMfWcVPBWqsI71kv+7nQ38JcSZ/kmljYKEwDll9wD1TuZnEofJ3bbZu3
	tHY0V7hgUusnn7ihO9wC5ya3Jsd3v4FYBMY0SvP6Bkx/wD3+ijY93rjon6AWFSsmqFg6QLKGdlD
	/SuLqELXTMWSj06F4KR+mtI4ySxr3/4RwglYyALBR4YTfQQJSAAu2gG/scmXQCGPiL3GGP0V4sS
	giB654U0yW66yo94U9zm1gmYdT+JyEsE9k/zafnX5G3vu6dgzPFTCPtC+X2BodlG2EvQp6pOcUz
	0b/Uu7oj6d2EJt9EWy5VlL148HMZmxuoahJjeZTX5DxdUsAJ8aO/f3b9BUMgblX3XQdrs6mLMEU
	n6vqKDtzSKT3dyPrainwBgmwSxXQ5hUnUKzGUv70Td+2YO/4gcwpvpNUG+0MwKV0pVUsh11Gnk/
	9Jx70KBC3q2Q2+SUhWvbszO3KgPb6Y7UaepeUbf45nJqoltyApbL/toWOfTtWLm7ALNFurIh5ye
	fx8+cuperV19tXYQgQlUw==
X-Received: by 2002:a17:90b:180b:b0:3ac:c90a:10bf with SMTP id 98e67ed59e1d1-3aceefbf728mr5189425a91.17.1792399448796;
        Mon, 19 Oct 2026 01:44:08 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc48f19d9sm14644858a91.11.2026.10.19.01.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 01:44:07 -0700 (PDT)
From: Daehyeon Ko <4ncienth@gmail.com>
To: Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>
Cc: Naman Jain <namjain@linux.microsoft.com>,
	Saurabh Sengar <ssengar@linux.microsoft.com>,
	Michael Kelley <mhklinux@outlook.com>,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] mshv_vtl: reject poll files with multiple waitqueues
Date: Mon, 19 Oct 2026 17:43:49 +0900
Message-ID: <49e4b702301d3d413d4adb7d4062e0a9b78a350e.1792398881.git.4ncienth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792398881.git.4ncienth@gmail.com>
References: <cover.1792398881.git.4ncienth@gmail.com>
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

Reject a second distinct waitqueue, remove the first registration through
the common removal helper, and return -EINVAL from the ioctl. Repeated
registration of the same waitqueue is treated as a no-op. A rejected
replacement leaves the CPU slot unregistered, consistent with the existing
remove-before-register ordering. Single-waitqueue users such as the OpenHCL
io_uring poll file keep their existing behavior.

An LLM assisted the source audit, fix development, and validation of this
issue.

Fixes: 7bfe3b8ea6e3 ("Drivers: hv: Introduce mshv_vtl driver")
Cc: stable@vger.kernel.org
Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>
---
 drivers/hv/mshv_vtl_main.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/hv/mshv_vtl_main.c b/drivers/hv/mshv_vtl_main.c
index c6f1e2157d258..9133646b5b66c 100644
--- a/drivers/hv/mshv_vtl_main.c
+++ b/drivers/hv/mshv_vtl_main.c
@@ -73,6 +73,7 @@ struct mshv_vtl_poll_file {
 	wait_queue_entry_t wait;
 	wait_queue_head_t *wqh;
 	poll_table pt;
+	int error;
 	int cpu;
 };
 
@@ -482,7 +483,18 @@ static void mshv_vtl_ptable_queue_proc(struct file *file, wait_queue_head_t *wqh
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
+		mshv_vtl_poll_file_remove_wait_queue(poll_file);
+		poll_file->error = -EINVAL;
+		return;
+	}
+
 	poll_file->wqh = wqh;
 	add_wait_queue(wqh, &poll_file->wait);
 }
@@ -492,6 +504,7 @@ static int mshv_vtl_ioctl_set_poll_file(struct mshv_vtl_set_poll_file __user *us
 	struct file *file, *old_file;
 	struct mshv_vtl_poll_file *poll_file;
 	struct mshv_vtl_set_poll_file input;
+	int ret;
 
 	if (copy_from_user(&input, user_input, sizeof(input)))
 		return -EFAULT;
@@ -518,6 +531,7 @@ static int mshv_vtl_ioctl_set_poll_file(struct mshv_vtl_set_poll_file __user *us
 
 	old_file = poll_file->file;
 	poll_file->file = file;
+	poll_file->error = 0;
 	poll_file->cpu = input.cpu;
 
 	if (file) {
@@ -525,13 +539,18 @@ static int mshv_vtl_ioctl_set_poll_file(struct mshv_vtl_set_poll_file __user *us
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
-- 
2.55.0

