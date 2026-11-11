Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794356657;
	b=RqOb+ZzUnH0DyA0cbtwZHyzPGrTczvdkcMTlAHpQgEQ/2/4EzeqzT97SDQ1kIUgO7LCi
	 +s8ayhHbmT5XaiIpyv1lHzQhSThzOBwWPCGPhVfNyqPKwdMmQ7bevU/29Pf5rc5LWFDs7
	 w7bIj63P6WeDzTGl4EDgZDvHQSUbmmYdTjJ7UeEOJCyKeranLIenFjXP8T180jpK2WIYO
	 cpSPnPJkggFeQh7pL2moKBJ00JAT2MIPcijNclscQhfjClL+iyM1l3vCGTHtO1YXpDdme
	 der6CgOt4E67u1SkjK2t0j7Leyhwjk6F388cLRO+cuzhTtT59rnDlI4CFjfPrICOvlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794356657;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=bPv+WMWcyhJBfMpWVwqvVEabR827fX5uGDPeWoliS18=;
	b=blLFVG49msj6fHzIjCVZsogUabRLl3SWm+mMhNojTsndJcbOQRy46jXXwu0DQIgfgxra
	 tcz5olMSS3P0VqsRPqVfPvR+C1PeWjV+iPWc8TymIA9jkXa1uYX6TZxo+9zaSiSuX4SVv
	 NHDvxdbOggpt2nkRzad92QJssxPNbvaQAysylMnLcqbySt6Hl5YX9AFOb3J8S2irjgCJ1
	 mrBAs5tfWsyNQcg/BOs3JP/uIdCc5EtiSnmipIC4noCmtxpx5x4TPZkFhmJnaGbgTQnuA
	 +quAlQVFd39SJ8ng7NMvcWFWRmoGObllvrKaOB+inrXY8yA4DKK42Wm+84/8tN/W0tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UacCW5C+;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701A560A2600
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:24:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 701A560A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UacCW5C+
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4cc89e86e4dso3329707b6e.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794356656; x=1794961456; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bPv+WMWcyhJBfMpWVwqvVEabR827fX5uGDPeWoliS18=;
        b=UacCW5C+bCfoMDMgu5yyX1N2azVaE+JiaTAakMn9R+ZXPsYlHtOUZoneOWj4ybNXzr
         7uy6R2LYb5ZYvUGgXUokdzuk+zbW4iZdVpzG+SgVoiMOjSJdbk3cTr+Hw9pP+Dk0m2Xa
         Opa4xWCcRdyE+1VB7WA3Xykt3tnL8WPXT/FInoJ9qeZ/yDW2VjCI3faoHqICVcQy+/uT
         reCAILSWTOfHaP54Do8vkPbHYWFlG1690IJN3D3slfYkNxWfwMlm67tnd53RGbqdHeRe
         er3REd0G+icM+hLfuxMEO4hBlDQsLbEuvIuhwFrWzC96dVNxm49tx87xTfFpMbktAdzF
         4NSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794356656; x=1794961456;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bPv+WMWcyhJBfMpWVwqvVEabR827fX5uGDPeWoliS18=;
        b=Srf1pJMFOEfpSB1y0n7r/dRhQoSctkNg+YPsSzPD91+ZilS3TuMhd9THXZ/6DYPWBZ
         lmY4WotgB4Sh/iO6RbtJcBCSuVGpkfsrMHLaCeqWvqTg2vcBefLGketfrN4ZVVhHk3F+
         u2PFB1S3N34YjFOFl8vHDQY5IPW2O4nknwrsf7FMDNLWJTbEZNkKIh8Y4wsgKoEXyS38
         fHhCCqd+Id2EiDIXihW6IFeOAwAz81TfmUXx1v2uF1SbNXveOdvhmXh1UfLsDb4H4BGC
         /7hP/kqnsTFYf2ryvor5Vb8PBYpv4ER1HxZex1An0pcg3EJSZpiVi8rkuaGHGEv5NQNg
         UXRw==
X-Forwarded-Encrypted: i=1; AL+hErFWmFxlu+bDN0zT6Ei0mZ4bcJloJ8NZQ1LY/lvX9x/ZBlGnBoqndytNpkKaxuZLuluFQxlRYD1uw8CfKxI=@vger.kernel.org
X-Gm-Message-State: APuU4Z++Jyr6ZfQlNjp8U5KzhOpxU1Xr4lBT0NlnZC/6YiqoE2SlzDye
	QVy8xE2HDvDEgeMDvhtRJjPsJIqN9ny2O+vp2GBmapoRBWjvjD2LhC9OYGrqhiuoqoOatYICgHL
	vuM7tMrXc5CeKpQ==
X-Received: from iocow25-n1.prod.google.com ([2002:a05:6602:c5d9:10b0:9cb:8099:40ad])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:e88:b0:4e6:db9c:9a7c with SMTP id 5614622812f47-56b9891f794mr602405b6e.63.1794356656227;
 Tue, 10 Nov 2026 16:24:16 -0800 (PST)
Date: Wed, 11 Nov 2026 00:23:45 +0000
In-Reply-To: <20261111002358.1842967-1-dmatlack@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261111002358.1842967-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261111002358.1842967-8-dmatlack@google.com>
Subject: [PATCH v4 07/19] liveupdate: Add helpers to track the files that LUO manages
From: David Matlack <dmatlack@google.com>
To: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org
Cc: Alexander Graf <graf@amazon.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Christian Brauner <brauner@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Add luo_track_file() and luo_untrack_file(), which add a file to and
remove it from luo_preserved_files, and use them instead of open-coding
xa_insert() and xa_erase() with luo_get_id() for preserved and retrieved
files.

The next commit lets file handlers make LUO track the file they retrieve
into, which adds more users. The helpers keep the key and the -EBUSY
behavior in one place.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 kernel/liveupdate/luo_file.c | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
index e5d333649f76..91a2b74f71cb 100644
--- a/kernel/liveupdate/luo_file.c
+++ b/kernel/liveupdate/luo_file.c
@@ -192,6 +192,19 @@ static unsigned long luo_get_id(struct liveupdate_file_handler *fh,
 	return fh->ops->get_id ? fh->ops->get_id(file) : (unsigned long)file;
 }
 
+/* Make LUO manage @file, or fail with -EBUSY if it already does. */
+static int luo_track_file(struct liveupdate_file_handler *fh, struct file *file)
+{
+	return xa_insert(&luo_preserved_files, luo_get_id(fh, file), file,
+			 GFP_KERNEL);
+}
+
+static void luo_untrack_file(struct liveupdate_file_handler *fh,
+			     struct file *file)
+{
+	xa_erase(&luo_preserved_files, luo_get_id(fh, file));
+}
+
 static bool luo_token_is_used(struct luo_file_set *file_set, u64 token)
 {
 	struct luo_file *iter;
@@ -306,14 +319,13 @@ int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd,
 	if (err)
 		goto err_module_put;
 
-	err = xa_insert(&luo_preserved_files, luo_get_id(fh, file),
-			file, GFP_KERNEL);
+	err = luo_track_file(fh, file);
 	if (err)
 		goto err_free_arg;
 
 	err = luo_flb_file_preserve(fh);
 	if (err)
-		goto err_erase_xa;
+		goto err_untrack;
 
 	luo_file = kzalloc_obj(*luo_file);
 	if (!luo_file) {
@@ -345,8 +357,8 @@ int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd,
 	kfree(luo_file);
 err_flb_unpreserve:
 	luo_flb_file_unpreserve(fh);
-err_erase_xa:
-	xa_erase(&luo_preserved_files, luo_get_id(fh, file));
+err_untrack:
+	luo_untrack_file(fh, file);
 err_free_arg:
 	kfree(args.arg);
 err_module_put:
@@ -395,8 +407,7 @@ void luo_file_unpreserve_files(struct luo_file_set *file_set)
 		luo_file->fh->ops->unpreserve(&args);
 		luo_flb_file_unpreserve(luo_file->fh);
 
-		xa_erase(&luo_preserved_files,
-			 luo_get_id(luo_file->fh, luo_file->file));
+		luo_untrack_file(luo_file->fh, luo_file->file);
 		module_put(luo_file->fh->ops->owner);
 
 		list_del(&luo_file->list);
@@ -668,9 +679,7 @@ int luo_retrieve_file(struct luo_file_set *file_set, u64 token,
 		return err;
 	}
 
-	err = xa_insert(&luo_preserved_files,
-			luo_get_id(luo_file->fh, args.file), args.file,
-			GFP_KERNEL);
+	err = luo_track_file(luo_file->fh, args.file);
 	if (err) {
 		/* A retrieved file is new, so it can't be tracked already. */
 		WARN_ON_ONCE(err == -EBUSY);
@@ -788,8 +797,7 @@ int luo_file_finish(struct luo_file_set *file_set)
 		luo_file_finish_one(file_set, luo_file);
 
 		if (luo_file->file) {
-			xa_erase(&luo_preserved_files,
-				 luo_get_id(luo_file->fh, luo_file->file));
+			luo_untrack_file(luo_file->fh, luo_file->file);
 			fput(luo_file->file);
 		}
 		module_put(luo_file->fh->ops->owner);
-- 
2.56.0.542.g3ef89b7020-goog

