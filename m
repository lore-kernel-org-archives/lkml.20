Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793093766;
	b=UVubq+IXG10QhUXN2SZIDBCNO6gFXctnZKv1Y9YfiGVmOxd8NZHyyOlwxjcS3HeX4PQF
	 2al/YZ/krKwjhXIGfSFZwAjaF794YnSZaic7JMIWCTAJYdAulssCzC37SGpih/DAzejXc
	 o+ZejpD4VWtafdojmBsZuRO4kji5JaSFUFB9dPbH5+QeSAXzYKrV+Q94KFJDkvvSHO4Bs
	 Gr/JhKMPJbS2vY42/BCciAvGHdXMJAPeL6gYN9su2VI8yut6I/+JAdm9QmWXFtn72BgeJ
	 5PM8z5zlNfgSEAGQTDpA2bZ6z9KugjuKoKYHCiBU+pUgMugXEYl7xQOaDGyMYgW5Ezg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793093766;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=eChYoPgAoD06rBVRMqY7u08BQIP93TXsZv72QlEi7AQ=;
	b=IbhO5uZOZfffA4r3NmXTyWud17tuaQQKoJIM6gER4PmOYDOgeSl6jBxVKPqT9Poh8kEb
	 uxu/6BmG3TRfJdoivhxSkWj4B5eV7ivlv13zhGj4MIQFi+70Jw3ZNpBQYK1iQeAluzFJP
	 CXUbzT7RABIM+ZNVGb/PzY2P55dt0x9TgKX4wmhzFcoZCcq0uxjk93/xwu1cIt6COn3RU
	 kUeJO0jx79+aKXl5CNm1Jbm64c69G6Vq38v1AmzPkrt/IEqqJT3HykfiIviRTWFOA972H
	 htCu3clGB5lDh5BKXrv8XU8d0RwxOBwsUf4e5A6KYFq9Fn2kWcrlodRkMBOAQkhEI7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=NDWkYks2;
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70D860A2602
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:36:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C70D860A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=NDWkYks2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=eC
	hYoPgAoD06rBVRMqY7u08BQIP93TXsZv72QlEi7AQ=; b=NDWkYks2gL8r038Z8r
	tB9sJGQIePv6PMo2uRlA9/XkAYRQWebub5TtOmKrq8/Qmabdz61P/xaL0n0Tv6yK
	loZPWTcBiN5x5pRUw5rUT5p769m+qJqwMMUfFllhhVak5m2WSKDmD+95U39p+NTQ
	8IcHr+GGN++fSDawGDuJbAKoc=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD33xFVcOBqdMGFDQ--.18497S5;
	Tue, 27 Oct 2026 17:35:20 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuewen Wang <wangxuewen@kylinos.cn>,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v1 3/5] ntfs: initialize packed EA size when creating hard links
Date: Tue, 27 Oct 2026 17:35:13 +0800
Message-ID: <20261027093515.344799-4-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261027093515.344799-1-liubaolin12138@163.com>
References: <20261027093515.344799-1-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wD33xFVcOBqdMGFDQ--.18497S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ar4xtF1DAFyrKF1xWF18AFb_yoW8Cw4kpF
	Z3KFyfKa17Jryakas3trW2va1Sv3yfCF1UGrsIgr12y3ZYq3Z0ga48KFyYv3s3trW8u34j
	qr45t3y7Wry5Z3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jLXocUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6hgFz2rgcFi-2gAA3-

From: Xuewen Wang <wangxuewen@kylinos.cn>

A new hard link has a zero packed EA size in its FILE_NAME even when
the source file already has extended attributes.

For files with EAs and no reparse point, read EA_INFORMATION and check
its attribute length before adding the name. Copy its ea_length into
the new FILE_NAME's packed_ea_size. Skip this assignment for reparse
points, where the same storage holds the reparse-point tag.

Suggested-by: Baolin Liu <liubaolin@kylinos.cn>
Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
---
Tested with the complete five-patch series in QEMU. Published an
O_TMPFILE after inheriting an access ACL and setting a 12000-byte EA.
Offline ntfsinfo inspection confirms that the FILE_NAME attribute in
the file's MFT record has the same packed EA length as EA_INFORMATION
(12134 bytes). The 12000-byte EA contents also match after cache eviction,
remount and a fresh boot.

 fs/ntfs/namei.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/fs/ntfs/namei.c b/fs/ntfs/namei.c
index 4442e1d..b26fd9c 100644
--- a/fs/ntfs/namei.c
+++ b/fs/ntfs/namei.c
@@ -1316,6 +1316,24 @@ static int __ntfs_link(struct ntfs_inode *ni, struct ntfs_inode *dir_ni,
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

