Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BFD4A3F04
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 14:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788531607; cv=none; b=LwAT0v+KPARt8JteC8my1LmG3zmzLFcq1hB191TKn85H9rdzvIP7l96ayTKAQF52/bfHolZqwrjzMFencYxhRSaLY09tbIyQRay2Vuw2+AoEJZZ/z3OrT+0k4fmsWgXwKQ2tQYDMouhI2WHP7gCnCc5yVO+6qqNU6HtrtPTrg8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788531607; c=relaxed/simple;
	bh=5QTzQkaquEkuqB2VHwFUo9nweDR6n7uiUf8NNEkaIRg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Wg2QyH1cr8r5DqmfwP8hhndm5zrPJAIvAaVgdLo9OAC6b///wBMJ4s4EM0SJfWeGyJcyokrxYkR8xYjd5yR3fBRVf5LP2q4FgdE88yr6IRMIs47D44G4uLbmDg7QsnDoKFK8zNmnBZM3k7VbRl0h3R90+MKeUPrpxeFQQhkLG3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6b1b7932ec2so1015166eaf.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 07:20:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788531604; x=1789136404;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5hmrIKQOakYmkCXthZpE69u5jBNtoxxcF5MgpGPDI7M=;
        b=Fo8UsEj8jrIGNZ+cXBD7EHj1MOAAvkHIP65hSYbxvBfQVTitFWs+uY63MP2NluBShR
         gnqTW6wAtD5s4sfYFYklrPEqZhmtnFyuVLUovdjERL4piCaPOsXaFhH3w8DxU07UcUCJ
         6ynZBR+nddF7FEa4J+WcSDNXCyHfJy2YBEA/ZWjIpqciSwfE/Hb9FwqVz0b2NhfCySoQ
         187Xs3jRqQhBRPOI6fb2hEQ9XZAxYZvpd+/HaUufBCeyDhWbluoOkMeO6x2Y/ncOXjaX
         ndYpI11R3sXLW24FAECKT2frN9eg5CnE2W6qnznvroA92FKFeZRYzyxRhAOW2j/5ZbOu
         CpeQ==
X-Forwarded-Encrypted: i=1; AKwUvBwUOb7+ITDKpHHgUujkT842PEjiSddYiUTyFleEn38Vufy1+0Qd9RwrATOch3RpYw58D59yYJXD0iklKdg=@vger.kernel.org
X-Gm-Message-State: AFuF++kHD5BvRtVq2dnIn5WkH60es7AyndnaAU2ddKlXhf6ppWRwx4lc
	aT7DhorqFINaWZbVj9Py7KwKH2uveEjjj4GRS0KvJw93hKlgdL7Atf5a6zebysULFBU1CLoUYlf
	GpqaCHLRde6Awk4rzfqPMMtWvloU+OL2vQKTY5TCSoZZqpDNEW4kskn2FRzQ=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:603:b0:6b7:8415:d784 with SMTP id
 006d021491bc7-6b78415d7fdmr2019869eaf.47.1788531604438; Fri, 04 Sep 2026
 07:20:04 -0700 (PDT)
Date: Fri, 04 Sep 2026 07:20:04 -0700
In-Reply-To: <20260904134424.201467-1-adrianox@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9ad394.d07ac993.c20e9.0002.GAE@google.com>
Subject: Re: [syzbot] [fs?] KASAN: slab-use-after-free Write in do_bad_area
From: syzbot <syzbot+7bf725ed337e37307001@syzkaller.appspotmail.com>
To: adrianox@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+7bf725ed337e37307001@syzkaller.appspotmail.com
Tested-by: syzbot+7bf725ed337e37307001@syzkaller.appspotmail.com

Tested on:

commit:         bc35965f Merge tag 'mm-hotfixes-stable-2026-09-03-17-4..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=156b08f9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c74f18ede748dc5f
dashboard link: https://syzkaller.appspot.com/bug?extid=7bf725ed337e37307001
compiler:       aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: arm64
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11c138f9580000

Note: testing is done by a robot and is best-effort only.
