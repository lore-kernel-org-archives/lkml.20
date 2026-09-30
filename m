Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5EFD24676D
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 03:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790740123; cv=none; b=J9JghFVTdIixwbnaOln4OxY0LuCnosokIWZmOSlFtPVC8DudW+8oJq8ukCupV12q8t/Vm2gwyb4XnFEThjpDbcj1WbSkV/OmdaXvwkgrawdyKC39SvJpbcWt8mJFLhRkGt6dsGFOHSvRlfG7iYjHQfseISUNUNfE4tWbHhcRwcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790740123; c=relaxed/simple;
	bh=H9+3s30juNb/giEz7ochd/E34EnHCmREpDdKjVmyt5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DwUHPTAid63/aEYqJtIjkx++WwkXcd5GDVvvm8f6LX5c4fTkQQF+6Y/dfyRTR7V391yYf1Nm3+X36t4htxVIhgYYLYyhqxE7NMG/92lKe5G4bSamnWh5G/yp2BKFYiDmyAyp+fyXEr5SDzQvO8SGpcXhtYpeiZWDcSTu9OT+mMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FvrVveLu; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FvrVveLu"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2e2e0d89e58so1775565ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 20:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790740121; x=1791344921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hhfDMI89uIjDeVVfhi83eTXwgrgv3Y9LBAg7bCLRm98=;
        b=FvrVveLuxm5s0vhwnL2YJbc5ud5NIm98zFRv9QMZQqyemQUaMLGi6gcAF3qOn/kx3l
         fAP0QLJ73ApuuRqB9wTCcoTF809c+zwWRzFwMTRWaoZ9+BDx7vAMX9yKnDqRM/Y0EvHA
         FpWrbP+sNk+40VqiWDG2d/PQHo+SxJLSWZyUSQA4ndEdKULW6HR3k5GZrc/eI+Y0k2bE
         QxXW78FOkqIFqXro8o2qIsa1USpvvnCRV0yBiNZ+EmLSf46BwlE+znz7BEPvFxKi6bU3
         nuLvzLT2smmYTQzAYnIhVMInsegms2pA9DWYtaugbuchgXoFJe+1NJ7+x1ztqhiofrYv
         qNkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790740121; x=1791344921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hhfDMI89uIjDeVVfhi83eTXwgrgv3Y9LBAg7bCLRm98=;
        b=XJ6GWrl+MS0Y98Z/R6a6T70wad0bEdkj09OCKHtX8n2UxP8IQUKq8KNvlGGaCS1Iil
         XGfxod9dJIsSYt0Xt6bI0evXYxYCWVq7OOfWT9GZk7f3NMMLuBBttazKXNKkYURX1nvX
         iQ1ynf88cRL1xDJiXa2cOJte88CCFZ54U67kjeQ+KphY18pBxHLIc3Te99LrSQ9p8Cj2
         98PBpk8ptFMPlNSRi7zxvWlU4QTCqOiom5wE3jIbXHfU1LJyUx6bF918s36JCSRUbMJL
         zzYmA0nC6ABhamkTP0I+Y9sn8ihtk/cnzjHwL3AcPTgb+IxMADkGFOu+xjzCZGs/f3vk
         KRzA==
X-Forwarded-Encrypted: i=1; AKwUvBzXB7qBExXeTbQJ0vIH2xhJeBAjYtssTFUZBbaAwnqUPRXtt7NUGEcW1MDhUnLwJvNvLg+Oyb2jzOBW9OM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHZ6d81udgGd7PuSzPXw7mUWV1lgGzUBuVgIGUfMtpARql9k4N
	UuUh847SsN53tqKj/21GxirlrgKa/xKWawA0e6or0ISxC9etsemm2s/+
X-Gm-Gg: AYBFou0Z2CD4VHZC71Ysl8S5lt//xkRB+IQj4p4QCnlmFQF+RE8OiBGtakjVLgCAFTl
	IHz7fT+EndJUn13t6EY+k7WbBQNv9NxkQ1QqogpWjTPsBxjCfPH+7x2nwoCZnEbcUiqek8ebkVW
	oGzoFnqwRbF8vecxeSvTZrJvmJlU8ok/RpVQ2zxm4flNqJ8s//Av9QPztIL+mE8YFNOOlFZjVcN
	caynDXiqFMh4nFDHaDeTtRNuX3rFx0dCnDvczuBwOM5NM76e50RONJN9pBZ3CDLRFrkBIHSDKUl
	lIKX2eLQ4WqCl2z62pNG//SFkIrO2dAUlR3XBNjLwveyjwuC8J3ItnZ8IXKc2p/83mXPYvX2rsO
	ohhSaZSf/Dfk/VwC9M11AVre+PqSL1SY4O7J7acaC7gQ1pphm+jJKXbX+RUL0kpE3OmFZLUeFTE
	fvdCyQ28kwaFI2Mr31oznY/VbtFwcH4MjnCcyP/vOo7PWiKwtyz/g5xs1yVEEmUovIH5tfqfdKZ
	iEdaydzQENDPpCuiwRTKUn8/VjBirQJGYdXvMm2UrF5BNC28f8pYqZ3ESVkbdf9zsKWv9ECHRdV
	seCIW9dsY8T2Gf2V2pAts2cReHhqkp2JcCP8lwpB8LYA+ZgwfWizICXkJkk=
X-Received: by 2002:a17:903:b4b:b0:2d6:ffa1:429b with SMTP id d9443c01a7336-2e2e4907f6amr1727745ad.7.1790740121227;
        Tue, 29 Sep 2026 20:48:41 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2dd86f3ddsm3760005ad.68.2026.09.29.20.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 20:48:40 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: Baolin Liu <liubaolin12138@163.com>,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/6] ntfs: do not map an unmappable runlist fragment as a hole
Date: Wed, 30 Sep 2026 11:48:30 +0800
Message-ID: <7345400f8bb4bbb85c071151b6052129ecd0d3d4.1790684177.git.matthias.goergens@gmail.com>
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

When the extent mft record holding part of a file's runlist cannot be
read, ntfs_attr_vcn_to_rl() ignores the failed ntfs_map_runlist_nolock()
retry and returns with *lcn == LCN_RL_NOT_MAPPED.  The iomap read path
only rejects lcn < LCN_ENOENT, so it maps the range as a hole and read()
returns zeros with no error.  The first read already does this:
ntfs_attr_map_whole_runlist() keeps the fragments it could read,
readahead drops its error, and the next lookup finds the unmapped tail.

On a file whose runlist is split between its base record (vcn 0-214) and
one extent record (vcn 215-1499), breaking only the extent record's FILE
magic makes the kernel log "Failed to map extent mft record", yet read()
returns 1285 clusters of zeros for vcn 215-1499.  A damaged attribute
list entry, which makes the retry fail with -ENOENT, gives the same
zeros.

Return -ENOMEM if the retry ran out of memory and -EIO otherwise.  Both
callers already handle an ERR_PTR; other negative lcns, including
LCN_ENOENT, are returned as before, and so is LCN_RL_NOT_MAPPED at or
beyond allocated_size, where nothing is mapped: the runlist ends there
with LCN_RL_NOT_MAPPED when only the last extent is mapped, as after a
write into it, and with clusters smaller than a page every read of a
file's last folio looks up such vcns.

Reads of vcn 215-1499 now fail with -EIO.  An intact volume exercised
with buffered, mmap and O_DIRECT I/O, fallocate, truncate, sparse and
compressed files behaves as before.

Fixes: 495e90fa3348 ("ntfs: update attrib operations")
Cc: stable@vger.kernel.org
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
 fs/ntfs/attrib.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index 333b3371acb47..5f5a91265af5e 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -317,7 +317,7 @@ int ntfs_map_runlist(struct ntfs_inode *ni, s64 vcn)
 struct runlist_element *ntfs_attr_vcn_to_rl(struct ntfs_inode *ni, s64 vcn, s64 *lcn)
 {
 	struct runlist_element *rl = ni->runlist.rl;
-	int err;
+	int err = 0;
 	bool is_retry = false;
 
 	if (!rl) {
@@ -335,12 +335,32 @@ struct runlist_element *ntfs_attr_vcn_to_rl(struct ntfs_inode *ni, s64 vcn, s64
 
 	if (*lcn <= LCN_RL_NOT_MAPPED && is_retry == false) {
 		is_retry = true;
-		if (!ntfs_map_runlist_nolock(ni, vcn, NULL)) {
+		err = ntfs_map_runlist_nolock(ni, vcn, NULL);
+		if (!err) {
 			rl = ni->runlist.rl;
 			goto remap_rl;
 		}
 	}
 
+	/*
+	 * The runlist fragment containing @vcn could not be mapped, e.g.
+	 * because the extent mft record holding it is corrupt.  Do not hand
+	 * LCN_RL_NOT_MAPPED back to callers, which would treat it as a hole.
+	 * At or beyond the allocated size nothing is mapped, and the runlist
+	 * ends there with LCN_RL_NOT_MAPPED if only a later extent has been
+	 * mapped, so return that end as it is.
+	 */
+	if (*lcn == LCN_RL_NOT_MAPPED) {
+		unsigned long flags;
+		s64 allocated_size;
+
+		read_lock_irqsave(&ni->size_lock, flags);
+		allocated_size = ni->allocated_size;
+		read_unlock_irqrestore(&ni->size_lock, flags);
+		if ((s64)ntfs_cluster_to_bytes(ni->vol, vcn) < allocated_size)
+			return ERR_PTR(err == -ENOMEM ? -ENOMEM : -EIO);
+	}
+
 	return rl;
 }
 
-- 
2.55.0

