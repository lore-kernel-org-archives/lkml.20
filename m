Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B122D499F38
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788955989; cv=none; b=ZZ6OaUzfR8SCxna9/5L/P2DoAx3ch9InyCuvBJAFswa8iwdDBXx8PZmtR1Gv/4/a9bUM9FqC1aR6U/+m9ZOs7jDcTY/G/0oDPSMU1GJx1G3AuSzhxY36WPXg59zfEQWky80ciDREiD9VLbUlkVphAU6nxzs9oii6I+0MClAEmAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788955989; c=relaxed/simple;
	bh=YgpBxgo5YofLBw4A7X3QhxHUmNkjqC1fwunjTx+7hIY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=gtcoRWWj/gp5UJLJZznfiB1i+EJhCiHftD8C4lhxe9b+MKfc7Zvs5Mox/D7Ib+hX/pT1TAInZUAVjO6rO994Q+s9Y1CX1WpeoipcWKeWWal2HbAetjAEPwWOWo/50VzNUwrnrsP5Wox2oYgZqGqA1iNNRy6KfJwhm/ISPRgQwEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6b12abf0e49so8111428eaf.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 05:13:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788955982; x=1789560782;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UvYP6Qzj931TtA4FMiDKHWlI/21Br1rJ1AJggB3Ijk0=;
        b=DfvPArRAQdtDh1QzWE01pyh17iYB414uAaly2TXVf/7J3y90ivJkXnoBbKOu6Wsw2k
         leattqgW7/oc3IahjqimtWIrwQkYh6MReK2RRscRNDjY4rb3lMB9uIazW+jUbBHRbYcp
         PpmFhEy2BI3Cnx8f8yozw265qDIBgaRLj+VvT1GDxCWAU720ZqGNvIg9lMWWCVY7qmlJ
         sv2IqoTCeITbp72QOgM5A/tnu9Y6o31NhpFY23bIzbwj75ZPHh7sv/Y6fYGaV+MZyaKD
         zxLLJyWtKjccJyL5dp0Ev3DhfL+aBO24TauenU7s0urOVybBrMDcof8I9FY12TtHS33f
         EZ3g==
X-Forwarded-Encrypted: i=1; AKwUvBx9uWuSBJEw5OXHvUaN/nRmoRniQY+fIviw63AeethaLSHRBm449Tlq9nx1Uf4KoIxDZMPjdoFVKM5Ts80=@vger.kernel.org
X-Gm-Message-State: AFuF++lrOET31S79RCJc8UlsoiRn/1hVsHtxBVL6ZKeyHu61sqbTNtt4
	Kxg8yg36Y0tgREwf6KiPL0Bv5tw7idh7Fn84u6OZyAIWVQoc6UL+8aoSb4vqm4lzCIMbHkGC5iZ
	SPiLotOqgJcG37hNkODqGDSJ+WYa8K3dxdsrFcPt1rMN8qjaRf5S76s561MI=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:3106:b0:6b1:39b1:80ee with SMTP id
 006d021491bc7-6bee53998d1mr631749eaf.24.1788955982411; Wed, 09 Sep 2026
 05:13:02 -0700 (PDT)
Date: Wed, 09 Sep 2026 05:13:02 -0700
In-Reply-To: <05177a9e-111c-4595-a7ef-d3de398f0a85@kernel.dk>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa14d4e.f2639fcc.29487d.0003.GAE@google.com>
Subject: Re: [syzbot] [io-uring?] [ext4?] INFO: task hung in io_write
From: syzbot <syzbot+2eb3d983669d3e49d4fa@syzkaller.appspotmail.com>
To: axboe@kernel.dk, io-uring@vger.kernel.org, linux-ext4@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+2eb3d983669d3e49d4fa@syzkaller.appspotmail.com
Tested-by: syzbot+2eb3d983669d3e49d4fa@syzkaller.appspotmail.com

Tested on:

commit:         57ab5080 io_uring/io-wq: don't trigger hung task for s..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git syztest
console output: https://syzkaller.appspot.com/x/log.txt?x=127b7af9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=679ea3cb74b430f3
dashboard link: https://syzkaller.appspot.com/bug?extid=2eb3d983669d3e49d4fa
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.
