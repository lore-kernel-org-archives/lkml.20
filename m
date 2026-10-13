Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10B61C695
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791876119; cv=none; b=SwS4OE2240sv5ZPF/Iw1tvHO0K8UjxFm1pIHfl4zzgFw+wmlOkOvi0NTPixArgHlEcHGFoMkqbkdA/lj+YVufkkNA7riqi0i3shEcdJwgUk0nm1oW+BP2Drvcn7laKWSLskQCTBzmVqesxkXiq0hyu5F0VTwcml93aKa+sXfCBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791876119; c=relaxed/simple;
	bh=4zNkciEYj/XTFa74Bmw90DL+won+DqeeMtDTOsn2C14=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=THfQ2hvdeF2v7pdc6Gcw/5/tRjYTOuSSnhZpNDbRY/8Z1nyi3O0II3G5qxhaJuaIEb7Wjdf8Xuyc7KZ1ZY84JDrwi9uDykhn0sFKuEllyIsZTq018mzS+yEh6GQpygYNKdbLPzs1HnF9hdd7XYqyEXG5UB93GNJE9wLoknen/So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TrcGOPD/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TrcGOPD/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5173F1F000FF;
	Tue, 13 Oct 2026 07:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791876118;
	bh=Ne45YMLLRuVqti2IdldwjaSUIC4ERusRykIBg9Q9oY0=;
	h=From:To:Cc:Subject:Date;
	b=TrcGOPD/7Vx/C1PeHoHQQI0drSu68ZYXIDMHCseTp949INso10czeghKAQM6dVjge
	 xVGtjOjreMtU9spQBkaNVlPA6EiR28UOYyl3+ZA+xwBVoZyIGEVHDZ9rXf8QLPIZe4
	 4juzwDx26HC6QMbnFwO1tN7YayVzkyAuvMvJn8dks51nCrg/LIRusn3ausT5n3z2XZ
	 Jem7NXS4k++fvTAjUCyCwFNFS6RFyOM5dliQzPImplLAlpXnXF+XQdd8Ta7nOl2qa/
	 masaDCbvU+KotSIWDb/RnLONLIg7bNVyVpy5FrxmmrrrqvwMkJS6OF+rS2a/I0586d
	 JwXeKKlyK2jkg==
From: Thorsten Blum <blum@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Thorsten Blum <blum@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] lib: kstrtox: Use isdigit() in _parse_integer_limit()
Date: Tue, 13 Oct 2026 09:21:10 +0200
Message-ID: <20261013072108.4407-3-blum@kernel.org>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=605; i=blum@kernel.org; h=from:subject; bh=4zNkciEYj/XTFa74Bmw90DL+won+DqeeMtDTOsn2C14=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFlnbz+Z9mLW35jn6bNnfuzZXrzmlenM/JIbMlsO7zTsO DGbTVc2vqOUhUGMi0FWTJHlwawfM3xLayo3mUTshJnDygQyhIGLUwAmsrCV4Z+Bzd2CIznCKneW /5Tb8G3mjGtzmnp1p19cqT171hfPpwu+M/yPvd9uclfLK6TwkI2c+HruXau2HNPRC7/srO26bJn /kwscAA==
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

Use isdigit() to replace the open-coded implementation.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 lib/kstrtox.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/kstrtox.c b/lib/kstrtox.c
index bac1c057e1b0..1b3f0d3fff37 100644
--- a/lib/kstrtox.c
+++ b/lib/kstrtox.c
@@ -69,7 +69,7 @@ unsigned int _parse_integer_limit(const char *s, unsigned int base, unsigned lon
 		unsigned int lc = _tolower(c);
 		unsigned int val;
 
-		if ('0' <= c && c <= '9')
+		if (isdigit(c))
 			val = c - '0';
 		else if ('a' <= lc && lc <= 'f')
 			val = lc - 'a' + 10;
