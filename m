Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9F73DA5D5
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791872884; cv=none; b=d2SpU+z0S5DOcmAfF0g/GbOStKecsiDjvgFL3cUBa7YRLabc945hDipd9/iCA6qH5g4AeZQMUxSWzx20XYCe0vhzG9Kg98W7fXo+UZk4Fxfk8NSlWmOgrDehzVTtCyqrIS8tVzRKUEEPI+4pm1O5068t5tC4vO9N4KGXYuClPGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791872884; c=relaxed/simple;
	bh=yIwD86rcbO0Vr528api+9GjzHDDOT2zWtfi3cYbhzuQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=eg1JTu0Pu+DIAIpfqaKyTj2mIYbMgWYjcK8pwv8k5frXUUmMcbSU/PDH+rYQlHD8exyDuTyX52lZmdWZJnCbi/GD2Eb68z/r0f/qhBy7N1GNnY7kwGfr+YWg5oy7zcZN2V2GT0bNXECqCyQNrywMgO1ftT1qV9ioONn/VisxOgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4dab94dc3e7so4530733b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 23:28:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791872882; x=1792477682;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yMb8whsbLP5fo37Jx1sYYrwzD3gyyWSm8kpaQ9zatK8=;
        b=FU8jjNjxE2cVjvHFALe0T6VP5a3UFKEaqNRYbjyId59dxmy+Keh4g1ortyhJHuIUKB
         wcnm9Kuwbqg/cOvPfZSR7c1wMvVPV7RGp6EfKx/XMHF5YdlYIwwtqUPYBk6EZ9RwIkc+
         GLNi8gliUy5jArL3yl+8CQMTOinbuXYUzRxHbDy6T7M1oEKo6ZaIpPgYQzw9IDmdSyXK
         CO/a61rJJAC4Tnhdiojwo6GR5vZDeqSk+wxDNkm7TUCoLvG18AkV/gC+wTOY0MtTuDbh
         CbbJ/m7CA6ScePjkPjbOwgGWvZFwFA58bp1uB4GimS8TQELfBXzi8JKiqz5ygBOCOE+o
         GXBQ==
X-Forwarded-Encrypted: i=1; AKwUvBz0WxdSJ+HG/XzA/zToHClV/GZh1estAXQiO5s4BU9WAVrOxGJzvqG5SpIjKx1lVvkIc6xcNviOWh7x+m4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKsEeF2WMlMxk4wa7W3otIiSYo5UJfOQ8G5DGYTYTGIqFnGKBwC
	aP5zali+aPKBI5IOVLk799rBkJou3JV9jit6qLcXb/hk94drvPdZ93XnNeyGIw74tNsI5h/h4LR
	caT9Zj3OtoFA0vGHY37kCgD3EiNaIaQDc7bFdY7xv10AD5CvkXf3zYhL/pvg=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:f04:b0:4e9:3412:14ac with SMTP id
 5614622812f47-50c516f087amr13552903b6e.33.1791872882524; Mon, 12 Oct 2026
 23:28:02 -0700 (PDT)
Date: Mon, 12 Oct 2026 23:28:02 -0700
In-Reply-To: <as3J6RH4QPNIl-b0@elm>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6acdcf72.8cdf6287.1eb53.0153.GAE@google.com>
Subject: Re: [syzbot] [ecryptfs?] KASAN: slab-out-of-bounds Read in ecryptfs_write_tag_70_packet
From: syzbot <syzbot+e4391e0d6e7c89b8c84e@syzkaller.appspotmail.com>
To: code@tyhicks.com, ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+e4391e0d6e7c89b8c84e@syzkaller.appspotmail.com
Tested-by: syzbot+e4391e0d6e7c89b8c84e@syzkaller.appspotmail.com

Tested on:

commit:         5b00bf0f fs/ecryptfs: fix slab-out-of-bounds read in e..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/tyhicks/ecryptfs.git next
console output: https://syzkaller.appspot.com/x/log.txt?x=11c0a999580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2b924f079099ba6e
dashboard link: https://syzkaller.appspot.com/bug?extid=e4391e0d6e7c89b8c84e
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.
