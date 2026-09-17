Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C2C3CC9E8
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789617645; cv=none; b=YWlvB8/r5/k369kboloMVuWbJ5qnJ9i/6ochEuuE21YMH75GWCP06E8GHkPqjhgv/Gn7kSdt/u/3+QYWZkWks/xdcelINc3BHnEwRzCqwJxVmGmDqzFavLHuFCxaTnUhKZUeoPLxgVgco3KMU9G0vR5MpzIV6S/qKFIFxW/rfd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789617645; c=relaxed/simple;
	bh=rTEatSh2afYJTS/R+S9oth9gqbiO3TcMxRS2cWJg+9I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qXqu4udfyQU3RCKuFOL1HeBmkaCJVVfk0UlyozY90k6cbpxmG2ziW4IHoSYkbW81ixIDDjXjfrp7N72S+6mrRKfcAA01NgN9w6KTXeNN/ccyzCu1HOsd9rolLviCg1xxaVsOrr/kQV+Q5BVNHj/afn9+pRSO02vqcF6Xa2bTUvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=JG8JuXdv; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=QCAmTFhC; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="JG8JuXdv";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="QCAmTFhC"
Received: from pps.filterd (m0167070.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H2YjkV2036102
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 00:00:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=GK6I
	62eBP+KN+hKQKgUP5QjzfCNYZqmQtRtjxGM6l5s=; b=JG8JuXdveTE70FNJWhkz
	Sj3u9lg2ao+Tn7/gQs77n5OFpQwQcMInHeKOf19wSLgZXuBBr4cAv0W4rPNe6jeJ
	feA9D5tAJCIbN1RrQCpkIJuwEZO/qEAGPd/x/6r/eurXAmHq4d30AIQO6EuAzAGU
	V1c4/lNy6ZpslT8CQQ/mgV5/jJbHHcfu/wIWnFBKgiuUf0nqYkIHwD8cULVo35Yd
	JqyBS1fD7/w4WvM1fE8uC4weZa2P5b2qofmdCFSt452zgBmskoJ8gFILJdGd6tdp
	N4kAlzq319cWlaamidJs3pXXJl/0lgyUhqEdIfrJhrsFFX+1TUFbSiwe5Li+uc4b
	5g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gr3tv1cpf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 00:00:40 -0400 (EDT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93909014c85so71043585a.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1789617639; x=1790222439; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GK6I62eBP+KN+hKQKgUP5QjzfCNYZqmQtRtjxGM6l5s=;
        b=QCAmTFhCL/j97kiNFLPj+O4DL3fOpj5z8OWYy3I9ucEjJ9p8wNr9GLoZHIz2FNnAmZ
         JrINxlWUvI3g6xzpnXOrKK7jNayhwQQly7L2U5kqmWHtH+z3xiiV6WADc92wq6wkjk8U
         jgMdQ5M75Y1Q09ielSNMrIX37gZFZvuQgbGRb1EX3jaA1Okp5vqiZ9YipK3aoBsS+xJT
         j5jMDleC2+O3AnMnCXd6R6X81qQNR8MmQfT8X1uFXrFehDu/Lo791CnNJiy6S7yh+55D
         xh5VgbeJ44G+Sa3IchmjNqtOkIafohDM7vu5rSpxkue+PuX4+pS8I/XzCoTvFan4H3zN
         M6dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789617639; x=1790222439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GK6I62eBP+KN+hKQKgUP5QjzfCNYZqmQtRtjxGM6l5s=;
        b=U29GkoxoaRzJcSUv4avIOVOqm6K+ZC3hBWCUIkT6+aU+zoMnm/qPn+1c+ylnT2qp8P
         8u2F6wxVjV5KBpi1rsF+WR+2yU7A/H0bmd2hhlsqoTfOTYno5PpAKspYHE7y4SLyWlL3
         4z+NJQK5M3EBCz7FlC4KrIcetw4wXs8jlC+X2JchtlzrYS9AHzDPxBp/fQbRMip9ucwJ
         MkOWsHJ1hI7X4gLHJgDSa0UC4YBhRxII2BpO9E4dl7nEnFVv0fpltLCdHYj4Tsk0TcVK
         abP9JcTIGP5nyvqjpA1GBGkFXpl3JZs2wvBwRcywGQT35d+kqtStmT4tZftMYpY/1WQW
         ajQg==
X-Forwarded-Encrypted: i=1; AKwUvBwns2CTVL4zY87838RJRRz38YWWBW0H30jooD1cR5Ca2LHdIDvlLQyNfhI2QjHJwxw4onMzGw2tNL27pn8=@vger.kernel.org
X-Gm-Message-State: AFuF++l3SNR6+jloUws3HYouOjMCdmhBTSYpcSBwuvkX2VDX3n9xhKTX
	rwpeA6sEa6474yDUpzz3HXrcwGbV0M4IGWmiCkA8q2W0BkQwVkoQwUy/9XJD2TPCvJ7pjByyx5t
	vXaMBIf1lBorGyYmnr6dMVJA5Ctc8J4irkmpRmP748Cjma0NmNb+Y+UpyoY/HLFducuojQQ==
X-Gm-Gg: AYBFou0QvaN/7JEftCrfPRYOpSDPEus4DV68PG+606B6GFxXNfnklszjpHKfE5PwYAw
	Qffu7ZKvUYTzrkHhmeKTZQm3ntlx0dOAa6h03akV0/3o4Tw9uAo/PSKCStxghWGlvHXwQu0KHbb
	PiYvwSbFZDtfYAits5l26ZyWSEmWOPRGyhHGra8edNlSZ5scgZAviwXyCKDgW3peLnppgV+IvLR
	Cs3BQpUcG1B8XKszdZMdeHUh3H7BOzzqHLUMFgF3Jqfe6KMOJhkoloiKlrJRMINV97qStZZ4mvw
	3B3ophitxtsV1+Wr6sHLUTX6DqajB9Eky+NhKM5NjDfk8A9GRBbkmb5TCOoJof0Fe2znhNiDOIE
	x30Wy7oCdDbfnMAufG5BXCT5pEupFQ7A1NTGypZtcW2Tcug==
X-Received: by 2002:a05:620a:450e:b0:939:8373:b552 with SMTP id af79cd13be357-93bb76e6382mr844245785a.1.1789617639535;
        Wed, 16 Sep 2026 21:00:39 -0700 (PDT)
X-Received: by 2002:a05:620a:450e:b0:939:8373:b552 with SMTP id af79cd13be357-93bb76e6382mr844239285a.1.1789617638949;
        Wed, 16 Sep 2026 21:00:38 -0700 (PDT)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9123beadde6sm41748766d6.35.2026.09.16.21.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 21:00:38 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Thu, 17 Sep 2026 00:00:08 -0400
Subject: [PATCH v3 12/17] btrfs: remove
 BTRFS_RESERVE_FLUSH_FREE_SPACE_INODE
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-btrfs-remove-v1-space-cache-v3-12-10ebde03b96f@columbia.edu>
References: <20260916-btrfs-remove-v1-space-cache-v3-0-10ebde03b96f@columbia.edu>
In-Reply-To: <20260916-btrfs-remove-v1-space-cache-v3-0-10ebde03b96f@columbia.edu>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
        Qu Wenruo <wqu@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789617622; l=3841;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=rTEatSh2afYJTS/R+S9oth9gqbiO3TcMxRS2cWJg+9I=;
 b=0E9XVpUBVOquIFrMxLveRVOBGXb0CQOO1+3nXZiVQ69wCdezbEW+0Rr/+6oxxWzurFvt6Ygrp
 gsfyr2XzCAWCUMUTP8g3I7aH6hs47zPvbjNBQKpj2NxD1ZugKE6Qlfa
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA0NyBTYWx0ZWRfXzxVZbO9KwKhZ
 Bvw1+FbZSUyjA9KFx5GVeizBqUOs8+coBWAw6G1oLoRz8uLmFj7ACYUOc+kOUpuTZuJHBkp3riJ
 8e2rwTscqkx5oMK//mcnPd8OzJma8W+fcl67geANSK5NZi98Rjj5rnM8OZZdNxSyju9rh9Dlabj
 1isTp5Dk2/VYLpyn1IDQqQ9qMzUxV+95Sjf1qd5nojWlXO6tW712VTiMJqxOVUg7arvjsqkSqDn
 tAbmwGQgZ3TjH9DjrM5+vYjH84K5lQQbGdfnVkoO02CibS9vgejhpHCI1MPkEYMJTEnRkTQeef1
 M1RNyH/7zwxkttv5qTAeKzyBslpQSgo2wiVUhhquXyYfSUGi0bMc9Sx/otnKYZcpI8iRSieIFul
 LekLnG/yBgI1shlZMDYoAPI+l01MdZNWa6++WxbHRSg9TFoo16L26I5XhlDwYa2YijPRxvv68+C
 r08MnUp43MwtmbZHiqA==
X-Proofpoint-GUID: pJPdcsVcWWK8uiltycH0UqnU5AUun_2B
X-Proofpoint-ORIG-GUID: pJPdcsVcWWK8uiltycH0UqnU5AUun_2B
X-Authority-Analysis: v=2.4 cv=JIeuIMKb c=1 sm=1 tr=0 ts=6aab65e8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=svvvyxlR1OQQkelhaPoB:22
 a=BlyEiQbNVX7t3OJdSnkA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA0NyBTYWx0ZWRfX1Tfv7y1OSpZk
 /w6yBRa4JwLoM+Bp0g1jIG7XJleQe8z0fGc+f2E841J7fO7PkWQgqHnDbtb0w6Z07786WPGDJcq
 cBlcMknDdg9hB/HX3zbK5C5mlCGeI6o2Zs4QHXDOLlRNHz6UX2W8
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11907
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=10 suspectscore=0 malwarescore=0
 clxscore=1015 spamscore=0 bulkscore=10 priorityscore=1501 impostorscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170047

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

