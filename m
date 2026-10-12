Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F212A4B828D
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791822536; cv=none; b=FSAmZbmT2zacob5VXMukpAZXT9QVC+G2G0SVihVkvGLQ1qiILsCBfBxA/Uwk1mshBSqMXl5DXlhlm2HI2amgzpoVeskeLU+eADN0rzT5vASy+CjEfErxq5xQvJkScw6CBYWIrkYoFTuUvsC540q9sIx2IvByHE+71fadnaSKIzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791822536; c=relaxed/simple;
	bh=arsb3xKreiHkRh/xUZ5DvTISjpW9UKH6nJJTb0TxpNI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o8N3QUlOKboVYr8Qs3NXxfWkFkFw9luNlJEq41bv9pEaz7smfUsu4mXjLSnyZ1XFosX6XnHqsW///JT7TnRsMmc6kRXnC6CLPlEJEfi5k0ZMrv8lWiDYe5B7FoakXjlRCUa+JSqpbdVFwrgMgxRe9iOsCWxHELC/uM/ObvEKA8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=pieWHkbv; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=x9FbQjLx; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="pieWHkbv";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="x9FbQjLx"
Received: from pps.filterd (m0499198.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CEgTeQ1222137
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:28:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=XXgh
	lyHKaZSzvCGjJWEbghaa7lm//M8bZyCIqIXgaDs=; b=pieWHkbvBZa+Djn0Ztub
	R+r2n4oAB0IF+Ic8lUy+FED+U2HzpOCEInyK0bny5F4HjSpNBFe9dS6b2v2MJCOY
	r1R4kFlQZvZYo2ch2SjuOfOCJgzr3MMh2ohq3j70SKuvTwXWa7hMAZgEHmNBzFoz
	5YXlF0YnHvnKw0/Ccs1+xdA8ePeidzTY5DKPw8g3UybKB7KW+6QH6NgFnerr+Mft
	AshwgNLd8yNh7IEw1qzld3Ikm7lJgAf6K4DXlkcRET7eOtLg8ryJhBU9IkLV7urw
	c4imkCp4nW5tEgLX59/FNYtDW1NEnzB/RJGvfXOqtztHc5rnmi7X2jPKhora45uD
	WQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4h8y4w2sv6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:28:51 -0400 (EDT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-53390e79a19so36974621cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1791822531; x=1792427331; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XXghlyHKaZSzvCGjJWEbghaa7lm//M8bZyCIqIXgaDs=;
        b=x9FbQjLxIc43OWX7l3AFt7KfWfp+JjSYutv7TfXX1PSeGp2ewpPV8WKBX9FLR1pNje
         /cHAutcZPR3bWbu9mSxa9AwMoH0Bz9EDF2+A7Suzx2tVrn5TeglHVEdkx16cUAHxHmri
         iaff6iWwbryE0hC8GTOshnrP8xKMOow7iLBkJaeAO4FxmDtnt78T5MFwEGUtkQ82acSc
         eADQz7wpRP9kvTh94BuQwW0W0X0ZxPBQ2WNiyU6ShYvLpDGKDTFYDjOcZMNo5vDitX4R
         WhW96l4vtou6Gv//pwP6R32BaHVc2imfHTw9yjYYqqFwEvt0YLjKaYeFiuKjLrnLj0Ey
         X4fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791822531; x=1792427331;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XXghlyHKaZSzvCGjJWEbghaa7lm//M8bZyCIqIXgaDs=;
        b=J3LvnjAPt42lsa53uLUv8eHPCxgbR6wXPAPmpW+/nMS+W4czXY+ryWxWmFdB4VXRYE
         +uVY9DLfarziS22dA6HLPXuPxlZuYY6QNWiHMSd2cQ3RknLr9X1Gh3eaO1+ZpqJY7wlU
         buEX8Tbg/lt5mOAgf9dqhLouzTGXMlsZblcAYJQqLlQj6tBxXC6bHhA1b8b3t+dw0YOX
         QRMD5kZwAln42aiOJKkHbI2YGDwuB5s1BnAH6A94PHqMrVipaBjqVbqPgPTWTfn9deBt
         CMA7diSg+aM69ZfSQBsqyg3OLvqcKSQa2Si9+pXnx7ZggLl6tnyOP3MrT4o879snSqcf
         qy/w==
X-Forwarded-Encrypted: i=1; AKwUvByqVFi1pBiikLhfLorWSpVxKaa89OnIg5cEVGCdG38ZvYIYNYwCVECaeJLLFm6F2f/na5lNMxwuZsx1yOg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIcvnuR7jM+ev+NYACaZz3HSYK0mwiFtwzO1xIVESzHoCj6i8U5
	UI20DY5f9Ogt57ETx97wLh9hKwoRLuQV9AcoVJgSoF6WJ8NktlQZxsjZoOai9beOCHGThquMYkL
	UBdnLeT6LaeTJ5pV1DDtfiqmpmVDhQMHEHf8y8TkOcdjdf7DhopHoPuyzxlLody+fIT1tXg==
X-Gm-Gg: AYBFou2UmxO7hZtP3Cnl6mLJYal9uFPtesHlrkIZXExFmVCwMp4/uZYtE/eW6DdV79o
	SA9FETBkBrJFpnEsRItSDF8uLIOxwEkg4eFEIpTImqdAf++x/KSxzuL7+sWNcMikm5AR5qKsEyY
	kIgr698mdRCOaEbyeTJWpUkmqUysRsTRjFn6yIaH9TotNHxGpQFk4rsZdQ2/AHXkx/aVVnDv7+b
	EYAYmBm8qMrOqryn4/o/PUWsvkSXHKSidkYtBWGvShGfIdzf3oB4uFICcKLtRtCneYRswOBCCP3
	QOpOYZSNRcH5gqZ1EGAZBVCP0MbWzVf4EJKS7XSUmfqDFQo2zGpsh2cnWQDvgMu/0dnrtO1AJwC
	V/nhLdXadq3dlPV9DUKovDFDGutVPXJooVeSc4CI0l37HnoQ=
X-Received: by 2002:a05:622a:1e12:b0:532:c057:9564 with SMTP id d75a77b69052e-5359fab3627mr169217901cf.23.1791822531156;
        Mon, 12 Oct 2026 09:28:51 -0700 (PDT)
X-Received: by 2002:a05:622a:1e12:b0:532:c057:9564 with SMTP id d75a77b69052e-5359fab3627mr169217361cf.23.1791822530598;
        Mon, 12 Oct 2026 09:28:50 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-178-231.net.columbia.edu. [128.59.178.231])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97c27146sm1411796d6.29.2026.10.12.09.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 09:28:50 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Mon, 12 Oct 2026 12:28:25 -0400
Subject: [PATCH v4 13/18] btrfs: remove
 BTRFS_RESERVE_FLUSH_FREE_SPACE_INODE
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-btrfs-remove-v1-space-cache-v4-13-f125bd8c07f9@columbia.edu>
References: <20261012-btrfs-remove-v1-space-cache-v4-0-f125bd8c07f9@columbia.edu>
In-Reply-To: <20261012-btrfs-remove-v1-space-cache-v4-0-f125bd8c07f9@columbia.edu>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
        Qu Wenruo <wqu@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791822515; l=3821;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=arsb3xKreiHkRh/xUZ5DvTISjpW9UKH6nJJTb0TxpNI=;
 b=KS6Sz+z1pBnIuEr/wM91RjDbECU3kCa0BtzUFbMa5RwSYt0R2MtdSQV27tQH/WZDb5YTKkY5p
 tbu9tKCoBl+CGsMTUjFMs0b5/r2VwEpgXkvRn4EakqiBvAykjYegxEn
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2NSBTYWx0ZWRfX5bArjdWGDAmr
 Ll6M5AfnBiVa/S5vt77tNCSjvLgY+RbrgJkiRvNUgzcvKDFmC3SBH6pW52GUj3KVwZVtORsn4tx
 ULkALVgrStJp+CKmq9xugdMhjM1EDx6I3VsjlaDkyIs5l6C4dEZK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2NSBTYWx0ZWRfX374C7ddgfxPO
 L9aBtu781XBlfeLiJMcRKTvbgMByh7BiRj+YxiSK1HwVblGdQd7NGe1jZIdaLQeTsYRAwhVXRjL
 wOMWKYIw4ScKpXAGMpHq5jJOKjt4q3nw1TyhcRKCH0kqbj/0ILcfdj+L2vGuxnnDg2uWMHlbry3
 PTSzLSf8CuqMK6Cul/HxAvk/KrxiBmtJ1ILaIlHs+BRQmjuP1KI11X7Ih+XDZpQxCJof7rdD1xa
 ZG/YdbuMdsFjXMPe5Mkk9uEdF068x48ulDuxrHkjNhShPjvL3SQbuqyre6cPWgfM9VAdFfEncpS
 Nx1ZXIig2bOthNL6p5shACYrdYcVc8upIL1yNofgYFylspwpvIKVhrv2B2T43uRlCzVZSu7iT4p
 nhkiaBZEDiimeRM/o381n06EYt+7djxWbsIiWgEsJlKGcm3JhevyG20Oe1O15n7HDlBjheSqdOH
 P9FFEVc9SALzFF8z/tg==
X-Authority-Analysis: v=2.4 cv=GOydgeNK c=1 sm=1 tr=0 ts=6acd0ac3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=9fnr1hFzp71kSIFw8uYQYA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=BpGzv1V74M3SfeTrGa8v:22
 a=BlyEiQbNVX7t3OJdSnkA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: -fQs-T1sllvkcFseMuHEzAcizIhP7GEg
X-Proofpoint-GUID: -fQs-T1sllvkcFseMuHEzAcizIhP7GEg
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11933
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=10 phishscore=0 adultscore=0 impostorscore=10
 malwarescore=0 priorityscore=1501 lowpriorityscore=10 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120065

Free space inodes no longer reserve data or delalloc space, as nothing
writes to them. Remove the flush mode and the special cases that
selected it.

Assisted-by: LLM
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/btrfs/delalloc-space.c | 13 ++-----------
 fs/btrfs/space-info.c     |  2 --
 fs/btrfs/space-info.h     |  4 ----
 3 files changed, 2 insertions(+), 17 deletions(-)

diff --git a/fs/btrfs/delalloc-space.c b/fs/btrfs/delalloc-space.c
index d357ed7efd99..77781852e417 100644
--- a/fs/btrfs/delalloc-space.c
+++ b/fs/btrfs/delalloc-space.c
@@ -132,9 +132,7 @@ int btrfs_alloc_data_chunk_ondemand(const struct btrfs_inode *inode, u64 bytes)
 	/* Make sure bytes are sectorsize aligned */
 	bytes = ALIGN(bytes, fs_info->sectorsize);
 
-	if (btrfs_is_free_space_inode(inode))
-		flush = BTRFS_RESERVE_FLUSH_FREE_SPACE_INODE;
-	else if (btrfs_is_zoned(fs_info) && btrfs_is_data_reloc_root(root))
+	if (btrfs_is_zoned(fs_info) && btrfs_is_data_reloc_root(root))
 		flush = BTRFS_RESERVE_FLUSH_ZONED_RELOCATION;
 
 	return btrfs_reserve_data_bytes(data_sinfo_for_inode(inode), bytes, flush);
@@ -155,8 +153,6 @@ int btrfs_check_data_free_space(struct btrfs_inode *inode,
 
 	if (noflush)
 		flush = BTRFS_RESERVE_NO_FLUSH;
-	else if (btrfs_is_free_space_inode(inode))
-		flush = BTRFS_RESERVE_FLUSH_FREE_SPACE_INODE;
 
 	ret = btrfs_reserve_data_bytes(data_sinfo_for_inode(inode), len, flush);
 	if (ret < 0)
@@ -326,15 +322,10 @@ int btrfs_delalloc_reserve_metadata(struct btrfs_inode *inode, u64 num_bytes,
 	int ret = 0;
 
 	/*
-	 * If we are a free space inode we need to not flush since we will be in
-	 * the middle of a transaction commit.  We also don't need the delalloc
-	 * mutex since we won't race with anybody.  We need this mostly to make
-	 * lockdep shut its filthy mouth.
-	 *
 	 * If we have a transaction open (can happen if we call truncate_block
 	 * from truncate), then we need FLUSH_LIMIT so we don't deadlock.
 	 */
-	if (noflush || btrfs_is_free_space_inode(inode)) {
+	if (noflush) {
 		flush = BTRFS_RESERVE_NO_FLUSH;
 	} else {
 		if (current->journal_info)
diff --git a/fs/btrfs/space-info.c b/fs/btrfs/space-info.c
index 72fa01502461..82d4ac418a2d 100644
--- a/fs/btrfs/space-info.c
+++ b/fs/btrfs/space-info.c
@@ -1704,7 +1704,6 @@ static int handle_reserve_ticket(struct btrfs_space_info *space_info,
 						evict_flush_states,
 						ARRAY_SIZE(evict_flush_states));
 		break;
-	case BTRFS_RESERVE_FLUSH_FREE_SPACE_INODE:
 	case BTRFS_RESERVE_FLUSH_ZONED_RELOCATION:
 		priority_reclaim_data_space(space_info, ticket);
 		break;
@@ -1968,7 +1967,6 @@ int btrfs_reserve_data_bytes(struct btrfs_space_info *space_info, u64 bytes,
 	int ret;
 
 	ASSERT(flush == BTRFS_RESERVE_FLUSH_DATA ||
-	       flush == BTRFS_RESERVE_FLUSH_FREE_SPACE_INODE ||
 	       flush == BTRFS_RESERVE_FLUSH_ZONED_RELOCATION ||
 	       flush == BTRFS_RESERVE_NO_FLUSH, "flush=%d", flush);
 	ASSERT(!current->journal_info || flush != BTRFS_RESERVE_FLUSH_DATA,
diff --git a/fs/btrfs/space-info.h b/fs/btrfs/space-info.h
index aa836e8a9d4a..d0130c8ba3dd 100644
--- a/fs/btrfs/space-info.h
+++ b/fs/btrfs/space-info.h
@@ -66,7 +66,6 @@ enum btrfs_reserve_flush_enum {
 	 * Can be interrupted by a fatal signal.
 	 */
 	BTRFS_RESERVE_FLUSH_DATA,
-	BTRFS_RESERVE_FLUSH_FREE_SPACE_INODE,
 	BTRFS_RESERVE_FLUSH_ALL,
 
 	/*
@@ -82,9 +81,6 @@ enum btrfs_reserve_flush_enum {
 	 * priority flushing for this, because otherwise we can deadlock on
 	 * waiting for a ticket, that cannot be granted, because we cannot do
 	 * any allocations.
-	 *
-	 * Apart from being specific to zoned relocation, it is equal to
-	 * BTRFS_FLUSH_FREE_SPACE_INODE.
 	 */
 	BTRFS_RESERVE_FLUSH_ZONED_RELOCATION,
 

-- 
2.39.5

