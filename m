Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793892216;
	b=YBYmqPJsTY5GSvhDHhoOWRGn6QRumtR5TZP4UlJRp7WMi9nna3vqwt/j7B/ftCEQZcjm
	 N05gQelU6FRc7wYoDbzEg/LnJWuPKITjxIOmEIlf48OqkOTe87j9U7py+0GKNnxCLZAdH
	 MQjbdcF3SFE60gcxcklUz7vmSukUQxuI7spM2jH436LlsAHQaRr1aj5EsD9AcImeafIAU
	 wkexVeGzzjoY6HVgqFXvqs0ApbOa8fpxeRkfnYAqBHVFmNKyME32ceyAZa2dCOpsf/NMn
	 UkpxQ1CeEB2kRdQSoXWOmxIDwGow5w1DBuNykLVAj8RJq3i57ioBnmDNckAe+fACMjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892216;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=kdXj6//jxdtcWs7h4JxcJxKLQ6Lk98T2w2GxXOA8Ujw=;
	b=XbHWne/rr2JL5TcO3y5MF8pVrC8IJr3rpxmLNJdyHZPHH6InWCyRCaEzED5XmKJt8sOi
	 BcxLMaTeVBmldOP3yFC2zJIIOV6Je4b5eZvUIP3fc83e9yiyPaodozAe2WCzdeWS8X7ui
	 JF7aMr3+Kk0FPBNrRgr0ZZZ3FKmXZxVS79NFcrlzqRxYmuBOegVMcBxflzr7XwIZ0lsnl
	 PgD4tDEg3I41XP5cHzbWjoKkaSNJABFTEyXCmxRucjcRuUHBH+SkNS6Rl/5++SZvqNCSL
	 1Q664uIMpS2cjdy2uny/PsgdcqFWFFaT1wdACMF1W8B6NeBKGtfupUlZZ4gCkdZ+76A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=jFv7JG3X;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3811F606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:23:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3811F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=jFv7JG3X
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so21668335e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793892214; x=1794497014; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kdXj6//jxdtcWs7h4JxcJxKLQ6Lk98T2w2GxXOA8Ujw=;
        b=jFv7JG3XZaJkSmPlPLcfE9OCnqAnrFIHWurWtq5O25T0d3IKJTFJLQ/Tlh1cQdZdF5
         jZe0mRWMpOKGSKlVU7OnUUrtccQJos28SZAjnjAooX9EAk1qDqsSytT2/MABpT0o6cW4
         Te3Q+wfScQdbIEl9gzzkLutwHZkHOSstck/g9x4QgupyhN2uZxfhrATdnH6Aap6zGwje
         YY3hR3y9CsIxwLB/YjwmNnarq3DANSUZsv841ylnVyMBLXVDctsWvYB7fhs2JO7MbycC
         mKDrvns48LjXuMQogYbKDJupivw/9KKxj9x3UvvPVIXjbEMcj5jV4dSOfwjXKADHZKaV
         JYLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793892214; x=1794497014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kdXj6//jxdtcWs7h4JxcJxKLQ6Lk98T2w2GxXOA8Ujw=;
        b=T01DGPNRg+Nyy1S83j5DRRCCtRxat3ZfuQ1Fub7EO3hNKkSHz8wRKBzhqOZHhDlwOC
         +VR3alUgYhvRpPa1fvt9SY31S6sjK8xB2PuuQDcAyGC1AComxJOxsvhaqIZamyS0BDDX
         HbvyyfoMwhX3jjA8ZTIkuLSor+QJqT5GAOp3Q/kHOeU10j/PUg6LAo4YRDYg2k8ca4PQ
         z8L9navudC1nEjyshFh0W+NnmLd3S3ro/0p8VQSPhT2RW5VPsoNDdJMIcRiqLNLpMt5I
         Sr+qWerEUNkyOwAWqE7uRP0Xau5CUQ2CkEEkOz/rY+zIGka6DFzZue23U1ZwpqRRcq1R
         pJhQ==
X-Forwarded-Encrypted: i=1; AKwUvByBSuV3oeFKs4aqfzxvULNjfvJQP2d3YcekH33kfnDRrqtj61LPApmk29MFUHPIGO9ADyEPMU1TZ8B4DpE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UZqJunUh2p3KcLw4hQxJr7FFIZagt1oN96Jmenp8raRkux6zu
	wxPo9YRtS3NmRNO2drv3NIUqbYMk7QJNoxlomotFp+IbYqMCBc0AWXnA14ImqGJK4a8=
X-Gm-Gg: AYBFou39FVWO2DiLj9+FmpuKArFjlE46vhp5sB/JC79zU4PVri5E/+PpasAWIdO+BDi
	/otT9ge7y0/0X1kdAiuLWZxUpvptBdO1iybM5L9mji3JLXlojrd4pldwIMBlJNsd1OWkZh766LO
	R1znj/Ukuio+0FzzIIX7pLlFOYrSBpMqXLs68cfoHpogRSc26Mi++r4Fhy3ib2HZpvHMpmUjDU/
	vgdxi91r7qg6xaC2wZ9mWzxKFq+9HJbtcuD6yhm4YxWikCaBRn+OQlWXj/tkE3oeXWuOYFsTtRM
	CbYmPxPG9mn5hpmdInAphAq89yeIm0jvrpZfr27dQGfX1Jvz6x3Ymk6eH56i0rpWSBgQ8WKayqT
	0HIKUhqzCiT/TJtQ2aBqYDmGguUcksfQ79wysjIJ+jBgJC28QtKdbYGeRmyUKLhkIb6pI4DA+i4
	ndDj6kgN/FIZzsc6ycZyHv7T0ZbbQ/I+cKhtLPhh8abrMuBVG06u7aXJQNaZ8P64KpUQpkjlYJF
	iET+MTcw+mpIi5xgei+i4Z9P8qbSVL1Ag7KoeMAqbBwB0GjFHHnXMn7BfwDCnQdMRTDHNSzXnHD
	YUAOzZsIfyH6lBJEiIsudsrydaX7DCnH0aS8sD4KxwOR
X-Received: by 2002:a05:600c:e547:10b0:4ad:5e09:ae43 with SMTP id 5b1f17b1804b1-4ad5e09ae61mr223607775e9.29.1793892213219;
        Thu, 05 Nov 2026 07:23:33 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.254])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fecac1caesm10086281f8f.17.2026.11.05.07.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:23:32 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 05 Nov 2026 15:02:55 +0000
Subject: [PATCH RFC v3 63/90] fs: drop privileges from what a cell may
 write to
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-b4-cells-v3-63-bc9095937a84@toxicpanda.com>
References: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
In-Reply-To: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
To: Christian Brauner <brauner@kernel.org>, 
 James Bottomley <James.Bottomley@HansenPartnership.com>, 
 Andrew Halaney <andrew@amutable.com>, Jeremy Bingham <jbingham@gmail.com>, 
 Tahera Fahimi <taherafahimi@linux.microsoft.com>, 
 Serge Hallyn <sergeh@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793890935; l=5024;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=/WLGeeEm8E2O/SOVtC/ElmM+tG1LfrcPrZQl9vVf+t8=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKS5fAxTghKSICyzvxndkndKJSwBCeYnyHI67j2sLdsxkcKPY/AbqzZwCCaz7i90Wyltyf/Pup1
 em+ZpbT5sfgc=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

A write() clears the set-id bits and the file capabilities of a file. A
store through a shared mapping does not. So a task of a cell could replace
the contents of an existing set-uid file while the file keeps the bit.

Clear them as soon as a task of a cell opens a file for writing, and when
pidfd_configure() places a file that is open for writing.

This changes the inode at open time, like O_TRUNC, so it is done in the
same place as the truncation, in do_open(). The directory lock has been
dropped at that point, which is not the case in ->atomic_open(). The
change needs write access to the mount, so it waits if the filesystem is
frozen, but only if there is something to clear.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 fs/inode.c           | 61 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 fs/namei.c           |  8 +++++++
 include/linux/cell.h |  7 ++++++
 kernel/embryo.c      |  6 ++++++
 4 files changed, 82 insertions(+)

diff --git a/fs/inode.c b/fs/inode.c
index f63535ee3629..d32c14217420 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -4,6 +4,7 @@
  * (C) 1999 Andrea Arcangeli <andrea@suse.de> (dynamic inode allocation)
  */
 #include <linux/export.h>
+#include <linux/cell.h>
 #include <linux/fs.h>
 #include <linux/filelock.h>
 #include <linux/mm.h>
@@ -2379,6 +2380,66 @@ static int __remove_privs(const struct mnt_idmap *idmap,
 	return notify_change(idmap, dentry, &newattrs, NULL);
 }
 
+#ifdef CONFIG_CELLS
+static int cell_privs_to_kill(struct dentry *dentry)
+{
+	umode_t mode = d_inode(dentry)->i_mode;
+	int kill = 0, ret;
+
+	if (mode & S_ISUID)
+		kill |= ATTR_KILL_SUID;
+	if (mode & S_ISGID)
+		kill |= ATTR_KILL_SGID;
+	ret = security_inode_need_killpriv(dentry);
+	if (ret < 0)
+		return ret;
+	if (ret)
+		kill |= ATTR_KILL_PRIV;
+	return kill;
+}
+
+/**
+ * cell_file_drop_privs - a task of a cell is about to be able to write @file
+ * @file: a file open for writing
+ *
+ * Nothing a cell writes imparts privilege. A write() drops the set-id bits and
+ * the file capabilities of what it writes to, a store through a shared mapping
+ * does not. So for a cell they go as soon as the file can be written at all,
+ * and they all go, whatever capabilities the caller has.
+ *
+ * This changes the inode, so the caller must hold no inode lock and no write
+ * access to the superblock. It waits for a frozen filesystem, but only if there
+ * is something to drop.
+ *
+ * Return: 0 or a negative error, in which case @file must not be handed out.
+ */
+int cell_file_drop_privs(struct file *file)
+{
+	struct dentry *dentry = file_dentry(file);
+	struct inode *inode = file_inode(file);
+	int kill;
+
+	if (!S_ISREG(inode->i_mode) || IS_NOSEC(inode))
+		return 0;
+
+	/* A look without the lock, as do_truncate() takes one. */
+	kill = cell_privs_to_kill(dentry);
+	if (kill <= 0)
+		return kill;
+
+	kill = mnt_want_write_file(file);
+	if (kill)
+		return kill;
+	inode_lock(inode);
+	kill = cell_privs_to_kill(dentry);
+	if (kill > 0)
+		kill = __remove_privs(file_mnt_idmap(file), dentry, kill);
+	inode_unlock(inode);
+	mnt_drop_write_file(file);
+	return kill;
+}
+#endif
+
 static int file_remove_privs_flags(struct file *file, unsigned int flags)
 {
 	struct dentry *dentry = file_dentry(file);
diff --git a/fs/namei.c b/fs/namei.c
index 49995c353292..f36c1a385d80 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -4862,6 +4862,14 @@ static int do_open(struct nameidata *nd,
 		mnt_drop_write(mnt);
 		mntput(mnt);
 	}
+	/*
+	 * Nothing a cell writes imparts privilege. Here, like the truncation,
+	 * because it changes the inode: the lock of the directory has been
+	 * dropped, which is not so in ->atomic_open().
+	 */
+	if (!error && unlikely(current_cell()) &&
+	    (file->f_mode & (FMODE_WRITE | FMODE_CREATED)) == FMODE_WRITE)
+		error = cell_file_drop_privs(file);
 	return error;
 }
 
diff --git a/include/linux/cell.h b/include/linux/cell.h
index 1d0eec34acb9..0451055f74fc 100644
--- a/include/linux/cell.h
+++ b/include/linux/cell.h
@@ -284,4 +284,11 @@ static inline umode_t cell_strip_setid(umode_t mode)
 	return mode;
 }
 
+/* Nothing a cell writes imparts privilege: files that are already there. */
+#ifdef CONFIG_CELLS
+int cell_file_drop_privs(struct file *file);
+#else
+static inline int cell_file_drop_privs(struct file *file) { return 0; }
+#endif
+
 #endif /* _LINUX_CELL_H */
diff --git a/kernel/embryo.c b/kernel/embryo.c
index 0a04f39fa37a..657ce07441e0 100644
--- a/kernel/embryo.c
+++ b/kernel/embryo.c
@@ -113,6 +113,12 @@ static int embryo_install_fds(struct embryo *e)
 		ret = security_file_receive(file);
 		if (ret)
 			return ret;
+		/* As if the cell had opened it. */
+		if (file->f_mode & FMODE_WRITE) {
+			ret = cell_file_drop_privs(file);
+			if (ret)
+				return ret;
+		}
 		ret = replace_fd(e->fds[i].fd, file, 0);
 		if (ret < 0)
 			return ret;

-- 
2.55.0

