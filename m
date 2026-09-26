Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3154339E18F
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 19:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790452745; cv=none; b=rTPgZF/xM3gxObbTvQHzoefsCV9S7NQRFwl77xVhgjCJKdx3sZcpFVACDV21n4ZMtONrWgbH2TG0k1Q0G4qxeax6ZLZUY4exnvUEooGpfxdcLuLPGBEzUuEBjeQX7kyruYcV4Gp4ga90ERiBUzqKAxgTXi3dxWjAmYb7TgkvBjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790452745; c=relaxed/simple;
	bh=pJiK7ZtLoIcftmOoWyXhNhrwyq68Wzdhbk2Nfje+Cic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vm2XDuGdlRRPHBFXQAGtQ9StLJ804d9O0Mg2dq+ELCY9UcHu3+52ZIf33153Eyi93uyohQm1GEdnTS1qWB8dtzcHEDoWFrcQE46rlBVpgRRNjmQw41jhcK+srrc7rsUoHNnDV/ytd/XxJlHcem7azC/zlyzMjOxHMs4JwBrMTcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kYM/QwKe; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kYM/QwKe"
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c72bfe9so484815241.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 12:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790452743; x=1791057543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Ww3AExQEh492MzEx3J90ZjmI7uAFZp+mMSUVOyh4tk=;
        b=kYM/QwKeKThz00qYYdTpabmRa5qepywzZOwN5cOY1PIS/9xwp9f3Vd6u07fHdHJd7Z
         eGpwNL94cn0eI2bFflEyubSRo7vtekQgUC+6E9z5hhidqYyWsb7aXL6ff6UNUfv4kWK0
         OemjoCk+WeoDthVjGfUAsALTH7qBsuHiXwdCKqYWOG4kDsbYD3dbQ3XE1qxdoLpr7REZ
         O+6j9/wQ1k0AY44MXS0mQ/aEuSZ0NlB5M7zHMloEGfMWJFUyU7lmD5TMwvnXlbZfKguY
         EfpzuH2DCny60H89YpgRovVZ8sSMlOtJzW6KS+Q+KsGKk4FBfBTOIptzu5f60mRXfkt+
         AA8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790452743; x=1791057543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Ww3AExQEh492MzEx3J90ZjmI7uAFZp+mMSUVOyh4tk=;
        b=j0q2JOIid6hKTWLqSdxxyCyo/Z9DQJaID+HlR0Jy6ZWcGuFFymnUCIkou0XDJL4nGm
         yMDeFSaKavcT4PNVuHwoEKEa/4pJ/gcSo4lxTEqD3k1ncw+Kk7up0cYgmXvclPQQkPt3
         dtrE6Ttpv62XoljzUfupQUs8gPdYhLxydo6VG4eSJcXL1KWshKdvuFBmOyRY+munFId5
         mz+hx0/mFnrvDXfhV8efCGPyJ7ZdkHbBMQUk7b/ZQSxTHzIG9YJoxln7dRCS3w7sR+4c
         evqVBojUSnIG9T2l6NZxsDah1CFYn/4db5dYdhZ/RK9jeLNnSSXuzZuLp997sp+l9Fqc
         zMbA==
X-Forwarded-Encrypted: i=1; AKwUvBxQd/oR6+IiqpW64j97SpfnfVAcxk9i2jmjHVEhdJEh8B5jOHXXPbOj0h0Yg7Nm/DcJUovnRW4fGCJYKdQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nd8Kw1iwo8mnCUmtLKO8F3C4W1AJ5hDef7+9GUxJg6FvtS3mN+
	XwkRUXsGJUtDkKO9DhjZDarvhEPQz/8LlNOQpsNjd2p9U2zyu3WDKWb9
X-Gm-Gg: AYBFou04kHzMKZwqQFxkC8YRYMHOrdyF40c0nU/Z44QeGubzU6kK1HDFthG+7ARTwF8
	JHy/8ijRt8kjhOCLhryS3GEAfnXOrn8+NKAhZ9C3RJsqrGhMWBNpUragL1rcSe5cAb9/nKAMR4Q
	iyKTS47CUHncr4EDWfCu6HqT9aYrKP3vwjmP0zQsMmpS+wxviqPKFnBFJTtdLSKp/20ajkGOuMH
	NWreZlFPpIRKSaPqXd0o9v8TEpWX09A2Hg4JIQQCNGqljJNMUUYwDflfDU+KEbucx+hVMT59eDj
	iacuwKrBRyqQXJ0Mz4oXZ0VwTjv1UUxYCR+1ZHQeZMtL4BlL4Z8kB4Cb9MwPKQd/oqaaDMF2uT3
	gKe+FqjyUQogle1fxiYFsHO+AgJugq/pyTVFvooHknM6n7IjNyRq066SlwKw6sXD3tayhmgPt3Z
	f7aUEQrGvwZ7p9yDQbQukXTf+QxzWzjR8geYeldE5yQGQZw8sg+GalrQ7FGV/bjH8=
X-Received: by 2002:a05:6102:8098:b0:7a7:1db6:c769 with SMTP id ada2fe7eead31-7b1c751f1e3mr1477646137.22.1790452743026;
        Sat, 26 Sep 2026 12:59:03 -0700 (PDT)
Received: from beelink.. ([187.13.30.172])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9861afedba5sm7437742241.8.2026.09.26.12.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 12:59:02 -0700 (PDT)
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
Subject: [PATCH v4 2/2] debugfs: serialize concurrent writers in debugfs_write_file_str()
Date: Sat, 26 Sep 2026 16:58:44 -0300
Message-ID: <20260926195844.1296333-3-qwe.aldo@gmail.com>
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

debugfs_write_file_str() reads the current string pointer into `old`,
builds a replacement, publishes it with rcu_assign_pointer(), then frees
`old` after synchronize_rcu().  There is no mutual exclusion between
concurrent writers through the same inode: two simultaneous calls can
both load the same `old` pointer before either publishes a replacement,
and when both later call kfree(old), the result is a double-free.

Serialize writers with inode_lock().  Use rcu_dereference_protected() to
load `old` under the held lock, satisfying lockdep annotation.  Release
the lock before synchronize_rcu() + kfree() so RCU readers are not
stalled during the grace period.

Tested on QEMU/KVM (7.3.0-rc4 + KASAN).  A reproducer that spawns
concurrent write() calls on a debugfs string file triggers the
double-free reliably (~3900 KASAN reports in a single run):

  BUG: KASAN: double-free in debugfs_write_file_str+0x194/0x200
  Free of addr ffff888104542ec0 by task poc/305

  Call Trace:
   kasan_report_invalid_free+0xb8/0xe0
   check_slab_allocation+0xd9/0x100
   kfree+0x163/0x510
   debugfs_write_file_str+0x194/0x200
   vfs_write+0x1ed/0x920
   ksys_write+0xe5/0x1a0

  Allocated by task 307:
   __kmalloc_noprof+0x264/0x680
   debugfs_write_file_str+0x106/0x200

  Freed by task 306:
   kfree+0x2e5/0x510
   debugfs_write_file_str+0x194/0x200

Cc: stable@vger.kernel.org
Assisted-by: sashiko.dev <sashiko-bot@kernel.org>
Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
---
 fs/debugfs/file.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/fs/debugfs/file.c b/fs/debugfs/file.c
index f9a1f7739..7a9d33772 100644
--- a/fs/debugfs/file.c
+++ b/fs/debugfs/file.c
@@ -1072,40 +1072,44 @@ static ssize_t debugfs_write_file_str(struct file *file, const char __user *user
 	if (unlikely(r))
 		return r;
 
-	old = *(char **)file->private_data;
+	inode_lock(file_inode(file));
+	old = rcu_dereference_protected(*(char __rcu **)file->private_data,
+					lockdep_is_held(&file_inode(file)->i_rwsem));
 
 	/* only allow strict concatenation */
 	r = -EINVAL;
 	if (pos && pos != strlen(old))
-		goto error;
+		goto unlock;
 
 	r = -E2BIG;
 	if (pos + count + 1 > PAGE_SIZE)
-		goto error;
+		goto unlock;
 
 	r = -ENOMEM;
 	new = kmalloc(pos + count + 1, GFP_KERNEL);
 	if (!new)
-		goto error;
+		goto unlock;
 
 	if (pos)
 		memcpy(new, old, pos);
 
 	r = -EFAULT;
 	if (copy_from_user(new + pos, user_buf, count))
-		goto error;
+		goto unlock;
 
 	new[pos + count] = '\0';
 	strim(new);
 
 	rcu_assign_pointer(*(char __rcu **)file->private_data, new);
+	inode_unlock(file_inode(file));
 	synchronize_rcu();
 	kfree(old);
 
 	debugfs_file_put(dentry);
 	return count;
 
-error:
+unlock:
+	inode_unlock(file_inode(file));
 	kfree(new);
 	debugfs_file_put(dentry);
 	return r;
-- 
2.43.0

