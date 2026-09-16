Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9443D9DAC
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 22:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789598409; cv=none; b=NwJSv7yK33qHhqUoxh34nRbY29M/xIcHHFZrBtPzevVR5V5MRPb6YijwYozKt+5bz04I6/hGWOFRKekqFiANHgo/tA9IK3yNVqZ2i04KwCyQHUx8Tc5Wxi9MmZAKD1sx+8rb6AFPZP5DmEkIwYrljmW48CXdw++x4HZqVAt+uzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789598409; c=relaxed/simple;
	bh=aY0C3UZNWISVo+SEYdMA+dpLR2TC50hIsVNTH/1tMWI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=QIEW3jgM/fY3Q119uX9I7ECqRzllqS2F2T6w69eyCkfkHSk/ITlsMAsVNsSf+uYFopTgcrXGUrOHvvT70evE5NgBvWc5vEPSTP7FH2cqJc60Cujxdvsze7XUzoIo1OW0HwjEj85qgwzz5Y3UVXKYWwMOh1/RVqsS1GCma0ybuhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4c9ade8cfe1so226330b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:40:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789598402; x=1790203202;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eWbhpWk71ccWdwuOVmq402NHgmE8BaqjoYuvIsrzF3g=;
        b=QMupuwtg53uP+HeRY3A3KLD3ayyjlM69mQjPI/SuJwcFrRFtOLmMfXrEVqeemSunEI
         ikkzOHgT+WCyWpWTr2FNa6Qx6VZK2DCwAto+W8hxxm6so8c5IR3pMMGjnIzabQk9J6bR
         QvBTno0SD3vGJIjlm3zEBlHYjrZhQuXUgKiacAYilqxE5lgfU1tqVXjIu878C+5xowUt
         GD0av2qqIbmtL5j/gvvreRaGQEKnb33TIJcaNfmWnOevecvCx1WraAxU7NduoIlnX6PK
         AaTeRwUDdKkvrYaLcODx6Zc8gsoOhaQkJ29QLJGNVKmq1z9CXx0H7pyeu4Jqhdwl7E92
         nRpA==
X-Forwarded-Encrypted: i=1; AKwUvByB7PrsPsBtdUy5O4jtqP7obKF7SY9nA4M06Ub2MU+BMmmtoQbGW6zBbCBnIiqk+5Z800lWUWaz08c4hEE=@vger.kernel.org
X-Gm-Message-State: AFuF++m0U/lELyrK+p3sm+XTeliaZysq7Di/QSZw0LIDsGqNahB9qFEJ
	EnIMn468R+hACUgCHNyXAlz9vpaCVDS/teh184gXj2/3idOAwt5zL18zXvKMvplClYvbKaKmzWL
	hAwdphHeKRz3KkxBxsXqzUK2l94KmsYGG2+WdcsXv86s8G/eyyvdgbXAYKDI=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:5087:b0:4b8:4703:db8b with SMTP id
 5614622812f47-4cb69b976f2mr1049869b6e.20.1789598402258; Wed, 16 Sep 2026
 15:40:02 -0700 (PDT)
Date: Wed, 16 Sep 2026 15:40:02 -0700
In-Reply-To: <6a1b9770.fd5edf16.2e7427.0008.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aab1ac2.71f81b7d.278072.0000.GAE@google.com>
Subject: Re: [syzbot] [ntfs3?] possible deadlock in page_cache_ra_order
From: syzbot <syzbot+8bd419f88e25ab12cb75@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, almaz.alexandrovich@paragon-software.com, 
	gality369@gmail.com, jack@suse.cz, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com, willy@infradead.org
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit d62cf685d12e95cc0a4122c43cd9f0eb8bba0b4c
Author: ZhengYuan Huang <gality369@gmail.com>
Date:   Mon Apr 27 07:26:50 2026 +0000

    fs/ntfs3: hold ni_lock across readdir metadata walk

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1540dbf9580000
start commit:   704340f1cd0d Merge tag 'x86_urgent_for_7.3-rc4' of git://g..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1740dbf9580000
console output: https://syzkaller.appspot.com/x/log.txt?x=1340dbf9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b454dc6b1b7acd30
dashboard link: https://syzkaller.appspot.com/bug?extid=8bd419f88e25ab12cb75
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=154788c9580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=134788c9580000

Reported-by: syzbot+8bd419f88e25ab12cb75@syzkaller.appspotmail.com
Fixes: d62cf685d12e ("fs/ntfs3: hold ni_lock across readdir metadata walk")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
