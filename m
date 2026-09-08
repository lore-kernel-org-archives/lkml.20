Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E8E52ED38
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 11:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788866836; cv=none; b=UP7JkTDemugawivqNIKQFS3VooouPG81oCX/+2lgnOEvxui5gPLjIxFgbv/VOm0LbvB27JZostDAd0GmYnQKH2tBX9gbR7p9Zu5QfoQIDGsvabgMhhAv0sp5/wVEJ98NeSGLzDPAYzZCNrfl02Shloykjpal/hw0TLStlq+2g40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788866836; c=relaxed/simple;
	bh=S/M2yd4CMzMUGEc8FNckcIMievEkXsYxdzCmoMXniw8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=iAaTWXtQj6a2RxHGHGJsWpU2D1NB5Ya1ovPgdDCkZBkK785FIIi49Ucyx4xR0Ws5Wwcgldct+hnzwvcOvkggFxl0Ovxy6ASFTrDgigRDgq2zWV9Gx1RrFUPm+C9cvKqFUY4ztdcEg6WejK0THpY225/tjQGBC3sP7Jv2hnWHCtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6b1b9376ed5so5249949eaf.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 04:27:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788866823; x=1789471623;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DS7KOmT6jFQRDP9HFawIeTDvJHjSZ82bJjBrvg/avsM=;
        b=ih7wxrBXGarDGPvkeQZyiukMafJqhkQhCRjnCSWglom50fp0o1xkFeqIu7AQXKMlYu
         xqsuyFVNd0l+vhnPlnfLIDaa15akYQuyTdVqh6oiU9cVtPz1oja8LYjg2Grm5e93YnOR
         2t5FP5Db8aV1KUI0G66aVSnVk7EgvxTugkH3YB/2McHmmmZrBgaZ35oj83akRyqU41Hv
         7LhQ/cOXKGNEISHCWxnOib41+XvCgxWdmuNWkfjQZmZMpdXpfTn25FkICchrCoeuqVJy
         +DiWIw8w/M2Lc3iuz5/b0SjgQYWTEM+/SWM7lr3017xJKqjvgSb/l3SOLIQL+JVH0H/C
         GgFg==
X-Gm-Message-State: AFuF++lbwG+VjBVBFRYaa24JzUYuqufhNVi3CoQM7B5lDhvmtNv3b/5u
	D5NSUdoB3ZBHx/2urRjiRHR5lgB4ceFv5sx8uV09+2/3Vpxjxru+MzsTYrslAbQC6KXuwKLKAPq
	Byyaf1FHv2XfFUsZgA/aZqksjw/Qi/P5OFUJkGblrlQkSJ12SgNu5pa7LrRw=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1501:b0:6b1:5c8b:c0b9 with SMTP id
 006d021491bc7-6b6fabe21b9mr16590405eaf.3.1788866823444; Tue, 08 Sep 2026
 04:27:03 -0700 (PDT)
Date: Tue, 08 Sep 2026 04:27:03 -0700
In-Reply-To: <20260908110640.1424-1-syedtayyabfarooq08@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9ff107.6e6c5f9e.28f11f.0011.GAE@google.com>
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Read in vhci_shutdown_connection
From: syzbot <syzbot+31117fde582fe6a0cd62@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syedtayyabfarooq08@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+31117fde582fe6a0cd62@syzkaller.appspotmail.com
Tested-by: syzbot+31117fde582fe6a0cd62@syzkaller.appspotmail.com

Tested on:

commit:         28924df2 Merge tag 'perf-tools-fixes-for-v7.3-2026-09-..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10229749580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ec55b50193b453ea
dashboard link: https://syzkaller.appspot.com/bug?extid=31117fde582fe6a0cd62
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=169c7125580000

Note: testing is done by a robot and is best-effort only.
