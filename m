Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11E34F5E12
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791892670; cv=none; b=jO6N+1s9/bcHtkvbkxg9zCXHSLYqmTs7K09LIyKVO8rhBm3erUqgeRMhHAuXq5OPR5IemJezohJJQFVMSn6L4kdIs9DJnEw3dbEfTSIjJgrlyVe9XW6IyfVuXmu7DfYA/QCX1zXHZiz3rwlHPnhc8isCHb3TYE1LBzts23Tdwk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791892670; c=relaxed/simple;
	bh=8JEK3nFFuWAo73nZCyEpAFYLOsq38He+mRLnp8sTDkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B3KXNnP9rCahjqsdByVJiYNqAzxg9T3afHRX3gAjqS6eDfZAXJdI/sClFtGOD/KJpTAQpTbnGNiTEN3ERSusx6thMGF2ppX//Smrviz1ZIjVxHtGjPdBUVw9lUQGQxB/G0VLDlr3hAN6j0DbuhYHBlfRZL8VrqFmZoGp414fuOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iLDzqmOc; arc=none smtp.client-ip=74.125.227.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iLDzqmOc"
Received: by mail-pj2-f4.google.com with SMTP id 98e67ed59e1d1-3a84a12aa97so684192a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 04:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791892668; x=1792497468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VMm5uZ7y0LHSAzCvhw/clyRGWUnnU0F0YFC56Cetspk=;
        b=iLDzqmOcDeaaGo2VNiVQRnSC4zy5HOx0i+yua9cD8RLMD4SpxYR5jcUcdXBjGDh2jR
         c3xnSXxyw9d8NMg1jJgTAfBnpHvx4EI92upQyqr4tHQLMM6lFXgcYMrreBITXyUImOex
         jfdmQTnoqrj0C1P6TZ5Ig7pZIij8uqM1i/rSYVOzhWabFKlglkH2ijkQ0uJ7HkUwcZo0
         TSQQbb++CyZmxD/7t/DhtewVmEpxt2hWR2f3JBUBnR6Wqtu9zKftbUX+50ufLH3NWorY
         N27rH3Q4Aj+A2ekgOCGRsFV0e281D+RmOKojPrrbrqmporAGpKlpQhDqfHOh/ZgtFfcu
         Fsbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791892668; x=1792497468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VMm5uZ7y0LHSAzCvhw/clyRGWUnnU0F0YFC56Cetspk=;
        b=x+r8sEUgv8g3LOsXq2odOiq9bJkDWzdnYpD6QSzZg5BArI4iIuF6+PEvdWVIv60CZU
         Uxb8OltB6Nyg04NUVGc95tpoYNnd/klS6Q/8w+LctH85Soh1Df6vsshCj9jluUW4Ulph
         Qgiq1ayWPLmf83G2E95Ih4HvQQfRqWgzV5ilz7KldO9jmmbH4Kx7gnp2CeBXjvuNqQs9
         sWZ57cl5ujyOEFZ7VmExBUXxUBy6zdb+dbKNF33NifbHa0WszIAv3a74Or5Hc6QhgZhK
         MtdCMse5LP+xcPMamYwuFa0qkZKZH5WwaKqZgE+ED7S8yp93ct0hSZgeCfLWqHavd1Tm
         alIA==
X-Forwarded-Encrypted: i=1; AKwUvBwpGyJBb1rh10bPO3GVOIiEuvXh6/Q8X0Jz7k3yQC55bFOuMin/Ab7FOWksVBvUe4DAOkImH6G2arfUg98=@vger.kernel.org
X-Gm-Message-State: AFq9FYLi9dLuYUluyqJ6zOCMyYgPsn4sJr05BBKm7K1SRP3cMEl+b5Eu
	0WiTCGR0Lrztch7u1/C/5V+H/IFo2TVFEI4QcnWMWLd+QMQjIl5qFrWS
X-Gm-Gg: AYBFou0RDvProcLTenXkqSLdQBCF+SYpxAF9WKx+XAdaNIfxUcyMCNPVT9PUfG8C6Y8
	cg97GCriDEx2lWId1pAFsTyefL58yTXGLg5bQOGvxMtOMtkekXbFFqY4mokpWCp6i4MK/xXPDul
	XYC6dhRMpeC2ts8y3SeWxDAVtlQUdv/0KWrj+yptuh5sl47xyD4x5YXcK+rrmBzWck/50/6GSLe
	Xjx5PIwr753cz+CjsE5GTTU6M0OU8sig+0eyvGSneDn0WuebTkVxM8w23hkPMtHktx40MfCCvHv
	kokSox98wI0D2RyThBvUwAzialDMq6LohVdZDGfZqeoU8tXMpJrJRFJG80QxVOJl1TG9AbndQQ7
	FlrW8E51s99F2qbKMfIOYgFGe5p3sckO3jI67jbq2YgNJ5r+/gMlZz8UXXx5JiayZJMUKs2dFwI
	vKfhJoPH+QbSAzw0rsA3t/3QoyHedSQT8WA4MGQiMDnETbfchPqX/6v9PIhfx5XwcdpFEWd7AEg
	pv++RoLiiuaXDoDm7dRB7i1i9aufuxJbtdA
X-Received: by 2002:a17:90b:3912:b0:3a7:f64f:6473 with SMTP id 98e67ed59e1d1-3ab3ac6e6camr10026572a91.50.1791892668362;
        Tue, 13 Oct 2026 04:57:48 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab37139b59sm21248516a91.13.2026.10.13.04.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 04:57:47 -0700 (PDT)
From: Nanzhe Zhao <nzzhao.sigma@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: Barry Song <baohua@kernel.org>,
	Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
	Juan Yescas <jyescas@google.com>,
	Daeho Jeong <daehojeong@google.com>,
	Dev Jain <Dev.Jain@arm.com>,
	David Hildenbrand <David.Hildenbrand@arm.com>,
	linux-kernel@vger.kernel.org,
	Bo Zhang <zhangbo56@xiaomi.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Nanzhe Zhao <nzzhao@126.com>,
	Pengfei Li <lipengfei28@xiaomi.com>,
	Ryan Roberts <Ryan.Roberts@arm.com>
Subject: [PATCH v4 16/18] f2fs: handle block cloning within the same large folio
Date: Tue, 13 Oct 2026 19:56:19 +0800
Message-ID: <20261013115621.968742-17-nzzhao.sigma@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013115621.968742-1-nzzhao.sigma@gmail.com>
References: <20261013115621.968742-1-nzzhao.sigma@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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
index 69d1344a5..3c90cd365 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1608,25 +1608,70 @@ static int __clone_blkaddrs(struct inode *src_inode, struct inode *dst_inode,
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

