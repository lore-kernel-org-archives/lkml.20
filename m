Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39E0388E6F
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791882295; cv=none; b=scB1VHqcirTJJ4C+wqWXrsS4hm6uvQzxx1JWAJSnRXTKA9ihMeW5eNSCXBsLBhI90cNE4wx5+BVy/69KO6olonCKu9vyH4F+1rQvN/uympfSTC0/vnbrCYkXpKgRzuY8ntMhMdLAUnqirM2AxrkenFGJgki/pRc/36NoFDx365c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791882295; c=relaxed/simple;
	bh=GEyscDG3hRct4i5PqeupCLPTXDZZMD3LI88vgtxk/oI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BUFzmaRpTsm+PhLE9SmqlEs9jfmRRkwuaBAcM6NcE3YwtGmUOpSr6lWXyEndq4UWsA3J0ZJL9rmXsm36xrY/9NyfWQCLBYLgGqciU3QMBflh+NP2PQBfiIU6fuSLxqdyHXuMb7g4XmKNyWQBLc8xwkqa4YXXPV1p7GVDgu+G9Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SsuiHND5; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SsuiHND5"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-17089130deaso37050c88.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 02:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791882294; x=1792487094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dxhG2H1+Sm23DRdhBURFp45TF5bOWuOpjOESI+s8Fjw=;
        b=SsuiHND5UcztOFPmlpRUzqFDIddDCL5nVwQxbuwx/X8zyVb94TfJ+lg5bRSoFwiQjZ
         9i1cDNadjyTsxPMMq43gPSEA5HjvhGAMj6kF0KuW68Km6QTXOVrjtHvh3+SgRkrKmwQr
         Rx4sIoN7bnc6Dswtk4oDJZPRMM5vF4rm6SZcoY4+zoZek3ORcX5BSvhxcQpwlytMJohx
         sulTHaxBjqF60+VBHhaCabSDWGzk7DA+d0U2n0FFeqZRPNAqHFl22iqZqU4KL6cFBqg6
         cm4GWRzz3SDKkaVFj6rEqw1bcs/nzJgzl5hE52p4jDdSAKis6KNuEK9AtbwScLxSqjhr
         T4lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791882294; x=1792487094;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dxhG2H1+Sm23DRdhBURFp45TF5bOWuOpjOESI+s8Fjw=;
        b=Pckk/Bj4W0rGgb4v7+fxRVqR/grcGfHdwtfsdjVhuSpOgiGg3LqIkmiHV5777M1oqV
         SGoC11rHuDB/UVQ9hftjQkEpOfNblpSVfJkqwLtTu+4HFqjDQSTRLDzt0BrbDHUzxeRE
         6CEERUdTwkuux8FMGBfdWG7HLwJoEZHlHij8w12X4bHs5DXA1xRTWf6g28Lyo07R1UD+
         A4Blb6/IOYb6gPOEExcfjhRYlYs1v8hhwTHx4pgo11DkWX4DqYlqRGg/eltKpsx2LtjO
         9pVIJ1N/lPwyJGUB5UF70F350mrALkma78JcyNHr0pQWvOBEJEClttTRTLDIsmFBcfAd
         fHpA==
X-Forwarded-Encrypted: i=1; AKwUvBzrdvzPvxyy9SuYYt2nXcW44/+CdeiuZlFzbX0+FLNpjtbJ+Jpwon7yeltUVYjSK3cbe5FOuiw3R3R9TTE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvLFmp/x4QCJBAQY34b0um7pycJrXF85rbnUsSv0mc6Kx/y+Kd
	pWoOT8+lTkV3M0ZwUE29yDmukJRYxUu0B4oueCVs15QU9yJJrTBTcJ/Q
X-Gm-Gg: AYBFou3r08LJqJvPbRlYv8vf4ciGTbiNLEAywxbjKlq9RTTzHZI+WvDfPw1u/OK3yFh
	VrjRCNw4jBHqC6BGu+LInTScmLYNxoCsNfqF6eEytfyywJRpRqnrYnLkBG6VkbS1ROLejOEX/vr
	/KK5YdIjJg5jbBi0NaE3jEh4nY/6sIYN7N2n6RiyTSWJVLG+JdffzPPVfBhUYlbGXirAZ4DUz3i
	20M8Zu1eBmCsSj7tUtt9hnRA/ZhQD7IaHQRtSmuDsdEAiYkHhQwMv6IXtKcwkcEaL+fOreNCEpH
	7t5fWi2Le/Hk78wSzx4YwFqatsESxZo5L4/IzKFOcWqxeGZoHi8wo2aoJur1vAOZduGzmOCr1/f
	9AEZ9uV+o8YwYFw1rF06GXhDr/NFOy8nn1Vo4C1lNRnaXgKv/gEOkIQ3VuGOrFYCuPKdOCp6Ah4
	g1aY0RSFGlAkOx//0tEXtC02q+SNx9QYYwfwTm7MHj318guwmpCLItVYuFA4sFlt0F6NYs8gk8i
	KogKb2Ba4QjIwvnvHbLOxqnOJWhwNDp8YBxrMOma3UjCsYXVT/gwZzPbQOE70wi
X-Received: by 2002:a05:701b:21ce:b0:149:c766:2965 with SMTP id a92af1059eb24-17a0d84a29amr2902969c88.2.1791882293581;
        Tue, 13 Oct 2026 02:04:53 -0700 (PDT)
Received: from localhost.localdomain (45.78.65.84.16clouds.com. [45.78.65.84])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a2d2db98sm35211947c88.10.2026.10.13.02.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:04:52 -0700 (PDT)
From: Chengfeng Ye <nicoyip.dev@gmail.com>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chengfeng Ye <nicoyip.dev@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] fuse: fix copy_file_range reply handling race
Date: Tue, 13 Oct 2026 17:04:47 +0800
Message-ID: <20261013090447.1180121-1-nicoyip.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__fuse_copy_file_range() selects its request opcode and output buffer
using fc->no_copy_file_range_64, then reads the flag again to handle the
reply. Copies to different destination inodes can run concurrently on
the same connection, so the flag may change while a request is pending.

For example, task A submits FUSE_COPY_FILE_RANGE_64 and waits for its
reply. Task B submits the same opcode, receives -ENOSYS and sets
no_copy_file_range_64. When A receives a successful reply, it reads the
uninitialized outarg.size instead of outarg_64.bytes_copied. This can
produce an incorrect return value, page cache invalidation range and
inode size update, and disclose stack contents if automatic stack
initialization is disabled.

If A also receives -ENOSYS, it instead mistakes that reply for rejection
of the legacy opcode and sets no_copy_file_range, skipping the legacy
fallback and unnecessarily disabling copy offload for the connection.

KCSAN reported the conflicting accesses:

  BUG: KCSAN: data-race in __fuse_copy_file_range / __fuse_copy_file_range

  read to 0xffff8881014a4d4d of 1 bytes by task 123 on cpu 4:
   __fuse_copy_file_range+0x1a7/0x6e0
   fuse_copy_file_range+0x54/0xd0
   vfs_copy_file_range+0x290/0x9d0
   __do_sys_copy_file_range+0x10f/0x2f0

  write to 0xffff8881014a4d4d of 8 bytes by task 119 on cpu 0:
   __fuse_copy_file_range+0x633/0x6e0
   fuse_copy_file_range+0x54/0xd0
   vfs_copy_file_range+0x290/0x9d0
   __do_sys_copy_file_range+0x10f/0x2f0

The bug can lead to leak kernel base address for KASLR bypass, the 
corresponding reproducer can be provided per request.

Use args.opcode for both -ENOSYS handling and output buffer selection.
It records the opcode actually sent and is updated on fallback, keeping
each reply tied to its request regardless of concurrent flag updates.

Fixes: 7a37f55af7af ("fuse: add COPY_FILE_RANGE_64 that allows large copies")
Cc: stable@vger.kernel.org
Assisted-by: GPT-6 Astra
Signed-off-by: Chengfeng Ye <nicoyip.dev@gmail.com>
---
 fs/fuse/file.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index 9a36d0329e221..939391b48cc9b 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -3019,7 +3019,7 @@ static ssize_t __fuse_copy_file_range(struct file *file_in, loff_t pos_in,
 	}
 	err = fuse_simple_request(fm, &args);
 	if (err == -ENOSYS) {
-		if (fc->no_copy_file_range_64) {
+		if (args.opcode == FUSE_COPY_FILE_RANGE) {
 			fc->no_copy_file_range = 1;
 			err = -EOPNOTSUPP;
 		} else {
@@ -3030,7 +3030,7 @@ static ssize_t __fuse_copy_file_range(struct file *file_in, loff_t pos_in,
 	if (err)
 		goto out;
 
-	bytes_copied = fc->no_copy_file_range_64 ?
+	bytes_copied = args.opcode == FUSE_COPY_FILE_RANGE ?
 		outarg.size : outarg_64.bytes_copied;
 
 	if (bytes_copied > len) {
-- 
2.43.0

