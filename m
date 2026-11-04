Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793819804;
	b=LXs4Q2oHEnATpbRGXB2qbb3umwaQC9VbE55zgt3l/9RgTiLiRf1ZK2vv3fbKTaC1zKf/
	 ubguajFFEOA2R59E95saVzIShGPyziYuScHok/3cvpkl4hrd6aDQeLuIVSqwZrFVT+XNg
	 aMOPEUOhCS/5mxfwbCuWuO8JeKw3ySmFqynskuVgekdpwMv1+W9RQTd+pTNg3/FtzbvTB
	 h7MpQtB1zDjhelMTTuOTbCSnigslESC2BWaUyG5/wjFe6Ih4QhJvvBMe0jz649SHO3xOG
	 cot1cVv+dGQM4Cdn9TnDduH2vv/EVwKpyJFJklFCpGfK5Z+NkmRzeROl5AZktRYBwbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793819804;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eSNiR/u+jF1juXBbpc/UT4G6ygT/mwfkEaeSc9JG4Bo=;
	b=jX4tobPamHlrCTFXhRHCN7scoWV/8oHF+wn6DF7XRcEZqBBL+U4K/jAhldkpttNmrTlN
	 0D+CaPVaIBmzu2p5oql2+po/vkaKLJztIW/Jlcd0bAStbQXS83zf8X63GMDeRIrsWj51p
	 RUwbxlQYelkRf8WtG9pTvp2m49LWEIXriqSa8m+hfTwXJpF8OQmtq94QangfFz/O0QXAm
	 5/R29eC2TvSsAsplNX0Q41H/WcmwKR75HQqxzq3EoBjfTMvh9sSRCoeEynh1suqusS7gm
	 g3RnSh72VFhb6poe3m2e5w0kDTtOez0r9sMaKCD72lrK5GAwnlH8Wim4IDcnu0lUCfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HPML37VD;
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A54B606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 19:16:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A54B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HPML37VD
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-36caa19b0ffso610786eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 11:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793819803; x=1794424603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eSNiR/u+jF1juXBbpc/UT4G6ygT/mwfkEaeSc9JG4Bo=;
        b=HPML37VDjqNIY79kIBbqkgr0jhTitN3IVcQUPu7dW9DT2p0aGqioBaqqa9L9V8ZLqn
         n8G4IEccGsEJajih8bcwZrWEoTrqUhRkxMzpy7ePIl9e94el616ne9BZ635i2X9wcfiM
         gKslbNEGQLIcAjrjujMkOx6g+9sBE7L854Wjt7piOzrUA4G8E291xPTXlpfxnHK8u+pL
         t3k9e7N27gFvtnQDfwGsCdqloM8s8w3kyaeMYq/CKPPmVyTpoyHrGbE4uVltYdm+H4hM
         aFgFdrA2533Qa08IyBCJXFfShfPoXuIR0XZBCqcXYRHs/ICmuRfjMmjSM/F7hnt3rCgb
         lD7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793819803; x=1794424603;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eSNiR/u+jF1juXBbpc/UT4G6ygT/mwfkEaeSc9JG4Bo=;
        b=IhU3sOEPFMhsDjQO9TJIDW8cl9GCtjZrPmNxQqms0nRYk9bF4ejXDVLh0i6GUwCBRs
         qleHBOCxqgMoHP53cNiHAGIZhCfWjHCEhABdCBgtJIvPFrDQfEZr81M3yNOu2AN7NkR9
         bpc7BUjuJC1UkuYtTyZRD3tdRlxYVgNo50lrg1LrUjKbCa49zFjyQ+xXVmtaEGRxXvFR
         M41AsN11rn+es9OfOqr3eiJJth/NP8qrpsW6LEE8m52B1yyZLUp3Bm2XgS1/yP5ntpOO
         eBGhKnol+16Kc8sZo9y+h2BqKsfXO9/LhlwyHoe07JhFNteIAJcHHOMcz3qATIIIhKt+
         tKRw==
X-Forwarded-Encrypted: i=1; AKwUvBxFUf5yxOHA72B+uSqrVGNP9pBwASkRzQUYGsfJw9uYN+hT4mkV4EBzNbBwkB4bR2IHcLPfDsuRasbjG2U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+K7F6608Q3bGwPSAymCEnvsS7424AkOsz7x9Ld1myppZOtTinn
	IvseR61MkUUuN2xCuew0eNhpUu5m0iJAUZaYXtxOunIXYIm+IO3RZ0W4
X-Gm-Gg: AYBFou21etjthAeSg1osQ2eyf2Pw5yUVJP6BdbxVVP4FP3TEOmO+Za4B/6ml3i7YV4X
	kYFn/iUwUJUmJz0jBpN2/HqnaeOznfVOz5dECfmkSq6O3kr4tIg8waQub+iLiJKyfc6uHQ/0s7f
	IiKEuCWDM0b/SuAh146/NnzsJqLppMNoKFyfJqiJxuJUcjQQJ3B/KisPjjlyng4AZI8u48280N3
	vO0KsnYiP+y9FFSp6z8HkhxU1yUqjld98RgHcVLAjuk9rQyn5QL3yVvS8dU/H7HAml24p3vk7sq
	ILJG/NGqApZesAJeE3XMv+ydmw2LIzD75NHWARAGnEotvN8QpybaE1gygIMYCzVWMhbldRU22l/
	KTZnEDwN1xX0gJ0KxBH9CxsSi+7dQButZfMbN2bhOTVeVUq4oVJrMbfP8DNDy4oU2QMDXJV3GMF
	wOjFyTO2Zrb11/US5zwQz5sV924Tc2Q1wJ9Eqy/YbgXdMqrm4nvbipTLlKvhPOxLJPbaE4JxazH
	qs9nO558jp/0tIrLCb7uPT7GzK7u/L2boskXR624P4aQc9+jg1I6BHQ3NW49Xd7sIaa5zH4d9m2
	YW9N8sQXTQDLSB6tw0xbzI0ZNTSW84o0GwmVMjpLw/QhRVCcYiHPSvIrZcw+V1IknWK340m9zCt
	IXzFmPqrmAifHX7BEnQtftH43UK8UxsvAKUn08g==
X-Received: by 2002:a05:7022:1707:b0:189:d6bf:7eaa with SMTP id a92af1059eb24-1ac5c3699f6mr22489147c88.16.1793819802794;
        Wed, 04 Nov 2026 11:16:42 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c2c2f7sm10017000c88.9.2026.11.04.11.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:16:42 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: daehojeong@google.com,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] f2fs: read atomic replacements through the COW inode
Date: Wed,  4 Nov 2026 19:16:21 +0000
Message-ID: <20261104191621.89561-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Starting an atomic replacement drops the page cache and resets i_size,
but keeps the original block mappings so the operation can be aborted.
After a sparse write extends the replacement, buffered reads still use
those original mappings for the skipped range and cache the old data.
Commit removes the old gap mappings, but the cached data remains visible
even after reopening the file. A subsequent partial write to the gap can
write those stale bytes back to disk.

Resolve buffered reads through the COW inode during atomic replacement,
so unwritten ranges are read as holes. Keep using the original inode for
the read bio and its encryption context. Once FI_ATOMIC_COMMITTED is set,
use the newly committed original mappings again.

Hold the mapping invalidate lock while committing or aborting the atomic
write to serialize these mapping transitions with buffered-read faults
and readahead.

Fixes: 41e8f85a75fc ("f2fs: introduce F2FS_IOC_START_ATOMIC_REPLACE")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 fs/f2fs/data.c    | 8 +++++++-
 fs/f2fs/segment.c | 6 ++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 28fd8afff5d..89c4de3640d 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2489,7 +2489,13 @@ static int f2fs_read_single_page(struct inode *inode, struct fsverity_info *vi,
 	map->m_lblk = block_in_file;
 	map->m_len = last_block - block_in_file;
 
-	ret = f2fs_map_blocks(inode, map, F2FS_GET_BLOCK_DEFAULT);
+	/* Original blocks are kept for rollback, not for replacement reads. */
+	if (is_inode_flag_set(inode, FI_ATOMIC_REPLACE) &&
+	    !is_inode_flag_set(inode, FI_ATOMIC_COMMITTED))
+		ret = f2fs_map_blocks(F2FS_I(inode)->cow_inode, map,
+				      F2FS_GET_BLOCK_DEFAULT);
+	else
+		ret = f2fs_map_blocks(inode, map, F2FS_GET_BLOCK_DEFAULT);
 	if (ret)
 		goto out;
 got_it:
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 43f40071576..f45b5ad78fc 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -193,6 +193,8 @@ void f2fs_abort_atomic_write(struct inode *inode, bool clean)
 	if (!f2fs_is_atomic_file(inode))
 		return;
 
+	filemap_invalidate_lock(inode->i_mapping);
+
 	if (clean)
 		truncate_inode_pages(inode->i_mapping, 0);
 
@@ -218,6 +220,8 @@ void f2fs_abort_atomic_write(struct inode *inode, bool clean)
 		f2fs_i_size_write(inode, fi->original_i_size);
 		fi->original_i_size = 0;
 	}
+	filemap_invalidate_unlock(inode->i_mapping);
+
 	/* avoid stale dirty inode during eviction */
 	sync_inode_metadata(inode, 0);
 }
@@ -409,11 +413,13 @@ int f2fs_commit_atomic_write(struct inode *inode)
 		return err;
 
 	f2fs_down_write(&fi->i_gc_rwsem[WRITE]);
+	filemap_invalidate_lock(inode->i_mapping);
 	f2fs_lock_op(sbi, &lc);
 
 	err = __f2fs_commit_atomic_write(inode);
 
 	f2fs_unlock_op(sbi, &lc);
+	filemap_invalidate_unlock(inode->i_mapping);
 	f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
 
 	return err;

base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
-- 
2.50.1 (Apple Git-155)

