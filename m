Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792712177;
	b=fTMVwp5PY+v0fNJJoC8CnSIFjj6UJLBGUa5Tsq459OMOrCKjWscPBWncR3Yu61yEL0H5
	 TIDjOyV0XFkkb4VvL5Q2l6V0e0ygnc6/CFKmRg211f6x+uyftixGTqbzAbZlg/FmzXExC
	 j3FrAi2Xp6u3MmAS4wMR7dFJzQt6YeoFTByUfxGuHurxJLSEfVTSZ8VgW8XltrV2c1rr0
	 H11ChS2/Q/E3wEbDBVbzdaCJNJe5vDbJZQXGoI75HBUGzu4ZRhZbj8baTRcaQuL45eDwX
	 Dd/7GD3BZRqBsLZ7c2IxTrgsZooVl6gS9fKre8G5CzRxn0qyEsxtJV/0clIJCKhSnvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792712177;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mKGa7EehFPI4Q1/tqBU4Iltp3oRRK/Y5Z/6eWwvfEFI=;
	b=tsBuiOnbhz98qcE1PY2gBbmQHMW0Iic3AIENClK3I4OAIf7TJCZFn75Q5UiaJsIxwcWn
	 PorHLXVNuxUningCS3dG7Wxnm2RcekeKm/n73JTGS5WOSEbMziOTd4GFF6lsEdAxZpDqb
	 oWm/1iNom+TXsbBBPrXJN/JU8p5bXQZvGwlE0h/BqMtRWWDQQP7waOucDgr8kqZ2bgQer
	 0LE2toDv1YgLU3apE35qdWu1vA0+nNKazDn1XxdogHQ8Xt+JEscdeAvwtLYjVFabQ/tGT
	 XrInnzjcjkmCrqx68tnevhtuGkjKWdos+/xIhtR8/OFASNwyga684+wUKPMAOIquIcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dubeyko.com;
	spf=pass smtp.mailfrom=dubeyko.com;
	dkim=pass header.d=dubeyko-com.20251104.gappssmtp.com header.i=@dubeyko-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=qUVTWYcx;
	arc=none smtp.remote-ip=74.125.224.42
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425F0606A742
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 23:36:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 425F0606A742
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dubeyko-com.20251104.gappssmtp.com header.i=@dubeyko-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=qUVTWYcx
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-677bc4704cbso430069d50.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20251104.gappssmtp.com; s=20251104; t=1792712176; x=1793316976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mKGa7EehFPI4Q1/tqBU4Iltp3oRRK/Y5Z/6eWwvfEFI=;
        b=qUVTWYcxvTzrDYcWGY2zqQZwec2KmCjicr9AISCQtrcbw2rmhthhyGlTplb6CpijjB
         TsH3Sy1EENLm/DCNHxw3egtVaOIZz+gltsWtutUp5yXJ+pjuMIMB8o2SuxOqbFpMoLDU
         e1eyi9sPujbV10zlmJHn32xltCkZJEGslZxfsQ3ceWKXOrhb6FMnX1ybAJIXeONKqDtn
         DZhphrzNUm+VRNAfGcTIMDSV/MLSP5zXcasDvf+9kqhJ1bJZVo+9OcXUyxh8CKjeM+mZ
         cBvpTgScq7MITEr+zKkmv0250Ik6SbKvvmlF27egVdWDPqXT+eErRo4VNMyDUstIt0kl
         WtWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792712176; x=1793316976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mKGa7EehFPI4Q1/tqBU4Iltp3oRRK/Y5Z/6eWwvfEFI=;
        b=ROKXaZ3vA11LkLuZMAwEib80ya2F/Y9orGEXpi6pLci0nXAbYr/D5DAUNyWFBDXbb/
         UdE/L1xhNEXjiNdCFfwHNZhBWTNarH7AJ4TzE05n43Nsv3xjv2FYVHJq2NQMJqc838vH
         AaNMb2QZbhLXF6ZONWVLn9QrZyEY5CyOgfdrlc1XYb+YT9gTix7m0m3lHJcHwCAMd15l
         h6uqARR/F6fuQqhnLcbTXy4bBXGmPHPyBTicF+2CsTSXUfRukbEcztZNndLS9qe6fnoP
         zBoFYWz9ZX5l7AW+fSvr/984Om7ebJ3Wcp3pC1JnQnFZCnr20NNPooiNpJJEwXQiq15q
         8iiw==
X-Forwarded-Encrypted: i=1; AKwUvBxETmIiq+wvPaicNEq9Qp0WIptTWp/zs0hy56WVyrTBh4R2DSD84sIUmqjPGMG/1jD3d6j3FPqRplG69DA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLkCedvtuyn87cWZmRw1a2CnpmKL0PAXbyRA6ix4BweFmnrcQax
	5A6j5bFtvcwWZZP01Z5WjcbNJMDod6FpItN9R/1AHoW7Om/shMP3k2PMI1XBVjQwt+ZZghB2lW2
	GRIxpUks=
X-Gm-Gg: AYBFou0Abxjv0apZEU2k3zTc8WgNVJSEnrM6Gbndwe5b+Yvtv08lmysHb47jvGVKzDf
	d93LkhilF8E2UbRJXDnUytg9G/6aZOPxCyOTpkV/HrFM8Dp+ZnmiwyFfXsOePBJP7ftXnWhOvyU
	uPg+e+PN1UvEZyr4pMCWFaVdwmsGJV9Uqv+Q09VVOrcO+aPYYwf4UnY59Ly7Q6fKiH3yUfEeSeg
	WtTXQP4ZrD+r3gPtjtoxxkyOu5FRw6L1OE2FK4KSBsvXhthzuImuen6Vd5P/mCEGM2Z7pjKzG7j
	ChZYJBUG5DyM+xf9Q+BO0TH39wgeRGQUEAfYSVEJ+bLoZ4B12/yqH5ElozcofJmXD+WjkMv8/zT
	VjZJUIpw6DgIhsl6ncj+RqvqCL6pWMP+JDHzB6p3pg3V0TUV0/Quw/ED8TXxo7q3g0ag/xL1C/Z
	+95UcL1HSYGTwAti4V6wMSriaJzv4nyXKk6rNvFub4DFMBFcYTmu52BtObeVB5jwAfaKTj58IWq
	R1zOGbwirwF1xJjBLouS8b0rpX6kBuFDBAC3nuj4t4nO+6QvBQR9oRdaBpZhURtonBh7mXP1/5A
	e7gbmoV+l29UZaE5nVZT6Y2CqcikRIz+D7hmXsyk66sWwLLuXNWOFQ7I+yo7H0djgG2qWei/LOe
	NXQeXm06PRw==
X-Received: by 2002:a05:690e:12c3:b0:679:9a92:5d70 with SMTP id 956f58d0204a3-67a359e6e12mr301041d50.13.1792712176201;
        Thu, 22 Oct 2026 16:36:16 -0700 (PDT)
Received: from pop-os.attlocal.net ([2600:1700:6476:1430:5551:17ca:f374:dc57])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a34009247sm487643d50.11.2026.10.22.16.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 16:36:15 -0700 (PDT)
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: glaubitz@physik.fu-berlin.de,
	frank.li@vivo.com
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vdubeyko@coreweave.com,
	Viacheslav Dubeyko <slava@dubeyko.com>
Subject: [PATCH] hfs: fix logic of alloc/free b-tree node
Date: Thu, 22 Oct 2026 16:35:46 -0700
Message-ID: <20261022233548.3481882-1-slava@dubeyko.com>
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

The hfs_bmap_alloc() and hfs_bmap_free() modify
the b-tree's counters and nodes' bitmap of b-tree.
However, hfs_btree_write() synchronizes the state of
in-core b-tree's counters and node's bitmap with
b-tree's descriptor in header node. Postponing this
synchronization could result in inconsistent state of
file system volume. Add calling of hfs_btree_write()
in hfs_bmap_alloc() and hfs_bmap_free() methods.

HFS port of the HFS+ commit:
commit 63584d76765b ("hfsplus: fix logic of alloc/free b-tree node").

Signed-off-by: Viacheslav Dubeyko <slava@dubeyko.com>
cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: Yangtao Li <frank.li@vivo.com>
cc: linux-fsdevel@vger.kernel.org
---
 fs/hfs/btree.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/hfs/btree.c b/fs/hfs/btree.c
index b140d8597474..27a515a3dd0c 100644
--- a/fs/hfs/btree.c
+++ b/fs/hfs/btree.c
@@ -458,6 +458,7 @@ struct hfs_bnode *hfs_bmap_alloc(struct hfs_btree *tree)
 						set_page_dirty(page);
 						kunmap_local(data);
 						tree->free_nodes--;
+						hfs_btree_write(tree);
 						mark_inode_dirty(tree->inode);
 						hfs_bnode_put(node);
 						return hfs_bnode_create(tree, idx);
@@ -478,6 +479,7 @@ struct hfs_bnode *hfs_bmap_alloc(struct hfs_btree *tree)
 		if (!nidx) {
 			printk(KERN_DEBUG "create new bmap node...\n");
 			next_node = hfs_bmap_new_bmap(node, idx);
+			hfs_btree_write(tree);
 		} else
 			next_node = hfs_bnode_find(tree, nidx);
 		hfs_bnode_put(node);
@@ -545,6 +547,7 @@ void hfs_bmap_free(struct hfs_bnode *node)
 			nidx, node->type);
 	} else {
 		tree->free_nodes++;
+		hfs_btree_write(tree);
 		mark_inode_dirty(tree->inode);
 	}
 
-- 
2.43.0

