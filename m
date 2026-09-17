Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9226E4A441D
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789637105; cv=none; b=ev0qml/5zoWfrcNFLlC3r6sQdnxUuj8kUYFkT6S9cLW1f2ZpmOgFNkNQ1q+1lThIUrK+dNu73Tp59RjCic84iTp0L8Rte8EHW3lDuYDWoPpHYxuyWQZjYS5+cShySbZ2ZHfxcosGu2TpmBLUsxHAW/D7bwNaJMNch/PdGjxFs7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789637105; c=relaxed/simple;
	bh=7XFTrGhFbj+Lf+penYPUsX0jhtQQdDTfwi3uAhefeq4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=qmE8tJRgEIDvTawm27AJUMnR3Xc5S+crlnbHqSDFPnY9lTcOO7Gvk4EYqbsVM/I98WxzMBRp0oStDrX75TgQThwlFb7AyxMZA6Cm5QmrZWbZs5ExmnHuyrsDm+rNu0SMdK2A7pCPfzpn4YMKBLrCANXnQ72a38i0J2a8Ucl1ZvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b28d7ffab1so838579b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:25:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789637102; x=1790241902;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OqImgZlJqOHDdc/+u4d9Pc2VClYEv5Qy+vzB6lz2LYs=;
        b=1O4TKoVP2ml0nlRdkFkJ3zeOLVWFB7eaCcPUlL2B5Yz/nroYSItE6W3iW6kwzeOwH8
         n8JPXfCx9u7a9fZ2F38Lw3OrMUnaDOSe23q5O8efjyMAmLICdV8WKX3fD502EHe7YOFf
         8dQXLOsAQF0SSYc1UFz4ivwDh0a5JMhrwPp4OjA40fYJ+eKWo+cm/5Mf1DmYPiuibzfS
         Rt8eUii0IzI6Wmg/Oss9rqJo8cJCXaQ06FKkwERwupuhCMj4t0FfN/4s3WaW2lZGnql6
         4cJ0abZSmJIMR+RpZvGubYwtodzXi9uR80hFtrms7ywj0289mNy8Flne8FKY5NVZfT7y
         nyMQ==
X-Forwarded-Encrypted: i=1; AKwUvByOvj9M7NxGlIngw+b+RHksy9he6vHAVzvAgInGnEzMXTE9lg64hn3NAo0NL5dqMqek2kHI3rG3cgN1q+o=@vger.kernel.org
X-Gm-Message-State: AFuF++k4Gl9yjbdJrQgnamx53QoPzzeiMjHYBxn7YB4lzGiNZKe5ST91
	4bt2iMFoV2sNtwygCBf9BcCqQxfczzKlFnwPGgK+MqFZ/x2E3HLRocizjiJVV2EJQujQL3DeEU7
	c2D7JiKMaY40DxRAyAWPPV0mNhxeUAlxldAz/c1/5gZNOrt3zTsk70GdqFyo=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:13ce:b0:4b8:4703:db97 with SMTP id
 5614622812f47-4cb6af29710mr1945795b6e.32.1789637102365; Thu, 17 Sep 2026
 02:25:02 -0700 (PDT)
Date: Thu, 17 Sep 2026 02:25:02 -0700
In-Reply-To: <20260917090134.1003642-1-eadavis@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aabb1ee.b398a7c9.1f86be.0016.GAE@google.com>
Subject: Re: [syzbot] [ecryptfs?] KASAN: slab-use-after-free Read in ecryptfs_destroy_mount_crypt_stat
From: syzbot <syzbot+baa24e4b7e349e388442@syzkaller.appspotmail.com>
To: eadavis@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+baa24e4b7e349e388442@syzkaller.appspotmail.com
Tested-by: syzbot+baa24e4b7e349e388442@syzkaller.appspotmail.com

Tested on:

commit:         238650ef Merge tag 'powerpc-7.3-4' of git://git.kernel..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=14607925580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=baa24e4b7e349e388442
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=102e53f9580000

Note: testing is done by a robot and is best-effort only.
