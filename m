Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794787543;
	b=sQteOdncxK6v1fknBnld+3bWOfTMsjoL0ogcgugPDuWIXifcCcqUDLvdbGnpvemRKV9j
	 1Rw16+/MJ/+GbFUThqTHenyixHF/EAQV334YXESbUdWbpZkUoou2dZ511MVk0PH2JoPma
	 uinUeiEHTRq9cjBqk9VWYL/6srIrKxucs0noQB+Si6ydpW5To0mhN7yqronGrhWBx3cZ0
	 GoVFsNUKNZ0ZzF+WgC42fpGB0nUjIRHiMY7/IX2XziU8rCyGSK7NuEEMA2XgSWjNE9hB5
	 Znoj8Tw/2uJrz9QEvv3fg2sgOcmWI9RB8SVJgLx8I6Uphw/0Pbk2P7D/iZbbG51id4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794787543;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=mu33zRxTLj/T8n79JxXB0QUEhj/+4hEOSMdZCp71jRQ=;
	b=vwGWan8vi1f4B882GXhImP1B38CeXR8Wt+WYRaOJWOSD+E1/hQoU8XY/5kQEzbod7BYH
	 SjI5kdm4NxrpVcwTCLxbqzwixpusJ/X4SPB5XTCrzP5ej+hvS7ZARmFfqyvP03dPJU7ZF
	 CCctyXaMQ/tu3TMnLj/G08doDQ+6An6ruXXE380gFwxINICwF7FkB3flyEFASuWHIohjm
	 ZnAJhiZPnvimEh27p2s+SCCXr3qo0rAdYJ4EV6atyut2hTHHLv0Ctm+5PpDLvU/VLLPtA
	 AUolAGAXWIs1iijB7SrDKAs4i14/RYJ3qM/tp+ihdy17TriWNztlNrV/AHYAgfOgPtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z3yZ+C3Q;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2AA1606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 00:05:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2AA1606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z3yZ+C3Q
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cd6acc50b8dso1279907a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 16:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794787542; x=1795392342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mu33zRxTLj/T8n79JxXB0QUEhj/+4hEOSMdZCp71jRQ=;
        b=Z3yZ+C3Qk3CDPvXN1vKdfJ8BvM371EFzMjM80P1CxjYY1iRxmdMBSe6JGD5Ab8CAIQ
         ePvcKCO8Y8lM9S82GZqQNEHE+L84vMZmnHaRixdWUO185ZxDIUlOyZL2EeAA5pVlpXHA
         flaYQw/yjSLTj5w7XEnkFh30j4zBNhx7FtONBAFXbYrEv5HW0tlqqprGST8OaDN1Hxbh
         HI6PpBf12ovSbET6hFNTFbXxwjFZBpp3kfQ3M0xXkgzdBBD/mZ/VWNyiQw3KkbFF8x36
         ugx/7XK2k47KC08hdGSqbMYM3mthr7sCT214Qs5xhf1Q0sSH0NT4EyvYGR8e+ISzNWEo
         vXEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794787542; x=1795392342;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mu33zRxTLj/T8n79JxXB0QUEhj/+4hEOSMdZCp71jRQ=;
        b=uQO//xa43Q4zPy74ecIeltfPth5hFhnHuSi647Y/8ewX2q6JOKSS2sjADi0m+Z9tXL
         2ObcwPO2RHMPCBXkoe7wQ5Rw2rGuUSBChMLSahsAjx3n5QaZnXBMbw+UgsPF3rkDIEFu
         Q05kRF6PFH31ZgHHwWRVysUt6TEm015nrEogD4hkzUxqkEOLIxCIcB2W1sbP8SiiQPsL
         8oQ1S1nwqKfDHCTt5zSSJvYtMeqFrq/XmZ1JEQb/vBXZIhKYSB32M60uFNxDK1ta71V4
         YyC7mqo7cM0iTCZ6d9Ezi/A/+it0mMSUdnl/QSp/+8gGq4GUU8FpwLABFrwXC07lXIkT
         ucMg==
X-Gm-Message-State: APuU4Z9BwD5gXxeDLGAlxJRrH8H/0Tsvj7j2zWssuiu3Rrt991/PhIL+
	2sWZFwTXpvyYpksfoMNlNiqPxZGUmbHytSmmGJ4g2mOAe/i6gIBqzMhn7biJjw==
X-Gm-Gg: AYBFou0J6taDsAPjujS3K78TN0BIUvXdaaNN0gfu/Pe0OZ6H/yCK3b+7Unu4LIHfdFG
	lViPuYs4zhF/PH4hee04ZlEcvTltSCaNrnvtN+fZWOfKyu51d0qDY9pS2csaCX22qYMQcseVa3R
	T0jXi6NZAp7Y6cXtLIaHGqlZ0IW25l7S16U9CycnZr0hqooM9DAYNUT7880MflJPbONiuXaL6Wt
	mVWqxEi2B5h5jwPqNgSWxW9f8EJkmkjSz+CIp6fucHruxygpdWUuVuUU65plKmD+qFhDrTOjUFH
	fBEtFxeqffVl2LVZpw3timQBv3FvN9YGjiYp8eo4ckzjbaYt1cWzd/b2SBcMi4CEWoIDbNaEz83
	Ossb52oEQaRjwFtmn2+COjbOfjB3pA53gIcrb1yjh5YqQEVw6k/cbxrtf6uMDhuf3MI7kdWoh+F
	YNaCclyYhkUD/xtdYix0NHnYkdKb2VYAGaDPUzdHMq14eMDxKuwKBaOcVydITNUkM/324sHdUsJ
	oyhr12AfhjF/6iEuqeoOzwq9k+7uzNF3PIGezeC5nRC/JWoed3Zv9gDcHKzGpISewmre/1aMfB5
	/NPR4KFEedSf1OOINW/S2HGwV1cF664qFTBP1rLC3vxO4Kcgj6NgBLAyZWGPyJW6qStOrGe70sO
	CBlqFoctnBY9KLiJXQrsHietzIsME1WZ2w13yMnRrsMsu1v4=
X-Received: by 2002:a17:90b:5585:b0:3a7:8350:3f7e with SMTP id 98e67ed59e1d1-3b1b0b88263mr8081903a91.44.1794787541921;
        Sun, 15 Nov 2026 16:05:41 -0800 (PST)
Received: from f2fs-test.c.googlers.com.com (193.67.125.34.bc.googleusercontent.com. [34.125.67.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c6c9c5sm18881187a91.1.2026.11.15.16.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 16:05:40 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>,
	stable@vger.kernel.org
Subject: [PATCH] f2fs: don't skip the inode update for a size grown within a block
Date: Sun, 15 Nov 2026 16:05:34 -0800
Message-ID: <20261116000534.2303800-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
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

From: Daeho Jeong <daehojeong@google.com>

f2fs_skip_inode_update() lets fsync() skip writing the inode when
FI_AUTO_RECOVER is set and i_size is block aligned, relying on roll-forward
recovery to recover i_size from the position of the fsynced data block.
However, do_recover_data() extends i_size only by a block that starts at or
beyond the recovered i_size, so it cannot recover a size that grew within
the block holding the old size.

For example, on a 4KB block filesystem:

  write(fd, buf, 14KB); fsync(fd);
  write(fd, buf, 2KB);  fsync(fd);
  <sudden power-off>

  - the first fsync() writes the inode with i_size 14KB.
  - the second write() makes i_size 16KB in the same block. If it is in
    the same timestamp tick as the first one, the timestamps do not change
    and the inode is still clean, so FI_AUTO_RECOVER is set.
  - the block is already allocated, so the second fsync() updates it in
    place and writes no node. f2fs_skip_inode_update() skips the inode as
    well, since i_size is block aligned and equals last_disk_size.
  - recovery finds i_size 14KB in the inode from the first fsync() and has
    no block to extend it with, so the last 2KB is lost.

Repeating a 2KB append and fsync() up to 16KB and then shutting down the
filesystem left 117 of 1200 files with 14KB on a 4KB page kernel, and none
with this patch.

Set FI_AUTO_RECOVER only if the old i_size is block aligned, and clear it
otherwise, so that fsync() writes the inode for such a size change.

Fixes: 3a3a5ead7b6d ("f2fs: do not recover i_size if it's valid")
Cc: stable@vger.kernel.org
Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/f2fs.h | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 50a5f845176d..b328e678d295 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3676,8 +3676,9 @@ static inline void f2fs_i_size_write(struct inode *inode, loff_t i_size)
 {
 	bool clean = !is_inode_flag_set(inode, FI_DIRTY_INODE);
 	bool recover = is_inode_flag_set(inode, FI_AUTO_RECOVER);
+	loff_t old_size = i_size_read(inode);
 
-	if (i_size_read(inode) == i_size)
+	if (old_size == i_size)
 		return;
 
 	i_size_write(inode, i_size);
@@ -3686,8 +3687,16 @@ static inline void f2fs_i_size_write(struct inode *inode, loff_t i_size)
 		return;
 
 	f2fs_mark_inode_dirty_sync(inode, true);
-	if (clean || recover)
+
+	/*
+	 * Roll-forward recovery extends i_size only by a block that starts at
+	 * or beyond the recovered i_size, so it cannot recover a size that grew
+	 * within the block holding the old size.
+	 */
+	if ((clean || recover) && !(old_size & ~PAGE_MASK))
 		set_inode_flag(inode, FI_AUTO_RECOVER);
+	else
+		clear_inode_flag(inode, FI_AUTO_RECOVER);
 }
 
 static inline void f2fs_i_depth_write(struct inode *inode, unsigned int depth)

base-commit: b9d7379d10d43386b59082da8c9a0b111e054781
-- 
2.56.0.611.g1030f0b940-goog

