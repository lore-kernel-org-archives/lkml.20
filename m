Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C4A35292A
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789382609; cv=none; b=cyZ512DVQoUEX2ejDuHIG2y1ncbEC2HKA7but2TniwWVMyQNwuvWEsq7yxegLpClzlps/QM1AYYZSDJNQrWnsmsfFaWNa+vRLnPB2Rkzy8Yrf+DgukFjX8mM+LRWSkj7rLBgRzeTeFsyz4wT8j57z+6tMHs9RLILTlJM2DgLsmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789382609; c=relaxed/simple;
	bh=kFtV0op8BFDK9PEJ70qDKwmxH8svJFJQwVVdjVKAMuU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=B7djNnkCATbMm7sIuC93LCLvpZxjQlinxDh8kVuNerl9B7FIq6OICm3zcYy1hWRIx8HnIKA4RpdRLFF1maUHyMIlwN8eIsad/8Ew4xPQTCCCrGqK50Hmrl9svnp1olkzvl9xur8oIFe5NlhgbmyaIE3HeXFHphHdGU7o+0JDALo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b325074c26so4884759b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:43:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789382607; x=1789987407;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=C5f3Ta0fB6GIy+tJjJYb5Uu77jzx4B0Qt7pFl7Q37Iw=;
        b=Uyc7NxzBH8F/ZDgKKaApb18P9O1v/znZbtUxLAVmI4smABejul97Sc4FUiZPE/2JAc
         5Fo7PT52YBpqI1Rsfk4vnB4j6hgf6Aubn7XqPHKyqfDmP2ZLvjUFwCy0fqmujQFgelL/
         ca1hbgpagcuOuDcTR//swypJrWatOvYLrsss6crp82+ie6t00/103oA9HC6KrCN82ZVe
         eeH+cPBG4sNxinXXQCXCHZUItWkjw1kn0cKZEZpv1WzdYDMeoIyRCsDwKsYdnpNYf3LC
         MyE7FIQuYeLqNfamiLqBqxNtoTUvvRWGmWvGxG8hBgkG1h/wg/7X/wnekbuLiPFEOR8m
         SEXw==
X-Gm-Message-State: AFuF++kII9XACkclW2FKlleN23K1VeP+iwHLThDRzz3WJK7/vMM1ETlS
	rCPcMzaCCSskuDOwSx0oJiaIMEcYa9pI3t0vJIkbbOyrlBSSz0V+ID15jEhURWAOksohTkrAJkq
	Ck0qxqMJJ2NBvzCR5rUMZr+0ehAnKSDVbsxkW1Hq3St58j2dGui/eipZf7uU=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:690b:b0:4c3:7695:1178 with SMTP id
 5614622812f47-4c7b2dfac87mr1122397b6e.8.1789382607538; Mon, 14 Sep 2026
 03:43:27 -0700 (PDT)
Date: Mon, 14 Sep 2026 03:43:27 -0700
In-Reply-To: <6a9b44e0.a5e650b3.363816.0002.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa7cfcf.f81106d8.2ab401.004b.GAE@google.com>
Subject: Forwarded: [PATCH] BUG: sleeping function called from invalid context
 in null_insert_page
From: syzbot <syzbot+95fdab36405e5ffdb680@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [PATCH] BUG: sleeping function called from invalid context in null_insert_page
Author: jchuang26@m.fudan.edu.cn

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 893e11787f78e43b534e252249ac3fff4d1333f8

Reported-by: syzbot+95fdab36405e5ffdb680@syzkaller.appspotmail.com

diff --git a/drivers/block/null_blk/main.c b/drivers/block/null_blk/main.c
index 6beb1f5b7..e22e79b02 100644
--- a/drivers/block/null_blk/main.c
+++ b/drivers/block/null_blk/main.c
@@ -1861,8 +1861,15 @@ static int null_init_global_tag_set(void)
 		tag_set.flags |= BLK_MQ_F_NO_SCHED_BY_DEFAULT;
 	if (g_shared_tag_bitmap)
 		tag_set.flags |= BLK_MQ_F_TAG_HCTX_SHARED;
-	if (g_blocking)
-		tag_set.flags |= BLK_MQ_F_BLOCKING;
+	/*
+	 * Shared tag sets can be used by memory-backed devices, which may
+	 * sleep in ->queue_rq() while allocating a page.  The flag cannot be
+	 * changed after the tag set is allocated, so always mark shared tag
+	 * sets as blocking.  blk-mq will then use an SRCU read lock instead
+	 * of an RCU read lock around dispatch and the allocation is allowed
+	 * to sleep.
+	 */
+	tag_set.flags |= BLK_MQ_F_BLOCKING;
 
 	error = null_init_tag_set(&tag_set, g_poll_queues);
 	if (error)
