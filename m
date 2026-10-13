Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79CD3F9265
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791903536; cv=none; b=cpNCTb3UDt1M3Opfmo8sMaqw+KuhGQCs+XxRAsOfWA0fIrPv8uCaisGYZ4Piaebg/C+M6ah6hgqGh7oUYCqg3xJPOh0eq7RyFKqFOo1408EoPAyfZtZD7XVzQeu90t3fEoHFHXolW4Nr6UQ91WB8s83CxCqQ6PLIbpjHSXv2uzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791903536; c=relaxed/simple;
	bh=2z05PsLR0ucgKWMN9vPAks1g4BAjgoGGRk7Omt7dCw8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B2zh4LNjJshz0ZqzEmre6KfhOwH6Nx780B31ovMCykKlNegqc4Lj/zW4BxXQ6TYp5C3kbhN0FKHOuNJSbo2AQaxPUENX4zIU6tB/uk4ZIpAIPgp97A9T6qH4wbsTG+bQgEzdqKwLVG3PpOeoQoFMO4bZuTHvogh3XoESEX5Qw2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZzdqV4+d; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZzdqV4+d"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8884761745cso369194b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791903535; x=1792508335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rYeCLMrRw+7sZKn7J2Wy4tI9g40PN4nI4PwnmcaAXWQ=;
        b=ZzdqV4+dVLVxbaUbPsHq/gNx0FHdBdgz0z1wKUOwATlxmymIpSDbpx4kxPzHR8as09
         KcrJTinoCPmJDRrJzzTlLNje6CvyLbRv3BmB3DksPS6IKZCTNsHOuJv8WARgxmv4WEa6
         ch5W4yCMMdJxcjxuSPpQ7D36Qzeqk740vBSoaKGwqbHf47RqILZPTAmu00mYOQpMNfUw
         cMVpP830htJugqTh66ijmkBiGGj8frW+grN75xYcbdFWny4mF0yy00ZY/fplxvA1PbM0
         Ydk7RN98Q+0jGfIAu9z9iJljxs2EORk6sxyj9hLgsQVntWsEMpUp7slEpZR089reDLhd
         1iWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791903535; x=1792508335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rYeCLMrRw+7sZKn7J2Wy4tI9g40PN4nI4PwnmcaAXWQ=;
        b=Nyh2v33LHV8wTuYSuF8Iu3SZZKnB43A2HD4Ddn7d+vwQ5SlJvcJmyWrQqHxnkwOYxg
         G2vfEIQhtAI5MchoTk6xdNB/y828H+YZTURlMyg9MiE2h8N9KLwXWbkRU1lzSp25mbcv
         PNFNUwlF0FDD2lBw/eyGzLQnKjsDQdg73fq1mmNqPt3Bh4bLLu6ROfAo0JxKAr+mjeDN
         c8F0+TaPh+o8bVf7IMb9Ako1p1kXm7M1TuDpuI9BgeYyD8h7RwRen7vS5xt0W+0NgziR
         iAmKRSv09YsnhUJK0V5EQni2ZcDFYVegMQg3KI03srmDUqoCUFldLJYpSRhQXZy2SgTM
         s98g==
X-Forwarded-Encrypted: i=1; AKwUvBzVYooSdTPwbhW+A7fBGmn2N3prIyxS0AvndCjqzfC2hxy/oMYYzaApiiiakiHQTB8pd/Jqvvwx9kPZaIQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1Onpv/wzXRSdanZOzOLzbFeqcGqkj8Cq7ZBexbs6wr6YOcXSc
	lI/nsN6afZUYHDSs0X4oo/p5Uw9eQnyAxn8tofHlV9d17MGO/+E9TVy2
X-Gm-Gg: AYBFou317Y2uQEk5leribLVA+tJOhN1bGEPUkr+Wc4zdezk2ixyTUknUsJxTzsujcus
	wRmLt7pGhoojnpoh6SKF6mEHxFfNa38LkeGnTqQtN8cAEHJ5m0z2I34Qfq7Y643RELW0o84AUxV
	33KY4K0wunXUASzPYhIm2j20e0qY9bYw7VVAsvN/WRge4E1G+bFdo8X2ah/x9FBDwGyNg98tv8a
	327MypyhckaPH97xbl2ozC1cQ3RMHQh2tsQMNMWl7Brs5KvwR7rh2CFzznazkC0AeVUDH+7Aj+E
	Bo3sZK123m0lUcFR1uUdrLikN3oVekmZzSyL5LwYw57yBHeGnxG9Vh4AqDFlKAc+6WtimrR9PI5
	L0tzV1onySyNEHDZnGOvrcNW6a4cZ+NcAk5AX/9AxpF8LXkCygqz/mlSLFPFri0ypaWCck3InJP
	ajDmybTRaB7/7uFMjJPHl1SdaoJ4FnOlIB3w4aMYFSHaFeasnlEnsCv40Vcgea+jw=
X-Received: by 2002:a05:6a00:4906:b0:89c:9569:93cf with SMTP id d2e1a72fcca58-89c9578e022mr2814601b3a.1.1791903534922;
        Tue, 13 Oct 2026 07:58:54 -0700 (PDT)
Received: from ser8.. ([221.156.231.192])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89a0724a045sm2987330b3a.45.2026.10.13.07.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 07:58:54 -0700 (PDT)
From: DaeMyung Kang <charsyam@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	DaeMyung Kang <charsyam@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] ntfs: report block device flush failures from fsync
Date: Tue, 13 Oct 2026 23:58:45 +0900
Message-ID: <20261013145846.56415-2-charsyam@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013145846.56415-1-charsyam@gmail.com>
References: <20261013145846.56415-1-charsyam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntfs_file_fsync() calls blkdev_issue_flush() after writeback but discards
its return value. If the device cannot flush its write cache, fsync()
reports success even though the file is not guaranteed to be durable.

Reproduce this with QEMU blkdebug failing flush_to_disk with -EIO.
On ntfs-next at 04fb910da2c8, a kretprobe recorded -EIO from
blkdev_issue_flush() while fsync() returned 0. With this change,
fsync() returns -EIO and logs the failure. The syncfs() path already
reports this error.

Fixes: 9c87959601e8 ("ntfs: update file operations")
Cc: stable@vger.kernel.org
Signed-off-by: DaeMyung Kang <charsyam@gmail.com>
---
 fs/ntfs/file.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
index 58afd310d57b..afc2efb4b699 100644
--- a/fs/ntfs/file.c
+++ b/fs/ntfs/file.c
@@ -417,14 +417,14 @@ int ntfs_file_fsync(struct file *filp, loff_t start, loff_t end,
 	err = sync_blockdev(vi->i_sb->s_bdev);
 	if (unlikely(err && !ret))
 		ret = err;
+	if (!ret)
+		ret = blkdev_issue_flush(vi->i_sb->s_bdev);
 	if (likely(!ret))
 		ntfs_debug("Done.");
 	else
 		ntfs_warning(vi->i_sb,
 				"Failed to f%ssync inode 0x%llx.  Error %u.",
 				datasync ? "data" : "", ni->mft_no, -ret);
-	if (!ret)
-		blkdev_issue_flush(vi->i_sb->s_bdev);
 	return ret;
 }
 
-- 
2.43.0

