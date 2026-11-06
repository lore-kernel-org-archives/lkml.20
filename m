Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794007875;
	b=k/WTzYyXHOyO/7O+5nOkf+fV686PuPQtpGVruadBYKYITkE2iE8pkrd4Nah/8wGRiLvb
	 91skITdysqLcWKfRowOk1fSwAD/GucNbIRgcU9BbQcsk90qoT+T7w9M8lPeViSgcIsR+w
	 EuIgpk8k9gazc9HnyKK3PNsQp2ThGVqHtNzOZeS78vGrOWFO4P3eS1EfmLiYk/D3KdR5n
	 htTWu2YWOkXykBdRxaXE2Om4E658534xya6ERenkXEUIugvn2cN5UxwPUwyR53uYMwrNC
	 F8yDcThNhUBMjcOyjO2oJp+Q9SCaZL3hFtu9nm1ENlEb4ZRp2mMA+8dCKUCRxyn9vkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794007875;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=KxDNcFzjGkbUdjmkdE/Lvs3kMztmWZwJDH5eU0pXD4Q=;
	b=qKQlMZMaOFg7aYqZi8mFlDy2TiHXAcecYq6EAzaQZkm91S7b2ABkYHsiHJvlACkZG6Sb
	 k6Okxbj8hmrGqtsCDBQCOTJFvUwrkjdD1SDEnpKOj7Qh0T4ukalb+khZxRY0t75n2JQ6u
	 yzSwtaD0mLCkMYkYZkhCrZh6Ryd6buNUI+3UWPPkzdlrQ4GxPr+zwJnjeP+2ZuSNrebxO
	 T3v4Xc0FDjo4/AUMPR57wE1p+GEHIzMIXykHjteAUu9IHFqja6plIRPJPLis54oSz7lVe
	 bn0tBHlOchykA5dyc6FTh03MxxbUpfbPYT4f+Ntvkf3Fj3UDx6PPOtyiUiGUhW9F/hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NAkbH2uQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D444606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 23:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NAkbH2uQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BD3B1F0089F;
	Fri,  6 Nov 2026 23:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794007875;
	bh=KxDNcFzjGkbUdjmkdE/Lvs3kMztmWZwJDH5eU0pXD4Q=;
	h=From:To:Cc:Subject:Date;
	b=NAkbH2uQurcfEeSotMoC6v/IS9V961K2gGDd2Dpg3hLxWLhcCK9zPtaE8WeXuSlXY
	 JvYkw9V6WNWORghQgJduQh53a7bFIXh+wJRTbUfcOHIuiHvbnndbhNxkc+itxrHI9w
	 pCbiPgo99Zvjot2JiDpWSkrsZdPT7xGSwHljK4f5RG792WafhIV3LGNEJHygznW0AE
	 v0Nj4oQRhEfRQiZiCw3oLKdkE2N7IkNd7kkfQ4+4fqnwjsqQ8qnxBV8+SgN5W6vXcN
	 HGkN5Hk4Y3N4UU9kXFK2r9S/zrenfTB7w6bpRpCbyHxPf6yOHhdyvnOjSZwn4pb3F/
	 LYdRx+wFmwj7w==
From: Thorsten Blum <blum@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Michael Schmitz <schmitzmic@gmail.com>,
	Miro Kropacek <miro.kropacek@gmail.com>
Cc: Thorsten Blum <blum@kernel.org>,
	linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] m68k: atari: Use strscpy() in atari_switches_setup()
Date: Sat,  7 Nov 2026 00:31:04 +0100
Message-ID: <20261106233105.281683-2-blum@kernel.org>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1016; i=blum@kernel.org; h=from:subject; bh=gkYI4DWvjAn9+h0nH84MIS350bRDMYP7XG2ktMjhb7U=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFnvki2NdFx+P3/xxPDxJvULp7V9tC/wOpybvX9j1zbXP tGFx/eqdpSyMIhxMciKKbI8mPVjhm9pTeUmk4idMHNYmUCGMHBxCsBEJs1m+B+0qqDxwCLJhBMc b5Y/ZpK4kHvz9pamyEvr3z1y50/cW8DIyPD9/I7HZ84KTbr6hNNJYsGdCYfMr2w65qTBVp7CxsV 34zgvAA==
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

strcpy() has been deprecated [1] because it performs no bounds checking
on the destination buffer, which can lead to buffer overflows.

While the current code works correctly, replace strcpy() with strscpy()
to bound the copy to the size of the switches buffer.

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strcpy [1]
Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/m68k/atari/config.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/m68k/atari/config.c b/arch/m68k/atari/config.c
index b82bbf93d8e7..09f4219faed6 100644
--- a/arch/m68k/atari/config.c
+++ b/arch/m68k/atari/config.c
@@ -35,4 +35,5 @@
 #include <linux/usb/isp116x.h>
 #include <linux/module.h>
+#include <linux/string.h>
 #include <net/ethoc.h>
 
@@ -154,5 +155,5 @@ static int __init atari_switches_setup(char *str)
 
 	/* copy string to local array, strsep works destructively... */
-	strcpy(switches, str);
+	strscpy(switches, str);
 	atari_switches = 0;
 
