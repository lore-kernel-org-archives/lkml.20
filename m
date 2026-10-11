Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2769537DAAA
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 21:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791755226; cv=none; b=aU6A+TW3H00ELlXyGpLZ3EDmTE8WMTxQPua0DAsizxheN4Mp9Bgv/dGtEOnHroMY/aH8Qrjmhrm9cyUU5uD4UK/8GGqVkxe2qw7PpcH+Q3wz3WAbHZjzQbszKwVdzPjwul2IiQ3Db95pilUDZsE/1a457WaO1JTJEUQ9K6o/CRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791755226; c=relaxed/simple;
	bh=NQdrBYUyoJ74GjiSzV5zqoMHB+RK1AeeNusMUGNHwvI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=P5rNKl/KYxLSGV3Dn/ibIfMlhhlvdT+yNP5GK+4ghrQt10932CHdW1gpNIiiujgS5WbEGXxf10JeXQdwYCvoTRB4y1flUaur1IPEADvO3UeYun9wRYnMuF22yslmub2ajJ1T3/MnN6bHb9zsuoaG2XyZ6a05XDeTcHz304b0QZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-821de0b7baaso2728318a34.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 14:47:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791755224; x=1792360024;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wJHs/EwXISp0YtkIUmP2K5Oi58fM9qmXdUuy8FyWcTg=;
        b=bu2ZGhaNilzCW/H2itkr1WWk3KB1dCLutCUdB03CoK9pOZwz9dLYW+QEugAG16RVfn
         y3YGpsWIFg8B69SffA1IdcHFPNiM7V47nzC0WG4enOtGWTVvQmteOJ3aYSbUv+XoXnXf
         ETWjrIL5fOuDvFkbwbUxDyExbzlC1Nb/yRK7jtQvY9hLn0g+mWN+MlQvq1H0zSfDRYPf
         Lnm2oTcgpF4n8btBgxKhqmDsFqoZ0Vrzz4p37e1q/4BNICMSe8xC9Z0udJIecbvqZWrS
         uGSEK8ef3qqQnOG/DbBv0QQtXY77k047rGX9+top64TuiHYJ2aXIGLeWLQ6End6pDEPt
         t+Sg==
X-Forwarded-Encrypted: i=1; AKwUvBy1MuN12D9ifHiR5ijnda3KyUsR2lv9bzpTf/bNlZstQu7qJLZEfNME8yoE9K6ZSpEufPSn6I+J2Z9Ie/U=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXu4Gmhn7EPlAq0XU+r1UuXw3+cD1zBJc6v9GecjE5wRy7cp7C
	KHRFYAfB+PhJ9evn7e0LwrSWj0FMnDwv/2+RgR3DaIdTSZPHQScQuzh5XUJmd0dOlkyBO5Q5YpL
	2h4vVZ1z/VXUjPD/rZ3+fsWtxf/i7YyuxMdD+R1xKWthRvuGnNC16vE0CWJk=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1992:b0:4b2:5529:ed3c with SMTP id
 5614622812f47-50c438a3cf6mr8415090b6e.7.1791755224140; Sun, 11 Oct 2026
 14:47:04 -0700 (PDT)
Date: Sun, 11 Oct 2026 14:47:04 -0700
In-Reply-To: <6a6d3a2e.6ce73036.24301b.0009.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6acc03d8.8cdf6287.1eb53.00fd.GAE@google.com>
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Write in pn_bind
From: syzbot <syzbot+098999e05b6b877c01b3@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, khiemtranzo532001@gmail.com, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, peterz@infradead.org, 
	syzkaller-bugs@googlegroups.com, tglx@kernel.org
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 9213aa4784cf4e63e6d8d30ba71fd61c3d110247
Author: Peter Zijlstra <peterz@infradead.org>
Date:   Tue Feb 24 16:39:08 2026 +0000

    sched: Default enable HRTICK when deferred rearming is enabled

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11ab11d1580000
start commit:   a5ebb76233b7 Merge tag 'edac_urgent_for_v7.3_rc7' of git:/..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
final oops:     https://syzkaller.appspot.com/x/report.txt?x=13ab11d1580000
console output: https://syzkaller.appspot.com/x/log.txt?x=15ab11d1580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=df4bbab1c2172b9f
dashboard link: https://syzkaller.appspot.com/bug?extid=098999e05b6b877c01b3
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1506fc3e580000

Reported-by: syzbot+098999e05b6b877c01b3@syzkaller.appspotmail.com
Fixes: 9213aa4784cf ("sched: Default enable HRTICK when deferred rearming is enabled")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
