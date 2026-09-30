Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE754E4331
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790776393; cv=none; b=CwN+QZ4nqULtam0DfV7gLL0y41FWVex/0jC+jALevxi0rSjqarZuUBdDsemoNx5zQWDrFOliCjkfBpOW69eRcEgQnvGGu4EVE6T732ian5VQi3HCXNEA0fbCrjEIsxWiED2SrEWp8vZzqkVUu+1vOSUYPgRYDncDoystAEMqajA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790776393; c=relaxed/simple;
	bh=9blzCtgxCzE/Jwtc4BAUwBnUJ6C1iatIsMFk6O4vdNY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=rqpBIkIVpfvOjqQGT1rg0pC/uPyx1rkkLXxk6BNGHn0KNTx1gRCdwnn3a73pK2G+1U3+3imFDbb9vUbJVM3yZx9jw16wCGcGL2W8qNvykk1eC0jk4mbkiFX9QQuAM5SeOAC1W7N1oTN2fGE7NaDTEw9RmMjvgO/U6kjoo7M3ThI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b28dbf4197so9463855b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:53:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790776382; x=1791381182;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=H0onscU5fvyN7BYkWTQW0c+6+hHIAQ3Uiw/oq/ubFgs=;
        b=f4jzh67pLgdUIDQa/vMNCQQbU5AVzabRHMC7EWffISpWKOq/q7TzEmv0orkMEMLaTU
         h79Wtdnd2doeMaGZb6csvydgzh/v5jYjRzdpeckgBUEZuGb8+V0VffPX/rASXCNEwRnN
         rvo/UhZmdsFz3ABNqe1Sx9JcwkNb0JYAQhIN9ePCC3nKkq/kbUi250MQ3w4Z17y0JL8p
         panZLTrkVkQ0cEYVAQhdxjnLKQvJAz5P0o5UyvjyILlMsChXfPtO6SnT4ssPd9aFn3dF
         9ZxLFKe4kZUMoVD0kXg0DT3ip+PoxnBTZq+/BiNVZbchV/a5V2MZhYYL2gPFgT9Mpmx+
         AAGg==
X-Forwarded-Encrypted: i=1; AKwUvBySH1fXXbzUtxUY2qFZZkq5s/pn0+COgXc58sBBzYfriQHMBL+ep4I8SZUX/8ivhvfQiwb6t2zuzu7vvf8=@vger.kernel.org
X-Gm-Message-State: AFuF++n+W07e3TkYMtJ4FNB+CIAFv7dPoIhdX6bNZ6MU5WP/j/aafG4B
	ozjPU6OUDyGaHooj0OVqejagE4Qwj6OBHOxgp/RuEKIfbaWNtjCKFZtwW3KU8UjMiPe4BsMa2Kc
	NzSyg2BzKhzNs5mywPyG7F9D5hONGRh9yevm8yYmT2nU4ceLTbQX9a1hoX+8=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:eca:b0:4e6:fdeb:934e with SMTP id
 5614622812f47-4f1b0d0b5d0mr1304153b6e.6.1790776382127; Wed, 30 Sep 2026
 06:53:02 -0700 (PDT)
Date: Wed, 30 Sep 2026 06:53:02 -0700
In-Reply-To: <784ebcc3-2d37-4640-88fa-3385a646c2d5@kernel.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6abd143e.fac9d4e5.17396.0003.GAE@google.com>
Subject: Re: [syzbot] [f2fs?] UBSAN: shift-out-of-bounds in __f2fs_commit_super
From: syzbot <syzbot+dfcbc1741488709db4b2@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+dfcbc1741488709db4b2@syzkaller.appspotmail.com
Tested-by: syzbot+dfcbc1741488709db4b2@syzkaller.appspotmail.com

Tested on:

commit:         7d114d27 f2fs: fix to set sbi->log_blocksize in advance
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/common
console output: https://syzkaller.appspot.com/x/log.txt?x=17652b15580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=40ee55a747aeff44
dashboard link: https://syzkaller.appspot.com/bug?extid=dfcbc1741488709db4b2
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.
