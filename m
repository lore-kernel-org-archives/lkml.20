Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792544225;
	b=QrDW6XE2s7jrYqIPLVtlqEBeAe7lpOQQwnriqdRAsJza1cBg5GFW3KUIVe/kblSpAV5V
	 5lp37Ks9HDFuzQEbL9LnlMG2bC4qA+r2Ro2iLx33Oq2mSVhnsXrPZdDdYr4uRG0RadW9F
	 U3J1JoV2ZnCZQNzi+6y4m8p7e9k1UuweVcy0l4HnEvX20xeQKrNSMIda+K6XZV8EzfIJs
	 fF5QIttTm3ctJb7wc4pSYb5zgUyRd8RlfXcDLwDwVw3ln2SmKJH6nCESjja1lIcUOBfta
	 WbAWjJWcRWaSQ0142Oxc+r2fYlS09OfONFyst6bg2d3Chl64NyNNdSkMY8LzM7XTHag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792544225;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=f/l+Fy2dbzrWLltAcQpERM4Bta0l2qgZ7duYB37iFwU=;
	b=bu+ueSCMsG96qDXoPHWB2v9s+dD14EBXDD10wOCMMIZWdN5Rd59aaXjm4WEPflolBoH9
	 NanXhsGE8U5WTZ6zM73losEj7w4tDUaf/UR8Is9rL9YzLTibUS3hIndUSBXHliQwMOb8A
	 cXIrXXqkqQ/qW6IPKR6JgXle1oyLXxACiAzTIWgauobLgfDRxxsMvxBU8OVIPKjQ/r8Nj
	 myTwhip8qohfHx6AErX02CcyxfO6J/f8LpNpddHJIMqC5QNXs+b7DPiG1BI7YHeAXdYxT
	 6H7pfc2vgWz/JAyIpHuAifsDKRVFSaK57ZmOJxD055XQI2gkinENOEz8bCK0MjR1Zxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b="TfLe/TyX";
	arc=none smtp.remote-ip=209.85.219.44
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632A5606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:57:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 632A5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=TfLe/TyX
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-91b52ba422cso2733506d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792544224; x=1793149024; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f/l+Fy2dbzrWLltAcQpERM4Bta0l2qgZ7duYB37iFwU=;
        b=TfLe/TyXR80T9bwRg14DCu0zXBLhCgFli5ugiNHkafjPz3LpToS2CoEL3DVmJahF5R
         HGTv/x3zozScqwz7VUZYqY8pNt5orniNq78dVCQGDcWm/HmCpJIpudB2C/E2hkRpIpNx
         qpmMdrzMPYav/rIRe6f5fU+VSvL2Z9K5dnEsci8uWo5AUXDR+O6OzdIMX2Y4YSnm5HVn
         +JFtyXmJH8BzNNKs0gezYfnwvYp74lqQ3BBdesFo6mslsC5An6BeWin1r9bAPUWNpy9K
         7eF8xYOJgX1dB1jTPMf1ICcPIYpuwCWvctiQvrrM4uqbkqUAc5fI98RlKEr5cgH4ExBj
         7Vug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792544224; x=1793149024;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f/l+Fy2dbzrWLltAcQpERM4Bta0l2qgZ7duYB37iFwU=;
        b=bgPrePJrv2KgCT3cdr9UTMkPk1FEAAQZS/21f4j8wKDhnewUCdXbQ+FAFRQAbbFSv0
         phXTcLve24eJ9T7sFbASopqvD32W8uKmiC3I4bUvzZbKYzaLc8MlRh7ZMHMZxbYSNyTb
         A4JDmlKbQOeEwFuP6cbI2VzzOy9kE4H5a0mtFnqyGL5SJDZk4V4KB9KOQ/DwwK65GFMz
         BGbw46ZmPnTBKGG/Mb9InBdhTh/JpwOe2SSwdD9tAJv3SW9JwuD2tuFcQkYnz8QQL/Ew
         Ykx6i6z4tuiC7AsfZzbuGEOPgPWT826prgFuSF0L7QOPYMTU/hzKS4aKdyUnyjc55HkD
         AnVA==
X-Forwarded-Encrypted: i=1; AKwUvBy6plkuJOr+KAZeXqaaCPZgsQMGIyQHinqv7KJF6yCvEnRWxKX7j6TCmhi2Q5UZzDx3EporrzYry71i/20=@vger.kernel.org
X-Gm-Message-State: AFq9FYKt3kXRmfXO+JV2XaLOftdyhF8rVgs6fqJw1GsfsoLwCw/QX6uk
	cyG5Sfze7Ls8gUp4guNrP2IfZdUi5Ehoui90qXp3+8EKpe47PFb0SwdVtzZ/gTwgnUk=
X-Gm-Gg: AYBFou1tWQV/E6f5ZnMnGA0nYeJSPXm2qaJwM14K7iUaYuFScFNxn5PA90FkDD+Igxo
	5AUPDD6E4ic/gd5t7YC+A+TiloxxQ2SM2BVByv/DhADhnAENxzrEaOv//vlxMbDcEEq1Nu8Unj7
	wEcX0Gj3kI8TYtrkGqSpVqIBeODNVWBEi2KaQkAfhK6xWHtvU9tHVBnK/zX/I/gtHMYC05ApohZ
	aqIDPXhi8YNmIi9NVWywdkFvLzhsIJ15RZP6829xsnuMaBE5rHYMlSRqHN+WUqDT+Cfw8i6uWep
	MrdPxQqmBZaQNLgUDRWOYnQo9HqWiI9lOurmBzamXNqHPlQPoFq9W3RbaOUZyMEDVDD3YmsSgn3
	34LPE+/Wfh3EY5Q8pQ7yoKQRJ6NLha2fPE4pVosvYXfSsrTCNtFtguP+bJpSgs1slaeZT47FPz3
	9aVD1arR/O2iurHEjyq+KMNL4YU64WXIc9lgZyQ62FtZqYWw9vX2h4B8BRBOh9g+h8SfvyXfSBl
	ylKMU6eux3F5A4B+3VCWINwxGTrQMx8asno5lBGC+JCYrdbv6sEgWB6UjPPCfSVYE3V3g8L
X-Received: by 2002:a05:6214:c88:b0:91b:5d39:e145 with SMTP id 6a1803df08f44-91c12f3e4c6mr9642536d6.58.1792544222603;
        Tue, 20 Oct 2026 17:57:02 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c10c3b500sm11596586d6.35.2026.10.20.17.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 17:57:02 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Wed, 21 Oct 2026 00:56:38 +0000
Subject: [PATCH 4/5] fs: don't sleep on s_umount of a superblock being shut
 down
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
Message-Id: <20261021-b4-super-lock-dying-v1-4-2b35e86706ff@toxicpanda.com>
References: <20261021-b4-super-lock-dying-v1-0-2b35e86706ff@toxicpanda.com>
In-Reply-To: <20261021-b4-super-lock-dying-v1-0-2b35e86706ff@toxicpanda.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792544204; l=3950;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=QpMNlbQDw7A3trBZOrUgix5MhZvB66B7kwe/i702fNk=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QHCN27hnDE0SxN9Wjz0bzU5o2aa3F12UQg7N0AP9PjiVscoxWl0S8ms8CrmOutSHIoFDCSHgBxS
 U4u6p1/fEJgQ=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

A slow unmount holds up tasks which have no business with that filesystem.

deactivate_locked_super() drops the last active reference with s_umount
held for writing.  generic_shutdown_super() then writes the filesystem
out, evicts its inodes and calls ->put_super(), and only after all that
sets SB_DYING and drops s_umount.  On a slow or unresponsive device this
takes minutes, or forever.

super_lock() doesn't take s_umount if it sees SB_DYING, but for the whole
of the above it isn't set yet.  So whoever walks the superblocks sleeps
uninterruptibly on s_umount until the unmount is over, then finds SB_DYING
set and is told that there is nothing here for them.  One stuck unmount
this way takes along, among others, every

 - sync(2)
 - write to /proc/sys/vm/drop_caches
 - quotactl(Q_SYNC) without a device
 - quotactl() and ustat() on that device
 - BLKFLSBUF on that device

The outcome of that sleep is known when it starts.  s_active reaches zero
only under s_umount, s_umount is then held until SB_DYING is set, and
nobody gets a new active reference once it is zero.  Check s_active first
and fail right away.

super_lock() and what is built on it are local to fs/super.c, so its users
can be listed.

Those who need the unmount to be over wait for that on their own since the
previous three patches:

 - sync(2) and BLKFLSBUF, which can now be killed while they wait
 - the emergency sync and remount, from a workqueue
 - fs_bdev_freeze(), fs_bdev_mark_dead() for an orderly removal and
   filesystems_freeze(), for which nothing changes

sget_fc() waits for SB_DEAD in grab_super().

freeze_super(), thaw_super() and the second super_lock_excl() in
do_thaw_all_callback() are called with an active reference held and never
see such a superblock.

That leaves drop_caches, quotactl(Q_SYNC) and delayed_superblock_init() in
selinux through iterate_supers(), cifs through iterate_supers_type(),
quotactl() and ustat() through user_get_super(), fs_bdev_mark_dead() for a
device which is already gone, and thawing: fs_bdev_thaw(),
filesystems_thaw() and the emergency thaw.  They have nothing to do on a
superblock which is going away and promise nothing about it.  They carry
on with the next one as they always did, only sooner.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 fs/super.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/fs/super.c b/fs/super.c
index 9baaaa3256b2..9f76b399f3fb 100644
--- a/fs/super.c
+++ b/fs/super.c
@@ -104,16 +104,29 @@ static bool super_flags(const struct super_block *sb, unsigned int flags)
  * creation will succeed and SB_BORN is set by vfs_get_tree() or we're
  * woken and we'll see SB_DYING.
  *
+ * A superblock which is being shut down is not waited for, see
+ * super_wait_shutdown() and super_wait_shutdown_killable() for that.
+ *
  * The caller must have acquired a temporary reference on @sb->s_passive.
  *
  * Return: The function returns true if SB_BORN was set and with
- *         s_umount held. The function returns false if SB_DYING was
- *         set and without s_umount held.
+ *         s_umount held. The function returns false if the superblock
+ *         is being shut down or SB_DYING was set and without s_umount
+ *         held.
  */
 static __must_check bool super_lock(struct super_block *sb, bool excl)
 {
 	lockdep_assert_not_held(&sb->s_umount);
 
+	/*
+	 * The last active reference is dropped with s_umount held, which
+	 * stays held until SB_DYING is set, and there is no getting a new
+	 * one.  All there is to find at the end of that wait is SB_DYING,
+	 * and it can be a long one: the filesystem is written out first.
+	 */
+	if (!atomic_read(&sb->s_active))
+		return false;
+
 	/* wait until the superblock is ready or dying */
 	wait_var_event(&sb->s_flags, super_flags(sb, SB_BORN | SB_DYING));
 

-- 
2.55.0

