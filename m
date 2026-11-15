Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794749266;
	b=wQa/yjqpL2mUyu6W1Ksh/1++3JpDBKi4x+E7cxsDu7aLg08gYuCGZe4nElMjegIlWeQl
	 Gddi/3jrd3xyQMgqsiegpkiq/m8l/TXnnsUF16YYTCPUFVrYfN0j1FyYmR+X+Y22UUqvY
	 gjXn/PJNCAB9i8hNKgjW92zApm3dDWfj9hCaTaCwRVIsaKcWbiDlsLSOofMr+8R/2qJFI
	 SkjhQ7f+untDM6VQxjHCh9Mx0+okrbVOBLs/suE0q9h28cYu9BIHzmwVR56Wqxtpvwpbz
	 3GRcd3GeZNdeiWCi4A+id1HK5eDb1nKcQsR2BXnAJJcaol2yPPSqbMPWRtV00WWbJXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794749266;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=RcSJMzTllFpoqlcqD030BZbd0w78HeFLQAwQPSIp/eM=;
	b=k5jqEhC3RG0MP9rf92SgexYPv3cU7jcQfk/JbGgZV52QFv4dR2pS0zxmSKDjLi1llEb+
	 6O1wFYy4zRyRFoXmsNy6b41+fFaKTJMVSGktw6EkR4uxpXNu3aNJk6g32ANRNmy2CdgvV
	 ++D8X+3e80kjeMqp5LyAH8U89zdkvoOWYv0pmGfitPpEp9VLiqIz8OukA7KMumHtYpUh9
	 m/VbejlKYSGUQ0YOHKbQ7o+kjckHTiBKXtOgLl0DkdMWZsyPfP+MN8OO6/m1ZJwsV3wst
	 qq+EmJ/x76TjsxJ9XLn4wHKHlTQ8qL18G2IDo3Zz23FmNr3AuGHPAck2YM3jJgtaA2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=J5y6xgZ0;
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9713606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:27:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9713606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=J5y6xgZ0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Rc
	SJMzTllFpoqlcqD030BZbd0w78HeFLQAwQPSIp/eM=; b=J5y6xgZ0Ulyr91S7HW
	Uu+AF6ALf+4oiMe2jJHxfbQzSiZMTdl31ATptpuU5PYuv3CoGMB6N3aWRzBw6OSS
	ffDHGP9qdP5ITVYnP31+kOdaYDnsVwQdPOrIiXYmc+9IJXHuvy4fkQq3FFqbE5xQ
	6ii09kRw7KNVv4F0KIgdw4SSo=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wDXP_A1s_lqfjtyIQ--.47831S3;
	Sun, 15 Nov 2026 21:27:19 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuewen Wang <wangxuewen@kylinos.cn>,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v4 09/12] ntfs: initialize packed EA size when creating hard links
Date: Sun, 15 Nov 2026 21:26:06 +0800
Message-ID: <20261115132609.209957-10-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261115132609.209957-1-liubaolin12138@163.com>
References: <20261115132609.209957-1-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wDXP_A1s_lqfjtyIQ--.47831S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ar4xtF1DAFyrKF1xGr1Utrb_yoW8ZrWUpF
	ZxGw1Fqa17XryagF9ayrZIva1fW397Ca1UGrs3Kr12k3ZYq3Z0ga4xKryUWrn3JFW8ua4Y
	qF4Yy3y7XryUZ3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jwAwsUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6hcT3Wr5szcKPAAA3S

From: Xuewen Wang <wangxuewen@kylinos.cn>

A new hard link has a zero packed EA size in its FILE_NAME even when
the source file already has extended attributes.

For files with EAs and no reparse point, read EA_INFORMATION and check
its attribute length before adding the name. Copy its ea_length into
the new FILE_NAME's packed_ea_size. Skip this assignment for reparse
points, where the same storage holds the reparse-point tag.

Fixes: af0db57d4293 ("ntfs: update inode operations")
Suggested-by: Baolin Liu <liubaolin@kylinos.cn>
Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>
Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
---
Changes since v3: add the Fixes tag; no code changes.

EAs remained readable after publication, cache eviction, remount and
reboot. Offline checks confirmed matching packed EA sizes in
EA_INFORMATION, FILE_NAME and directory index entries.

 fs/ntfs/namei.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/fs/ntfs/namei.c b/fs/ntfs/namei.c
index 4d94e3012677..3eb2d57bef1b 100644
--- a/fs/ntfs/namei.c
+++ b/fs/ntfs/namei.c
@@ -1332,6 +1332,24 @@ static int __ntfs_link(struct ntfs_inode *ni, struct ntfs_inode *dir_ni,
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

