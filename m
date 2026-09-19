Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC31839769D
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 22:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789856789; cv=none; b=twnDH7NxXRG/7Of4YDRsjcY4ovPuwShUVB33V5nTfaBx0byHnVsUuctJhHCXZ5PnhzX/yt2DujJJeuigkWZvayi+7fIGi9hzBpAmtNAhoqRiuK7KWhrQ/fP+W3cdwJAlb2DESOYfKQr6i6d3U0H2kaj0cI4f/l4yMyiEaVZNSB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789856789; c=relaxed/simple;
	bh=zR4t99CYAsLI0djHo2z8cz0yCPrSn67PlOAYDuXCYpo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VK3+YBA/ntY856yreNZmL9zmLCzlggvPEbkNz+ok62byPjbB4jA15mag/tgQC9zPg/SFFMNEXcevHIKT58mSSEaOuiHqNdKL5/h5QwyqK3K2D0MgFmuTc8G3SpEy2DS7WIihWPc+zLkXqc3q+R0i0IARL2sbAsIh/gvfNhMOsC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K1EbJvpA; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K1EbJvpA"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-396ccafb74fso1976434a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 15:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789856782; x=1790461582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZibClg4eBO/Uuu2Z7cDjM1jfMqw59kTdM9Cu8D3vcV4=;
        b=K1EbJvpA7w5hrzmglx5fXfPq4VdGntEkuMY4f8huxZY1D+juB/ChQBBWTGOwh4BqrV
         v8JZylslDC/VppGKsdt9o1xkHYy3YhYXydteQ+b6iyUL1rs4m/ntaeS+gWj4xb+a6OcK
         /3UjIKU50Un0dSHUILymKtAXEIH42ce5B6ygbZ3OiSZDr9ImTqGa/CCwF9KpF4M0+tOb
         EufNbcnyTNxFaamWegwy4+p955B901zthH/jxvRvXHaNLE8HoI8K1bOwiBEHBUvmlLJt
         D7mvzAm1So3O/YtoUfKFQ2i/TJTsK+wcvKhctdyhTJmys9X2RTOfDX7nvxqgwatMbxUV
         EazA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789856782; x=1790461582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZibClg4eBO/Uuu2Z7cDjM1jfMqw59kTdM9Cu8D3vcV4=;
        b=vAMMghbOMO99TWubDJs73C8zNrTXGyoacvxBt2NmHiZnV8X0EflWfdNaAZpT6iJfh4
         NrEHOkvUtIiGP9rfJeJM0wsmArJSc2W+c8ckr5Fwp7nIsNjUutUP48rp5OAsMQpIKz7I
         OtVuyqhpjOcWKm842Gb/kJBsm3v4zfFOHSTTouP0sMDOrwpnEk3C8q0PgIZjk8hRqbfH
         hy21QBiB7pXL2ECguzCI0NWFIqvtQKnK0xmoLi1VnuU2p9vP5i68VIRfId4QUuXaSRoc
         ouSrp/+3yum/eEhp6gSG0ubWnyA8AkksD7bYFrN+s24rNltkgor87EBsYTMY5Dl3+vbT
         BBsg==
X-Forwarded-Encrypted: i=1; AKwUvBxwSrCLnuygwkfMRa7xxIqJrEACfLHVwyScWYqCp7B7mkn/1I/2DjJUp60Ainz816QVPaFNWr1jy1O8rIc=@vger.kernel.org
X-Gm-Message-State: AFuF++nWOWWaWh2QzT0i44TVWPo4DWnfg/aM1VLxl2jqtn5/JnBdChAV
	E8feU8bCua3uvUwJL/5pXgK47N4S5/8oYgJLRbDxHiqb3t3LAgfAd5BBag/3nFzZ
X-Gm-Gg: AYBFou1nQpMX04pvfvpB9G3yiZfiNgFXahVzYdpLcFyQcfK5+bAhewuilZpFXRMepRg
	hov0dkzGvLr3sA/V28CsSMZQSGkKlxEGnwDx0auYGlG2DLQTWQa459mIsGwSQFG1B8cUdM98ACd
	fqAEQZVren2ssHUadBb21C49jgodBJnYf4PUQAdv69dhe4kJG3V79nizGIGxTuT9VluRBFDBDrE
	vLW8W5Or5jxz4VwOrlQMfTqjPI8NBmqQG6YoAMpFILFnBPOBtYvxaAVKt0aI/4ginR0Si7AlUnb
	WSbTdKXY1NN57kXVRItjPGTYsxWnsgo+j5EGdRXnyCbqczzYFN6xWAkw0P3xMPjCmqQAriuu/2I
	BQ9yEeCVrUQ0I7/Et58AU9+f+7zNo1007zE5eUNRkFRRERLDUJacUgA34uIPoxHrqfOFYnG/MM2
	Il3MZWjEsJ66c7vqHcagRbdiBe0qiRDW6rtnpqCCBv5FCfuqsRD8xgRFW57FtNud0cFcBUfZF6N
	+EG6YpPEzlN2ITogrtwbyDskvjdPaDE5jYiediY0vFXO+LhNUpL6gYMchEGdBuaa2s19s5PyKYy
	qtnjDcvIfg==
X-Received: by 2002:a17:903:3def:b0:2dd:c053:e663 with SMTP id d9443c01a7336-2ddc053e67emr36745395ad.41.1789856782175;
        Sat, 19 Sep 2026 15:26:22 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d7120sm13436875ad.63.2026.09.19.15.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 15:26:21 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: brauner@kernel.org,
	jack@suse.cz,
	jlayton@kernel.org
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] minix: validate s_imap_blocks and s_zmap_blocks in minix_check_superblock()
Date: Sat, 19 Sep 2026 22:26:21 +0000
Message-ID: <20260919222621.3796976-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In minix_check_superblock() and minix_fill_super() (fs/minix/inode.c),
verify that s_imap_blocks and s_zmap_blocks are large enough to cover
s_ninodes + 1 and s_zones, and check the return value of
sb_set_blocksize() to prevent out-of-bounds bitmap array reads in
minix_count_free_inodes() and minix_new_inode().

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
diff --git a/fs/minix/inode.c b/fs/minix/inode.c
index daf83e4ff25c..b0857dfc1b46 100644
--- a/fs/minix/inode.c
+++ b/fs/minix/inode.c
@@ -185,15 +185,15 @@ static bool minix_check_superblock(struct super_block *sb)
 		return false;
 	}
 
-	if (sbi->s_ninodes < 1 || sbi->s_firstdatazone <= 4 ||
-	    sbi->s_firstdatazone >= sbi->s_nzones)
+	if (sbi->s_ninodes == 0 || sbi->s_ninodes == UINT_MAX ||
+	    sbi->s_firstdatazone <= 4 || sbi->s_firstdatazone >= sbi->s_nzones)
 		return false;
 
 	/* Apparently minix can create filesystems that allocate more blocks for
 	 * the bitmaps than needed.  We simply ignore that, but verify it didn't
 	 * create one with not enough blocks and bail out if so.
 	 */
-	block = minix_blocks_needed(sbi->s_ninodes, sb->s_blocksize);
+	block = minix_blocks_needed((u64)sbi->s_ninodes + 1, sb->s_blocksize);
 	if (sbi->s_imap_blocks < block) {
 		printk("MINIX-fs: file system does not have enough "
 		       "imap blocks allocated. Refusing to mount.\n");
@@ -201,7 +201,7 @@ static bool minix_check_superblock(struct super_block *sb)
 	}
 
 	block = minix_blocks_needed(
-			(sbi->s_nzones - sbi->s_firstdatazone + 1),
+			(u64)sbi->s_nzones - sbi->s_firstdatazone + 1,
 			sb->s_blocksize);
 	if (sbi->s_zmap_blocks < block) {
 		printk("MINIX-fs: file system does not have enough "
