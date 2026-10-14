Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC2147CA98
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791960382; cv=none; b=GrY1/e7k+h+jTndmuJ1Trz8TOtn9vdFyeyF5s41QhuGE5kIIKVtQ7YXaAbKfwycrUaFEA6Hjxp+y93JK2nmMns+6TlmZQVci+8F4v7pB3UZFq8DDf8OlEi6N6aPVuRaQ7ZufsoB1YAX0bRYqum82923h+qXHTjpxYeCBlkK0o38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791960382; c=relaxed/simple;
	bh=bL1QIOdY4iBbsyehuWmtXTzrJj4iFYZfbHjVqAL/nho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QQp4Qic4EOv5BLyZC2v3B2Z5YGijv5ZMNXLlOzUOG/+AHA7lu6rgINf1eEd6vsLNIZ1OL4lXlz00pvYXzPwDCD7ygBQ+hWsEMJZF8hP7WqR10zbs9/RXtgecK/WuAGUzStNHiJwWrn5Yxnxkmc+UaVbYOcP0aRG+Cp+gh8SwtIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DokydNw3; arc=none smtp.client-ip=74.125.227.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DokydNw3"
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-3ac144119e4so1005737a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791960376; x=1792565176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lGjExfS683CVJLhb5GgAjexS33mn62Ms7AjjoWD0t6Q=;
        b=DokydNw38x8fpXVZF6f/aQWVqLsIQNd7eSJj+jqfZ8OUCLewH7ggHePIgPpKIQAmPp
         BrCOvmMxQcqmqUCvJSIZgPYa4ktwoJCMhN8jpqvMCAPBcCVrUPF5sNXIeVbd6dlLNsgx
         YmJuwfxi67Affv9PjjGq6ECSKQav5XPuyMe3qCtoyE1A76NTUBOeZBFNmhII9QVoDo2X
         bnGItwRoeCxvRC1+3MXFRCbq8JtoxgsSRGuriaBTli2nm6tHGb41gL9KmmmhBKnOz4y6
         +c8YbzGarQ3wAw67LxD0fyQWYidmiY+vfBDg4gm2j/UJ26WkIZC9LOoXl8JyEcYtp1ic
         4PpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791960376; x=1792565176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lGjExfS683CVJLhb5GgAjexS33mn62Ms7AjjoWD0t6Q=;
        b=X7EZqz45i9tLXolASxd//fTaPpU7FhLvNkLog2u1n0OnJo4yjuUrX+gLS06ObiXvBm
         GVYZ8vaNSi0GoAPlbWTkQ0GGXtKRdjQwlLR4QKaSRg8hqi00WwQj1k89PSQ7+U75L1Zh
         z/uzofbjJBHlHtThdym1JZ1kR5tinyfKf+ZiQW9q960XF7JVIrNVlMjjXIxQhG81oD/G
         A2csRVyUzaart05JV5G8w8yR2iN1ZWmnaV+x9fNt7yKBS7soRRR/YFGWi9+wHVTOoPmx
         n+gTibbj+lA7lIA5K+droOhlinY1ZcYTy21P22Sw/n9H9OzjPM+BqJ5AZKHJ688dChY7
         WJdw==
X-Forwarded-Encrypted: i=1; AKwUvBzsd6aNpKzNJahMgpe1ZlEk1a4QQvhvsw+wbh8qNoTSTOb4kudh7LF8Ii0PG87johM4xuXMMK307di+I54=@vger.kernel.org
X-Gm-Message-State: AFq9FYIHRMOZeRXqr8c1UpNEMHJ0LSe6EapHixAX0oc3mkzvVzyNsh2R
	6NpXUTOeaKnGbIFRdPwgj1gHI6zoz+Z+Ukn+jwg0LfT2ZC2fpUiq2xA3
X-Gm-Gg: AYBFou1nxVHWlKHOn/S3B1YQCIdp/WNQDlr9BNrzodyumDevMg3GpVnrB70c3EqKT5d
	oYEAUgZD35qE297JykD9TD+Mf3hXyjBiy+KcJxXoiHYy8dY/nBiQx40LHpNVxmULTmVpe5khobY
	tzsG3yYf6I/f7DJcIIoINfQtsdn3gKOXvJkVWR2U4DC5y2/GqCLtHsmB7pb/RXPecLHH6Fosu7o
	MP4uUtBpH3qHXnvqfCUstK2cHz44JF54RHmIwHEct6KzM0Vclvlb9snIJ6qMj4yNQciLTCWdIpi
	j6C71kbzcs9QhlpfIkEVEgtMCp5UDH1Xp+1adyp0W/orN+aucnurrafVKeuPS4q7rlLC5jd6wo2
	fBNQKeiU7lBe7t2ppFho1SgyFwo7g0QsdJwc8L2wSDGSXBPgoq+YVHQUw6cai4wOyr1hzWpGyhU
	p82wG8aaK3yxl8O28hTUCAOeqPBPgs2gZEejq2oyERdZKXFn4zMgBRU1xn1G1V7Jcz5b2h9MUyX
	o96UzJFYGrVU7z50DDk3bDxMRjh0v2rNjEW
X-Received: by 2002:a17:90b:4d88:b0:3a4:a850:6982 with SMTP id 98e67ed59e1d1-3ab3a7786e4mr13315343a91.26.1791960376536;
        Tue, 13 Oct 2026 23:46:16 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f04e324sm3236371a91.2.2026.10.13.23.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 23:46:16 -0700 (PDT)
From: Nanzhe Zhao <nzzhao.sigma@gmail.com>
X-Google-Original-From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
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
Subject: [PATCH v5 14/16] f2fs: handle block cloning within the same large folio
Date: Wed, 14 Oct 2026 14:44:43 +0800
Message-ID: <20261014064445.2835813-15-zhaonanzhe@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014064445.2835813-1-zhaonanzhe@xiaomi.com>
References: <20261014064445.2835813-1-zhaonanzhe@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
index 5a8dbe228fb1..cad5329bbfd6 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1602,25 +1602,70 @@ static int __clone_blkaddrs(struct inode *src_inode, struct inode *dst_inode,
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

