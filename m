Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793613545;
	b=uRKASV+vMFL7jhUPVJHOWqfIk8hs6arAkfT1tDTELDyVbOQwF3Cjn7zY40hKup6JtyGj
	 k6iSg2a7WG/HM8JQJuHacCV3N1Th5upmW2EcpG6E+mNDru3P9rUKtwr/FL2+LlA9piDm9
	 X8TZ6oN5kKg6rKn1B2LvnNDmeDXHjMeqab8g7LxuYXpCoLKorOY6C+xLOdXkqBQVQK9PD
	 uGkcAbWIjVUJW68wvB678MI9cGQufJJt3S5LdnFtxJx2LxPdXSpSlWA3OfNk2kl0EUteJ
	 fnXyW7DlsKydqgwJV2XrRcfmjpnDnapO20+PcZLC8fXSr1DAyT4BklqvsdbA1cr+ogg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793613545;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=LEr0xuz+PJpQjQ8bxJaOinpflke/hxpD0oZbiDBFu5o=;
	b=nK+LdEOgM9ynGq1iqzYKIJMvqzF1hsGWCfx4iNSQjGdf9xG4k3ZJH1FYURwqO7hdMjB/
	 vwBJHXUW4cWVRSjze2UWsm1d+mfqlShLzm0BL6NsAnnYJ7m5KDKjUpdQDKM/MA9O0dc60
	 KsyQlojKMsmAIrPPDb1HNSS7wTTqKnBPbdNKetISZmcWC8ZiCM/GtD8oa//T+3F9gpDEv
	 WBDZQexYBqsFS7VWSF6R34bmPkC1dTRRBKsnAVI6lHeQiHG1MXx2FerYfjLD/GnpIQWLJ
	 +xab2B/SDaxjt4lVN5d87/vRfVLdDKP/wLxsdGQ46WAF55sTox9bJprnXSJP9px8j9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.69
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49EC5606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:59:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49EC5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-846863cd436so1015205a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 01:59:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793613544; x=1794218344;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LEr0xuz+PJpQjQ8bxJaOinpflke/hxpD0oZbiDBFu5o=;
        b=u3YpZqTeZwQBZR7sMGzGVmqPKWwt7h7NLfsi3BoJmCEPR3CHz2se70cC++XhYJJZjt
         0qXefS705cxFe7Zz98EWpyb19wd43ZgIm5RjbAWNi1aRU4Py1nIy6SlWBl66VBR/Iy3F
         dZpOS5ZaCwmMouCOdOQbO+RZYNKNC+dlriu5RJBlefezhhefLFU2sXXJxAhOLmpvB57F
         g5IVNiVJkzWUjdwuGflZcREBuUzVlvNGb0d/8XdFDnu62L+YJD6xbydmIaruUpclBG/8
         Qt+1obONuoN9miSRqR5nhvDIQKADEU1azUpdL9xI0gQaZ9aPeLRCbvhhvRbXRQH0gQhc
         zufQ==
X-Forwarded-Encrypted: i=1; AKwUvBytiaCHZZebJlAWgrHR9TdeIbz0aDenoiO98xMgeT4OR3HXVqraJFUfOh63It4fXjPxybJ360EfHYegw4M=@vger.kernel.org
X-Gm-Message-State: AFq9FYIoNbR4vWgbetk6KNVPvXYISbMXgalbKZ9WW79nRihtGPHWXeb9
	5yqVhjaeVqv9ksXCFAuW/xQA3VNCFS27YGsXx1XdlKMA5RC0SK1z14irvlTqDePa6hfeV+IxXGj
	q49ls5tbMz9Y1O+F/NDJyZWic3NB5+F/MKWH6VYt4+N6HVW1ZoIbd+G6bX9o=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:250d:b0:539:a2c2:aba3 with SMTP id
 5614622812f47-5640dee0588mr6652485b6e.52.1793613544340; Mon, 02 Nov 2026
 01:59:04 -0800 (PST)
Date: Mon, 02 Nov 2026 01:59:04 -0800
In-Reply-To: <1793607766.6AE84856.001.4jJ4T2440Pz3nWY@fangwg01>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae85ee8.7fe51036.1ecf7.0034.GAE@google.com>
Subject: Re: [syzbot] [input?] [usb?] general protection fault in saitek_event
From: syzbot <syzbot+eba2b3201bd25a97cddf@syzkaller.appspotmail.com>
To: dlzhangak@isoftstone.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+eba2b3201bd25a97cddf@syzkaller.appspotmail.com
Tested-by: syzbot+eba2b3201bd25a97cddf@syzkaller.appspotmail.com

Tested on:

commit:         6628e7d4 Linux 7.4-rc1
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=131a8581580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=54057b894b08d3d4
dashboard link: https://syzkaller.appspot.com/bug?extid=eba2b3201bd25a97cddf
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=16b9284e580000

Note: testing is done by a robot and is best-effort only.
