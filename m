Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793863187;
	b=TkXiyt3s/4lADxJ1gxqVdT2ATE+3iUq4kAK+1BkLsSMp8qQmYxLFcPit7RMrpWhAoxlw
	 UD/hFAjBrWuNUtxxfDGT3yzmbhgZqBpT5U6mS+jmv9G706+9cUb9S1xmNmGe3uJ/FQEdI
	 UvxG/3wxd4Xs7NTdN3pdrifdOFg7Vl2hiUcMT7BPHNjO+PGXwy21bzZWBMN8s9vpq7kzF
	 nt9PwITVWqsaZLu8DfqsIURuVpOwwngBrxGGtL923h2hB36evPGFNWdVmaq2W+o7hG9IE
	 cVs4H8U8e7sCOg0vpiTtpwe1nD1iYJ2unvYUnZMkUUn+bNFiubykxcJP/wNLWL04Syw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793863187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2TYRXvMF603odb8S2MAHHkubTkD5yjsXtdo4fKKhyzs=;
	b=B50XlGCqNdyr/jJGEm2Q4iHqcUoeU7Wt1o/4MEbLYklEq1sonY9kGmuBj98v96HvIIMO
	 ueccqtBSY3+5b+PocKUHw3VJMvTCuP3qZNxQXkYpxQchVUo6F/jE5Upfo56U4Wjf+KrkT
	 DG1e2cyWqFWeELcJYckz8QVG/CfY/QQhtSxpZKN5VTt34W50Kw6jqJY6RkOsrhxuT/sul
	 DotVDpvtd+9EIYiLKUk7AYKleLUV+OiTF+jOZYbpZdR9ej0DGxPuaI0lT7eUau5NzPSJr
	 SVKxK6wY8xfm/XKqcA1BemPqkdkmbB29+MYWf2B8KlKoVs6kwDf0fhZ+xNcowqh6QQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="QLO5KV5/";
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EAC2606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 07:19:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EAC2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=QLO5KV5/
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a56e05568aso4917435e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 23:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793863184; x=1794467984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2TYRXvMF603odb8S2MAHHkubTkD5yjsXtdo4fKKhyzs=;
        b=QLO5KV5//kiaLxMhkOt6RI+oP/u9DEXLKRfsALks8Cy/lPEgVn9SxJts7wcBheHYGF
         NI5j8Gw1CJ9k5FnUX871lNkoGRDUtMpUnkbntF+fkOfFimd/ehELeKIcIOSwIl2FmIxi
         ++H4D3ieYXJag31KP7T2BslibfwqzbzoDZLPjYSBCNIj8n8h+RMRmm0Y8WSNJxim5+m0
         izMnqKpGHNXORip69UEo2PAXlTHZ+xX9w5XHUso6dt0fyMUrp7d/7HbvzoFyjyiz5yPl
         7tnhhE2p6wZ5y5AhoFb+3WwhaK/Kvc1nuG6NiFOPgIaYRvCMxSIDlR/jruvgOCjtCR5c
         4c0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793863185; x=1794467985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2TYRXvMF603odb8S2MAHHkubTkD5yjsXtdo4fKKhyzs=;
        b=wnBn+WEDqEaTCyfSDrpwWkWYIta1835kYDghInboCQQny35/PlEJuIfvciwFDQFfme
         vNpX6vK9raq/Lm0pqSpvXlkDtv1rPp8EvEVYchlPWUAR3LDnb64RrhHI4ULKhOvH537i
         AM3f+H6GwGTbeHEW8ecfb8AGLIlPMHg4/kxyN9lF/fCZ+E4uZ62Qgt5qSmlaoMKfo+6S
         COUP8rOLoEeryah2pymp1RbKckuWb5/x/QOL+IpNXIyvUk2nYqUHmX3OGbpU0fzrqMTW
         BYays0DKkANLvcht6bcamyAE+7bdX6MnQHfVeHllHQipo5MuQDDwfmZCOR7XKaWPan9w
         DUaQ==
X-Forwarded-Encrypted: i=1; AKwUvBwrdeALW1Np2fxyrqCRH79I19pFMuwqA3I1v9R6ixOc7a1zOiF0yDGCACx3Dt5lb9NPZnBnv5rR6Ermlkk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+aCC1tDC3NgOh0rQBUMj8dXBfZKum2vwH+zAr4aQFX3GGCgAzo
	b3WOJQbk69RjT2Jpb1V6LnhNacXRqgNHr8vSWCRgdChhNvH5J0KtZpC1cKfxA1niWTY=
X-Gm-Gg: AYBFou2NOTQheu4QuV1pMH6nIPT5OP9lH6eDckCqOhOXMvNsbSKHENyOPNw9b2wiBvR
	A2RnuQlYhIM81q8efcqH/lXx8nSqvTc/5wHrbrVj+xZ8RkFqGHhB7dCm0P3oZTjzdDVv/e0lZpa
	rXQRm++8z6CHtD+AqOEVGa7h1dc04kthjMZTmzg5inpc9230Tb7dWWxMxTOvrmhiKrJ5MmFWSlz
	ExUAQ43iydvs5/bk7gI5J/o2+fqg2H8Gv1BwfSfPhxr4X8qUHyiPT9185sJJMYVADREeEv6IfN3
	EtqQCHOTTH8g9pRpzBMWnjVljoIHw9yymyQftJDJFb0po2uTzTLndNqiZFVJVB0uxS69sfGTqOa
	cP1C6x+LYUD85AftBRkeJ4oDUCUkii6iMMSI/KCbOn9rxMwOLudz3Cj0F34XJ8djMhvHCgsob3F
	22EIbEHjez+C6GkZzmPap55Urc3kyOeepmpt7cRmzR3FQ30lq4i2GIlBiOVecUVGjltODZyk2f1
	0ojKgqXEy/TLzz1Uk7aDxNe5FXzstXB/D8wUIq+uBir/DPwroW7r75Gojqhj78aJ430Z7WX8r14
	qa5pLEoGTsoC+7ZffFDcT7k9xThI46NRajQiigBLJt0pPmJppSgECnXPusXBhcXH
X-Received: by 2002:a05:600c:3146:b0:4b6:2242:d0d5 with SMTP id 5b1f17b1804b1-4b62242d351mr3802415e9.0.1793863184646;
        Wed, 04 Nov 2026 23:19:44 -0800 (PST)
Received: from localhost.localdomain ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245b86fbesm14687084c88.1.2026.11.04.23.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 23:19:43 -0800 (PST)
From: Heming Zhao <heming.zhao@suse.com>
To: joseph.qi@linux.alibaba.com,
	mark@fasheh.com,
	jlbec@evilplan.org,
	hch@lst.de
Cc: Heming Zhao <heming.zhao@suse.com>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v5 1/4] ocfs2: Add new ocfs2_map_blocks() to introduce iomap feature
Date: Thu,  5 Nov 2026 15:19:25 +0800
Message-ID: <20261105071930.16399-2-heming.zhao@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105071930.16399-1-heming.zhao@suse.com>
References: <20261105071930.16399-1-heming.zhao@suse.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As part of migrating OCFS2 DIO read/write code paths towards the modern
and performant iomap framework, here introduces ocfs2_map_blocks() to
replace the legacy, high-overhead buffer_head based block mapping
routines.

In addition, OCFS2_MAP_* flags are defined to gridge OCFS2 internal block
mapping flags with the iomap API requirements.

Subsequent iomap integration patches will build on this core block mapping
routine. The implementation draws inspiration from ext4_map_blocks().

Signed-off-by: Heming Zhao <heming.zhao@suse.com>
---
 fs/ocfs2/aops.c  | 72 ++++++++++++++++++++++++++++++++++++++++++++++++
 fs/ocfs2/aops.h  |  2 ++
 fs/ocfs2/ocfs2.h | 25 ++++++++++++++++-
 3 files changed, 98 insertions(+), 1 deletion(-)

diff --git a/fs/ocfs2/aops.c b/fs/ocfs2/aops.c
index 4acdbb70882c..0f7502de9b8d 100644
--- a/fs/ocfs2/aops.c
+++ b/fs/ocfs2/aops.c
@@ -126,6 +126,78 @@ static int ocfs2_lock_get_block(struct inode *inode, sector_t iblock,
 	return ret;
 }
 
+/* ocfs2 never allocates in this function */
+int ocfs2_map_blocks(struct inode *inode, struct ocfs2_map_block *map,
+		    int flags)
+{
+	int err = 0;
+	unsigned int ext_flags;
+	u64 max_blocks = map->len;
+	u64 p_blkno, count, past_eof;
+	struct ocfs2_super *osb = OCFS2_SB(inode->i_sb);
+	int create = flags & OCFS2_GET_BLOCKS_CREATE;
+
+	if (OCFS2_I(inode)->ip_flags & OCFS2_INODE_SYSTEM_FILE)
+		mlog(ML_NOTICE, "map_block on system inode 0x%p (%llu)\n",
+		     inode, inode->i_ino);
+
+	err = ocfs2_extent_map_get_blocks(inode, map->lblk, &p_blkno, &count,
+					  &ext_flags);
+	if (err) {
+		mlog(ML_ERROR, "get_blocks() failed, inode: 0x%p, "
+		     "block: %llu\n", inode, map->lblk);
+		goto bail;
+	}
+
+	if (max_blocks < count)
+		count = max_blocks;
+
+	map->pblk = p_blkno;
+	map->len = count;
+
+	/*
+	 * If we see this on a sparse file system, then a truncate has
+	 * raced us and removed the cluster. We treat this as a hole
+	 * and skip setting the iomap flags. The caller will set
+	 * iomap->type to IOMAP_HOLE.
+	 */
+	if (create && map->pblk == 0 && ocfs2_sparse_alloc(osb))
+		goto bail;
+
+	if (p_blkno) {
+		if (ext_flags & OCFS2_EXT_UNWRITTEN) {
+			map->flags |= OCFS2_MAP_UNWRITTEN;
+		} else {
+			/* Treat the unwritten extent as a hole for zeroing purposes. */
+			map->flags |= OCFS2_MAP_MAPPED;
+		}
+	}
+
+	if (!ocfs2_sparse_alloc(osb)) {
+		if (map->pblk == 0) {
+			err = -EIO;
+			mlog(ML_ERROR,
+			     "iblock = %llu p_blkno = %llu blkno=(%llu)\n",
+			     (unsigned long long)map->lblk,
+			     (unsigned long long)map->pblk,
+			     (unsigned long long)OCFS2_I(inode)->ip_blkno);
+			mlog(ML_ERROR, "Size %llu, clusters %u\n",
+			     (unsigned long long)i_size_read(inode),
+			     OCFS2_I(inode)->ip_clusters);
+			dump_stack();
+			goto bail;
+		}
+	}
+
+	past_eof = ocfs2_blocks_for_bytes(inode->i_sb, i_size_read(inode));
+
+	if (create && (map->lblk >= past_eof))
+		map->flags |= OCFS2_MAP_NEW;
+
+bail:
+	return err;
+}
+
 int ocfs2_get_block(struct inode *inode, sector_t iblock,
 		    struct buffer_head *bh_result, int create)
 {
diff --git a/fs/ocfs2/aops.h b/fs/ocfs2/aops.h
index 114efc9111e4..8dd6edd7c1a1 100644
--- a/fs/ocfs2/aops.h
+++ b/fs/ocfs2/aops.h
@@ -42,6 +42,8 @@ int ocfs2_size_fits_inline_data(struct buffer_head *di_bh, u64 new_size);
 
 int ocfs2_get_block(struct inode *inode, sector_t iblock,
 		    struct buffer_head *bh_result, int create);
+int ocfs2_map_blocks(struct inode *inode, struct ocfs2_map_block *map,
+		    int flags);
 /* all ocfs2_dio_end_io()'s fault */
 #define ocfs2_iocb_is_rw_locked(iocb) \
 	test_bit(0, (unsigned long *)&iocb->private)
diff --git a/fs/ocfs2/ocfs2.h b/fs/ocfs2/ocfs2.h
index e3bb3cc0b25a..b4583b3170e2 100644
--- a/fs/ocfs2/ocfs2.h
+++ b/fs/ocfs2/ocfs2.h
@@ -514,7 +514,30 @@ struct ocfs2_super
 	struct ocfs2_filecheck_sysfs_entry osb_fc_ent;
 };
 
-#define OCFS2_SB(sb)	    ((struct ocfs2_super *)(sb)->s_fs_info)
+/*
+ * Logical to physical block mapping, used by ocfs2_map_blocks()
+ *
+ * This structure is used to pass requests into ocfs2_map_blocks()
+ * as well as to store the information returned by ocfs2_map_blocks().
+ * It takes less room on the stack than a struct buffer_head.
+ */
+#define OCFS2_MAP_NEW			BIT(BH_New)
+#define OCFS2_MAP_MAPPED		BIT(BH_Mapped)
+#define OCFS2_MAP_UNWRITTEN		BIT(BH_Unwritten)
+#define OCFS2_MAP_FLAGS		(OCFS2_MAP_NEW | OCFS2_MAP_MAPPED |\
+				 OCFS2_MAP_UNWRITTEN)
+
+struct ocfs2_map_block {
+	u64 pblk; /* physical block# */
+	u64 lblk; /* logical block# */
+	u64 len;  /* number of block */
+	unsigned int flags;
+};
+
+/* Flags used by ocfs2_map_blocks() */
+#define OCFS2_GET_BLOCKS_CREATE	(0x0001)
+
+#define OCFS2_SB(sb)	((struct ocfs2_super *)(sb)->s_fs_info)
 
 /* Useful typedef for passing around journal access functions */
 typedef int (*ocfs2_journal_access_func)(handle_t *handle,
-- 
2.55.0

