Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A0E4FDA7E
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 17:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790961310; cv=none; b=rYv8OiN/NwFEbB2B9tWZbSMEbIl0xjTihuIqXQyFkUPQqyDV/blfqMIDl9wxg9fTmklN/bUe40n/yrcRJarR1eiWmFVkDZn/z+ezhWEWEWS1bGHABHbpzpcKiw8YG61XcKQHHhCxateaSFT5vk0ckzfBJCmuYyXjyma6ooEVQkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790961310; c=relaxed/simple;
	bh=14EMFgsiFMdgbUFOogueXl4bVCClPF8xEpWoFi5WzUQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=DvNwmU0jpkfaw5Qqt4GNyeb3gpMKOpJ9JnHfYPng37cmz6kV2IHFWR0rFxSRXcT9u+mzOOjYfXuufpg0ttUCAIkhpeAtdPnI/ItWbWCFY9bLgrRL9TZfWoxgNRFcssuKp2b23n42e69Oq77cKQ3ZEAl+MUn/8SDHaO9QwPXjv+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-8227ad6ddfaso197209a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 10:15:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790961302; x=1791566102;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CBikqlH4+Pvhr/TPbSUYuPjAvbOJucjrVxXATrsZS9k=;
        b=jHmFtgllFjPxasdg5mJ3UFXT+Vk8rEybxLyQRqHU1d/qUeuTjPa4C32neJza8UG/Ip
         fld3azmBvC60pT+AsprPu52L+VAaHic80tclV2pURD91q91CF13/Ardxp/pU3SfdXql2
         /fDo0WUJmDpFGC9RoFrVeoin1EYa0e7I/1Eoxeof6+drdTtA8JllhcIdMd/qCP+yropF
         R6rUkZWI0n1cssjYxfM80Vy1lYb/lE+iprHlkprqYDtV2RtTh14hvsArvpONWZ8dbRDB
         WbJWdY4s/Uw+22pKiAIwS7A54TJjMbYHHuW/mkI/5H+5x5/hyLoaWPg/FeVV2WnYFxNM
         exNw==
X-Forwarded-Encrypted: i=1; AKwUvBxiBY0ZSAQZ6AyvLknkBLlHxOhiHlMDyG4wVhu1rZnafwwALLikmwFWpgKZn1ZRbKDCAKyBXz2gzvgHNL8=@vger.kernel.org
X-Gm-Message-State: AFuF++mj/YD42oT2GgQsVCseoQcWZcULJRLz+HDyoEDWG7ruaHTgzR3y
	pjAbZLkOSfhS1MzK0v/YlDFbD1rfMJVAsizkdgdrsC3++Xxcc26IN63Bdtx1p+CTW8mVRrLUXPd
	0D7Xf2xFgvfjn5IcovO8E2u6OaoW5iGL2kH4y7d5irM1gvRGw/b5sKvt7EpU=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:e85:b0:4f1:7c39:8a7c with SMTP id
 5614622812f47-4f52aeaa216mr2377157b6e.62.1790961302560; Fri, 02 Oct 2026
 10:15:02 -0700 (PDT)
Date: Fri, 02 Oct 2026 10:15:02 -0700
In-Reply-To: <6abc1c9e.00649fcc.35d151.00e6.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6abfe696.7503fbd6.2d3f6.0024.GAE@google.com>
Subject: Re: [syzbot] [ntfs3?] WARNING in truncate_setsize
From: syzbot <syzbot+0e70362e1726b5a7502e@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, fred@cloudflare.com, 
	linux-kernel@vger.kernel.org, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com, zohar@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit b80bed5c871a80151351342c065579405ce77145
Author: Mimi Zohar <zohar@linux.ibm.com>
Date:   Tue Jul 28 00:39:41 2026 +0000

    ima: Instantiate file_truncate and path_truncate hooks

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1302e035580000
start commit:   ce1e0223d8ad Merge tag 'devicetree-fixes-for-7.3-2' of git..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1082e035580000
console output: https://syzkaller.appspot.com/x/log.txt?x=1702e035580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=718e346eb0b8f38
dashboard link: https://syzkaller.appspot.com/bug?extid=0e70362e1726b5a7502e
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=143da725580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=113236c9580000

Reported-by: syzbot+0e70362e1726b5a7502e@syzkaller.appspotmail.com
Fixes: b80bed5c871a ("ima: Instantiate file_truncate and path_truncate hooks")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
