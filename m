Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97AA3AFD15
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790767296; cv=none; b=mbCIIzLPdVASAB18+AhX5kObbI0TLqTLe2y+qhhTLxLzJYlf6m27OBGqGvumUHpJcah9Lj80pEbYB6EEx4n9/QoWP1JSfJWej/6JvUY/2IkAWfMnNyoqb7Gfbm2TUSx2TZRpuzfMPMBGS6w2JzF6++CcrgbF7rhsTQSXODS69U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790767296; c=relaxed/simple;
	bh=FD1pr5DrizgzuENw1wnmYGy0dP08nL9ePVrSwgEhIos=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EVfqy5/oW5eWmXW7R9XoQPJ9bBw2lFpGoAVjRLCR2d9hrJmXk4v5P3IWWNoAynf1i4dRQT7Cex6aR+oDBtB56AgbHCPwSNzpcuG8s+O8ODFFbghNgvbuAVUGdeMtfrYxXv53+llGb0pRI1pqGKiTRd9COZZVzu9EyXmvM3pr8S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=noV4VyuV; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="noV4VyuV"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396cccbba91so2473153a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790767294; x=1791372094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PfoRY3WgOFVsoBc2PGlUbg76fc6RUwYrOcpdYt4Z5U4=;
        b=noV4VyuVT4lXfAMkRB3s9jGHAD2njOEP45iw3jl9P8wOdSxQaqkaGBMY/uzPSbSwfn
         5gPvCBleSEyaM7ZmhdPH/TeDTkuIx3EFJapTuOn2yT+VOMH4hKJmNIEb5S5Df3RmPlgt
         Mzkoe8T/lx2dpPzYI8FvMbcSEw1Nqdsng/cRo+apmuQSKOjAkPyPoRjxSovsjVuL+lxa
         FYpebqbBtHzLBnck7d+8BLIn9ZZzd0HB+ATqAfOBAhUiGcEfkgXH2OJnUSTQxKayCqrE
         KshX/mykshHzEVu/J1rhRKOu9qTakxMW82/Z41lyH03hb/gE1WWtKUM8LcSRds6FpkgW
         fqwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790767294; x=1791372094;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PfoRY3WgOFVsoBc2PGlUbg76fc6RUwYrOcpdYt4Z5U4=;
        b=UVzIH3vowXzXzJA9Wx3kZpjKoa3FoWgTSJ1qT/5rDcpeP/9hHcY8qrScpiBpM08+ne
         s1Jkz3k7mkVuhOj9+/07pGUz2AoFesWSn8rMGIQ6zdUxznSm/gzh/i+hXEJTz8uQct52
         +3/GXC0DD77uWgeIX3rvhxpjwgLBc/N9OOC73se9S1XE0UAWKWTRO0DAJ8rzSYScyHiX
         nx6BP8I8//RyGrmf6OAukOUBvLMe2p9oxwTCDFibeixONv0uZdrKS1VL1XSvMBIWvu4f
         +Nwesdt2gbAe9YowUk07v7J/Pw5ftTHYVzKDbMZ3XCe+9P+OsB5vKf4J/VKKb9p21E6G
         8Guw==
X-Forwarded-Encrypted: i=1; AKwUvBxX33C9gFRBLpEBIBzHdmjz7AcE26wS3nYD5stq5dkZ8MO6hetl/66DU28DHDHCWyO/tp0hntfJxssh4bk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDfsh+Z19/nlJPutUhedi2g9QDHeE93gL9+jIFS9v8k2yXKl2O
	Svb417qkFBxkMRgmdJ91Fq3iNGUd3G02DAv4MeXNWN/WtXmhp4OfxSlu
X-Gm-Gg: AYBFou0XVIbMIUEVYwTHc4o2ejZ6rJBYJ8J8eFT0Y2atWnCorWMLrw5sib+CY5QrFcO
	Q6/9kkUgTKLyDmLQ0ZG7YsE8v9J7Mg7XrPariprpcXTQBkml5/3BmXZlWhTglgtdAnG6JZPvWPM
	iZzcauB0vutX2XmwYUwTNz00kNatL3O0VHWelORzkatwSwsSYx4b6sYb9UgRqy5jhMlwbwF4YTN
	d+8T1TFW/x1ta6wZeX+mCFy/wUwYmnUlhYXLdWto5UjNHlGJMT9xL6QbB1NqBS5rXiHBapbvLCT
	DliqNNHldSwTdmk4fIT5SUdFsRa2ZP9y374GXLLtmBBCZ8olMGOiNMOtchKH0bofniJQ0nww6lO
	+hc7p0UiHRpgaRkdCroKdotU0lDGrVZ5fykbvrleGC2eRi1fkVMkGZcoEZwex0faBZ0ghznnPi+
	izpd98upm4v9sFmSRdmX8U62UVuPWk9mOYog3rQvKMZw==
X-Received: by 2002:a17:90b:4d81:b0:3a0:22bd:6ee5 with SMTP id 98e67ed59e1d1-3a4d1509bafmr977540a91.14.1790767294158;
        Wed, 30 Sep 2026 04:21:34 -0700 (PDT)
Received: from linux.. ([2409:8a2b:a18:4ab0:713c:5fa2:817b:4330])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4cac0d4fesm3170316a91.10.2026.09.30.04.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 04:21:33 -0700 (PDT)
From: Binglei Wang <l3b2w1@gmail.com>
X-Google-Original-From: Binglei Wang
To: xiang@kernel.org,
	chao@kernel.org,
	linux-kernel@vger.kernel.org
Cc: zbestahu@gmail.com,
	jefflexu@linux.alibaba.com,
	dhavale@google.com,
	hongbohbli@tencent.com,
	guochunhai@vivo.com,
	liubo03@inspur.com,
	linux-erofs@lists.ozlabs.org,
	l3b2w1@gmail.com
Subject: [PATCH] erofs: fix folio reuse from a different address_space in erofs_bread()
Date: Wed, 30 Sep 2026 19:21:27 +0800
Message-ID: <20260930112127.27059-1-l3b2w1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Binglei Wang <l3b2w1@gmail.com>

erofs_bread() reuses a cached folio on page index match without checking folio->mapping.

xattr.c calls erofs_init_metabuf() twice on the same buffer without erofs_put_metabuf();
the two in_metabox sources differ, so buf->mapping can switch
while buf->page still belongs to the old address_space.
The next erofs_bread() then reads the wrong mapping, dropping shared xattrs with METABOX.

We require folio->mapping == buf->mapping in the reuse check;
otherwise drop the cached folio and re-read via the slow path.

Fixes: 414091322c63 ("erofs: implement metadata compression")
Cc: Bo Liu (OpenAnolis) <liubo03@inspur.com>
Signed-off-by: Binglei Wang <l3b2w1@gmail.com>
---
 fs/erofs/data.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/fs/erofs/data.c b/fs/erofs/data.c
index be63b89f0862..d8b6523bc218 100644
--- a/fs/erofs/data.c
+++ b/fs/erofs/data.c
@@ -33,8 +33,13 @@ void *erofs_bread(struct erofs_buf *buf, erofs_off_t offset, bool need_kmap)
 	if (buf->page) {
 		folio = page_folio(buf->page);
-		if (folio_file_page(folio, index) != buf->page)
+		if (folio->mapping != buf->mapping) {
+			/* the cached folio belongs to another address_space */
+			erofs_put_metabuf(buf);
+			folio = NULL;
+		} else if (folio_file_page(folio, index) != buf->page) {
 			erofs_unmap_metabuf(buf);
+		}
 	}
 	if (!folio || !folio_contains(folio, index)) {
 		erofs_put_metabuf(buf);
--
2.43.0

