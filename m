Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3269F52FE42
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792075439; cv=none; b=YkdqpzacCZ/gMW6Dotm3HIoPLLUlGC2mgd0LPOkdtRUuiwBhOBeWdyFItqf12yUoYrL0M0k59O7jN9F4qJqN0Dk5UZ0X8mABmLoGkqTYG6dk9+ngkbXKfT7Yjh6iP2f6pmVd/funTOgL7bzgc/HVvwAYtDYu1TDWjYNgAiimZuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792075439; c=relaxed/simple;
	bh=Q8kMUvkchi8ZXnZWlunY2gvD2w3lqlTZB1VbWriL6IE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OT6yS3h8YnESjrkaLCzD3cjZ22xH9yydo0P5iYNN3b1quDBTq3UUYenjSjTiy4/L6/S9OFBK+msEi7kvQo/w+YqeHeZViTBrC9sxtQBHCIkCgEW+/MB5zhMz6tZRZatR5zzIoPJIdEnVyEGenVKddgKJxGvXVlOfQrjfsgRb1uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=ae5L4K7k; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=wX8jMrL7; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="ae5L4K7k";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="wX8jMrL7"
Received: from pps.filterd (m0499198.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FEY9BA2220650
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:43:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=XRlN
	+xnNjSQu33S8Vq/FCqmhKpj0NiuWIv/8X+QT1Sw=; b=ae5L4K7kl0GOgJAgiqmy
	2HxVZVIkC9Q7+GjntnTJ5NO9VyXEOVyGdVZRBpoNWEMf5z05cjEtmdT95hH49KtC
	CLW+9W49c0hJTm/AtjTBj2ophj2PyhlU/827fFXXgdBlX1/CL+7Tz1hYUZvqcfDn
	RCHrwVZYNpDteMC1XG/aoy7lXnhFh2ojU8sqyqXd0P1bFj9cwbO3RqwbFK4qRqr3
	kR7hGuU+vfWRKAvNEHd68ifdFX4Z2WWhRN2e6S8JoTo2egVn0cqzNTFjvJd+Tg57
	ElzBA1rahWsp9rHdrpL3kiihpnjKCn9oxQqb/QPaMjtJugJ2ixrNr9xX/2nDuuUP
	uA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4havrsjak3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:43:54 -0400 (EDT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91961d4b31bso112326366d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1792075434; x=1792680234; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XRlN+xnNjSQu33S8Vq/FCqmhKpj0NiuWIv/8X+QT1Sw=;
        b=wX8jMrL7FXMvlRzoKMcZwUPJwtM+dWZR6nukbKOsPFWZ/lmq7d4cb9q3UZDeUplJAc
         Wdvh06XmtFljhtSyc84ezmcHA3Ye89h8fLzWpIIWPnBRRPyGUXl7f6yuUdEKQtVMhNWl
         M9c/41H9RTpRJAbwQa2dB6zMjqamGRzbX/0rEn2NcY71kubVgL6CLx8ZE1fsjBtFMSRo
         tJWi64FQRNML5nFpNCOY4bLlxOV1YRLkh3c89I0YQ0dJzO9mrFe2oZ2XfXR5StjgE29P
         m1tIkFdfTlRVYgzlaWgk/fHw9ON3tzeOQd4zyp20YTS3bBXzZY7lrVZSJUMu1mflupjb
         kYbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792075434; x=1792680234;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XRlN+xnNjSQu33S8Vq/FCqmhKpj0NiuWIv/8X+QT1Sw=;
        b=gEgPWvEKZcAMifuYw2ZLmh20hjGlrpC/YPJxkHD8gkL2j79kL2CYe4pkk8/Dvi8cpn
         OvtP2jipE64qkSt7OoCsFBc808op0tKdbIt1nxanxMCKppYbGtRbwpv+yxg/DM495Cl2
         s3wq7sRfEdo13qZQICPPg0kowqQP4/u3ru6s1Na0nqRf/PZG3EGyFWgMg3SYCY8XVeeV
         DH4s1QwACo/TVYxRFa1elO/D2FSFy4kBbvuO+8yBBVWH8Rsca9+XxAr60YZXwDZYuYlS
         8Pb6amGqAb9cwfn/BMQYTTEO6zOnY3P5A9BNDm0yGIEpXN96zSpKUEr8L31+Nz+QCAjg
         m5Mw==
X-Forwarded-Encrypted: i=1; AKwUvByK5w2LiYW91rZH3e0BVNCMcR4rInQldbVrXOgYJ1EBgScn0lPdFBKrbU568CajmC0KTlPKkR7anQHQBzg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLeX8lVftGdMr4KMzfZWyjNqj0Lfo8Wc1FoY6QF/A4vJhZIA9Z4
	Q9K9lYn0OTnJxFXcUd5qZJesEuU9fWDbrcVRvioIAFGJZOEejxuVNxd++YkiupMJJYwp1Bvg5Pv
	ylgiX5LLzMAZ3E+ktdWPgKtWTRvX+ftJmgSE10d/xgMuXL8ReMKhkF/qYiOvsiw==
X-Gm-Gg: AYBFou1ybzb5GOvIJbV7CkZYhEa4WisREBRGkhV5fvoYOykwCcE6LO9mcabsozEg3hy
	LvTxQvP7tVynamsrA/KM1M0LfsrWxisdHuwFt90IbbsQACLPwYVUn3U8DPWbo+z/j1k20Gk+Jre
	y2UzN7/oFvaQHZYjBlKPRpqOUOPbzmX9Xg1vaCcnpxQdY4qoEU/bbkZWDFldyypTZivvXLysr03
	EzwxH+9sDIoeJ38KFzTOrY1mUlG22THJ7NTqnGad3eORnKUAOvxFzhv0Pd7dq0sjKZJ+V9B37vV
	GPL7H1q/E4hv0OHI7bMnfde/2oibXDZTIq5btIOiFTlLvhtocjvx9kb/oWgThPDJe7DqPZ4hl9X
	hsw7LOe6NtW4rXpQrRzeVzpyFv3jsmU+kBK319zBXVkKs
X-Received: by 2002:a05:6214:2468:b0:919:7cbb:63b4 with SMTP id 6a1803df08f44-91b554f087fmr322481656d6.13.1792075434075;
        Thu, 15 Oct 2026 07:43:54 -0700 (PDT)
X-Received: by 2002:a05:6214:2468:b0:919:7cbb:63b4 with SMTP id 6a1803df08f44-91b554f087fmr322481266d6.13.1792075433624;
        Thu, 15 Oct 2026 07:43:53 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-176-51.net.columbia.edu. [128.59.176.51])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b5f323sm83026476d6.20.2026.10.15.07.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:43:52 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Thu, 15 Oct 2026 10:43:31 -0400
Subject: [PATCH v5 18/19] btrfs: stop reading free space inodes from the
 commit root
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-btrfs-remove-v1-space-cache-v5-18-6b31347d9998@columbia.edu>
References: <20261015-btrfs-remove-v1-space-cache-v5-0-6b31347d9998@columbia.edu>
In-Reply-To: <20261015-btrfs-remove-v1-space-cache-v5-0-6b31347d9998@columbia.edu>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
        Qu Wenruo <wqu@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792075404; l=1979;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=Q8kMUvkchi8ZXnZWlunY2gvD2w3lqlTZB1VbWriL6IE=;
 b=tLdzBU+HXbTY2A0NmgWoEaMDYi7noNEo3UbDuTro48jwMNw8+1h8/6tv7jKfFvCV+G3ovariB
 Z/IMiUXRQFmDvrXvVwzRCnvP3fj+H3cEq5EIAZz3GxKEd1t7J223g+l
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: Gx863Q0lvh0QD4mcWY_JfgKtauxBa00Z
X-Authority-Analysis: v=2.4 cv=L/KI0OT8 c=1 sm=1 tr=0 ts=6ad0e6ab cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=NKoNGjn6KhAaSQkl0TXC/A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=BpGzv1V74M3SfeTrGa8v:22
 a=F-rX_8kjA07mH5tGMmcA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: Gx863Q0lvh0QD4mcWY_JfgKtauxBa00Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NyBTYWx0ZWRfXyG3QLc+UU34x
 N1N6Gu5pelVUGMmOKLHFjTmTBQsFQkEIh/QIZdbr+NGiOds6YQGJBD7z5jcYZEVmT3+zrnf3WPB
 jMpYychv5OrpX0/5ixNAPSTgFmOE4oNXsMhrag9ICJMQmuYRrXrBKDSYQRLjw2sUzFaVh0UGtkb
 a7oMpmwxewK773yMl+BPUHI4s9SgR6lhbivWmxsO0v+Yal4ta7gKif10MLP+8aXJtjsGAuf6A0x
 AJ9TGmLZPigitb1SjPKFSFbZEm+WzbncftDme8+xSwWM+2ba2J9zz/NKpyKm7z27erQq7xw3FKc
 3zAse7hv8P5Y79eP5+SAI/unPY+klkMJt0lPhMl4qkEk1gLSxXiAtO5kXpaUQrWTwy/jPYJcBGK
 0W1IQHpA4POGt1vAXB5nopDN8LEw8FLhZidxxVZorOLDLEBIi9yEqDhf7iInl96EQx+W1jIGGQT
 FW9jqLPyuXRg6dP7tHQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NyBTYWx0ZWRfXxw6WFuFIq8ua
 ACWfp9LOZ1yc+YI6e2BabPx9r+5eRuSrXtXZc6X1UcKVWpC/P4cETiyc47++N+WhVKpL0qYODJJ
 4dVdwfLk4h93XB7B/ScgFtdWwnlt+1YaPmrNCb5lup6K/NraE+8A
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11936
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 impostorscore=10 adultscore=0
 spamscore=0 bulkscore=10 lowpriorityscore=10 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150057

Free space inode data was only read when loading the v1 cache, which is
gone, so btrfs_get_extent() and btrfs_lookup_bio_sums() no longer need
to search the commit root for them.

Assisted-by: LLM
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/btrfs/file-item.c | 11 -----------
 fs/btrfs/inode.c     | 10 ----------
 2 files changed, 21 deletions(-)

diff --git a/fs/btrfs/file-item.c b/fs/btrfs/file-item.c
index ae1fd4da38d3..ff8f8cad00fc 100644
--- a/fs/btrfs/file-item.c
+++ b/fs/btrfs/file-item.c
@@ -396,17 +396,6 @@ int btrfs_lookup_bio_sums(struct btrfs_bio *bbio)
 	if (nblocks > fs_info->csums_per_leaf)
 		path->reada = READA_FORWARD;
 
-	/*
-	 * the free space stuff is only read when it hasn't been
-	 * updated in the current transaction.  So, we can safely
-	 * read from the commit root and sidestep a nasty deadlock
-	 * between reading the free space cache and updating the csum tree.
-	 */
-	if (btrfs_is_free_space_inode(inode)) {
-		path->search_commit_root = true;
-		path->skip_locking = true;
-	}
-
 	/*
 	 * If we are searching for a csum of an extent from a past
 	 * transaction, we can search in the commit root and reduce
diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
index fd8962000096..b071ed59a583 100644
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@ -7232,16 +7232,6 @@ struct extent_map *btrfs_get_extent(struct btrfs_inode *inode,
 	/* Chances are we'll be called again, so go ahead and do readahead */
 	path->reada = READA_FORWARD;
 
-	/*
-	 * The same explanation in load_free_space_cache applies here as well,
-	 * we only read when we're loading the free space cache, and at that
-	 * point the commit_root has everything we need.
-	 */
-	if (btrfs_is_free_space_inode(inode)) {
-		path->search_commit_root = true;
-		path->skip_locking = true;
-	}
-
 	ret = btrfs_lookup_file_extent(NULL, root, path, objectid, start, 0);
 	if (ret < 0) {
 		goto out;

-- 
2.39.5

