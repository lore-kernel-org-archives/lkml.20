Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F264ADD8F
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791873424; cv=none; b=WoocnWWLYaNeAZjEzsj9BSsBE6Qjg+Kmfpeprb4o7DNArBr7K7vW7i+SBnhl86mmX6Sl9uviB8i0PsTFSXqh1GOsXT3SVICnp3eLcSmVd1sedt1KVHb7DhmRBcbh/pwYdFcxs9zqZfAOl5wyzH1pM2oIHoY7PJZOh8GGh9gEGOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791873424; c=relaxed/simple;
	bh=fHc2Q0USSLR7X5lIdzbcjImzdolgs9s8wtMnHdQGYjQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=L7DugO5TOXwvPi9ecD3uH5pKGef0QqlwVKKi8+jlnLcjbNJNulw5xDG5xAAlWoKhgbV21IJszhVqE8atmcLDPkKd3KTKOHo+SJOR9S12cAwTUulGfssghWCCXPlMph1xPYUXyWnGQnsKsAnKCaglJbwAQpsJQzvxLeu0KEAi9DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4cbf700ddccso2423828b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 23:37:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791873422; x=1792478222;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7jMOGzvjse0E5buDgO3IAeKziCTmYcrSQXFlnRLZmLU=;
        b=SfjJnXyoB/aoAkR4HzOZh7O13diLOSTdbOOcwlexyLhjJL5XxZuyEUZyLvWs81bneS
         Zrpr01mQHMY+tV0LI3Nl/fBCrOzQokLXZuJWc8IYaTKWwa6MVdFomcxQRpNknjx+6eyo
         XeqHTbNjsLCXIvejM1cHP5lXPzfhICFiYlHTUKV+OpLH8m0JOSzWNhhpKuRSJjYZyf25
         bFvrdNMJUMN4UX3os0tzMRyxBOhiLuWpeMhEiLTWXVCcWXSl7Nwfe998wRKOtQ31OU08
         6ySfjxvPLaulrBUp0dx/v2M8tek64+vbotX2hF1j3ZoiyPbaFZfZTBj6BJw3VWLZz5Kb
         S3ng==
X-Forwarded-Encrypted: i=1; AKwUvBywic3ROjUp+iXIl21eYK41fcB8NZPfZE7/7zhf8mau3FvCZEZJsw7MwFxxsovtFqAnr2/drcR6lu2rMBQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKxxInrs+Vp9moX6js+pnG5/8rrVtjMdWjuMDk1NqPLqpM9Vdd4
	uICD73B/WIvTICVJRLziDM1dJKYJPM7TPn8cm3Qkym5VUJzJMONoZb4K8T1QNrCp0YmjGoMQcxo
	ohYKPLb7qCPrCa3+To8labp7myAul/iLJQp+pT/FyW2k7AB8rb5Rs51IuZKU=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:508c:b0:4b9:e5fa:8a14 with SMTP id
 5614622812f47-50c509541b4mr13781757b6e.25.1791873421973; Mon, 12 Oct 2026
 23:37:01 -0700 (PDT)
Date: Mon, 12 Oct 2026 23:37:01 -0700
In-Reply-To: <as3KCmgfQJQnPIkK@elm>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6acdd18d.8cdf6287.1eb53.0154.GAE@google.com>
Subject: Re: [syzbot] [ecryptfs?] KASAN: slab-out-of-bounds Read in ecryptfs_from_hex
From: syzbot <syzbot+dc50906b100ac7a1c34d@syzkaller.appspotmail.com>
To: code@tyhicks.com, ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+dc50906b100ac7a1c34d@syzkaller.appspotmail.com
Tested-by: syzbot+dc50906b100ac7a1c34d@syzkaller.appspotmail.com

Tested on:

commit:         5b00bf0f fs/ecryptfs: fix slab-out-of-bounds read in e..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/tyhicks/ecryptfs.git next
console output: https://syzkaller.appspot.com/x/log.txt?x=142791d1580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b0a4310419d2cd7c
dashboard link: https://syzkaller.appspot.com/bug?extid=dc50906b100ac7a1c34d
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.
