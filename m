Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530283;
	b=awjZQqn8bWUedrZQLTur0wI1kxvr+unawsLnNX8VZopa/Hb/9GqW+joNOvRid5PucpCZ
	 2IKo+XjmCo+eW20H3WxNCY4OIcL8IolPd6f1RRJRVMhecEcPr8WW4dCFo9eD+jC9491A5
	 hZCMDoNU3yDjVAEGZPt8bS18TJcAYBdC94dVb4NLXIuZsXlm+NRH5tHW1E9s78UEC5E7X
	 Q4l1FswQELDBd3/O615dtvmN+GMtrQ7+xfZixh9jUKzEpQvI9Loz6LTIlDhZOrHdasmnd
	 08WbTl11GqLZUD+bn0QoX7b+qEYqr14lhmRsmaIXuPxbWw7ipg0W3P3NlOjMnhDwoUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530283;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TmhPabmk4V5KcMSPRK/OfQ2JXZzmDv9LEr+le+m5Hhc=;
	b=CLXKrpDOZ1emK8nVNc7xgwIVadJ0MwdOL2gwkAWcQMZp2zI0s01OUy/2bQS+WT+if1Fp
	 QGUVcxMdlm1KriFzxUrwnMPwCxWztIX5nbc7+2Q+dphbnck0NQ3mb97N1PUuBquonqI7H
	 5rhwRSddW0dXnOf9BfwUcw3R8IMGq4FyUSKR/6YIib//7zOAGyQRwBfGyV9En3DKvmrcV
	 RlPZ+9Lq3tm1rcX3XhohY5IblOHyCWXya8X9fS1RRg6byGH9ELN0UYxv1MYz3AQR8EdJK
	 d0yz/auaeCShQt0ZZjTr7Dd/uuwGTdI5bSrhSBT4lYy2vhA/HZ5wCcOBq5cCSXUzWKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dubeyko.com;
	spf=pass smtp.mailfrom=dubeyko.com;
	dkim=pass header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Rbogv6Vh;
	arc=none smtp.remote-ip=74.125.224.43
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE4160A382E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:38:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AE4160A382E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dubeyko-com.20260707.gappssmtp.com header.i=@dubeyko-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Rbogv6Vh
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-67c6f1019a3so512302d50.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20260707.gappssmtp.com; s=20260707; t=1794530282; x=1795135082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TmhPabmk4V5KcMSPRK/OfQ2JXZzmDv9LEr+le+m5Hhc=;
        b=Rbogv6VhsyZFwdkg8FS6gSssCsVqR1tgJL4N/h0qUG7A6vXzvETfhL3c+Cn0IetF+u
         Kq8Emc+/GwebvjPmGonHEbBecwFuXDlj6abryZSdQWJI15OR5KnsyywKlQBrtm5zCjVp
         /dOOkGeNSbsldtDfKrIZbVfCP3fApWJ+HVWS/nV2G4H7GttbFWi/6jvPMeuT4TkfGqdM
         hjMRTvFmwZIha/wTV6Pg9WsAvDCZQgfMs25vgf/9b/3p+DeT2iE4/3B8l72hsZfPaTT0
         eQO9GPUYrlWHC5lCVPIjfX/mi9yAgfDuRC+M52EGy/HFQHS/pE1gneQ3od8zgX1cVKxC
         U+hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530282; x=1795135082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TmhPabmk4V5KcMSPRK/OfQ2JXZzmDv9LEr+le+m5Hhc=;
        b=Ri/SRexjanBZDD++tpDleh1MlbSyRaebnj7cL3+kEGJkUlUh9bdM4bpmlVHc5XxFnU
         xLE0tZZA0aVAMKiwUiL01kVEE7NfeD9D+mQQz25DTk/fDXG3nF3EJdfJnVmwtYV20+39
         U8+i5VJIvoy2d3PyNVKaSO6A7zYTSe+BpVtPAafi9BaR3LbZkkM1bPS+gOCe4oqWebgH
         U1gbtehetVHatRR3XbBX5yscdKqu/3nr6y0geNopOEfSkknVV5w8CQysgPH23inCM9R9
         lN6q2DnD30j+Ud5Yu6HGLu8IGs94um2tl1C/i31y2bu5ODjelGPCAMZJgI0fcn8fgp2T
         KgTg==
X-Forwarded-Encrypted: i=1; AL+hErHEFuvylrias6KFc+Mt0BWSq42aB9n9oEoJvipfLY/M50Kl+vj9DUx+vq9nFXgtms3YUeYhGN9NDvG4DpU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Od/MWqLBQf38EACEHoUpEtUSjmyRkvCLt6+xvmZVF8LvUkF40
	8vUotI8tmEblbEV2lo9pPoj8lK+OzgLP1nVZPTPwkFiu1ybyVpCuGA4P0RHFoTMMzwc=
X-Gm-Gg: AYBFou2pcrO8VeskPUFaW10AMlPUNevg5KX4sY9CT4ckQJ1o8wvGvQ/NBI4VoR0DlSf
	jDso06zatkSPkTzl+kBU9PMCLKy3E87RRzraRgzy+jK4tvtDyL/XvRVmsTrcpiOTsyx9RljpJjU
	gXWvzKS0YVjT45AUfzvZZrgQWk6KByl3RMhycA+GhkzfMVNUF9ZjWhsDsbY6ZHzW9sKHm+Fl0n4
	DTMzEKsexPgfmk3lqMZtgSP6YUMv88aGGpWuP7O8DVVf0797s0NABCrgtgQAn2fiH5MwaDs5Cdv
	OmtfL9Mlr6DxF+LLbqcWPw11CIowQGS5ub443zAvOwH2xDA9kj1q3C/jWw6YZY2GsPqZQfe3xqZ
	tBK0igVZV7J7EeXKccb3VXobE6XYbajCWE5j/EFq3WnEY9OKmcK9zWTmWsnbARkXmo7tNLsyRS6
	FJnEpuWAWDIsljtHUFhICjIHNii6MKvZx+tgUiIlQehPhsmZ8K23ZiTQY54jTVJ44XPU7x7cEKu
	l/ijymA9eMDrCR9ECCvXxiY13nScd9HsqwyJWqYMH1lAbl5nPrzb7uyD1tr+ior/aC2OuTQQA7o
	36Uj2fOgvXcEUJj+nTwzwmXyINvh0BQ3OLfcMLlpS2Pr40ctbzKIH5euF0tPlrjoXJNXMx5iQEX
	8uUbPBnysMKfxHBezVjeW7jXWcp9m9x2BXZpP7Re4Or3MzOk2KfYf4AaIBrIZay8f4xT1Gls=
X-Received: by 2002:a05:690e:419a:b0:67c:cab:bd71 with SMTP id 956f58d0204a3-67d896ea1b2mr429723d50.106.1794530282261;
        Thu, 12 Nov 2026 16:38:02 -0800 (PST)
Received: from system76-laptop.attlocal.net ([2600:1700:6476:1430:3a31:6c95:5610:70f6])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67d8a59e70asm706463d50.10.2026.11.12.16.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:38:01 -0800 (PST)
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: glaubitz@physik.fu-berlin.de,
	frank.li@vivo.com
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vdubeyko@coreweave.com,
	Viacheslav Dubeyko <slava@dubeyko.com>
Subject: [PATCH 1/2] hfsplus: don't take inode_lock in hfsplus_file_fsync()
Date: Thu, 12 Nov 2026 16:37:55 -0800
Message-ID: <20261113003756.1066989-2-slava@dubeyko.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113003756.1066989-1-slava@dubeyko.com>
References: <20261113003756.1066989-1-slava@dubeyko.com>
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

hfsplus_file_fsync() takes inode_lock() around the metadata part of
fsync. For HFS+ it is not needed, because everything done under the lock is
already serialized by other means:

- sync_inode_metadata() ends up in hfsplus_write_inode(), which is
  also called by the flusher threads and by sync without holding
  inode_lock. Concurrent writeback of the same inode is serialized by
  the writeback code itself (I_SYNC), the extent record is written
  under hip->extents_lock, and the catalog record is updated under
  the catalog b-tree lock taken by hfs_find_init().

- The catalog, extents, attributes and allocation file flushes are
  per-superblock, not per-inode. They are guarded by the atomic
  HFSPLUS_I_*_DIRTY bits and the page cache of the b-tree inodes, so
  fsync() calls on different inodes already run this code in parallel,
  as does hfsplus_sync_fs(), which does the same flushes without
  inode_lock.

- The volume header is prepared and committed under sbi->vh_mutex
  (and sbi->alloc_mutex in hfsplus_commit_superblock()).

So inode_lock only serializes fsync() of an inode against write(),
truncate and setattr on the same inode, and against another fsync()
of it, without protecting any state that is not already protected.
Taking it there also means that fsync() of a large file holds off
writers of that file for the whole duration of the b-tree flushes and
the device cache flush. Other file systems (for example, ext4) don't
take inode_lock in ->fsync() either. Drop inode_lock()/inode_unlock()
from hfsplus_file_fsync().

Fixes: 02c24a82187d ("fs: push i_mutex and filemap_write_and_wait down into ->fsync() handlers")
cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: Yangtao Li <frank.li@vivo.com>
cc: linux-fsdevel@vger.kernel.org
Signed-off-by: Viacheslav Dubeyko <slava@dubeyko.com>
---
 fs/hfsplus/inode.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/fs/hfsplus/inode.c b/fs/hfsplus/inode.c
index 5fa72b465922..8073fb99217d 100644
--- a/fs/hfsplus/inode.c
+++ b/fs/hfsplus/inode.c
@@ -370,7 +370,6 @@ int hfsplus_file_fsync(struct file *file, loff_t start, loff_t end,
 	error = file_write_and_wait_range(file, start, end);
 	if (error)
 		return error;
-	inode_lock(inode);
 
 	/*
 	 * Sync inode metadata into the catalog and extent trees.
@@ -429,8 +428,6 @@ int hfsplus_file_fsync(struct file *file, loff_t start, loff_t end,
 	if (!test_bit(HFSPLUS_SB_NOBARRIER, &sbi->flags))
 		blkdev_issue_flush(inode->i_sb->s_bdev);
 
-	inode_unlock(inode);
-
 	return error;
 }
 
-- 
2.53.0

