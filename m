Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419BD5474F
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 00:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788136624; cv=none; b=scW9Hm7XcYqFhvs7n+l78+V/Lvm6oP/2gUUdvB6K1d9FD4NmiU4qarv6IrjyOkNvKF6Fij9ilKwC2/Hg4JnewokOzAe5JXfpebC2BTUEc97McU3gCyRPP8dJ2zzhm4fjCn2FSMQfUFTRUeP6E7yojw3gs+M0/8fdsjfYFHRnsDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788136624; c=relaxed/simple;
	bh=7qXW4y3v/iyPogLkc81VC7dDXc5WFu82SdpzhEdIXig=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=DoapVUhNcgB1cR+e++lasK+Bj8YFsZUjSxDD6faoxoop9I9rk9DASULzDYaUvq057/DexSgR6rcJOzVVq9yCqxLC9oH38VKIyoOYfCaPC+kVq+1MHJYLj9NcYme1sBE1Uic4WAVn7vSkQFh9Q1QJTPvKRVyAymPTNpn7I1qutcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7e7624e584dso4651246a34.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 17:37:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788136622; x=1788741422;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NbUwABSyXUfHFIFe0q4fjbM71KBPwmbpCYbfdedoBPE=;
        b=m7D5dwgSYJ2dVlNauFkMC2O/2BtUedHdRSZd0lKgNDmmfmVp/OB7/LaAFzzJfV985V
         685W7fbzVREkJIJC5eniWr/LeN9F/xBm3kvzpBbvG1G7N7xh8B3TwsM25/RPCR6ez1X3
         qHnbPol1xJ7PaTvUeVU73btmNW3zfJ4ONCRi5ja1NzQo91av2WiPZNP4NEV9s7xdkz25
         gXinXN57c8edUOi1o2Ti1laEjBf0/dEhoWvxtlaWFh3icXjTQYVu17hZ5jcnXdgGi6MH
         m4GzNgvfeV+x0BdpaEWWl21lgljGd9hW+x5PWlJMrowDJTLKTZA7c56AdgFFaC6ExHkU
         7w2A==
X-Forwarded-Encrypted: i=1; AHgh+Rq7ZEoP5nNR6qbvs84g5vb8yMLad71wUK1i3Qz8fnUdvYOOXD4Ae9wiZ/cYW3JJsNAL9WhVCbut08aLG6E=@vger.kernel.org
X-Gm-Message-State: AFuF++mSEm+B9QbxcTM5RklqmwGS/tmnZsC9Jfl31tdeZ0p96H1G8Lfx
	N+s1We1Mq7GdxOlFYCqKKosdvcs6u8AChftxy6fC453yUXbQ/SwMw4O3et9npMENoFKDXWALsZY
	Ct6RrpCffy668dueg42duYCKgJJfypiii5rElfaa0U2KjTIQpO8ogwqyO4jE=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2818:b0:6b1:a11a:eef4 with SMTP id
 006d021491bc7-6b1c66c5267mr14595801eaf.14.1788136622229; Sun, 30 Aug 2026
 17:37:02 -0700 (PDT)
Date: Sun, 30 Aug 2026 17:37:02 -0700
In-Reply-To: <20260831001012.8665-1-kartikey406@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a94ccae.a8e469d2.cbf3.560f.GAE@google.com>
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Write in keyspan_close
From: syzbot <syzbot+5fabc1ae99ff40690d84@syzkaller.appspotmail.com>
To: kartikey406@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+5fabc1ae99ff40690d84@syzkaller.appspotmail.com
Tested-by: syzbot+5fabc1ae99ff40690d84@syzkaller.appspotmail.com

Tested on:

commit:         cee9395a Linux 7.3-rc1
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13a68349580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=5fabc1ae99ff40690d84
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=155a8349580000

Note: testing is done by a robot and is best-effort only.
