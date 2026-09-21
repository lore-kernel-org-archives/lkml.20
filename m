Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0A145D5C0
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 10:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789984985; cv=none; b=o+fm0yYgVzQjIyaYHVVEd0Uy0iRg6N7SvHayHDWxmFFV1DOSw+27qahpaLvIkkWM9nUmhxkyC5bk6H2UphqzXWHcpE7crG5y68W+kV+eCGxpvm/rgsJPjH4H68ROUxrFS9HOy1jPHy7B0za3tL6m4D3nrbxCqdb7hx/nohakfsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789984985; c=relaxed/simple;
	bh=RhOdrVbm6iu4GW9k34GO+4FsrFB4IGwLM1UQg9z1kzo=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=J0vm8jC4yB5m/JZaNtTtcaKMDKhuqZ9CW4KVMA72jxgenqHiLJzpUI8m5VsX9vxEkMaMyFbzCyo//cEYEsIPDqRN+3vBwhZMkQJQBKaM8rwt18uPvfsHfuvHBXQ0m7D9WvHJpwpQaRvASqs+MCTVgxtXHmjGxfeXl7dr+JHQ/D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-48296f34f1dso3199868fac.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 03:03:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789984983; x=1790589783;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xM6sEn7YapHhF7zHP4kemutpgLiIPMYNIzi9fQms9G4=;
        b=xs/qXM2MGPrmJPbLqrkJuEhJMM4i2tIUC/dRkzqQU6jo678avc7f0zlAJeP6Wvg0yd
         XNhfr8dDKX5kRaxzymtEXzr5y2MBLQILDknlRoEH7Gy9R2WC9PtdL4JT+S9b/osp6ciQ
         70Mm3hD8q5FuEOPUXtYR+4bP+WZQf5ZuM/7CzkQ52nNklc3NaYxcYL4x3HL6o6rcwm/S
         7f954aniVWpB4TFalHgxRdjIDRVyK1Ybpc8CTK2DHRoXnm361iA6sBtSJp5nNKzbXBYB
         C5Yc81dm6LNIMGOXB2+5Swr3A2gqrfzQ05CS5nHMs3E+0Dwo0m4BwozXJCkhaqtrew1P
         VBXg==
X-Gm-Message-State: AFuF++lA8hpZpThMCS05aiHcVuru69RQNTfPjnCJbaSoF2h/rwO6t2q7
	vetiVTaRGzbBw9XXRxVJeqUlscOtx8WVVOtL6KN6N+VDSOJw3FcEX6Uz2StL6b1uwvx1liggbqV
	afYmFAv0NZ5VojdpHUO+Hk1lYQDXvwfkPJzZrELIUhiwy+kLzl0TanlQfVQM=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:7092:20b0:6cd:3fec:de82 with SMTP id
 006d021491bc7-6cd3fecf3bbmr4229858eaf.88.1789984983090; Mon, 21 Sep 2026
 03:03:03 -0700 (PDT)
Date: Mon, 21 Sep 2026 03:03:03 -0700
In-Reply-To: <20260921062326.268958-1-mikhail.v.gavrilov@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab100d7.71f81b7d.15fa6d.0029.GAE@google.com>
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

commit:         518e5b79 Merge tag 'for-7.3-rc3-tag' of git://git.kern..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=10c07005580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=84649d3ff8d550cb
dashboard link: https://syzkaller.appspot.com/bug?extid=74071deb72339c215b2e
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1216f915580000

Note: testing is done by a robot and is best-effort only.
