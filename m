Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5BE438FF4
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790078707; cv=none; b=EwbeHyubbQDQ4h2A8O9zlRxr2yEZpp5ES/AsMnHbllTA1/Jy4PXVnhr6BSkelXjkFyeTjJdipFYd996eo4JzFiprUC9W4am1eVeqIknEysEwFzFThzzWK4YNItdosOHd0ttzOXwpTHAs4xbvGwR4+ZWtx1uPZoHoqaaVs88lNBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790078707; c=relaxed/simple;
	bh=sbrqIZ/Wq9ON2FfOM7MDondaCHC0pmnIX/66IPgi53U=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ii5uIL05ksU2M3RhGN5xqDcUauSmVNCOXVCt8JpEp73RpsbazRGga444Zlu8ycC0LpQ9rVWV0pk8WSpIfshV4osnAUVbU1sX0fMOjXioYTAQhm7wMt4hCH2mlly56VzRDq1TouNAWktNUEVlYqh45g3P11/RKcZn/cMqgasWUMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6c2c5c1f843so1276619eaf.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:05:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790078705; x=1790683505;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HvpXUMz+Z593IRVWwsylQVlzJxelyk4yga1z1rA+3tg=;
        b=Yq4SvnvXjgDUeMWoxN9My8RUpfXsmI5eUJPLix9kSfVX2A44e1/OoYlg5ql1X5C9dn
         hzJ9UTS1lALStRU7oAVh0dKfIS89Caawgl2/uynnvsn/ssPYX+JcTZxk/UGjAMUZMy0S
         y9sBj0rnod6hqlevQajqlC9W2w6wR1UzxvndPLFyegQEFzlTUw1FvFBBU6znI80ABlfv
         ztZh5EWnXHjW8zgj4acY62AgrkmuKOTBfIn12hBnTVl3SY7Gm27IY3ucWa5eEs3zV4Uu
         KJnZDylMw39qnKtGUzp+NuJKe8Pnf3eXDc1GgbrEYlWhu6QQKCMVDDLs/tL6TNOcbFlV
         6yQQ==
X-Gm-Message-State: AFuF++lQakCDYCOBXiADh0zXBXwKVFusV4a/3wMkgH+qXXIRO7hVyAh/
	SeNI3bdPJkqlI1oTBM5/6xJebh7qoOdxLQ0OoGThM8N6taAhJkTa8aRCiI0qKKevHSR9xKIOz4u
	PsIHYWqaWH/gqRepcVgMdor7Lu9eeuXfivXxVeH6XCBhsRk981h8X/r9QZ0A=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:200f:b0:6b5:ec2f:3568 with SMTP id
 006d021491bc7-6d15a450c8bmr2191386eaf.25.1790078705187; Tue, 22 Sep 2026
 05:05:05 -0700 (PDT)
Date: Tue, 22 Sep 2026 05:05:05 -0700
In-Reply-To: <6ab1bc3f.a6af0033.177e91.001a.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab26ef1.a6af0033.177e91.001e.GAE@google.com>
Subject: Forwarded: [PATCH] md/raid5: fix NULL pointer dereference in raid5_has_ppl
From: syzbot <syzbot+270624bb31d478afe62e@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] md/raid5: fix NULL pointer dereference in raid5_has_ppl
Author: nsvatoslav515@gmail.com

Check if conf->mddev is non-NULL in raid5_has_ppl() before testing flags to
prevent a KASAN null-ptr-deref during free_conf() cleanup paths.

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git f0100363d8c3

Signed-off-by: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
---
 drivers/md/raid5-log.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/raid5-log.h b/drivers/md/raid5-log.h
index c8332502669e..5a144051b142 100644
--- a/drivers/md/raid5-log.h
+++ b/drivers/md/raid5-log.h
@@ -51,7 +51,7 @@ static inline bool raid5_has_log(struct r5conf *conf)
 
 static inline bool raid5_has_ppl(struct r5conf *conf)
 {
-	return test_bit(MD_HAS_PPL, &conf->mddev->flags);
+	return conf->mddev && test_bit(MD_HAS_PPL, &conf->mddev->flags);
 }
 
 static inline int log_stripe(struct stripe_head *sh, struct stripe_head_state *s)
-- 
2.47.3

