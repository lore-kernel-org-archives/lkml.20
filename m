Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62D32C15AB
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 01:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788830404; cv=none; b=gbQkCNqKZCQogdE+nok4qmma8Rtt1Vd8fYQv5TnpfuQyvaAP4VV2gjd3rzByvgcNa+blr3hEtLRUmZCqhrf1XU48eNN0u9jkLxUUT66yz7GN2oxzD/I7CbX+YhwhnMWNxiccLEVLJr+hbUc9bR86OSPb6ehYoKAZektwBKnSLXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788830404; c=relaxed/simple;
	bh=kFUTxFDqlauqnOuGBmlMcLxmkO5BLLT9VUQ1YBQ9R2E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q65b9UYXrtg/EKBTdaWB9eMzPosxYcvFFuubWdvybVuKtTuDIxYyAkHo0xe9J6YQrLw87vT3+em9IVh4Iz/Vdb4mtAjuo6Zi6aDoAoaQP/hUUVDPIjm6A0HLeabORbvMG7y4UiPXPd2tgdfjzkCZ8S4dyzILDj2mCdyNFIaeELs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=TK22kqC7; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=MQyD9x4V; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="TK22kqC7";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="MQyD9x4V"
Received: from pps.filterd (m0167076.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6880ukO13905435
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 21:19:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=/O5J
	vOcml7Z5nuc8BFyxCL/aEuEOTcA4yiAQqS48lHQ=; b=TK22kqC7GHrzoqdswG0l
	ptflbLZBy5jQRN90818lZhB+n8+LfuxHKanBi+0awQ6F/6zDTvXgcjfE7wdZfM03
	2YAH+FGnt5Vydd2JB6q8UjvJx87o+tNaWLXFjZcaj+GCo92BF+OlZVDekQrYUXKF
	Z2LBYlJiqx7BzI77yhspSDjyEKIGiN2pUZEoxqgwFeku8sVZFwzKgUYxwUQ6KWul
	KV1cNHljKK2L2k6geHFi/wA+g/oK8UIXcEiTo75VHEP5UCtyxnjLjVL3JGNex5Zm
	f8nrTB4CG3L/DDtltQwhLXaXBCKpKf9Ywe2ISbpfXRNnPo4rqzy6XmZY2WFLtLFJ
	eQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gj4yjryev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 21:19:55 -0400 (EDT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92ec3146553so970546085a.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 18:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788830394; x=1789435194; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/O5JvOcml7Z5nuc8BFyxCL/aEuEOTcA4yiAQqS48lHQ=;
        b=MQyD9x4VLJ0BIOtzxGdk34rb+DsaTTL/YVrr3dE836qe2wVboSfva3u6W93sjj3G1F
         OkwhUXSD4PRyq6L+mzv5UUuSUqMrltk+fkfruQm6FyBOPCU3CNijsZNvyAuEP0HVpqu3
         zycLaUj8PSuC80OVqpymM58J+wrOjJgiUWij5c4MR/6bs0caSjv5Wo2lx/TOe6/VmEey
         trkBLQRaUnmZr0oJYQ5mzah9o34orv1hilK1GT23G0DGaQFRX5KFzbAJaAZSa1KsbVCR
         ub0IRYdugXmfQIpdXO/0th1RT0vzzCfOxVMnt/8dxwklGg9Pf7BEGWvmSatvKZnLfPsQ
         7cWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788830394; x=1789435194;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/O5JvOcml7Z5nuc8BFyxCL/aEuEOTcA4yiAQqS48lHQ=;
        b=oX0TLy6kNyJo0oXCg+LmdkdycapCewNklojUm/hd4YhuckKfNlBDqS39vZyba9CPyO
         IfnMHJsOU9LeC3jSUym0gjSL0GAD8Qm0M3uLLM1QtiUNqUm/B/CK/4kDYb6+/goe+CrW
         fpKRVX2F/+up/FEFUEJWkVVEF/99Qz+jn3Fmd44dtyTH5474V2eB1JpIATvo1r0x28Mg
         YWiH8WXnE7kZ2ZqgZeKP6OG5RqcjrvWVYcWLV16/P8rUBeT6tmGHV3RaVHsCk25aVrR7
         Jc5Vpkq3xf1GXNr6ozcyWFgRvTWNFE8vYRe4aI/AWs8p/6sTd1YVAudvWC/4S2gC1eg/
         iVRw==
X-Forwarded-Encrypted: i=1; AKwUvBzDTNCJJFMyOUT1IwQexJHDJzq32AOexlAlLr98VyZDnTrS/O2V+gkUHFDLOic+fp+hOM9X8ADTMzlLCrc=@vger.kernel.org
X-Gm-Message-State: AFuF++kJ+QvjHrYb+p+R8YUBu3oWZiP/t5ql3uxyE/C0Z/zaJwGD3vGM
	3miGyZeOZ3oZZ6JezSGDnwtnc+cV7onGOjMP7sUdmb+839i37W9FLiXbvXMYrs57Cm18CXaKo6M
	JL7HlwxvbDdibrm/1V5wWjK/9YztgrFsWGZmLRexH8sSBPJTqe5fgKlxNLI8IWzjS/rtMPGip
X-Gm-Gg: AYBFou3kZfT/Wlv//kRa+jGDRwGI0og/dN6CEIIov9uNkMHkdS4jjnbzfJOeEKQuM6z
	zU6QeW5DqyGhtJvsdtnt9JvTTNRaghB4TBzA0WeHrMuGzufMEGrS7dl3uP/ObZbfVmnF46qBs2z
	0Lj9AfvtNkRAJxfruPzpcfTsWVjcIFq8aTT7BJ0oYNaVfiIiHGcEtK/IdaHe1MybxIDwMhrDx9z
	lQiExEKRgRWU313rk96HcmPsBkgwDPeUK+jpAQ/KAXf8nmKMvMxYMVz5gzxodWHXR4dCdMT6/1w
	iklHGjVgkekJFcW/YjUJsLH2nYwIsyPFcxZI+5vQp99lMCDscOp5NcO/jKBqFAxtXBYbf1q5fLS
	QYIGIFzObKIDCPGkVOvhzuslgtm8ip0V6CdposjvQ6YJ50e9lkYg=
X-Received: by 2002:a05:620a:172c:b0:936:77d7:55a4 with SMTP id af79cd13be357-939805edadbmr2698403785a.19.1788830394599;
        Mon, 07 Sep 2026 18:19:54 -0700 (PDT)
X-Received: by 2002:a05:620a:172c:b0:936:77d7:55a4 with SMTP id af79cd13be357-939805edadbmr2698400185a.19.1788830394197;
        Mon, 07 Sep 2026 18:19:54 -0700 (PDT)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040694543sm104322656d6.33.2026.09.07.18.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 18:19:53 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Mon, 07 Sep 2026 21:19:20 -0400
Subject: [PATCH 05/15] btrfs: drop the transaction handle from the prealloc
 helpers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-btrfs-remove-v1-space-cache-v1-5-5f9a5ba352a7@columbia.edu>
References: <20260907-btrfs-remove-v1-space-cache-v1-0-5f9a5ba352a7@columbia.edu>
In-Reply-To: <20260907-btrfs-remove-v1-space-cache-v1-0-5f9a5ba352a7@columbia.edu>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
        Qu Wenruo <wqu@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788830387; l=4704;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=kFUTxFDqlauqnOuGBmlMcLxmkO5BLLT9VUQ1YBQ9R2E=;
 b=R0TMQB1UvIb0hVP+YS4BV1sCIG3y5ILFNwzAz7BUChVgdvPg0IIqjuoW5JzEs5lYwTNdiZMOz
 fIWqIhJhB4DA/6W/D8AQV3Rxx5+nHvlPHD/O1/V5QvDeJZV3asnZljZ
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDAxMSBTYWx0ZWRfX4QSQFQdzNKsD
 P7LkEsrrpzaSkFAKTi41iXoeTbHw5QqZN1q+7v6BCAew3Lp/SsZhrgvn0rMPG/RaeECY+DkYfG1
 EJNlxxni+HBw/PUlUBE666wOrYbkGWLew14eb+e0HHBKbbKtkdgR940XZQt1aRE9XzOMpTs1rA6
 O0Fpie0Hwoo1v2mRytGv/mFu2cup2pf8R/WiwjQf4Umvk3G59td1aff+hI/SsenvF5IE49rKQdA
 DS4R1igicyR12VumhHiEV8Cv9QI/Zhyc5xjsNcXaOL7bo48igXCd/rPh0gvl71s+8+sJjGHypJp
 tygXMEd4/+GtDQo5b58LMEGnepm9dPoZmdz90ZZ5n3l5J1fWYrpx1QFMOl9tEcc/LnmeJ3prQ7M
 vGpixR9jPV24xmMlKefGxrH3h2Vz+eg6U0/rtARmnMKBwjk76QQuBJZ92N1HSHFEohDDDLGVkR9
 TC6wjkNRD+t+1eptY9A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDAxMSBTYWx0ZWRfX4FG47vaMdjRs
 Re8p/az7jSmO/tqBsSx4AjJQBVOkcMN8hdpS6zxSG4DAELCH1tHCe/9K45KL87yf16C2vydXS68
 SU96b9+n94H+BBBill6RbVKhwvtKfor+//g2Hwd/ZGHjG2J+HeyV
X-Proofpoint-GUID: qhCXYsgfpdTJXXzV-CseTpNemZbv58VG
X-Proofpoint-ORIG-GUID: qhCXYsgfpdTJXXzV-CseTpNemZbv58VG
X-Authority-Analysis: v=2.4 cv=K/QS2SWI c=1 sm=1 tr=0 ts=6a9f62bb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=Qm0qsxP7aFY2tkT6R2MF:22
 a=u1qPvHribVpbYRjuRIMA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11899
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=10 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=10
 lowpriorityscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080011

The v1 space cache created its inode during the transaction commit, and
btrfs_prealloc_file_range_trans() existed so that preallocation could
reuse the open handle. It was the only caller passing a transaction, so
__btrfs_prealloc_file_range() and insert_prealloc_file_extent() now
always start their own. Fold the wrapper into
btrfs_prealloc_file_range() and drop the parameter.

Assisted-by: Claude:claude-fable-5-1
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/btrfs/inode.c | 47 ++++++++++-------------------------------------
 1 file changed, 10 insertions(+), 37 deletions(-)

diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
index 0d890d04d854..699a321fc43b 100644
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@ -9137,14 +9137,13 @@ static int btrfs_symlink(struct mnt_idmap *idmap, struct inode *dir,
 }
 
 static struct btrfs_trans_handle *insert_prealloc_file_extent(
-				       struct btrfs_trans_handle *trans_in,
 				       struct btrfs_inode *inode,
 				       struct btrfs_key *ins,
 				       u64 file_offset)
 {
 	struct btrfs_file_extent_item stack_fi;
 	struct btrfs_replace_extent_info extent_info;
-	struct btrfs_trans_handle *trans = trans_in;
+	struct btrfs_trans_handle *trans;
 	struct btrfs_path *path;
 	u64 start = ins->objectid;
 	u64 len = ins->offset;
@@ -9165,15 +9164,6 @@ static struct btrfs_trans_handle *insert_prealloc_file_extent(
 	if (ret < 0)
 		return ERR_PTR(ret);
 
-	if (trans) {
-		ret = insert_reserved_file_extent(trans, inode,
-						  file_offset, &stack_fi,
-						  true, qgroup_released);
-		if (ret)
-			goto free_qgroup;
-		return trans;
-	}
-
 	extent_info.disk_offset = start;
 	extent_info.disk_len = len;
 	extent_info.data_offset = 0;
@@ -9213,12 +9203,12 @@ static struct btrfs_trans_handle *insert_prealloc_file_extent(
 	return ERR_PTR(ret);
 }
 
-static int __btrfs_prealloc_file_range(struct inode *inode, int mode,
-				       u64 start, u64 num_bytes, u64 min_size,
-				       loff_t actual_len, u64 *alloc_hint,
-				       struct btrfs_trans_handle *trans)
+int btrfs_prealloc_file_range(struct inode *inode, int mode,
+			      u64 start, u64 num_bytes, u64 min_size,
+			      loff_t actual_len, u64 *alloc_hint)
 {
 	struct btrfs_fs_info *fs_info = inode_to_fs_info(inode);
+	struct btrfs_trans_handle *trans;
 	struct extent_map *em;
 	struct btrfs_root *root = BTRFS_I(inode)->root;
 	struct btrfs_key ins;
@@ -9228,11 +9218,8 @@ static int __btrfs_prealloc_file_range(struct inode *inode, int mode,
 	u64 cur_bytes;
 	u64 last_alloc = (u64)-1;
 	int ret = 0;
-	bool own_trans = true;
 	u64 end = start + num_bytes - 1;
 
-	if (trans)
-		own_trans = false;
 	while (num_bytes > 0) {
 		cur_bytes = min_t(u64, num_bytes, SZ_256M);
 		cur_bytes = max(cur_bytes, min_size);
@@ -9258,8 +9245,8 @@ static int __btrfs_prealloc_file_range(struct inode *inode, int mode,
 		clear_offset += ins.offset;
 
 		last_alloc = ins.offset;
-		trans = insert_prealloc_file_extent(trans, BTRFS_I(inode),
-						    &ins, cur_offset);
+		trans = insert_prealloc_file_extent(BTRFS_I(inode), &ins,
+						    cur_offset);
 		/*
 		 * Now that we inserted the prealloc extent we can finally
 		 * decrement the number of reservations in the block group.
@@ -9331,8 +9318,7 @@ static int __btrfs_prealloc_file_range(struct inode *inode, int mode,
 					range_start, range_end - range_start);
 			if (ret) {
 				btrfs_abort_transaction(trans, ret);
-				if (own_trans)
-					btrfs_end_transaction(trans);
+				btrfs_end_transaction(trans);
 				break;
 			}
 
@@ -9344,15 +9330,11 @@ static int __btrfs_prealloc_file_range(struct inode *inode, int mode,
 
 		if (unlikely(ret)) {
 			btrfs_abort_transaction(trans, ret);
-			if (own_trans)
-				btrfs_end_transaction(trans);
+			btrfs_end_transaction(trans);
 			break;
 		}
 
-		if (own_trans) {
-			btrfs_end_transaction(trans);
-			trans = NULL;
-		}
+		btrfs_end_transaction(trans);
 	}
 	if (clear_offset < end)
 		btrfs_free_reserved_data_space(BTRFS_I(inode), NULL, clear_offset,
@@ -9360,15 +9342,6 @@ static int __btrfs_prealloc_file_range(struct inode *inode, int mode,
 	return ret;
 }
 
-int btrfs_prealloc_file_range(struct inode *inode, int mode,
-			      u64 start, u64 num_bytes, u64 min_size,
-			      loff_t actual_len, u64 *alloc_hint)
-{
-	return __btrfs_prealloc_file_range(inode, mode, start, num_bytes,
-					   min_size, actual_len, alloc_hint,
-					   NULL);
-}
-
 /*
  * NOTE: in case you are adding MAY_EXEC check for directories:
  * we are marking them with IOP_FASTPERM_MAY_EXEC, allowing path lookup to

-- 
2.39.5

