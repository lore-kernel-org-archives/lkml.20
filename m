Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9275A299920
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789132566; cv=none; b=hVmVgzSzgqbSbIyTt9S4tAbcQwydUbZrjZcE7bWmnjX7Fmv//K6woO738UiDBykvsXyzstsg4y5BwCfYFoa/DeBdP7v8Oa4nBKTAFCcLUDOUwL+jmEfXqa3w7fFIOVzUcuqdgLDlgXulwc7vyuyViaU2/IaDCX1eM8Pl2GEsfOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789132566; c=relaxed/simple;
	bh=jQfsFxxR5mTtUbZs0jiUPn8X93RNyddXKgH44kS9Kh8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=iEuE9pyaLdzY8jXzUIGrEbDg4ns3dLw6SekX7cJw2EDKXAcsWM/gOw/07kfMqQBSVS5+irpKzg7Ap5SSnVOj4pzlgxe6K6R96sGhADMpoY3O6wZ3clo+ONDHDU7Z20Npau0kFFCsi7fYSwX/hJiSgz6mkk99FPVaWIJWOnXl+yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6b139665345so792370eaf.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:16:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789132563; x=1789737363;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tvRN+cR0UmHQsbYr+a597Kb8wEfbzvb7Yii8yQaqX+s=;
        b=EFwu/O0uqT6FrvwI536wViEXUxlZ/OfbsAa0K1CfxesILj2ivWei56kFCTd8XKjUqG
         fFhZIIZG5pvBOhSNI9hhqpdY9RyR9uwCjvaOh2+/qK2eRjvbJfF/2kvL0eta+zYZqn10
         DzrB2oyDu4bp2kHd9DpeswVjcYITqsSEezvokMg+U/tNHlgaxav4HhNqWkGVFU6LL2WR
         uwNtaiRqfBx0VxDL7Mam7N0ZjaOGdnm9dtv/WxW6YLZb/NkcUfI8rXmDSH+x062XOdK0
         xwAP7D0vm5VPwvv8L+P/jvgpoGHTT6czgEYI/olIeMuCL5SWzmveVyPGZRgfufzbqHxf
         Cmlw==
X-Forwarded-Encrypted: i=1; AKwUvBx5kVCLEj1MXoJWmFogWx0cL3ouT/gmKE7LWREqBrOIFCXKqjNZ2gSC1b4qwmt1u4BG2e9Xi6v78I5wgng=@vger.kernel.org
X-Gm-Message-State: AFuF++mO2kX62Z58HarPQg7BSIcIWIF6Fwc8ktN5zZg8Wpa1hz+P/S/a
	vwNhU4uAfK2gxBok3HGzXnbhXNC+P3U2+Fkop6eQp+PpJVhGrKoVQ3kp08fYmdvtfXZwfmxEUz/
	AHtR2mlwWkbyDaJTWcIad59lp4JDYjauc7ua/h7oOFlVUlxbK5CkS5zKWAKc=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:8591:20b0:6b3:4a6e:adf8 with SMTP id
 006d021491bc7-6c0ba72a200mr2106504eaf.18.1789132562952; Fri, 11 Sep 2026
 06:16:02 -0700 (PDT)
Date: Fri, 11 Sep 2026 06:16:02 -0700
In-Reply-To: <6aa3ec49.faa14f7e.2f7ba7.7c6fSMTPIN_ADDED_BROKEN@gmr-mx.google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa3ff12.f2639fcc.29487d.002d.GAE@google.com>
Subject: Re: [syzbot] [fs?] KASAN: slab-use-after-free Write in config_item_get
From: syzbot <syzbot+6b16e3d085833cbf3e25@syzkaller.appspotmail.com>
To: jchuang26@m.fudan.edu.cn, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+6b16e3d085833cbf3e25@syzkaller.appspotmail.com
Tested-by: syzbot+6b16e3d085833cbf3e25@syzkaller.appspotmail.com

Tested on:

commit:         a7c1290e configfs: pin the symlink target's dirent ins..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=1288c925580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6d794b10c2a1184e
dashboard link: https://syzkaller.appspot.com/bug?extid=6b16e3d085833cbf3e25
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=177f4925580000

Note: testing is done by a robot and is best-effort only.
