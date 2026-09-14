Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC8C36A36C
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789404365; cv=none; b=Dd69rOjAqboUVy8HQsieFXnbNbtCCJ++uojTxNJhV8ItbwVeKKhb/kmO+s0ccyPS+u4OxYPRLtRjs7iYW8/shVMQJgQ2cx2SfaB8SU4EN4Q5tenp5wx3XWGasjy1/MXcwHq+Ob8UmzVhf/OsCDIlYokFvYnMMeo/ZcKGAV9ctQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789404365; c=relaxed/simple;
	bh=lvNIKgXAZqnfVnLyBJceN2V09Rwt4fMp0gUYgidEsGc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=X1haAEXooihE4bpLwfCDKe+yqK3xDHc9d6fvOdoe0TiYMNrAhb4dQYiL89pPYRi8AZiaWPA4ixZu4oX7nQ6LpZRgat/tJq5INguH7QXRPOrqEl2q7KKmIDzjjK3oGz+vIhguUhDupF2/2mW1je0fR0BbJwJruPriIdSeshS3xS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b28db6c77aso4562705b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:46:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789404363; x=1790009163;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Sd5+XCKYxULechPKptn3ArW0My5b8TAKgQNiFhk/Vb8=;
        b=H9V4JZtMyMympgl8t55Ad/jKyhpK6ZACrYNWkp4pnnxaau6ZZeLGqC5yGPGjB/eXmB
         VLKYwlvHOc8VImROcw41WO3KWiks7oAqKxTgNjbPMxy7lD0AySdH0wWc4E4EQXWW+8RJ
         Gm0wqLF5Tu0t4zhYTlCEk6J+4ev78jpqKgZNe04gmdw+Y1zp2bRuQS7P/XHGoQHs1NmP
         dHbN34JjXuwHSbvI+wSzlpq9lCoUgCIiP9KJqOmNnKqKzCchoDRkY5KqG+dK1yta+8IG
         da/aI7IAq6rURVHSpbkkyLj1Yp0EeQNjpIQW0iP3b3mOttFMD6R379NExdSP6vTn7p0n
         eukQ==
X-Forwarded-Encrypted: i=1; AKwUvBzZeJv4fYIoXo4KnMWo6i8twdcCvoT6Xa72Z0/7ut7UKk32PPwryNphhOvWzTRU++s+HTyUKNSaC/6eflA=@vger.kernel.org
X-Gm-Message-State: AFuF++k5LTekcU4FQd/YUp3d9CJbseroYGasK/+E72lgP5rdo+vG+Snr
	gUvobfXNenWpfm6egfNPJujclSyyOCyOuLe7dhWtR+YJmqlWKeqkz0aEsRC/I21ERR/nEVtrVR1
	a2TbQRKHpaX7yhKpKMUfXPknI3RLTwl56p5ETZLZs64E3dTtPtuev49VTOmM=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2512:b0:4b9:e5fa:890e with SMTP id
 5614622812f47-4c7b6b44495mr2634091b6e.33.1789404362923; Mon, 14 Sep 2026
 09:46:02 -0700 (PDT)
Date: Mon, 14 Sep 2026 09:46:02 -0700
In-Reply-To: <6aa7e051.b5eeafb6.20909d.1fecSMTPIN_ADDED_BROKEN@gmr-mx.google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa824ca.f81106d8.2ab401.0052.GAE@google.com>
Subject: Re: [syzbot] [netfilter?] WARNING: suspicious RCU usage in expect_iter_name
From: syzbot <syzbot+4bd730aede2791e40bdf@syzkaller.appspotmail.com>
To: jchuang26@m.fudan.edu.cn, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+4bd730aede2791e40bdf@syzkaller.appspotmail.com
Tested-by: syzbot+4bd730aede2791e40bdf@syzkaller.appspotmail.com

Tested on:

commit:         15071f2a Merge branch 'bpf-tcp-fix-bpf_sock_destroy-on..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git
console output: https://syzkaller.appspot.com/x/log.txt?x=16aa1925580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5e4e3a0e188a497e
dashboard link: https://syzkaller.appspot.com/bug?extid=4bd730aede2791e40bdf
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=173a88c9580000

Note: testing is done by a robot and is best-effort only.
