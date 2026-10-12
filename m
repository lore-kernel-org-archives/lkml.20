Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986A44BB278
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791822539; cv=none; b=BmJWW2cHOX3/fc4Hil6z9+CiPA4oMv/LBod8t5UJ6PpbHZv5h68gdpvR623+g2xnFbV6eXEHwxHJEY4WOFLjzw8HGjs3bE2dXtCnxR0BhwVcNfou/KoAIM1Ql6LUZ5u1hdexFGOlKZZLQ5GzqwvFjOltKkLMCz99x+HogenioHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791822539; c=relaxed/simple;
	bh=kXKeYZDrmhsgH4LcLH9/gztwdEuA6DajPdb06G4aWqQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l0PfblsD2klhQWE8jLX+ukcH0GUqqdNkI24MvTqjhw6rPlrMdKvPLr8x54DC4FARUVtiypK4of1n5uxrbkeVaQt5QY4Pb9dSnfFR+EZj+Hr4ZzuNxHEPfgCmNhEPQI4I1H5O2Niyyw0e2jClvg4SUaHXfVH7WCAjc6i9kNNhZAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=OGN27vMA; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=l/lHO6D9; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="OGN27vMA";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="l/lHO6D9"
Received: from pps.filterd (m0167073.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CFPNYT850020
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:28:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=v5pW
	OHzzxUE3EYPrxxG/PmOHE1iIgrDGFIKWIMq94Es=; b=OGN27vMAfYzuEgt4ZijG
	oRAKXwpW0DHMlO8Fa8lKD6zUQh2Aj8BAguvWIikxBQGnL1BtCTGFwlziYxHoWl2M
	a8TpGkVCiZq+Y3PhuYamk435AEXQ8nksiUqa31KeV14sD3jD3li36nyyYC+LJDgl
	2ri4/Y9+RwSs0Ntme1NPIuGfBKqFAk3Z5IMx5zELyw96UmEcR23zQOsyvrW/oZiA
	1Q9l1Kf8/ldgg9CDiMpkrTwiYhLcre2Ys93JWHqjmnQsD6Ks2mUnSWr5Wxal2rgg
	U/yVYzklK/HJi1FcXVRANCusYxJEjWir2K8T68NANqjUhrRBOcwyDDJ8sRws+ttI
	Mg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4h92680q3s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:28:55 -0400 (EDT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9104eedb5b0so80341866d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1791822535; x=1792427335; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v5pWOHzzxUE3EYPrxxG/PmOHE1iIgrDGFIKWIMq94Es=;
        b=l/lHO6D9Rg17aDzT4UDxvJu2dQdYjHOa0PM7ZG95Qu+rDM4IjUcONDG/kvpDn47mde
         9uh/Ggptg2W0m8bSORAqqeeMFaF57/T2dpYoGLqJ9S/xD/Ppl4NhmYkyWeBp0avdwRfK
         a5BiT22k7SXvEAmbUsJpB7fWunucd2/3yKDgmP0620ATr86m2nfMGUebVSto0CLkVvV5
         Gn4yx2U4EncV+hndJGSUU4IDub+NfVFGB56OWUCmo+haA66ZhT53zeuA+tSSSkPVVgmQ
         DPp0ILwP4oHM+Qd4dIoohj1AgidWC0daWDK2sZc3TxoF68s12U5LnGDyets+Xh8OHX8z
         B+FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791822535; x=1792427335;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v5pWOHzzxUE3EYPrxxG/PmOHE1iIgrDGFIKWIMq94Es=;
        b=EgWaqmcU4FibwqeApCjVrHQvYaeqvZOmZczvcNaZ7073bDeSclIW+cOpCN6iheTCTm
         NPDOn406gMDjvv3HBIEMMPzueSdT6gk4/qf5K6HBzqOKzNMd/Yp4PBnzF2Q4LMUzB2vd
         9XxJLxkKpB5iCS1dMSfJDSxfSJDPoBchU/ot1wIEVEyAxXSpTTrZC9SSY0715eO8jqka
         UlbW6g/Vb5GxWlI0iJ2DC79I/8olw6Ss5AXRaTKiirjwfZbS+eoINg0Z74yUrGcLHUCM
         KGloff+lDtrzesEZxdez4I8VBVLQ+K4dwulGZbKwGyZPHkfXwI4Ig+orOc0v0TTxJDrv
         KmnQ==
X-Forwarded-Encrypted: i=1; AKwUvByIoWc5WZVULAiLdTeT4ig7/tFUh2DlhiTYrGhhJaFjNAZctGVcfykVNHDZ7tpfLQlQ7zYdAzRC9GZeoL4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLst5holO3DfqDjW9qvYlb2hb1dGTbVxKQ2n3iTwjQCi4jINgV7
	M5mwHvEAMV/jcRR8SHFKeFtEC6HXFKMpq2DQqLeRPsM0mj8sQZ4bmT8jp8X9k7mJemxcP5GF0/V
	8l4YPSQOUHSjt586dk6mqb8LMbCyyRjO4T9thrI1ioCPbNkmI+LokDu+7dfcFXQ==
X-Gm-Gg: AYBFou3qNTcOaI2R3k7B+OWidjjEpAopN2kYoiiFPRRJz89/nDgMhu3UwfORIXdu/d5
	63xjfcsMOvMUI1PudoZtDQAnO0HnwI3WnPeOdzZF7WmKQJM9xXwreamz9Ge5BS1FLIISJlAhTFt
	seCdkcYB5N7o2ZuUkgfmJhlzkWWgCQWs8tGvtwrS+NX6oKhR9+nY/OvDb1rAIQqlCi4AehYxMGH
	hGTTaaUDswZlBmq01IDUO0Bmy4JBvzHMJVJtJ4cfa8M3t+b2yG6B3NUVZ4liicKgOWKfgJzPsL4
	INY/QYm6AnxDIY76gphm9rYrOlNZ03OCEpPgB72qM2ZeOIi28f7C2DaTYfA74fV27xAVjUFO10m
	BpZeBFKDTG1ZmVc9LhK4H1EqpoFaFizaS+S5cUbVhuJtKBTQ=
X-Received: by 2002:a05:6214:2343:b0:915:eacb:cb90 with SMTP id 6a1803df08f44-91b552f855bmr189443306d6.5.1791822534639;
        Mon, 12 Oct 2026 09:28:54 -0700 (PDT)
X-Received: by 2002:a05:6214:2343:b0:915:eacb:cb90 with SMTP id 6a1803df08f44-91b552f855bmr189443006d6.5.1791822534236;
        Mon, 12 Oct 2026 09:28:54 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-178-231.net.columbia.edu. [128.59.178.231])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97c27146sm1411796d6.29.2026.10.12.09.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 09:28:53 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Mon, 12 Oct 2026 12:28:28 -0400
Subject: [PATCH v4 16/18] btrfs: stop special-casing free space inodes in
 the delalloc accounting
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-btrfs-remove-v1-space-cache-v4-16-f125bd8c07f9@columbia.edu>
References: <20261012-btrfs-remove-v1-space-cache-v4-0-f125bd8c07f9@columbia.edu>
In-Reply-To: <20261012-btrfs-remove-v1-space-cache-v4-0-f125bd8c07f9@columbia.edu>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
        Qu Wenruo <wqu@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791822515; l=2876;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=kXKeYZDrmhsgH4LcLH9/gztwdEuA6DajPdb06G4aWqQ=;
 b=TJiFx793FqUHaEgxbyZv57XGH9dDWdAtIfmHJ1ZtuqkU5YJSSL2bWUY40xrQkt3ew1kcTlSn7
 st8GsMuN/VdBAMCVrzkXU6TQsqyl7Hc/GWT6fPUjmdHRzY96/j+AnHq
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-ORIG-GUID: ZOwpQvGB9-SNXWKzm_BdXmUkpvO0uHHO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2NSBTYWx0ZWRfX2UmHUpjG2BPE
 tMcQltzO3Q62kwCPHEXoH7a07P0hZ2cYibdjxhshuBjLMREV4OhBlkt0DjbwO0GlEO0wFu6lY3o
 XinsoHCWTjDwOM1QWzjgWIVOmnzMcK44H2AIaMadD3P8vty76hsX
X-Authority-Analysis: v=2.4 cv=EbZd0/mC c=1 sm=1 tr=0 ts=6acd0ac7 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=9fnr1hFzp71kSIFw8uYQYA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=jHxIr1HyPKZ_Q5_91PL3:22
 a=bn-TaVTt-omw3cABb-QA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: ZOwpQvGB9-SNXWKzm_BdXmUkpvO0uHHO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2NSBTYWx0ZWRfX+ISAFfqOA2vq
 hbrw5Y7jzTzH8F1EW5tDJ4GL1gYV/RD9OThHPulnx5jGRpl5GGfbhoL5nqjGBIPxBch/ie41y6U
 qVWJ94O7Nynf9xCgzcwBRIIRA7ZQhZ2IiEY4XcClXOuiiWwWA4I969ONFTQT8kOjOl91usXYwxB
 mRmoEap3m6fVh4+0vP4HsGWaL9nZ4HCCrSpraWnHiEIEaIlWIkoeUbi6dQSexWSxCYet5e6/na4
 6KJMUyDp5SRdOszR/++6e/nOXWWil0Y2Slm7wrv0y8h7EyBKmkzO2gXFeYQeoAK+c2p410LcYxA
 Q6sY003oZfALw6u876Ws5IZTDViR+HnZp9H4pA197rJN2jVkt5K5iu5bGNOi1kCMXCVWbighK+Z
 CY7z6dO19rUP36qy6vyltmc2G1k8/KQ2//GcX5yFXnBjNMh4TLkj0X6YHJSk0e1Z6H3mF/tH0FN
 o/NLxe2MwqhzfWmcthQ==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11933
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=10 phishscore=0 spamscore=0 malwarescore=0 bulkscore=10
 impostorscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120065

Free space inodes never have delalloc or outstanding extents any more,
so they don't need to be kept off the root's delalloc inode list, out of
the outstanding extents tracepoint, or exempt from the delalloc metadata
release, which skipped the tree root since free space inodes are its
only inodes with data.

Assisted-by: LLM
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/btrfs/btrfs_inode.h |  2 --
 fs/btrfs/inode.c       | 13 +++----------
 2 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/fs/btrfs/btrfs_inode.h b/fs/btrfs/btrfs_inode.h
index d1c014da52a3..f7aa0d145185 100644
--- a/fs/btrfs/btrfs_inode.h
+++ b/fs/btrfs/btrfs_inode.h
@@ -409,8 +409,6 @@ static inline void btrfs_mod_outstanding_extents(struct btrfs_inode *inode,
 {
 	lockdep_assert_held(&inode->lock);
 	inode->outstanding_extents += mod;
-	if (btrfs_is_free_space_inode(inode))
-		return;
 	trace_btrfs_inode_mod_outstanding_extents(inode->root, btrfs_ino(inode),
 						  mod, inode->outstanding_extents);
 }
diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
index 5a8f028b2a7d..e715b52fc60d 100644
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@ -2632,7 +2632,7 @@ void btrfs_set_delalloc_extent(struct btrfs_inode *inode, struct extent_state *s
 		 * and are therefore protected against concurrent calls of this
 		 * function and btrfs_clear_delalloc_extent().
 		 */
-		if (!btrfs_is_free_space_inode(inode) && prev_delalloc_bytes == 0)
+		if (prev_delalloc_bytes == 0)
 			btrfs_add_delalloc_inode(inode);
 	}
 
@@ -2676,13 +2676,7 @@ void btrfs_clear_delalloc_extent(struct btrfs_inode *inode,
 		btrfs_mod_outstanding_extents(inode, -num_extents);
 		spin_unlock(&inode->lock);
 
-		/*
-		 * We don't reserve metadata space for space cache inodes so we
-		 * don't need to call delalloc_release_metadata if there is an
-		 * error.
-		 */
-		if (bits & EXTENT_CLEAR_META_RESV &&
-		    root != fs_info->tree_root)
+		if (bits & EXTENT_CLEAR_META_RESV)
 			btrfs_delalloc_release_metadata(inode, len, true);
 
 		/* For sanity tests. */
@@ -2690,7 +2684,6 @@ void btrfs_clear_delalloc_extent(struct btrfs_inode *inode,
 			return;
 
 		if (!btrfs_is_data_reloc_root(root) &&
-		    !btrfs_is_free_space_inode(inode) &&
 		    !(state->state & EXTENT_NORESERVE) &&
 		    (bits & EXTENT_CLEAR_DATA_RESV))
 			btrfs_free_reserved_data_space_noquota(inode, len);
@@ -2708,7 +2701,7 @@ void btrfs_clear_delalloc_extent(struct btrfs_inode *inode,
 		 * and are therefore protected against concurrent calls of this
 		 * function and btrfs_set_delalloc_extent().
 		 */
-		if (!btrfs_is_free_space_inode(inode) && new_delalloc_bytes == 0) {
+		if (new_delalloc_bytes == 0) {
 			spin_lock(&root->delalloc_lock);
 			btrfs_del_delalloc_inode(inode);
 			spin_unlock(&root->delalloc_lock);

-- 
2.39.5

