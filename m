Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4464038E8A0
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 03:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790740125; cv=none; b=bDAmMpi0m25QqEyBOwEfT0U2I2JHBnbFt9xOGJotY4sM22G4VDtOMnOHsfPa4QWdjwbfzAVw144/Au4dOfrfTtVDGiJNM5+mlgyK2shQl6EPa9PfjN7Q/3OxpAg/C3vtDJK8ctDwXbk7CM0h6Q++e5YW6Rwz8z3mDvBZa/zJe/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790740125; c=relaxed/simple;
	bh=6xXPxNSmsFKV2TVA93HTty6D+P8jZ+V6clCDU9AmmVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uel1JJb7PZ2rgkNdw6Cc8H9PhQZnE81gkDtDqzNxXzOHkwhYTLQqlzbCtTyHj1xIL4dev6peHEloqGZdLvn8ZMqxPBZB6DWxdNhwMfgIaoYeZ/Ln6JLXGBdtgWp8ja4/nULs2FG5iHuOdD6FlfCQNxIZdCbHgwEsiTvawUIB8bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q0gcRd8+; arc=none smtp.client-ip=74.125.227.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q0gcRd8+"
Received: by mail-pj2-f39.google.com with SMTP id d9443c01a7336-2e2d2bbcab2so4293465ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 20:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790740123; x=1791344923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PFhbuoDvUhhT0NM7dVUo0Ay1NU3i0WuHFz8vsUDnISE=;
        b=Q0gcRd8+crfW1TXYs5YfV1mX70FyfUGolTGkNckA75yFfPuvwjSXDxEj2FRKJ54Lxi
         AatE1ntyikQS9crNHNXlkfsD8oOJT3+cM4FCNPMZ/onC7oRAXj4x8qS6RFTOjgf25ORg
         W12aLGealTubZKTqiuTadOMj9O1FA8XMhPcyQgE4VpshOt6WwQ5Gt4yen3BhgUf7DKSp
         P8JpGfc+x+Sub4D+1bYWIeTx+Xp91pV0+5tiictS7kOVqECOH7tRMj2RWRxFdxuhNWqm
         Q20/m4MJME0gJ/nMTd0C1BJUAxn0jWPQY8VWSZ0lgEmh7v7O5W1vGDCeJxQVzGd2xdvw
         qVPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790740123; x=1791344923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PFhbuoDvUhhT0NM7dVUo0Ay1NU3i0WuHFz8vsUDnISE=;
        b=sJICZZCgOEg0MxYmnqKLswaJicjT1dtNdDz120wJSdIerrLJgJLbiQVWeRpQyYSvbI
         Ru6v8OaZZwnHlJmgaWDhACyPEAYlLqe5cvjm1CMIF3e/L4xmSC7uhZQo6sRRozkncfCW
         7B7eG2TeszjW7gNcc0CRbgTIuBqzGLxEMoqLmUraCdASxnl80VaI08Z4qsCThHyiR2MC
         tFONX37S58p1l7N/uW65sWT/1LblP+G9uNnygzvj8P8sy7ljPY/UNfD/IGDucdt8ygKO
         Q/Kcw/pbz+m1e1/Y3njRizOLRxU/dzfnXiP6Xf2JOAidSwwXUgF6yuVKggHRbYVC7jW4
         WHgQ==
X-Forwarded-Encrypted: i=1; AKwUvBxrxqlZDS22JdVyhSk0x3IKxIQwgrpA0pAxh25ZxRp6m0QTSMTNPtKb0bDwI8uMpZURswV5GUrZl36O+N0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKtXfpKrTT322gSn/RJOVXafcpfWJx06rSpbIVJbzX8H8ifxL+r
	qXWcGxPSY/26ZnawKDuhqmSmTRCGM7njsf2r0LYwCileOI8eMjrJY5zt
X-Gm-Gg: AYBFou3txADz3xr9mhY8bl/5WW0ouwXStWErMcWAamHOTaeT2ixn/jOY1hy7iKX6EBn
	y6h2NPVmAkDukMDR7293NmZZZLvk0I76QgMNzzaOltkYbEY5AL3IACPZMqu4YmVXnHXgh+xZgjs
	yfK+j48SW21yqkZeHODRLkN9j6s+Z05SqBNQzggqj79MutSHxzTfZ8rjwMADGmXNIDNaZUTiDDW
	3nvlngyMAzWEQJyG2mf4DyQvphCASv5lliIvDH8BXqTeo4ytQPWhpJKRNuRh5LtHS53jPXNGANz
	M6PkWu0ybg+8rUiEYn5L1TB7eFZ+J4mia41IUTcLEO7/PpVS8Cfyq6FH/zM1BaJSorBsDX5BNXR
	tZIHe2DR//MznD61QxDfvrzoZ5HG3QuQLaTjW+szPlm9YCydX4lwFAhvkPkMFfl8qksAPoyob+r
	xNsj2fvhBnEs0eXO5qpTHO6RGdJi/BpzK29/exTtBUUMRJCv1khZsltozMGTKwukYqQfla4g29J
	iMdfoE3GvwqeTHvYsXHnWqb/9NxOD5zgoB16J4i97m68h+NE6BbNfXqDXAwVe9bNuSIt7WwavbO
	4Usx7466hi8ETsGv95UYeFB8zAhWePHrxszhUHDUhP3mroAN8pmQDuOeiaQ=
X-Received: by 2002:a17:903:94d:b0:2e2:c69a:bd7b with SMTP id d9443c01a7336-2e2e4b5a1aemr1470685ad.13.1790740123163;
        Tue, 29 Sep 2026 20:48:43 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2dd86f3ddsm3760005ad.68.2026.09.29.20.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 20:48:42 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: Baolin Liu <liubaolin12138@163.com>,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/6] ntfs: do not turn an unmappable runlist fragment into delalloc on write
Date: Wed, 30 Sep 2026 11:48:31 +0800
Message-ID: <1360d1ada75cddf19f05e0bab437f4f216fc30f7.1790684177.git.matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790684177.git.matthias.goergens@gmail.com>
References: <cover.1790684177.git.matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntfs_write_simple_iomap_begin_non_resident() has the same unchecked
retry.  LCN_RL_NOT_MAPPED passes its "lcn <= LCN_HOLE" test, so a
buffered write into a range whose extent record cannot be read is
merged into the runlist as LCN_DELALLOC over clusters that are already
allocated on disk, and write() succeeds.  If the record stays
unreadable, writeback fails too and the data never reaches the disk;
the error only shows up at a later fsync() or a synchronous write.

On the volume from the previous patch, after a read of the file, an
8 KiB pwrite() at vcn 1000 returns 8192, fsync() returns -EIO, and
after remount the range is unchanged.

Fail the lookup here too, with -ENOMEM or -EIO.  That pwrite() now
fails with -EIO.  Writes whose range can be mapped are unaffected.

Fixes: b041ca562526 ("ntfs: update iomap and address space operations")
Cc: stable@vger.kernel.org
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
 fs/ntfs/iomap.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/iomap.c b/fs/ntfs/iomap.c
index c812d7f19b360..b4475963e57a7 100644
--- a/fs/ntfs/iomap.c
+++ b/fs/ntfs/iomap.c
@@ -394,7 +394,7 @@ static int ntfs_write_simple_iomap_begin_non_resident(struct inode *inode, loff_
 	loff_t vcn_ofs, rl_length;
 	struct runlist_element *rl, *rlc;
 	bool is_retry = false;
-	int err = 0;
+	int err = 0, map_err = 0;
 	s64 vcn, lcn;
 	s64 max_clu_count =
 		ntfs_bytes_to_cluster(vol, round_up(length, vol->cluster_size));
@@ -429,12 +429,24 @@ static int ntfs_write_simple_iomap_begin_non_resident(struct inode *inode, loff_
 
 	if (lcn <= LCN_RL_NOT_MAPPED && is_retry == false) {
 		is_retry = true;
-		if (!ntfs_map_runlist_nolock(ni, vcn, NULL)) {
+		map_err = ntfs_map_runlist_nolock(ni, vcn, NULL);
+		if (!map_err) {
 			rl = ni->runlist.rl;
 			goto remap_rl;
 		}
 	}
 
+	/*
+	 * As in ntfs_attr_vcn_to_rl(): a runlist fragment that could not be
+	 * mapped is not a hole.  Treating it as one would put a delalloc
+	 * extent over clusters that are allocated on disk but unknown to us.
+	 */
+	if (lcn == LCN_RL_NOT_MAPPED) {
+		up_write(&ni->runlist.lock);
+		mutex_unlock(&ni->mrec_lock);
+		return map_err == -ENOMEM ? -ENOMEM : -EIO;
+	}
+
 	max_clu_count = min(max_clu_count, rl->length - (vcn - rl->vcn));
 	if (max_clu_count == 0) {
 		ntfs_error(inode->i_sb,
-- 
2.55.0

