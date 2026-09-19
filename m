Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE7D397928
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 22:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789856765; cv=none; b=CixSmZcmA8/G2TRHc7CO+m52hYNiMD7ze9nC2veaiJyfN/R/dzjxr6TwF/Uxyrff0ZDndtgduDD0v5e/CcbP98AWi/fchu1tJGPW2PjDpbFzKZijVR7qeB3HeZhqhyCUc7n/FnhxcN/jmU90MSngReLWVSv4E9NieOAvpA894a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789856765; c=relaxed/simple;
	bh=yHNl/4IJ6nsQQQ6EYtG6mC3w0FiqfioxVKbK8K5+I4M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bVxJSnRQ70IwKHfsKDOgrR3mqYT+P83sEvPDjUutr0xPmONLZUKoVTwu++cG8MfHaZzLmYZ56RTMdDvU6/dCELPOOioYvUBfxtnZCgfDxchMo50Sk4SpWG12sXtjQx59HEMyZ+YedIPBmmlKPelByma0OgFvw4FsQD0DNHnFcyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OmiD+Pko; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OmiD+Pko"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747f0b25dso20550455ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 15:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789856763; x=1790461563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/UPIak5OxXuaG2Wg2AMNeWBx/Ry+CMtx76AWFxbuw+M=;
        b=OmiD+Pko/NbZKsS2KZf8M6/yjtXxZJPrgltDU/bJihwjM6wZuxi5E4Q9omuTWWCwL4
         FYv75LBSuvl2u3gL3JMevUpHUq0alXyws453j4V5dD4ykR5tJtpWR237GGQlOLKtbBNr
         o1G6l9/KTwYr+74C9FsY2hM4kxxz/uUWez61+UAWMFsIh10oPqQSr9JHQ/WAVBMun0bU
         BzoqE9JQuWza++EGpBsNQ5jAfoYR5KyOvFFlV1aXnp7iDBpFRcCtHYDJ+NF2gn/tUSAs
         K9d2asPOJ0ssh+HY+39paP9X4bbJqBI4+rkAcBcmoc5kyqltwgio42N4+BTsFLFJ1HmA
         fIrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789856763; x=1790461563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/UPIak5OxXuaG2Wg2AMNeWBx/Ry+CMtx76AWFxbuw+M=;
        b=imMf5VP0v3QnMtwzH8C6/VGGFTt70me2aCJOVx1fk/UsKRogtfXqwxc1n5vGrpBe81
         CmKDrsV4h9awkGJzj8q0La/jryD3dELJX65Mcz46g4eHgZnMldk8f4etX1PMeMaizZTx
         T5oVOGWmph1eVnxfNEne9NIsZuwhytYE/XnFyraXw59d9ZlwCyfQ3a/3hweOR7Zlw4wv
         u0vDQvjcziIvJHW+cXRtixITLBLD062CpLJPNu8djewyTd9ncOGAua8znU9feByAkDeG
         fEns5X5JE1ECozpUXxN9xYq/Co9FUY/t1EsH0WnhdigwCJ27FVWIPmcGzM8wcaLtfNCW
         oziw==
X-Forwarded-Encrypted: i=1; AKwUvBwnMkKyB1W/TcX98veccEQtPQ7aFJUqKtte4XfSlrTyVHfOqOK6T3mtKJHTolL49ZuGOqYUmQKM2yx7S1w=@vger.kernel.org
X-Gm-Message-State: AFuF++mtx2yD3fBirwyVO0zueMjQPwpq6F6bo/qX0CWMCAFfmSTktzVp
	Rl51eQzjcQI8TjvR+ZReuy8A2Umyjslj28LpA0aTcxJU4jvTl7DHWj+N
X-Gm-Gg: AYBFou3KxoXYNqPCa3h/fhaG0D62/n/MpkvyUJM62r1fpxPlcub+wXnzdJq8vEtyW3H
	EiRw+yOHbQWBYdN2NBB6DTb/PRL4eLi/x8pHuE3bQS3HfE1E3RbZdUTpezYN+m++iooa5iEyh0k
	hNBPCRUMhCPVyAtjlTdFc8pyB15QXztHu5oZQu477gVjcJrHXkzbg772NNrnDk06zYkZaPYWIKR
	vMbye88q9ArmYkIpjTvyFXE6L86sYN5TZMRIT+D/12PsQmaOEBOHi/RrDIPZwzrw7hMnQB7SG0s
	0YOEzUp0vYT4MAfNcUxWaqWP3Gb2HTtpx1x97HTaxLjbQcXHjps++wEkArOYpFy1eaF5Z9Kv559
	3lf7F22nbMzJJInnAlBZSM6TvDS7L5+fods98POq6jKWgGMZ4QGx0cueN+scWlFm3HHOXz0r5VH
	kavej+GgUVmGpNkvuOyHh0AGXrSUdoFXx8VYjjigBD/DN121n3z3ZB+a/LJHz4ihIGICCfDMK8I
	A1DJXm5NLRiJBuNJm211cpUKt23Wi1k3s8EahAauveNyxXiqF/ks17pvjhWONYa7N3nMjMdwejp
	JGUtBLdaWw==
X-Received: by 2002:a17:903:2a8f:b0:2d9:1dee:43db with SMTP id d9443c01a7336-2ddb1b7ac15mr113040235ad.15.1789856762699;
        Sat, 19 Sep 2026 15:26:02 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc178701csm12946375ad.13.2026.09.19.15.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 15:26:02 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: brauner@kernel.org,
	viro@zeniv.linux.org.uk,
	kees@kernel.org
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] adfs: validate zone map parameters and clamp dm_endbit in adfs_map_layout()
Date: Sat, 19 Sep 2026 22:26:01 +0000
Message-ID: <20260919222601.3793825-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In fs/adfs/map.c and fs/adfs/super.c, validate nzones and zone_spare on
mount to prevent divide-by-zero in adfs_map_lookup() and adfs_statfs(),
and clamp dm_endbit / map offsets to the underlying buffer_head block
size in adfs_map_layout(), lookup_zone(), and scan_free_map().

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
diff --git a/fs/adfs/map.c b/fs/adfs/map.c
index 9d535a2ca2d1..6ca7ebf22388 100644
--- a/fs/adfs/map.c
+++ b/fs/adfs/map.c
@@ -68,17 +68,25 @@ static DEFINE_RWLOCK(adfs_map_lock);
 static int lookup_zone(const struct adfs_discmap *dm, const unsigned int idlen,
 		       const u32 frag_id, unsigned int *offset)
 {
-	const unsigned int endbit = dm->dm_endbit;
+	const unsigned int max_endbit = dm->dm_bh->b_size * 8;
+	const unsigned int endbit = min(dm->dm_endbit, max_endbit);
 	const u32 idmask = (1 << idlen) - 1;
 	unsigned char *map = dm->dm_bh->b_data;
 	unsigned int start = dm->dm_startbit;
-	unsigned int freelink, fragend;
-	u32 frag;
+	unsigned int freelink, fragend = 0;
+	u32 frag = 0;
+
+	if (8 + idlen >= endbit || (8 >> 3) + 4 > dm->dm_bh->b_size)
+		goto error;
 
 	frag = GET_FRAG_ID(map, 8, idmask & 0x7fff);
 	freelink = frag ? 8 + frag : 0;
 
 	do {
+		if (start + idlen >= endbit ||
+		    (start >> 3) + 4 > dm->dm_bh->b_size)
+			goto error;
+
 		frag = GET_FRAG_ID(map, start, idmask);
 
 		fragend = find_next_bit_le(map, endbit, start + idlen);
@@ -114,15 +122,19 @@ static int lookup_zone(const struct adfs_discmap *dm, const unsigned int idlen,
 static unsigned int
 scan_free_map(struct adfs_sb_info *asb, struct adfs_discmap *dm)
 {
-	const unsigned int endbit = dm->dm_endbit;
+	const unsigned int max_endbit = dm->dm_bh->b_size * 8;
+	const unsigned int endbit = min(dm->dm_endbit, max_endbit);
 	const unsigned int idlen  = asb->s_idlen;
 	const unsigned int frag_idlen = idlen <= 15 ? idlen : 15;
 	const u32 idmask = (1 << frag_idlen) - 1;
 	unsigned char *map = dm->dm_bh->b_data;
-	unsigned int start = 8, fragend;
+	unsigned int start = 8, fragend = 0;
 	u32 frag;
 	unsigned long total = 0;
 
+	if (start + idlen >= endbit || (start >> 3) + 4 > dm->dm_bh->b_size)
+		goto error;
+
 	/*
 	 * get fragment id
 	 */
@@ -137,6 +149,9 @@ scan_free_map(struct adfs_sb_info *asb, struct adfs_discmap *dm)
 
 	do {
 		start += frag;
+		if (start + idlen >= endbit ||
+		    (start >> 3) + 4 > dm->dm_bh->b_size)
+			goto error;
 
 		frag = GET_FRAG_ID(map, start, idmask);
 
@@ -310,9 +325,12 @@ static void adfs_map_layout(struct adfs_discmap *dm, unsigned int nzones,
 			    struct adfs_discrecord *dr)
 {
 	unsigned int zone, zone_size;
+	unsigned int max_endbit = 8U << dr->log2secsize;
 	u64 size;
 
-	zone_size = (8 << dr->log2secsize) - le16_to_cpu(dr->zone_spare);
+	zone_size = max_endbit - le16_to_cpu(dr->zone_spare);
+	if (32 + zone_size > max_endbit)
+		zone_size = max_endbit - 32;
 
 	dm[0].dm_bh       = NULL;
 	dm[0].dm_startblk = 0;
@@ -327,7 +345,13 @@ static void adfs_map_layout(struct adfs_discmap *dm, unsigned int nzones,
 	}
 
 	size = adfs_disc_size(dr) >> dr->log2bpmb;
-	size -= (nzones - 1) * zone_size - ADFS_DR_SIZE_BITS;
+	size += ADFS_DR_SIZE_BITS;
+	if (size > (u64)(nzones - 1) * zone_size)
+		size -= (u64)(nzones - 1) * zone_size;
+	else
+		size = 0;
+	if (size > zone_size)
+		size = zone_size;
 	dm[nzones - 1].dm_endbit = 32 + size;
 }
 
diff --git a/fs/adfs/super.c b/fs/adfs/super.c
index 888aa81a6b39..5b570a4769da 100644
--- a/fs/adfs/super.c
+++ b/fs/adfs/super.c
@@ -87,6 +87,16 @@ static int adfs_checkdiscrecord(struct adfs_discrecord *dr)
 		if (dr->unused52[i] != 0)
 			return 1;
 
+	/* At least one zone and one allocation ID per zone are required */
+	if (!dr->nzones && !dr->nzones_high)
+		return 1;
+	if (le16_to_cpu(dr->zone_spare) < 32 ||
+	    le16_to_cpu(dr->zone_spare) >= (8U << dr->log2secsize))
+		return 1;
+	if (((1U << dr->log2secsize) * 8 - le16_to_cpu(dr->zone_spare)) <
+	    (dr->idlen + 1))
+		return 1;
+
 	return 0;
 }
 
@@ -181,7 +191,8 @@ static int adfs_statfs(struct dentry *dentry, struct kstatfs *buf)
 	buf->f_type    = ADFS_SUPER_MAGIC;
 	buf->f_namelen = sbi->s_namelen;
 	buf->f_bsize   = sb->s_blocksize;
-	buf->f_ffree   = (long)(buf->f_bfree * buf->f_files) / (long)buf->f_blocks;
+	buf->f_ffree   = buf->f_blocks ?
+			 (long)(buf->f_bfree * buf->f_files) / (long)buf->f_blocks : 0;
 	buf->f_fsid    = u64_to_fsid(id);
 
 	return 0;
