Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28A5396B6F
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 21:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789334504; cv=none; b=TFUNGlr2LHBPf20CCn3Jh3VruS9LtTWog26Ag3kbZ7OUJnLS6bd8NFKh4FpJLrwFoiR2FjSuQ2BFc+4f1B+5MVK6dZSnkKpIKcf9E91q4Que//XyAqJhtWbuF5XBkEoNvU65V/Z5N2YtuQTLnlYCG0E37Ur8GOz3cJNtHrNiMVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789334504; c=relaxed/simple;
	bh=rTEatSh2afYJTS/R+S9oth9gqbiO3TcMxRS2cWJg+9I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bGzzC2EMLER6UhyN3ucEkstpTYLWAl7WWYkuaiChjbMmbcErB0Y3Qw/jilMOPExrdybVDdHAZxisfUU1pNSHGLt6FNhky2PLcEx1Lz/PeyRDnVwRrYRlsem8iICok45S049PDHTPY8o6T8S1w8xLgE0HUB1/WzuWafBKES9BBIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=Yi2XrKf+; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=f/OpCnbQ; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="Yi2XrKf+";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="f/OpCnbQ"
Received: from pps.filterd (m0167074.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DKXnmN634633
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 17:21:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=GK6I
	62eBP+KN+hKQKgUP5QjzfCNYZqmQtRtjxGM6l5s=; b=Yi2XrKf+av8ZxyThDfqa
	GJVLeK9JtYYFmAjln8d7+GMzoBS4Z3OCTNUmQPOPSolLcRGHanCXTAldf8SSX8vs
	+xKd1WftY/Qgps8/xiCQs/fGjBei1C2WSsPhPa6txB/bSeJhuIaWYU6HnjKX9KEw
	9g+OO278T5/IJcE150+J05Ol18fkGo7V6VEdicLymlhHZC5w344D+GzXjplHgXt2
	9bTGlBIA1hHg/ZpFLRM17hQXwqROh0z1Awg7o82WWGcPuGhu7U/uILJFfK78MW5A
	L+2+kJc5TAjzTMdHTaMPjxpMKaLB7sQqwXltqgSAopQAbH2wjKnQkqqjOEBK1Xnt
	ug==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gnwac9nx3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 17:21:40 -0400 (EDT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9104ba8bf51so73763236d6.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 14:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1789334499; x=1789939299; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GK6I62eBP+KN+hKQKgUP5QjzfCNYZqmQtRtjxGM6l5s=;
        b=f/OpCnbQfzcrkCJtNyonRmE5cn0mIfXN7SLd0VJTDLnh/X2NQE6ru1/avbHXNVDlD2
         snnqTdAmO6V9abxmNhcKkCFHKLVale6KaPjZaU6IShDcR0rlsNjONiQBrNmbCfNnb2sW
         LxanefRsTpZ/DunhhKTHJwYlS/Kw81cpSgyja+c7Z4aUXEdT5/EQEh0wmSupuxmcapnI
         /dU304zJTRghw2xAVIc0C+eG/f0o6GMrnQhbKJx/rLuBnn6w7ClZgctwh3E95N6v0FER
         olzFr+Lu/a6KA4Rr3TEJeJie9tsxZ7rQA0PTAAiuGB5yhmdEaSvdij2trqk1UswwrnuV
         GIcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789334499; x=1789939299;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GK6I62eBP+KN+hKQKgUP5QjzfCNYZqmQtRtjxGM6l5s=;
        b=QtuP3AGcko0Z1Ho7q1HLAGuGX1DSE7o1R/aQx5bYuytpBPR9+qFJEHS2UpO6tdw8Xi
         Iaiizqg9bo3gb17eNpP73Du386hx+eNKgJSYNAkW4fR9KOUR89iPord57yKsNwxMHG7W
         a8n9Knsr7/39UhTqA+vmO0HSlU0U7ScHwTPIB6aZ/rqHPJ6uMUNd0eWxZbtpeARGr8kR
         fb11wf0THmd+xgp4i8lE1PM/8Y0Edw/yU/YdofrWR1eciJ2BMcmBxglI8khIblz/fTYm
         ZUEiGitdEIDkqI+DPE/S4O1G5uKJB7HUlE2qdAv59rdgOFMCTNOX4KPgWNdhMzF+YVFf
         W4eg==
X-Forwarded-Encrypted: i=1; AKwUvBwO4WlhQ/7FTzzHsRAQ0hmE/zpdOz+eAoKiru9RUIojiJMieClbIpIRu8wBX5OpR9Dm8cEEltkt8hLqCo8=@vger.kernel.org
X-Gm-Message-State: AFuF++nybslmSD9d5j52fVsIfzzUcE0caeFmVP0UO8DZoYzXy5/4y7Bz
	meXJkIIDWThiwpMsHA/LpbnuHy0IKye/zoTpBn1UqZ/cXsWAzEcbGiW4wiR7SBn0GbPQxuwZUb/
	la1sYSwOGzn3jUFr6xHlRKPYuHDiWkPsvHwaq/kNv8JjcYPXAQtg9y9X3TyqwGg==
X-Gm-Gg: AYBFou0x0uz6D/ftHjdNVRe4fpx+auCVhHrgC7dtZ3cyPWZpRT5hdj8xegk7HNKtDM1
	XVsM5DedWxkR4leXSTH/J1HtWvaWg/cMJ6n4NzKIlNgby/BHCFkiZuufcdgZxiwBep3iu8yOdFI
	oMABcVrrDoShh7pDtOBHulPYJFGGgGvS+pfFI9gbAHfUr56BkwUz4SHNFVDWgExOu3RT5ZrsLNa
	YX9YfoYFjA6ydYtpZRHcgqgjM0TkWdodbX4J0xlvoYUFxC+611o7Q2zjTv+1c9dhZqTTJ9T2csF
	U/TbQdBOPepRQAZsoMuf8qNzSyhWR1lzvkat5oaMPqYB6DTNManHrDnqnhv9SddJH6iHAF5Dlke
	mbrmn1vKjzp9z7vote3pMig8OJ8ZPtAqTZhY7q5+M+noWIyy8fdPjBA==
X-Received: by 2002:a05:6214:f64:b0:910:3452:d57f with SMTP id 6a1803df08f44-912120efc7fmr263360566d6.31.1789334497312;
        Sun, 13 Sep 2026 14:21:37 -0700 (PDT)
X-Received: by 2002:a05:6214:f64:b0:910:3452:d57f with SMTP id 6a1803df08f44-912120efc7fmr263360196d6.31.1789334496876;
        Sun, 13 Sep 2026 14:21:36 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-179-215.net.columbia.edu. [128.59.179.215])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f4d3a50sm78432696d6.40.2026.09.13.14.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 14:21:36 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Sun, 13 Sep 2026 17:21:23 -0400
Subject: [PATCH v2 11/16] btrfs: remove
 BTRFS_RESERVE_FLUSH_FREE_SPACE_INODE
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-btrfs-remove-v1-space-cache-v2-11-186767a7e106@columbia.edu>
References: <20260913-btrfs-remove-v1-space-cache-v2-0-186767a7e106@columbia.edu>
In-Reply-To: <20260913-btrfs-remove-v1-space-cache-v2-0-186767a7e106@columbia.edu>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
        Qu Wenruo <wqu@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789334484; l=3841;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=rTEatSh2afYJTS/R+S9oth9gqbiO3TcMxRS2cWJg+9I=;
 b=ZbhxTfceyOk0EoQpTnqyXZfr/fWc5hGSseSPlkPuJw+jo4skgofAAjaaotzC+HWztoppbiEJG
 sBGxD3uyFZWDmkZ8L8Fpq8ZZnQZOAfU6yCR1KVzDsPU1V6jYfNk/dZP
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Authority-Analysis: v=2.4 cv=BqQIUoX5 c=1 sm=1 tr=0 ts=6aa713e4 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=2jelXx5xVcRIF5zNctN5Qg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=azVShVRs0zEubeQ0wG0L:22
 a=BlyEiQbNVX7t3OJdSnkA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: BPvr7KVVfYzke-wiB-MC_BDLnt0fXAXU
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDMwNCBTYWx0ZWRfX8WZj+beLm9U1
 JDiFOesucKLTlCOXHq9JH+3MVvTmO0Wk+sK/pqfh2GMPV5fD/V2Egp09iZTUKHya2onbhX6DjM7
 4QGmmmtWHr/zPL2WdzaHe9NXk1pGiWiJZKOB0nrzPuJzRUBEb1HH
X-Proofpoint-GUID: BPvr7KVVfYzke-wiB-MC_BDLnt0fXAXU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDMwNCBTYWx0ZWRfXyeBxYz/bQSGG
 fE/cDpKMtIIdeKNyWOxb830OlhYjwN7B968kIMzGXx/9HYHlXsMtuYLfeJjDnwsiU4wsKFyPIQs
 7v+7azmJOoSXcyPIXpDyq49S2Ee6HIybQggVMzcYfdKKeq2tRrj2tH7n+klDjNkIoiVDm1CB5r5
 1xE6s0c2PKr6Z/gxFW3iISlX0+yFT/+jlZgCgERE3z+3LQ1eEvBB48afbXaHmlUk204HenYQ3Ht
 DJ1OD3kSVp/WhsqeVZ/vB1IPTjqEaXQAvCEVI9azSwOMMHbKST5rfHA0/LFgHbcM5iwBf9U0t7I
 p4KDNxFNeyJ4iZb531sv46Om2Tcry3XPS0PlpVxD6u/jEju9sLgsbPF+6BqSL6FWVExTKItpBvQ
 DlqYB+zNH3Arwly5ZmcCqGc75Ul2zB3IjENJbF2wJQoY5Iijcqyf2JjvydCwS8MQ6Ha4+CNSrCB
 hnyFbdXfUxm38Ax8Ukg==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11904
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=10 impostorscore=10 clxscore=1015 priorityscore=1501
 adultscore=0 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130304

Free space inodes no longer reserve data or delalloc space, as nothing
writes to them. Remove the flush mode and the special cases that
selected it.

Assisted-by: Claude:claude-fable-5-1
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
index 39a28e1bec8a..01018152c054 100644
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

