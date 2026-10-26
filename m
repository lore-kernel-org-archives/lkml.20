Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792985934;
	b=z+0lK5gtrz4/1DucEL5YYpr3TthGXwMZ00BsVmtZYjl0bLJ0NNIDvEtIfyDMCyMFqysa
	 FRKzti7lk/k118qle375csOTgLgXgKWr72vw0/PLAaXfAPmKu7RKLfWkqLJfDyMB6R3Vy
	 s990VibTlMR9EjcpaH/hT+wTj0MtS3kB1qthBTBEwU5VYwuNh/y5xpK9qxYR7J0N0OJUW
	 4fnOxN1q/ZPbVGw8on3pRLF8SSXhF9nVUZV24cQsBgAir9yPwunYk/tCRab3NbCs5H8gc
	 sGPqVOD7LESxIubj5fbRfr3kRuwRpyM+W/Xsrem72tZM6XyXRrPzJwS0k20g7ktCudA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792985934;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VwZz7glalGGPHoe9I+P1yNjh3ZtSHRE0EqtBFVnEPsk=;
	b=b2Qq3m9BYVV1nomJH8+Jj9UQgjr11AniMcC6ngrsCSp9MlkixwoSHkIFoKI9xbtXeCio
	 bGTjoW2J6bUBGh17Mn0wrYe2Qqz+y68+ra9dF+U2GJIRRVh904S8hEE/KtO6TSg2acOoq
	 +dniYC8p+YmkRIABXaNYv/I1bn2EJXho7W21XLuEc2T0DyFDa64W+nwq49zgRym5yW8Bs
	 YDGaCLkZqfZ2KP7jJQBet3NaiZdVVkFmIWhfX6vF2G3IZHmycvmmfs+EHTEaRgyPKs5Qf
	 /oGBgmmzD3rpfhlwDBdj+ZJWeMVyWDf9IWX7Ni8YZtbPqQV0RYSTeTxJeJTT+uABdpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gOdaVdql;
	arc=none smtp.remote-ip=74.125.227.134
Received: from mail-pj2-f6.google.com (mail-pj2-f6.google.com [74.125.227.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988F8606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:38:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 988F8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gOdaVdql
Received: by mail-pj2-f6.google.com with SMTP id 98e67ed59e1d1-3acc610014eso1335328a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 20:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792985933; x=1793590733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VwZz7glalGGPHoe9I+P1yNjh3ZtSHRE0EqtBFVnEPsk=;
        b=gOdaVdqlxC2LNK0s56cbtj+XDOJDNMzq8AwJR8sXacR/W1USSbUZ8RaZ0jROiN+IqO
         u84ciVdIScmqWxXZUTx6FJBhVZZiDUedwQLyBN+p90VzGCkYqXrKL1Enp3wzjZnFSNbK
         dJxOhc/jHM1pP5WOFJfmBeUmU/QKi3dk1RONzHRvkgNISCRbXV2RSANiXGEPeiWpcStd
         QWKUr/tCavM+9rU6ZNKqeJnpLZI0quCvrNN3LbBHgUGQAmMKL6cn5mJuLVNCNdh8pjNH
         44KkL5H21g6YtF7tMHDCDJqxQRRqYVE9QxaCd3J/XRosAp5vHC6UmIqeXaozPY7xU5Bj
         SYlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792985933; x=1793590733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VwZz7glalGGPHoe9I+P1yNjh3ZtSHRE0EqtBFVnEPsk=;
        b=Tbb3rU/h1hnOAOcbdWk1rp+miOebOujlA2VyvzVIzlTATNPbFQ1xr4ut8oXKpIy1mR
         7L3UA8xPw6hp977jBbQ7xQWeoUV4oddcwVlPwj+WlvILLN3Pn27C94yqD0pwLAwpN14a
         s6HJCaBI9vFVItmNJO3fCTuRnUTkBCb3vWx2hoGgqZ+kCKQXJXLDY7fijk9Jfo8fx56F
         ALNdfYzkH2aFouxVxi75q3mH07A/byD26fggoTN7EhHfaGLnE/vu9fbaG6IQMK+BghYU
         5QyjbmiLdbzbuRDc8YmueFunbHVyOXPBerymq3NDcz3h8vupFn5gtGTAFvfqam+9aVwo
         5HXA==
X-Forwarded-Encrypted: i=1; AKwUvBx9eQmlcUxAY4H+Di8l5GrSP1hsDRl7CHS5dTq1tDi16GjEuPK7C1bDI+aBQg3Szi/Uq2JbmWUud9pc5AQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKHiZ6toYgWApffAfppZJ+T5qEFyJka4UFtbR8iNnWQiateZVAE
	W78Gbbk2BBQeNNVLvCaLB2pk7adjSL7kSTpkeiXeTKxgos2Y7hooem4F
X-Gm-Gg: AYBFou2IjEYw5AJXOgnbbGSjMeujCG+QvaVvJrG+Wcnn4RrwQgHEjBUpawP2wKXGNQy
	QRxxCCn47FNVVXn9ZwcLSzS383e61IYw4QxITXBgKsp+dQtY88N/q4tgiNdRD5TRkPTh9P8leCU
	RNhgUegFgAWHmB27A76psL+N3maaFHFBhE0hGqdffPQBMqhX1xoKEcqq85yl/S/L32Y4fsEuZBn
	0UkiuoKd1jAPCZ1Wm2CHOjdhmrkbC1XJgip9JDfOlL+dWnReT41PQdGVAR/ECCOocXtcnntkckf
	3Pk2MzDYSzP/57vHPUrQrD5JqYarQ24ziOn6FRVwTJXotwFeQoX396i2KsA4MJjdCiQlbVrDB5o
	7nGfHaQXgx7W8yGQYfdshLPDPtwa4sNAvKISCC4Qiy0vqlKE1UWrC9M6njvC75KQJ05ZNZHmy64
	cO7esFyZvKmshWQ4pHfN6ZU8JKscEG9re26wrJj5Q8JgFp3l5vt06LdJMG5Zgt48kZUGBe2aizG
	8K1c+j9UhuLnppPoNQDMzO1JIDJDAW5jaEaVdxl2aAW71tqFr6vqWMU/TgKNBacj5w3MJ9MU9Th
	OCE5HXl1rM+Med7Hww==
X-Received: by 2002:a17:90a:fc48:b0:3ad:50a2:9abf with SMTP id 98e67ed59e1d1-3adeae88e5bmr4982306a91.38.1792985932904;
        Sun, 25 Oct 2026 20:38:52 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebe8f0b2sm6409823a91.8.2026.10.25.20.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 20:38:52 -0700 (PDT)
From: Nanzhe Zhao <nzzhao.sigma@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: Barry Song <baohua@kernel.org>,
	Juan Yescas <jyescas@google.com>,
	Daeho Jeong <daehojeong@google.com>,
	Pengfei Li <lipengfei28@xiaomi.com>,
	Dev Jain <Dev.Jain@arm.com>,
	David Hildenbrand <David.Hildenbrand@arm.com>,
	linux-kernel@vger.kernel.org,
	Bo Zhang <zhangbo56@xiaomi.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Nanzhe Zhao <nzzhao@126.com>,
	Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
	Ryan Roberts <Ryan.Roberts@arm.com>
Subject: [PATCH v7 13/15] f2fs: handle block cloning within the same large folio
Date: Mon, 26 Oct 2026 11:37:43 +0800
Message-ID: <20261026033745.784107-14-nzzhao.sigma@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026033745.784107-1-nzzhao.sigma@gmail.com>
References: <20261026033745.784107-1-nzzhao.sigma@gmail.com>
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

From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>

With large folios, the source and destination block in __clone_blkaddrs()
can belong to the same folio during same-inode operations such as
collapse range and insert range.

In that case, locking the source folio and then looking up the
destination folio can try to lock the same folio again.  It also copies
from and to offset 0, which is only correct for order-0 folios.

Detect the same-inode, same-folio case before looking up the destination
folio.  Then in this case,we reserve the destination block explicitly.

Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
---
 fs/f2fs/file.c | 61 +++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 53 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 439e84a4aec3..f621d5e65023 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1598,25 +1598,70 @@ static int __clone_blkaddrs(struct inode *src_inode, struct inode *dst_inode,
 			f2fs_put_dnode(&dn);
 		} else {
 			struct folio *fsrc, *fdst;
+			size_t src_off, dst_off;
+			bool same_folio;
 
 			fsrc = f2fs_get_lock_data_folio(src_inode,
 							src + i, true);
 			if (IS_ERR(fsrc))
 				return PTR_ERR(fsrc);
-			fdst = f2fs_get_new_data_folio(dst_inode, NULL, dst + i,
-								true);
-			if (IS_ERR(fdst)) {
-				f2fs_folio_put(fsrc, true);
-				return PTR_ERR(fdst);
+
+			src_off = offset_in_folio(fsrc,
+						(loff_t)(src + i) << PAGE_SHIFT);
+
+			/*
+			 * For same-inode operations (collapse/insert), src and
+			 * dst may fall within the same large folio. Detect this
+			 * to avoid self-deadlock on folio lock.
+			 */
+			same_folio = src_inode == dst_inode &&
+				     folio_contains(fsrc, dst + i);
+			if (same_folio) {
+				struct dnode_of_data dn;
+
+				/* Reserve block for dst before copying */
+				set_new_dnode(&dn, dst_inode, NULL, NULL, 0);
+				ret = f2fs_reserve_block(&dn, dst + i);
+				if (ret) {
+					f2fs_folio_put(fsrc, true);
+					return ret;
+				}
+				fdst = fsrc;
+			} else {
+				fdst = f2fs_get_new_data_folio(dst_inode, NULL,
+							      dst + i, true);
+				if (IS_ERR(fdst)) {
+					f2fs_folio_put(fsrc, true);
+					return PTR_ERR(fdst);
+				}
 			}
 
+			dst_off = offset_in_folio(fdst,
+					(loff_t)(dst + i) << PAGE_SHIFT);
 			f2fs_folio_wait_writeback(fdst, true, true);
-
-			memcpy_folio(fdst, 0, fsrc, 0, PAGE_SIZE);
+			memcpy_folio(fdst, dst_off, fsrc, src_off,
+				    PAGE_SIZE);
+			if (folio_test_large(fdst)) {
+				if (!f2fs_ffs_find_or_alloc(fdst)) {
+					f2fs_folio_put(fdst, true);
+					if (!same_folio)
+						f2fs_folio_put(fsrc, true);
+					return -ENOMEM;
+				}
+				f2fs_ffs_mark_subrange_uptodate(fdst,
+							dst_off, PAGE_SIZE);
+				f2fs_ffs_mark_subrange_dirty(fdst, dst_off,
+							    PAGE_SIZE);
+			}
 			folio_mark_dirty(fdst);
+			if (same_folio && i_size_read(dst_inode) <
+			    ((loff_t)(dst + i + 1) << PAGE_SHIFT))
+				f2fs_i_size_write(dst_inode,
+					((loff_t)(dst + i + 1) << PAGE_SHIFT));
 			folio_set_f2fs_gcing(fdst);
 			f2fs_folio_put(fdst, true);
-			f2fs_folio_put(fsrc, true);
+			if (!same_folio)
+				f2fs_folio_put(fsrc, true);
 
 			ret = f2fs_truncate_hole(src_inode,
 						src + i, src + i + 1);
-- 
2.43.0

