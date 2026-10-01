Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0123B486419
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 22:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790892005; cv=none; b=GERe98plYecmdL+TsuRJx1QRvuIR7fHxQhQ8o4KCGUyNu7FfBNnbMzu4oHetNTCBMnHyw9mvC9VjlCy2MHVMOiS5n5aUaPuYEowPC56t63wo3K8uDFjV9zWO5edDAA5CY5XkNurKfmtwbO7ANY158fogmVVGucIST7j18cr80Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790892005; c=relaxed/simple;
	bh=poBND1yecuv2eiYDf8gp3baSNlAAiO5YXdEsCHZ9TaM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ThB1Pdsta56FXWzXqiqVbSQn8RXxlWo39ZCLtpLiaqG8elYA9MXt7atLfowl8SwlZGYmHnQmFtrM37v9P5nBvvH+0KpRQmw7PL5IzjPiar1kPHB6IX2uzlDXVvVR6k9ipa/tSst2ByYd41Tlekf6ct9BANobV5NeWsMWAkxULhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4c307941971so2117134b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 15:00:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790892003; x=1791496803;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=l2tk95Z/iDkGQoY2hVpQS9BcZ2njQ7BN9coWNLTADME=;
        b=kLlv0nEXsTRs/vAPK++Ac9n9f0+WtyV9vajqQ2ZknytaPk7sc8OnKHy1atD9XzfXQ2
         dwk5P1s2C7T+1lJ9DRrssLgo8qcYHJNRg5gFh7SHHamwpmaoosPocen/0sRKjsIFSGIa
         Vu3bs+ACyRyenMteZxPL8G5kBE5Bpp1PbaZvjuCBy/zAWp0PNJFpOQCcVNB2gNs8aj40
         SLDI0uGdqsRz2zOpKVJxHZ4O+oUmO9A8f8oS2tFD9EsQhdEYrBKNDQhcjmkMLCxFAHmk
         D+odr3cu7+RVyaIH/B1r1V8MkydTosiwCg8GauFmX2g9pa/2IlRggT9OLa+OFeDyB3Oj
         +4Lw==
X-Forwarded-Encrypted: i=1; AKwUvByKGT/1apDQNoyUuOstGUOicgJyA0EyUts0+E8TYe5U7Z2F319KiTm1h54zRgsf6E64uCbTm3MhYXEWzS4=@vger.kernel.org
X-Gm-Message-State: AFuF++kBxcMKHY1E9t5nN/zf8/Au0G08AE1J+p612xCKdTibk6tdjbqG
	Winsbo7ILJ/xcYA8/3blh6iEiXywPve69O1txOcdJhzpS9Sr8C5ajLH+QPwS8hMZr4Jq8dMPwKB
	y7/Nt6dgIuJwn7aMPRU7NDopuoTed1uWclDDlD1pWkofBrWd8ByyLkrOetuQ=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c161:b0:4c4:a240:9c3a with SMTP id
 5614622812f47-4f526a4f2eamr566038b6e.4.1790892002959; Thu, 01 Oct 2026
 15:00:02 -0700 (PDT)
Date: Thu, 01 Oct 2026 15:00:02 -0700
In-Reply-To: <20261001213027.1325703-1-adrianox@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6abed7e2.092aa46d.14d54.0006.GAE@google.com>
Subject: Re: [syzbot] [ext4?] KASAN: slab-use-after-free Write in do_split
From: syzbot <syzbot+09bec78ee77613a3efdd@syzkaller.appspotmail.com>
To: adrianox@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+09bec78ee77613a3efdd@syzkaller.appspotmail.com
Tested-by: syzbot+09bec78ee77613a3efdd@syzkaller.appspotmail.com

Tested on:

commit:         d24e8ac7 Merge tag 'net-7.3-rc6' of git://git.kernel.o..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17862035580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=718e346eb0b8f38
dashboard link: https://syzkaller.appspot.com/bug?extid=09bec78ee77613a3efdd
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10b756c9580000

Note: testing is done by a robot and is best-effort only.
