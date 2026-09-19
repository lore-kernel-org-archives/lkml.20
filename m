Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE09368291
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 20:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789850899; cv=none; b=q+PDgNNhhc8ENuNv6fWeM4N+OXN0JIs6w3rJwWXlNJuxNpbmhaXSslkx0/FWF0vPz4yuDBAimUx8D31HOTCINV+VY9tMfd0OQsnhGZCC2NDpuCuLiBCQTjoVUt6ifLxeKh3FquLpZ4jvG9FRgdPgS4O/1BkoCJi44CZT38oufGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789850899; c=relaxed/simple;
	bh=YWYmnTUofHLnZhhJn+qOOD+krg//1xjBLW3geEDwmbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lu5P7r4a5ViQSxY3BdZ1Wf/VNGeMklXFJthO7DqDaMqagE8BtUqbFS5BeOup3nCIrg3xVIFWoeJWDFYejrMXK4Cx4L3Vw3tVvhhLoxWVqzqbQpXyBP8EYV2cqVuPb4mVlHOtp5VS4zy2puP3gi3gGzgWJ517XHgid6SdC/PcS6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Aq7xJmVh; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Aq7xJmVh"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc147d86bebso1591088a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 13:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789850894; x=1790455694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r3eIvhYC8FQ85KoT/nVPv+hrmn/g6RXreQMGPku9rwQ=;
        b=Aq7xJmVh7cIY7djGM1VttA0/4zpdfES4WURJ99P+GxHhb0iUUquBcSSlB5eZb6VGiK
         NiapAPQgr5EsJxGeIZSqThPj5HaOAyexIBlWpHz19suwVj7xvsGNyml1Sq6pvgRNELSc
         TCSJg0nD0/aaPaoqslxqARCdZvve8l51B309rW758hr5kUzWCsBFwMD7pN5qEdhOerIZ
         nzA1LjA1Pxz9cTc3qWA0+k0cOSpmipoamf1+iXmhrEV1L8k+YeyvJlMpR5cE5IbJztZg
         O8+NmMTw4Fkx+Pb4jfOdGBiwg45VF76rnGrg+EqgWOG4kSQQl22DkR/de6ez0klnpQPu
         CRCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789850894; x=1790455694;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r3eIvhYC8FQ85KoT/nVPv+hrmn/g6RXreQMGPku9rwQ=;
        b=qQuEkHmcYWRft8Wa9fn8geiB75WBatVz16gIVYMn1ZKQM7tpPHd5UWJY8ox66FreQ4
         INJnAZlvJjUzst16wu7ZM8UvpgQn0UYtWdG1BbhGtVCYWciBkgiDEYDEx7wb5I6NNRQR
         4BMBGEmarhzCBTTWKCvcXGKldC5i963XhzvKwPeMEFc6PNPS3ITm7CMP6+1I9Bm4RDDF
         501EzUGZTK4Jks4w00nYAXdbZRKiGNCFFr6P7qCvBl8MnTOZovUFyLCG/KorXcoUys9V
         tPxQ/Zjl1cafej2dVW8dx2iA0ZxgmkxMgk2d6jPKy7MNuWXBjB+CvdnHOC2bu2mdYKDW
         +wSQ==
X-Forwarded-Encrypted: i=1; AKwUvBzskCgGzYKy3c0H7eWl/YnAQ/A12+x9aXinTfuT+4axVO3I3AhRsxU+1xbX2G+tuRQyDUR8bdWmMJx6dXM=@vger.kernel.org
X-Gm-Message-State: AFuF++mcIgKe4baZ98Cs3V6bQoWJkb8ZXK3lyNG70b8pa6N2XCd5UV7f
	2Cf0a3tBDtMfjBoBh60W3d4uE8JFCdJ9TwA/W888y++oIIbYMo+OXBSx
X-Gm-Gg: AYBFou0GNyclmATAwJkEfLP3RX585luwLSPUSHXopkoQ16PimITziudA9cKto8ecmkQ
	42bDfQhcNHeDGgI/FyRHrbmVJdIsYqJPskCy4xmoKSqC9/8w6CwC3iLcmtHseUkzJ1QlH3Ypt8x
	OUOuO5dIDncX2jrpWfch4lOhGMu+Gm58aYYaEy4o6UpOBGnqPUJo1zSZCfRKW3imIcOsA2oorTH
	M3Vud9ZlvxWJCg7Q18E5+8dBZjOGeNrqnukNbNLYC2EzbVCTUd4cCi96oLgM0mteitbWxI+ZyfE
	oNbiw4wU93GS2k8SqZ+kKnx2LP7aolMH/bss3lX2Kj9q8XPJNm6ip4kaJLXQIvWj914wx6lg7Aj
	6b87e8I48ewkCSBvTEya8IcmqawkwftfjjKwDWvvgYnXt+LuJzX4IQ/3OLLvZwUL2JjYMZjef21
	MtcQDJrfSPIqh7piKnvJ5KX9uWgPtLLPOFNLXr6HUSR21xSMtd8sUYiVtBzFF7tCVuNssKnwgeQ
	Ngly/2l+4J9UD8Sa+7nHikg61ZHw+dZCVLOG0ZZ5Y8SF14E3gGjQmD3t6/pQtkIe8P3xDX6Yhcz
	/oKAd5cyMQ==
X-Received: by 2002:a05:6a00:b47:b0:874:72b6:7da7 with SMTP id d2e1a72fcca58-87472b680d8mr8829464b3a.34.1789850894124;
        Sat, 19 Sep 2026 13:48:14 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877aa305dcfsm1319734b3a.52.2026.09.19.13.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 13:48:13 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Theodore Ts'o <tytso@mit.edu>,
	Andreas Dilger <adilger.kernel@dilger.ca>
Cc: Jan Kara <jack@suse.cz>,
	Baokun Li <libaokun@linux.alibaba.com>,
	linux-ext4@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ext4: clear EXT4_STATE_MAY_INLINE_DATA in swap_inode_boot_loader()
Date: Sat, 19 Sep 2026 20:48:12 +0000
Message-ID: <20260919204812.2814531-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

swap_inode_boot_loader() (EXT4_IOC_SWAP_BOOT) checks
!ext4_has_inline_data(inode), but neither checks
ext4_has_inline_data(inode_bl) nor clears EXT4_STATE_MAY_INLINE_DATA on
inode and inode_bl after swapping their inode data.

When a newly created empty file (which has EXT4_STATE_MAY_INLINE_DATA
set in memory) is swapped with a non-empty EXT4_BOOT_LOADER_INO that
already has extent blocks, the target inode retains
EXT4_STATE_MAY_INLINE_DATA == 1 alongside extent blocks. A subsequent
ftruncate() + small pwrite() + fsync() dirties folio 0 while converting
the inode to inline data, hitting
BUG_ON(ext4_test_inode_state(inode, EXT4_STATE_MAY_INLINE_DATA)) in
ext4_writepages().

Reject inline data on inode_bl and clear EXT4_STATE_MAY_INLINE_DATA on
both inodes in swap_inode_boot_loader().

Fixes: 67a11611e1a5 ("ext4: fix check of inode in swap_inode_boot_loader")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
diff --git a/fs/ext4/ioctl.c b/fs/ext4/ioctl.c
--- a/fs/ext4/ioctl.c
+++ b/fs/ext4/ioctl.c
@@ -397,7 +397,7 @@ static long swap_inode_boot_loader(struct super_block *sb,
 	if (inode->i_nlink != 1 || !S_ISREG(inode->i_mode) ||
 	    IS_SWAPFILE(inode) || IS_ENCRYPTED(inode) ||
 	    (EXT4_I(inode)->i_flags & EXT4_JOURNAL_DATA_FL) ||
-	    ext4_has_inline_data(inode)) {
+	    ext4_has_inline_data(inode) || ext4_has_inline_data(inode_bl)) {
 		err = -EINVAL;
 		goto journal_err_out;
 	}
@@ -461,6 +461,8 @@ static long swap_inode_boot_loader(struct super_block *sb,
 	size_bl = (qsize_t)(inode_bl->i_blocks) * (1 << 9) + inode_bl->i_bytes;
 	diff = size - size_bl;
 	swap_inode_data(inode, inode_bl);
+	ext4_clear_inode_state(inode, EXT4_STATE_MAY_INLINE_DATA);
+	ext4_clear_inode_state(inode_bl, EXT4_STATE_MAY_INLINE_DATA);
 
 	inode_set_ctime_current(inode);
 	inode_set_ctime_current(inode_bl);
-- 
2.43.0
