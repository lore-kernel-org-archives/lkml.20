Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345703C3C15
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 17:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790359123; cv=none; b=NwjHzepD3A/MBANByDAJIxbV0+VVpNdzBqSzawNChkySRwOnKtPERZc9q0t3gx6T7kMfmyoch5jWHIiwy/96ZrLMyFbPyvQMy6Dpgh8h+8FjOBUCPprrPcNo4TJu0J1yhJ7VxAWe5oegKJ95mxe/jTl4Ug1nwNQp58Qe4Z7rIHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790359123; c=relaxed/simple;
	bh=tqYkFdlB+Gf3zGxRIPlgH5brUkSD/ZzDRxUCCGmPAVg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cGuoDr9AR3km4CTj+4WkaQH847r0twl3LPdHcWb+5yqV6KSwN2n2b606koHjKerWpPlhvb6unzua6YxsFSqL0uycAP2RCIqGkIsvFoPFX9zUBRLVailJ119Qe65zW36zRUQlQhxRXojdwQ/u5sKYn7ZgkKKjQfYYK3iU1cYA5Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nYrmmgdp; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nYrmmgdp"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-3411e0ace58so1354226eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790359119; x=1790963919; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gZCZSkaZCcGJ3FNhL9nh22Z+U7H+uDG8KzVr1CK3Xzs=;
        b=nYrmmgdpYPSUIqlLE4zmUTUU2WOLa3TsdsHJYdsLQzCSBTK0AEdGuaLU3Zu48tpAQ1
         mB8koK0jSaUzkExe2Q8U3xsxCUdALJHLVGiKW3NMBVjcH7aN5XnSV9uJQKykT6MN6gw0
         yWtdzVIXZ1XiqFC8qD/7f1BDLLxcFPdaUnTPhsgTbtzASG5MzdHW2ahy8ueOhKjJllY1
         9mZ3NjRZPc3TBNx97sNCWs4VUpUKEf1h/IxTmKjzZRDqIrLBoMcF/moYnNjZpC9WYG3v
         Pvs5sImtMMhlFJF63bJ5vO243FI+sdQk9yoHmx/3QOCDrKoe8uwMVQXBrdgaS2OB7YGg
         A4Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790359119; x=1790963919;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gZCZSkaZCcGJ3FNhL9nh22Z+U7H+uDG8KzVr1CK3Xzs=;
        b=jlWjlOGiQBcGvmXLv3x8AaBGCxY+YE2rbOkFct6Ahr5OuPdQcp3coypeSFavz6b5/f
         l4cKqxNPOLyxFCy7f3VKmlhubLE8021tj937/iQvu0yqUWKo6wODabv+LVBQ8oVjy5ZX
         FUuHEHn7J7mbeqp1eMUsh5shhj68U6fR1CfRQINT0mxKqzs3ySkgitZBpnejpOAD1/pS
         pJvZUpLwkJSWIBB0D6wNwebgaZXUbl0n9OGCnkqi766ID2jNjPlhI/RbiIsV6dcsPCqw
         TExQNj013VJyfOhsKCleGvE+oPTWQPXaai2kkDTUGucPt3KCBqsVdwZ10bIOZEE46dC5
         Gsxg==
X-Forwarded-Encrypted: i=1; AKwUvBwjOeqvPu6/DY9wPol6Jhk7/rcQGf4JXWLPVZSxtRdeKwLVmgU3Oob/J+LsS+wIFQnhS/+/6pRHR9lI8MU=@vger.kernel.org
X-Gm-Message-State: AFuF++mBvNLsE/1F8cGjVK1jfpgVlI9doKQ/Eu7/7Wo+PBKnQv5LESHX
	iMlARJQdeBq1Y9vomukT1NFZxdvcKr74eulKVuAnIq21cpp8P/meJ6G6
X-Gm-Gg: AYBFou0iPywH2FDYz9yKtWLxsdc21o4FkZ2g+Tmo1VbX7Wt2v+baE3Lgp1FmOHlX3UG
	aM+92hAcp+ZjQdBKF77Iw+9IUQa3pe5RNQkTVfzLzX0lz/E+tF4Cm0MGOoED4zQ+TNx4G4FmULG
	KN8jdeqO9swnENXQg21OZwdlv9SJB4oAlD/P3Trym3F4gdjGdWWnlORnSZi8CroN8WdbGvgcyWI
	UyEbarHL2L6KaJEB515Ki6CEmnH6AuE45cgMBFYGop9zRR9dehdseqepb8LR5FKHKQn5K/o9NBG
	rE1EueVWJihWtVuB2YXoyB1kh87piXzE4Qt+AhAs0BIiSyi9pXWXg00s9lUktya882k1okeI+kI
	rLfG3u2qr+a/FlM3rax7hVyQI/Y6nIaFKwDZtCefuiNupoBhVxn3NHY8UMM+YeG9p3MlNk+2mwE
	BJBsqEpLZN98k97h5ev3kgcWNVY2m/0p/TVW3NO+Mjoc5jV7lX4S+eVDFEopP+wzc=
X-Received: by 2002:a05:7301:5804:b0:33b:e3c8:a757 with SMTP id 5a478bee46e88-342705b865cmr1251812eec.1.1790359118916;
        Fri, 25 Sep 2026 10:58:38 -0700 (PDT)
Received: from beelink.. ([187.13.30.172])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144172d8asm7651125eec.5.2026.09.25.10.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 10:58:38 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Subject: [PATCH] debugfs: fix UAF and double-free in debugfs_str read/write
Date: Fri, 25 Sep 2026 14:58:27 -0300
Message-ID: <20260925175831.3701812-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

debugfs_write_file_str() stores the new string via rcu_assign_pointer()
and frees the old one after synchronize_rcu().  However,
debugfs_read_file_str() dereferences file->private_data without holding
an RCU read-side critical section, so synchronize_rcu() in a concurrent
writer can return—and kfree() the old pointer—before the reader finishes
using it (use-after-free).

Additionally, two concurrent writers both read the same `old` pointer
before either calls rcu_assign_pointer().  When both subsequently call
kfree(old) a double-free results.

Fix both issues:

 - Read path: wrap the pointer dereference and string copy inside
   rcu_read_lock()/rcu_read_unlock(), using rcu_dereference() and
   GFP_ATOMIC to keep the allocation within the critical section.

 - Write path: serialize concurrent writers with inode_lock(), and use
   rcu_dereference_protected() to read `old` under the held lock.  The
   lock is released before synchronize_rcu()+kfree() so readers are not
   blocked during the grace period.

Cc: stable@vger.kernel.org
Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
---
 fs/debugfs/file.c | 50 ++++++++++++++++++++++++++--------------------
 1 file changed, 28 insertions(+), 22 deletions(-)

--- a/fs/debugfs/file.c
+++ b/fs/debugfs/file.c
@@ -1018,34 +1018,32 @@
 			      size_t count, loff_t *ppos)
 {
 	struct dentry *dentry = F_DENTRY(file);
-	char *str, *copy = NULL;
-	int copy_len, len;
+	char *str, *copy;
+	int len;
 	ssize_t ret;
 
 	ret = debugfs_file_get(dentry);
 	if (unlikely(ret))
 		return ret;
 
-	str = *(char **)file->private_data;
+	/*
+	 * Pair with rcu_assign_pointer() in debugfs_write_file_str().
+	 * Without this critical section, synchronize_rcu() in a concurrent
+	 * writer can complete and free the string before we finish reading it.
+	 */
+	rcu_read_lock();
+	str = rcu_dereference(*(char __rcu **)file->private_data);
 	len = strlen(str) + 1;
-	copy = kmalloc(len, GFP_KERNEL);
-	if (!copy) {
-		debugfs_file_put(dentry);
-		return -ENOMEM;
-	}
+	copy = kmemdup(str, len, GFP_ATOMIC);
+	rcu_read_unlock();
 
-	copy_len = strscpy(copy, str, len);
 	debugfs_file_put(dentry);
-	if (copy_len < 0) {
-		kfree(copy);
-		return copy_len;
-	}
-
-	copy[copy_len] = '\n';
+	if (!copy)
+		return -ENOMEM;
 
+	copy[len - 1] = '\n';
 	ret = simple_read_from_buffer(user_buf, count, ppos, copy, len);
 	kfree(copy);
-
 	return ret;
 }
 
@@ -1061,40 +1059,48 @@
 	if (unlikely(r))
 		return r;
 
-	old = *(char **)file->private_data;
+	/*
+	 * Serialize concurrent writers: without this lock two simultaneous
+	 * calls can both read the same 'old' pointer and double-free it.
+	 */
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
