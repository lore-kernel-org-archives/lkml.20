Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D43536C581
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 15:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788709773; cv=none; b=rGYTCsyNYUtmWM5JmZXzxTJATTYUOsYQSk6k5bfMA1ZAe/XisMgR8rmsro7sdETy4nRTPw0i0+V3pIQsoX40z1QDsJqZgEO2GkNM7mZtov6B8IL9FIjB78JWsi88JUxQf5cm/NF17ltzFrk5FF48uWohGuKBOIhjfV1a74Uc0wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788709773; c=relaxed/simple;
	bh=gLgR5hH9TpKdCjqZyFRqJNOHPp4YzoVfvrONPg729BQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lp+azQPovWScWWTZT5sqCKIJBa/B+UjMVXtmnFgUFXaEvbC/B9pkbVyfWZELfg5NrJdxzyHyzQkT6o7kO5VTcdJPLpcvP5hWxQyPMKpr7v/EPyJUoEKT3jl4pJD3ssO3k2GyUhosY97fx3bmXOYJgVxER2XnnUPJ3FFF9vNFfCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F33D9ilR; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F33D9ilR"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3964dfb5a69so3610419a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 08:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788709770; x=1789314570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nnEQOH1FPlYD+C4tmq677bqNxTEuPgTx+WW+XcbxEss=;
        b=F33D9ilRpLuhsTtwTMjjwJFdOJYYKsCC4SyzYoF0ihBSOAHt9l6nrHWWyeJnphCWIb
         bFxVhnq2IwyBFORGgg3LOhyVksM8pT9bvbANTsnqCygOpnkeiSxJxZHko39IURHHNafj
         /EzLG5BQcMLG3vi7Z0BnTJV7KZ+9GscT7fSARENeXmkROPSuWh0F1kMsoc1d4hIGCDgL
         RzvWeMot48rmEZ4tMnms0DmXhgoaFzny/X7gKYLLNM1qKlDVaWGhmMxzwcXmnv6djpjn
         mkX6YlrmbU8lHA1eURqb0L1SwnK8kjNdUzU7dro3ShIvhPIfadVYy69Z68CKJAAMVsHL
         QD9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788709770; x=1789314570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nnEQOH1FPlYD+C4tmq677bqNxTEuPgTx+WW+XcbxEss=;
        b=kEQ9LLJVHyjMn60+ddKtHaeANZaA4MMWrKaybgeu77CZLWG6a2R+kahineiwp3hpIR
         u+6YVloXdz0e7iLyIHQ0Y4F3VLIPd6X7vzExl7SMxRctB/8/Wnet33Wg3Tvs0H7wimTl
         YcjwvvJ4mE5uOcoN+DaowufOUL1/37XX9WraAcUl4OVNHCaHYdX40Bs2Hw4NgjOfbb5Y
         ob3oT7QjZe0X/ZG87z6g4qY4KlZmG7f7LiktDzOk+d97JJo5Vou1Pw572f8A4znooZ+8
         x7fWTqimVL5naI4TvCvTh3pRltC+xyd/aDYJae+9QSkN0vvydzcmpndBJa9wBzck+0h3
         gmTA==
X-Forwarded-Encrypted: i=1; AKwUvBwqnl3gej2g5JrOxeJAF4+PaLDYKoLwk7wpwzdkbO8yWfngVuomHsVKLLomgxUeEOTYxXyK8XMD0L3S2aE=@vger.kernel.org
X-Gm-Message-State: AFuF++kjZPR4GnoSoCJKYJiC3r9dnhlY1FI8NidfnAG6nCLWXxDg9IE/
	pEarpZnpxtMrgaD9NRlbQMso3JRjhvwpanNKDV1cG9qixDwXZzRpGppB4ktV6Q==
X-Gm-Gg: AYBFou1eFmUov8JzVjgIk2KP97CF2lpHOOWuG9ely+/+Cx2Z16Rg7S9atyEr3CyUOK6
	77OPa5fy2VGiA9KPejccoI1Nhv2xYgS2f8RUT3NHGro/ntcko/pVkA2XrSjO7Fey7D9lnAfmZap
	4vDjxXdNAJuDy/64RZ0UuK/1qTYkAXJs0rCk27mYj7FKOBsMGUf0BdxO5r+d01LkDq3L65qtfWF
	SL3GaeYDJpMdEPpzezI6D+h9fPObAQfyIz0b0cL6sT+1pTGfDewgs63Q7KRH8RawjA1lKiIXQc2
	H9Q8Glo+rivFmnajJ6s/X7p59B/GJBQ4frDXtuts0DhYKof+m4aImUQRORUpYKL/GOEPn/y4vEc
	g4e2sqT+X2tt0Gf89J3QRqcwfypcjRlApZ0kpCzgocCeG1P0QegY/+9Yjj3+TwT8LvgLyHYJh0O
	03VSmjY8QzWVBtB4Oxx1au3yLcvLrm0uNCpDuqQXcPLv/zjPvcLypEqG08nF6gp4+OdbK0I1uZr
	inMDwJM
X-Received: by 2002:a17:90b:55cf:b0:396:b918:c2a with SMTP id 98e67ed59e1d1-39b261b1a52mr30338457a91.12.1788709770473;
        Sun, 06 Sep 2026 08:49:30 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d38:5c70:7bb9:b8bf:8aa8:fb0d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae610e5b2sm7271765a91.0.2026.09.06.08.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 08:49:29 -0700 (PDT)
From: ThangNN99 <ngocthang2710.1999@gmail.com>
To: Viacheslav Dubeyko <slava@dubeyko.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Yangtao Li <frank.li@vivo.com>
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ThangNN99 <ngocthang2710.1999@gmail.com>,
	syzbot+f8ce6c197125ab9d72ce@syzkaller.appspotmail.com
Subject: [PATCH] hfsplus: fix recursive tree_lock in hfsplus_file_extend()
Date: Sun,  6 Sep 2026 22:49:24 +0700
Message-ID: <20260906154924.94160-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hfs_bmap_reserve() calls hfsplus_file_extend() on tree->inode with
tree->tree_lock already held.  When the tree is the extents overflow
B-tree and its own fork already claims more blocks than its eight
fork extents describe, hfsplus_file_extend() calls
hfsplus_ext_read_extent() -> hfs_find_init() on that same tree,
taking tree_lock a second time (lockdep: "possible recursive locking
... &tree->tree_lock/1").

Per the HFS+ format the extents overflow file is fully described by
its eight fork extents, so this state only arises from a corrupted
image. hfsplus_get_block() already refuses it for lookups; do the
same when growing the file.

Reported-by: syzbot+f8ce6c197125ab9d72ce@syzkaller.appspotmail.com
Signed-off-by: ThangNN99 <ngocthang2710.1999@gmail.com>
---
 fs/hfsplus/extents.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/fs/hfsplus/extents.c b/fs/hfsplus/extents.c
index eb7c11524d18..39920b51e08b 100644
--- a/fs/hfsplus/extents.c
+++ b/fs/hfsplus/extents.c
@@ -458,6 +458,15 @@ int hfsplus_file_extend(struct inode *inode, bool zeroout)
 	if (hip->alloc_blocks == hip->first_blocks)
 		goal = hfsplus_ext_lastblock(hip->first_extents);
 	else {
+		/*
+		 * The extents overflow file can't have overflow extents of
+		 * its own; growing it here would re-enter hfs_find_init()
+		 * on the extents tree, whose tree_lock is already held.
+		 */
+		if (inode->i_ino == HFSPLUS_EXT_CNID) {
+			res = -EIO;
+			goto out;
+		}
 		res = hfsplus_ext_read_extent(inode, hip->alloc_blocks);
 		if (res)
 			goto out;
-- 
2.43.0

