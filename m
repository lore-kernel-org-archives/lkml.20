Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31BD4B126A
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791822529; cv=none; b=oenihkSgoZNawhpUakDMO4BGOaPE6vdJ1aSjzOEQWRUmbXxZ0otvMYFtRJS/bAbyURiUnnX68KuwMEcqTTfL/ovZcQhIoDXENf2DoPGK8QE+Ywvp2EH0yBMLKIXbaZ1WlcuqSZhVmnKCjOUEqSkiOTiQR+u1e4UB6pJSAZ8jaLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791822529; c=relaxed/simple;
	bh=uxR57VbSHtp1aqLOsgEPT8x0WECGBWUquczUd2tk5/o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dfdsCgxL30C88CAeBsYXipzAwDOUnTFwTBqApBzvNGhHB2pkbG6pr4X5Wx3cPGdz05Q2BlxkF3guSc0DrahuUSWSKHYxr/vI41uD8uf3mD0s78J/myIG9bWv38x22iIq/2odzy1C4yALfqLVqIktfR+wnAhfPjSQK28Tkp/+Z7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=R+5xAEpB; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=xwgkm1jZ; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="R+5xAEpB";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="xwgkm1jZ"
Received: from pps.filterd (m0167069.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CF4OLK2695252
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:28:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=YW5H
	T2u5ekA6cpwOBjjzNZKv4rChZ6o3Jf6QZzjBQvA=; b=R+5xAEpBzyl5ZyMC18er
	GvkuDw7kQWRv3yO+1t1bZbDo+mvZjltuY3L8Ul1W3EA4qBcEMNNW/Au8zgTQzOJ8
	HL8pFzUVI/v0b8hA83mdx7kl/FEcEjjKDkj7ocKq7Bf4ezRdB1chLB/2j7V4CpY9
	gXDSBGRA0rYk2WO0vI6pqIeYjNyPLA2oFJEvw4IWEgzJOcrf05exiTmvI4r1nQPH
	12b3dS7hgtw/OTOSZ3hhgHwkxYvz9vhDqZTmglTb7nhn4J1Rknsk5TYm00waHUda
	yrkc0EFANaa+SAOhaF+n6+LYYSTVwoBDI9op6HHHQi5VXomzAm3c6is1ULxJErJd
	MQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4h91vd91p3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:28:45 -0400 (EDT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91961d4b31bso47208856d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1791822525; x=1792427325; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YW5HT2u5ekA6cpwOBjjzNZKv4rChZ6o3Jf6QZzjBQvA=;
        b=xwgkm1jZIJYVRgLAizcnEULdnbNCTPkxqKbXtKbZuxtaANaeUmZEOQhAkGG0cmcz39
         sHFIysKhAjuPxPFTuL4kHwF+Po4dBvucyayrVSDRY4xz6vo7hbzkzFi+iPuwstGN8q6s
         NFM884MxK7THdrJBYWA2Mx9UnwPSxNx26WvLJmDqfLwAVCffK7x0Gw+95lH8JYixgnG8
         dkfcJ6Zzzz6kDnVcQetjxJp9LEcUzrGN4Wwtv057u2/nmZIf1/E2SdnC4zJu3M3Waj/z
         dCfUJC4djUB/E0R5u05wHE4tZZLhNcIvDG/xL6Z/kih11FFSy0G+q5YuZJ3aSb6loDap
         OIrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791822525; x=1792427325;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YW5HT2u5ekA6cpwOBjjzNZKv4rChZ6o3Jf6QZzjBQvA=;
        b=SVv7XVGW21lhLxXP7iErhs/cecST4k/0u39xwefd3js6zzdIpqx7bKTxQSZXwdXQF9
         s8OENQ1V8C/B/dY6uQeDPT/MFt6Vjx4kEocC7B8H7U7KBWs0B8WiSK8XC42LbLoMVdHJ
         mLFTuDQ/REvGoDn0j5MJ/cZDOCTPg9rIUKPZ/M4qyDqts94qUWlr9ekD/ajaGqlcuUhY
         VttrZd+fYuDc1bHwPoOVilQKk2kcUhj95J90RnubR4pCPCq1CmF7wCfjsHjPdP+CgOYH
         d68EIkExc7ArY+8cRy7le/wLsZ6JH3ksq+AKPUuXl/SMhh9G1+gjswP/LoUAMLuKqW5H
         OVdA==
X-Forwarded-Encrypted: i=1; AKwUvBzjJRO4flTJyqSMix7xh5Wwk1Z8HSKr4hO2oRPA9nagriub+WeN3se8NGvSQHRz1S8/dXqpD9/w8f2rWuI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJbdecDrEh3isABwSmeVB/4lBoKVuJNg3LugljM2bys6gQtViHq
	c12Vl10pJ3QG+aYvFj5bXBzZUJaaP6gIF+Nbi2hLUoCTYnuuncBuyTUGOCAJpaFcs5S8p9Zs69b
	6QvIYkDQVDGjSUCNZOF9Ptky5CM6Z1WaEa03YTneoW+L5YUbqipssgcoc2PavYg==
X-Gm-Gg: AYBFou1x9ebbj7ZMq/ZAMiypJsKkEInY8+CEoPbpCb6h/LSUFgRNnvbR9vaZbAm7B5S
	gxv72y2WtGcO1tlXy7XUcBt7F6j8eIW1Io9yYBwihiCM36B8QE32AuvH7RUkjMFFPrI1hFrM/j3
	7aOqcGmXSsUZTgNu8xfogqKYXEfykPj9jvm3msL5FjuGAqUlr1odbOoL1k7SGd0FXh50k4rQwJY
	uwCnz7Z2K88F8DwTt8F3XSXCZC20htXJCMUH9JL2C62kw3H6dqZvLY19JVqnP2L6AbVK+hlsvnW
	m1MDB5bAqVoaodKOT76SLEUCj1OfIUVfWhVvL/OJHGVK6KgcUSWLp9vX5tjorbCu/SP7eCmweUp
	D5eJqdmzB9gHzNU5FN7f3qu169WdXYldGjxU97BgA4RYXjsk=
X-Received: by 2002:a05:620a:2612:b0:93e:6723:9de8 with SMTP id af79cd13be357-93ebd2aad11mr1447146985a.59.1791822524855;
        Mon, 12 Oct 2026 09:28:44 -0700 (PDT)
X-Received: by 2002:a05:620a:2612:b0:93e:6723:9de8 with SMTP id af79cd13be357-93ebd2aad11mr1447143785a.59.1791822524330;
        Mon, 12 Oct 2026 09:28:44 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-178-231.net.columbia.edu. [128.59.178.231])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97c27146sm1411796d6.29.2026.10.12.09.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 09:28:42 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Mon, 12 Oct 2026 12:28:19 -0400
Subject: [PATCH v4 07/18] btrfs: drop the transaction handle from the
 prealloc helpers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-btrfs-remove-v1-space-cache-v4-7-f125bd8c07f9@columbia.edu>
References: <20261012-btrfs-remove-v1-space-cache-v4-0-f125bd8c07f9@columbia.edu>
In-Reply-To: <20261012-btrfs-remove-v1-space-cache-v4-0-f125bd8c07f9@columbia.edu>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
        Qu Wenruo <wqu@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791822515; l=4684;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=uxR57VbSHtp1aqLOsgEPT8x0WECGBWUquczUd2tk5/o=;
 b=1OpsHLI1+pjS+AnFeYXBQPbrknn7LAoncIh+qbwK8YH7UyuZbLDXJgoH7g4Akm+mlQ03GMF5l
 vp4cg1NU43gCA/dXtDCx1IK6lBJyaEdSwSShPW8FTXlMkpZbP8s3UdH
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2NSBTYWx0ZWRfX/saPN5uYsYNx
 EiqYYr0Oajpt7WwAemC3WeA8gP53k4YUkExYUUdcm8l24PL/zDpQKz6TgnZzLV946SCpsO0eBFW
 tEfD5DsrU2bGRNv13kBFa+99t5QNyQa4v1Xk4jT+o4sWr6PQ739F
X-Proofpoint-ORIG-GUID: bcxBLSdGGpXzJk2BOyptitpuG7F8uFOp
X-Proofpoint-GUID: bcxBLSdGGpXzJk2BOyptitpuG7F8uFOp
X-Authority-Analysis: v=2.4 cv=QqnLTlyd c=1 sm=1 tr=0 ts=6acd0abd cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=9fnr1hFzp71kSIFw8uYQYA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=JR4YdQiviy7OQf72WyZ1:22
 a=u1qPvHribVpbYRjuRIMA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2NSBTYWx0ZWRfX5MbwvJt7hPdd
 6Ih0/5hNo3fP80iJnOeIZBVdQWJ1biuCon/BeLHXGIX3A2yQfZpXFWo7IVQqWs47ISPmKa52jNx
 Wko+S9x9Vl0NajFQnhcF/jNXQqYCuiWWj5TaeiJBuHXrnPSPpewhsRd0gwxQsMXjIodCC5lIaBP
 4V1im3GZxuMLTKK7xAu7GZ4jpEczzGnY2Hkg4FVIwPp4Y6p5i+ZAZlwMJhXehywAIE4/TNsn2wp
 vkLliH3jIQ/v6AzmGPBLJt4Uxq1mZlbZcak1D/Jb+pMFE38q/9ltiHM62Oda8NPdLsE6q/LyrAa
 QgLN3E3wYLG/dGpcGMXZd0apGZT3PwfaTewyYdPq4U583whaBDyQ1TmSWpT4GOxy9fH0vHIFuuV
 c59g2mvK5SSWtjcEKgu7QoU/7qIBhNfYEZf5ZPzIvq0NsgPOHRZ8VeOAw5vX37ofWLEdeXcduyI
 /LCD8eM1cYAJ2rJzg7Q==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11933
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=10 impostorscore=10 suspectscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=10
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120065

The v1 space cache created its inode during the transaction commit, and
btrfs_prealloc_file_range_trans() existed so that preallocation could
reuse the open handle. It was the only caller passing a transaction, so
__btrfs_prealloc_file_range() and insert_prealloc_file_extent() now
always start their own. Fold the wrapper into
btrfs_prealloc_file_range() and drop the parameter.

Assisted-by: LLM
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/btrfs/inode.c | 47 ++++++++++-------------------------------------
 1 file changed, 10 insertions(+), 37 deletions(-)

diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
index c28642c6aa0e..c20cdc4e6a89 100644
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@ -9156,14 +9156,13 @@ static int btrfs_symlink(struct mnt_idmap *idmap, struct inode *dir,
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
@@ -9184,15 +9183,6 @@ static struct btrfs_trans_handle *insert_prealloc_file_extent(
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
@@ -9232,12 +9222,12 @@ static struct btrfs_trans_handle *insert_prealloc_file_extent(
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
@@ -9247,11 +9237,8 @@ static int __btrfs_prealloc_file_range(struct inode *inode, int mode,
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
@@ -9277,8 +9264,8 @@ static int __btrfs_prealloc_file_range(struct inode *inode, int mode,
 		clear_offset += ins.offset;
 
 		last_alloc = ins.offset;
-		trans = insert_prealloc_file_extent(trans, BTRFS_I(inode),
-						    &ins, cur_offset);
+		trans = insert_prealloc_file_extent(BTRFS_I(inode), &ins,
+						    cur_offset);
 		/*
 		 * Now that we inserted the prealloc extent we can finally
 		 * decrement the number of reservations in the block group.
@@ -9350,8 +9337,7 @@ static int __btrfs_prealloc_file_range(struct inode *inode, int mode,
 					range_start, range_end - range_start);
 			if (ret) {
 				btrfs_abort_transaction(trans, ret);
-				if (own_trans)
-					btrfs_end_transaction(trans);
+				btrfs_end_transaction(trans);
 				break;
 			}
 
@@ -9363,15 +9349,11 @@ static int __btrfs_prealloc_file_range(struct inode *inode, int mode,
 
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
@@ -9379,15 +9361,6 @@ static int __btrfs_prealloc_file_range(struct inode *inode, int mode,
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

