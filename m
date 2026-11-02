Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793593840;
	b=PK9TOyxf0OSVNlD97jw7wXOXP0AUM2YfW2if+HqVADbPdNLy1Yy7pu6/bVA2M2NlRlI/
	 LfcAlpeLGrWRly9540SnCeLgyEuuNF8znl7gsUxl43CFV3MmCu4F5nbH5ukppWqDUMIIb
	 N5I9YTdBVxE6CEcY550zVInDd8hGMLNynKDJIev/XQu0XLeAnpKjWbQSsa3Q87ZuEzdDH
	 NVnODeuMGW9bbHHskLvQK5dTsB0l6vnSZ2WKzvcht9IyAk8aRRliWtM8oeLcRKKBMg3PV
	 SU7jGYFF7IsRKVlaAL8+WlpvYTjVxgkwG5l7Dkqsw9G6ArOoSFlJpWacka4Tc4+mkBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793593840;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Date:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=SM0r8ms4T2f9rRzxWcFjRPw9JYF6rVkm4MIivyGl0G0=;
	b=z5xv0tSE/mFzL8xffFrlIy+7Q4wV0Nh0phMBu5rBLG2j9elyAuEUAO0PGSwnl6vTx6/c
	 ab/TAdsJvPMX+4lNegdnsY9N0L1gS4HL9npX3pHF7zcaZeeBpIEhsL5JnWrBZnzBbCN/I
	 NwGFoZNdXPPyOYV+iNHco1GDdQTf6zaaTMjcb48x1F66Ij2l7x4Oq5qc0qik6XZdJvoUC
	 PLQO7NFDMA8C7biKNWQ8n6EJZxEf+1nij/szK4EwWOFMrlkPGKyrxRGhUZIZz7VOB2WtO
	 BzQnzbr/RJGkd/HrHmZpvlHXVssEnhFYWx46T3MakMmgoEhPP/BrPTC/73WyZeQ+s8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JIElQ9Md;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C103606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 04:30:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C103606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JIElQ9Md
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cd60c5da24cso1522177a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 20:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793593840; x=1794198640; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :subject:date:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SM0r8ms4T2f9rRzxWcFjRPw9JYF6rVkm4MIivyGl0G0=;
        b=JIElQ9Mdf3Xne4fAH4Evj3qRE3bGQAskpcjIlU1BEBm3Y76ZOHqGZFy1j12sVIIxgl
         0ZcE9NpHTLM/EoLyOfv/Em4zaq/YtSY1XsCPMyFNgn0Hi4tyc5OUSftr0WcefrmxgX13
         2Vi9c8frsLSJ6ThHQw1m70/+jDzvQHswKOpVe34er7T3Vr9YJJsqTSDJ+p6xES6Pqg2R
         TrKEQypQgpaN3oUch4lJnr+nlPSn+yURwqb/vLB7XKHgjj2J8zk9aAR+qRrWuWSMaJUp
         B7HUB1rjDRuduC0sY0rTPaO65iaVuxYQIJa40Jb+i5gqxr37jTAswhpRsqxG3rmEOAji
         24SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793593840; x=1794198640;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :subject:date:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SM0r8ms4T2f9rRzxWcFjRPw9JYF6rVkm4MIivyGl0G0=;
        b=Nc/WujnstYCAAtuuMAFzeVRIhVLMGCPNshV6KDieB9rVhai1YxeY5tIQHVlG5JfzPe
         LwhmXryQksfRMHiuPj+HIAxvhOCGcWXVsqkMaoJifCYhIpHA9CtsZAIYu5t3EYgmg6OU
         pAQIqcC5iLJMPIRIpdrLsat1L1ZbnedCuyv3WQfcgo6vjoAOFQ4XpNa831mvvf3pcrnD
         x6j8gu2viukGF8OiVrWjURMHZEJ8CFEvCInQUfeShRZnkpjLwVOUACCCso7mjC8KQYvd
         RJwC1D6td1fRWye0EwCaPoPbkOnR85ZsNVxxvt5UI7FtHGuvpjcNpuq+hQCq/XOa84Ty
         2ejA==
X-Forwarded-Encrypted: i=1; AKwUvBxC6P92fetOs/ugSn4FOLQJh6Xr6xeFb5qmkHZFXuBJnXKxDa9EvzG0UyFUCix27JA2z7gpYU8dhL91ld4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SIxhtPeC1mJZAdeA8iqiYtYnn07m5LSHculbc/gm0+orXYucu
	1lEVM2T3a3rP6I2ZTKKg8udNloWDsYx/F942g3xZonhqWhcjEqfQkzSIl72pzvIkFA==
X-Gm-Gg: AYBFou29KQbZ4rUoRSRQMIINHs1OU5H/TMeGzrW16XkghJZvXSVLdJtwZPzSoQHg0bZ
	WAKWdx9GlTp5a0u5dyTsepUecIG7oO08G3xTup6dZPTBwJDHCiOeQgXkn1psVFbKZa/3YhBWU8v
	KhgBAQKH+P7qJ6AwMQJNRMyFqf+68rb/I7cI5BvxuUFPpHr8cZLxDxPzCgasmDnV6eaPknK9BlI
	U9/2bKS9Ia9PHtvfALnktvpdfHw5IkLZuRgasK45lxFRMTJc2EWqTchSdfia67btxpShhC4yhHO
	VZ68klEcWpV6gCQEYlfwzzKcvUkGaaQyq15GEsuUAjl9YAdy247HG+3Ki4jkfS5LSVvyWF92mYZ
	p3phBGODVDpMzGyLJUit4qi2ZQyhuWXP7em1qAf/QGT9RaExCzocNB/XDoPHN4Z9BjIBCjCWXrL
	xyDOPprs1HBHBI+vCz/NkA+gbodtZZ5T7ZWN6tIE0WFJJAHFqurprdfO6EfeM9AxnLc5fE145Vn
	XYHq++Hb/TMRScv2L1JoV+WIn5mbwNPlWATHzL4dhw/HHA80PK1vqCUqwYCQ+TA+eaEGsoETvjx
	pLQmak1+m6RWGdBsurIOg0JUjngT
X-Received: by 2002:a17:90b:1d45:b0:3ac:a521:95c with SMTP id 98e67ed59e1d1-3ae897eb4c7mr7356236a91.58.1793593839407;
        Sun, 01 Nov 2026 20:30:39 -0800 (PST)
Received: from [127.0.1.1] ([185.220.238.36])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e8fba61sm16419882a91.6.2026.11.01.20.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 20:30:39 -0800 (PST)
From: Wang Yibo <szwyb123@gmail.com>
To: Dave Kleikamp <shaggy@kernel.org>
Cc: jfs-discussion@lists.sourceforge.net,
 linux-kernel@vger.kernel.org,
 syzkaller-bugs@googlegroups.com,
 syzbot+cea4fad5485bc30243a9@syzkaller.appspotmail.com
Date: Mon, 02 Nov 2026 12:29:34 +0800
Subject: [PATCH] jfs: fix statfs racing with a read-write remount
Message-ID: <20261102123500.34-1-szwyb123@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8bit

jfs_remount() rebuilds the in-memory inode and block maps when a
read-only file system is remounted read-write, so that changes made by
fsck while the volume was read-only are picked up.  The rebuild frees
the old structures first and installs the new ones afterwards:

	diUnmount()  -> kfree(imap); JFS_IP(imap)->i_imap = NULL
	diMount()    -> ...;         JFS_IP(imap)->i_imap = imap
	dbUnmount()  -> kfree(bmp);  JFS_SBI(sb)->bmap = NULL
	dbMount()    -> ...;         JFS_SBI(sb)->bmap = bmp

jfs_statfs() reads both maps without taking any lock, so a statfs that
runs while the rebuild is in progress observes the NULL - or a pointer
to memory that has just been freed - and faults:

	BUG: KASAN: user-memory-access in jfs_statfs+0x20e/0x510
	Read of size 4 at addr 00000000000050c0 by task syz-executor415/5092
	...
	 jfs_statfs fs/jfs/super.c:140
	 __x64_sys_statfs

0x50c0 is offsetof(struct inomap, im_numinos) for the reporter's
configuration, i.e. i_imap was NULL when statfs() ran.

The inode map rebuild is already serialized by RDWRLOCK_IMAP, but that
only orders the inode map users among themselves; statfs() is not one of
them.  Take the same lock for reading in jfs_statfs() and keep the write
side held across the block map rebuild too, so that both maps are at all
times either the old or the new structures.  A failed rebuild can still
leave the maps torn down, so return -EIO instead of dereferencing NULL
in that case as well.

An earlier AI-generated RFC from syzbot proposed a different fix for
the same remount window; it was never reviewed and it does not cover the
report below.  It is linked only for context.

Reported-by: syzbot+cea4fad5485bc30243a9@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=cea4fad5485bc30243a9
Link: https://lore.kernel.org/all/80218035-7c1f-4784-93d1-c34d9ccc252a@mail.kernel.org/
Signed-off-by: Wang Yibo <szwyb123@gmail.com>
---
 fs/jfs/jfs_mount.c |  9 ++++++++-
 fs/jfs/super.c     | 17 ++++++++++++++++-
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/fs/jfs/jfs_mount.c b/fs/jfs/jfs_mount.c
index dac822f15070..19099b888b53 100644
--- a/fs/jfs/jfs_mount.c
+++ b/fs/jfs/jfs_mount.c
@@ -235,6 +235,12 @@ int jfs_mount_rw(struct super_block *sb, int remount)
 		truncate_inode_pages(sbi->ipimap->i_mapping, 0);
 		truncate_inode_pages(sbi->ipbmap->i_mapping, 0);
 
+		/*
+		 * Rebuild both maps under the inode map lock so that
+		 * statfs(), which reads them without any other means of
+		 * synchronization, never observes the window where the
+		 * old structures are torn down.
+		 */
 		IWRITE_LOCK(sbi->ipimap, RDWRLOCK_IMAP);
 		diUnmount(sbi->ipimap, 1);
 		if ((rc = diMount(sbi->ipimap))) {
@@ -242,13 +248,14 @@ int jfs_mount_rw(struct super_block *sb, int remount)
 			jfs_err("jfs_mount_rw: diMount failed!");
 			return rc;
 		}
-		IWRITE_UNLOCK(sbi->ipimap);
 
 		dbUnmount(sbi->ipbmap, 1);
 		if ((rc = dbMount(sbi->ipbmap))) {
+			IWRITE_UNLOCK(sbi->ipimap);
 			jfs_err("jfs_mount_rw: dbMount failed!");
 			return rc;
 		}
+		IWRITE_UNLOCK(sbi->ipimap);
 	}
 
 	/*
diff --git a/fs/jfs/super.c b/fs/jfs/super.c
index 8180d83d33fe..7a8365fdf2b2 100644
--- a/fs/jfs/super.c
+++ b/fs/jfs/super.c
@@ -120,9 +120,23 @@ static int jfs_statfs(struct dentry *dentry, struct kstatfs *buf)
 {
 	struct jfs_sb_info *sbi = JFS_SBI(dentry->d_sb);
 	s64 maxinodes;
-	struct inomap *imap = JFS_IP(sbi->ipimap)->i_imap;
+	struct inomap *imap;
 
 	jfs_info("In jfs_statfs");
+
+	/*
+	 * A concurrent read-write remount tears down the in-memory inode
+	 * and block maps before installing the freshly built ones, leaving
+	 * them briefly NULL.  Exclude that window, and bail out if a failed
+	 * remount left us without maps at all.
+	 */
+	IREAD_LOCK(sbi->ipimap, RDWRLOCK_IMAP);
+	imap = JFS_IP(sbi->ipimap)->i_imap;
+	if (!imap || !sbi->bmap) {
+		IREAD_UNLOCK(sbi->ipimap);
+		return -EIO;
+	}
+
 	buf->f_type = JFS_SUPER_MAGIC;
 	buf->f_bsize = sbi->bsize;
 	buf->f_blocks = sbi->bmap->db_mapsize;
@@ -150,6 +164,7 @@ static int jfs_statfs(struct dentry *dentry, struct kstatfs *buf)
 				      sizeof(sbi->uuid)/2);
 
 	buf->f_namelen = JFS_NAME_MAX;
+	IREAD_UNLOCK(sbi->ipimap);
 	return 0;
 }
 
-- 
2.25.1


