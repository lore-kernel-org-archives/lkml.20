Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B8333B6E8
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 09:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789292167; cv=none; b=ti0Y3hA1KEDunz6QLfguIwXR9bjjhNm29zIZSZeVrxCyBYpondD5+ndOysBYnLhyvcDch7H29jHQJjk495ERrGKWLpQb0fI57a9yyqvw9Z2DQMhSFXDCM509SJHQIbZcn00QimNmTDavIxYknhaaAkDi9w9Q17m+BrtC/cU9iKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789292167; c=relaxed/simple;
	bh=/933sygnbIg/zraniL/i509YzLWtSLMoKbn8IcNj/vQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=arYjRjNMT9silXcimk9SexF8qRVFsODNWFiUxi4PsrNsiHdAcCPiS5cDnTcR+l4FvIVT9MqQSToeMwBqj0HGUf1cFrNV5uP6cjRLJRqqJp8cxyQJOu5lnaIX2nGX0OyLwP9COrGNHBxwEouvDZbw7SAutA/sXCPODa8uMRXJ5Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-8051cdb9338so2470043a34.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 02:36:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789292165; x=1789896965;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=R6lvEEIHBZ/jqRT5djMV8LnUIadStTua6TYmXXtXy14=;
        b=cquhb79HY4EXLHPRrdkAfeS7jEcNMRABsILksHJIvqeeh3RAy7Wwc/oE1CZLxMt3jg
         Xf0Do3qFQrh6ySYWpE0Epz1TxmD9VtG91Lm2ewLWJKFINZMMwesNyxixaanWivhFD1oK
         VY7CCvRbFU178TSGn94QzZObQSozJEXl7mJ5CgIuzcrkAFzKKxCVMKkv5rXtNn3JmESt
         8esX0R5EyvMiiqMmmR9wvF88GFzxfW4HKWiHVXFLGtSdTbztZVz71nAIxxd4wjNc+nSN
         R4WYdQPR9NDzWgwXP4/5BHZUytmCU3aDy/+PwoZ2JwOc6x7MWQSU046jbjAx2lgxW6Co
         SrSg==
X-Forwarded-Encrypted: i=1; AKwUvBw1Faf6A9aD6GndFrBHuCAYa8QDg4THLI6fDaII8ufAGAWTh7AmYR5w91aSMiknNaXZnkxwIFmfv5Jq+MY=@vger.kernel.org
X-Gm-Message-State: AFuF++kpv81lhDK5NPgiWNHVBfv93x3n+teWI0IDTPHkjvELEZWbD5Gx
	c6U35++H0Wc5tc9q3A29eaY/QZXKU3OS1EtGIQXkDbvvKcRmr6ZGC9htURcHtEn/FH81X57EiXq
	L5MdUflVx5pX5UndTzSWVG3TUn9scUWRJ9JvCzuzNnPCfYCXGuPQjtT/xOkQ=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:341a:10b0:6b7:83d6:2921 with SMTP id
 006d021491bc7-6c0bc1d9278mr5192100eaf.36.1789292164917; Sun, 13 Sep 2026
 02:36:04 -0700 (PDT)
Date: Sun, 13 Sep 2026 02:36:04 -0700
In-Reply-To: <6aa66724.84443fb9.2aa3c7.59f3SMTPIN_ADDED_BROKEN@gmr-mx.google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa66e84.f670cee1.72fc4.0010.GAE@google.com>
Subject: Re: [syzbot] [kernel?] BUG: unable to handle kernel paging request in cirrus_primary_plane_helper_atomic_update
From: syzbot <syzbot+2442951a6abb004df963@syzkaller.appspotmail.com>
To: jchuang26@m.fudan.edu.cn, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+2442951a6abb004df963@syzkaller.appspotmail.com
Tested-by: syzbot+2442951a6abb004df963@syzkaller.appspotmail.com

Tested on:

commit:         958f35cb drm/sysfb: ofdrm: Fix is_avivo() constant com..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=1092d5f9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1d67342c314f228d
dashboard link: https://syzkaller.appspot.com/bug?extid=2442951a6abb004df963
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1243a925580000

Note: testing is done by a robot and is best-effort only.
