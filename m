Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com [74.125.229.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECC0318BA8
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 13:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790430495; cv=none; b=rH6s3rgEkjyqOVL2yFXZSlBLqANoHEvPls2rOQwUKfgbqzk9ZpuYk0xknLtbL+/7s9pvRBacvkqGeKdmQ9xfc38D7zEqqKLdrDv7Gnui+P2ybFhnQ2aqxGSJ2NNyJf52BCpA5JWKVuLVYjYo6tOlRUSBElMlThhlYBTU712+r98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790430495; c=relaxed/simple;
	bh=1xYbUdXV7FvMye4KYEHySxDka/b394+z600N3+jHXQg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XWjk636l5qDqldE1DTQ7GZUYa8umXZ2+eQ4BLGDHXRAsW7RmRa1mQr6CVkeXN2yClUnYYYw4DcCk9i09wvbx1mfXmmI8PzV/+s7W5JOBkUYQmgZxS9warXXpSVa9fqeforsfqbsF7i2RuG7wkmJbLNfjgCJw3WKwxzOgjBZZN8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WFuS0aPO; arc=none smtp.client-ip=74.125.229.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WFuS0aPO"
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-1460bcc512eso823496c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 06:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790430493; x=1791035293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/CjzGFPtBoeNrX1CeVRPuIgYs0oHZqoIr7E47CqmV3c=;
        b=WFuS0aPO/WgGOzLSMb0+RzJhKToYvCw1mcuE5O4raBGfbQKEhDx56NlZvGnLohhYBk
         wV8YaUEwqnaPCHEuTYSC4R7Y5MtKu15KtKRYpki9jh4OLj6cYTEG7ZvQ2ilCbFyt3FJY
         GVzWw7ijlgrkY6Bv/ozD6FO4lfzi81SgfdapXp4qnAqsdLOq0NLxIVq6/IUHn3mE2X62
         qq/5uNaYJlj6LUNtM1gu1VX+ytBAwJupQvO/W5CUvh58o5iwFs5x0aG4ZV/UdTKFi7CK
         /xPq4Rb/mCBi7ujgosPWT29OdKymTzrUTgxezTS8TQI+5Weo/4Yo5eAvUuIC0VElmcnx
         /kxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790430493; x=1791035293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/CjzGFPtBoeNrX1CeVRPuIgYs0oHZqoIr7E47CqmV3c=;
        b=ouWX786NJDVuZNHquiUp6cygoaOfn8LOGQwesOsaHDuHY4qag8Zz+eLdfKoKOhE33u
         N0QLnkWAP9vqP9i4h7IZISqTV1glcuU2aE461sOCknAkVmKSD1iIBnXuq6UBNtXjJm1b
         lv2gI/M8Z5EyLpscmV+EiwaWgbxMPlrRQbMiDfKzlIx68trfLCzekfXsSmB2ImtJtcev
         WNL9JnsfOZqc54TQzOvXhGG0c3c6KIwWw7kbjcbgdImvae79iFk5/eh7oAOXOKNEU9q7
         nTLy/94wSI4s+U2ikEyVq/QCdBs3Z7IbsqnD80tDdpBGCrNSnXL/KRoQCiOZg/KSSB/+
         0f4Q==
X-Forwarded-Encrypted: i=1; AKwUvBwz66mrNrUdn6WLCeEKrzOndnxYwQrqLrdIcqD12Y0ffioRKryjCJ6gy9lsRde5WbqtwZhpRRawwSipIJM=@vger.kernel.org
X-Gm-Message-State: AFuF++mLgeObYjT0VkX5Yp2Uv2wOxMtMw/TYHMz4pensavPetsHCujDK
	6t4X8LZDyUGIkkzIwu5nP0Tw0BvLZsIrgLrwmULNAatz2deHaCWrLu/6
X-Gm-Gg: AYBFou2wgFNiPcOT8y+GpkV44Q8y5MmIZV30dAnhU3rgJLhJBohR75V+RLuBDmSZXM9
	snSK3dQUftbZjYC11sZJ5v/tl3tP4zIYbrwR1jowi2vTo/118dpKTL8NF3djBH8QA6rxQTmBEU2
	NCUZ9vEoaaAySFBw1VbnwlJoV03PqgNCTez/UUrIFV/lTh7C8WbhuMweLm2PML9D4wDX4Ztab4K
	g4/rzuAipWAHG5xzyTDGEj7cTN0lhNX4Se+cWxoMI6s85KfO+vkemxSP/aXb5DwE/tVrN8Qbp8H
	CU+ixVFUOMmeSxbO1P+iuR+tGygEdoNFhVJ/6PdNjZPgKvSuFggAQ0yl5oUW+E+ecwbrGE+CsVS
	b53ljiT/e8ZiTw2R0Ly0ig8A/F6yRzJsz1zyVKTzji9B26AdEnCqKpfh2gFcs/3VhE2F5p92aod
	tOb0fI8LOHgRISBU1HiiRBj7f17Eiki6qupUBlUdfC9tjwp1spDUQspNCeJTH2oVI=
X-Received: by 2002:a05:701b:220a:b0:13d:a49:8016 with SMTP id a92af1059eb24-146cfcd815fmr4165897c88.22.1790430492565;
        Sat, 26 Sep 2026 06:48:12 -0700 (PDT)
Received: from beelink.. ([187.13.30.172])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145acd3d8eesm12124325c88.8.2026.09.26.06.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 06:48:12 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>,
	"sashiko . dev" <sashiko-bot@kernel.org>
Subject: [PATCH v2 1/2] debugfs: fix use-after-free in debugfs_read_file_str()
Date: Sat, 26 Sep 2026 10:47:38 -0300
Message-ID: <20260926134738.1063158-1-qwe.aldo@gmail.com>
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
patch 2/2).

Cc: stable@vger.kernel.org
Assisted-by: sashiko.dev <sashiko-bot@kernel.org>
Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
---
 fs/debugfs/file.c | 28 +++++++++++-----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/fs/debugfs/file.c b/fs/debugfs/file.c
index 1b3ace467777..a4b7a5cb5e01 100644
--- a/fs/debugfs/file.c
+++ b/fs/debugfs/file.c
@@ -1019,30 +1019,24 @@ ssize_t debugfs_read_file_str(struct file *file, char __user *user_buf,
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
-
-	copy_len = strscpy(copy, str, len);
-	debugfs_file_put(dentry);
-	if (copy_len < 0) {
-		kfree(copy);
-		return copy_len;
-	}
+	copy = kmemdup(str, len, GFP_ATOMIC);
+	rcu_read_unlock();

-	copy[copy_len] = '\n';
+	debugfs_file_put(dentry);
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
