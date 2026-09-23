Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE8043B6E7
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790143421; cv=none; b=EdDfhndA5RyOQCCeiZTTVnjivFJ4DLhRhVwGBnQzb3g+9BKHovF2L2tp3LP6ftjAA/1b81Xsj4RI1c+tD5A9BIJqPRzQX/ZR5wj0+IyePPGHODXlYtSARk8/NfX7smB4DZ1hiZRTzUxKICRB7k3Sf31Cu0KHKMcAVlkcmbBi0R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790143421; c=relaxed/simple;
	bh=dJEHobYU4RAHvYMcm55K9ocTqTIw/eTQ1MP9+/bomEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QHZ9mWsNpkxHXqm+oDtS04GyEcdoHq2Mb89d//mw4F6NXOqamOap5uVzoZ7aONLIeb7TllzqS9qdjDsZqZz8QyLE5XUcEN0XHl+R6vJkaOl4y8bTP9UPG6WbQy2ABw6t85NJJ58fJL2zLzPEGAXwStpMrqoe4STV5q/JA8gZUBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=JXqywgaU; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="JXqywgaU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=d2
	V/uhA5Nr+uRfziR+eTgIF69MwF6vW6j3mSPlkQWts=; b=JXqywgaUFeeClJZSXx
	mSqZu428DXcW0wPcCMvc6/B6tfeekiBQw4g6fCxpwkP50+hfWNV0D7Bm4dEmbmgR
	x9NHEZb6/oYCm5gcyvFkzLiYRitoJsFqlDvPMCHK+2/XPdKr3EiGAEuorN7rN82q
	4U5HkDY+1n37qEXrYdr5PjI3g=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgCH_E+Ia7NqXdW_Aw--.58316S5;
	Wed, 23 Sep 2026 14:02:57 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	chenxiaosong@chenxiaosong.com,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v4 03/10] ntfs: propagate EA write and truncate errors
Date: Wed, 23 Sep 2026 14:02:39 +0800
Message-ID: <20260923060246.2499192-4-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260923060246.2499192-1-liubaolin12138@163.com>
References: <20260923060246.2499192-1-liubaolin12138@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgCH_E+Ia7NqXdW_Aw--.58316S5
X-Coremail-Antispam: 1Uf129KBjvdXoW7GFyfWFW7ZF4DXF17XF17Awb_yoWkZwc_X3
	WxZF1kKw4qqF1kGanrArnI9r1qqa18ZF1qvwn5K3Wvy34Dtryqyrn8Wrs5KFsF9a1vkr98
	Gwn3WF13AF13GjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUnEtC3UUUUU==
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6hKGUWqza5IR4wAA39

From: Baolin Liu <liubaolin@kylinos.cn>

ntfs_write_ea() replaces negative write errors with EIO and ignores
errors when shrinking the attribute after writing a shorter list. This
can report success even though the final resize failed.

Preserve negative write errors, use EIO for short writes, and return
truncate failures to the caller.

Signed-off-by: Baolin Liu <liubaolin@kylinos.cn>
Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>
---
 fs/ntfs/ea.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/ea.c b/fs/ntfs/ea.c
index 2ee700f8227e..98ca9e4f8d25 100644
--- a/fs/ntfs/ea.c
+++ b/fs/ntfs/ea.c
@@ -32,12 +32,12 @@ static int ntfs_write_ea(struct ntfs_inode *ni, __le32 type, char *value, s64 ea
 
 	written = ntfs_inode_attr_pwrite(ea_vi, ea_off, ea_size, value, false);
 	if (written != ea_size)
-		err = -EIO;
+		err = written < 0 ? written : -EIO;
 	else {
 		struct ntfs_inode *ea_ni = NTFS_I(ea_vi);
 
 		if (need_truncate && ea_ni->data_size > ea_off + ea_size)
-			ntfs_attr_truncate(ea_ni, ea_off + ea_size);
+			err = ntfs_attr_truncate(ea_ni, ea_off + ea_size);
 		mark_mft_record_dirty(ni);
 	}
 
-- 
2.51.0

