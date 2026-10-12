Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E54340417
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791823807; cv=none; b=t8K63xYfBFKgL25FWsiaEMRquvEBWBa0Re25jV9gwMcpWz32FQ6MvR300s41vjUns8+E43o/dp+0NQPeXMioZXlpaJ78HK5c+k+0cxFzLlYw2JfINFmjkJcVt7TllCEU4YoBgJ86TbH8aO31t1CCUp1hftbB8IGDmk2AtxmHesI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791823807; c=relaxed/simple;
	bh=6Z70wDoT/5a83+5AkYDmMtORIbigJzq77HfyCnclnO0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=SVMaRYmfTJD5xVpX1e+HR6UT53iHjRgkn5+l8gt5XquiDz8rFhKQgrDaC+79ynhpmYxuGzOlREkIxbXg6akyzx4RDBL2IkExrYu1XLGPOv9CP/fJUkIbVAq4nJgn8oB+GbioAwBw+h/FYB+22wP7QB4lJPhxzqnpHsWZ0OpbIR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4a7de733fa9so3656784b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:50:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791823805; x=1792428605;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iHk7Hn9YMA3vzaCNuo12jeQBxbUUzoGWSox3nek4ris=;
        b=HErfh9y55XjIDmd86nBOUK3RLsHKY3VeiW8Fys+KeEKbNjpVYElC0UP1IkJMUSVRF7
         dA91QaRYFbJf4cDi0DP268zQItZXUdo14yFZp/8oJB3cMk2OB4I2Y8jkCUwvg3RDd4eh
         gMj27xAWVqQBCuUZQ4RQxfgTho4DP1/+BsAczNCOBzyBBhz03Yc5Ob0GFZxIQfteOcCj
         UZpIkBECt151cp0XxevLL013+7Iff3/VJar+9jVz8QKvGSvYFzaNFVJeh8M+0TjI9nU5
         //M+J65zB6a7m98hFbGpcIvE4YWnoxZq/s/B4eA9X2LYMBqz87GOC1pIN635Kz68Jmj5
         5qYg==
X-Gm-Message-State: AFq9FYI5E92OaTvONIjFo9QrKVJ2awSgW6LwGfyhyZkvNcz/gpPe6tBF
	9ajfbirFKBiLOYADkbwstv+wYp71cXNkfSipmYkJLeEsSeyr3hhn89zIuWiMmN3PTOWWS3xwlvO
	9jnb+s+TFytxXjojO7NRZYiGHpWVxrA4ctX8OdFiRQ0gx7ygQIZX4C0g451M=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6f8f:b0:4ea:686e:fe86 with SMTP id
 5614622812f47-50c5b464a7emr9329026b6e.63.1791823805546; Mon, 12 Oct 2026
 09:50:05 -0700 (PDT)
Date: Mon, 12 Oct 2026 09:50:05 -0700
In-Reply-To: <CAEfrx+AZJwj-=yiMc+EjXdNKcTbMn9cFRyUdArmWX47kiTYV-g@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6acd0fbd.8cdf6287.1eb53.012f.GAE@google.com>
Subject: Re: [syzbot] KCSAN: data-race in __se_sys_inotify_add_watch / fsnotify_handle_inode_event
From: syzbot <syzbot+181b8b439f5207144b16@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, spannme41@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

init/main.c:14:2: error: ASDF


Tested on:

commit:         24a19b95 Linux 7.3-rc7
git tree:       https://github.com/torvalds/linux.git master
kernel config:  https://syzkaller.appspot.com/x/.config?x=ea1e6d8de13bab08
dashboard link: https://syzkaller.appspot.com/bug?extid=181b8b439f5207144b16
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12ecb5d1580000

