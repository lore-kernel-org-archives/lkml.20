Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE81490C02
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 11:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791460400; cv=none; b=gedCMTir7YuIXT8vzEUW+5n9uJtdNvDvhhypxC9xx3oUTJpgd9v/bntCLS2s8BlcJ7RApRP3Nvq1k+ksKxzm+QQ/MQwVAAGYidYSBsAdSmBftJ/iUD4UNDwbCOYttGQeCu6LQH+uO9vqeb78UOHZb0fBDOBw1RUyb+QmxF3shkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791460400; c=relaxed/simple;
	bh=tQLCkYgOuueSsGInQsIpwaB/A1sqQztPCjF/nclrYQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g+VCh5MjJ5UsFk0mhk0QgVvsHL9U+hOGblAkGoWFaIII5irCjZhqO4hMGN9jkpIVGTj8sOgZs++Q+TNwouKRw0/jlQcwrCPLhktfkjY8WZbVT2xr1rOSmQwn5c8PLxmggLd2k+P6PO4m9DgWYv6hAm3KJmHf44XipJvaPVqHsIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dlkujla7; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dlkujla7"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ab066bef7dso285663a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 04:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791460399; x=1792065199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F7V7dLUe1L3c+eHqw7mAqauOhaayuccNQ0JvgXKLVBY=;
        b=Dlkujla76WargE/NtJmu+O/R4BWp2K8h2+UyzHBC69YnMWTlu7RzJ9ECTyRBqMh113
         bAxzUj0OPb2VmjTRqOPraaCYBdEYkyskhOBHRUO0YxXaRrdZtox93iKIFV9SpIDvwvYW
         xqVGCUK6NTMUYWaFH9t1iMZwJkoTRyU8x/hkyY879M/UPT81Yk3eV6ANAPi/InTCKP8V
         6z5MR1vISpBHgkCB0UAO6PLNCti4Tek2UDVr6+qhlJEn1UCbpTx4d9Y3XfWHHP1FRMO3
         HXxz4/OkaX2OttLcr1th7Le1+YVeHountmOzmZ8m3NZ79D0uAungm+s2/mHgIFBQZsSw
         GVng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791460399; x=1792065199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F7V7dLUe1L3c+eHqw7mAqauOhaayuccNQ0JvgXKLVBY=;
        b=X4QEpQkivRI0RkG/EBlTjCtV7IvSmsUThTk60+t2zk3HUqVYA2hpDNBdjPV/fajEYk
         FPN07ySuO4tRkCFD6qluzJVISeWi74Bx+zFxxBShq7C0SEJiwzVjGNEUsxevMyvT1Ua3
         0JqQKi0hKyVJumdUsasywZ90+ukcpVqPH6CEuZBt+ZQh1jBm5jJyfub0CwU1bYzJnKH7
         b/gzPTjYXXJuxq63/g+QOO2Gcv//XX6ETGCnJmSt+FRsFUiDdSn/TCt01HV2ibG7/+MG
         uOrb/ODJvo9uxlmd/kDUr4nG94E8b4C8mrB7dFvkCkhHgiyQwr1iMoCHRzwexovke3sI
         msLA==
X-Forwarded-Encrypted: i=1; AKwUvBxFxxsIMXp2eRxcXL9i6QQo+OV/i/X4PqGQ2GZRhmE8RTFGUUhGWV5zxreXu0KVdsb8wS+eGPm0+dZ3RoM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIVnvwm7Zve74PRQy61cu7cWxETJHgOW92SLlXt9yUBSA2umP7L
	OXntFXPVLnPKo7rcr4cmyBtl6DTaA314lY2Tnicc/diSvaM+pgOVjmkT
X-Gm-Gg: AYBFou1gXtOaDexVBoeM6clr3i+44g+GjyKaL4hzxDUdGsKrgT8Oyq8I581RzcVJogx
	vs9z3LaFt3DKAm5vJ7pomuItzT/h9TNea7Elk2ur8BeiOOitSXq1ZJPqyaS4+7qib4K80F+0X2G
	nV7lLxoZElucyt1HmKJy8PEd6YXt3Ot06T5wLj+MCpmBphI5mO8a3baV9jCjtDcbUQb+talnrO/
	y7I9X7Z6IsmeKjFJ5LOppB3OGXI2fDohrrR0meisNxFkMrOc9F5aZEjCBEkJmEseoky1uddTvfu
	hYjaoTdGGA0oSstvxpZpm3grwuu8QRqV4bY9httvaA6XaDnanyURZkSX5JQmmNfgJSRZrBVJTYM
	DOU9sBwZ9Vtf9RJySBRsMHJyohORp7relRP76Sa8UqPVRZzVv5E/95jD0oWtrf0L0R0vkpdD1d/
	nUTmwDZC5YzHyAG6i03Pcw/RxMi7il7d9xJFmb2p6UBG6bi2DA0X6mhoXYhhOb1/dhqF9YI75DC
	27qayA+bvGNJAEV7HUKNUYGIMvvEnxO/ndKQNipT/ctgp+VmnBb
X-Received: by 2002:a17:90b:3d81:b0:3ab:c6c:51b8 with SMTP id 98e67ed59e1d1-3ab0c6c63dbmr747232a91.57.1791460398841;
        Thu, 08 Oct 2026 04:53:18 -0700 (PDT)
Received: from carrot.taila25129.ts.net (madb688455.ap.nuro.jp. [219.104.132.85])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1c17b63sm4760164a91.12.2026.10.08.04.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 04:53:18 -0700 (PDT)
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
To: Viacheslav Dubeyko <slava@dubeyko.com>
Cc: linux-nilfs <linux-nilfs@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Jake Labelle <southampton.jake.labelle@gmail.com>
Subject: [PATCH 1/2] nilfs2: reject non-regular inodes in dsync recovery
Date: Thu,  8 Oct 2026 20:52:47 +0900
Message-ID: <20261008115312.18482-2-konishi.ryusuke@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261008115312.18482-1-konishi.ryusuke@gmail.com>
References: <20261008115312.18482-1-konishi.ryusuke@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jake Labelle <southampton.jake.labelle@gmail.com>

During roll-forward recovery, nilfs_recover_dsync_blocks() obtains the
inode designated by fi_ino of a dsync log without checking its type.
If a corrupted image designates a special inode (e.g. a device node)
there, the inode's embedded bmap was never initialized:
__nilfs_read_inode() calls nilfs_bmap_read() only for regular files,
directories and symlinks.  The subsequent nilfs_get_block() then
dereferences the uninitialized bmap->b_ops and jumps through it,
crashing the kernel or worse.

Regular files, directories, and symlinks are the only inode types
with data blocks to recover; reject anything else before touching
its block mapping.

[ryusuke: conformed AI tag to guidelines]

Fixes: 0f3e1c7f23f8 ("nilfs2: recovery functions")
Assisted-by: Claude:claude-mythos-5
Signed-off-by: Jake Labelle <southampton.jake.labelle@gmail.com>
Signed-off-by: Ryusuke Konishi <konishi.ryusuke@gmail.com>
---
 fs/nilfs2/recovery.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/fs/nilfs2/recovery.c b/fs/nilfs2/recovery.c
index abe4101f7550..c384325a57d0 100644
--- a/fs/nilfs2/recovery.c
+++ b/fs/nilfs2/recovery.c
@@ -545,6 +545,23 @@ static int nilfs_recover_dsync_blocks(struct the_nilfs *nilfs,
 			goto failed_inode;
 		}
 
+		/*
+		 * Regular files, directories, and symlinks are the only
+		 * inode types with data blocks and an initialized bmap;
+		 * a crafted image can reference some other inode type
+		 * here, whose i_bmap_data was never set up by
+		 * __nilfs_read_inode().
+		 */
+		if (!likely(S_ISREG(inode->i_mode) || S_ISDIR(inode->i_mode) ||
+			    S_ISLNK(inode->i_mode))) {
+			nilfs_warn(sb,
+				   "%s: invalid inode type (ino=%lu, mode=0%o)",
+				   __func__, (unsigned long)rb->ino,
+				   inode->i_mode);
+			err = -EINVAL;
+			goto failed_inode;
+		}
+
 		pos = rb->blkoff << inode->i_blkbits;
 		err = block_write_begin(inode->i_mapping, pos, blocksize,
 					&folio, nilfs_get_block);
-- 
2.53.0

