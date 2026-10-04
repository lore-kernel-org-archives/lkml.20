Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E3D4A4EF8
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 19:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791142204; cv=none; b=JQXGTG+/vFBB8z9ijxhb6sfLlDTwS4TuKdZsnkC5644FsuyoN2DnMHa3KZFxP1alxkAJHAw90nMrQjaup+bL5vUs67qex0vNOy7STjw3n8E3/lR3/HUYGvK/g5OujNT4t64nVdppdouXhRCVg5cjOCNqoUDZnqWZS+3qiWpJIU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791142204; c=relaxed/simple;
	bh=3ssxt4IgR2jx/2YuxdVxDa7PQkzRM0+5GydUkAboQQ4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=S3zb+yK5ozgcl/pSzoyu6m3BlexKAhV6Lx8ndMyEoIExifZrsK/vejxJYreywwcTYKZej0ffR6SOCbfERxKn0lNW1wJRLxWJMPNUe5jTB8VLf7/UeSJkcNv5lWbKVtXXuwRLfzR5az01kbt6DtWGOubw07I54RAVpYH4hZg6s2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4ab4f652f9bso856618b6e.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 12:30:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791142202; x=1791747002;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LQdI+12SYT9QPamgJRXc/j4uQe3UO14e2erBZfgG2Yk=;
        b=xAZ1SEmol0kc+ZW+VzxtXMTXjzdtFCavIwN24uazD2wZ3Gk+KwEKcqwQSIJhKLj2+E
         g+rNNB4aeVThaThgCfiR3tLf3ycn7eZrBVFA0iAm4G5bYN336+DZ6aGeBe9qnQS9FOPg
         Zga9B/WYyWh6099ds3SgDhtRLz8zBPwLHk6Qe2b5n7CvqlFSm1xe0jkG8WheYLWmX7yJ
         emQs/ZElmYAgNzY4/jr8pPzXTX3Qs52yq3GTZzmw+SfEAyAcm//9EdQk6haxCnrdhxhp
         vHXebEE1NxChFUhiLk6skenjEDhks7ucLgvTVWsBM52ixc+Z2cngev3HGhYq061s43qw
         lDQg==
X-Forwarded-Encrypted: i=1; AKwUvBzA5YiZ4scFR/u5q1MJo+Np/k21Hrt7TC7xfrkAX+OC7K0iCUXa9vUH0hsAaw5bI4sWvdYwUxHhquf8dcs=@vger.kernel.org
X-Gm-Message-State: AFuF++k6PNoi9TrMHVfmyi1Dv2IX6Tviyr5fcjYf7XR2f96r1aKessVx
	6pkhnOv7Y27/HvPnU7MCeoMRl3rNqekiRD7mOgmgzx8BTwxiqiP6MVYBPs6fD8/OC9Lg+Ud9u6w
	CDIBAi1f61jI4FXYAhd0yeeQLwjxaCZ2xwu4IbezKCY1qmhXXVZ5svVM4BFo=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1381:b0:4ea:e4cc:ab33 with SMTP id
 5614622812f47-4f529509fe4mr7652252b6e.35.1791142202145; Sun, 04 Oct 2026
 12:30:02 -0700 (PDT)
Date: Sun, 04 Oct 2026 12:30:02 -0700
In-Reply-To: <20261004184942.59345-1-adrianox@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac2a93a.9ad129c8.3858c0.0032.GAE@google.com>
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

commit:         7704c4c5 Merge tag 'i2c-fixes-7.3-rc6' of git://git.ke..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=178897f5580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=341a98f91c13ec9
dashboard link: https://syzkaller.appspot.com/bug?extid=09bec78ee77613a3efdd
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14fc27f5580000

Note: testing is done by a robot and is best-effort only.
