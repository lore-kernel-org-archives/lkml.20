Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792486955;
	b=U9HBQRglgIHbki5tV4fpVx8+Nl37ENkYmMGtX8Pop53ok3JPQWIGNvuMohCXAN9IN5md
	 bZgQjN+mLxchhdNp+onPQ4gV/s3ZXwBNOE7U+bKcpgITOe1MmWKk4zkoiOlljbbBuIG6V
	 RJj50nLSS4Q1aCD/cPgMINnRq7cT1q2sfFHNDB54Dg+aHxz1c17538axIuGvQTnOb4vpK
	 86CUi/zdY6fi2itJRkGxdk1Dl/AwDPFAD4utJ020LnJfeUINnJQcAeoxOr1SwqAyq5H82
	 fjDnhybGLckUOeVnQRRqX0n5h46zXuiey8ul7afjoENAGpJN1Z6qdllwgbXEmxaYOGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792486955;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ppC8TRBPEanEndEB0ZLxZ/g+4/pJXzez/E6F6ayShus=;
	b=GsAuVi2CIa1rPfg3scSPpySKl8lbbHWfXWxCugEwBc6NDm1bXrIgXL6IoCKEPLihWCtL
	 3+r0AOcvCcHRlJ1rhnetExcKfgssGVllqYcOSt8oxl3r4A5ANQKRmwaBQdZkCkCq2Roqw
	 pn7+IAKuzkIW3pKDNkVdbGd95yroyu9UYb8dqH/W+G1c4+vy7tYU0BEiTwdlUFZaxYyea
	 5lYyil9XnCUbE/FPWdxYEcwmFGuLiMiM2J2sFnPPYv26LqWzqfXz2ZBg4P5cJzAG9DWXf
	 WatGNanUY+jXUDQ4oo/X04wSDKz3tIEqliApiO1SLpjUEnVmgJtAv6jIEQbJeBCasZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DKFP3HH5;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7AB606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:02:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C7AB606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DKFP3HH5
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48df54150dfso2278307f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 02:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792486953; x=1793091753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ppC8TRBPEanEndEB0ZLxZ/g+4/pJXzez/E6F6ayShus=;
        b=DKFP3HH5xkEVzudg7J2oCkxEv63gXy59fH6PmGnoXYbvc/Tpn7SgV8Dv5eYJWndKdF
         0gPK2x7sAz3AYT8RhM/rHIAGIPXBDkqLTKvDbhEjSB4NOAXpwUrUWYuWZBbs+QX5g7EH
         KHBuhZ60BQCzJV93iDirg+lePGYCDsw68pX8qHFwLpaXeoybsVRwJiU6FbG1Koyi3afU
         LKu9EGas773lgo5srdIo/xgpLajo7HooInu/5WPcW47GgxVz3rvUPojFuKTiumaRzeTO
         sVtXXwAJqhrVO8uj6GDvQI6nPca476LM1GgzAVdc5eYajgUqbR4TK/Y6/PJzWxvQ6pIl
         WTOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792486953; x=1793091753;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ppC8TRBPEanEndEB0ZLxZ/g+4/pJXzez/E6F6ayShus=;
        b=urP/g9la9Z6InXu/oRjLBQj8Zc2N/QoWutHmmbL2FhbnZ0Yp90zHjjJv/Zfp/Rjqcf
         0dBvjHJ+GFWcHmsUw4tos+oLZL6rHhZCSWKVMiaVl8dyQb/0/ii87GHYNLhc3/np2OUB
         Zi61MPm+VeDv4RwIWCOTvwtGtVJXnz//mJZjAr3D0TZibRd3Wb2+ELyBwU45h2RsUF2z
         KZOouBe0ljx9pgQjkVSjl0LBIm1Boncv3VMqAWd8K+Pgt2HH+0KNtCzR/bI1KEtFFPzg
         5JDs7UPLR+zw3altOFA4xDUDgWNeH0Koly3R5CNa9FDGnm1gZT2LiASpHSyUHZeySYHT
         2mig==
X-Forwarded-Encrypted: i=1; AKwUvBwMkjHjwd0Cj4R/AgaI5uX2Z/9JCICbikdSCDn4PXX+Z+877SDt0hFN6qFIqRlgj7It0JTjMyKmYJOV2lI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIjIIOlDznVqsz8uPj2e0PTnmj6XgxnEu3LJgT9YC1B8s1FD0LQ
	y/PSRWuSVpTzW7opcBj6pMx+iJWe+Rc/5AdV+zMRF0RXXgfFXkoofuXx
X-Gm-Gg: AYBFou0QiKwvwbZvT/jxWBmQukjfJNrT4gMnYUrzZL/KQC9S1w3Wml397N8diFu7OGp
	Ct+fsz3fM+Y0qd30Z47GiY24g9DHj8jMcCppcuyf7TWS3/bokYj0IQGtXp8HXV5oF3Zk2/we02m
	GyomqdO7MCCv06aevvlhYxS/+qsoAYU8wNemOwRgx2MMBTrchUlulgmkgE+z8yG6cgj2wa7i3Aw
	F0Kye4vNmR9RkGlJhFf4r4DkliTaJDf+AX8mpDNyUFpM7TzAY8KDtkDeu3QBxKVmVwH2Zew5PB3
	Qm/zKigqAcInmXoPugLE2iCyUGwWJu9F1HF0YvwETkjFmKnz6e80Vx8M0yVSKm7cor2fC7VjKDz
	SaJWzyLh3TJrhV+M8g8Kz9TSNOWwXHwuvftFohutd0Lmn5vWMOHOxmg2BptJyMOcN9w73Y9U70Q
	8J3bxwyFoTni0thAvfyllVmRuZ8vLNZlZRVao6vkGY7t+bbVyQRYPAU4PAh9Y4cyZGdKgEmDgfZ
	Pz1U2X43hkH8JpKt3Hvu0WkEisAqM2eIYHXGdA//gnEMWY=
X-Received: by 2002:a05:600c:1f8d:b0:4a0:1b14:d00c with SMTP id 5b1f17b1804b1-4a1d75ab306mr239129235e9.3.1792486951816;
        Tue, 20 Oct 2026 02:02:31 -0700 (PDT)
Received: from DESKTOP-IR7J1S9.localdomain ([129.45.77.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cf04ffe9sm243295495e9.0.2026.10.20.02.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 02:02:31 -0700 (PDT)
From: Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>
To: dhowells@redhat.com,
	brauner@kernel.org
Cc: netfs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>
Subject: [PATCH] cachefiles: convert deprecated simple_strtoul() to kstrtoul() in percentage command handlers
Date: Tue, 20 Oct 2026 10:02:26 +0100
Message-ID: <20261020090226.271-1-drifabdelmalekmohamedsaid@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
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

