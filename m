Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E50E2BE034
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 14:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789913239; cv=none; b=XkNKglV7HmVM9NAJuLyZYYWFKDvkbpYAHHElPJY/1lO8sFRAQAaOoQbXAxohKChuaoRF3i3XDLDsY4I6puOZ/s6Zp7gwTWVMmcUeGyuLC9KZyNJ8FmIVje/ThIDaDTmJW8M/YRnahMQrYMXtbWZxTpprqVapZ/sc3R2GP7C9j3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789913239; c=relaxed/simple;
	bh=N9zgMZUmRtGjeQkwy9uC7pOTrkEICynCHJ4xdsK23WU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tSKen6KQIMJI+GiaQSoAlB6E0+F5Kpmh6pMIeqC+Ffb8MV8Kzp+ElNBNxpEAHRl20yrEHuC0ObovAv+ygBVfI6Q46f/WELHx2scs3b2j90OuoOeXEaDk5+MWmK68pJ2NvNmcmRBDj5YBgnDvjYedmSG68XALbOHbctiP80X7sBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HTy4mpcQ; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HTy4mpcQ"
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2ddaa08c890so19740355ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 07:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789913237; x=1790518037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LGAc0ce7w1GSttHp685etQ7+sb7oh3MesfpogRplBgc=;
        b=HTy4mpcQc9vW6BFIMsQf2UYeIiWbQv569Km/X9+3E9p3M9fCpMTF356GmVbnqBYpRV
         +vcaHMoFrot20rVM3lIchQ+zQM7BC5QLlUB0B0ym580oaY5r1C6ju0KY8BCnnEorlhCn
         oyZ3RjbJ2AyeUwCw4s6Oc8Uf7AF50vl9NXHG6Ovz9kuBHG8RJ/i8yOXIrMZC/bYMJCI3
         aHtXXHwj5PNtnnY1jdahur6BCArXeUmkqPyhELZLNkAuN3Vp8Hj4R7C0x8Zq5bdXFdE6
         KA+Y0E2qjDxhNOfgoveP8Ldo5bv5L5uNZJJChVQdCwd1pLQzGMRZ2HORyHkmUvRD4MB+
         sCMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789913237; x=1790518037;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LGAc0ce7w1GSttHp685etQ7+sb7oh3MesfpogRplBgc=;
        b=OJgn/+XnLTRph7WwrmECldpxqzuEpLzcx4b5UvBxK8IE54ywOQrFEg1d9zs5Jx6WJ4
         8ORhYe1m+kycKruVIi/r4oELCUtcERPTHSERxH5nHd/viGjg2NHNQ0IWf52dJBbg2xhI
         MMMmzUPiqdpbfrSBfhxRTjWfnJiPZzKvXvjBWYgrVwZ9BBjjn3NqyA1HOqQOH9iZIOjY
         RgraVQol28WSnF/TABNQ2KLW5a/CBv+yQiamgpzkr6f4E7ptPD15LX6zU/9Eyz7wkL0K
         v36knekV09zoFjJu/2XBl1qIEPH2E6q5EM7E8AVSwl0LJJk0ei3MlrHEG8r0ZsW4PnT7
         JwsQ==
X-Gm-Message-State: AFuF++lNRTrr2+yIlKrQ2w7DgLANpXa3PlbysGwS74gPo3miZZuLix9m
	Wiu6QSBNo5VCHEaZjxnfMaKht7f1biKvoFtS3kasBpQnjyekk/pfoWYP
X-Gm-Gg: AYBFou0ucaAx9NaKgYZBfFJ8oVvdjwQkeFPszBpWuu0Miy2LSXimY6e8yoyvRTBlx04
	YaREU6EM7hwT+z0HhbjspXsQArF1toXN5A7fxtXKQBwS/vjQpF/IpFMSBRhwVNcAaRY9ogp71oV
	5V+kC+ua2tVzwLVi+kaj/gVz/Goun1HXiL/ldamBPv4Q4aovZMXmBDfTx/T+XvqjqQnk857q8BJ
	/hKrur4UKmFPgo+f7vJCCOHAK64Umgf/BCb8w1bbneOfkLB8WKO1QHe+3HhxgmpW6gJsPgCFB9l
	8mWrPkWdS1YOrGEd4OXy+l43wZxxcNJiZ2ux9H/gkkNKsKWBBdIWTSTA5YSNIfjdMbukvw4LBFE
	P1cs6QOkqzdsjPPeIr57Es7nygl5jyqTPzxwv20g86a5y2q2TVjKJnB7hTR4ExHsVq4NTPOW/0D
	KfLMyvWu/NFfIrTqut3ZHYUO9+YFbvB7/VIuhPna0MWRNlG1cs3W1eu6Pd5SPlcpkrwJyxwSdJ4
	x2n7j1DsowzhmI=
X-Received: by 2002:a17:902:e747:b0:2d8:d4cc:be63 with SMTP id d9443c01a7336-2ddb1bb4722mr116046595ad.16.1789913237123;
        Sun, 20 Sep 2026 07:07:17 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d4a:e90:2022:c2a9:de8:d005])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc178701csm20516355ad.13.2026.09.20.07.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 07:07:16 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: mark@fasheh.com,
	jlbec@evilplan.org,
	joseph.qi@linux.alibaba.com,
	ocfs2-devel@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
	syzbot+03aaa576f1daa1c1f2f0@syzkaller.appspotmail.com
Subject: [PATCH] ocfs2: validate chunk and block counts of the local quota file
Date: Sun, 20 Sep 2026 21:07:10 +0700
Message-ID: <20260920140710.43938-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ocfs2_local_read_info() trusts dqi_chunks and dqi_blocks from the local
quota file header.  If dqi_blocks is too small,
ocfs2_extend_local_quota_file() computes a bogus chunk length, extends the
file, and maps logical block dqi_blocks, which is already in the inode's
metadata cache (the header or a chunk header read at mount).  sb_getblk()
returns that cached buffer and ocfs2_set_new_buffer_uptodate() hits
BUG_ON(ocfs2_buffer_cached()):

  kernel BUG at fs/ocfs2/uptodate.c:509!
  ocfs2_extend_local_quota_file+0x45c/0x1100
  ocfs2_create_local_dquot+0x8ac/0xb50
  ocfs2_acquire_dquot+0x614/0xae0
  ocfs2_get_init_inode+0xe9/0x1b0
  ocfs2_mkdir+0x174/0x430

ocfs2_local_quota_add_chunk() has the same exposure.

Reject a header whose counts don't fit the chunk layout or exceed i_size.

Reproduced with a crafted image (dqi_blocks = 1, chunk 0 dqc_free = 0);
syzbot has no reproducer for this report.

Reported-by: syzbot+03aaa576f1daa1c1f2f0@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=03aaa576f1daa1c1f2f0
Fixes: 9e33d69f553a ("ocfs2: Implementation of local and global quota file handling")
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
 fs/ocfs2/quota_local.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/fs/ocfs2/quota_local.c b/fs/ocfs2/quota_local.c
index f55810c59b1b..1c9afe38e40e 100644
--- a/fs/ocfs2/quota_local.c
+++ b/fs/ocfs2/quota_local.c
@@ -245,6 +245,25 @@ static void ocfs2_release_local_quota_bitmaps(struct list_head *head)
 	}
 }
 
+/* Check that the on-disk chunk and block counts match the file layout */
+static int ocfs2_check_local_quota_info(struct inode *inode,
+					unsigned int chunks,
+					unsigned int blocks)
+{
+	u64 chunk_len = ol_chunk_blocks(inode->i_sb) + 1;
+	u64 min_blocks = chunks ? 1 + chunk_len * (chunks - 1) + 1 : 1;
+	u64 max_blocks = 1 + chunk_len * chunks;
+
+	if (blocks >= min_blocks && blocks <= max_blocks &&
+	    blocks <= i_size_read(inode) >> inode->i_sb->s_blocksize_bits)
+		return 0;
+
+	return ocfs2_error(inode->i_sb,
+			   "Quota file %llu has bad info: %u chunks, %u blocks\n",
+			   (unsigned long long)OCFS2_I(inode)->ip_blkno,
+			   chunks, blocks);
+}
+
 /* Load quota bitmaps into memory */
 static int ocfs2_load_local_quota_bitmaps(struct inode *inode,
 			struct ocfs2_local_disk_dqinfo *ldinfo,
@@ -733,6 +752,11 @@ static int ocfs2_local_read_info(struct super_block *sb, int type)
 	oinfo->dqi_blocks = le32_to_cpu(ldinfo->dqi_blocks);
 	oinfo->dqi_libh = bh;
 
+	status = ocfs2_check_local_quota_info(lqinode, oinfo->dqi_chunks,
+					      oinfo->dqi_blocks);
+	if (status < 0)
+		goto out_err;
+
 	/* We crashed when using local quota file? */
 	if (!(oinfo->dqi_flags & OLQF_CLEAN)) {
 		rec = OCFS2_SB(sb)->quota_rec;
-- 
2.43.0

