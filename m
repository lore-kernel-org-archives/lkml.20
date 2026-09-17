Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CEEF3D79E2
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789617654; cv=none; b=cNVCbMImUmcHmX0iyFoNfMgFNEWzFI5cqU/TOXvm0cramzZxpDi1rElEj8/9EO40dXaX5wr9BG5KKqH751kxqf+koj+ki4zB+blt2ot/k/CwtCxEN1oitzx3w9dUktv19j3fpCSniihSQ1D4uo8k8kV1xvp4wKv6R7IUjvkqgNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789617654; c=relaxed/simple;
	bh=IxPtZs7YmG0KTAjKIomldxp3suS2xlB2WlerF1Jtwhs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JyXBCLF9XZdXZMGhxjwNnN42ivirAVVPOd+HZcX+gr7mzAtKMRkQM/WzRD4WOd3CuiyaNEXWwozcTFMupb24F9q8XWSy0EBEfDLzcnyEaIaWoNTgrxyLjtEGreOqf/2ZmXiOx2kWqEu305Tb4supcPddSiq3LLzYeU2Nmf6C3fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=jBWqvs54; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=DnVXREb1; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="jBWqvs54";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="DnVXREb1"
Received: from pps.filterd (m0167069.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H2ZK7G204163
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 00:00:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=Jdph
	n3uGMtosHUIIlsCZR+S+zVxJ+iV/LKrDbHMNan8=; b=jBWqvs54mnDIo1aIqZK9
	yVR25BlyLqn8e83YUlNsbNiJwXbJagnj1+I7tbYD+oxatgwvsbjoBKYapCV8bRop
	2wllUW3QmPbud7FjGu1knXX0F3HzkJ6wUD6YJCTxmjBwfu68D+Qq8v5J1u3yOS8F
	0hVbL++SkUOdVRl6O6lT6yOPfS657cBEo0SZ0kEmSnYMJOKAbOGDBJh4iIj5D/eM
	fDTF6dMMDkBpX3BGomJC4OEltGeRAzz9e9ZPOXs/L+OFrGYXiE6jPAyMrCpaT2th
	mX7r03J1LDIAcA5nL9+gVP0dQidl83Ckmw+JjX5nSRt3xcxu+fu3BRJBG2XZYShm
	mA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gr1x6adqg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 00:00:44 -0400 (EDT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9104ba8bf51so11352626d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1789617644; x=1790222444; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jdphn3uGMtosHUIIlsCZR+S+zVxJ+iV/LKrDbHMNan8=;
        b=DnVXREb1k+5Vu/LNzsm0NQ8jhmEKyZatmgPc5eGOU2VYUwJWGSQOZVeBozDFdVJTCb
         0ppeHDcrQHV6qzlqMZEaDYPTk8y0CUgkk2pTKOQqJviMQOmMZFpJcJ8wUacvnfJT7ZVw
         2a+rbNGqVwHb/vvAo/jeLwnX7pnDEoP8C6RuAyBw72y5t1ONj5GebPgQukdMt+YxPnIa
         656+vEXC0wiIF/IQIKK9sexBQJiFZfupLeXRVutwVlL9Fbc2S4Ye6dOxMO8S19VcaqFS
         sbKZxk9dHFkSDNY+K+QgHxY4U52sFExQxCXTJPLjcirssac4VzPNv1+h4y4gNF36IkWi
         Dhxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789617644; x=1790222444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jdphn3uGMtosHUIIlsCZR+S+zVxJ+iV/LKrDbHMNan8=;
        b=bpnjNkGpUm3fOrwOAGOPaLEM1ofzdzcAV7pMXNT0PA/5KK2Fpah5ImKLea6TUghNXk
         wPNWYT72wT+8f1YzMZZU7hhuQdmMD4rk/wtBvUiqYyhGuiCcIPSCSTkrHjuGZ9DNvjHE
         0+8o/H9oZa+sZUB4ov6+1vMdwY/kHI847WfC9TamtZAEUAlyl9sBiLu6AGBE2U8KXqW/
         a9N20pcFDePxllWGZ55vjmFGPkrimENIporBTLOqozUhYb9F7K8uQleLP3rmFAuz0U3G
         zeC/JnRnk+MIqx+oQC4OUqOTHPJrMmsyuI5g9zRxsxBrCDficZGoozPcksfRWT3Ypny2
         pfhA==
X-Forwarded-Encrypted: i=1; AKwUvByVEp35Vc5rvg+1D6ICkJOvGO2L12ZChi21PkHYpUBdXIxARgFjb1wnVG8a9JzcqHDGyw/jbEMqT/tu4ZU=@vger.kernel.org
X-Gm-Message-State: AFuF++lRycKKoDhUXzAdnK+FlxydOcAuMXYaRSws9u2xZ1zBfa3vcBbO
	Zoh/Y33rn2xl5UP8sFMv6PjRiVcGKS/RifIo+fkNPSd6O08tPHXfVs865UGa/v58YALuxjGElhP
	U5qgD9x9CYOmdnDSFHz6VvVSs807HijmkIZJNcIDOXOjLpKsW1HYmytPHpFd0QVgQiMqJwg==
X-Gm-Gg: AYBFou3KX0EroXX1Cxeh3dNMHgMfC3IDgZNCZHuoY/b3seNtSf6qPP1dKTKLBgS94rA
	vkSLqPIk5kmJEgk6t+uawzvsmI+JriQs25p6EUFiJuOZfQIJMThlN7LdmUBfvFVW4rZ5WIxy0eZ
	/JNtRX0PHc8mP2HtUltlBfbzBYuUBofk5ypYwo7D75I6tyd+oBi40zkrOIc9uyQgRygfYD1YWfK
	5EXVv6NXU+JRArvsXthB81me4mUqSr2PJCaWp+Gx/9KggWKDzxbG9vtxXZyJpTxobKpSTF5OEMe
	K2oOVJrIAoHL/yCcOK9gJ0pRWPhgHtcVHB/3oC0HFWl0aLCVjFsvpk6yltIhNYXQkitPeBGPHSq
	9FuAsY4VGcVbrHijiE12e93smBaZRE8BuBdJRqAlyywcxIA==
X-Received: by 2002:ad4:5d45:0:b0:911:9385:8581 with SMTP id 6a1803df08f44-9123d7ae3a3mr129668016d6.28.1789617643773;
        Wed, 16 Sep 2026 21:00:43 -0700 (PDT)
X-Received: by 2002:ad4:5d45:0:b0:911:9385:8581 with SMTP id 6a1803df08f44-9123d7ae3a3mr129667166d6.28.1789617643145;
        Wed, 16 Sep 2026 21:00:43 -0700 (PDT)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9123beadde6sm41748766d6.35.2026.09.16.21.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 21:00:42 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Thu, 17 Sep 2026 00:00:12 -0400
Subject: [PATCH v3 16/17] btrfs: stop reading free space inodes from the
 commit root
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-btrfs-remove-v1-space-cache-v3-16-10ebde03b96f@columbia.edu>
References: <20260916-btrfs-remove-v1-space-cache-v3-0-10ebde03b96f@columbia.edu>
In-Reply-To: <20260916-btrfs-remove-v1-space-cache-v3-0-10ebde03b96f@columbia.edu>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
        Qu Wenruo <wqu@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789617622; l=1999;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=IxPtZs7YmG0KTAjKIomldxp3suS2xlB2WlerF1Jtwhs=;
 b=Aso/K61JuzYV1IXg9ODiIIycpGya+BidjJzb+j2Ylt8lMPgSGYy9gKZTl+bp87+m2eq/yX47j
 7GYE+kju94zBP9MDPT79CEZzaefV9juV1JZjAjY7TBklAhIUsuhNr0y
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA0NyBTYWx0ZWRfX8Mj+MzxbsH3J
 rLX8kiu/6GtISHIg8YQHU8ltKAQo9nGRxXJO94gIYOLrMFd3+X09+TBE8kO6s9alTk8DR+Z3Gbg
 xCSjEYVlOiLsgG1N1kQ0fUo7tnJLEvuhBRbiGhabV17l2bGZx2IS
X-Proofpoint-ORIG-GUID: Jq2rhnml6QEWjXR_UcLQkKF1N-IpbiSW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA0NyBTYWx0ZWRfX5UVD5jbB32ps
 E78SSiGzwHPC/QjEDtHu4DflHLchLBnko/vEPuxgAbnws5uQ8CtPlBaq9CXOCBHmZDzLCy8SZp2
 r0GXl5fX3ceTcAg/uF4j+FKNd4cjGXX8OLA1lgZ4Z5+TYBxeGQIE7RYwfmsXoISr/WC9SknMg4+
 3k/T7/4a0YhpRLaWQQXNBUO1Bij5JcF7i/vd+/pBRX5FObk+Hz2lWFNP68G6PADTKW0IGXnE5HJ
 0y9JDsYUbLo6okQ6wsV2i2XOEne3op9TaIphCPBS2dpOA50U3bIgK5ZKcLRGe8IXfa4gqEUcBeT
 yz2Gt/LdWqUwcPxDuuy80mSnGmCOjdrqWY/haVY7Kz1GUbchbA9b6f/+YW7OZNOhBzSNjw4OHQt
 lqhnFTP/BZxoHQWPzpOJ5lPgnogWsMa+Tj/XTOLOaJC6yrMcK8pa5jeHP9sGrYyNfDEPhzwaz07
 X6VOM7OGK7w6QuBeg9A==
X-Proofpoint-GUID: Jq2rhnml6QEWjXR_UcLQkKF1N-IpbiSW
X-Authority-Analysis: v=2.4 cv=CLS/zhrD c=1 sm=1 tr=0 ts=6aab65ec cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=JR4YdQiviy7OQf72WyZ1:22
 a=F-rX_8kjA07mH5tGMmcA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11907
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=10 malwarescore=0 impostorscore=10 spamscore=0 suspectscore=0
 lowpriorityscore=10 clxscore=1015 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170047

Free space inode data was only read when loading the v1 cache, which is
gone, so btrfs_get_extent() and btrfs_lookup_bio_sums() no longer need
to search the commit root for them.

Assisted-by: Claude:claude-fable-5-1
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/btrfs/file-item.c | 11 -----------
 fs/btrfs/inode.c     | 10 ----------
 2 files changed, 21 deletions(-)

diff --git a/fs/btrfs/file-item.c b/fs/btrfs/file-item.c
index cf50fd623f41..484c04de1af5 100644
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
index 89b50d4e0400..163f26fe36e7 100644
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@ -7230,16 +7230,6 @@ struct extent_map *btrfs_get_extent(struct btrfs_inode *inode,
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

