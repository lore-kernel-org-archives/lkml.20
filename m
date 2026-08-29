Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E98399004
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 22:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788043508; cv=none; b=gtOta0ujkw3vrDL4Ioj1j6UoaY79sgfcixHeEjOJjv573dYiu0RyalynqxJR2ef7JRgSTv9YpQz9xTFAbfnh/Tb4kn90S2kPV4rrfmnXAh5RkWc3Qw++V3p5rwW1MYc0QMWzRJfgkcaTpo9XuoxMRIW6Lc35SBMEnrhE73i4qNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788043508; c=relaxed/simple;
	bh=gneipLsgqKEAyVQAZll6RiNG8vO7ec73+30d+3Gw2Nc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iettcz6ljVZ4rytpsp1mFabQs4veGwOGfvjmq/yFRwPTFoI0atPCS9lIVq2Yle947dpRn227LON6OYoaX1jt4sA/nxtDGozFZDiBlkxvPsRrHvqbwdrI1MzaFEci8o0xnIoX4wwgA4jHBNqvkONUhcMAPfj92LbLZozBNtubgv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a9nbIKQ9; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a9nbIKQ9"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49b8f86c6deso12354815e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 15:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788043503; x=1788648303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ppC8TRBPEanEndEB0ZLxZ/g+4/pJXzez/E6F6ayShus=;
        b=a9nbIKQ9YNUFS1a6ncjgVPUdbsor37FZ/34I5UH0PoEZ6UWGLl0t7KntZx6G8Ly/h8
         Ipx9ic44X5QECn7/CTBYCA+nGLSLHG75I87fdm0HpCOH1UXhgiHvGY+ksKhaZXlsf3qB
         gzfcQ0AnelYnfs7PUdvPSwCSUP/yul7O9OwWXicPQL03tVugtokRIXZTJDToiFeLkMk6
         REDsrj5iYxTpBw5zkzwQby+iGmTHrrCZDEQI/IaX2oaiUq97Fz91g8W9hwGrNUkHgM66
         W92UVRXruI6UQwdXFYnUGbY0Rfb5xTfiQdFjKshSQzbZiUFuzyxa0Of9A5AtmuhiAIlL
         BFZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788043503; x=1788648303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ppC8TRBPEanEndEB0ZLxZ/g+4/pJXzez/E6F6ayShus=;
        b=NYGJgt4InFhI2euJUvTCumm0tqL/WlEieIT5Wr+o22kxilvqBB/Wn4OE6/8Ar6X7O2
         qppLxB/iyjUMbP5XtQXhel7vmS4v+1Eva874L/E5rT0JKgJtGg3Ehplx9658RdsndK1g
         uNPAaZCkV8ZngScSvZ4KkX6Fp64QC6qjF9xbwu4dlcapf0NAQXDsqa/OxdEHIyHEOCOr
         ikQBmVhVi7ieQD1iE9Oxwo7Lie+nxODk09xechVC/Mhao203Da97yiY1SnFD//wn1IBK
         W1QcWhPza2O+uUWxGVcgqBs61aAatnfaDO+QE8A5xYfteaqoRBh29GCdPqs8QOytNhz9
         6atw==
X-Forwarded-Encrypted: i=1; AHgh+Ro1V9als1+2AsKN1yPcnSmDu7oo3hLQUiY8nD6MJzU5pjMIjFyysWwLIeociqiK+cEJxIK/GVW4hY+2+0g=@vger.kernel.org
X-Gm-Message-State: AFuF++l/JNEwTdW/WEvj4Yb14jxbrn1xDB5bDwBRq4y+HA3zBLaGTKf4
	+9sUxzhqzWpIC1CAciAefklQe4yECDvGrARLOrBICVER5XJnSIAAIuM6Ose+bQ==
X-Gm-Gg: AR+sD12qS6F6J3qfZkzJGf4kZ3/ILn5EPFEuIzK/dp0nKvBGL5NENq466NEvA7EUa3f
	MylaWEJa477CeUEBv+vADHw55sPYYg9soAaRPFq0908Bd/WcQg+ZLqogpAK1gYsRBLRoYz1i2hJ
	tTTajictkUVxdBCGegWN7rCZlbrYISeyX+IkA35xjX2pxN1rBIjwVzXLLWUg208QJuCwvZAyb2/
	ZcMfYmTFoZv9QP8V2sPiQuhnVJ7nuuR+iAhuVndmclIluyhkkL0r5P7nmE+O8abkKCQfFqtXx3t
	MSl61ib2/QiB8O05LaxVqtgm5WMtn0Ai/7hOHq0fS8vhxtHjL55dhb1Y4ILQU9TVMHKrLZc3RcS
	Ha5I5m3G4ixBgTtPApxhlKne+EjKupKA6AN3OvBmz6QKI8Dh6dO6e5bee2VlN2vAZbdN7BOZvCN
	CovyYlqJ5j7RtkO95a+eXCia1G/Fu+R/bl5IzcYhEmijVC1FL4cbIBso6AdY+64kdsvq8df0GpL
	XCva0fadzBZBgJkSIm/u8KlZuaWN44Os8cKvg==
X-Received: by 2002:a05:600c:3f10:b0:49c:d019:70c5 with SMTP id 5b1f17b1804b1-49cd01972c9mr43946365e9.0.1788043503066;
        Sat, 29 Aug 2026 15:45:03 -0700 (PDT)
Received: from DESKTOP-IR7J1S9.localdomain ([105.98.30.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ccae954f9sm97527475e9.13.2026.08.29.15.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 15:45:02 -0700 (PDT)
From: Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>
To: David Howells <dhowells@redhat.com>
Cc: netfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>
Subject: [PATCH] cachefiles: convert deprecated simple_strtoul() to kstrtoul() in percentage command handlers
Date: Sat, 29 Aug 2026 23:44:59 +0100
Message-ID: <20260829224500.14278-1-drifabdelmalekmohamedsaid@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the six <N>% percentage command handlers -
cachefiles_daemon_frun(), _fcull(), _fstop(), _brun(), _bcull(), and
_bstop() - from the deprecated simple_strtoul() to kstrtoul(). These
are the only handlers in this file that take a trailing '%' after
the number; other nearby commands take plain values and are
unaffected.

Since kstrtoul() requires the whole input to be a valid number, each
handler now walks the digit run itself, checks it's followed by '%'
and NUL, and temporarily null-terminates at the '%' to isolate the
number for kstrtoul(), restoring it afterwards.

Signed-off-by: Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>
---
 fs/cachefiles/daemon.c | 78 +++++++++++++++++++++++++++++++++++-------
 1 file changed, 66 insertions(+), 12 deletions(-)

diff --git a/fs/cachefiles/daemon.c b/fs/cachefiles/daemon.c
index 1a66e0af2837..12c38b366881 100644
--- a/fs/cachefiles/daemon.c
+++ b/fs/cachefiles/daemon.c
@@ -331,16 +331,25 @@ static int cachefiles_daemon_range_error(struct cachefiles_cache *cache,
 static int cachefiles_daemon_frun(struct cachefiles_cache *cache, char *args)
 {
 	unsigned long frun;
+	char *end = args;
+	int ret;
 
 	_enter(",%s", args);
 
 	if (!*args)
 		return -EINVAL;
 
-	frun = simple_strtoul(args, &args, 10);
-	if (args[0] != '%' || args[1] != '\0')
+	while (isdigit(*end))
+		end++;
+	if (end == args || *end != '%' || end[1] != '\0')
 		return -EINVAL;
 
+	*end = '\0';
+	ret = kstrtoul(args, 10, &frun);
+	*end = '%';
+	if (ret)
+		return ret;
+
 	if (frun <= cache->fcull_percent || frun >= 100)
 		return cachefiles_daemon_range_error(cache, args);
 
@@ -355,16 +364,25 @@ static int cachefiles_daemon_frun(struct cachefiles_cache *cache, char *args)
 static int cachefiles_daemon_fcull(struct cachefiles_cache *cache, char *args)
 {
 	unsigned long fcull;
+	char *end = args;
+	int ret;
 
 	_enter(",%s", args);
 
 	if (!*args)
 		return -EINVAL;
 
-	fcull = simple_strtoul(args, &args, 10);
-	if (args[0] != '%' || args[1] != '\0')
+	while (isdigit(*end))
+		end++;
+	if (end == args || *end != '%' || end[1] != '\0')
 		return -EINVAL;
 
+	*end = '\0';
+	ret = kstrtoul(args, 10, &fcull);
+	*end = '%';
+	if (ret)
+		return ret;
+
 	if (fcull <= cache->fstop_percent || fcull >= cache->frun_percent)
 		return cachefiles_daemon_range_error(cache, args);
 
@@ -379,16 +397,25 @@ static int cachefiles_daemon_fcull(struct cachefiles_cache *cache, char *args)
 static int cachefiles_daemon_fstop(struct cachefiles_cache *cache, char *args)
 {
 	unsigned long fstop;
+	char *end = args;
+	int ret;
 
 	_enter(",%s", args);
 
 	if (!*args)
 		return -EINVAL;
 
-	fstop = simple_strtoul(args, &args, 10);
-	if (args[0] != '%' || args[1] != '\0')
+	while (isdigit(*end))
+		end++;
+	if (end == args || *end != '%' || end[1] != '\0')
 		return -EINVAL;
 
+	*end = '\0';
+	ret = kstrtoul(args, 10, &fstop);
+	*end = '%';
+	if (ret)
+		return ret;
+
 	if (fstop >= cache->fcull_percent)
 		return cachefiles_daemon_range_error(cache, args);
 
@@ -403,16 +430,25 @@ static int cachefiles_daemon_fstop(struct cachefiles_cache *cache, char *args)
 static int cachefiles_daemon_brun(struct cachefiles_cache *cache, char *args)
 {
 	unsigned long brun;
+	char *end = args;
+	int ret;
 
 	_enter(",%s", args);
 
 	if (!*args)
 		return -EINVAL;
 
-	brun = simple_strtoul(args, &args, 10);
-	if (args[0] != '%' || args[1] != '\0')
+	while (isdigit(*end))
+		end++;
+	if (end == args || *end != '%' || end[1] != '\0')
 		return -EINVAL;
 
+	*end = '\0';
+	ret = kstrtoul(args, 10, &brun);
+	*end = '%';
+	if (ret)
+		return ret;
+
 	if (brun <= cache->bcull_percent || brun >= 100)
 		return cachefiles_daemon_range_error(cache, args);
 
@@ -427,16 +463,25 @@ static int cachefiles_daemon_brun(struct cachefiles_cache *cache, char *args)
 static int cachefiles_daemon_bcull(struct cachefiles_cache *cache, char *args)
 {
 	unsigned long bcull;
+	char *end = args;
+	int ret;
 
 	_enter(",%s", args);
 
 	if (!*args)
 		return -EINVAL;
 
-	bcull = simple_strtoul(args, &args, 10);
-	if (args[0] != '%' || args[1] != '\0')
+	while (isdigit(*end))
+		end++;
+	if (end == args || *end != '%' || end[1] != '\0')
 		return -EINVAL;
 
+	*end = '\0';
+	ret = kstrtoul(args, 10, &bcull);
+	*end = '%';
+	if (ret)
+		return ret;
+
 	if (bcull <= cache->bstop_percent || bcull >= cache->brun_percent)
 		return cachefiles_daemon_range_error(cache, args);
 
@@ -451,16 +496,25 @@ static int cachefiles_daemon_bcull(struct cachefiles_cache *cache, char *args)
 static int cachefiles_daemon_bstop(struct cachefiles_cache *cache, char *args)
 {
 	unsigned long bstop;
+	char *end = args;
+	int ret;
 
 	_enter(",%s", args);
 
 	if (!*args)
 		return -EINVAL;
 
-	bstop = simple_strtoul(args, &args, 10);
-	if (args[0] != '%' || args[1] != '\0')
+	while (isdigit(*end))
+		end++;
+	if (end == args || *end != '%' || end[1] != '\0')
 		return -EINVAL;
 
+	*end = '\0';
+	ret = kstrtoul(args, 10, &bstop);
+	*end = '%';
+	if (ret)
+		return ret;
+
 	if (bstop >= cache->bcull_percent)
 		return cachefiles_daemon_range_error(cache, args);
 
-- 
2.43.0

