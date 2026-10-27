Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793135402;
	b=VG0myqlhvE9XyLoEfz1PKPgo6A8wRHJfFtOyvjtbVbeOai9dCcYSDcqBXztyiM4J0M0w
	 vNKyTcSmhuGuTwMubXDzmrR7SUby5e0ATOSdJsZ1zDIfKktj8fvq13nkih02mNQeU+i3s
	 uddS2wy65A42TUPJeIVGL9Z15aYZ0X92oBtYsFO2atBj7xH21nck9R0Qhm72Hn5O6K2GZ
	 sGZGrMeAR9KWYYSs1sCcWRJfV8mFeTrePDLhqW2rO/dKjFrRMr4oL5YnSEihH7hV+r4g1
	 hfKnKZhRct3oAF7gHMNxFRKaWq7frB5d/T6ChsV8wT0GzMEv2aWNNzRjN0/q8p1IMPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793135402;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=k4HHmOZ6mNUHOL8ZbOmgmPLSMmblgWC/9NXQl1ZSrSc=;
	b=MaNjwAkB4P7KDwNeQJwINmK86MG/YaEEPlR1DcuPcKQKCl6VBl79I1BBgW1fNdDb4xwW
	 QxXXGAcrP0d8PI6xYGai8Frx53qqngvbynBCjUPQ3iNRygLZJ8Ek+VYcG1sWQrsJUW+kS
	 AXItxgjRrshs8o/WY7zXNzFzujQQnSY4sDdq8g/iuEtkhJ+t074ygX2KulAfo3YKP3kLc
	 ZSoHQ3yrTKEiBCkTMURnrjXMMbipiPTF10kWjxBr6b+etaqCJgQRasLca7UH+3Lwfzcjb
	 zy73OxuCXox8nWeV5uKTZLZyLHKQPvz+8cze1FiWijMu8Cq/HUaJkvik0TOz0/U50vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=oQteWviM;
	arc=none smtp.remote-ip=209.85.222.179
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606F460A2611
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 21:10:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 606F460A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=oQteWviM
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-93f20b304c0so19283085a.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793135401; x=1793740201; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k4HHmOZ6mNUHOL8ZbOmgmPLSMmblgWC/9NXQl1ZSrSc=;
        b=oQteWviMGtV0KhdbB9TFVFlDBQVv9It7ZHakoCb+sBNz9tYjUY+RB///aEQCM6ZCN4
         dEypVWGl1FrU4k2TgVCz9QhyMP1osFxD+7LXrAYOhMiZVMyvww3gg3J0ZUAhP6hNR8E5
         v1XNYSLPVNkzCB+apvOhv+vy63ozDJj6IjDasPg4Y1n25rYqmU6M2ObYrsvYWqV4Lq28
         74HTt+yjTHhG2tkLJEjJATE7m+wpCNcqWedXG/7yjC2irZHJMzE020Lb5UtMnbgdTcfg
         C2MpUOUECjdcGLWik340InwKukltaPPeTyXbC1cFz0ay/LeYBg3fbONqKzmEixVHgi3A
         4haw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793135401; x=1793740201;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k4HHmOZ6mNUHOL8ZbOmgmPLSMmblgWC/9NXQl1ZSrSc=;
        b=gAQxh16aDgro1PPEC60vm5roJuC/2fF02ryZzhr/K1C2TOc6AMOu5A6B5jLPOTwtd6
         mCTikpOuu39JV/mVDj7CJ1DEc74kGK8o753DeL5KUqyEmqdUwNWHpW4ff/SX3MlHzyZI
         qxVlhuRxms0bGA6vqlCiV2opBxkiRn01V4Vz4gar3wrYicIeOxOquqYnnx2MCSNk+4sc
         BDTxYrgeptLnr4OEetMmuCw8Hci4RKwL3KjSoXIBx1acRAWnq/qelXdl2+hKf3Y9A84B
         qTjh1b9SGWIDF+Sla+R8ieZOrxBdzuPTD3le9VpKnf3XQWZJmE1FsuDdEoy4vqU8vPC2
         8wkw==
X-Forwarded-Encrypted: i=1; AKwUvBxiqT67J6r78QEuoyM5SB5WWa9aQM1ykkE0Ah1BSE0JeeNmlCF9w955qgqXp1bwbElR0n+0pnN9oaC1vEI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKoRywhk20hG3zFqPUVOoegmvoKqa1Dru2Qq0/Kw+uKlXVOGOvg
	R4Q8C7PV6ZwYQfkfSMWQKHb3S+zD0O6BZRb2xLzwaSutiqTtwr4Wia+2UP8ctHyIxmI=
X-Gm-Gg: AYBFou1hkYzqIApngabGEKI/dTy/liXto26Sej0NXb8FU3tjrj2Yzn84P3XX2UmPFTB
	/iub44eoi6eaucluPWfb4gepdO2QAajq9XF3DqTNyUDmaxprf5jRdkDU7QPAmpyfbupQE10eZX3
	Ni9kzLSUMF4jZ7rcLAYCOVlRtf/E078DBme47zWMC2j63vxV3j9ubC2RDvVOw4JdPtEEcxZue50
	VtJQrxHJS6a16LoVaYyFRvlssbE08Td4iU4aMlvi3Uk0m4nSw4Dno36OTFt8II0X8zql6QqfPir
	IMkv70XNE1y++3LvdNhztvibHgEyy6wOp0uK8KzWHFw/8KogjuQdpwc0GGIXkPbWJXyO+5wC3Gp
	TlAxS8OXoe3luMzti49hMKtLhSkamhq8qBvV3hwftLoDJz0x5VHHjcZcmwLPWXEac5oXWdHIP9q
	N/QyCpKXLHNOKfeNCSXhFccMoK7nIlkIjmO5hE8Rex4xrS5Hk2cxva26NLHf0aOCOuKNb2m+Odu
	NGf6PJEiaDsUfGRAsZC7Y3qoE3lLGWwRkqa8x5mf0BV8XzwRxOLYjHdb1/jm9cLNyLfQYPt
X-Received: by 2002:a05:620a:448a:b0:93f:57c5:3e38 with SMTP id af79cd13be357-94408ca85d4mr27973985a.65.1793135401459;
        Tue, 27 Oct 2026 14:10:01 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.240])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f05b1adbsm1074267285a.4.2026.10.27.14.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 14:10:00 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 27 Oct 2026 21:09:36 +0000
Subject: [PATCH 10/10] ovl: implement containerized syncfs for overlayfs
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
Message-Id: <20261027-b4-ovl-containerized-sync-v1-10-802e512379a6@toxicpanda.com>
References: <20261027-b4-ovl-containerized-sync-v1-0-802e512379a6@toxicpanda.com>
In-Reply-To: <20261027-b4-ovl-containerized-sync-v1-0-802e512379a6@toxicpanda.com>
To: Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>, 
 Christian Brauner <brauner@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
 Theodore Ts'o <tytso@mit.edu>, Carlos Maiolino <cem@kernel.org>, 
 David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>, 
 Chengguang Xu <cgxu519@mykernel.net>, linux-unionfs@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org, 
 linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Chengguang Xu <charliecgxu@tencent.com>, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793135381; l=3432;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=tPzhN58YiIrLhBjuyTwIEUWLvPBIcRV5B2AthoXKXO0=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QAkzMgrx3qGFlvfLs1kYuCrwYhdEXRCkcL/cclwqAObhjnVDqzxeVhWp/xnHvuj4/UNr14KUhUL
 P1GRlEWu2Og8=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

From: Chengguang Xu <charliecgxu@tencent.com>

syncfs(2) on an overlay and unmounting one call sync_filesystem() on the
upper filesystem, which writes every dirty inode there is on it, whoever
dirtied it.  When many containers share an upper filesystem, stopping one
of them writes out the dirty data of all the others.  That can take a very
long time, and s_umount of the upper filesystem is held shared all the
while, so one remount or freeze of it which queues up behind that stops
everybody.

Now overlayfs can only sync own dirty inodes during syncfs, so remove
unnecessary sync_filesystem() on upper file system.  What remains is to
have the upper filesystem commit its metadata, with ->sync_fs(), and to
write its block device as sync_filesystem() does.

That is for an upper filesystem with SB_I_OVL_USE_SYNC_FS.  With any other
one nothing changes.

Signed-off-by: Chengguang Xu <charliecgxu@tencent.com>
[josef: no wait_sb_inodes() on the upper filesystem, which waits for
 everybody's writeback: an overlay inode stays dirty until its own is done.
 Only with SB_I_OVL_USE_SYNC_FS.  Use sync_blockdev().  Return the error of
 ->sync_fs().  Nothing if the upper filesystem is read-only.  More in the
 commit message]
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 fs/overlayfs/super.c | 44 ++++++++++++++++++++++++++++++++++++--------
 1 file changed, 36 insertions(+), 8 deletions(-)

diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
index 631f68a97980..c570bf7103f8 100644
--- a/fs/overlayfs/super.c
+++ b/fs/overlayfs/super.c
@@ -15,6 +15,7 @@
 #include <linux/seq_file.h>
 #include <linux/posix_acl_xattr.h>
 #include <linux/exportfs.h>
+#include <linux/blkdev.h>
 #include <linux/pagemap.h>
 #include <linux/writeback.h>
 #include <linux/file.h>
@@ -269,18 +270,45 @@ static int ovl_sync_fs(struct super_block *sb, int wait)
 	/*
 	 * Not called for sync(2) call or an emergency sync (SB_I_SKIP_SYNC).
 	 * All the super blocks will be iterated, including upper_sb.
-	 *
-	 * If this is a syncfs(2) call, then we do need to call
-	 * sync_filesystem() on upper_sb, but enough if we do it when being
-	 * called with wait == 1.
 	 */
-	if (!wait)
-		return 0;
-
 	upper_sb = ovl_upper_mnt(ofs)->mnt_sb;
 
+	if (!ovl_tracks_dirty(ofs)) {
+		/*
+		 * If this is a syncfs(2) call, then we do need to call
+		 * sync_filesystem() on upper_sb, but enough if we do it when
+		 * being called with wait == 1.
+		 */
+		if (!wait)
+			return 0;
+
+		down_read(&upper_sb->s_umount);
+		ret = sync_filesystem(upper_sb);
+		up_read(&upper_sb->s_umount);
+
+		return ret;
+	}
+
+	/*
+	 * For syncfs(2) and for unmount, sync_filesystem() has written the
+	 * dirty inodes of this overlay by now, see ovl_write_inode().  What is
+	 * left is for the upper filesystem to commit its metadata.  The dirty
+	 * inodes of everybody else on the upper filesystem are none of our
+	 * business.
+	 */
 	down_read(&upper_sb->s_umount);
-	ret = sync_filesystem(upper_sb);
+	/* As in sync_filesystem(): ->sync_fs() doesn't expect to be called then */
+	ret = 0;
+	if (sb_rdonly(upper_sb))
+		goto out;
+
+	if (upper_sb->s_op->sync_fs)
+		ret = upper_sb->s_op->sync_fs(upper_sb, wait);
+	if (!ret && wait)
+		ret = sync_blockdev(upper_sb->s_bdev);
+	else if (!ret)
+		ret = sync_blockdev_nowait(upper_sb->s_bdev);
+out:
 	up_read(&upper_sb->s_umount);
 
 	return ret;

-- 
2.55.0

