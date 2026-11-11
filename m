Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794376603;
	b=rKhNrq/6151a9RaHLvPl4DA0ape6TmBK8L1EKXaoKfEXIFkpuZSrSI0Syx2NKihpgAPY
	 CnzWeerTVnOogdI+ICkE2QBcIPrybgJeH8vU5hS5tOdgZRAakXc4I4Xxw97Hj9PClW+cB
	 LmbpmRXX7WM+O/+Xyn6w+KJt2yjrUUiq4MDKyhciOrEEd44eoc95FlxAZMalydqVHzho9
	 i4NinIILkgfymQjPGlE8SKXURtX9EH8Buw3rtO7CDWUKdg0n1JgzLgmrq5nTku/etFfYt
	 NDYhwHG3ibCt1scBL8r8hRl8bTNlM/VnFG3/BtKFMjq9tVS6F47omOm4PAavHn/IqZw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794376603;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=SVdC4NoqsEAb0xjeu4zg9bcnEb0TfO6Tqq8G+6Aa5+w=;
	b=QajpkZQul5CsqF37KNScqs0TDdYIbuUICja1rONVnsCMhMqEHAgsoxDjkCfK1QK5mriS
	 tZ6zTYJW69Vr/BKIf7ZX0QFCFr0tXkZP7pqYOF9cHx71ebt5qco2kU5vt8czm0B4RUTZ+
	 fu/HHSx8JyFREOLgbu+nXKfD9BYIC6aXzyOqkgfRkmUs1aHdCA4bhj55+ASCq0C4rDhCS
	 4wRdShNCUibcj6J0+TheLhCEQtbMX5Dm8tqzeA7gHnY9DXEcRFdHrBJJyBnHht75WYLcB
	 sLwHu2C7y2NZ8XSUSHJPcC3RO0TN5DemhbnL2bFenAA6ADmik4UYUTBvii4ML1PfYpw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j8DnNixo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.170
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12827606A320
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 05:56:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12827606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j8DnNixo
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4ab8cb2a6e4so1780633b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 21:56:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794376601; cv=none;
        d=google.com; s=arc-20260327;
        b=O4GXmkPpebsEl9F5uAhzpsDH8sYd16b/H/zEOy3TwtIPxGhIlYnygU7XYAoW+ASzCy
         oFVnaMaV4V5/XfQBBEjaLQ5Np6aAvf8hGnXg3DNSN9lXAFuNlwsgXkCGf4ZA9+8PrC7s
         zlyhUgqzPvw1oTwZdLHQXOVQKeBTgBVNKvywSa+swOlSgehLdAN+A4pwxFwad/E4Cwgs
         Fiye4LvF31um6XK0HJOcF2zxS2VOZI/zRGAlFWVF+82yoAAz1ndEAdRkppiLvg/a2lZY
         NaEWevhVVxN/IR8FZ4FWjKTG9uWcY57DLBw9daQwayTdk3Sh2ydhKdnw8Q2WMLkZmGwa
         B4bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SVdC4NoqsEAb0xjeu4zg9bcnEb0TfO6Tqq8G+6Aa5+w=;
        fh=F94YIJfuvG1s0/B/97hmC8LpkKCtChbPBn8mChdUfqk=;
        b=FaqGCKfXvb464RqtSx/DDEQN2mh84IOKtBEuhAcZRHJrTGLylax5XME0D8y6f1uIG/
         aNEeNZoWFR7GgFecUfg9SIAlRijARPk2rgHYYAZFG+Aw8RnzBm++LVILdq0m99EoocTq
         cpss+R3O9+LreDLDNiDiQwtwv0jdafGYa7U1kf0nJc87bzyJsHJn6Ga1efqIGbAdHDgP
         US8i+vu8QdxIsx9+SBTaRysZKJ5yOUm/6l7o9ho0oa5SGYil5qFl+6LpIf7UBhJwhYRF
         UpnRjZp1vGvvDU1fc2wQhMsdWH9ueLHyoXkYb3aQ5BNSNw+6L/mDio9Ir9STBrW5M22/
         DBww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794376601; x=1794981401; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SVdC4NoqsEAb0xjeu4zg9bcnEb0TfO6Tqq8G+6Aa5+w=;
        b=j8DnNixo91ABh6Ud1k1J3g8aT3pLJT9qPII6YHh2PMwH0GPT0uCz17ceNKSWkB4kSo
         zNlqE6pisPqCcWJ0rHOnmVMs0oCFgNLWxkXLb9XHr1uelXj91icqJRc1JoDF3Uir7d0y
         yq12Y/L5wojdgHri6yXzY9qQI0EiKOx1GoVa9QHA3NobFrl/0nYgHysu1rp2yqjLQd72
         KUVmDsMyQ0hEVI2V9+KVllo1Pob7VGPMUxJ/aoyOOT4k4/f6jDvOXvzEgeecLyH5ydTq
         cORxLEcFj1HltGhuJswiKqhQ//CWBKlYTTSVjhNP4fuu7iClRZCv8tAMyZPZWUN8leqc
         YsxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794376601; x=1794981401;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SVdC4NoqsEAb0xjeu4zg9bcnEb0TfO6Tqq8G+6Aa5+w=;
        b=cSoxHhPz4IGBCDh/zab1AhIAzx0wF65sm97XsIupH95z9YrezcDqwfASZNEn+PRqlJ
         0U7M7dE+HD8wN9JHhfDyBF13gZ0a0seF7YbNds7p3q1L1ZXjtNSzZF6qBXK6j5QwRBlK
         URT8UFJMA6QQId6taBXcT8P9Hq1AC2qBxd40B7NfaG89M9Xp9FpA/IDl3jO+nwmf0zsP
         e4W8/3u6MpdSWIooa4BDwZeIvD91fLodJSUCpxolvEmwNjMhhlMBxSsAszxulverLXCq
         oay+pYMBlqluVbTUEYwZW1bw+Q6qsH7TM9kBuguiOrC5TsKWjtfjZgHTs/KaZOhR7t4y
         w79A==
X-Forwarded-Encrypted: i=1; AL+hErHxW+J82Wq7pdHY0DAbTv5ivIc+7ITm0btpRBpHyY47Kpbg97lhq6ANWjeY8bJGJGDHFiADYlLAlmT9xoY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8p6rUhGqkyVq1mhGP1R1eIwgw0fu21fj4wCZ5llj7eMPJv35Cz
	ItZRnt/qaCNVwuoJwcROP267odLlcaFJLL5ZssP1K/ypHxzwT+KqhhAworSG38zBMdocOWGGqIa
	VTozfvL+j63UW8AlO6G/pCtBRzbQ5/VE=
X-Gm-Gg: AYBFou0WMHZ6kEBvGvhd8IsvdzmgErH3Jdo9y906rDm5nqc8ifawSt9bn6LOjMtaD8H
	4KQgFvbB463Cddhv4VmAhIp1FNHYWiYR5CT5OZdIAVE7a9qt6oPFLFU+zSs0LNRNSu0XNs38xzb
	InUTCuYi/Ho0sJUsOTKtA37FLd2U4619eXCcRaktdmlp/H4rNsLUlcLEMPK3iu3g2SMv9bbzwPr
	Fs9xk/Uie7dWuw1avpq8/B81BT9WPr3lBKjjvsAA18jRN6vxjoAi7VwMBerYkwvCH1HXijwwIit
	3qj1lFxgQ5r2xObRp26kvH+qwgYwnH9g/MD61P1B+6f5kCJyWY3SvJF1FZ/4ihXujkL/1LmH5vi
	/lJ+8V7GKN/XCKT/BcYfqgVMhel+fjWCXxgf9acmDXxBrGBYd3DUlFTENWmSq3RqMPwjsVDB66Y
	F5Uw/dUF0XLVIR12MTphNruQmnmoztJaLaCcj9QKHjNW1UeEZx1+U=
X-Received: by 2002:a05:6808:4f23:b0:53a:e153:e901 with SMTP id
 5614622812f47-56b932504ffmr1277212b6e.2.1794376601509; Tue, 10 Nov 2026
 21:56:41 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <6ae09458.f0fe5aea.79aa1.008e.GAE@google.com> <20261027101009.18e9136537144533915008e4@linux-foundation.org>
In-Reply-To: <20261027101009.18e9136537144533915008e4@linux-foundation.org>
From: Rohith Matam <rohithmatham@gmail.com>
Date: Tue, 10 Nov 2026 21:56:30 -0800
X-Gm-Features: AclHuK-vbFkZZTGrimsL-YTV39zkF7VzvFxaCKkhVtRTZJlOUBJ0WGB_WgVtgM8
Message-ID: <CA+FtcErvvvg8EQUpgravNPTib4_CnFb3W20PY-xMYSTdDH4=4A@mail.gmail.com>
Subject: Re: [syzbot] [mm?] [usb?] WARNING in corrupted (4)
To: Andrew Morton <akpm@linux-foundation.org>
Cc: syzbot <syzbot+9fe09db3795456e0b442@syzkaller.appspotmail.com>, cl@gentwo.org, 
	hao.li@linux.dev, harry@kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-usb@vger.kernel.org, rientjes@google.com, 
	roman.gushchin@linux.dev, syzkaller-bugs@googlegroups.com, vbabka@kernel.org, 
	mchehab@kernel.org, hverkuil@kernel.org, duoming@zju.edu.cn, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andrew,

I retested my v6 patch against the October reproducer, and syzbot
reported the patch test as OK.

The patch removes URB_FREE_BUFFER from the Siano-owned buffer and also
fixes the related work initialization and teardown ordering.

Patch:
https://lore.kernel.org/r/20260601201639.63171-1-rohithmatham@gmail.com

Mauro, Hans, could you please take another look at v6 for inclusion?

Thanks,
Rohith


On Tue, 27 Oct 2026 at 10:10, Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Tue, 27 Oct 2026 05:08:56 -0700 syzbot <syzbot+9fe09db3795456e0b442@syzkaller.appspotmail.com> wrote:
>
> > Hello,
> >
> > syzbot found the following issue on:
> >
> > HEAD commit:    5b0764a53235 Merge tag 'drm-next-2026-10-21' of https://gi..
> > git tree:       upstream
> > console output: https://syzkaller.appspot.com/x/log.txt?x=13739fc9580000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=fd1433abd362f255
> > dashboard link: https://syzkaller.appspot.com/bug?extid=9fe09db3795456e0b442
> > compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
> > userspace arch: i386
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11cb9b0d580000
> >
> > Downloadable assets:
> > disk image: https://storage.googleapis.com/syzbot-assets/05ac8658d211/disk-5b0764a5.raw.xz
> > vmlinux: https://storage.googleapis.com/syzbot-assets/9cfb73243216/vmlinux-5b0764a5.xz
> > kernel image: https://storage.googleapis.com/syzbot-assets/fc45c7faf785/bzImage-5b0764a5.xz
> >
> > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > Reported-by: syzbot+9fe09db3795456e0b442@syzkaller.appspotmail.com
> >
> > ------------[ cut here ]------------
> > !PageLargeKmalloc(page)
> > WARNING: mm/slub.c:6855 at free_large_kmalloc+0x97/0x110 mm/slub.c:6855, CPU#0: kworker/0:1/10
> >
>
> Thanks.
>
> > This report is generated by a bot.
>
> So is this report ;)
>
> This looks like a double free in the Siano USB media driver, rather
> than an MM bug.
>
> The failure occurs during USB probe error recovery. The allocation
> comes from smscore_register_device(), and the page-owner records show
> that smscore_unregister_device() has already freed it. The USB core
> can then attempt to free the same memory because smsusb_submit_urb()
> sets URB_FREE_BUFFER on a buffer owned by the Siano core.
>
> Rohith Matam posted a patch in June which removes URB_FREE_BUFFER
> and fixes several related URB teardown races:
>
> https://lore.kernel.org/r/20260601201639.63171-1-rohithmatham@gmail.com
>
> I don't know why that patch hasn't resolved this problem, but it
> would be worth revisiting before developing another fix.
>
> This doesn't appear to need any MM changes.
