Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8CC396B70
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 21:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789334504; cv=none; b=ulrKmHjkHws0PTBm5LuJZqtp9Q64Rzt5hJ/uy3teICJgldBaFcL3WtBCzrDbuc+Lff4AHbtidEVBSEjTgYstX3W7ncdMn+5Czv36N+ZpRA41kItMzGfR+pF90tmbtbCUm76+xJz3z2ox2rG4lcQPad7tXdze8uc/aspAYCvHzEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789334504; c=relaxed/simple;
	bh=dkg0MwKLg1iLy+Etq/q2Hvf0oO7DoeoyOqsWTmh7O0I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YmYem8fufqLYyEcO0ZCztZ/O0+MIlcLKa83sQ/GYl/BND7QDeznUyw0W1sA01ga+14GsVylbdBJ+jpERwnuUvBrPlxOO2O+nvinxfl0wSvzm9JEroCPs42M5dBPh+mUsGXlzeEOWEpSqtKhy7VGg+zy6Llalh2UHnjWSqvWBzNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=uQc4+Cml; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=r+oqpklu; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="uQc4+Cml";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="r+oqpklu"
Received: from pps.filterd (m0167074.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DKXlnc634554
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 17:21:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=V0ci
	pskccyeD14O9cgglEpzzEgLikHPr63hXXeLz4FI=; b=uQc4+Cmlja9URfRzCMMt
	N0Fj4IJECCkO1PINxnegaVEAULeM+/vietsKVtAeEHyY2Mdmj5+s34ftS9A3y3Pr
	B867D13YA/3fOIzBhwJZqR4CpWNbJz9NpeQickEVJqp71v1KIkZLtuAF0a7nUyr0
	/TR8cnlQng1EoWz2RBfLzjoIsBUk6riUWex6NTrOJcMAnNuogHjYSWruK4WbF3BX
	kcHrz4QSjrOi6kxUxE3XpR6ynBNFfVHeOGPm5JC75ShirFCuzyVLkGGYYMKAgLSa
	HeZWCqJSjE8HZ284jRE4x0tw9/OUe8tyqtEeOrNv7sW5pt7PgW8FsTUq8hAmAozp
	KA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gnwac9nx5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 17:21:40 -0400 (EDT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9399b66e0e7so641200185a.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 14:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1789334500; x=1789939300; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V0cipskccyeD14O9cgglEpzzEgLikHPr63hXXeLz4FI=;
        b=r+oqpklud08boTACTrILEFKm6SVYrMzY3rGrQCFBB3IFiJ+ztKrP6QSu24DcgzVS9j
         lW+rvwhkowoVfaF+Ko6n3gpHIpqPFxiXZqa06BFr24TOPOmcngLbnwDelYoBkZj0IdoX
         A1idPsif8qRzGwSZRiq5dMP3LMV19Wa6lFf8ImcwLYHDUd/izKAeUER1WkAVcsaFd9xa
         8joQNerpBRQKsUiGSJ0WRBfhOKTMN9nX+G0tQzvjbug1q4ziZ00Uf6d6L3vbj0ZFM4Ap
         LS24okoBqifIffoHj3BJetxiPalvTo+GjzpKYVftltoe0UqOaZnOr/4Eu/ZHimv/wM1C
         BYtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789334500; x=1789939300;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V0cipskccyeD14O9cgglEpzzEgLikHPr63hXXeLz4FI=;
        b=JcxRZ03tcGEKFuh2IrBwqLOLVqMskgW7fgdIvh/Iy2JBba/4kATxgdDasFqs8YsQNQ
         vaf0n/AnDnpBv0W6p4xNTbL+eyFQnRGf+IsESogkP+t/+u6QFvdJIHKQz0Uc3Hq2jmj1
         6QTxqj2Blp8SIe6UMQv28+mryyFcJapWJNBRUGGsuoeP4o6NUCXKzAEvcCoPfsvZJC7l
         +oSfoJ9YIqg45nWLaAZ5kgLaq9Fwl02G2Ed/Nwuw6GT9wAg4t2V1kUQ59p8fqQflk/eo
         0f76wt27gIDHgkd71QU9sZ4LgqLcOgC5+MriluUvLl8SKRt3HLV1tEbnJm6NVO/X9Wir
         FGDw==
X-Forwarded-Encrypted: i=1; AKwUvByA8Q994Y9PCHxJmeE5EY2AxRoYOr/ogGmIMMB143uxEAtFCJtWesMFkZNWLeRPpA6MiNN9YVkZUnLvyG4=@vger.kernel.org
X-Gm-Message-State: AFuF++lygNc5NxWgZ9oYSak4lbfPV7CJLc8pF46qB5UMXS4n+T9RhF9k
	JbIe8iPGtSu8pRHL70YYfc8HBoyDqDPGCTODrjA1ynQC/joLTXpkPvz4UDI/fJ+AB0CtNJX7GSP
	LKso3B28dS8VBlNW/uA4ozpLURs0J+4Ji49UuQjbDNQCachInWJ4MhONFqiWJ3g==
X-Gm-Gg: AYBFou3V2/S1AHIOpGYcZqf1/FDQIyFs1LpkJlbN5PgOsRQP+PnjrRw1YyavM6XMfk5
	InoZxCiVgpYf3oYmYzgEKunAp/bXzN90VBN39bm0NNaxIkpn1LuRj4ijWt1UEC2zRMnJ64SbxOH
	yMim1mzS931EkUOjdTCqszz6I5EQgbecTz9EZUN/cghBkZQss/PyUBsCEWCtfyiJ1La9AsmIkYj
	1Yoe+d5afyHPrMPgqwfkPZGg5FL6U2iBFOPr6euTPKxosBZ/O3oCE9sRg23jf7Ip1AX3fWZ+qdM
	hV6s/zcFzVAh3DCHGYZFjVbJombo4R0KaVzG9mLXV819XLzXyc7SAtOpBxepuxLV8L2aHkT57Ju
	SlpD2UBb0hky3zn6qI2GnKYAE0rlMDoVicRSMFwAdI9rFZv3gTaaEGg==
X-Received: by 2002:a05:620a:3188:b0:939:5cd3:75ce with SMTP id af79cd13be357-93a0364c9c3mr1117787085a.8.1789334500269;
        Sun, 13 Sep 2026 14:21:40 -0700 (PDT)
X-Received: by 2002:a05:620a:3188:b0:939:5cd3:75ce with SMTP id af79cd13be357-93a0364c9c3mr1117784485a.8.1789334499712;
        Sun, 13 Sep 2026 14:21:39 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-179-215.net.columbia.edu. [128.59.179.215])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f4d3a50sm78432696d6.40.2026.09.13.14.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 14:21:39 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Sun, 13 Sep 2026 17:21:26 -0400
Subject: [PATCH v2 14/16] btrfs: stop special-casing free space inodes in
 the delalloc accounting
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-btrfs-remove-v1-space-cache-v2-14-186767a7e106@columbia.edu>
References: <20260913-btrfs-remove-v1-space-cache-v2-0-186767a7e106@columbia.edu>
In-Reply-To: <20260913-btrfs-remove-v1-space-cache-v2-0-186767a7e106@columbia.edu>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
        Qu Wenruo <wqu@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789334484; l=2215;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=dkg0MwKLg1iLy+Etq/q2Hvf0oO7DoeoyOqsWTmh7O0I=;
 b=KdeJK5DOxzGkfTa0NRh3Nqvj7e4CiCfIO2wKWAoWJ60UCAPZ4iVFaElD6mntCkUkz0aSh9dbg
 YR/CWxQej+AAOAI0E4EckQ3Qtg5kZQ5L+Uvu8pJLYgqwhnTnue0JHtM
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Authority-Analysis: v=2.4 cv=BqQIUoX5 c=1 sm=1 tr=0 ts=6aa713e4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=2jelXx5xVcRIF5zNctN5Qg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=azVShVRs0zEubeQ0wG0L:22
 a=bn-TaVTt-omw3cABb-QA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 1dBGCi_9ABnk9tIboXsw-136KlKWKZcc
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDMwNCBTYWx0ZWRfX881MqOg5zrQG
 zOynFYrxvVoSGjMCmN9mKFyvKcgEjwXyIgQAb1XJhv2Z4dj2bslsAxNRiCvGuWQk4nrTKFf4OCv
 AybCJUQGaKeqM3Ga/dRwBUwggKDJvkWKwiBNiA4kDUH2qbxrVdWI
X-Proofpoint-GUID: 1dBGCi_9ABnk9tIboXsw-136KlKWKZcc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDMwNCBTYWx0ZWRfX9TfPFzIYsU2o
 k7wA5tqJjp8COB8ticdBrnS95Sajd15xx3rPLvbPEUv84tSlVsNkRokOJfMS1ivb5/zFxe09BfD
 MudxCWaZl9blf9c1vEd7t6dVgNW2LivvjmOb62/8+xqD+ZQfTl3X/k23zxbsHQcQDmsyAMk3QiV
 /LeUIrEj19cv2hUVsap/F4cjMNDm2WMUq2k1AS1yhO+LMWcCDcFVaHfr9w5wgGfaFvlTQOZMI2X
 35SrR0k9j/Usqx78rzTnnvyrcF0SWxtmFzTLtWjrE8AvJVSaON6G32mnxkF37ezmN4qGUyzzHes
 U5ShtxZ884Fy/58GriABGg+AZ7K5GXyJzGOTyxBZUQwe9xhOZ1leScyg4iVnNKj9Vk8zROeg/j1
 V8YmZ03+1OGEY/su71HaMLxTVGc1N19FBvGWhGy6ITNVBvRaz6HUu840f9qJYJXJ4QWHEHnDsmH
 /SJdwThoDLxwZaJ6M8w==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11904
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=10 impostorscore=10 clxscore=1015 priorityscore=1501
 adultscore=0 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130304

Free space inodes never have delalloc or outstanding extents any more,
so they don't need to be kept off the root's delalloc inode list or out
of the outstanding extents tracepoint.

Assisted-by: Claude:claude-fable-5-1
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/btrfs/btrfs_inode.h | 2 --
 fs/btrfs/inode.c       | 5 ++---
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/fs/btrfs/btrfs_inode.h b/fs/btrfs/btrfs_inode.h
index 26cc5d1aca4c..795bb222a2d0 100644
--- a/fs/btrfs/btrfs_inode.h
+++ b/fs/btrfs/btrfs_inode.h
@@ -402,8 +402,6 @@ static inline void btrfs_mod_outstanding_extents(struct btrfs_inode *inode,
 {
 	lockdep_assert_held(&inode->lock);
 	inode->outstanding_extents += mod;
-	if (btrfs_is_free_space_inode(inode))
-		return;
 	trace_btrfs_inode_mod_outstanding_extents(inode->root, btrfs_ino(inode),
 						  mod, inode->outstanding_extents);
 }
diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
index c8292174b550..89b50d4e0400 100644
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@ -2614,7 +2614,7 @@ void btrfs_set_delalloc_extent(struct btrfs_inode *inode, struct extent_state *s
 		 * and are therefore protected against concurrent calls of this
 		 * function and btrfs_clear_delalloc_extent().
 		 */
-		if (!btrfs_is_free_space_inode(inode) && prev_delalloc_bytes == 0)
+		if (prev_delalloc_bytes == 0)
 			btrfs_add_delalloc_inode(inode);
 	}
 
@@ -2672,7 +2672,6 @@ void btrfs_clear_delalloc_extent(struct btrfs_inode *inode,
 			return;
 
 		if (!btrfs_is_data_reloc_root(root) &&
-		    !btrfs_is_free_space_inode(inode) &&
 		    !(state->state & EXTENT_NORESERVE) &&
 		    (bits & EXTENT_CLEAR_DATA_RESV))
 			btrfs_free_reserved_data_space_noquota(inode, len);
@@ -2690,7 +2689,7 @@ void btrfs_clear_delalloc_extent(struct btrfs_inode *inode,
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

