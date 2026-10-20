Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485949;
	b=Yfqr2rbrv+PmQNFZaqUN7qjZmLup9nS03num4s4LboEFseMsh7Mfvh4t4sN6Ce9z/Sg0
	 A+xz08OCY1mhcc++iptSueYOcrkY+kKLEmJDYC3abQuGEzIwc3Coa7X2V44UgtPl14tKT
	 8B3GO6qCqEkySK+9xJy/tbfowOb6tgcPQ7ETxuP97KEJppAg/9MgvFwTbXFyzYUerl2qy
	 JzOj/5RQv45P9THDUKLfz3eiKJlOwbgN5NfYkAT+KCw1FFP4CRpEC/WOBPN5k6IGBC8h7
	 p6wKdWWhWA0OyJYWSEwPvkLiI+w/xwFPSVTZtTwMff5ksjpUTZf3PhmWUY0Ss+F+oSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485949;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-Originating-IP:X-CM-SenderInfo;
	bh=AQ5jSJI1Kxt5pKE/9y1epqNS0CAgxyq8X/eZ/7fltn8=;
	b=lpt/bjd1zmomvDEWPGdsR6Xaty2F3o8GvWSchMLnY19IR4GhzONFcjOoZEvWf9pc2gdi
	 KICZDjYP6aF+spUeSmOKoKmN392N1JKh1SPWcguRmErPmmkoJRKGVMCzCWDMdeRnVlv7f
	 UTUqKBy9SmCmyzRBC1OXagEsOZAxYdmacs3givPkAxQMzByqysvr9mjMqbm3+1i4+rBw2
	 V95B3ANL5EWSoJ6/XZcq0PGCNb5SDt5fMihB3s8I0HKmTktWi7RYgR83fZ7nd52Fpl/hu
	 wL2jkuYRkDuO5mjdOEuU2O5Pj1vs3qv8kzokk9GfVEQTpYezIkx48g4dPFyJN9q528w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=pL4qpUaO;
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED9160A2631
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:45:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2ED9160A2631
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=pL4qpUaO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=AQ
	5jSJI1Kxt5pKE/9y1epqNS0CAgxyq8X/eZ/7fltn8=; b=pL4qpUaOxlzxOtBdbq
	/0CyBQk5OtFJKKEtUD2kpGGG7JDEGHC7ObCcIFfXJ4la/sxRVaVNu9yo3lreRETR
	3s9INAVwyIHgiPTldIwmJqV2RxWmNbU3m+5vgfN99waZ9fhrwEKDwWw0ji7uvTUn
	AKjKU1ZE3mmzakJbBxa1H9JSA=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3n0ksKtdq7UkHBg--.56105S5;
	Tue, 20 Oct 2026 16:45:36 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	wangxuewen@kylinos.cn,
	wudandan@kylinos.cn
Subject: [PATCH v4 11/31] ntfs: handle source record removal failure during attribute moves
Date: Tue, 20 Oct 2026 16:44:01 +0800
Message-ID: <20261020084421.2196486-12-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261020084421.2196486-1-liubaolin12138@163.com>
References: <20261020084421.2196486-1-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wD3n0ksKtdq7UkHBg--.56105S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7WF15Gw43GF43ZrWrArW8JFb_yoW8AFWfpF
	9xC3s3KrZ8Ar4ayanIkF43Aa40v34xGwnrWrWUGw17uF4Fqw1xXry5tFyxXFWftF95tr45
	Xr4DW3y3C3y7ZFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jHHqcUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6RAn8WrXKjBZWAAA3J

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
index c59643fb766a..07fb1c77c7af 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -3576,7 +3576,17 @@ int ntfs_attr_record_move_to(struct ntfs_attr_search_ctx *ctx, struct ntfs_inode
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
 
-- 
2.51.0

