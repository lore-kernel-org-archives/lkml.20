Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793379843;
	b=3qGq2yANPv8bZpbGOOxRRQAzaleN2DMZw8es+5uHOCasX17Jez7PGZeOVtfz0n65NJph
	 Wd78zk4fgOuzmK1iD7tHkc24YPVGXjHQ7YOGtPaQ6to41qlbX7XGtGxYpzCeP8MWBVVRa
	 TvSNQZRyqjdD5OSTiQmdKcj49rg+HYyX6vSV/OERkWcRDLZ4ETxiEkVZfz/ovYW1h8urp
	 KHJfCXh17XNi4jkHrayOuwloNAPxc+bED7w5ySEWpgdwt3ScevzYuhvSRH7cgcx4cMUTS
	 HRUUpnHVmbceMmKAJvIWQW+K3NmsIu2A6eGoGFsThgFDXEP42PH/PZcr2Xw6IlqLh+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793379843;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=BmTjShnS2Rn+rNXZzO3ooF/r+penKcloUzDopqkf33w=;
	b=Ae+wdemhpNkYFuF8WqFi4U7qk3I3TJJ/F6WLslUiAKvAlalMQQF2faoZ/M6SxIU9qvvl
	 +mYZ+rvWA9GJKk+vgpvq1EUB1pJ6GWNGWSzy3NZeyv/5G7hioNAhIb4io0+1EB9inDOLh
	 zTGeXAo1dxC+cxeGSrPUHffY+mgQUH2/lwNnq3Y39gv5kWxy1JgHffBH+rxU6gbkZbn5i
	 mn5yT6/1au1GJ/FKge7R5oJXwlAC4UdryXKLg7jUgmTW2/xS0SbdTniz8i+TLVB4LP2zp
	 pf1dlbhe6fBaYk9YuGi3tSh7WU1seML+MW25YTK98TyoL4L4nixEot5YYosDscfmH6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3184F606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:04:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3184F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4cc89e86e4dso1376050b6e.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:04:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793379842; x=1793984642;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BmTjShnS2Rn+rNXZzO3ooF/r+penKcloUzDopqkf33w=;
        b=kYt7w7J8VBAbdMG6LLPPOU54cwGV61of0oZuqQJ2kAL8VnQD8xutDFpyHPcSoBHmfA
         vVpAH94GTiSWeuqOMQKHBsn0kVV/M6828bpS+FrHS3u9binf7YidIGgk1EdhPRnGG085
         aOupsvnOb+dj1nKfHkqiS8+xgmrEsVTg2vznIOzQedqVIgir5IIFy/zJE5pwGMN1nw/l
         V295scS69M6/X4wJZSlOtSJSs6+P0qRmzgXBADP1JfQTj83TVBpXlW2jpq2yEXSHGhyC
         ZbddEtxgs191IOUGoO0KknxtGZNX7jbHWke36beoUgoqgL20nnuba04+nygSRsns0xFW
         pu1A==
X-Forwarded-Encrypted: i=1; AKwUvBz/bFEpXrBaXhmtgLoGctLTWIHtFLYEsWAgg0PeVcnw9cB1j38zkRHGGLDP7c9cKV/QtTKCrprklPlDn1E=@vger.kernel.org
X-Gm-Message-State: AFq9FYIB2U0uWcCYG8p6AwbxXY203/XA4r4M2JQEVjzw0vHni9WzDOIs
	ZjtQcb/QEwLtv8VfLz3dHcrBCarTHaw5gxKxvP9acxGOavEQZH6GbqzoNAurwZNeK0Qs88nHO0H
	svNmGeLn5k63fnh+tyEuBYgBUjUmDy7ZfS8L5ZnlZ466HnCrQcsuynkRfx4I=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1b2b:b0:4f5:5cdc:84c9 with SMTP id
 5614622812f47-5640de8b99bmr2026033b6e.62.1793379842093; Fri, 30 Oct 2026
 10:04:02 -0700 (PDT)
Date: Fri, 30 Oct 2026 10:04:02 -0700
In-Reply-To: <20261030163834.396986-1-gowtham398gs@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae4ce02.b7bd089a.283bc.0004.GAE@google.com>
Subject: Re: [syzbot] [spi?] [usb?] WARNING in spi_register_controller (2)
From: syzbot <syzbot+41172204e7323356ecdb@syzkaller.appspotmail.com>
To: gowtham398gs@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, syzkaller@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+41172204e7323356ecdb@syzkaller.appspotmail.com
Tested-by: syzbot+41172204e7323356ecdb@syzkaller.appspotmail.com

Tested on:

commit:         d89e1d18 Merge tag 'fscrypt-for-linus' of git://git.ke..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=126b65a5580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4a49f7c2815c8df7
dashboard link: https://syzkaller.appspot.com/bug?extid=41172204e7323356ecdb
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1350b935580000

Note: testing is done by a robot and is best-effort only.
