Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC884D09F4
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791829365; cv=none; b=RbjjuhSU+kzWCsM4GWLMBhhXaB1nlA8Drxv0t0EBa0GbP/bxyxgoFYrmeog7rr4iRsc58icbRpV5i3bkXIBEN3mVqi/+RQvVzsFs1aI0q8ywPkx7ZpBjhFGSM0ahDmPrZ0Kv5K00oCTM1QM5hD0+b0NJykGfS4RaGM0xLNVU9yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791829365; c=relaxed/simple;
	bh=kyN828u1z+T3/4hxHEAl0EVaoBfiwa/fwP9SxRVJsaU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=So6CnJ2Kpjnb5l5SO66xqud9MZaas+o2H/JQ8LPK+eJCc5PD2d5TefOBwqZUUxnKBIivqUlAdlrtf5b9c/fCXBPQDljSaIsj+ExSRCwU4gs46lIy99P0XzbPxNDBWPV1o1mAOV/odlL4e0XivNNopcEPRQy29PuxKC8dkICGjvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SPYE3sYB; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SPYE3sYB"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e623eda81cso12457715ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791829364; x=1792434164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gbZDE8rwgwP6vxNIiACurdFD3ae7zMp/sZ7U8r6EHqw=;
        b=SPYE3sYBJ8MQamQ6W0RABQ/Irk3w/YLNXGMpKKPyn9FI2nG9gTlJ2Pys9pQQL2Nrgm
         qEiYoeZdaFe/kKLGaokAqLaj5MTXfNGUIwWBuogiKq5cnyck4Il8mIBHBi/XNOJ2zF7N
         OsgOAEfvGmz8RWBsmeZr7NHHIPjxyyAJ6rTp+/a8Ft27Ndd4tYEz/zIwwfaOzvs8FeiE
         skGfF+WhMX83GPXSLKvkjNtVM4LStKZ0kYXTzbrVCyzj1zLSaGmtUbolTkxMc6gTr+u9
         QxXgeQBx7Ojfy8tQ+VWRE86yyOf3Y3f5cy4NZDqvnkkLs77K7TaIJvC/CbrgfYmJ07kw
         LGOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791829364; x=1792434164;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gbZDE8rwgwP6vxNIiACurdFD3ae7zMp/sZ7U8r6EHqw=;
        b=0naW8zlXnyav9TKY1tjQGwTO8d9hgM2EBrKdgKPmRFF0VBltJn73jcQeLSfFq/Wv5G
         iWCHygRy2GsJT3JUTCMQihJb/WtkVW37lZem3tK2xVKsvk+NiQiJ30PJm79DDMVgiXgw
         B5ffpN1ANR9QvGg+Ct5jj+wEF9R580HcLEZmj24CzMWN1YyLV4AA9scnBweCCWAex6P2
         8J1CwpTsFqy5oKwW2Xtl2ihuTKEyJhmrWcIv8hyKzj6fi+cw6FTAou5yeO8139oKXy0W
         +0NxUK4b9xR4mpNROW5CpfJJyxdbxh+RIVcRdYYQjrQ/ek29BEIFjg9U3ku9SQQA5MBj
         OrLw==
X-Gm-Message-State: AFq9FYKP2rt5Ko4ZFp7u96iGeJBTWCM+pSkDt6rlHWbt1BHPXACbKj1T
	ov7QYWirXr72hCOCw5YlZd6mzhSR0nogHClLJNz0WuXKopqyUfZ79+sJEJfzsQ==
X-Gm-Gg: AYBFou0n5hpcNvxI3eom688nsJU4Gzyhz5lAs7xHdTdvMpdk5LMS0UgI1JA53CNAhPR
	35ybAJQZ0r8aZrniMHqZxlsM50CrICrzQNbWioPPrlU6An9kVzvbdBGld6CCAaoyG8z9ZOHIvF8
	ZgVAPLYtn9oOo582CzZz4rclZesRq9nnqlXsfCXSbTd9AGsiHBCuw1no6rlJnKbvxR2UxBBVCw2
	A9T6Gc1EoYEYdHPMWzpjDTVm7+6fOwwUvNeyGpS2XbpojJT/HxIOgI0sQYNP8/87lLEeHFwMnss
	pcdn38G3C9LzFuFnhHuX0bLAae9qHTpa501Afia/DVdezvv/KlBptFiBetgt+YA9ayHsFfwPQoK
	bOOcPtcIYVvN1sHEmTia2x7GqkrtSJXVN1lZ81vA9YjQyoL+Zu80meq8bfYrH5fuPXgfXJwtBvc
	voL3Uo6LVsEeWGxHUX0OOGBz4M5YvejyvBOO0d7ELXCXF53WA7YzZ7ihKwwGHtlFgy9b3pgXPzW
	BdRnpl4rh9fbv0cIPoRqxAwtE7ho0xnHDZCUWILgec9LKiQDdrShFnbvGVsKzCdPf8NjguEyxzD
	Yf86c/XRNx8A0ZF/TFjMkrGhtw==
X-Received: by 2002:a17:903:476f:b0:2e7:94fb:262 with SMTP id d9443c01a7336-2e842ce2a76mr76278985ad.43.1791829363505;
        Mon, 12 Oct 2026 11:22:43 -0700 (PDT)
Received: from f2fs-test.c.googlers.com.com (225.134.16.34.bc.googleusercontent.com. [34.16.134.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e841a009a7sm46451645ad.11.2026.10.12.11.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 11:22:41 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>
Subject: [PATCH] f2fs: return -EIO for a lost inode block after cp_error
Date: Mon, 12 Oct 2026 18:22:33 +0000
Message-ID: <20261012182233.2685282-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daeho Jeong <daehojeong@google.com>

After cp_error, dirty node caches are dropped without being written.
If such an inode was never written, its NAT entry is still NEW_ADDR,
and reading its inode block returns -ENOENT.

f2fs_get_dnode_of_data() passes that -ENOENT up, and callers take it
as a hole. Since the inode block is missing, the next offset can only
advance one block, so fiemap walks block by block up to maxbytes,
about 2^30 blocks, while holding the inode lock. It took hours in a
power-off recovery test after shutdown and blocked unlink and umount
on the file.

Return -EIO instead of -ENOENT when the inode block itself is missing
after cp_error or shutdown. A missing direct or indirect node is still
reported as -ENOENT.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/node.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index be14dfa31e5..55008f18afd 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -832,8 +832,20 @@ int f2fs_get_dnode_of_data(struct dnode_of_data *dn, pgoff_t index, int mode)
 
 	if (!dn->inode_entry) {
 		nentry[0] = f2fs_get_inode_cache(sbi, nids[0]);
-		if (IS_ERR(nentry[0]))
-			return PTR_ERR(nentry[0]);
+		if (IS_ERR(nentry[0])) {
+			err = PTR_ERR(nentry[0]);
+			/*
+			 * cp_error drops dirty node caches, so the inode block
+			 * of an inode that was never written reads as NEW_ADDR
+			 * and returns -ENOENT. It is not a hole; the inode is
+			 * gone. Callers treat -ENOENT as a hole and keep
+			 * looking block by block (e.g. fiemap up to maxbytes).
+			 */
+			if (err == -ENOENT && (f2fs_cp_error(sbi) ||
+					is_sbi_flag_set(sbi, SBI_IS_SHUTDOWN)))
+				err = -EIO;
+			return err;
+		}
 	} else {
 		nentry[0] = dn->inode_entry;
 	}
-- 
2.56.0.385.gd3acb90ef8-goog

