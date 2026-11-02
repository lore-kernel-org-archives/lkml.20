Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793605015;
	b=mPC3HUebZicVInnFFqoTwAAPp+e7yB1hoKT8VvLY73+C2u4HF/oZNQaz4F6H+9Qf3Zpi
	 DQTFhkKKktCX0ZMc4qfaejtDnzcbRvfUZYmPlzRVm/yleJ0UIZ3X2vFxyMWshuqekowBq
	 mIkl0c24jb1m1MPfcX2PFmQMxXMtJB0qFMiR5ANeLFlGAw3YPV8QX+PBYqeWoyA7z4xKz
	 SILv3nGyHLt9raIkh9CanrIWRbvKOXQw5Yy1Wjk6CiuKYxxqkAA9BISCu00iIYEDO/ivK
	 6lsQEs6e1+MGWhmYUdkpSwQFDTz+27CRWQs2f3JKfQ9r1mvt4BMsp8oOQYpi4nQe0Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793605015;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=cypUzZ6AYG5QMOYi1mQUeRZtTzSozcO7PB+ZckpviMA=;
	b=EAJQdW5eVjQFuk0S2AkQGDpzEzKNpTz0KRjXK0Z7kXfN3wj1iV8/c+rzCPMrV4jCEbbo
	 MaT34tsGq1qlC3vqXTosYAIU08BOtOgbIxkH8I0MrBlL+tPg8ZOA25cDB1e8GXgCprReM
	 Lt9i83vwMhmMOD0cnM6vTkiVTVyMODCJe1gL8mCFVl4RO35duzroz45brNXKxV7OhaJB0
	 f8QFqiLxHDTifT/ilod9ZzNJRcMnGa9DvoLfjmjBrsZ3uFsYzgXAIE77s6bPV/yJd9FJl
	 eYdeQSHQSEYoI/GJfq5dW95t4X+h4eyu9rwwIcNgtzi1epYNMnDOqxWF1M50x1N+VbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=hRi2aLhG;
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA9C606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 07:36:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BA9C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=hRi2aLhG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=cy
	pUzZ6AYG5QMOYi1mQUeRZtTzSozcO7PB+ZckpviMA=; b=hRi2aLhG8UP04rX5E4
	P+nWHrcs3uBFlIT35fesueKMSNXoYtoR0ga+Lt2MjApPNbhmLPfLmZLVnULn72K/
	DTIq5B05Q5I7ZJxWXFHyej2vQ+UT0ynqcb9Xk5S9CruP7ESTJt8rCzL11EqNP4SX
	etNklkE0kjlqamgYEm21DV6H8=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3vy+HPehqF0lcEw--.2040S5;
	Mon, 02 Nov 2026 15:36:41 +0800 (CST)
From: Xuewen Wang <wangxuewen_ky@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: wangxuewen_ky@163.com,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuewen Wang <wangxuewen@kylinos.cn>
Subject: [PATCH v5 11/31] ntfs: handle source record removal failure during attribute moves
Date: Mon,  2 Nov 2026 15:35:12 +0800
Message-Id: <20261102073532.98873-12-wangxuewen_ky@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261102073532.98873-1-wangxuewen_ky@163.com>
References: <20261102073532.98873-1-wangxuewen_ky@163.com>
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
X-CM-TRANSID:_____wD3vy+HPehqF0lcEw--.2040S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7WF15Gw43GF43ZrWrArW8JFb_yoW8AFykpF
	9xCr93KrZ8Ar1ayanIkF43Aa40v34xWw17WrWUGw129F4Fqw12qryrtFyIvFWftF95tr45
	Xr4DW3y3C3y5ZFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j24E_UUUUU=
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbC8ApGL2roPYrebQAA3V

From: Xuewen Wang <wangxuewen@kylinos.cn>

ntfs_attr_record_move_to() ignores failure to remove the source attribute
after copying it. It can update the attribute-list reference and report
success with both copies present.

Check removal before changing the list entry. On failure, attempt to
remove the destination copy, mark its record dirty and unmap it, leaving
the list pointing to the source. Report destination cleanup failure
separately.

Shrinking a record to zero needs no extra space, so failure indicates
inconsistent record accounting. Return and report EFSCORRUPTED even if
cleanup also fails.

Fixes: 495e90fa3348 ("ntfs: update attrib operations")
Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
---
 fs/ntfs/attrib.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index 5af8ac41af17..f1c99e0d8dca 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -3578,7 +3578,17 @@ int ntfs_attr_record_move_to(struct ntfs_attr_search_ctx *ctx, struct ntfs_inode
 	nctx->attr->instance = nctx->mrec->next_attr_instance;
 	nctx->mrec->next_attr_instance =
 		cpu_to_le16((le16_to_cpu(nctx->mrec->next_attr_instance) + 1) & 0xffff);
-	ntfs_attr_record_resize(ctx->mrec, a, 0);
+	err = ntfs_attr_record_resize(ctx->mrec, a, 0);
+	if (err) {
+		err = -EFSCORRUPTED;
+		ntfs_report_file_metadata_error(VFS_I(ni), -EFSCORRUPTED);
+		if (ntfs_attr_record_resize(ni_mrec, nctx->attr, 0))
+			ntfs_report_file_metadata_error(VFS_I(ni),
+							-EFSCORRUPTED);
+		mark_mft_record_dirty(ni);
+		unmap_mft_record(ni);
+		goto put_err_out;
+	}
 	mark_mft_record_dirty(ctx->ntfs_ino);
 	mark_mft_record_dirty(ni);
 

