Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793073591;
	b=dTMU+IrK8IURWvp0oW7hp9+bzhaVpMA48gG4sdTxV/w2LnNza0m2lZ8kBDw+NItoFE0F
	 +0feQ5i7nBZasYbVG03YS2mEcZbxOHlKB7fZw59LesTsq8VhHgS0a2CuZp5cI5bGFMwZc
	 p4gZ4/EGshWbVtc6tI0P0a8uPmrVxWICdArQ1YMxOo4kX5wjUKboEdl5Qf4uj9332Awit
	 4UgcOLGC0b7xpUxilhfZB+knR8twBEkOfONI7dV42U6sFuncqkuVnxeXDP/lxydrew5ad
	 QZJrGWB1Imal6DDqt6TMSL/G6C56ytxkOj/CHOaue1DqjMgDYzOx21bRZAxdSG6pvBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793073591;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ow0G93l9e0EmY6URJd2RDSyzRNeAkWxjCkJmGzeQGzA=;
	b=XFRIXNdOgycn5KiGBnkivelwK+uzhiQ2uqJkuTja811otKFtA26PVX8perWtmq1QYcwW
	 j+0Ri9JHVjuTZHciwbIgF4dLhdjhp2dyB+B9HWJaPJc46pM7alAKpPxs70x9IbTqfuOmK
	 eCf0uax+Y21NimPkRLDKjq/kVxirBzBdg4gGRMmopMnbGln1efcVdq3OriakDPXplnP7z
	 IvVT4L29CytBXFZvwBlfLxAiWNdhLBaXcpLl979Vm4ia2xtBdHes4SE7cl1puCSaDCll3
	 ftiFpEnXtKz3CFxvZR2oS8ScrceF+A8ImXlNELGtUDiCtlg043R5rhRKbxbPYkXEivw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="aMwh/y2f";
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD37606A325
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:59:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FD37606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aMwh/y2f
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-33e5ae86ff2so2206528eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793073590; x=1793678390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ow0G93l9e0EmY6URJd2RDSyzRNeAkWxjCkJmGzeQGzA=;
        b=aMwh/y2faS/js83YQ/KEeWIzD4kvOPqz2TU3afqpyyDp1Xs/QMPIUVv3dXmtkk4rh7
         ZLxFlVOCJLFzJYhI7oiFSCfiPQLskB2qIB0Cl/2H/ZEHnrEiZJC9RkDW0NdP4t6mVqvJ
         yrdo52st4GLaEGCCV36JmGMIV9WDuHTqKmBF5SbNQaoqLpQGgsyPfZ6rsHAkmm1M0LRa
         1OUMz+QUhySL6M0FC6oUa7i4M/xOYqGjFvnt3pUv6z61ZO/ngNDiWW2DC/2sHeQMPZpI
         wavf10DMzbXZXKyUA8PeFHipSfLDXz4X2U5iwLWXbQYOko09ZctwzsUnvy5HphzbDr7c
         iJPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793073590; x=1793678390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ow0G93l9e0EmY6URJd2RDSyzRNeAkWxjCkJmGzeQGzA=;
        b=xr1OrdCtoegqOroWP8T1X25HtvFSKflQAeWz5YYGpaaihzeFTMhMnCHvQpz29jWncV
         C3HFL+9/aUA0S8iXwfYqKLf9XzdOcOKv11QZFXi/OsbZTLqjCV+w99qtY2JI7kNGJdyP
         rJfsQ7inhAwMmObBj9UvjE9d8tBvlyFnlgkDwbrOCSDtU5C8e4+bzoVHivkLMvhBG0q6
         GtYhB9gpyo2AOZmQ8hmPQGmTfJFJYhATm4qHBtspR+y9dLzq15SithbaqEQZdqBsblGT
         MaRDScpE97pBsJ4484bAQtmXLaHavu1F3Q3UkS3upo4Gnsh1giweeIIAojTxUuqy7F8P
         vVdA==
X-Forwarded-Encrypted: i=1; AKwUvBzkijnBszHrgWJSaFXe7iR3+6NOmWwvfLAsCUIA0kI7oWifTt4vF6SIth4PtrqX8eGQ9LwTTbVPn0SH1so=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQoJxFG0mEtkLigPtJJgPFWiQkTuS0E3VC6QfN9MZL8wqZCFbD
	3ws3tYCeA4Gh31utg60yLBRQ5axlzpBLRGCJ9bt/tOPWrl3AcGauG/RO
X-Gm-Gg: AYBFou2bTwxthK4hpAMCD/SVwGHT/HccjI50NKDc/XZV/5xBVhzJrgXEqazQIApB+u2
	S6bKhogU5EOc9WN5a8j2CZ9OHUhy+peLnbWiQjEYfB0alMpAJJJu61R1MtD1UIuU83lhh8uiyWB
	ujfBs8hkRldt81YSUuTJZAeZGanVtbvDajyaBJqe+EX5GKZuCe2ptVhqJifAqJVMUC1+vVBmj+q
	XIZEFCpcXmikfwdotcPqtjP/YcDwEUKIA2Z0FrQVB0tPbmrGGNSgVNyMTesIh0CE7ie5ALQf472
	PJiTOh/6r8NEXosM4NubQzVolGYLKb+a2ssu0sa3+u2BL1vel7Xddo+a0djGXh4WX88aAsYOIEC
	0ArTMk7zX867HfRAHnM8Jwn8JGfNdSDWWhaR/deLmltY9ELBllJ3ozhv4+hrgTdMt+TfL1gEGZ9
	7gOZhtFL/rT9XgUSp1Pdog+DeM8P4Quy2SUzrRkxQaIKvbvctfw0nULxSteblw6R0uUmhZ8Gae6
	wS8C2JqEAbGr71ZQamWj0egl7s6GRgcuEyXV/tswUtv1a4LSJC388/CCjNiKTOgW2TYIe97jTe8
	NjgL7uc=
X-Received: by 2002:a05:7301:18af:b0:369:f937:9a7a with SMTP id 5a478bee46e88-36a12d7efc5mr979215eec.34.1793073589608;
        Mon, 26 Oct 2026 20:59:49 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8daa3a8sm36899329eec.16.2026.10.26.20.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 20:59:49 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: tytso@mit.edu
Cc: adilger.kernel@dilger.ca,
	libaokun@linux.alibaba.com,
	jack@suse.cz,
	ojaswin@linux.ibm.com,
	ritesh.list@gmail.com,
	yi.zhang@huawei.com,
	djwong@kernel.org,
	linux-ext4@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH] ext4: preserve force-fsck requests across unmount
Date: Tue, 27 Oct 2026 03:58:57 +0000
Message-ID: <20261027035857.72265-1-dennylin0707@gmail.com>
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

EXT4_TUNE_FL_FORCE_FSCK sets EXT4_ERROR_FS in the on-disk superblock
but leaves s_mount_state unchanged. On a normal read-write unmount,
ext4_put_super() restores s_state from s_mount_state, clearing the
requested flag.

As a result, a successful EXT4_IOC_SET_TUNE_SB_PARAM call can be lost
before e2fsck runs: after unmount it treats the filesystem as clean
and skips the requested check.

Set EXT4_ERROR_FS in s_mount_state as well, matching the state handling
in ext4_clear_journal_err(), so later superblock updates retain the
request.

Fixes: 04a91570ac67 ("ext4: implemet new ioctls to set and get superblock parameters")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 fs/ext4/ioctl.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/ext4/ioctl.c b/fs/ext4/ioctl.c
index e8e579498c99..3e444e245c98 100644
--- a/fs/ext4/ioctl.c
+++ b/fs/ext4/ioctl.c
@@ -1384,8 +1384,10 @@ static void ext4_sb_setparams(struct ext4_sb_info *sbi,
 		    EXT4_FEATURE_INCOMPAT_CSUM_SEED)
 			es->s_checksum_seed = cpu_to_le32(sbi->s_csum_seed);
 	}
-	if (params->set_flags & EXT4_TUNE_FL_FORCE_FSCK)
+	if (params->set_flags & EXT4_TUNE_FL_FORCE_FSCK) {
+		sbi->s_mount_state |= EXT4_ERROR_FS;
 		es->s_state |= cpu_to_le16(EXT4_ERROR_FS);
+	}
 }
 
 static int ext4_ioctl_set_tune_sb(struct file *filp,
-- 
2.43.0

