Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794487757;
	b=WQJBVw5L4uRFP4cDDnVh59v6zEh0F5PZDlPhKjLLL/tde4Pi5cdakq9sAJB5Y1ZgG7Bs
	 h/HP2WBOi9e8uqqe41maXihAAssDtvGnncq6ShrJww+dOEsfdMpUl623QTN6Scgn8U+l+
	 kVtMLLf8vK6pg61iePWHx0x4N/s07KXq8pCNt7yVowcJ7bJIcUiascOLSOEQm7v9Jn4m9
	 YEoEaDQFXwI/SKR/fFn5jkHCJNarzXi1/ei6QS2snfcHumO7K2FYY4GqS2eIlSj/2Yv/+
	 7cBB9SvTIGd9yD7w9BBHVsq3Bg81i3W88UaPgwWe3UzO3YEPg8ZrIbEGytUCwXNh0fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794487757;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GP/sqeTHNOnsr03VKalftM5sm2xJbcWlNAUV3dWIgzM=;
	b=oEJVoVuwSh4vpIq/I3M0T+jUErbkVffHwlwyyXdhFoaOGmgbTIZt0bYlY3+xsyuhXnxX
	 E6OBOHfs4XEAqIJJcuRPzB4keHLxcmhZzVziybmk2AcfFYXr6WSYh9MPeFaHoHFAO8Ea1
	 dMRYku5wF7vF0S16OVz1nBScBDXu2CZPKfo9hoR3IOmSXE5ZserjOK/pckJuWubBl7bkx
	 r1gGlMO6rEPQ4sUimvJn/lNsDFXFK9TqG+MkWe/fnUIqTzi3uweKlivis8fXAMk29vcTC
	 IQpaGWxkGku3B4pOWHvrGzFy/wuM3DiCeUTYSdE2IZVUMHCjvAz2cV8NExuEy0f6iqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tJM+CvfB;
	arc=none smtp.remote-ip=209.85.160.48
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA84C606A893
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:49:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA84C606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tJM+CvfB
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-4ad60ec5eaaso752004fac.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794487756; x=1795092556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GP/sqeTHNOnsr03VKalftM5sm2xJbcWlNAUV3dWIgzM=;
        b=tJM+CvfBnK6ez5A+5cixlhaCf14yZlDGolLiXLpu8clT7DjboHI3VkU/tXO5CYOW4a
         6cu6ppRv3kFNSVduw2MoaFjKWB2VkkLoiX79pxeudu1kmJzJ7wqf5zBsGe+Yqgg8k0rF
         TwKlzrBOIRyzmwLdcN2GjvlR6diA6LC0PlAd/3K2RhFVNEm6DfXonXqhYM6PR8B8RZmh
         Lp0keCfCyZyJTEeBENN5cDekv3ui4o3msR8Jg9XEKvwCaMBSzNZPgG5zPT/gEZJZK8Ul
         hW8Iz0kPbPq6ep+x/0XNXRfx+VD4/F/ikFFKTrkZjyEcCek6fYJ9mrPr++OCm/tlONXs
         vv9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794487756; x=1795092556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GP/sqeTHNOnsr03VKalftM5sm2xJbcWlNAUV3dWIgzM=;
        b=EU5kxN6cLp2xxWERF0Fm146moFRflyr8rNGob4acDGfGizfuZXdE0BRFT1El4Pm+v3
         EatQEhbq/L4DWVKoieReWX222DjT+opXtue0iWUUhcMJ93zgrOzugQlVP4kKO4KE5dXc
         A2TU9EIc0Fv/K+e8+A/jm276axdIaa3KDWPM71PwN4ihhfSHUJ/08qtBmlq9Lu/mPFVv
         tEUPJCMCPJqPEKQrIr56zUY24uG8eyZd4MDpAsYUTydU+jucr0T5PWQbOUagoxzDRtrW
         +zZLstIvOKf6kq63ngOyIz0EBiYBDPmu24Gibb/vR5COn0jXV/MXvKigO1jPPAiP7iZs
         Qfcw==
X-Forwarded-Encrypted: i=1; AL+hErGvWV5ZSmmsqcVmcP3lod67jUhRwBBHvyyQGA0DHmcL2MG5Shp0r0EfbKA24HVyr92ydrhuTjsvonG9o/I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+m3Jn2oMup4VUuiQUxFfzJlUJhbNF1fQTfvFtWEYctYmJzCe/T
	k/ikL+t824jobf10w59zm7Ls3qdFEBvwNe8NCIautMu9aKlxNemYu55B
X-Gm-Gg: AYBFou2l9h9rNo9SoTOgKQPn8FJTfnuew6bm7CKg7DsFkRQuZ65o+MM0Ar23KYKZTZj
	CxDeK5352HzPGV1rcDb/E/BUN3fAPJiHj7gcr06hFiOspnniQj1rEMIFuli4qkDo8Kq2v9g3Rzf
	SCFTJbqm7BtzRId/zDqD8aoqdqTIDA+duF+YX4d+1OKvg7BuHkX2h/c+Coed00CrhpbeB1NLqoV
	1fQ/Vr5stCvooGUAjtLrDSb/jnmIw51PGrDt1TmU9d0Lh2+/Y9AZm9QRb9ma1Q8y7kWKzjGGem1
	R8k2V012VtquzyYCC5+/ekAHyxfz020O6/JVVU19/91S4L7tCKjUq172qyDKYGLE+e5TPbaIDDT
	J12PxaYtMK+LitKskPLqSzZmziKoUX8/6q7i2M17y7FelwBG+t18XP2C0iFXweOZDRVbiYqoaLz
	KXqWtx1v0MM9C8NUBJgxZBCykOp7k+89/7a4rSoHZIN/s8ZmUmi3W3fmxSgyzfQ4ZbmVCPCHLTP
	fnEL6rkP8qhHNxQ2Y+kugHZLYNy2OeGWv9KR9xW6KHt6dTusEdfw8NnJreimnQUg2y7awWeoOF1
	WFGBBxU6lSa5mUFVimI08aShMVKTDy3QqkHKwhI=
X-Received: by 2002:a05:6870:c28f:b0:45e:d645:e03d with SMTP id 586e51a60fabf-4ae63f762c0mr1576883fac.11.1794487755660;
        Thu, 12 Nov 2026 04:49:15 -0800 (PST)
Received: from TheRealOne ([152.58.138.3])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ae23031a4dsm4819028fac.14.2026.11.12.04.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 04:49:15 -0800 (PST)
From: Chandradhar Kumar <chandradhar.2003@gmail.com>
To: "Theodore Ts'o" <tytso@mit.edu>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Baokun Li <libaokun@linux.alibaba.com>,
	Jan Kara <jack@suse.cz>,
	Ojaswin Mujoo <ojaswin@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Zhang Yi <yi.zhang@huawei.com>,
	linux-ext4@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Chandradhar Kumar <chandradhar.2003@gmail.com>,
	syzbot+f111db4cb2acd44eb2f4@syzkaller.appspotmail.com
Subject: [PATCH] ext4: wait for tail page commit in ext4_truncate_failed_write()
Date: Thu, 12 Nov 2026 18:18:32 +0530
Message-ID: <20261112124835.114888-1-chandradhar.2003@gmail.com>
X-Mailer: git-send-email 2.56.0
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

When a buffered write fails partially (e.g., due to a user page fault)
on an ext4 filesystem mounted in data=journal mode with blocksize <
PAGE_SIZE, ext4_journalled_write_end() invokes ext4_truncate_failed_write()
to discard newly allocated blocks beyond inode->i_size.

If the updated inode->i_size straddles a folio whose buffers are currently
being committed to the journal, truncate_inode_pages() attempts to
partially invalidate that folio via ext4_journalled_invalidate_folio().
Because JBD2 cannot unmap buffers belonging to a committing transaction
on a partial folio, journal_unmap_buffer() returns -EBUSY, triggering
the WARN_ON() in ext4_journalled_invalidate_folio().

Unlike the standard truncate path in ext4_truncate_down(),
ext4_truncate_failed_write() does not wait for the committing
transaction on the tail page to finish before truncating the page cache.
Export ext4_wait_for_tail_page_commit() and call it in
ext4_truncate_failed_write() when data=journal is enabled before
acquiring filemap_invalidate_lock() and calling truncate_inode_pages().

Fixes: 53e872681fed ("ext4: fix deadlock in journal_unmap_buffer()")
Reported-by: syzbot+f111db4cb2acd44eb2f4@syzkaller.appspotmail.com
Closes: https://syzbot.org/bug?extid=f111db4cb2acd44eb2f4
Signed-off-by: Chandradhar Kumar <chandradhar.2003@gmail.com>
---
 fs/ext4/ext4.h     | 1 +
 fs/ext4/inode.c    | 2 +-
 fs/ext4/truncate.h | 3 +++
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
index bf0325ecbec7..cc714d7b292c 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -3215,6 +3215,7 @@ int ext4_get_fc_inode_loc(struct super_block *sb, unsigned long ino,
 extern int ext4_inode_attach_jinode(struct inode *inode);
 extern int ext4_can_truncate(struct inode *inode);
 extern int ext4_truncate(struct inode *);
+extern void ext4_wait_for_tail_page_commit(struct inode *inode);
 extern int ext4_break_layouts(struct inode *);
 extern int ext4_truncate_page_cache_block_range(struct inode *inode,
 						loff_t start, loff_t end);
diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index e3129353d4ed..366345981438 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -6819,7 +6819,7 @@ int ext4_sync_inode_metadata(struct inode *inode, struct writeback_control *wbc)
  * buffers that are attached to a folio straddling i_size and are undergoing
  * commit. In that case we have to wait for commit to finish and try again.
  */
-static void ext4_wait_for_tail_page_commit(struct inode *inode)
+void ext4_wait_for_tail_page_commit(struct inode *inode)
 {
 	unsigned offset;
 	journal_t *journal = EXT4_SB(inode->i_sb)->s_journal;
diff --git a/fs/ext4/truncate.h b/fs/ext4/truncate.h
index ce84aa2786c7..19ed4673284c 100644
--- a/fs/ext4/truncate.h
+++ b/fs/ext4/truncate.h
@@ -17,6 +17,9 @@ static inline void ext4_truncate_failed_write(struct inode *inode)
 	 * We don't need to call ext4_break_layouts() because the blocks we
 	 * are truncating were never visible to userspace.
 	 */
+	if (ext4_should_journal_data(inode))
+		ext4_wait_for_tail_page_commit(inode);
+
 	filemap_invalidate_lock(mapping);
 	truncate_inode_pages(mapping, inode->i_size);
 	ext4_truncate(inode);
-- 
2.56.0

