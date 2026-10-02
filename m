Received: from mail-ed2-f31.google.com (mail-ed2-f31.google.com [74.125.228.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C307D485937
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 11:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790941445; cv=none; b=Zw1mvC3JCd+HAIXp7EEXi5ktC5NtupkxlaT7lo/waaevoZZ4llsNTlAPHow9xccfKCSniz0mgou7BtjyOezx1gqlLH6aWgdJHT8GnBzolYDanZSviJ5KgS0+Mmdky05n7kF+7jR0grdUt33+IbgV56P3XJWiGeiF959aKyIPOIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790941445; c=relaxed/simple;
	bh=O7AKYJdEkq6EJ6Qizz0HSSL1GwIbZKTMq8b7RJ/aaGw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=exrgs/CU2K0gsfZYWA/YzB3aAoR4HPcU5HhZvhLF+X3XY8EcKp0NYdYH9yaAdWvjCJPLA3tsFtONYJ8bJ6z2db2/9xYqB+2RoIQRspUbpQb2KBd3Nhdo6pxzOYBiDgAwK/8OTVv8w+z0zDtPqi9wgTqY8Yfd6Zyu+HiRNGrOGNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=geImeSNl; arc=none smtp.client-ip=74.125.228.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="geImeSNl"
Received: by mail-ed2-f31.google.com with SMTP id 4fb4d7f45d1cf-6ae42b3e901so1446969a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 04:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790941442; x=1791546242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3LqV8SJyA3fVrxqK5qwu4RqfJsKEdIb5icKMnaFaY1s=;
        b=geImeSNl2Tagmw+kW/U7LJi+DVALM+mbPvXa6oAF8ODPIdSY865NKIlcoGdKtTmD2T
         xe7ENhsrKA7wBft/2e/0OiK0ubadCrkY/J+udF8C0fdwDdho2Hndw+3nMN4IS5SAFyMq
         gIjDwhQfpfM0MOXywlZfohDUBKMU1TXPYFJ8WzPaMJfUhHCw9kUgCS+mX5mcpSH7O+fN
         UDfXBGnn1K4n/QFcgjLjMqp1fl3kzqvmnVivz6ygcS0IEmq85ebI/14WfUJtMLYWuRqL
         e/kuocI5SoYOjIIntkJVKZ6AZHsNKMrT9VMSc8GRYTIdjphkpZTklUzkoSeuDVqhGSVP
         utow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790941442; x=1791546242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3LqV8SJyA3fVrxqK5qwu4RqfJsKEdIb5icKMnaFaY1s=;
        b=aKHaIqGFIubz2dGXos/K2xh76Bynfqw/a29wowbEteK8s6dWYNdXXoiNKBKmo5KR83
         VYav5GrGAGNj05DLYbbobYxbYjfLU92WrtCBNzIl2X0C/vtRwdqJyK91aM5QhCThcKE6
         ngtDIA6DIlvYRbnipkrWM7yNAqLgYhWqqgpSMUKFbXZ4DKMtNKmf34ApfGP0/UpJIvzw
         0DF7V7hP5qIZcVVKI8uYKcDGAileWNJGkQHKjIKWn0twK+eVdYaxesenJToyPiF/ufNZ
         J2GvZAVlYgufliU3LM+HuB67GrHstl4unJVOIVSgtP3n/ZWnRz94VVK1/3gc6+y/yvND
         tf5g==
X-Forwarded-Encrypted: i=1; AKwUvBybHbIMrGoswL+NAgnEgBkHzNmhfXJnUtcyz8/kdV/s+EwAupLZ5TDf3nhCJUVreXJlx9hBFmpAAcAUAqg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKMtiZF+uIPibk+mjWt51M3M8D8N2zCpRNQLB8Jyjmjd0nem/5W
	T+uTIreJBpcHQoSoe9zpjs2BytWFu1usPAUBPPPyKNO6XBIwuGPKp6aFVb3n3Q0O
X-Gm-Gg: AYBFou3GdahylihZLQI2//P8TcAAA7i2ndd3d7iXnawkbRrD/Ew2tnj324oIEJXI/N+
	Cme3d53hgDXUCi5NNVnf5V5hHggr/jzb2F+PqGvsbJk36Mb7Sey3hKsHshqV/YSYoHiE/r+pwyd
	TAlqvHsz+RrI4RffeyzWMHK4apVmwscJpE1dlpGhGYl+ExQxeo7xQI9v1nbdWDWyDd+Cm33SzFL
	mPsz9beW4ULtjWahocJ515nN2tn26JWOyGwoWKWWjfDr+dCkQiGAkodA9hdhH7Vp+V28qoxPW1u
	pVF5uqyT23nBdFr2G2XtrF7NZV1SGPUK00ALim+LVFtmKn859Gfl8g+i+bOsvPMz19OwhxqGYCY
	KkISV7wRnMSpA7yUxF1b4GoQ5WYlgZA2mLCA2LhNeoXeoxscOurXTFPMWPHGG7cTmML/m6FQRF2
	yMxy1mlgm7rzIgVlm7tIbSFyrtMjifG07Vmm1uZ7qxUFe0zCmkyl3nnGp8qXHdN+nNqxvW8zNus
	xxVU3NGG8Nwgh5Ls9fnkL6aI2E=
X-Received: by 2002:a05:6402:24cb:b0:6ac:62aa:e3bc with SMTP id 4fb4d7f45d1cf-6af9e2d7d26mr1281088a12.9.1790941441665;
        Fri, 02 Oct 2026 04:44:01 -0700 (PDT)
Received: from localhost.localdomain ([94.240.182.136])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6af9d8b1ec6sm810886a12.27.2026.10.02.04.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 04:44:00 -0700 (PDT)
From: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
Subject: [PATCH v1] f2fs: convert pagecache_read() to use folios
Date: Fri,  2 Oct 2026 14:43:37 +0300
Message-ID: <20261002114338.12073-1-nsvatoslav515@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace page-based APIs with folio equivalents in pagecache_read()
to migrate fs/f2fs/verity.c away from struct page.

Signed-off-by: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
---
 fs/f2fs/verity.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
index ee838f880c4a..69bdd22ba96e 100644
--- a/fs/f2fs/verity.c
+++ b/fs/f2fs/verity.c
@@ -45,18 +45,21 @@ static int pagecache_read(struct inode *inode, void *buf, size_t count,
 			  loff_t pos)
 {
 	while (count) {
-		size_t n = min_t(size_t, count,
-				 PAGE_SIZE - offset_in_page(pos));
-		struct page *page;
+		struct folio *folio;
+		size_t n;
+
+		folio = read_mapping_folio(inode->i_mapping, pos >> PAGE_SHIFT,
+					NULL);
+
+		if (IS_ERR(folio))
+			return PTR_ERR(folio);
 
-		page = read_mapping_page(inode->i_mapping, pos >> PAGE_SHIFT,
-					 NULL);
-		if (IS_ERR(page))
-			return PTR_ERR(page);
+		n = min_t(size_t, count,
+				 folio_size(folio) - offset_in_folio(folio, pos));
 
-		memcpy_from_page(buf, page, offset_in_page(pos), n);
+		memcpy_from_folio(buf, folio, offset_in_folio(folio, pos), n);
 
-		put_page(page);
+		folio_put(folio);
 
 		buf += n;
 		pos += n;
-- 
2.47.3

