Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793946726;
	b=4UAmY6n0/Lj1FCfcOg0VmKyYYSTFwo6UdxYU7IQUYLWisO8v28Ne88yPbHXr1/bVmuT1
	 Ne6Roz5Hi2cUh4g++xpvX/L+YHR+9wcZjEVneOUh4PVEdHkUcIUhn/nwHQ+xSnK/6cDau
	 6tBlc6P2tBNaWOPekDmgTtk8eB6KG3PL/TnkyoTdXor9iMX078vQjNmvmmhwSWUiTUiQq
	 QzjciYK6Eq+sKzW366XlDHYQhx1DnpVXtMx8qMHtzW0stqwiNfIrVeFnT8AZsfQQGbCyx
	 BIXXlduvkqIEusy06bkbiH3HAv/cAWE2kGtb5q80QPJr83HeyIfmsxdREICG2AXdOtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793946726;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-Originating-IP:X-CM-SenderInfo;
	bh=Hzbb0TfCIyhdFWo+4RvZTyGrEJAVH8ZYmIHDqD5uI+s=;
	b=gKbEi8btfQ2OgjCR6QPLJC0j7UajjOR0IcEbM2A/A8C98MBXSbyEGlZQsERGUKeN0c/g
	 XKj7s6joyUq0CGfj2ONE2rDvZTHpQ42Pnjk5BvXz9HpgjZ2AwfbGx7G1259U+apXGISVk
	 PkPjEJTIv8QpBpeZIBR/4WtWisP6mSZPEcI7kwyTtTGEZIxBQUSyamk1uq9yEYd6e8ZnC
	 HLvzlkjJ+wymOrl3qbRakBVW7eFNDLjIcfj4rolugG9vOBCVwq3+oD/RFu6cuTbUcU//6
	 MEc/NtiJgEyFaTAFGfdi5iSarMMwRepYhVCgMFGJvNTWAWUYid+LycyVZd1yVDSq9mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=fDErFda4;
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D103E606A334
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 06:32:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D103E606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=fDErFda4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Hz
	bb0TfCIyhdFWo+4RvZTyGrEJAVH8ZYmIHDqD5uI+s=; b=fDErFda4pWI1K/T+lS
	gZV43KytVQ7WNlNz+afW9QnyrNaIAMeiZHaV0XVcGhwZ/9I81ZZlARGCS4q+EsUa
	bBESxcZLdNG62LCZk5r0MBE3neB8WB3F/g5PsMS26VW9TipFuZfHiHtgqstGLO7t
	wtM44QjnieAcQaMRaeOxZedKs=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3lzdFdO1qwIxJFg--.3403S5;
	Fri, 06 Nov 2026 14:31:38 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuewen Wang <wangxuewen@kylinos.cn>,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v3 3/5] ntfs: initialize packed EA size when creating hard links
Date: Fri,  6 Nov 2026 14:30:57 +0800
Message-ID: <20261106063059.2904988-4-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261106063059.2904988-1-liubaolin12138@163.com>
References: <20261106063059.2904988-1-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wD3lzdFdO1qwIxJFg--.3403S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ar4xtF1DAFyrKF1xWF18AFb_yoW8ArW3pF
	ZxGryfta17Xry29F93trsFvF4Sva97CF4UGr4xKr12y3ZYg3Z0g3W8KFy5Wrn3Aay8u34a
	qF4Yk3y7WryUZ3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jlCJQUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6gpFEGrtdEr2tAAA3O

From: Xuewen Wang <wangxuewen@kylinos.cn>

A new hard link has a zero packed EA size in its FILE_NAME even when
the source file already has extended attributes.

For files with EAs and no reparse point, read EA_INFORMATION and check
its attribute length before adding the name. Copy its ea_length into
the new FILE_NAME's packed_ea_size. Skip this assignment for reparse
points, where the same storage holds the reparse-point tag.

Suggested-by: Baolin Liu <liubaolin@kylinos.cn>
Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>
Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
---
Tested in QEMU. EAs prepared before publication remained readable after
linkat(), cache eviction, remount and reboot.

 fs/ntfs/namei.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/fs/ntfs/namei.c b/fs/ntfs/namei.c
index a83a648c8ff8..5124e7a3e124 100644
--- a/fs/ntfs/namei.c
+++ b/fs/ntfs/namei.c
@@ -1318,6 +1318,24 @@ static int __ntfs_link(struct ntfs_inode *ni, struct ntfs_inode *dir_ni,
 	fn->last_access_time = utc2ntfs(inode_get_atime(vi));
 	memcpy(fn->file_name, name, name_len * sizeof(__le16));
 
+	if (NInoHasEA(ni) && !(ni->flags & FILE_ATTR_REPARSE_POINT)) {
+		struct ea_information *info;
+		s64 size;
+
+		info = ntfs_attr_readall(ni, AT_EA_INFORMATION, AT_UNNAMED, 0, &size);
+		if (IS_ERR(info)) {
+			err = PTR_ERR(info);
+			goto err_out;
+		}
+		if (size != sizeof(*info))
+			err = -EUCLEAN;
+		else
+			fn->type.ea.packed_ea_size = info->ea_length;
+		kvfree(info);
+		if (err)
+			goto err_out;
+	}
+
 	/* Add FILE_NAME attribute to index. */
 	err = ntfs_index_add_filename(dir_ni, fn, MK_MREF(ni->mft_no,
 					le16_to_cpu(ni_mrec->sequence_number)));

