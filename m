Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793850266;
	b=NGbcWGq45FhBnAOgSIIsvDaxbVeMutcJdt3Ri25SeKFR0i7jTp3tpTZo9Bj5rhtONJyu
	 /XBJKMgiS4iRXWh3k6yqa80qjyKsYCkGOLBxOlNobcUYbiNbCP+LacOvsaAl6dYbYmnRV
	 aYXETOyjCFVWXoZcvIbXljXR+YCoaYNeEUYbIC0YTyNjT4kDjwHMESPIchEsw/+/Xfv8f
	 j6TpN9f242leRsp7+tGoxUnvbxoFW0sgUDseni0Q6j1EEWiLqBZllcC/uaeBMzyOVC8lV
	 ICgZOVn7G2vz95NEWIB7OgpM7jcpA5c2ba60H4HSvGI6lW8Felna7RHUED59mi7OSsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793850266;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PVB1DrB3lcAejFSUkzSavFgFkaENftsrN7fvqCjWIpI=;
	b=SXP1D595lzE9I3NHMRYld1S4IjyvHDFINMOCu2m4V49tKY06zI12W+Je0EEpUdNsfeGy
	 1vq6YQ4+PxpMySVrUNwIxxIJnnPSRsWwd/1QRZivFO1MFrSPNq4n0XFWLzm2RGJe8+x5I
	 vy4vA6/htT8fYi4YZJ6lB/ThyJUOEMk7nMt+GbsJXZa93Cpn21wbaFPEqwHwAOTojxLRA
	 BhaI53r3799eugKNqyrOfeAWaqCfBfJFb3m+F0rWyzrwyx9DalvjA6T/9CfNppJ3CfSh9
	 1e5bXxUuS0574qwePAeNt1QFAdlEBR/QfpmfxkfSbsJARz6p4dLnqI52m/rKnMY98sQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n03tAv0b;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8447606A337
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 03:44:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8447606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n03tAv0b
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35c76e9614aso1894805eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 19:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793850265; x=1794455065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PVB1DrB3lcAejFSUkzSavFgFkaENftsrN7fvqCjWIpI=;
        b=n03tAv0bLvX1IMHOEvD0Vm0wgk63qaogfucIK/BExUM5QiQtQW9dfwghvi+pjcq5jm
         g4e1zv+w446kj4EAq51kCM7c2c+LmwAJwm8F7egm1iaUTrwCo0c6708J5Zu1kDUbPRn7
         mmIwqFnMEn7QOKPFBqzzuzUOKKkqwvwTZIQVbz8jex0GCvUkZGG3aIbSSkAq53Zc5huN
         qEEaQ262MjZwWSgwyV+aDoH1lN+1NaC3Vnsz0165NAbssMliernr/CHNCmuGEXrIPhC/
         N3gb0Cng/TzFKMpZCeo1luXmlTdTWkZxhg8H+QihVeDfAu5mNx1ahvbvGT6hfbGw2lu5
         yHDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793850265; x=1794455065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PVB1DrB3lcAejFSUkzSavFgFkaENftsrN7fvqCjWIpI=;
        b=eN9frX+m6WSoF8pkziGGhY6U96i3TuY08IrJpbXngeVFvYocYSJcA8Bborxb6rfDPQ
         meeG86nB2HeSy3/D+nA7Kv8wHdP+tjv4BQ+9bNOcyajdwvZkWlkyZ87VsKdYydpU+nb+
         JZ/y4ROWQ3Lnel305ntQeEylcHcRmAijdCUW32vrgdmG6lsQICJjFneNfRFbKXUUFJMM
         8MlOIufBTZhqKkBdyJHH8ke74MGTzZHVBLqP4Oa7gE2ITcJDguvE/RzL5UpiMOyd9MVT
         vqBr4WVK0uBdQBQpIaALYK3f6PjWdtLqrqta1ayY7uRwGwRBM6e2YbqxBJiSIQF/0z+0
         7O5g==
X-Forwarded-Encrypted: i=1; AKwUvByPKBYqFv0oNI4wtRSAinKLpDjg1fLSKaUhEkqXI04n1CZMIgpY0nbwrgxKwGsqAOUr8FwMnC0KYqNAFts=@vger.kernel.org
X-Gm-Message-State: APuU4Z90Sb8W/TnosTG3kyapjOnb6+pwLNm/uDcW5A+JKVh0w/ibmGTc
	/vM+Bz5vqDGe3YQ1dcmdu3fLiwfGmQvWHaw2eSI310sTDciWS69KTVv2
X-Gm-Gg: AYBFou0Zghk4GmmbZ54ua9Nf9Qwp2t39hso4s7fMEqudZaP6aOs/g7y5yZCL9RcHTSu
	ujMuXY6V9whDdTJmoxu3WLEP1aNKwqeXlgKi55qcMTuk/m+ErDMLxYxozQqOXrb8RdSaSC3Zn8O
	bKY4nZP8EnsREe2JhWeTylNho06XOiz0Itcr8HLEbexuVjVWNzdfN/qQ4D1jwow3CXUf9AR6Sok
	e4CuWI2LRUa0S5aVAsQEtexBz98qHiwFcGwHzuCzLzvyXoIXypBkknXgS+koiI4ycPcilLsFL0v
	1dIoHZDSh0APLBEAT3SW6uMD01yGNmrxLdSZmnObeNkU/dyz8z0S9zBMKGUqN54S6nICjTzINLl
	fPzfAn2zXFtibihMMLH2Zl2BnqAhiBHyRKi5s3Or0MwySsqP5KopaNBKPEt2BoYkKTwndgPVb1t
	ZY5fTAP0SeIt6q753nSNzgdngroZbrZmuc68W81e3BWkwG+jgJu9bmcXW+wdU7ZMkmirV+auqoo
	SOZvEDv/ENIFbifm5NzR9Y3ZWuGXFsaAQxqKhpUNPfAdbRGbCU3YpDydbezoI+D0ufgwaAAcMeX
	PiUAWpV7tAKA0N2Sg3CwDtWexuqrMhylc69boCa/PdUKtq8=
X-Received: by 2002:a05:693c:20c1:20b0:369:f70e:bd40 with SMTP id 5a478bee46e88-36a4237cf7fmr26430282eec.16.1793850264521;
        Wed, 04 Nov 2026 19:44:24 -0800 (PST)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca39c5f0csm11370113eec.29.2026.11.04.19.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 19:44:24 -0800 (PST)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Guikun Yang <yangguikun19@qq.com>,
	zhanxusheng@xiaomi.com,
	stable@kernel.org
Subject: [PATCH] f2fs: don't BUG_ON a missing orphan inode at mount
Date: Thu,  5 Nov 2026 11:44:19 +0800
Message-ID: <20261105034419.2701443-1-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_B30A444DF94444D1A63A7D6F8E2039F1990A@qq.com>
References: <tencent_B30A444DF94444D1A63A7D6F8E2039F1990A@qq.com>
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

From: Zhan Xusheng <zhanxusheng@xiaomi.com>

recover_orphan_inode() treats -ENOENT from f2fs_iget() as a kernel
bug, but the ino comes from the on-disk orphan block. An image whose
orphan entry names an inode without a NAT entry hits the BUG_ON at
mount with CONFIG_F2FS_CHECK_FS, or a WARN and a failed mount
without it.

To reproduce, unlink a file while it is still open, sync, crash,
then change ino[0] in the checkpoint's orphan block to an unused
nid and mount:

  kernel BUG at fs/f2fs/checkpoint.c:967!
  RIP: 0010:f2fs_recover_orphan_inodes+0x6a3/0x9a0

Treat it as corruption, the same way the entry_count check does:
fail the mount with -EFSCORRUPTED and record
ERROR_INCONSISTENT_ORPHAN for fsck.

Fixes: 8c14bfadeac2 ("f2fs: handle error of f2fs_iget correctly")
Reported-by: Guikun Yang <yangguikun19@qq.com>
Closes: https://lore.kernel.org/linux-f2fs-devel/tencent_B30A444DF94444D1A63A7D6F8E2039F1990A@qq.com/
Cc: stable@kernel.org
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
Tested in QEMU on f2fs/dev with CONFIG_F2FS_CHECK_FS=y:

  orphan ino   before            after
  4 (real)     mounts            mounts
  1000         BUG at mount      -EFSCORRUPTED, s_errors bit set

 fs/f2fs/checkpoint.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 1ed38c668fc5..e57904a33ff8 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -960,12 +960,13 @@ static int recover_orphan_inode(struct f2fs_sb_info *sbi, nid_t ino)
 
 	inode = f2fs_iget_retry(sbi->sb, ino);
 	if (IS_ERR(inode)) {
-		/*
-		 * there should be a bug that we can't find the entry
-		 * to orphan inode.
-		 */
-		f2fs_bug_on(sbi, PTR_ERR(inode) == -ENOENT);
-		return PTR_ERR(inode);
+		if (PTR_ERR(inode) != -ENOENT)
+			return PTR_ERR(inode);
+		/* The orphan area lists an inode that does not exist. */
+		f2fs_err(sbi, "orphan inode %u does not exist", ino);
+		set_sbi_flag(sbi, SBI_NEED_FSCK);
+		f2fs_handle_error(sbi, ERROR_INCONSISTENT_ORPHAN);
+		return -EFSCORRUPTED;
 	}
 
 	err = f2fs_dquot_initialize(inode);

base-commit: 9b12299b437e0cc3ebf402e7b36a89cc69151238
-- 
2.43.0

