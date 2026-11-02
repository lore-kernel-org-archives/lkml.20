Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793630741;
	b=hvbN9S68VA8Nj6HdXY1+ms6Ujz7x0THC41FpEKkuvJyzpvDEetJV9gEhjo9SKPBZrdk7
	 iLgpZPY0fu66WjaqHNPIp+3qLerpR6jGXhRJHYKt/op45ikjHQeBIAf/v4EH8pwnnzlNM
	 NVSOrdaDkv2F8Z661/7HVzEGSShyE0miyDcul5RkrDr9PaNullDOZBFVe8k21qxp7KYK9
	 Aqx5tIiX9apmXKP6RYs1L6/xOrNxBGrrB8ZaQ5ncWRVH/61OYhfenbkEmwgcgH2LqR4BL
	 2fasKoavPlt5zO55Gu91GGXoajL0f1hXw3Zmd6KAxLdbRdX/36Zcyxjk0HJxjaiQ47A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793630741;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=k9P7nZ/mAy9sTYdFI2IVAFhTffJSJrqtL/7R9NRlcEM=;
	b=iqCemoHCCG9IzrtLVi7fea6BkEkCNIivSVSJVODFtYrlZEZQvBsOP/Hr7a2ymuKfYq0e
	 nPzCReBMBusiozVmIWelh6hCIWLHKiU4CZ4qDgiXSUhY0SKH96YnDap3ECB3U1mIr6YZ3
	 j9Hs3Zsun1wNGt67qa21DknqmDdphdAFGNbTSdvWGGWkgyc5KTbaKyldMr8fRbkfc1IED
	 lDZlnSUyZvpnPiYHwCDy/+RsvZ0gcoC9jU8FSAFjIUYtKQLtX2fSIlwKsrOfaQeJAT+vN
	 EpLKTblfGX25R31o025wDgoc5vfIwUeaW2OY0+FvdK4eB2KUG2IZAiPIHE9xIUmwP6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TtrH6uiC;
	arc=none smtp.remote-ip=74.125.227.130
Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FBB86070262
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:45:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FBB86070262
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TtrH6uiC
Received: by mail-pj2-f2.google.com with SMTP id d9443c01a7336-2ea19bc317dso29191995ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 06:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793630740; x=1794235540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k9P7nZ/mAy9sTYdFI2IVAFhTffJSJrqtL/7R9NRlcEM=;
        b=TtrH6uiCO5nEl7McFr/iE5Ldgbm52PDyvVjuGePvWzvv0bJCpjtXcPm8LmJrqihYtA
         bGASH0WqFBvvxDi42t38uDQbRdTU/WZ2zneCuQrLjimxrnk6gKhQJZCPFzodXd5LZ5fd
         VA9xLGsszsJeG1xks5abGjh1YUsEF50GqaVYVXqzJi55i4uFEQa0kTnubXoINXLbQeiY
         Lx6cKSypQtrQ9rmJtUZMCyIvhOYiqJ+1gP/rYlLu9Do1XkiynL324f7VJN4sNOXfl3Sq
         8tV1FBpxYqCDB/JvADEeehws/6+HwJC3auV6wlcJMRyZSEA27Cuf2QYAXHiJgzekh3Iz
         f+mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793630740; x=1794235540;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k9P7nZ/mAy9sTYdFI2IVAFhTffJSJrqtL/7R9NRlcEM=;
        b=nBQ0q3Yq4Qip7fDSqBgLP2UW461gd3LWj1oyuNTcb7KCOJWUYYh1dLB6Y97PxwwWbJ
         iKOuFDA0JDobDAEtaoGTf3xy5b0geA1NsFCru/FJvJwQ5xLrpo43n86/p84YWolBqflB
         W/tretLXemUkNTcS8KWGCKnf3xZF8AGye+zZO+zI6FkhXNDnmepR6+egrYOLbCysEw6J
         EgxnjDMwcWRtA/U7ZqkrccgEfaIeuTXd0Y/U8g4d9vtrqaHgJdcO47CYv6+5KA2eKLKJ
         aTC3EUwT+1OgPJsTljpEdGApBO5B5kT2DN04zws70IOC++MKCjMCW8jGoV/9AFw6uw/H
         rg6A==
X-Gm-Message-State: APuU4Z+aI4G9X0XUSSKBuNhOYw3c0HnPohq5USCjYu8ML/WyI4ZsXHEz
	ukYCJAsnoyCd5H+VdvL34hNDwahvoncbLJKVFPU3Z+LATNeqI3X4T9zI
X-Gm-Gg: AYBFou3+/tdtQIiKhvbSwEAnQcASVZjtc10LhVZaw1z+fF6gbtzZL62OhqEUad3keaU
	gbZPVOVpT4ecsTFaWjQQ6ZQ2qylm7IGWExsgJGmwDT+R6fvsU2r5/GtP02DKUILrMCmRjas/EKn
	K9W+6NDiXLnHHy5sUf0+a98yARPAPe0nRyFZhOYUPWrSfPk14rSRasyt6E/jV1rvMd+LA3PAxu4
	FFZBt23rXVskBIKTFHP8TlSsWpFW/MpmjfMkdi7fA+ltSC9/C+vIOL51YzqeSKRvPahs8rfYvFb
	O5LXE4vZpQctp1pUSsMKmIu6o/qne9NGACttRfwVZ2AuhGedPVWOfR+oC+RGyNZitWM+mlLe6NN
	JIW1m7+1XpdU8zzn5K0k+0iYs7MpLVxtFRmexQEWn+zMoMfChwvc6yre53fKiN1iaRoasQAK6BE
	EYjH1RvRms7Nj0ho/HmuJvq4MIK452BGe/6H1iGDkiQiDEZVh5iZogPpVF/fVSpnU4HVK8rFZfK
	0kKeIb04Fk5K+JSaqGbGFneOHFuuBQ1Ogzn4s3/Myy3x/HuV391O4imm9BrMat4dRpHx/KMECLG
	r3Vg2iq6E/tuqDYJwVXF1Obfj+w4kkBdXnU4M0qV
X-Received: by 2002:a17:903:38c3:b0:2e9:5b4e:b8a1 with SMTP id d9443c01a7336-2eb3650af7dmr101403155ad.55.1793630740489;
        Mon, 02 Nov 2026 06:45:40 -0800 (PST)
Received: from WannaCry ([2405:201:a418:c1d0:90a2:f39d:9eab:aa4d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3929087csm29551055ad.57.2026.11.02.06.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:45:40 -0800 (PST)
From: Adhyansh Verma <adhyanshverma2010@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <brauner@kernel.org>,
	Carlos Llamas <cmllamas@google.com>,
	Alice Ryhl <aliceryhl@google.com>
Cc: linux-kernel@vger.kernel.org,
	Adhyansh Verma <adhyanshverma2010@gmail.com>
Subject: [PATCH] rust_binderfs: fix minor number leak on binder-control creation failure
Date: Mon,  2 Nov 2026 20:15:32 +0530
Message-ID: <20261102144532.123432-1-adhyanshverma2010@gmail.com>
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

In binderfs_binder_ctl_create(), a minor number is reserved using
ida_alloc_max(). If d_alloc_name() subsequently fails (e.g. under memory
pressure), the function jumps to the error path.

However, the cleanup path only calls kfree(device) and iput(inode).
Because inode->i_private has not yet been set to device, the eviction
handler binderfs_evict_inode() returns early without freeing the minor
number. Consequently, the reserved minor number is permanently leaked
from the global binderfs_minors IDA.

Fix this by introducing proper error unwind labels so that the allocated
minor number is released via ida_free() under binderfs_minors_mutex if
dentry allocation fails.

Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
Signed-off-by: Adhyansh Verma <adhyanshverma2010@gmail.com>
---
 drivers/android/binder/rust_binderfs.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/android/binder/rust_binderfs.c b/drivers/android/binder/rust_binderfs.c
index 5f020226720d..3f7ff0fdbdb9 100644
--- a/drivers/android/binder/rust_binderfs.c
+++ b/drivers/android/binder/rust_binderfs.c
@@ -400,7 +400,7 @@ static int binderfs_binder_ctl_create(struct super_block *sb)
 	ret = -ENOMEM;
 	inode = new_inode(sb);
 	if (!inode)
-		goto out;
+		goto out_device;
 
 	/* Reserve a new minor number for the new device. */
 	mutex_lock(&binderfs_minors_mutex);
@@ -411,7 +411,7 @@ static int binderfs_binder_ctl_create(struct super_block *sb)
 	mutex_unlock(&binderfs_minors_mutex);
 	if (minor < 0) {
 		ret = minor;
-		goto out;
+		goto out_inode;
 	}
 
 	inode->i_ino = SECOND_INODE;
@@ -427,7 +427,7 @@ static int binderfs_binder_ctl_create(struct super_block *sb)
 
 	dentry = d_alloc_name(root, "binder-control");
 	if (!dentry)
-		goto out;
+		goto out_minor;
 
 	inode->i_private = device;
 	info->control_dentry = dentry;
@@ -436,9 +436,14 @@ static int binderfs_binder_ctl_create(struct super_block *sb)
 
 	return 0;
 
-out:
-	kfree(device);
+out_minor:
+	mutex_lock(&binderfs_minors_mutex);
+	ida_free(&binderfs_minors, minor);
+	mutex_unlock(&binderfs_minors_mutex);
+out_inode:
 	iput(inode);
+out_device:
+	kfree(device);
 
 	return ret;
 }
-- 
2.56.0

