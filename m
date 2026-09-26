Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com [74.125.227.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE4139792A
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 19:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790452742; cv=none; b=YK8nhGr/T0t2RTVQWxJYfy2tHrWzy/y31OD7pTvoCE6tmnIyjblXZawlNwK1bMB1KhLQeWokkHM+bb0Bwc3tuHwpiec9/H+0+pajlV8wuJYRWoE8YDjBh9hCB/x6RBeTp/21j0pd0I6Oj//l3EKLneJF72eebqMeg04MfuWiWv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790452742; c=relaxed/simple;
	bh=8UOZbOPEi4Ge9a21iEwLQt5UuMD2DMDLNGwGB/guOUY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ccNIpliXoZeEi9fzd6RY3veYJycYixUyhtfMs4NiDGB5CKxuA4E8JEovy/334jLboTT8Mz23jWspq0MU07GF9lrlgL6NBMD6JvfafYq2Kz3eYqgkewBKOksavoU9d184TkWvLlFF8PxnUKiuq1bu9bHkYZVh86kq/9GAUpE2uaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IIoMkuvA; arc=none smtp.client-ip=74.125.227.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IIoMkuvA"
Received: by mail-vs2-f41.google.com with SMTP id ada2fe7eead31-79229116537so559768137.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 12:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790452739; x=1791057539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BEHFYKvdtxBCG1FtsLCemOPEWS8unZFjNSw09BPKGlI=;
        b=IIoMkuvAfPgvTTzFjOk5U6NrMBiVqXTUjVDoSi+wn5CWYLS8N4Iy/uVmh7Gfnpt9wu
         qhIgZhO4UzK5L1G0pxuyP2uk3vSgt27n9HlBQPY5rsNjkKjBRU2mBNkQto7GCoAQNkL0
         OePiCO+clFTxZzbOTQJR4ajONGx+nNHlDyLXsIzW7TWkjw0ZmhuAIY/28YJZVrsduvXQ
         samTawWtioauhuh3gUGXp4IUp7jOfvg6bCNQJlflDIU9wDgwzUxygTjkrgT+XzTWmfjD
         raoAEBpxYlkkKIZ6aGXuNsR6oXWlvmgtdpq0kaFPixl8LkvWiZhVBe7Mec1VUe5jw9wj
         MtVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790452739; x=1791057539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BEHFYKvdtxBCG1FtsLCemOPEWS8unZFjNSw09BPKGlI=;
        b=R1ObXdSNL5xLrmzzhCTcmEHlvPmvraXtgCmEJE7FDlqDPWS++C4PCXT+/e+oQFhvQb
         PdASfWldtOC1/D+D+J6gb4U4zjcyQzWQgBmF/d/Kdu0ceHObuNsphW7Ia6CAlP9fEr4b
         9Ckrq6uKqk8Km/BntbxQe/OOnr6yzxJIhAcJu+8CH4ACPA1cmQgBu+a9gU1j1za/xDkI
         BZArpeTeaAnqvbY8tlqgOEQYQ/3kbNREdJ5ylFyEfglRfW6tFfSmz7Ixm6KLlS9JRWxX
         Lf2HcA/GYO8f8AqCU0pspAYX78bXzsemoaGCNXXMHdwKTKujvZfNgxnItoSqEBSKiTR1
         wg8Q==
X-Forwarded-Encrypted: i=1; AKwUvBydDsl6p+py7Gu8fy7orestAICIFSdSlvpU0QixWqqrP05wjjBPKsn6iVgD3YQXVt7RkK090POh4wxTgCk=@vger.kernel.org
X-Gm-Message-State: AFuF++nBC4zrqyLW1EoXcQ/Sgq6AMBt4SmVTOP9P/XvbXKqtEru9KaSM
	GyWkuisU+II7u9C1nFbqez+Gz0E2ggJ4+TAqxqEU4GrusQM4kKv7QXOy
X-Gm-Gg: AYBFou33Fi8dHN0OQZ+PoiD/JRcr/Yf4094Qxk2Ax/AHdm3RLshnP5tbw9vy1OCgPSl
	mL1jPwEUIlezJ2Ngzw2/DTRpfzAjiBZTutqn7879e92BD/EWdaykol5Oab67p67T4oi2aA2/bNQ
	7qKsUNPyNGXVRhiIcGBEGf2iHV59luHPp8JLAnuV8xRNDVwq89lrihim8+YM6ABi5VfBcD9FUOo
	G0BSOySsrYhDlnzJOo7u0ReC8FtT1ve9oaN+RYaDqfFI8bSGGgmKYhb1/A/i/DBkJx9J3DXHMrz
	wIinJdUQ4zi2ItTkfv9xhL6JgWGgbmxRrY/aPsAO+Vobayqpd+qF0pWEO0ja2mRG0KiYtoojREf
	vgp69Iihl/cefffRx+b7tWLIZdSxNBj2qiTWJ/e8rpTRjKQGZkM5zRf0lI6+Q8q+Nas6ijchiyz
	Va6qUKmeMxVUexKONSb/FUiTwj2bkxnzfSt6Qcz55TEDlQObwZNFLRBRHLFW9ZEwVw
X-Received: by 2002:a05:6102:41a9:b0:7a8:3fba:361a with SMTP id ada2fe7eead31-7af1f3f6a52mr3135256137.37.1790452739061;
        Sat, 26 Sep 2026 12:58:59 -0700 (PDT)
Received: from beelink.. ([187.13.30.172])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9861afedba5sm7437742241.8.2026.09.26.12.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 12:58:58 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org
Cc: johan@kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>,
	"sashiko . dev" <sashiko-bot@kernel.org>
Subject: [PATCH v4 1/2] debugfs: fix use-after-free in debugfs_read_file_str()
Date: Sat, 26 Sep 2026 16:58:43 -0300
Message-ID: <20260926195844.1296333-2-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260926195844.1296333-1-qwe.aldo@gmail.com>
References: <DLPDB44JJRGJ.3K6JNS746M71C@kernel.org>
 <20260926195844.1296333-1-qwe.aldo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

debugfs_write_file_str() publishes a new string pointer via
rcu_assign_pointer(), waits for a grace period with synchronize_rcu(),
then frees the old string.

debugfs_read_file_str() dereferences file->private_data without holding
an RCU read-side critical section: it loads the pointer, calls strlen()
on it, and then copies the string.  If a concurrent writer completes
synchronize_rcu() and kfree()s the old string between the load and the
use, the reader accesses freed memory.

Fix by measuring the string length under rcu_read_lock(), allocating
with GFP_KERNEL outside the critical section, and then copying with
strscpy() under a second rcu_read_lock().  If the current string no
longer fits the allocated buffer, retry with a PAGE_SIZE allocation
which is the upper bound enforced by the write path.

Cc: stable@vger.kernel.org
Assisted-by: sashiko.dev <sashiko-bot@kernel.org>
Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
---
 fs/debugfs/file.c | 39 +++++++++++++++++++++++++--------------
 1 file changed, 25 insertions(+), 14 deletions(-)

diff --git a/fs/debugfs/file.c b/fs/debugfs/file.c
index 08de6652a..f9a1f7739 100644
--- a/fs/debugfs/file.c
+++ b/fs/debugfs/file.c
@@ -1018,7 +1018,7 @@ ssize_t debugfs_read_file_str(struct file *file, char __user *user_buf,
 			      size_t count, loff_t *ppos)
 {
 	struct dentry *dentry = F_DENTRY(file);
-	char *str, *copy = NULL;
+	char *str, *copy;
 	int copy_len, len;
 	ssize_t ret;
 
@@ -1026,26 +1026,37 @@ ssize_t debugfs_read_file_str(struct file *file, char __user *user_buf,
 	if (unlikely(ret))
 		return ret;
 
-	str = *(char **)file->private_data;
-	len = strlen(str) + 1;
-	copy = kmalloc(len, GFP_KERNEL);
-	if (!copy) {
-		debugfs_file_put(dentry);
-		return -ENOMEM;
-	}
+	len = 0;
+	for (;;) {
+		rcu_read_lock();
+		str = rcu_dereference(*(char __rcu **)file->private_data);
+		len = max_t(int, strlen(str) + 1, len);
+		rcu_read_unlock();
+
+		copy = kmalloc(len, GFP_KERNEL);
+		if (!copy) {
+			debugfs_file_put(dentry);
+			return -ENOMEM;
+		}
+
+		rcu_read_lock();
+		str = rcu_dereference(*(char __rcu **)file->private_data);
+		copy_len = strscpy(copy, str, len);
+		rcu_read_unlock();
+
+		if (copy_len >= 0)
+			break;
 
-	copy_len = strscpy(copy, str, len);
-	debugfs_file_put(dentry);
-	if (copy_len < 0) {
 		kfree(copy);
-		return copy_len;
+		len = PAGE_SIZE;
 	}
 
-	copy[copy_len] = '\n';
+	debugfs_file_put(dentry);
 
+	copy[copy_len] = '\n';
+	len = copy_len + 1;
 	ret = simple_read_from_buffer(user_buf, count, ppos, copy, len);
 	kfree(copy);
-
 	return ret;
 }
 
-- 
2.43.0

