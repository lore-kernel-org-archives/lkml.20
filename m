Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590E530596F
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 02:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788575004; cv=none; b=jeAcCc2KfOOHYCidzfFJvqNjsjJjd2U3XBEm5Uf1hUKFa4Y1LPMaK+G/BoC6NjfHwU2gLx5d2b4zqcSZmHaMWw3JoCbgRcAQEeAgxL6lLPfgbYugi0A6PACtkCYPubKfmRenqfJjTHaT2P2V60AB3JxhovvMipjKUkJ7Uya+DeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788575004; c=relaxed/simple;
	bh=xyGZM56EkT54TGlWSx3gPzxQTJvAGCoe1g3KpghWzoo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=N+G+mXU+0IIkk3tR1Va6Vvgq8hthMqz5FKYeMFPHC4Nti5bLKBUOOwLiSB+1bLTiZvk9PdGS0kmzBxahjzj0Zf7FDlt5aAnydFOO/RrP8SVG+L5bKZ64eqh2AfuVOSZdKVymhNLhS0U6QJUEkZgxzJ5mGnN8u478ehu+311fj/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X91mZV1l; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X91mZV1l"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-485850cf499so955976f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 19:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788575000; x=1789179800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WbfEpisKez36CFmA1of7zehX26ip3wI6pp+HshpNatQ=;
        b=X91mZV1lQkCK/Raq/UHmqE4StUfHMKW7I4Li7ESBy++2peIAcDycsNGvhQDnUUwQsE
         p9fjI3btIaMesOdiD7vikEmuDSLA0HiWGQX6VmU3upXiOIV8tjbCFbntdHpzu/jLecDG
         MilZuBYsF8NIqfPjDhT9CZ3UqvO8u/i2xksYHLWm8ReIfzQZPjLWcdIrAlRAuyEPljv8
         Bqbp7xJc7WPooquuhN3ov4dsJ47K0rcyZAe+3s3lM85/EgnkHC+Tlr0EtrI3lQ+2AYJ6
         VlNM/xCAMK5WkH2bUbWpWAm2i+SvKdKB4MUgLs7NKBNxbzN+s/CrR7Isk6Hrh9ITuhfZ
         fG7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788575000; x=1789179800;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WbfEpisKez36CFmA1of7zehX26ip3wI6pp+HshpNatQ=;
        b=EAAokz3TRrvuDQcdRf2NQ2UhZjNNNuDROMa2D7F4//AutadDpX4ieypPieKNL1zCrr
         Kp3YzgUUxsfZt8z+LZgHKnUhuEG97y2gyumXVX+TDrau/12MYGwp7voMGY1/RJ/rvfoy
         H0SMTh+nxTy7ukOcFSj8Ksgo6rRgYyRtjMLeXvgNp25wIusauGz/LTAb/DXfulONoZF3
         YO1qu2mXYTcVp6QMgv+CPScm5gQKSUytmWRinEkUxY6O+kAOu5pMPvFa54klUisTZAxW
         WtwGC0MiS9MKUBbCR4sz37qyL1x6pZYys6D5rTIb7j7492fTZKDDXbN+7RqSUcuJpEUE
         8U7A==
X-Forwarded-Encrypted: i=1; AKwUvBwiy2iTNAUOuqJb56O6d9pOYzhTv492qpfpk9f9IzHshM8Dj9R9eJL7TT8vb9q0aBY0OyKXKoNgOiq42Ns=@vger.kernel.org
X-Gm-Message-State: AFuF++l0l5cMzv6ehSsPtCpCZBirskYYIE5b5N9YZxLpJfOldM+45L63
	1FDgtuuXyrU67Q43ZGSq1G9nZ59bsran5wDklr7M4/iFKmVKx4zCpD5C
X-Gm-Gg: AYBFou1Ua/c9c6NjZuSCT7EHPa0JXu4vI+ubzc1jRB6LBI3xnTm82keMbNyxdiIW4rH
	w485ixAQzpAHDNRbrH15uxH472ceIu8aZormWtr8cQg4uyFYJpi1DcdePggpEbujNheCO4L1WOf
	2fKeSaGVomKG2hmXpuUvDrOE8IzFJ8xi5vWAeQ5EDDWtsIP7gtwhm5KlK7zg/O/YxYUzam/sQOL
	VCNJY2a52guprcBMq0pnRQ4/h2JK7WSKNJiFCIzmmY7qmuWw19oCS1uDoUsWTbZ9K1MzhiL5xiL
	JYpJ1/JWiuZJRgGORgO6tGHcuNRnqxlNEVO3u6Ujov7LkIAux3LKi+ApKN0xMmn/nCBxqT5INjw
	LM5VH1cDibnR3QDYTgsHp2Lo470AI/5HZ4dwxrqSbLTmtpA0U6PuqFqCG+9Bmg4FdGcm6Fwp8oj
	zM9y+4fUg1OgkLlLzMWMdAKfujiinxc/oGKNDaVnHMPeO2hZt6uy68Q95HnZjJgbNuGEDvj/7AQ
	j5wEE95nZX1ElkN1cyEX/bTURkmET8BcVLK+mESkjnHFEkz5YMnDYw5hF565Ay+QwM90mYAUpUk
	AYN5gvHuy7zXHBux7IUVYonbAwu/++atCFEZuQqKT1VtD4NOwBk5GGzHAwLGWX+3D0Po1EbLtyD
	5/Q==
X-Received: by 2002:a05:600c:5487:b0:49c:fc6c:bdfb with SMTP id 5b1f17b1804b1-49cffee2ee2mr35144485e9.18.1788575000385;
        Fri, 04 Sep 2026 19:23:20 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c81c3sm9696996f8f.26.2026.09.04.19.23.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 04 Sep 2026 19:23:19 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Pierre Ossman <drzeus@drzeus.cx>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: core-api: Fix the ISA DMA example
Date: Sat,  5 Sep 2026 04:23:10 +0200
Message-Id: <20260905022310.82529-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The example never matched the ISA DMA API: the functions are named
enable_dma(), disable_dma() and get_dma_residue(), clear_dma_ff() takes
the channel number, and claim_dma_lock() returns an unsigned long.

Fixes: ddb99f3d35b1 ("[PATCH] ISA DMA API documentation")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/core-api/dma-isa-lpc.rst | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/Documentation/core-api/dma-isa-lpc.rst b/Documentation/core-api/dma-isa-lpc.rst
index 17b193603f0a..296838ff295a 100644
--- a/Documentation/core-api/dma-isa-lpc.rst
+++ b/Documentation/core-api/dma-isa-lpc.rst
@@ -115,17 +115,18 @@ sure that all data has been transferred.
 
 Example::
 
-	int flags, residue;
+	unsigned long flags;
+	int residue;
 
 	flags = claim_dma_lock();
 
-	clear_dma_ff();
+	clear_dma_ff(channel);
 
 	set_dma_mode(channel, DMA_MODE_WRITE);
 	set_dma_addr(channel, phys_addr);
 	set_dma_count(channel, num_bytes);
 
-	dma_enable(channel);
+	enable_dma(channel);
 
 	release_dma_lock(flags);
 
@@ -133,9 +134,9 @@ Example::
 
 	flags = claim_dma_lock();
 
-	dma_disable(channel);
+	disable_dma(channel);
 
-	residue = dma_get_residue(channel);
+	residue = get_dma_residue(channel);
 	if (residue != 0)
 		printk(KERN_ERR "driver: Incomplete DMA transfer!"
 			" %d bytes left!\n", residue);
-- 
2.53.0
