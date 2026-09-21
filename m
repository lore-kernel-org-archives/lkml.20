Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACAF4570EE
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 17:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790011501; cv=none; b=oaj66+gt7SeVD2Z6H09WnBmKM4TXrRwEAqoUB/9oFhWC6TYaDleUML7njOBBgR6LjuOzBUTHFijpbkSFjTPUfIN/Xy0V02DwcHb8KJiJwRabFBCI43fQ9iCZBfU7EZxQ3Hy+GtC37sKGCDx2G85Q3obZ7tFeZBft+u4CGI64ags=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790011501; c=relaxed/simple;
	bh=NEAbhKq9B35n7+FNn2ULNfgK7+O3WofJ+tpENtrfo9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NAuXVpm9Yb/183fz6HPch8bPHvWyTXdgAGvf4UWHxvULRlY3dGnZx72veHj1kIK5TJ8H6ttfyyfz6QwBkrTW+wMzh7E+ozkzJ6GIygR8lbyTu4Y5zGdd2iP/R54yFDcLCRS6rBUOH21gBEm837I7xZsXqm9dXVXyj6/sxeUsfaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i8oXWm+M; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i8oXWm+M"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4aa0f1766so2556424a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 10:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790011499; x=1790616299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U5YxojVaNbADO1FA9MJ9tqVVm0PhiUslwtmGv+Sh0is=;
        b=i8oXWm+MUQGH4pP2STCyaQF7GRSkXQ3tKv8skIEmO8eQQG2OwpfwTIayEt5IPsw8MF
         sEClDYUpuihHxRcMmi3xf+nyo/4mS0DbeUjgTNIChAZiyoUrRyahztqOTcBwau9UJi36
         o+gM9Qcv1buQ30kLsqQ4C2JXsbedidbECkKDdknVOX1yfi++kyHwgWbXFO8jYET/gVc3
         bqcnX8ABHC2Q/qp0pAr9K+dDxqtik+pbTNZPEtBEruO4s7L6eDdgvHDuSKxMWXhKaGi5
         sejjke/nPv7F9E+SR7qqUkE9/oHAuA2mnu4YPjTMT3Tgj/3lrt6VL9nx5vgLHre3FMz6
         Ic/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790011499; x=1790616299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U5YxojVaNbADO1FA9MJ9tqVVm0PhiUslwtmGv+Sh0is=;
        b=e7Zgq6wSnXl2mQe2MUA/EseD1CXQV+jxAjSeHoOf1R48AqH4dzH38GQTgo3UCF5myV
         MlkS/9f5XSAuNxpd1sZZ547jD1IhyBmT7D8GvJxfI5DIG0b7uD5+bQvfbybmBb4owtDZ
         lCa8yCzwzchlSQHR3fCJPJOBp7WKamo/pMpOYu3MYg/uGJN2sCu9gBTQ4RcUH+cr06yi
         FojCUZnYC+B5u+EmjVAXCO1RCnrDegQ+tojoReWRzhT0i+j0UAMOvmhkUiaMosDgRwHu
         jPoqL5HqkSIc9l+PQSMQf8UgBNzHu5UGwbLMAkL/xKgDK1FHFqVOs0ec6mPM6a+7y5tf
         gt3A==
X-Forwarded-Encrypted: i=1; AKwUvBxXwa3kbgQK6jpGBvrvhPwwi5MuJedpg5JbuoErArW9jSQ0exZ3wTsPW7nSiSnXsQG7B7GFVMHDBZUyVmM=@vger.kernel.org
X-Gm-Message-State: AFuF++l8S0FvcEywzt5A5JmEFa7uerdsFaBIngYDa5+cOMxoCoNAYK2+
	fOAMMmEls93Z7bL89sgNo2aoczT7xdCYv8bH+2n9zBY9/F4dkgJAa8of
X-Gm-Gg: AYBFou0TL4vh8Qyc1KMsB9L0Ywo6wuiky3VCOhMOh8F+Bfj71uo9WPUyj6PcHW+vIPt
	wyBKiB6+tcnBv47sg90IdMy7jQmHXE+7BI16KsL1RYg18GTdpR4kFChbcj44trQBS9U65ZarLl5
	7ZN1UjLzxCGbPQUOjjz1gGg+dITxwkJwoKmsbXIfBzQr8G/jd9XILRsle/mp10a5nGy5juRZLTg
	cvUmrkLG/6scddoriJPLnj4MkqNtC5pNCMSbkLi/VUINb4rwNditeCwCa/ia6RmE8vgPPJ+yrGE
	+5uPW03N1KJiYPn8XOgSbYsdieUZxGOon8DB1KlKD/BVZU6/LDdxBa9axZlATg61HHPLnmRVEBM
	pPG5yATNmwYwnbJGSklN5ecN1Hg1oTopfAp6fkA3di7bc0WTErqeJOByjWZmveKNq+PvTEEBPXc
	dYZvqeQm+0X1xyNFeHipwh4Te0zMhC1q4S0a+daBYxTidDVHwr+1eJwpggoO3jVaguWeg4YSU=
X-Received: by 2002:a05:6a20:438d:b0:3dd:a196:69ea with SMTP id adf61e73a8af0-3dda1967817mr11917831637.69.1790011499166;
        Mon, 21 Sep 2026 10:24:59 -0700 (PDT)
Received: from archlinux ([103.208.68.53])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc749028e5bsm1464399a12.9.2026.09.21.10.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 10:24:58 -0700 (PDT)
From: Adarsh Das <adarshdas950@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	syzbot+3db654d91b471c4d7a7d@syzkaller.appspotmail.com,
	Adarsh Das <adarshdas950@gmail.com>
Subject: [PATCH] ntfs3: sync uptodate with iomap folio state in read_folio
Date: Mon, 21 Sep 2026 22:54:51 +0530
Message-ID: <20260921172451.121701-1-adarshdas950@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <6aab8055.71f81b7d.278072.0016.GAE@google.com>
References: <6aab8055.71f81b7d.278072.0016.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntfs3 registers iomap page-cache helpers for its regular files.  When
the filesystem block size is smaller than the folio size, folios are
backed by iomap_folio_state with a per-block uptodate bitmap in addition
to PG_uptodate.

The i_valid <= vbo early exit in ntfs_read_folio() zeroes folios past
valid data and marks them uptodate with folio_mark_uptodate(), updating
only the folio flag.  That leaves the iomap bitmap out of sync and
ifs_free() WARNs during evict when the folio is torn down.

Use iomap_folio_mark_uptodate() to update both the folio uptodate state
and the iomap uptodate bitmap.

Reported-by: syzbot+3db654d91b471c4d7a7d@syzkaller.appspotmail.com
Link: https://lore.kernel.org/all/6aab8055.71f81b7d.278072.0016.GAE@google.com/
Tested-by: syzbot+3db654d91b471c4d7a7d@syzkaller.appspotmail.com
Assisted-by: LLM
Signed-off-by: Adarsh Das <adarshdas950@gmail.com>
---
 fs/ntfs3/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index 56b4f6469a28..a9b4e288ca20 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -842,7 +842,7 @@ static int ntfs_read_folio(struct file *file, struct folio *folio)
 
 	if (ni->i_valid <= vbo) {
 		folio_zero_range(folio, 0, folio_size(folio));
-		folio_mark_uptodate(folio);
+		iomap_folio_mark_uptodate(folio);
 		folio_unlock(folio);
 		return 0;
 	}
-- 
2.55.0

