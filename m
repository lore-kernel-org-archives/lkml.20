Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793577545;
	b=csT1zoEF6B3ea+dnU9WbkSY1dF4wVCZwhXijW/fABFY39zdKTkXySbBpSiM/kKFmmp3X
	 GfJaTWFzzzLUGZNjh7qFF/GwzCoU1yY6AXApikZrIh0I3EdNFR7SDBEEFfD9/zf8F3Qhh
	 vtSYXtUHDTbsikRR5t4nF9Q7O9WZb07wiCI3o2KwpGuPcmHRbloTv37mDUsVsodTsRI/9
	 cvcBRF6fGFJ/4SYS6VGHBbDYEK/U+HmbVW03iCYH5+iW0TbrgYEDZezyY5bxZZ6dOhMIO
	 yJM3VhogjCULwhykSnQyOPD1jpBTStNuaMP9n/+VSZCQR5DUwbMcGdkVuZ3hp5/3suw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793577545;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=jh1fZf1WMpFl+qFotAlD4ZYQpf446WysxTR0+g8y2sA=;
	b=pgPLMBCWXES9439NaLNZJSFXTGjvPavqRocnTtMgYiExbO4WtHd5Z9jBqJmjHV9uElBb
	 lw+L32f7CT21+3m6NJeQpXkSj5Iyuj+xhI6mwW+RQ/mlihxY+PqfO5TzbZ1OE9Nsn/FuI
	 ghqHC331BXCfpugHmQQZ3pK/3esyCntPc7KjjC6LHU1ncrmjIAX8CWBRPtSBp2qHrKTk2
	 NVjNfjR7FekUc+Hhivaj3a6m7ig9x6FDIEWG1zbs8Gts2YGiiJJzZoCHl3SFLJKJvZ5ye
	 bdJ8BWdOqd/U+UXOG2JJ+A7M+rgo4y9iInWwl+ciew4F514d5lRBStoMvgEz8FkGD7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FE9606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 23:59:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52FE9606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-5640a2d9708so3473674b6e.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 15:59:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793577544; x=1794182344;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jh1fZf1WMpFl+qFotAlD4ZYQpf446WysxTR0+g8y2sA=;
        b=NKc3dXOPyjyRP5eHaKaorekQdsRZzl2gj12xY0hg7TPbyfKIejPshnM6adB+cLqddt
         hFnLAFpwFAhhkegImyuCww2Lc3WLacL+lWlL01zhXIvdTKrmnrOxzfTT3H2E3H+5Fh0+
         a2lZBcGODYNZRCK/FGVl54tQ+kerlmxu0TtA3Uca4NkL0NwMoEv1vqV/baw9yf48RkSR
         st3OXvOyujl5VkPhQ0kksaDClz6Ib/ecuLI61VMUiCJ1wtxeC+T9wsdqmDChhNFtIwoL
         +O5Wgx+JD0E/xyoB/BbY+Xt/xej35vj+orVGqe+Dv/8lwZaeXWjy4DHk6RVkxAhtXHIp
         iZSQ==
X-Forwarded-Encrypted: i=1; AKwUvByHyYWZCVHtc1diBEgEkTGNVcvrL+qo6K/y0RXUSq3qieuR8CUp6+4m8BX9TMzBLdTukRdz3YV23e9/lAE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLaaqEmJy3CxVNPFQvU1iOTUmbwFlbuWCQaGZ6sT20C1aGnkK9Y
	YSQHb1gBIcOc10jR64ktAqbd1+fcncYUl+amaKfYEaHUABb36l4eP1IYrAuQWnJ1GZBXkfqGgDG
	MCBiwfEJp5ks6GRxz3BggwTYvvmkw1nSA4mFARAXjpsReZqfnDgwOSHZ4TYg=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c3d5:b0:53d:c86f:d332 with SMTP id
 5614622812f47-5640ddf9e52mr5937770b6e.22.1793577544347; Sun, 01 Nov 2026
 15:59:04 -0800 (PST)
Date: Sun, 01 Nov 2026 15:59:04 -0800
In-Reply-To: <20261101203618.146-1-drifabdelmalekmohamedsaid@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae7d248.7fe51036.1ecf7.0031.GAE@google.com>
Subject: Re: [syzbot] [media?] [usb?] KASAN: slab-use-after-free Read in v4l2_device_disconnect
From: syzbot <syzbot+1e71765881a6fc43185f@syzkaller.appspotmail.com>
To: drifabdelmalekmohamedsaid@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+1e71765881a6fc43185f@syzkaller.appspotmail.com
Tested-by: syzbot+1e71765881a6fc43185f@syzkaller.appspotmail.com

Tested on:

commit:         6628e7d4 Linux 7.4-rc1
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17327a2d580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1d2c97eac7d33533
dashboard link: https://syzkaller.appspot.com/bug?extid=1e71765881a6fc43185f
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14fdb5e1580000

Note: testing is done by a robot and is best-effort only.
