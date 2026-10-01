Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F7C30C147
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 21:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790890234; cv=none; b=J/35h27gHORKPukcuTHMo8isjX1Iy0RhZ1jED7MSCoYhjMPDj6M5EmQ6l3ZP+S+GUhWFPv0lKbebxT83rf5V9XSLQiP/jwfCA4zaEqvOryPBctXQljXTnu1oKBlSd5lg+FFSv+nu2qTNmg978DJFG5yto6nS05IdgCkqunqsYOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790890234; c=relaxed/simple;
	bh=xQHKqYkxELcm+WN8MsPJK1Ac5MnoTEVaXRgZ99lyjdg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=j9CPHoQGs/gwIlwvMh1LZrXEUB/Sg03QTuApuibHN4N4es3IZu0vSMADUhkamubtJWGoXGa5v9U6WuJyNzn2BByPEFDnJiV37uIc0F8Vv3aqtkFP3F6ncKnkvPceKKKlW4dSopNHay8jeecuNUN5PuNl1Kn3eAmxfR+1qw7SkLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4cc89e86e4dso10668763b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 14:30:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790890232; x=1791495032;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2Nd2H3jrTVOq5dQBV1RRRYJiXpB5AZXe3Nr3NQwG3cE=;
        b=FZCS9Mxi0M2ncyx4vJHJazYEyXsTUUBF0NGhpwUf9O3LeToWzpF60OfBSX1SInALA9
         xFmwDlX82PQFsnXQ66B3wS4BHN3lbxv/sYGWxSd7g5u2/7S7MMcbvsBP10twOkYxxqJ0
         o8LVw+gteEqnEDiuRFjZr/ehzSy2O2BcbqweUOJj3O/YBWTlTHSyOlFnWe9d2IZATrLH
         9BSWw/IDxUf72hFmNfdtd6RaT7xITfZUuEWSZelSUAMDDrGEEEe02kEx7EOouQnbYsk6
         Xb4FHyK4aBOTI6L1DQPwN3sQorCLRfjAITm91QgJunrgwwhteOcVKyhjFtOS5WRq2gJN
         H+Hw==
X-Gm-Message-State: AFuF++lfEnFS0+5tlFkPBsN6gH4TNjmSJqysUNQ0cLUISgWx1Bswo64o
	5ajhFbfwxVedRXkKK9V2Q+SJDUefFr6HwqW+3npcwk3IFFRahFPSSir+t6Dnmb4FffuZamu47z6
	I+r2tYP8jYC7aHH/u3tGBqUNWHeyMheJXgsjlKYpp7/zcZ6QEx3hW0mShCZ0=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6902:b0:4f4:73a9:f831 with SMTP id
 5614622812f47-4f5292067d8mr422867b6e.19.1790890232139; Thu, 01 Oct 2026
 14:30:32 -0700 (PDT)
Date: Thu, 01 Oct 2026 14:30:32 -0700
In-Reply-To: <6abae226.69bd487b.a6f8c.000a.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6abed0f8.b50370da.302ea9.0006.GAE@google.com>
Subject: Forwarded: [PATCH] ext4: don't trust on-disk rec_len in dx_move_dirents()
From: syzbot <syzbot+09bec78ee77613a3efdd@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [PATCH] ext4: don't trust on-disk rec_len in dx_move_dirents()
Author: adrianox@gmail.com

#syz test: upstream master
syzbot reported an out-of-bounds write from do_split() while a directory
is converted to an indexed one:

  BUG: KASAN: slab-out-of-bounds in dx_move_dirents [inline]
  BUG: KASAN: slab-out-of-bounds in do_split+0xf9c/0x1de0
  Write of size 90458

dx_move_dirents() wipes the source entry using its on-disk rec_len.
That field can't be trusted: on a corrupt block it may be garbage
(0x6161 here) and ext4_rec_len_from_disk() turns it into a huge value,
so the memset() runs far past the block.  The entry is already copied
using its own real length, so use that length for the wipe as well.

Closes: https://syzkaller.appspot.com/bug?extid=09bec78ee77613a3efdd
---
 fs/ext4/namei.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
index a6386c1d237f..71e9e7c9a7fd 100644
--- a/fs/ext4/namei.c
+++ b/fs/ext4/namei.c
@@ -1860,10 +1860,8 @@ dx_move_dirents(struct inode *dir, char *from, char *to,
 
 		/* wipe dir_entry excluding the rec_len field */
 		de->inode = 0;
-		memset(&de->name_len, 0, ext4_rec_len_from_disk(de->rec_len,
-								blocksize) -
-					 offsetof(struct ext4_dir_entry_2,
-								name_len));
+		memset(&de->name_len, 0, rec_len -
+		       offsetof(struct ext4_dir_entry_2, name_len));
 
 		map++;
 		to += rec_len;
-- 
2.51.0

