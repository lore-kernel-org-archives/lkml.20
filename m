Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BEC51C35A
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 21:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790889367; cv=none; b=S13Ji0hTkcQgm+Yoqn2uD0m21miAmtq6Tg+Bu1UsZP1BX1wHd5bvbOzfO3Xaj+LQ7OoLsTQlXMrSmNMoMW8LO30N2rrkjaHxMnEaeD4fWqQl1HkQ/8Zrmmab0rPYHiPDZ/cQTVoh7d1Mt4Ef7h5S/tDsiQNNbubp/utvly1iFCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790889367; c=relaxed/simple;
	bh=Xz/t4EDnkh7AnU7+kAAeYI8qSn3QG1JO5UNN6QiUzts=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=iSqhRAiL7jtVC0obPAS1lwG2yCbFzh/ANzaN4n1rHx/nSpX6i/1exXt8faMDCgRyHO7Obgmwqh3GF8TEH0Yxa9lzXzHAXDG6K2af3hna6+8pZqfH+5U7eCvny+HwtLtGQhj+i6giZoGsWHq1MZiCuXe2DOxNg3dbIsabFlh6rWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-815f2b1ecc3so2471196a34.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 14:16:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790889364; x=1791494164;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FMl5Ae5iH4+UGyXLnhVfLhkpON5CvNAtcCViyFfokmQ=;
        b=0RX23MZgWgM1E+PwDCATebCeMztEkbmcesssfa5vge1xTSwL7WMPMLdmHj7XgZRSbU
         n1XLhlsqynp6QRJO8FJwDTtkK8rQ4VJ1ighn6a5JJrmHypy4OOAfhuaw/CkR+pZQhFQK
         vCJEBM/WbhDgVjTTseE8ZMTESBxkvIiH7wqXRvitI5PckJ9EaCNdM24p5oVo8lwcjooH
         UumHUrLskQPRajCujQ08LhK89wYoS1O8Ge/lbzr6Mdl6y3bi9nAVp/0paHZqM7GLu44q
         uCzxJgCQTGPJD9llVtIGRiOusONWfqEGOEOMopGYhd0PDLgkIHkyxjRJ3JnO38vzTycv
         x+rg==
X-Forwarded-Encrypted: i=1; AKwUvBwsLdWClarruBFrKatIA32JcJVA2uFBYYVfmODOkMDNuAJbzpQJ9zmtTAN9GedgkJ7Ksh/U8loEhtASvCA=@vger.kernel.org
X-Gm-Message-State: AFuF++l+cVfqk8lG1bkCa2KvA+elCoYeXJwPPIL1t1cRJ5fwzpJE8Egt
	J1Cl00BACN4N49s1MvsmPC+N9ub3ccro5PI33zjBYPzWyIc1V3io7MJUP3055hiNJVbU9RZujZE
	Nn4XQ2Nvltu4fEncF8SO0Czi/YCUTRPjIdIzmtQRDc9e02vBdwoey0zUtLTo=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:f94:b0:4f4:ecc8:19da with SMTP id
 5614622812f47-4f526a4e015mr469619b6e.8.1790889363850; Thu, 01 Oct 2026
 14:16:03 -0700 (PDT)
Date: Thu, 01 Oct 2026 14:16:03 -0700
In-Reply-To: <20261001204534.1295382-1-adrianox@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6abecd93.b50370da.302ea9.0005.GAE@google.com>
Subject: Re: [syzbot] [ecryptfs?] KASAN: slab-out-of-bounds Read in md5_block
From: syzbot <syzbot+03c68e42ce4b33f7ce9b@syzkaller.appspotmail.com>
To: adrianox@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+03c68e42ce4b33f7ce9b@syzkaller.appspotmail.com
Tested-by: syzbot+03c68e42ce4b33f7ce9b@syzkaller.appspotmail.com

Tested on:

commit:         d24e8ac7 Merge tag 'net-7.3-rc6' of git://git.kernel.o..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13722035580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7d012d9c67977ee4
dashboard link: https://syzkaller.appspot.com/bug?extid=03c68e42ce4b33f7ce9b
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=163f4bf5580000

Note: testing is done by a robot and is best-effort only.
