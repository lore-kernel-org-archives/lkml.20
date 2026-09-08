Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82986294A10
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 01:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788830417; cv=none; b=UFAPp83J4KxMr+37qsDBXNTP+5xNnYBdrEHFMvWfxLEfZgJ4CUQAZd+8RshaLDk7gWXOIeQ3lWzDgD96aJMGt6F6SgdPCztk4XFNAyHtb4tgjmrxdq+Fq/FAG4p75Kj5/25VSj3v6LJwP0/Qw52jLhhJhFrsKsmhQEpSrA+0zDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788830417; c=relaxed/simple;
	bh=s0Ur7xTjy0MIOogA8x9okj5s/rWZB+OdHIcqrKhE0cI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u7HND0NnJ3b7CW9rHRoOKVyOW9ydnUjDUa0bVFTzqkdCMcPFjSxwq5O0mvJV/wBwrmzIfJrvgSzWZ3jdhVe9yT3w7xv0TdTDiSymm02MxMPQLk111obKU0MqL1BwsESd35NjNVl3hJ4/hDQ1/e2wfJ4QBcgp17E77jmp0B1K7+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=Kep4N3/1; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=BIV23BOm; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="Kep4N3/1";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="BIV23BOm"
Received: from pps.filterd (m0167070.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6880uf8d3396654
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 21:20:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=2M9D
	4jxfFcsmtV2iS1rQuymkdk6W31/RYk8FxRcByY0=; b=Kep4N3/1tOLaluOXMW1D
	kuw9Rk3Ya8HYQmyYytY1yu97wMKRg2JnvxU4feK8ZD8V56Miu8T0XuCy/VxDHiRu
	gbNZspFvz7tbcGeQhfJWnKJZBMEBaX0OsxIEbspz1R8aC/acsg2v93Uqq/CkfFQS
	HeUAItuYT2euhFFuPGx71hsXXNq5zpWmz1TBD6j+AadPWqojPHvw6IZ9KcLhctYf
	Z81YvOIQDHOrul/gw+G4Ayg6cQTG73dZQ8WOTVvUeTJPGwOfJetguy9p9SdTJl6i
	LoSOPI+rZppjuczRwswVAaWLk1AfXvAOvBb03SnAvVaba5ruNh/P6OUw2Kg3u/Xc
	dQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gj4yks08e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 21:20:04 -0400 (EDT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52fc3bff8bdso72078791cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 18:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788830404; x=1789435204; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2M9D4jxfFcsmtV2iS1rQuymkdk6W31/RYk8FxRcByY0=;
        b=BIV23BOmrIkqmunmbcjkp244KXHtjuR+CewijOFN+rUBACyKUxMrMnsuyaLWIOgFTV
         +JBFS7Y2UmFrMss+pk1VkBNWO+5RAb2OQ9wQpg8A1eTYJ1UoKVfPjXFWaBZEZRRbcEXC
         iaSokfj2DdI9jsc5x8QZESD0Zecvaa7diaL10dGlZ3Lc9sleLyOaLJA/t+3IVtlzICr0
         679D/2Gmtw5FEt896WhSSCoIsQqK+qZwvIM8guGbR784UhaGL9jHJpz8DKJ2YCG0rYD3
         x0OKEyRWohX+AJhKAduWRO6WaLxLuh/nwM+8u+6k0bTIzGjnhc5e/mKJuhnV/MMdAEK7
         DlgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788830404; x=1789435204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2M9D4jxfFcsmtV2iS1rQuymkdk6W31/RYk8FxRcByY0=;
        b=GeoM+iunGGRPjIDVmyXGqbnjiltFwY08z9Sqkz92KQiP0PSCkDwGhYamDMBd4DZTn6
         MGYg7+tE8ITVRnhQKATwv4F9llkTAtkH3MHXxc0uACj9Qmk5WCKBWqTKQM6L6ptGZ3oR
         A59vVnJKCbRYZYEciEDcaQ8ihlExSCbh0yTbc/n/oD03/wVBbqURkr/OHPFUjFUZcBUP
         9J3BCVU98eDG9hpE0/9bICSByF+DtaH9+QPaS8da/s5cpLX40MKZEPKcLV+Cq/zIFnM+
         9/Kvxw6/p3YQgUaNEWfloM/V79gy3HliXhCuFY194r3DKErPKwhtx4XQKoDBSyrgWVvn
         aB8w==
X-Forwarded-Encrypted: i=1; AKwUvBxaBitavSysPfzQmZh0xfzT3/jU0o/uKaErRFCagFwiiTCiSiIt6Xb4dbs/xxkAxe7YNDcwFYNQV4tKBfU=@vger.kernel.org
X-Gm-Message-State: AFuF++nLwaGo46s7KEPJWoGJpUhsataiXx0qF04h/jvsVv/f7FRkmy0v
	Fs+3d9F40Q1mOlIsW1FgpumO8VEvzezJ6iuntrOyjdNGMsG7U4vIgX5yvnWhfUFE1kQU6axjXTT
	YiTI9HOtSsetiE01EDIVLaBbrkTAhk7FkCsBz0LDPGsXAJHCLSHoWQho8y0S2bw==
X-Gm-Gg: AYBFou3YuFPgR9bm6vWyZ/0LxbqSqIvdod+KdEmN0noq05kTqOQl6iyzT9QpzJtZEnM
	OZuWnhwfTGCtR0OpabcPOcD211PsECKPA94IQlzXSzHKR8jEAb9UE66d6ma3TTYCX1EK6bQcOPu
	cA3ahT2nIOMGDh55H71ywwfgxgwiw1dRjaKcqF36EqPi+xn/Gil2ydcK5w+pVpQLQpR/vVDq/ZG
	nvOS54nD+0Q1rNbY/hjZV/qzeMk+GfP/Ocmn9LzbC6McrnuBER4bYnmaL4D3tia1WAGBct1axKu
	CkcGDbmWGM92ONMgejjcQIDW/O4gjUejfACcTrO42JVbE6k5DCChCPICgdWge0avXAbwpimqzeo
	Qz3iWneCSj/e859MVJ+wj02SkDCbOz+IN77sxIaxsLXT8MG6W5jI=
X-Received: by 2002:a05:622a:134d:b0:52f:f072:a1d1 with SMTP id d75a77b69052e-53054819272mr304914581cf.11.1788830403541;
        Mon, 07 Sep 2026 18:20:03 -0700 (PDT)
X-Received: by 2002:a05:622a:134d:b0:52f:f072:a1d1 with SMTP id d75a77b69052e-53054819272mr304914111cf.11.1788830403044;
        Mon, 07 Sep 2026 18:20:03 -0700 (PDT)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040694543sm104322656d6.33.2026.09.07.18.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 18:20:01 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Mon, 07 Sep 2026 21:19:29 -0400
Subject: [PATCH 14/15] btrfs: stop special-casing free space inodes in the
 delalloc accounting
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-btrfs-remove-v1-space-cache-v1-14-5f9a5ba352a7@columbia.edu>
References: <20260907-btrfs-remove-v1-space-cache-v1-0-5f9a5ba352a7@columbia.edu>
In-Reply-To: <20260907-btrfs-remove-v1-space-cache-v1-0-5f9a5ba352a7@columbia.edu>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
        Qu Wenruo <wqu@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788830387; l=2215;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=s0Ur7xTjy0MIOogA8x9okj5s/rWZB+OdHIcqrKhE0cI=;
 b=3NrwPqQr9ySlL7xE7GbnNqdtaMAJdSbZM3lZSMMw6Lqhxs3+Yw/iI8CL9N3bYX4lps0y3+y51
 7oe9i1IMDBQAbguWG1sUr/Qrq+m6GNR6+HMOcJIninNv7QdtSU4edqX
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Authority-Analysis: v=2.4 cv=bJQm5v+Z c=1 sm=1 tr=0 ts=6a9f62c4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=svvvyxlR1OQQkelhaPoB:22
 a=bn-TaVTt-omw3cABb-QA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDAxMSBTYWx0ZWRfX7gIA3awsfmxq
 iUd5Xh4WcYS4UYjIpCS9NgCZiibDNNpPOAgTkZ8IL2io9GPs/vKTgL3OvBfWmUZ2G3lr28AJh7S
 W3O28NgIxP0wDkW70F2U4wJBTtrcr++oSkCl1Z2Z69ZKEK0orHsW
X-Proofpoint-ORIG-GUID: Bj-L1R302G1Fa_-1vjjV70MvQlszKDX8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDAxMSBTYWx0ZWRfX7plVCGtCFyft
 Ky5DZQi1Mk07ZPX6O0Q0jtgFKUcZvVgpaEBJTGoSl8jhzt2GRfYiAaU5fZ4WuT3LGOnw1zxBWGq
 9/KluBNt3awak8bs5laKsoT//DdATDZs0AsQxvv3B9oLPfL4ToNHXlNn0vMMEum/6SkuDDy/MHD
 BratRRayl1T2dqL57ViH9UuDCX7duJMnXfMq8nft8356CuLfDKQxZUu7YPgEDc4WcVYo8NvZVtf
 YmgFMm0whc/BLk4y7mGOc2iUFRSwCtFyxr/6CsSKaVdxKrsw6m0XnjhNf+63RGZA6BrHdk2NsZd
 SwRvWsQnz/0NnF16S2sAfIRPR4gNL12S1gvmaC9D9JYqCxJctNeBdBW8JCPWELZ8K3QBpsjIXsi
 nBljAFbAyad3wMBNiEU6/KSX0PIRcsq3oUm48vekrLxdkcNsABG9/bQMa1ZKENVbuzFyPaNYIt+
 RTm1Kzxk3awcWllEvAA==
X-Proofpoint-GUID: Bj-L1R302G1Fa_-1vjjV70MvQlszKDX8
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11899
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=10 impostorscore=10 bulkscore=10 priorityscore=1501
 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080011

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
index 389eadc5c28f..114a5c38afd3 100644
--- a/fs/btrfs/btrfs_inode.h
+++ b/fs/btrfs/btrfs_inode.h
@@ -403,8 +403,6 @@ static inline void btrfs_mod_outstanding_extents(struct btrfs_inode *inode,
 {
 	lockdep_assert_held(&inode->lock);
 	inode->outstanding_extents += mod;
-	if (btrfs_is_free_space_inode(inode))
-		return;
 	trace_btrfs_inode_mod_outstanding_extents(inode->root, btrfs_ino(inode),
 						  mod, inode->outstanding_extents);
 }
diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
index 137d2c1d9c97..3a1230b777e9 100644
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

