Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D8D478E20
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 13:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790861106; cv=none; b=D4WUZ9sI250c2h1DNTjYycc6KtVeQy31YiLE9eYFOWob0kxa21CyReY7ml9gIevSPdJm3vR70vU1QjuZVXzVTxJDUSv5RC/ziveke6qlZ99ttaXPMV0hkB8T8aAk7t78qYJpHFYcKpXvW29aXtOrra8+Qy//apx29V/yLONcZIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790861106; c=relaxed/simple;
	bh=Hjq7y5xwF/o3OITGh831QTeK4BuPW2gVe2ffDx8V0XY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=DvErVBRNZgK5hRdBliSyhvNi+y6rsDaHrfDl7vRlEKLaZAwO5JTmeS2voFl7ZcwuF5OV7pEuRbPc9sUD29ayzbj/InStoFDi4JH2pm0fPZV9Y0FnVT1XcoTtHzEQZ27GgQvngWeryBpRwNms87wJzptJjrRTZJIyFc4aet/BcnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b26d8d2498so10054972b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 06:25:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790861102; x=1791465902;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zGC8eoo7sqBg/OF81st5hi1IyHpdEbJJnULEgfNzl9o=;
        b=C2s1ct2tSmn3EM5yQ0DDm+hlDn6ycBQMmhx9MCiYdOu22Eaulqef6zUfNl2jEmvf+C
         jSIOCFWIF/b0x63r5vSXSu67+OmwMnlGSDX1+Zojr/xufir6Jlep7T4pU7ws6liWPQPp
         ZymmGMBV51wwcFmUEerCRMk6n/D+kBLXV2acvkw1u+/zmGTFXSi46m4NfV/rPh9QLMHj
         UamZ9PXtRD6x6KfVT1Ehx00TU5dCMwhYlP/6wzxGxgWtnslDkReWn91w++sH0BoMZ5L/
         40NgWeLmnCkLPmVqdW2NJC4Hv9kSadEdYjDqg0+cy8omNmTnBdZdoKx8+P4pDEGDSi73
         jJaA==
X-Forwarded-Encrypted: i=1; AKwUvBw2oEXm96oQlIW/lnyfEQ86iZi3rwiKqk2EakrV+aP4kajdNlgZ3HaZPCbiSyCX2EXvJ2hjzDDEls0Bets=@vger.kernel.org
X-Gm-Message-State: AFuF++mA/sE70IEOnAHdllkL6sZGhu6vrOM5XSUnVxMRa1Xze5LoiKyB
	znuNF/l2T5duQNEInFgekKGs5qvasDOrXMklNTtu+GJCU/uks+GcD+QmOsoflIFdkvqRWjwmBS/
	mx/1r+sz/KBgUPdBDoRykk1qoB5Aj59LMPdbak6/qlJ44LAOxpAsrUIi2TDM=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4fd2:b0:4e8:bce4:993d with SMTP id
 5614622812f47-4f1b724c7ffmr5141948b6e.11.1790861102334; Thu, 01 Oct 2026
 06:25:02 -0700 (PDT)
Date: Thu, 01 Oct 2026 06:25:02 -0700
In-Reply-To: <CAJnrk1Ze8s8EGJqy62_mLbgvzW5fVVWMdeq3zSH0mWu_HRfpcQ@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6abe5f2e.f32479dd.202a09.0003.GAE@google.com>
Subject: Re: [syzbot] [fuse?] WARNING in fuse_iomap_writeback_range
From: syzbot <syzbot+e8200299b0556976e13c@syzkaller.appspotmail.com>
To: fuse-devel@lists.linux.dev, joannelkoong@gmail.com, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	miklos@szeredi.hu, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+e8200299b0556976e13c@syzkaller.appspotmail.com
Tested-by: syzbot+e8200299b0556976e13c@syzkaller.appspotmail.com

Tested on:

commit:         fd179f8a Merge tag 'ata-7.3-rc5' of git://git.kernel.o..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
console output: https://syzkaller.appspot.com/x/log.txt?x=1036c035580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9d4242cb1c54cdf7
dashboard link: https://syzkaller.appspot.com/bug?extid=e8200299b0556976e13c
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1483a6c9580000

Note: testing is done by a robot and is best-effort only.
