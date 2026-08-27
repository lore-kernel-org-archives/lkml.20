Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44F75477E
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 22:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787870405; cv=none; b=B05Z52pnyslWKcjk3e5XuSpjicAklfKCFMhtEetx9Rd+ML3KWFKjx69Am8wheGr4yobMTDYknJk9YA8aRwdQrsy3rX0hpX2kSKOetjsMPgz4M5t6ToFHjnzVkS8DLPn4SWhaGGI8zri5FLREWwMIdUEflsKaAoVjOG7hvZpmeYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787870405; c=relaxed/simple;
	bh=s2yPGVqGljuaDfy72SeYTNdb+lHzB4tBVyjEcTGBmvs=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=TV8ag6cZYcEmU/qYH19APIY4zHcsoHv02LujnZ4V3lsRpnevFrueDSU8hAF+C5+Ky8xe4jC1yAEvl1Wz2Pt5McJJ5IE8fCZS+RsUYq3PbVJ8xoajItGD2anFPoYvhU/fdKKZc3eO2sOi9xFIx8u33cFDd5U61Dk95Nt9pYCzoiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-448bb8bcf38so1139127fac.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 15:40:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787870402; x=1788475202;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hoZR5Hp9XM/ut+kP0VyQIql5xmzrlkRPz8qs67noDRo=;
        b=DYkUI42caTOpDct87Jm6ulgSB1Ikv4Xr5rOjHtV9BzTYNJi7y0oib9V7ihu2x746Py
         NFie7ploOuB079lstYvo7/bFyixeg3BH5hDT1RPFV4MvVgtlGhNhkP0z0V8LgbLYJp0R
         aDsswO41MrxQnIdj4qGozi/IDqHBgcYyXuyVcUpMsg/ckK0l20SVbWY5w9oVx+0VnA+Q
         kTsCdHRLibSnbR6HLPlhbmc2M+Ynavc/iVML4wQdfw0Odkl9Vf+eWxorOMr1XUsiLyRx
         8x/kZiQMSvkDML5ZvtSbGdA6LQ1W4lyuyOqWJYuJiUGpAxS4T+BEEzJwX4sdpLj5Nx0H
         PvwA==
X-Forwarded-Encrypted: i=1; AHgh+RrXCbSJp64MFuCTQHqPL4lLJFhBIrM0YDd6IXDaIJ/Jvvcd3BhJpevsrnR/ih7oGmxN9XPF3iwMrhNRQ6g=@vger.kernel.org
X-Gm-Message-State: AFuF++lTLlVWPNhIcKujn11W7qLQ00hV8wCMpBkuAYVgQqnvygwH3sHV
	5uArHnyG7Q2s0YlP16h6VQUNresY0xtajNqDNOO9nWLmguuqB6G17Evs4j1hTUSS6b1kNprwKvw
	TIv5IoX3efFEazaB3ibc3znRffFT6Yu0LK+SqDWWarBvFYbGuxEeY7JKqvo4=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:a20a:b0:6b1:8f51:e174 with SMTP id
 006d021491bc7-6b1c667cb7fmr1758840eaf.29.1787870402548; Thu, 27 Aug 2026
 15:40:02 -0700 (PDT)
Date: Thu, 27 Aug 2026 15:40:02 -0700
In-Reply-To: <5fd4b9da-1b6b-4aff-bfb6-1d02f36a9202@yandex.ru>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a90bcc2.1d9ded08.62e62.00de.GAE@google.com>
Subject: Re: [syzbot] [can?] memory leak in j1939_netdev_start (2)
From: syzbot <syzbot+489e907b2a026a6f5fa0@syzkaller.appspotmail.com>
To: dmantipov@yandex.ru, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+489e907b2a026a6f5fa0@syzkaller.appspotmail.com
Tested-by: syzbot+489e907b2a026a6f5fa0@syzkaller.appspotmail.com

Tested on:

commit:         73e3f071 Merge tag 'nfs-for-7.3-1' of git://git.linux-..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=164bed49580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f403bd8c639b6040
dashboard link: https://syzkaller.appspot.com/bug?extid=489e907b2a026a6f5fa0
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=108eed49580000

Note: testing is done by a robot and is best-effort only.
