Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDAE3DD525
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790686624; cv=none; b=c+2PSTUqohN8dP1eZdDKutWnh0uU1O/l0n4AQtUQiJO+bnRvJ0Z6UCNWMVPsJPxENnobQKcJV4f+aC+RxYeGg5uQGu3DKz0B5S6Jhu+owiZqOEBRrnOEvXmGSkH3M+LC5T26FFAqfENYjnBroaIeKkq7l9x8MKfBAYPbpVUl4wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790686624; c=relaxed/simple;
	bh=pHr+FGnEN8ZpNRyZClfX675TkgI3kI6IFFQcfevgtNU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ZC9KG3Zw5tVyoK2vExPXFpBKBsWY2nDlsSjGkUsVG2Skyd07X6XnyecGjNY88zpOjtAudXZ3I6UAyKMRypAif8UKTja5gb5k/EFtwrqrYz8MacHFEUy15n+4zjXyq4EO1fkInJgUucvkwnd8qaUnwOBFwpUvXCoCmBCW0I/vG6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b28deb7ee3so7252945b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:57:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790686622; x=1791291422;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=J1v62l1XPDGKNtiASV+C9SE86/Dp1kRP9Q7SsLiQwqw=;
        b=Q289Li72dd2czCN3ALnPcQiD8s/76eVK2TPsq5/X69ojuMrmRUKNOhhfbr7Qu7wFhw
         GSyjGser5cHH7k/DXbqiysYbzDvC4AA2+sjRl523xdBwu9Y/3tocq7TTK+dkpWxygXEq
         lHNCJmsmSUR/MNTAhZqCk/n2HVGEp/mbzR4BqOdeoWg/s+yTnRrCS6L8YQqUp3tEx9d/
         di8YBx5xyBftZvr5S9AhK1M8q0Z0oO5u8hRXfw/nmtBcXCfe0L5XWBBATG5jtwNSR3Gw
         7dyp0NLKXBs7rCIn7gacvHZ8hLpbi6dQvnzW0bURBhwK00H5lz3DeJ6UDgymahUfGVqJ
         X6dw==
X-Gm-Message-State: AFuF++kuISPsDTvYAXDQWY+eQyKKzCo6I5LKT5Lybz8bwJv4EiDESy3k
	lyO9sTbUlaSiu3yOmbE3ICSVeK8Y/Lc1cy+95C80WlTrHYI5EKwjiLZok32mCT3sbqzJ8rxIRrd
	yEn80sm10j/wbJ892AFoR1m6zs3s9nDR3NZhc4d8kJ0+CrmhCO/olOsRZxFA=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:198b:b0:4e8:53e3:ab31 with SMTP id
 5614622812f47-4e853e3c6b9mr7593005b6e.60.1790686622210; Tue, 29 Sep 2026
 05:57:02 -0700 (PDT)
Date: Tue, 29 Sep 2026 05:57:02 -0700
In-Reply-To: <20260929122627.100804-1-mikhail.v.gavrilov@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6abbb59e.64639fcc.9812d.0003.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] possible deadlock in rfcomm_security_cfm
From: syzbot <syzbot+74071deb72339c215b2e@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, mikhail.v.gavrilov@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+74071deb72339c215b2e@syzkaller.appspotmail.com
Tested-by: syzbot+74071deb72339c215b2e@syzkaller.appspotmail.com

Tested on:

commit:         72d3fcf8 Linux 7.3-rc5
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=12498e05580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7d012d9c67977ee4
dashboard link: https://syzkaller.appspot.com/bug?extid=74071deb72339c215b2e
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=103cd325580000

Note: testing is done by a robot and is best-effort only.
