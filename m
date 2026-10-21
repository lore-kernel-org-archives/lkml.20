Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792576684;
	b=VEmWzD3JhxWxqViQrb1ilxozJ0M/fegr79KNzJpvqs5l6yceBdfVFxYJZLi7xsF8bHfa
	 1mroHbSWrhYg7ZAXnI+8z2bMV7cf9IUwcdy66BVrcCria24alAqpkzH539niYAiF9Gear
	 tn+hnaO8gKc9Wju4SZs6e1etq3Mabn2v5ziQTrrPN+6JusmwXIGsy1lkaD4JU4F3hIwLs
	 rU4591heHEkH9BVGZH5uyVEtqTJwJ0gT4VnaFBLa3oLECQcCLqW8Sy7gfuKcLUN6tDY89
	 8hoamxVYzbFp5oyh/2zPSR+N4QT7d7+YYwZdsbK+XvkOunLi5rkGTa68SNZs/ukX+qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792576684;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=7SjDaQ4pe825A9BLw+4oEFxNi2F27DZJ8HAcV1Uc7FY=;
	b=Cs2kO6WiXNjmNZc72Jc9z1qWVQdbMffnrsHsxWuPew6mpJWmKEKyVyPLZnQw02km/13q
	 esZFMTCeXT/30ddrcvc7xM0fps16UNoepVhh4Mh8qr9xJv9xtJykp7fgnPIINrtmqDxqv
	 qEnvnQtKUG3qwi6In9m6BugQdSPE/Wwr8T/t5BWaDZLsmQ0RvATrCapGMeK3bSvBx/DCc
	 EUMzucnk/apL5qVXXRHHIxETSR98ww9UOca1rGnQVXcXksYV74J4me02TGxKl+vUrVPPp
	 IiBkEdyHpbHacP34OKdyl+cCPmR5pzMmyJdAL0ZLNNNSMzy3ZaWFeU65Q6fLWcRJJ2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F44606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:58:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61F44606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-547ae874949so744197b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:58:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792576683; x=1793181483;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7SjDaQ4pe825A9BLw+4oEFxNi2F27DZJ8HAcV1Uc7FY=;
        b=D7a5XJcu31s73SmRXblYKnLQczSuDtlcDzWvbecHbyap7iT7ewBjMY+elv64H5EKdg
         RC/SvctBkJErcY4+Dn3z4F+4kRGCEuKfiqAAb0BwhnGjD4TnV47j/CwxDadQ1ffMYuEF
         zj/3l8czOZyZqRr0epQY+fMFA0cb4GYtopYTkykW5FobvWww5fzktr4NWewvL3amp6D8
         PgcIqbGBY3XdimHoN432q1PVw0u9LOLG+pL/z66XIZDzWuP0VPVDeVoSOH+xJxM7hIBn
         WwLgoP6cZut7ce9qpXFepjzrRaKpb6IEvXuCWR1YPK21ajP6XPOIRTZeiWVaclhjVo24
         wFig==
X-Forwarded-Encrypted: i=1; AKwUvBwTheNS/63DB0rzNjR62ZqkHx0FBNgJd1yQ9rA6K7lTX4qGmix++ZHCLL7mrQNkX8vOzUUElpyXl64wbE0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIof0aKYBT3f65ZMyT50okjYB8jykKuv11PmXB1pxdUFypHhfX6
	0ftJ7l24lVnXQGdpftaTjgKHoALmVv85FxHB+Vjv8mhmacZD7VBmsVk10df2Qq6bKpDh5twtBLr
	UF/N/KEpxxC9nJC/sIXTiL1yT4+Uwf0gsUtPObBQO0/8asm4p5S8SpQ/ZckU=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:bc6:b0:54c:7bef:90d6 with SMTP id
 5614622812f47-55351ac00aamr936374b6e.4.1792576683306; Wed, 21 Oct 2026
 02:58:03 -0700 (PDT)
Date: Wed, 21 Oct 2026 02:58:03 -0700
In-Reply-To: <20261021094037.61096-1-eadavis@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad88cab.5c73e770.1a06c9.0141.GAE@google.com>
Subject: Re: [syzbot] kernel BUG in create_default_group...
From: syzbot <syzbot+4fae162886e497f72228@syzkaller.appspotmail.com>
To: eadavis@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
kernel BUG in create_default_group...

Warning: Permanently added '[localhost]:52391' (ED25519) to the list of known hosts.
[*] Starting reproducer for kernel BUG in create_default_group...
[+] mkdir /sys/kernel/config successful or directory already exists.
[+] configfs mounted or already mounted.
[+] mkdir /sys/kernel/debug successful or directory already exists.
[+] debugfs mounted or already mounted.
[+] Successfully wrote 'N
' to /sys/kernel/debug/failslab/ignore-gfp-wait
[+] Successfully wrote 'N
' to /sys/kernel/debug/failslab/cache-filter
[+] Successfully wrote '-1
' to /sys/kernel/debug/failslab/times
[+] Pre-clean of /sys/kernel/config/nvmet/ports/1 successful.
[+] Online CPU count: 1
[+] Started 6 background racing helper threads.
[*] Iterating fault injection points (fail-nth 1..80 with concurrent race)...
[*] Testing fail-nth = 1 (1 attempts)...
[*] Testing fail-nth = 2 (1 attempts)...
[*] Testing fail-nth = 3 (1 attempts)...
[*] Testing fail-nth = 4 (1 attempts)...
[*] Testing fail-nth = 5 (1 attempts)...
[*] Testing fail-nth = 6 (1 attempts)...
[*] Testing fail-nth = 7 (1 attempts)...
[*] Testing fail-nth = 8 (1 attempts)...
[*] Testing fail-nth = 9 (1 attempts)...
[*] Testing fail-nth = 10 (1 attempts)...
[*] Testing fail-nth = 11 (1 attempts)...
[*] Testing fail-nth = 12 (1 attempts)...
[*] Testing fail-nth = 13 (1 attempts)...
[*] Testing fail-nth = 14 (1 attempts)...
[*] Testing fail-nth = 15 (1 attempts)...
[*] Testing fail-nth = 16 (1 attempts)...
[*] Testing fail-nth = 17 (1 attempts)...
[*] Testing fail-nth = 18 (1 attempts)...
[*] Testing fail-nth = 19 (1 attempts)...
[*] Testing fail-nth = 20 (1 attempts)...
[*] Testing fail-nth = 21 (1 attempts)...
[*] Testing fail-nth = 22 (1 attempts)...
[*] Testing fail-nth = 23 (1 attempts)...
[*] Testing fail-nth = 24 (1 attempts)...
[*] Testing fail-nth = 25 (1 attempts)...
[*] Testing fail-nth = 26 (1 attempts)...
[*] Testing fail-nth = 27 (1 attempts)...
[*] Testing fail-nth = 28 (1 attempts)...
[*] Testing fail-nth = 29 (1 attempts)...
[*] Testing fail-nth = 30 (1 attempts)...
[*] Testing fail-nth = 31 (1 attempts)...
[*] Testing fail-nth = 32 (1 attempts)...
[*] Testing fail-nth = 33 (1 attempts)...
[*] Testing fail-nth = 34 (1 attempts)...
[*] Testing fail-nth = 35 (1 attempts)...


Tested on:

commit:         58161ead Merge tag 'drm-fixes-2026-10-17' of https://g..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=11b5ebcd580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4ccb65e03706547e
dashboard link: https://syzkaller.appspot.com/bug?extid=4fae162886e497f72228
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12c84e7f980000

