Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A821595721
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789655044; cv=none; b=XRNxuwDGiCmYgBs5GpGIX1xWmL8xxMbKiVgBfM/XddO/PB2B3arv6NEwHOFPIoMukXPi+jkzevdtUxrT75474D0MIy05MidnlbMFrlQgM53YYgeXAYZacItUAu6ls2wAP1JqwNzwonDZtBdvOggeUjBBGX7Qq2AYeVsjK/lsOPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789655044; c=relaxed/simple;
	bh=FjlnWPIx5y429CqcIh1t9J/qE8xAtJvW6N/FaKhhntM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XqQKUFPjtXs/7zrdEy1KIwBdECbAMKQIJGAa4hEOfNf1dqvojW24EYSj0gFH7O0B+nHX1ZLjrxWC1JNxB2u5ooR6Gt9H7L5YA3qZuTwKTo8NKNp2CvsnQNQsKa2KNMwEFXCG38OK8EPRoLXKqk5+gypf9QtCIZz1YLFl9SR9UwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X0MollIM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X0MollIM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A63C31F000FF;
	Thu, 17 Sep 2026 14:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789655042;
	bh=Cdva6YpF/Ja+1yjzpPsUXCUumY3O2u6hUMGtR0VRNpo=;
	h=From:To:Cc:Subject:Date;
	b=X0MollIMPRneb9S1Dc5mWlLOeAeV5sc0w8LGstnzb4Z3p16J/udWOCiDjGiDb6nB6
	 kc3V3uyJ9uG52wFSxTwqUrSu6rC1u5pO0TTmqUqCIRv9C/yB7H8fwv0gsScPK3m86F
	 E5HCpVk2js3bPdnRnGjF1QQxO6nWnySUj5SAJbBvs+hrvid8fRnsy7q2bveLi8VHH3
	 reLJYhJ0St9MQf6jzmVMfvn6dSoAX9TrBHW4SkX0Rs/3PO6DniGu5Gsz/Gb3u/eNFK
	 cqepOPT5zUo6alNheK5SybThILWKSoGWbseUBTRPsilpKyzRvRzrU0/6S8yTQUUV3h
	 Ps58AhixZQHlw==
From: Arnd Bergmann <arnd@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>,
	Jianan Huang <jnhuang95@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Kelvin Zhang <zhangxp1998@gmail.com>,
	Daeho Jeong <daehojeong@google.com>,
	Eric Biggers <ebiggers@kernel.org>,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
Subject: [PATCH] f2fs: quota: fix unused-label warning
Date: Thu, 17 Sep 2026 16:21:42 +0200
Message-ID: <20260917142222.1591270-1-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The newly added label causes a warning when QUOTA is turned off:

fs/f2fs/super.c: In function '__f2fs_remount':
fs/f2fs/super.c:3142:1: error: label 'restore_holder' defined but not used [-Werror=unused-label]
 3142 | restore_holder:
      | ^~~~~~~~~~~~~~

Fixes: 3f140a60c92a ("f2fs: quota: fix stale lock holder on remount failure")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 fs/f2fs/super.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 6a2f09c61dcd..8358cdefa859 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3139,7 +3139,9 @@ static int __f2fs_remount(struct fs_context *fc, struct super_block *sb)
 	sbi->mount_opt = org_mount_opt;
 	sb->s_flags = old_sb_flags;
 
+#ifdef CONFIG_QUOTA
 restore_holder:
+#endif
 	sbi->umount_lock_holder = NULL;
 	return err;
 }
-- 
2.53.0

