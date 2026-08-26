Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699FD377ED9
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787755145; cv=none; b=USpctGBKCADz8ail0zrL2O0VBq52eh9BMjPVWQXgo5fCuU6eR6yjQT/+bqffXEhE2Bq6a2lXKzRzrYCJ4/f2xkwgb19p5JY0EO1QtXlk3L9tGmZZmsK+yhJR0pA3lRWiCvT0xjvrot3Ts0l+OWZBY6DIUKAeBR0hsYBcSOB4oTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787755145; c=relaxed/simple;
	bh=kxbY9zLrXkfduCdmlMMEWNk3MN1XYpNf5meZLGtijYY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=f92my4yzM6OcEI1PrvY2WrQiniJJjiPj8WBjsmabW+M+5+EWJVK2ei+WV6euXyKESvx6Non22wSn4LoDUp+q3kY8XdhYzZD9pnbF1UTY6dQQ7B0y4gAvqPGC0Dal2YXqJvVWbibPcqRNAGgd/70zY1DC+6fLbTNkbwQgaw8PdIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b2d1eb484aso2502349b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 07:39:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787755143; x=1788359943;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Z55NzIGAiwsusEhL535cLJNoAJc8j+Xei+FTTQHipgo=;
        b=Ta2qh/8KIfU7eFsNFWHnqFwmq8/cbs/8Ad5ARWTJobXQq13lRbzXibu42dx7o1z0Vz
         joDstA0Siyxp4+MA/8M9lAXlmT54E+zzLeVuyrFn//scmUlRxJiNmM3YTRYyU1PeOD92
         jY22A+6HlazO8eoujr574+55/QQ+6rM5w4dnSW8ydHztot48Q9SBnm54iyK65PJW5LRT
         CiwLCeTZehthwu1q4e0lwYQmVkdGxHcPdI5WNlX6caURvi3UfvYRcZEDixhx9C8SwDVN
         hgqoEUgsNKyLwz47uZzu2YKW0GlS2bEUVSlF3TBXWmFu3z8EqrUC7YEt33DLQA/j467t
         L5gw==
X-Forwarded-Encrypted: i=1; AHgh+Rq/gE4lpsMd6+oqL42FNPPI7alftHny4Y9GLBTvXLQbWHMEl3dlp0enoq9YHtDJHFk+Pd0BT+Gaha1i8/A=@vger.kernel.org
X-Gm-Message-State: AFuF++mD3wx8/ld/oMCpleneSN9/tfgNSQWxk3m6rgEmzlkijiFA/UbX
	M6bnMotuQXI/m0npyGE8zz3etUfzlF2jNJ0pkMCcv/A5DDmVYw0xtlEf8VojJp4SXQUIMZhCkJs
	LKIw9MzfS6HuRfTQAJnxL+aMkTw8JxR0iyHUhx1YO7FLP5qOQi9DWls4E2Ac=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:16a7:b0:4b2:8e24:799 with SMTP id
 5614622812f47-4b366c1d898mr6680399b6e.17.1787755143374; Wed, 26 Aug 2026
 07:39:03 -0700 (PDT)
Date: Wed, 26 Aug 2026 07:39:03 -0700
In-Reply-To: <20260826133453.8350-1-kartikey406@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8efa87.27659fcc.2ceef7.0003.GAE@google.com>
Subject: Re: [syzbot] [net?] [usb?] UBSAN: shift-out-of-bounds in __vcc_connect
From: syzbot <syzbot+f6ac161ee9699270b8dd@syzkaller.appspotmail.com>
To: kartikey406@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+f6ac161ee9699270b8dd@syzkaller.appspotmail.com
Tested-by: syzbot+f6ac161ee9699270b8dd@syzkaller.appspotmail.com

Tested on:

commit:         45c13f3f Merge tag 'hwlock-v7.3' of git://git.kernel.o..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14ff6979580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2210e2522d526007
dashboard link: https://syzkaller.appspot.com/bug?extid=f6ac161ee9699270b8dd
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=16276979580000

Note: testing is done by a robot and is best-effort only.
