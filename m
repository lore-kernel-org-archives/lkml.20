Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AF037E5D6
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388313; cv=none; b=Z3T0fQVnkmAmDBvPWwvg+v5DofUVVO0ZQO8CCK9AS1M22wbWKUPDusa26Tnog5YyMLssKjvwXhuUrVcwSFjHpNlroXjcUJ/+VqRA7y+CspzjcKPgA0NudzPGixmdHCXScBcYnKjOCICxp/cJEN1WuKn97dUP4kBsH9TSo5ucmgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388313; c=relaxed/simple;
	bh=z8UKOT4LRmUx0tEKiphbmXg9dhQVXWkkDs2CUSv6iiQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=PLRe1Jkr+3a9U5Ki4DNpjtlrIQ5UYI+y4ruaRyMOz86V5yECxEtcwF9wto5EvLgVJOECeFFqTJnFGzcUo0jqQqQiBglMEdspn+X46505U69Yt4Jv6fq1ttfXdD/oUrkXgrz83l6fG9IZ12RJpAoHqIXSsi8WIWO/TNtknliDG3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-47cfa971c9eso4601409fac.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:18:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388311; x=1789993111;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1tdctKTfGOEx6u0suuhPuX0byzhb6tnOSenslaiXVgc=;
        b=HPWX1WbbQSF3gannMApRCGQy+0xMmvG9rI9mpXz5EJMTn7vynD/Fue5CWbyr938kmG
         OU86q+3+/XGzcKxk68hZ77SwuyRRkQOGtt4dpgCFzcVd+UGlpdP07snbU8u7Sdf6HZH/
         IxRYG44vtUNlZcmGHWFtR9lfW+5UvDYe2SR7S555JWsZHGQd3pji2KE2xHSq2OOsKUwa
         rg5OZmAv/8v06AJpDEOvAFzl6i2sQm2GVFsNRDOuKru2eLGBhTGaoC7POjOEeHTNaO9L
         BQIB0Uqstg4o8WSNUZaQQXMRI1Jm2AAN8HGBjl9OpM118vUgYZzCA7d8N6rpIp52OTVf
         UWlg==
X-Gm-Message-State: AFuF++lmlJ4Vg4EyoF+B9pHsrDUIdP3aPQVePBJcieQJ5E7naM9HXlwh
	Uwcx3cEaDC1kN4olK9+b0AAYEs0RN6Vqu2+cSVHwRDbhVaajLxmaV1GRR5JtR2Lqg/ggmtlarm2
	/M484MRjP0gfrmxdtO3zUdJhI4o41NdQB1vfd4OB8awLMdoB+tZaeINLKTuc=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4cc8:b0:6aa:e367:a3e2 with SMTP id
 006d021491bc7-6c3cd7dd88amr2569088eaf.19.1789388311271; Mon, 14 Sep 2026
 05:18:31 -0700 (PDT)
Date: Mon, 14 Sep 2026 05:18:31 -0700
In-Reply-To: <695faa63.050a0220.1c677c.039a.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa7e617.f81106d8.2ab401.004e.GAE@google.com>
Subject: Forwarded: [PATCH] UBSAN: array-index-out-of-bounds in dbFindLeaf (2)
From: syzbot <syzbot+1afe7ef2d0062e19eeb3@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [PATCH] UBSAN: array-index-out-of-bounds in dbFindLeaf (2)
Author: jchuang26@m.fudan.edu.cn

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git f0b9d8eb98dfee8d00419aa07543bdc2c1a44fb1

Reported-by: syzbot+1afe7ef2d0062e19eeb3@syzkaller.appspotmail.com

diff --git a/fs/jfs/jfs_dmap.c b/fs/jfs/jfs_dmap.c
index cdfa699cd..53642b1ec 100644
--- a/fs/jfs/jfs_dmap.c
+++ b/fs/jfs/jfs_dmap.c
@@ -2971,7 +2971,11 @@ static int dbFindLeaf(dmtree_t *tp, int l2nb, int *leafidx, bool is_ctl)
 			/* sufficient free space found.  move to the next
 			 * level (or quit if this is the last level).
 			 */
-			if (x + n > max_size)
+			/* stree[] holds max_size entries, so max_size is
+			 * already one past the last valid index.  Use >=
+			 * to reject it and avoid an out-of-bounds read.
+			 */
+			if (x + n >= max_size)
 				return -ENOSPC;
 			if (l2nb <= tp->dmt_stree[x + n])
 				break;
