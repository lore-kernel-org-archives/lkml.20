Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC2615665C;
	Wed, 14 Oct 2026 09:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791971602; cv=none; b=CC43tOroXYqCSPmLLq5wa+PewgAFC6X01yO/shOyIrCLWsConJHytDwPGfzbfZ0pIQiJTOJrFY9SVczuCMCWpxPy15MJDmSAHya2/s3wokA5Llf9mFIyU2DVLHq1i5xEpIwS3SAQhT5jGoSt6TtSK4z6R/npbSW4eR1hGllA3hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791971602; c=relaxed/simple;
	bh=ulf5xv3gZRkzQ2p4iCZVnIb4iKNqtbR/JTlO3KsKFxU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p61BhZzv9CbvgnBY/z6Z3ruz7j09sEqvvTOrC838lK+vxU1h5xFapoSmkeMI+OnJUC45RRO6MNkTMNFQ0HIQz0DyhdfM71ITZgmrHsxAvQ/7ltOKFHYSaXYXaCFH7cRmXfOhzDPMx2WezEV3QdOv0p2uihk2LuC2CkOsQVcQlRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=P5nRMCTi; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="P5nRMCTi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=hO
	qqSU4bOLhFj0Ntu32+7viLCVetkiFnaPi1n9kTbzU=; b=P5nRMCTiZnum/Doead
	++0vZl7Y6ejCyKz5hO408VmLoZwO076GqK5QL0N3O8062rn6mfVdw3R/7LTQrBzg
	kRCB+dixqzp4ULHXH9wlSYLdQiRN982J/49oJ+R37UaWSRG9/Bd+yFNnzX8uf4+Y
	Lx01p4XhedeqkXEEw4EQ47GbI=
Received: from localhost (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgDXX9foUM9qdnafEA--.29710S2;
	Wed, 14 Oct 2026 17:52:41 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: elver@google.com,
	dvyukov@google.com
Cc: kasan-dev@googlegroups.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 2/4] kcsan: add debugfs target control
Date: Wed, 14 Oct 2026 18:52:36 +0900
Message-ID: <20261014095238.2132580-3-sh_def@163.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgDXX9foUM9qdnafEA--.29710S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGFyxGF43uF4Utw4rAF1UJrb_yoW5Jw4Up3
	45K345Wr4rJrWayr4fCF4kX34rGw1vgr129FWxurZ5C3Z8GryrWayfKFy3tFyYgry8Cr15
	WF4q9rWUCFWDAw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jjv38UUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbC6QncPGrPUOnUAwAA3L

Expose targeted sampling through the KCSAN debugfs file. Accept address
and kallsyms targets, including module:symbol names, and allow sampling
to be disabled with target=off.

Use KSYM_SYMBOL_LEN for the input buffer so documented module symbols fit,
and return -E2BIG for oversized writes.

Signed-off-by: Hui Su <sh_def@163.com>
---
 kernel/kcsan/debugfs.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/kernel/kcsan/debugfs.c b/kernel/kcsan/debugfs.c
index 2af39ba5b70b..47becde9f1ae 100644
--- a/kernel/kcsan/debugfs.c
+++ b/kernel/kcsan/debugfs.c
@@ -191,6 +191,7 @@ static ssize_t insert_report_filterlist(const char *func)
 static int show_info(struct seq_file *file, void *v)
 {
 	int i;
+	unsigned long target;
 	unsigned long flags;
 
 	/* show stats */
@@ -199,6 +200,12 @@ static int show_info(struct seq_file *file, void *v)
 		seq_printf(file, "%s: %ld\n", counter_names[i],
 			   atomic_long_read(&kcsan_counters[i]));
 	}
+	target = kcsan_target_get();
+	if (target)
+		seq_printf(file, "\ntarget: %pK (%pS)\n", (void *)target,
+			   (void *)target);
+	else
+		seq_puts(file, "\ntarget: none\n");
 
 	/* show filter functions, and filter type */
 	raw_spin_lock_irqsave(&report_filterlist_lock, flags);
@@ -220,10 +227,13 @@ static int debugfs_open(struct inode *inode, struct file *file)
 static ssize_t
 debugfs_write(struct file *file, const char __user *buf, size_t count, loff_t *off)
 {
-	char kbuf[KSYM_NAME_LEN];
+	char kbuf[KSYM_SYMBOL_LEN + sizeof("target=")];
 	char *arg;
 	const size_t read_len = min(count, sizeof(kbuf) - 1);
 
+	if (count > sizeof(kbuf) - 1)
+		return -E2BIG;
+
 	if (copy_from_user(kbuf, buf, read_len))
 		return -EFAULT;
 	kbuf[read_len] = '\0';
@@ -239,6 +249,22 @@ debugfs_write(struct file *file, const char __user *buf, size_t count, loff_t *o
 		if (kstrtoul(&arg[strlen("microbench=")], 0, &iters))
 			return -EINVAL;
 		microbenchmark(iters);
+	} else if (str_has_prefix(arg, "target=")) {
+		char *target = &arg[strlen("target=")];
+		unsigned long addr;
+
+		if (!strcmp(target, "off")) {
+			kcsan_target_set(0);
+		} else if (!kstrtoul(target, 0, &addr)) {
+			if (!addr)
+				return -EINVAL;
+			kcsan_target_set(addr);
+		} else {
+			addr = kallsyms_lookup_name(target);
+			if (!addr)
+				return -ENOENT;
+			kcsan_target_set(addr);
+		}
 	} else if (!strcmp(arg, "whitelist")) {
 		set_report_filterlist_whitelist(true);
 	} else if (!strcmp(arg, "blacklist")) {
-- 
2.55.0

