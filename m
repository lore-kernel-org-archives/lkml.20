Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E7D3D25B2
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 19:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790795986; cv=none; b=P5eOE2E2JPVde4UasrF8/Y6LMj09ZXJt6e7jJ5iyi5SjnxfHpT6rn/tJ5zcMVqgZw9XgX3tOQcYEXvAl/h2FvMHHozoh5+plsAgUL3kLVNsDjsvsxGqy6KIX5Fex0T86DQkAUluM2J4MzPcWJWuSusb8TDh3PtN7Pld3moTUkT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790795986; c=relaxed/simple;
	bh=JSdY6X+FjY8u7s1TvnHWyo5tpMU/7qoAXWT9ryGq/EU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K134S7kTSSDqkB1sbA4F2ptSDheFeLOWGLAArnynirogig9e11eW9+hCXiCXBDMb3zd7Snbh1PsEOoOzmFbM6wOYRSq9jv3hI5qd8hzw5n89KvR3f+2GPUUKaG7K2O+wE6u4yHWqlAWs30ufu5m0G4VzM7MxtuLWIkw/7C6GuR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LikLKuPy; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LikLKuPy"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccb65437so3431724a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790795984; x=1791400784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VjekLQOz04ZtOGTEi4Fgq7YnHJvxOIm/NIV1qGR60Rk=;
        b=LikLKuPyaKLUqztU/HnFDOEF/FdOubyTprv0oZ7iHUogS1Ah5zjpKm4kD6w33OEZG1
         0/+HQ620522lTydGVvy/EwyFv5ohWfkDOgPi0jYcM0wWgVqNfuJzT7UB64dfL63AYIvx
         DuD3fi6WovdxPyKxEkruC6Dw8sPZMjL8mtJv8RO0IHlH95vg1sZgGNCDBxXXpjfDKmJq
         VZt3yFyEwKubWnbawwgIE6Jr4Q1dNovWzybw0AC/odvits9T7Qv+ybayWrSWV8e/Lcfd
         C91oY0eJWn0UVVdVdzKILiQwkUJmd00O+o749r4pQWBfh9f+R6UVnP+qsb4SRSxYxaTi
         Qx3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790795984; x=1791400784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VjekLQOz04ZtOGTEi4Fgq7YnHJvxOIm/NIV1qGR60Rk=;
        b=MI+cNBvqOKaz//zjNXdYAOwdw9ErLFgrRVA8j8RvgujzZtTxMrRJAKwLpSgtVF25Sc
         ZsORJaNF5FGXEvkQfdOUGeutCAQxUgtqkxaNMzUBlwWh3PGg0u8sCiJlHbc9E2h8eNvK
         e3tWQjGTXai7b8EMtWAXDzT1vt05sC/cxs7mJDl235iE4YXaTfP+mm9B5mUID4Mm9PPC
         dXKR27YX4rKxLttm2kbOYxaLlUSuacnoCGt/4bFDlsYhaUqGjuVJ7mT3O9k6Ogs42ADw
         8jRiA6yqC0arzEuTkSmAeOr++JzKI6qnybJ0htjtu33zXQaLtMYnYAzjlct8TWR/xaH+
         r5GQ==
X-Forwarded-Encrypted: i=1; AKwUvBw8jQ1HqLXXnHOaB0Ljcidiz3t2zQ1yqW7urUPZ3I1Uk2bYzVLVEvFzxGAY4sVcxqANqRRCTqIE39M01PE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKzwo5OoEF2pSIFkYWgHOOdpnV7MZxT+5KxGcwOBQNxt5BPpXgd
	FQX2FdaRutqrregZjXzm8jzIds2NYdL3t1LWHbUvogfUt4i2HcbrPBlu
X-Gm-Gg: AYBFou3UzMH1+hOSdMclM0mk0TV8CEKK4ytuiFUSMqzxDy3Vt/X0nvgzaD7VbCfXmZs
	TFqBJXf32yQDRM2brkOy8sWM1yTgjTsStZ5m9yMlkrprcboZbsK/Ciut3YUiHSzYLSvL8wBfy8M
	CRO36IAJAti6/4W4wjBJRakwp4LzPbRwRc5/oAu14doYb+iAsvaHz+pLW/tep7iTzhjY24o3/56
	7Rs0yHLCMlVvY/929NyhltMlyeNor389pjkDFa7hAa5oT1o9m15SbMra6WnLTD2RpVRxg9Ctkw8
	Pgtx7Dbv/0jUHtJokyIvJGDtJ3TaTBVV4lIyQWd/nkUb3dytpfba6lJWsBaFr/5h0/HDWWGTmHI
	fAyFP1fMmCgKg3m8L1tbhiKZmjAa21wWW0RleZbYGfuUJdiH3j+FXuQ9wsTVIB9MlwjrafUyQUg
	G063+H+wb/dde15DvHNFOvyghvVZaKqkrndB9J1KpmB8jOBZEtJTtIXqU87/7e7zPTS48iUOSzJ
	Uyqsziv
X-Received: by 2002:a17:90b:1e42:b0:39e:2e79:7ce7 with SMTP id 98e67ed59e1d1-3a4f8d7e1edmr33895a91.6.1790795984030;
        Wed, 30 Sep 2026 12:19:44 -0700 (PDT)
Received: from bing ([39.180.169.85])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f4419ff9sm654192a91.9.2026.09.30.12.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 12:19:43 -0700 (PDT)
From: Binglei Wang <l3b2w1@gmail.com>
To: xiang@kernel.org
Cc: chao@kernel.org,
	linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	l3b2w1@gmail.com,
	"Bo Liu (OpenAnolis)" <liubo03@inspur.com>
Subject: [PATCH v2] erofs: fix folio reuse from a different address_space in erofs_bread()
Date: Thu,  1 Oct 2026 03:19:01 +0800
Message-ID: <20260930191905.539-1-l3b2w1@gmail.com>
X-Mailer: git-send-email 2.56.0.windows.1
In-Reply-To: <ar1GgGSIZ1h0bBip@MacBookPro>
References: <ar1GgGSIZ1h0bBip@MacBookPro>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

erofs_bread() reuses a cached folio on page index match without
checking folio->mapping.

xattr.c calls erofs_init_metabuf() twice on the same buffer without
erofs_put_metabuf(); the two in_metabox sources differ, so buf->mapping
can switch while buf->page still belongs to the old address_space.
The next erofs_bread() then reads the wrong mapping, dropping shared
xattrs with METABOX.

We require folio->mapping == buf->mapping in the reuse check; otherwise
drop the cached folio and re-read via the slow path.

Fixes: 414091322c63 ("erofs: implement metadata compression")
Cc: Bo Liu (OpenAnolis) <liubo03@inspur.com>
Signed-off-by: Binglei Wang <l3b2w1@gmail.com>
---
Changes since v1:
 - Drop the redundant erofs_put_metabuf() call; setting folio to NULL is
   enough since the slow path already releases the cached folio (Gao Xiang).
 - Rewrap the commit message to 72 columns.

 fs/erofs/data.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/erofs/data.c b/fs/erofs/data.c
index be63b89f0862..4b9fe670fdda 100644
--- a/fs/erofs/data.c
+++ b/fs/erofs/data.c
@@ -33,8 +33,12 @@ void *erofs_bread(struct erofs_buf *buf, erofs_off_t offset, bool need_kmap)
 	if (buf->page) {
 		folio = page_folio(buf->page);
-		if (folio_file_page(folio, index) != buf->page)
+		if (folio->mapping != buf->mapping) {
+			/* the cached folio belongs to another address_space */
+			folio = NULL;
+		} else if (folio_file_page(folio, index) != buf->page) {
 			erofs_unmap_metabuf(buf);
+		}
 	}
 	if (!folio || !folio_contains(folio, index)) {
 		erofs_put_metabuf(buf);
