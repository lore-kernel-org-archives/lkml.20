Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4993D367F2F
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 01:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789693577; cv=none; b=W/ILL824BVF3maE12su+lJ/cWAnAMG/zO8WRvWjrMGG1Y6JGtmOxUBMhSRw8UMAcWyfkZlHUB3Yg2qd7+Pyd029JNOq5xAF6PCjVTbExVLRd9jMAc1BYMwOYmDzD0gYG2CISpVHp1MwIu+eVbCve5Od4NoN0zFhN650GhJZZcik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789693577; c=relaxed/simple;
	bh=yBIGT8BXOLPPjlnisUuvjv8aqjnLGGAervT2GKtRzBY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u5Ryly3Ohpb9wea0RMlOwiHdKeISE0Y3iltMcySUOirc/ht9NBihqs0hoIIvnTQ6DOvGrbfpOjng2FcGESH8yoFmNGsIdJfVb+ZyQ9AgWIrfYf8fnS7pcDYtfXmQdtRzhp92/982deevRVW+dozrakWA0mF2ElnQdFubhj+Hegg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c5zgM1uQ; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c5zgM1uQ"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747f01363so1490505ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 18:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789693570; x=1790298370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iFcT2DOyxQDtRKBeD9Hf0Svlfti42z1k3EuEK/szEUM=;
        b=c5zgM1uQko+aMmYYWP6nQJUg8b/MUMPqc2xOpbsnCgyP9hKVgPdTpB4qg6IknQrAjg
         gdu+eiGS5CFGNaRaMC8xvX2YYRv5Gr1WY4pWxRtu7/bRTIOcFcc7Qwg6TZbaVzSMuyaV
         js8h+r8f8wzp/qZKzmjeC86hDrbywkBjSXf9RIJScGn9KUz1Z09DslR/AaVKAqGMYyhI
         56fREe+4Ga8lKD20G4Te38V2Ak3MUVQ1hUtzrmII/M++ydxXVm3kb7UgRD2o0054Bepn
         v4eI2kA98zk4G8CHGmPLFWfJh/Z3/OEplw8Sfuozoj/l3YO0tsNTOA33XlDLjYk68bX4
         FSHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789693570; x=1790298370;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iFcT2DOyxQDtRKBeD9Hf0Svlfti42z1k3EuEK/szEUM=;
        b=r81gRF3Z6IkGpAblAr9Q53bX2FX1IwjNxsDMkYz3ZYriJED3X8rLtp+2LpScoQD7pc
         xaWfd+QOl9+r3ZRwdUDctKG0SyTDGPASoniDvkZUFub3N+HQd9sTzzziOW+NOGUgGMyM
         ShPLgteaOgHp/2QfrRSn6g83/+PdjBGtGBo4xGOgIQZFDI/ErCGG6jEWL4x71nr/Gd/Z
         phfMBVbt1rg09qsv4SlDX8eNGaJslpvDld5S7Z/BS+p0eWP9RMxqq8jNP1mzcFIzPb9l
         HaIXfQcgpy/pwaQ+tO31k+eFi16Z6Kpk9F/jOOBBUQKbfcAVehV9tXOo6HJxJ6XtJMrR
         D0Qg==
X-Forwarded-Encrypted: i=1; AKwUvBzSlVvilikZxD/uakYF7+Iv99fobXUGawiGvd4I9l/HPIgIWIdGoLJrJpPa8qMRWZDxdvz8k4x+FVkQw0U=@vger.kernel.org
X-Gm-Message-State: AFuF++nfz8BHy2JFaC+cK/AujbVRHnMGV7dpknzGiQixJWOlPXASdDGj
	3duKDf8xm9K2CqHAdgcGOMgQOP7DZ6PeEsy5E4UKh1+wGXIXRLHrlpQ+
X-Gm-Gg: AYBFou1LYYv+c4Ov4YtCBf8FcrW+0eWuBq7S1WeV4aStDQZ5N+E5/KFpXyLsBBHSRWD
	1SJwqt75F5vSrb/z1BXNTCjxaVgMBf6wRigJLqHXBUqkpnFvp1NH5ZXVkVJXARPTUIv1e+2zj8f
	/UtQvLIhNk4BIDuk9PG76zwePa2wjOctT4lyfR18dJlP0p6/CRfjH0Tl1Ps2kXE7zdBvcILyoY5
	x8wjCTvsaW16QCwFrco6KUJYd0muRoO6CmzQLZSBEeUl3HdOFvwHAmNevj1XJqMsjrL3dkJU+e1
	ADe38a2yT9Bav45MNXnDynK+VEdqWQLeyt1Fggo9I+PlsO+mt//2WpzZG8ixw2K51XaX0peM/05
	vdTaW6hloi50bprEUN2GeUPVbNCBr/x+WW70KBATCWrfIzFXgP/n1WA/zYBs4x5AUew90xEbvE5
	Xrokb/dkBVlF648sgs0UPxi2I+5mk4blaAt2IwPRMx9gfDIhdrWEvHocseU13JuyULCC+qrmUhD
	IZ874XI6wu2jKKrQgnKEj3rOkqjCmqM9O5foShahfrLmxnY2h9chthmKUq3gGu+
X-Received: by 2002:a17:902:f687:b0:2db:2413:87d2 with SMTP id d9443c01a7336-2ddb1ac954dmr19438205ad.4.1789693569827;
        Thu, 17 Sep 2026 18:06:09 -0700 (PDT)
Received: from deepanshu-Legion-Pro-5-16AFR10.. ([2405:201:682f:383f:5d30:2332:ca7b:eac1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89f338a9sm33460655ad.83.2026.09.17.18.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 18:06:08 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: tytso@mit.edu,
	adilger.kernel@dilger.ca,
	libaokun@linux.alibaba.com,
	jack@suse.cz,
	ojaswin@linux.ibm.com,
	ritesh.list@gmail.com,
	yi.zhang@huawei.com
Cc: boyu.mt@taobao.com,
	linux-ext4@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	syzbot+085a394c92518a04fd09@syzkaller.appspotmail.com
Subject: [PATCH] ext4: add bounds check for e_value_offs in ext4_read_inline_data
Date: Fri, 18 Sep 2026 06:35:58 +0530
Message-ID: <20260918010558.8210-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ext4_read_inline_data() reads the location of an inline data xattr
value directly from entry->e_value_offs without validating it against
the actual bounds of the inode's xattr area. A corrupted filesystem
image can set e_value_offs to an out-of-range value, causing the
subsequent memcpy() to read from an address far outside the inode
buffer, including memory that has already been freed and reused for
something else. This mirrors the check already performed in
ext4_xattr_ibody_get(), which is missing here.

Add a bounds check on the computed source pointer against the end of
the inode's xattr area before the memcpy, and reject the read with
-EFSCORRUPTED if it would go out of bounds.

Fixes: 67cf5b09a46f ("ext4: add the basic function for inline data support")
Reported-by: syzbot+085a394c92518a04fd09@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=085a394c92518a04fd09
Tested-by: syzbot+085a394c92518a04fd09@syzkaller.appspotmail.com
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 fs/ext4/inline.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/fs/ext4/inline.c b/fs/ext4/inline.c
index ceee69a66482..2e60ab3e0db5 100644
--- a/fs/ext4/inline.c
+++ b/fs/ext4/inline.c
@@ -187,6 +187,8 @@ static int ext4_read_inline_data(struct inode *inode, void *buffer,
 	struct ext4_xattr_ibody_header *header;
 	int cp_len = 0;
 	struct ext4_inode *raw_inode;
+	void *end, *p;
+	u16 offset;
 
 	if (!len)
 		return 0;
@@ -205,13 +207,21 @@ static int ext4_read_inline_data(struct inode *inode, void *buffer,
 		goto out;
 
 	header = IHDR(inode, raw_inode);
+	end = ITAIL(inode, raw_inode);
 	entry = (struct ext4_xattr_entry *)((void *)raw_inode +
 					    EXT4_I(inode)->i_inline_off);
 	len = min_t(unsigned int, len,
 		    (unsigned int)le32_to_cpu(entry->e_value_size));
 
-	memcpy(buffer,
-	       (void *)IFIRST(header) + le16_to_cpu(entry->e_value_offs), len);
+	offset = le16_to_cpu(entry->e_value_offs);
+	p = (void *)IFIRST(header) + offset;
+
+	if (unlikely(p + len > end)) {
+		EXT4_ERROR_INODE(inode, "corrupt inline xattr entry");
+		return -EFSCORRUPTED;
+	}
+
+	memcpy(buffer, p, len);
 	cp_len += len;
 
 out:
-- 
2.43.0

