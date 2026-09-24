Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8DF4A0903
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 15:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790263086; cv=none; b=XNc0MzYfPHWfIYiEEe2HWQx1NQzk2rSDM7ZO7BrS16FDTybORUDLp0530preRRG4ISHi3YxLvJuVbfsVWDGSWeNofT0ww1JBUq8JxUeQV4NbMyKC/IbM7AcgyxkS838kqCgdfyVdgSbELGm/yMtnznqoWcNlFmnI3wGm5+yIMy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790263086; c=relaxed/simple;
	bh=76iVLK0VPTZDliaYEJ/ilyrbsmphhkUV7YVxqpf8bZQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=t7veb0Cq458toWdE8w7uj96ChoCeqVa3oboFo9pXSyEmLsxosWBuHQEcLrhBEcPCiPRkag8ZwqaI5jQ0Nqpo1nf8mZWqKAhqGuo57/8Sz0tGl+M6sHCEP2UM11SFtTMwnTPrvtsyknX4m8WX06otSEr60b84mouiYEbLz1nbodo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4cbc77da654so3292303b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:18:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790263084; x=1790867884;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xdOF5JIZdDFeszicpp++risEMJHX43/rvpe4LTtYknA=;
        b=sbYlWbAWxngq/IcTyAnZC2etta2F/OLjJEkUp488u0CvyeyO4SwVt3VKfshyTBLWiJ
         6uR3A14BrAQ7EGeEtW1E8oA52zH/rwzcWUcOEcNc36jzJIxNlCy9cIy9ynWUO98GZoom
         9/NbdSQAlmvEX1dNJLyaGEvKwhjCB2nLf4Ct6MB7MbjOyEwSv3HJ/TB55StnuhHGp/Ok
         n8sJcjoiyQpGCrA2Ie5o6JshW7MZAz4IbwLo7MsM72zp6SVwWMHQG4Jc2I772e7x4guM
         1djdPSpeq+NRiMks3q8YEsE+vGxLfZYK797kpmbF6fCmniNIJ6zVxa9r+vMBE4p4Z2Tt
         mjdQ==
X-Gm-Message-State: AFuF++lguxt4Y99zZ9AjXjXqzEA3qtvxuYuO/qHmsJSwcuGVOZtFjW1N
	IrgajkMxU7xKhi8EZnWlehMfOHjoW5W5gIjUPbUzDMb5ZsnH2biy1B+LRl9Zds+h8Zeejo5weNd
	S0vRS49WxP9QvjmWpYoAQ71ogJo5tO2rCdwEtS7To8n52voKuiZtTCOTAo0M=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:159b:b0:4b9:a829:f01c with SMTP id
 5614622812f47-4d72e16431dmr2867604b6e.40.1790263084273; Thu, 24 Sep 2026
 08:18:04 -0700 (PDT)
Date: Thu, 24 Sep 2026 08:18:04 -0700
In-Reply-To: <20260924145805.6139-1-nsvatoslav515@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab53f2c.dc2998a4.2261f5.003d.GAE@google.com>
Subject: Re: [syzbot] [raid?] general protection fault in ppl_write_stripe_run
From: syzbot <syzbot+75d7e96ad03ac2dbbd9f@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, nsvatoslav515@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+75d7e96ad03ac2dbbd9f@syzkaller.appspotmail.com
Tested-by: syzbot+75d7e96ad03ac2dbbd9f@syzkaller.appspotmail.com

Tested on:

commit:         50d05c7c Merge tag 'landlock-7.3-rc3' of git://git.ker..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=16edad25580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=85bc5cc2fc7394d9
dashboard link: https://syzkaller.appspot.com/bug?extid=75d7e96ad03ac2dbbd9f
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: i386
patch:          https://syzkaller.appspot.com/x/patch.diff?x=135a9d15580000

Note: testing is done by a robot and is best-effort only.
