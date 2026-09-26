Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com [74.125.227.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506AF426419
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 14:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790431777; cv=none; b=IMLX4iSdwTxkmarmeb9KxsMfF5aV2+xBlm9vfz4pNe+sj9dx/iwYe8v6K3r8iayXHA1lR3RpKNCqGWJtauBn6v3g9rec0VyLg1uxEH47inkPM6cU/3lDHLld1Ol1Fq2OP2RG5B/cx72vmaJAZ66NUnYyYbztH1CFxHAFac2z+c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790431777; c=relaxed/simple;
	bh=7dEQXdIsFiQaQViJWe/ksKmwTQFYfQ/wRhMfnWYWOXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MIo8wet0L6z6elmitH8Xuf40DRSK3QphrJyqNdddxzXDQ9sW3zH7jkwz3yxFXAQswbTLK02xp8+9ZfaZjMW+veujScH8RJPfg/Incl7QbECewnvGsJBBOOq2gfN8pDd/eGJ+QkoY0oyxMjAd9N2BIMDLlbx4Bj+iR3V3GE9ye7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dEQGabm/; arc=none smtp.client-ip=74.125.227.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dEQGabm/"
Received: by mail-vs2-f41.google.com with SMTP id ada2fe7eead31-79229116537so523190137.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 07:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790431769; x=1791036569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1X8eNJVAyhVOanlShxEr6z4UEdYhV6pC0beFMBsEd6c=;
        b=dEQGabm/7V1S87e+IjHwwI4KaK7xn9i0reIzM71PgzmcSx0YIp5Y05VJfw9h1xFU7n
         cazylu5YyTidET+cT8sQdFYtl/soipbOUgjbumZ8oUn9+doPu3CwgUFbi5Pan+vcvOSY
         K8OtSIN9ozfW/M4y9qlz5nDhG2UhPg7bUG7IsDzi2TTA+IvY7nzihrse1hLA3Njtqa/f
         xHbxfj5ie9735j5xZZgOnkmBW6CGsAiSnVsqDFJwHrK3qX57oUZ1aESxAc4OFJjBhb2y
         M9uK6nwhPbnZZaX2nqKwfTTBOFJJwOiNpk4y5egT2LRWFdbF5Kvhp+DE+1POCCuEzP0Q
         eG8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790431769; x=1791036569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1X8eNJVAyhVOanlShxEr6z4UEdYhV6pC0beFMBsEd6c=;
        b=vUNiTqavNtduGID29PYDVtci+meevHDAA5dO5lrMPEO9C/SLeN/l+jZkUhSn0EAQtS
         w5vo+o9lifIKcR1Ys7JNUcAiZoi5Et0bu8eGLQ2nEz7UuM8v0rUkCqZuvb4HjSd60rAT
         RxE3MS1ePDBJIrFhAp1EnJtoTicsehXAZkOIk21Xcexqj1UVYXb/U4i/0YCepatStCcB
         JdzAJg0YYNxIU5CW+VEVtAHNlosTl6lOsoqBvLQ9s4rYtweuEoNeelc8fspLURrk69nF
         oOiicy8FTtUdV6d9R+0SRkFPA7ayiAAoH21eEqva9dfvgEzmtt7qlIo4nJf6T1RYzgkk
         C/eg==
X-Forwarded-Encrypted: i=1; AKwUvBwE+5BeEGDq8N35hGqk5LrcPGFrwY5jbao2GdmTF5Tsvry9WA+Zx77/UlX+0K23xSF29vp3kOL+fjFTe0w=@vger.kernel.org
X-Gm-Message-State: AFuF++mrxn8ase2TMI26XxAPwKSVap/y7Kt0hUvkuaN2n/fqc96zmc7L
	9YuS0bPixjr4RNN15YlMObt8OjHf/bCiaFFE5+vBhDJzAbai0ijfkfF2
X-Gm-Gg: AYBFou3K24xHkhdyM8RoujVQ1TlJxSCO/QhXAI9NiLKQXMHsPKbPriSchAdj3BLL7SK
	uC8sceE/Dlm0Ertiep5eevwFrkW20wOxLGxrCo4tYTchBXK3MmBTLLSXWLXX5Ut6IHHREoC6OuP
	M/xW5gJXHbjycM4ruG6sQVhTtvPbbi/lem1hQSNP+X++SpSOusQCSHPeach61uM9O/1mrBYNXQb
	UHB/Gm6+JjyUStl3lxNyaABzvXpPKRJcX8Ym1vei/L30HbMx7p4ufBWZnndGKufgvPHCHHRXoWw
	rqkiVpLL+bXZt24oH+8PnxoPKXaRlWtQPHxBoZFxt2FN+CfuZBW5TjIbbSV1WYEIcRjysqxXMw0
	aaPM6PAdYuPfIic03yiRP9e4s20JbZLfvMhQytGO6LOebhDlUMzySBwzVuvApiO/3l1qWtmw0er
	TG5NUoPrx2wsr/krhG7zQUE1/GHAaIM3OwkcsnkWGDDQBJmTnxTGCXN2vKweua4qM=
X-Received: by 2002:a05:6102:32d2:b0:7a5:4d80:a913 with SMTP id ada2fe7eead31-7af1c58fa50mr3194324137.7.1790431769438;
        Sat, 26 Sep 2026 07:09:29 -0700 (PDT)
Received: from beelink.. ([187.13.30.172])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7b398ee8b75sm2432674137.2.2026.09.26.07.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 07:09:29 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>,
	"sashiko . dev" <sashiko-bot@kernel.org>
Subject: [PATCH v3 1/2] debugfs: fix use-after-free in debugfs_read_file_str()
Date: Sat, 26 Sep 2026 11:09:18 -0300
Message-ID: <20260926140918.1077347-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026092647-ebony-unlatch-d3d0@gregkh>
References: <2026092647-ebony-unlatch-d3d0@gregkh>
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

Fix by wrapping the pointer dereference and copy inside
rcu_read_lock()/rcu_read_unlock(), using rcu_dereference() to annotate
the load.  Switch to kmemdup() with GFP_ATOMIC so the allocation stays
within the RCU critical section.

Tested on QEMU/KVM (7.3.0-rc4 + KASAN).  While KASAN did not
independently confirm this particular race window (it is a very narrow
reader-side window), the companion double-free in the write path
confirms that the RCU synchronization in this file is incomplete (see
the following patch).

Cc: stable@vger.kernel.org
Assisted-by: sashiko.dev <sashiko-bot@kernel.org>
Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
---
 fs/debugfs/file.c | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/fs/debugfs/file.c b/fs/debugfs/file.c
index 08de6652a..ac4199e9f 100644
--- a/fs/debugfs/file.c
+++ b/fs/debugfs/file.c
@@ -1018,34 +1018,27 @@ ssize_t debugfs_read_file_str(struct file *file, char __user *user_buf,
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
 
-- 
2.43.0

