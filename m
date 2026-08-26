Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F034B282F17
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 21:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787781305; cv=none; b=h5dU6DAxxcEpoXfD6d6FkZF+4g9yaafbw2KiyvbxYvfvtcnSTMSL6p2Iyvqgs7AmxyDIFoEjcYE58PvN6+35o+6L5+AMeYIDEo94ivFLYnsBtcoMSPSJJH3Naocs6GrN0edNpvxAT7S+jx1fOleS/c3PZKHjlb/SPCPEAdVb7AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787781305; c=relaxed/simple;
	bh=Q/HmKq0RYcm5NaBjnYG+Ts6HurXNpF6hy2X4bXJ3FQM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=feDVc3hG9JVILPb97qhug6lIN5l5qqN24KTWh9pedH11bgAmt1B5SOsE75PmJcNRhhyOHE4OG9jJfpATHyX3mr6AYKdyP4mUQAetbWYRwPUKlnEmZ1NCAoO9fGAApXoRGXdpQGZmcnBt+VP+1JngdFXjD1Csg6LyrztQ4obBhnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b37620eb73so1522155b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:55:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787781303; x=1788386103;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AmFyU/fuG33NFzfbJCvVi2NqCZdlgCDdwMb7R8WD11w=;
        b=NXlpsST4Dw57t6f6b8BAZXuOu2TuoqVNrANb+v3hk2g/KJr8TVFtE0F/MW82/x6M8a
         awHOuBk1HvYxUkLJ326h/V8155mGcp0CBAnaXeU6O9Q5BqYERSK56TTOZ0l878N0b49D
         u2u86bD2rSDJwXMuiRg7HMHEaevRkPQZa0M/hWuFVEN2SljTj9PaLyz9mFG0nFSQ3noh
         GL4uqDpXywZcwGLPHmi3jN5iDREKMcrCzkw2G3d7ogqj5SchLIDgi7jmVYoUbERpL0Fw
         VKxg0DGuynLQ3clzBFI/v+RpXdWVO4xQBv0F0/E74UEuuub4End1/J1M0eR98VkokkVg
         oMCQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqm9P1v7kdx2YC0kjVEfbV75m1eXNnppoAiI5AD7mDbtYlObMfqAL8j7IDPUU63psCpfJLf/fTUDpfTteI=@vger.kernel.org
X-Gm-Message-State: AFuF++l1KyDU3ZXawLQJfbOitmcO0lFrfpV61wc8h26cmO0J4l5BCN+I
	IhUMWK5LyC+7aLjfzeVaSgdl1P/LJR8p/NPagMT37DgH9VqGLo4CsPdHFa0Ls5g18LVM3zhp5EB
	c5UWqToVIWQFBtcpm6XFfTaq1M4l3fcjih3Vh9mxnXnrR9Xf8NzJycldpFH0=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1446:b0:497:da47:df4d with SMTP id
 5614622812f47-4b366a79feemr11025899b6e.16.1787781302930; Wed, 26 Aug 2026
 14:55:02 -0700 (PDT)
Date: Wed, 26 Aug 2026 14:55:02 -0700
In-Reply-To: <CAHc6FU4rFuMBsPh3NO4yAfF9y7dC4_8=TPSgGnaMODDCi5p-mQ@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8f60b6.1d9ded08.62e62.00b9.GAE@google.com>
Subject: Re: [syzbot] [gfs2?] general protection fault in _find_first_zero_bit
From: syzbot <syzbot+cb79de2cc8b76fbf474f@syzkaller.appspotmail.com>
To: agruenba@redhat.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+cb79de2cc8b76fbf474f@syzkaller.appspotmail.com
Tested-by: syzbot+cb79de2cc8b76fbf474f@syzkaller.appspotmail.com

Tested on:

commit:         fba8cadb gfs2: No quotas for meta inodes
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git
console output: https://syzkaller.appspot.com/x/log.txt?x=151b9625580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f8dd02b32fb43dc7
dashboard link: https://syzkaller.appspot.com/bug?extid=cb79de2cc8b76fbf474f
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.
