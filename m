Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794113907;
	b=tuhoaE/EQRsLP9ZdI73wLpYlZM5szWZm/vtbpXlGU2ykP9awNdBcmUqsBTkW8eYY+u0j
	 E8Do6iucTjZjAtlj22qQqi5+jnuDTttOyWEIGtYGY5jj16vtJNoQnh/yzePhUpN0PI0Tt
	 sbOLx4dt6h9Qh1cvZKbtDXaJbt3WPJuzVl7HuoBXVm6ZxB9cY0iMdxGm3TuwzcV94Kfyu
	 T++ftiWyTOBEuVmoirzS+oWiH3uWhxN/TldPxCS3fznJ9g4IOJTL5MhL8VF1HFLTzNG4H
	 Z3vjKcLoIx7r1LsK0+6AQF6hOW1PSDgp1m8swDNrS+MP8WPH4dYt5ett/RqMgG1HYnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794113907;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YZMUNPvQ0rtHsvJc4nk6mZ/thcoAv894KnRs3yMAZ8Y=;
	b=rTdvlCGUyb9J6ZKT3weaOvqYSX18xa3Sr4QG/SXhnXl/5Ds/UhVv/CX5zY9R3Kjuj1MS
	 K8cZSO/XHfPAU95eZN+5fIuEJJvIfLmCaiDIVLvF0wFPoVosMy9dBX7pwYZKW46vfl7Eg
	 rWmFJV8eXXAMB/VDz0uf4fn69IBLWc8ghPnbW83cWhVrpg8kbgAIzZalS8jdbUlphEnH1
	 IYPzCNKCKIFK06ZwgMt8tHxGLliJI7n1+gtn/rsFvX/9rjYg4sfRvGPdwWota++GPSWwD
	 31FRy/4nN/9h4RMJwry5UQAeBI9mM7g6/43ldZANvP2UlcYXAoIUi5AgWhMbyz/doEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lBFkj0sk;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8719A606A31A
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 04:58:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8719A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lBFkj0sk
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-35eaf84cc66so293942eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 20:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794113906; x=1794718706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YZMUNPvQ0rtHsvJc4nk6mZ/thcoAv894KnRs3yMAZ8Y=;
        b=lBFkj0skJ+23Y4sZV9rOQsuE503KScJazRPXjdLZ+aXL20soXIZpzdyr/SMghpZhlR
         inRFyHXFkbNGBKpM00spCMu/PmZlXkN4vVTOEAAduvBbKS5RChglugA+vZ3HY+8iRejL
         Zd2di3rY6XmmVZZhzsgjld5dEDZlSSI5HUaaoHT2v97HRqduqEsFC1D74QYJCWb2ovcT
         zU+taE8XhWCRsCa3V39viSbK5ySGlUx5h5aGmSUJG/FctEf7mpax1UVJk00IloGOIOjl
         wdnEHJQuyql2M1s37ZdGbekkMnebWGMeuzGymCyo+e1qDuAcGUasoUBNY1xb05IoUYaN
         Q5Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794113906; x=1794718706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YZMUNPvQ0rtHsvJc4nk6mZ/thcoAv894KnRs3yMAZ8Y=;
        b=nGoOVGa7vqRKTOd2LqUai2CNpWn9rFa7nW8hU0v5e52tytF0NPY0zaP210yCtqSOT3
         /xLSuqeyVfL8RHZ04kWbMj+gaJKtKOs4Hw7XrcXcpKy7lUkQewtEA//OU52y7NTC/oBe
         CWj+2wB91IssoRl5QytkYr/JFpWh8kYveeoOZO7qfgDd6vubuNw/aBthTXY6FGUvswmy
         dV+koPxgSQcmdV0rjmD6k7MskfWaIXrBD+dw3t6yOcrL3afLbWLozDG/fy5KZRPtkQdH
         yE3qNHBb3ASboRtkWtIkGCJjODljxCcBVwJgBRA/ZAgi/nTXDlWtbPcnxHb1QWAKQbNc
         7h3A==
X-Forwarded-Encrypted: i=1; AL+hErHLZbYvgmNANSuVy33ioTKhll3jAeFvZPn+D4vgJUprc4X2EeOUXVQnk6TDbKy/C2bWPXL6nBRR+WCHxjs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+C2npA6uzzQcdWcoQ4BbSh6tBHdJbLLKRdgh0i0PwZa3zPsJ68
	RawHlbYpYTeWOl/TvZlMh7oBUWveRDoDQGG5sCSpE/SJ9mJGMrSORK+hHJty191iNwQ=
X-Gm-Gg: AYBFou1RrtyJoxf7mEWdk9RomilmFjpbSVBq7/i55qsV5X3MjdgMGB0sKzWBB3lOEwf
	JJ+Wsq0GN4ebdSAkDU4oNk3VV+YOKUYpG+PWllWHxJYcvxTpQ0y+LuWj6t6fDMg7XE4p52ZzinU
	u01X5nNFDsiPQhRLiZdUh7crAcdLL3D3NJys98KXEOVjxT234FP8zjoZVP+BGz2Kd1Fg+HDajHR
	y1l+XMEtSzoItk9yUQOAbDUYPiEwJcBYs7XLKamIMDhwFirXsu6kzfgM0ve3lcvQy7Z1OEMz/FG
	6KH6oz52PVbZNFxY7AyMF6dYQL2IoHhRC2U/gc/R9K+swwCoWfv4WeLJ2zpPK8Samxcfa2B6Z3F
	1jQGygP+hYGO7bmd/pp1pZVDKOosdxHH/tW30wojgi/v2khpZQG6DYBHwT8qGs81IRrdtjZyS8p
	EUZIVrYhVYuiY3rrug0An5g+WeOrbDdyXh374mPfsAU8OeeOVYlJ035CNxL5UmqkUhEcHQHEyaX
	d8Tll5u3qE8pAEvya9bYlROFEY7t8+exn7hwlxKcZ5fhLznvtTuVuFIDX0g09svVLKBfO3qZq8D
	GvDau7RCSk/pZGF0S1sVjJ9eMKmFB138QiOdyKQknoYhfQ3Z8BMbUFhoG5zeHx5KQllT42rlhbS
	G4v65pFnJ9F1fVZnHovkfZM1vusKymPALl/ykqA==
X-Received: by 2002:a05:7301:182d:b0:351:2958:1740 with SMTP id 5a478bee46e88-3725ef0fdd0mr1483806eec.37.1794113906404;
        Sat, 07 Nov 2026 20:58:26 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265618e11sm2471388eec.7.2026.11.07.20.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 20:58:25 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: daehojeong@google.com,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH] f2fs: require inode ownership for ioctls that change per-file state
Date: Sun,  8 Nov 2026 04:57:22 +0000
Message-ID: <20261108045722.12091-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
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

F2FS_IOC_RELEASE_COMPRESS_BLOCKS, F2FS_IOC_RESERVE_COMPRESS_BLOCKS,
F2FS_IOC_SET_PIN_FILE and F2FS_IOC_IO_PRIO change the state of the inode
behind the file descriptor without checking who the caller is. Any user
who can open a file, even read-only, can:

 - release its compressed blocks, after which writes to the file fail
   with -EPERM until the blocks are reserved again or the file is
   truncated to zero;
 - reserve released blocks again, which consumes free space;
 - pin it while it has no data blocks, after which writes that extend
   the file fail with -EIO;
 - unpin it, so that garbage collection may move blocks that a user of
   F2FS_IOC_SET_PIN_FILE expects to stay in place;
 - set its write I/O priority hint.

F2FS_IOC_SET_PIN_FILE checked inode_owner_or_capable() when it was
added. Commit aff7b628ac2d ("f2fs: set pin_file under CAP_SYS_ADMIN")
replaced that with a CAP_SYS_ADMIN check, and commit b13bdf03bb80
("f2fs: allow all the users to pin a file") then removed the
CAP_SYS_ADMIN check, leaving the ioctl without any permission check.

The atomic write ioctls require both FMODE_WRITE and
inode_owner_or_capable(). Requiring FMODE_WRITE here would break
f2fs_io, which releases and reserves compressed blocks through a
read-only file descriptor, and Android, which releases them the same
way. Require only inode_owner_or_capable(), as F2FS_IOC_SET_PIN_FILE
originally did, so that only the owner or a caller with CAP_FOWNER can
change this state. Users can still pin their own files.

Fixes: b13bdf03bb80 ("f2fs: allow all the users to pin a file")
Fixes: ef8d563f184e ("f2fs: introduce F2FS_IOC_RELEASE_COMPRESS_BLOCKS")
Fixes: c75488fb4d82 ("f2fs: introduce F2FS_IOC_RESERVE_COMPRESS_BLOCKS")
Fixes: 5f95c1812a65 ("f2fs: add ioctl to get IO priority hint")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 fs/f2fs/file.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index e2c0f5083313..0730de36554a 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3664,6 +3664,9 @@ static int f2fs_ioc_set_pin_file(struct file *filp, unsigned long arg)
 	if (!pin && IS_DEVICE_ALIASING(inode))
 		return -EOPNOTSUPP;
 
+	if (!inode_owner_or_capable(file_mnt_idmap(filp), inode))
+		return -EACCES;
+
 	ret = mnt_want_write_file(filp);
 	if (ret)
 		return ret;
@@ -3982,6 +3985,9 @@ static int f2fs_ioc_io_prio(struct file *filp, unsigned long arg)
 	if (!S_ISREG(inode->i_mode) || level >= F2FS_IOPRIO_MAX)
 		return -EINVAL;
 
+	if (!inode_owner_or_capable(file_mnt_idmap(filp), inode))
+		return -EACCES;
+
 	inode_lock(inode);
 	F2FS_I(inode)->ioprio_hint = level;
 	inode_unlock(inode);
@@ -4235,6 +4241,9 @@ static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
 	if (f2fs_readonly(sbi->sb))
 		return -EROFS;
 
+	if (!inode_owner_or_capable(file_mnt_idmap(filp), inode))
+		return -EACCES;
+
 	ret = mnt_want_write_file(filp);
 	if (ret)
 		return ret;
@@ -4430,6 +4439,9 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
 	if (f2fs_readonly(sbi->sb))
 		return -EROFS;
 
+	if (!inode_owner_or_capable(file_mnt_idmap(filp), inode))
+		return -EACCES;
+
 	ret = mnt_want_write_file(filp);
 	if (ret)
 		return ret;
-- 
2.43.0
