Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792472283;
	b=b8ST58ATmw27AqYaXaYphBfjfLKdBRcBV9vx157IP77aH4VSpv2LTXzPrgTLIjr5y8O1
	 wm3gghMaNGpZZI1/cK9iXjYA6P21sUQ9Poy+BgOj9EDACdPP9nDkTjOYXdd16VEkRzXm8
	 oJQLjqZ2jm7AUHwW9knWvnP/liVsb31JVjm7LujmI7N4Py1Z+aZEobUXX3xaGgzlc5lug
	 4raBfJfAGQPDl8XGOy8IJqiP53WPTFq3SdL2hmJUeNHaS1HN0vniKev+8c94yosgmcFIA
	 YIdLpK1mOilhBlaYz3zvsG8xdwQiuo9RqH/V+0DqnnlJ0fefHW6+kot6ddZqBLCwvvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792472283;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=PXvHI4ZMZs0RxUKTgV1Lb2DAyFnkL0Lb9mKLkFmdCz8=;
	b=4NlKBUICyRCWRT2w0usWsH4AWALnTikRm1BbuZNahsrGZaAbgiVoCnOi+abABc/962b1
	 lsV1ZyRwCwMzvb/NF/doVh6TU4x2Q/Mzsf3PBZYOYivT7s8ObyaK4QWd1MA6q4/AIlXA8
	 lIt6t7k6ZjJkRZ6eR144tMqIqwy5GWdnvLYr6MS3OyGcfm9kIntAr2lPyXJqVEJAhXvuI
	 fqFhnltPYiMadR/7cxJiX1kpis+6TTYbnNKMb6r1V01vCoEseCHt3V4iKN1J2Y7Amby6G
	 zNKCDO8GQNlEI/8zKkuXsBqlkppZTJ2hJ4FDxfIbEVIJaUkX/cruMDcJskhm0E+gY3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656DE606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 04:58:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 656DE606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b26d8d2498so4313648b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:58:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792472282; x=1793077082;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PXvHI4ZMZs0RxUKTgV1Lb2DAyFnkL0Lb9mKLkFmdCz8=;
        b=2jIYW0dclgPJKiy5gyy1+7ixG20EQXiSxlIhviEKnxSwOxTiirZF8qvpQZElNpwGYh
         6ikPzCoEcCxMj5I8cRgfovRg0cW3u25VwcLtyNQF+HbsTOpso+FVp4sfCEp5R7PHkJAO
         B2OimfQPamy8DURCTfvCjDRkBGS43D3+eKg1pWwK+IsoSBD45uEWfJco/s1E3mz+JFX/
         L3+BHxR47SgOwCJ26REenv1eYj4i/ueVu+3e9Cz6fVNvRZIWEp+nUdBnBk7uHTMWzAZL
         UfOkDrZQuOV44JO0GoNGAlOq++MXBWEbGZCv0ZbVtAje0nhZQ1H1iJjyJyUBNGEDhcH2
         c2hg==
X-Forwarded-Encrypted: i=1; AKwUvBzF4qnWavxLSgem+Xl6ETxmjv0cfjY+6UTMBScdsugGsHl8Y0fbP765IMTdT37l2B0hy/U/U54+g+ky9S0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIcBDpbbd3Lv5N2ACuYar0QFa0FQvyFXGEr872EkigdiMYO3Fqn
	ih6Jy6cXoq6GiLSjnFneZGWrGY8AP0MDBoMVvBUi8p3O4IO9PVwDffhiI1lCBe/d+kx5//gqpeR
	NBRv624+3JcEoaEckxtUYT+6sbqvg0TID8L9KVPJIBy5421m2DGYbGo75wF4=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:11ce:b0:4b3:8d45:aa2b with SMTP id
 5614622812f47-53cd247bd9dmr7816065b6e.16.1792472282388; Mon, 19 Oct 2026
 21:58:02 -0700 (PDT)
Date: Mon, 19 Oct 2026 21:58:02 -0700
In-Reply-To: <20261020042900.875-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad6f4da.f84f00d0.6bdd.0011.GAE@google.com>
Subject: Re: [syzbot] [x25?] possible deadlock in lapb_data_received
From: syzbot <syzbot+059a2795ad4cff2a2695@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+059a2795ad4cff2a2695@syzkaller.appspotmail.com
Tested-by: syzbot+059a2795ad4cff2a2695@syzkaller.appspotmail.com

Tested on:

commit:         70dd4ee7 Merge tag 'pinctrl-v7.3-3' of git://git.kerne..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=1701cc95580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c4b098695335c89f
dashboard link: https://syzkaller.appspot.com/bug?extid=059a2795ad4cff2a2695
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1250b831580000

Note: testing is done by a robot and is best-effort only.
