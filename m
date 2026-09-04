Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E18342E43B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788520651; cv=none; b=K1lIDEY60dnX332NbeAmNetHvYIWOo2uaZlHUfRJ5IPaBfvVLw3YHzGUP429Cnbu/2VoLU2NPvQLYNH/1nmsPOMMryveBLZgz/wKolhVX5QfqMT+zRCatwFBSMvWHXdK+jP2PHqVzg+IPfm9Fo//XQ81u7pxRkB8nibDshpRwpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788520651; c=relaxed/simple;
	bh=wJcQXhX2p7ArrlqvtSK6wNpa5H9F05dc8xrHIKvtv2U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ST2cQfTQYyLHuKFhB/zuKtZHDrjAXDhDAcokzB71x/Buq5GylCwHZjkIp6DYqH/p7FvM27iOzqZgHxV05MzDuScFXPu2yoUyXdMap7Wv/O3adNa7NPrKdXV4xtabnpbZAW9cylrj0Yw5dOyxH7Fpu/68b7TIJlN1sPbQs2mo9K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PJ/K5sFM; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PJ/K5sFM"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6b1bcd9e00bso653653eaf.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788520649; x=1789125449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t/aNANTfjkHFW3Qz0CZuwn+uWl1/BO2PZTx/B0W7ELs=;
        b=PJ/K5sFMQ1RBLJT1aLBe33Lmb50L6VZtxoSN6aDTtMvXJxJG0XwvaUQJsxzf4cAXGk
         DaCzWNZr8i7hY8f3tqVW7h6eQtqUgfx9Gy/onoAfDMM8ccdBNPvk3DhUkGTzcQCLF+oG
         G9PreEShQ0CWLGso5jw/cDEkIPBI6ZLHvYBbHjuNH9aCj8y5YW0lE8JT17DFT8dckGtX
         kk3zaa4PVu2qd0PYp4IbvFBRfmd2R9DF9/xoneQPPmcjjLKGMBuRRvZfh1AMsdtzkwny
         G0n/8V0kpD3Zk8TaT5DgvajJzcXWmMAVwQONW9cdS3hvG/SEaFYxLrhC2InaPdIFJT3s
         i2gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788520649; x=1789125449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t/aNANTfjkHFW3Qz0CZuwn+uWl1/BO2PZTx/B0W7ELs=;
        b=NrSByXJXb7IWhYEcvtXyIJjPQ+ycmCrLTW1z6IV1ZeX0i6WlWQGUJvmtdX37aE5LSe
         v3oFa0U7R56qLlmtu1qZqtRTD8T/dg6BmFm2M6oeDzsfUNcgjAVypLS9l+Ow+LChf5KD
         PLthR0x0RpcJsA0NLGNdXC1FYONvehoEIqIUHFgzmeQS43KejUun+c+yuz5+OrWfip60
         Fe+qQ7b2Z/IR3dhyrJbLG4XR/raI15AJfYmY3dU321MDQ9zcdq1QYYwhbmrMP7LWwWGy
         osf7dFykkzvmcYgF8smeIJ4pTFF/6K54uaWDYVtHcfu/6WNig7PA6slS9DzuHZwy2ON+
         uC9w==
X-Gm-Message-State: AFuF++mvBzDWjayvuPUES65FMUDXpDnzzgZKa5eH23AhhFnyJtoHJOZx
	mm4LQC758SQGcbpNqZP2+m6uI/QDiGijXMr9WG5hwnKUwAAeNIoYdghz
X-Gm-Gg: AYBFou138yN8e99ivLZlOVgHwDZcrRBWnSQnXFZUhTscvOR2zY2tP50ixL2rJ/RlMfu
	wvhV6W53DLqeIFf/ZycUnLmqbl8d7IH173j2LxKwfrNN0OAh0W2TsmMB9yUOi6yJE+D12TC6+U+
	D2ChiXnk5lRD39+VO4pfECjphvV05+e5VVWxNEAVN3mPab6p871VjLBm3Rl89ZYOKpi+tA8IRMw
	KSuK1KMXvUgJZiQXLmgUFAA7p7Pp5j/f8EaMmZ3F5EqPW4FglBiaNsq7F5eFOXrgkg7cnMcYRIw
	DQqOKpeuunpEm50GyE7LgbxGfzQ+57VCtFVbgqS5YDmXnQKveqpU0y+B5PXjf27QtXKGHEtRDXu
	Uxtg9O5WM4mhx9LUKHkBLR199ZKmALNsdEsYBQRSIDKOqzUG9dYi1BaPHNmxjLi6Ev8L7g3cmZc
	5hEVsYbtf7c9G1wdSpvq7VG+l7ztm2SkQiVsTteBv1j89h1+YNZtq1c4y0/7BKQqB5rZCi381cb
	tsrJY/4rUCKcvE=
X-Received: by 2002:a4a:e84a:0:b0:6b7:83c5:fdf7 with SMTP id 006d021491bc7-6b783c60350mr1319391eaf.56.1788520648768;
        Fri, 04 Sep 2026 04:17:28 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa33e96sm6297642eec.12.2026.09.04.04.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:17:28 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Dongsheng Yang <dongsheng.yang@linux.dev>,
	Zheng Gu <cengku@gmail.com>,
	Matthew Sakai <msakai@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	dm-devel@lists.linux.dev
Subject: [PATCH] md: fix typos in comments
Date: Fri,  4 Sep 2026 16:47:22 +0530
Message-ID: <20260904111723.30326-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/md/dm-pcache/backing_dev.c | 2 +-
 drivers/md/dm-vdo/block-map.c      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/md/dm-pcache/backing_dev.c b/drivers/md/dm-pcache/backing_dev.c
index 7165fc0364bb..23002beb192a 100644
--- a/drivers/md/dm-pcache/backing_dev.c
+++ b/drivers/md/dm-pcache/backing_dev.c
@@ -68,7 +68,7 @@ void backing_dev_stop(struct dm_pcache *pcache)
 	struct pcache_backing_dev *backing_dev = &pcache->backing_dev;
 
 	/*
-	 * There should not be any new request comming, just wait
+	 * There should not be any new request coming, just wait
 	 * inflight requests done.
 	 */
 	wait_event(backing_dev->inflight_wq,
diff --git a/drivers/md/dm-vdo/block-map.c b/drivers/md/dm-vdo/block-map.c
index 5ffc360540ed..258ad5521f51 100644
--- a/drivers/md/dm-vdo/block-map.c
+++ b/drivers/md/dm-vdo/block-map.c
@@ -240,7 +240,7 @@ static int __must_check allocate_cache_components(struct vdo_page_cache *cache)
  * assert_on_cache_thread() - Assert that a function has been called on the VDO page cache's
  *                            thread.
  * @cache: The page cache.
- * @function_name: The funtion name to report if the assertion fails.
+ * @function_name: The function name to report if the assertion fails.
  */
 static inline void assert_on_cache_thread(struct vdo_page_cache *cache,
 					  const char *function_name)
-- 
2.48.1

