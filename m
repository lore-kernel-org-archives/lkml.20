Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F75148CD48
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790261912; cv=none; b=KDI9+3pyCUYW/agXfY1vYmGIoFOJFY7xq+9+/4RIKDWEM4GV+GhTenk7yzwnnoHE5DvZgokWZ2qyO/w92R8ZrjqSdUcYJ71c07av71BIw4jFyCxcDmj+SWUDQymDvP7HVAZSniCONe2wDgkqQffZtWR/iUDCC1KBPiIRSweFsrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790261912; c=relaxed/simple;
	bh=HvsHnujOTR+tbTjTf+ubB9CPmb7Zr3dQaWbiDzd/IhU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=KtU5RANEEaykhozGS2x6BgIudSM1PXaiWnQyL/84nyuDWuyq8o34Bfu8e5xO8FP1VBachjx7VdGUM/xjqLkpGwSNOwC12P6xLKutqaosm+hEr5BO5MYPeVno5dOuVxn2tHeagLiJ5MoiS9arWAYWz4Z0MtKieVNRUz2Cyq9X4Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b37620eb73so3363513b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:58:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790261901; x=1790866701;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=S3M+ar6YBdgnzj1/7DVo4OrJetEqbREAyuzbpQVgYiE=;
        b=KpSRqkAayyciBS+YZ/eWK5Y9Atb923I6/pR+vIewi9UohteHT+MH33KZrNBa0827nV
         zmFrrQkGtw7/rBPA2JAvB+cWvp00e49yE2Rwl9gAkD0N5wuiaA+cEq1gkAaJarEHXo7Y
         LOsxbNj7zIS5ctkT2ChkaGupZ1DBuvAWQvnVoL1/PvWGPgKyxG5GIbba6sasrDiRZlel
         LPiSan6jCAzA8eHvARNHWU65TrsUWUmpy16HRDoQNbekjQsBYCna6yzIWiHdZBXOqcuv
         IzX+6gusEGSOHzXqsADfc6Xydv5jYGMeZHaiHbbQuVQikWiK6fjdoKu9mzet+AUQSJdB
         IUkg==
X-Gm-Message-State: AFuF++lc8UY7eGJWLOVxy51HpA8+zqAp4qZHFvM3r81oGg4QeDEUGUHu
	AZErd4kma4MLs/zHmi2nC5wlKnsiA2FtWmD+T0LNBR91hsf0PXYHJZf7GmAuiSffx8nj2/cq1qM
	MAAQGTNqhWRqGsw/9B10TWH9oqf/lfrCjqT7GX9d+pPGwIpp91gbQBI3fMdw=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3306:b0:4a3:f4b7:cbdf with SMTP id
 5614622812f47-4d72e671f07mr3044756b6e.15.1790261901097; Thu, 24 Sep 2026
 07:58:21 -0700 (PDT)
Date: Thu, 24 Sep 2026 07:58:21 -0700
In-Reply-To: <6ab41129.e548f532.1ca396.001f.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab53a8d.7428d045.30104c.0007.GAE@google.com>
Subject: Forwarded: [PATCH] Testing ppl_conf for a null pointer
From: syzbot <syzbot+75d7e96ad03ac2dbbd9f@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] Testing ppl_conf for a null pointer
Author: nsvatoslav515@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 50d05c7c76c9

Signed-off-by: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
---
 drivers/md/raid5-ppl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/md/raid5-ppl.c b/drivers/md/raid5-ppl.c
index 7f8a9d3fd578..e54ed4e44b0f 100644
--- a/drivers/md/raid5-ppl.c
+++ b/drivers/md/raid5-ppl.c
@@ -535,6 +535,9 @@ void ppl_write_stripe_run(struct r5conf *conf)
 	struct ppl_log *log;
 	int i;
 
+	if (!ppl_conf)
+		return;
+
 	for (i = 0; i < ppl_conf->count; i++) {
 		log = &ppl_conf->child_logs[i];
 
-- 
2.47.3

