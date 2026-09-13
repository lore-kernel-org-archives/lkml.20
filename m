Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75F82DCF61
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 14:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789311001; cv=none; b=dDWPouubcpNwIzHZ8Gdn9pc0ENsv01bF7FkURpogubdqTDI7QxsArw799ZFh6C3edNVeEVfezjPu+gqgj8y9WSgIbpABx62/24TdzqZrt2R8x6DRudEqR5UxaRFisHo5jFByHRk5SXigNjWjBUfSP7Gta8XKThWdVfm87F+QfUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789311001; c=relaxed/simple;
	bh=6HyMqfMFokSBSd/H8EjZ1pGgrmb3gmjQfy+uT6NpeHU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mU8nCD+uwd/HnrgS5g4H8Z15UlVAXc7zJNlo9xqM3cdaz6JbQEGzyl/I/ob8THba/QpIwXM7jewLn0AwG9HzIBw2xlRTqbV3JM8xm8y9zKnLLRlVuvflcnO27YV2vU1Fiyk+9eTqtrXFFlAiLodyQJB0/XvA6EoXxndI2WyDt5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PQ+GEZuo; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PQ+GEZuo"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d8239so6377985e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 07:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789310996; x=1789915796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lbZdzHZQeGskIxjajRcW6RuRmFa63C0BNSbgSO/ZyFE=;
        b=PQ+GEZuoV6QQXoBLvpY3WhXEj3FKURHLeXmUo0LbyEd55raaviJoBT8spI8CJ+Utkv
         aTuxkjwfCK10a1zK915+pWqa2pAUMsFTL2R/G9oGTPvRuRkmevHGuLLarN/rvfxlNcEj
         i3gji+kdOXdvJSrCY53/rnGPL+yvL/auyDtNr2E+2Rv2riJlaSTbR2j3rWrbxgwYZPKA
         bCADzzp1kDCFstJBAOtbklv4ilwPcfGmHvOBcO4OVAlr/Cv4UY8GAYr+9WCh/mwK65ov
         MVYHpK8GKMNh/P46Xy9EDnzIwIb+/ayj506nGoVwjg1QaDxaGwH7wH6gU1vldb2a3ed6
         hC6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789310996; x=1789915796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lbZdzHZQeGskIxjajRcW6RuRmFa63C0BNSbgSO/ZyFE=;
        b=Gc6HAL2o6yuFHt0hTCORMfAcpGSEbVNB5kJht5ZGF5cU3QgkCr4jLPl8BJckfEg8xN
         xSBo7M6UUJdUjYsDCsfXkWnubLONjezGJHZ8CqlXuPr+4c9vL+g3LAHe0ew0n3A9OHrw
         eIrQzxGRxyxfO/lVdFy3gzm5ZwHli+NuWD50RBxC5xJwKILyi9WGxZdOPJZoXoIX5D8m
         9AyUSYmzYpuSTx5k+FJbIWSzrnyCWw95nyGQfW8HJ5D/4EDofinZNG7vj4lneWhwSUSn
         0QbSh4oPtz05aHNv3CLeSXPi7HeMDQZ0fAy4L2yHVsPvSSpNdZVBPfCVPgBxfnT2tr2E
         uD0g==
X-Forwarded-Encrypted: i=1; AKwUvBz/AQq9cmmmRTZ3a8r0IEwnEYZXuHBVseJU/7e8pJEZ52EsgxRzUgFRRSGeDn0yNvfPFMJC4Q5trYF8BhQ=@vger.kernel.org
X-Gm-Message-State: AFuF++npUojgArhOQ2XQkrj49XfU1TVfz9Q6kV5yYe0URrKOLXUXgWhF
	M9kvAh08NQEi7HP2ldIxHPo1dWi3UK9Y+pTC8UulHcYGRt2QnZMcAStxs376PA==
X-Gm-Gg: AYBFou16T5greic2yAztEaMazR5lKZYRrQ6C++4kKFLrbIz6Sm7jXJqvHLMZuzXkOud
	5UDTJWcUXmTJu0gltv5SL7T1EyTzCj3vCl3Uv6VwKL0Ye6vc9x+b7FDN3h9kIwr+euIcUwTqp/d
	47cWM4uCZPNgVWT21B/eAC///29cD8pAn+z6gkq8tIpilFzTcpy7lXXkBX7mbPOEcbNsUMeShNN
	xwubH8PIQ+Ftxf7tmlmWZs9GxIYAysDyB0sXh6SVgsBGuVmeorHIohAhVpvvDFybFxmY1V47FT9
	NiZYbpvPOOGqhLNh65Bh5qDqqiGBEjF9hllDyZ3W1BvX4+N4gk+cVRjE9FCmeYniWjLRNi25UAN
	KJNBTN6M9WkE8YaJKkVOH4fR5ukBbsXc4jXg+JNRZJu67dIOBZtfZOPqJhg1eTvgWhM7WDyjljJ
	Q/wRXqfgETb4cVyS/tSBgz3Q0Sfc0Vc7VU0F/JS0wq6FYS+iN/Uolfd8Mm5DU9HuV4GuIz6kP6U
	fudlDw57dcliILlf//l/eJFVsO3TukrAOSFeBFWggmXAXmt6O5a3Q==
X-Received: by 2002:a05:600c:3594:b0:49c:fa21:1c89 with SMTP id 5b1f17b1804b1-49e6cc14055mr86517875e9.30.1789310995731;
        Sun, 13 Sep 2026 07:49:55 -0700 (PDT)
Received: from f.. (cst-prg-84-1.cust.vodafone.cz. [46.135.84.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6420de77sm109534235e9.3.2026.09.13.07.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 07:49:55 -0700 (PDT)
From: Mateusz Guzik <mjguzik@gmail.com>
To: brauner@kernel.org
Cc: viro@zeniv.linux.org.uk,
	jack@suse.cz,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	Mateusz Guzik <mjguzik@gmail.com>
Subject: [PATCH 04/10] fs: use path_clone() and path_move() in vfs_open*
Date: Sun, 13 Sep 2026 16:49:11 +0200
Message-ID: <20260913144918.1606123-5-mjguzik@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260913144918.1606123-1-mjguzik@gmail.com>
References: <20260913144918.1606123-1-mjguzik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional changes.

Signed-off-by: Mateusz Guzik <mjguzik@gmail.com>
---
 fs/open.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/fs/open.c b/fs/open.c
index a84b55301719..e11d1342ff74 100644
--- a/fs/open.c
+++ b/fs/open.c
@@ -1102,8 +1102,7 @@ int vfs_open(const struct path *path, struct file *file)
 {
 	int ret;
 
-	file->__f_path = *path;
-	path_get(&file->f_path);
+	path_clone(path, &file->__f_path);
 	ret = do_dentry_open(file, NULL);
 	if (!ret) {
 		/*
@@ -1125,9 +1124,7 @@ int vfs_open_consume(struct path *path, struct file *file)
 {
 	int ret;
 
-	file->__f_path = *path;
-	path->mnt = NULL;
-	path->dentry = NULL;
+	path_move(path, &file->__f_path);
 	ret = do_dentry_open(file, NULL);
 	if (!ret) {
 		fsnotify_open(file);
-- 
2.53.0

