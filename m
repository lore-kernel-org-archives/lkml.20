Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416C92D8762
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 01:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788830415; cv=none; b=dwoK2lnEdDG2Rw9YXdBFbBlC9Y9/CEyhqWRkWpyVaBnuRu/o5U0kIXVZuJoLbltHYK/OAU0msXx2Cm1pY0NBTz7Ym9SWlsRmSZI+iLGn4ksoF1lJfDC4MsuP2p+0dT3mgBIoCYav130hPvJe72ubLlnMmSypXjavt+KwYovHXR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788830415; c=relaxed/simple;
	bh=rTEatSh2afYJTS/R+S9oth9gqbiO3TcMxRS2cWJg+9I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c5E2sXkygCnzUdGnvN51gwvhmW3lLwm3TE1UjBN9kjvo20Bm3VCyADHAnDaHS4DDMVg5McsbNkHSyi2BmUBfNJWe74zUvAJznXKdYUWkEo+hR20aMqgCjo3PrRJpO1aRLk3Mkc8y2kQDJZ4rb7qEcfq+v67oG7r0dclr7pAw9Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=F7n8Ve79; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=DU4iwVod; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="F7n8Ve79";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="DU4iwVod"
Received: from pps.filterd (m0167071.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6880vdka728471
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 21:20:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=GK6I
	62eBP+KN+hKQKgUP5QjzfCNYZqmQtRtjxGM6l5s=; b=F7n8Ve79uCInyhpgZzFQ
	bnrcyOL8DNKFOCZfnuvfIceYivutmT8GhkYDKbmHw/mudxbsfWnrblVjwI6gWqRv
	bxnYch57eW+cC92baY077AjlaC8NXyMYmdm1/uDJAk/uTGtedSspwcWFMBcDbWxX
	ImDTnTyIV1UGBB4/c2DEv6cd2EqkfwVjS8tJGxV1a34/SFqGMpGRhd4VGu9PPmUa
	Tfv9fbMp4Lamb5QavYikj/4JPkGIqKdh99SQW3G+jXEIEKKtQ68coUKYrUVnuH7+
	vzKz+kqDeajk3QKR5y5CEoDIv+l0sZniKYbtccE5Lxj0vx89aghnVLCFXeKflnWw
	xQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gj4d596mq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 21:20:01 -0400 (EDT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93917f4ccb4so483257985a.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 18:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788830400; x=1789435200; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GK6I62eBP+KN+hKQKgUP5QjzfCNYZqmQtRtjxGM6l5s=;
        b=DU4iwVods0UcDIji+HsxRc/yl5kzuiykmwsPhVRcScmhM6/b5kZUI5z8MDVjxTYmD+
         wE9V2+PoKsgHg60MeVWCNTODDOt4T+8RXcONJxqrXiCtNP7pNNOpojGOD3h1oLJlz4u2
         1sWA5Aow//KMYX8MdjQ81CqfQ4xc1aOobCgkCWZCEDlEhzDr2FqvdYkCNDDyaBmTvvUV
         zEglw+CwsRtg1RddxxK1c31VzEmLnqQZEA1Y6osFc0nf5Nhi20MSNqpn9kZL+e7s+ULd
         tTqCbLAOQmC1g5Gzsox9qjgDqakvRwUQt/PsLciwkGyINYoeNWDCpOPneN4FwmYY/1AX
         hxHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788830400; x=1789435200;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GK6I62eBP+KN+hKQKgUP5QjzfCNYZqmQtRtjxGM6l5s=;
        b=E/T+an4ME9WrEOKcjq1ofuGvMRFJPmwgzd+54jGUqtHLG5LX+xOTxV0XnZZnGEi22y
         xcul8H95NVj6Wgjka3/fi+/rc/1XJH4DE2JHLSmJCdbKb6LtR4c1zaz4efqGJkbQ/Ef0
         VQrH+4PHEJQqI0eRiCLdEAJI331MtK2qnItw8Cpj9VoYy7y5d9Y4KzIEABbTbYvUBf4P
         Ci8CEr0x4qrrfWkqk++0vTr9XLHPiqVEKuOjGmPPgBpT9iMy4sAwLac+RaI9XElLpXlf
         lr0fzx493GmBpg2id2XsGa8x+KkIrhhWQ4i6neSbFQFh7WHrE71f1+bL4t/9zFfYMr6w
         5klA==
X-Forwarded-Encrypted: i=1; AKwUvBxk7N4bNUdr31bBqgiV2kI0HkfaK+MXrIfqLF/Wi1Ttp2njjZvvHQ6KX16lGLj34PAiI1aJPF4i72XdGOI=@vger.kernel.org
X-Gm-Message-State: AFuF++mNEAsfVUXci3x8cDZzjGFE4biOqQeCQiIBmhuQgTIIMrnLxLiu
	G59zMzunH6cU7imUhI1616aC+xj+VN74675zwXx9zVoQpSOW5VKdN6Ngl/VH6JtvAgn51n+GRvQ
	u3pb3MFX65Dfc2TEbnhr+PL16m7hdc4L/RzmQ8Yn6+mgq0WwsVEuW2cfzlZlS/A==
X-Gm-Gg: AYBFou3LqrC9lS1JqGI8jcDGQfNK02aqC3VMSMpj1VIRi4kyj1FzI39rqwwfXHUCJIC
	BaAD5iPqVCtmnStYe4KL5Z7uwnzY4wak4JLQnDBu4C0vuuQ6Lo/mAId218s2MC0o3LarVbzm1jc
	3kwY/4R4k5jd4iX6tvHNwTNfhdtPvOBzbMEwZ5eznHEjy1YdlmKdwRchrmZ55BMG9obleLsO4aL
	9kFOEMdYh96jRqrogt0ccNCwqiDKyTR7YvufKhih66rzAyGjpuC2SLR0qT/Ym4YDqCo98flMu8Z
	nxwQy2tTCJWSeuI85x19/B6r2QTOxjr6JuxPJF23hOztVgok04tS0PwR0KGXnnPqvlX/EM1i44g
	1dQ41ui7CcIMLQzF9dZNaUIDGCiSb7fe3CkoTMQmUBcOHF22VONY=
X-Received: by 2002:a05:620a:bcb:b0:939:ad19:c5a4 with SMTP id af79cd13be357-939ad19deadmr994370185a.39.1788830400055;
        Mon, 07 Sep 2026 18:20:00 -0700 (PDT)
X-Received: by 2002:a05:620a:bcb:b0:939:ad19:c5a4 with SMTP id af79cd13be357-939ad19deadmr994366585a.39.1788830399605;
        Mon, 07 Sep 2026 18:19:59 -0700 (PDT)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040694543sm104322656d6.33.2026.09.07.18.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 18:19:59 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Mon, 07 Sep 2026 21:19:26 -0400
Subject: [PATCH 11/15] btrfs: remove BTRFS_RESERVE_FLUSH_FREE_SPACE_INODE
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-btrfs-remove-v1-space-cache-v1-11-5f9a5ba352a7@columbia.edu>
References: <20260907-btrfs-remove-v1-space-cache-v1-0-5f9a5ba352a7@columbia.edu>
In-Reply-To: <20260907-btrfs-remove-v1-space-cache-v1-0-5f9a5ba352a7@columbia.edu>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
        Qu Wenruo <wqu@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788830387; l=3841;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=rTEatSh2afYJTS/R+S9oth9gqbiO3TcMxRS2cWJg+9I=;
 b=vyHSY9/TnUHDP9/BFrGyZaLEpHlN5VMmjY8Ad8G3nuY6mRdG8nF1FaffM2qYKd/uCWqJtnXMl
 V0z8FsHIzLECXsQ3Lm4inVw8kf6RLOP5i6SAjrF6RfPSIRAsZXJxrAi
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDAxMSBTYWx0ZWRfX5B+VrXjCjmGY
 /Qp9REy1EZz4gIR3CB7m2oBEcWYZOx2wnbv6dYJBdY5Vkg0VqoZagbS+vMbjQ3IyaUve3g+oKfF
 nNnwY/4fXAHyRuZDH/dAaLV9SPf5hsN1LvTzdQ1hjluPJW7+9CiAJr7Tv/cuHPwEjKdEln4BIb3
 u59q7TMfjiZal1iPnWa1jziVRooUhH4y1aONzjMuWtoElpHfnIkFQwS7RxCMIS6UgKVQLvts7BY
 xgQrh/YOm57RlJvnQiLp/VDepH2p9Y67ioeCdAFaFwyplbMzBaEvkO6xcTC3HUuzqgp2fabAT22
 Ca9ZFFiOP9T2l1ox85F26WicwUC6JCBkTdVoioyXWJLvsCALWnavIYZ0c27LNdOWgMfX/x48jG9
 OHpg3pyqtm+ui1dugse7eACFD5kxVAuzCAPXUz/BWOjwIjVmC+rXmJvasp/pf1xfW7gdCsTcMll
 on+dZtLIvhGcXIcCGlA==
X-Proofpoint-ORIG-GUID: GMHIMa7sX-Bu5zSveuO0dy-GIOFC5L1p
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDAxMSBTYWx0ZWRfX1ZpMbGcuh6Fd
 lOnAhDAR0g7Kg+NGRbKqetAfFNyDahu5CmZp36gL7ZlhZ4kvB5Dg1SDiX/VhXjAfx83lxkwdmhG
 /0J74HaksHqAGeuYbRjmOw3LjHN5P+vnGVFCt9Rt4XVvZHkJUaQA
X-Proofpoint-GUID: GMHIMa7sX-Bu5zSveuO0dy-GIOFC5L1p
X-Authority-Analysis: v=2.4 cv=BqCtB4X5 c=1 sm=1 tr=0 ts=6a9f62c1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=79PYxaXUQd1wl-QFWJnA:22
 a=BlyEiQbNVX7t3OJdSnkA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11899
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0 impostorscore=10
 lowpriorityscore=10 priorityscore=1501 clxscore=1015 bulkscore=10
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080011

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

