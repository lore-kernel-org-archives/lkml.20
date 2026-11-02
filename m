Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793588103;
	b=gsEuCFIrgyD4gYD439/oUqA1tJktUkOhI6T/MTOntNhXEPGpmYp5K41XhPRe6oT/JQP5
	 BWirXZlwUpuZkxyCuuXempIoWe2oO1gEEMGEtnd2saQycFeq/QbeB55HT+LJf7SzNBV2r
	 JB5WMclE9C/+bOG8EzheGT6VXit16iWUSXBoywPXwQtBEok+95EsyI7x/rHMWJXxhGd9b
	 HrK5ZqMe4rfJTOgbW4sTm7VErhG/kcoktIBvh+DQqCgN4dEE5523gQWkVep5OeMplvGF2
	 ar269iwAV05tNO0finIZ8XDnZSYe1JOxT8RzUPVzP33n4rD44Pi3qR/QHLqoLsr7RvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793588103;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=js2+aFipwjc1iEKrWbKe4EukgHY4QeQ/3UuzBqQXiBg=;
	b=hIt1w+f8XJmhl6GBLXnzGr7ATR+DKCO32SeFkB7HovrtsogF+hoIdHcaWF+sVFFLai6f
	 RuERPPOmEIZ05EbrUlUp/cDDF1pQpJ68ESw0kcDe/uo3dWXhYtoiutw/f2il+UEGksmzX
	 iCmI9qFe33rWWmSMN5pi4XkkSV7Ian/t7VoYrp0S+wFU5czs3nFhtYn2r0n0VSouRFRzX
	 FAKbLRygcgsV1oUGBKgKtJnoX7UWX+wrMyFqZFA2CCqPysUX2+NH1EWHmRQKBfLzGN0E7
	 5dYeOQB8ZyHUm+aZdoSMoycyRK8ga2oYQkqZwlf5iy2SGiQD9MZel2f8Hh1enMT9+2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60471606A329
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 02:55:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60471606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4dab94dc3e7so3998485b6e.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 18:55:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793588102; x=1794192902;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=js2+aFipwjc1iEKrWbKe4EukgHY4QeQ/3UuzBqQXiBg=;
        b=Jv+GtBeyI+K3gi2u/UQja/Zzd6Z7PMd+0s/d2VNem41ls922IjL4m32CNHOhU355V3
         DPOBu7B+2oXtC/cKhQyE9vMwmvcBaEGbgVxFXDAqXgQi5TBudQp5uyELpuDE611pwF/p
         2USXG5RDPawTLQkda9uB0nF0hIACmy4K1p/ECnAL/2ucPt3+pB7/dbAJZqY/UZJ/1nHT
         L86/vCYzeSFnewYy+xyMqlHclJAmh2NOWh6e8TUHARTBFiakcZrNY5Umt/ToZxfuw532
         UyY3sXSDYqVZ0PZhKf0XUXwUDx0rtkatkzSr2lJcE7WZcTkeIZf1Q6VTPqIkyY550Qji
         PBUQ==
X-Forwarded-Encrypted: i=1; AKwUvBynRd9H6JNtLFos9XBP2SoYpXsRtN6G6YGAp36F8HqI5yLJucpGIaFF5vgfWZMkGMupcZnZr5xLeFVwhsw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXbZ0sLvvSdxMtDJORrB6OjSgyLqXNmFSMfyGWyKb6aDDGtzOC
	rXSSh1A9PHPY/UkjtDFbD9W8wI1lMojrXDhVHD5SYb0hsCESgtC9V+XX0DQ6BKp3g/ZDnsxHL9d
	nvwkHrFWXUYM247qfJRxHTN/5J3sDzb3kAtZjarkCIYOjv74GBefTQTIStPI=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1520:b0:4ec:d521:9124 with SMTP id
 5614622812f47-5640de27b0emr6173623b6e.30.1793588102382; Sun, 01 Nov 2026
 18:55:02 -0800 (PST)
Date: Sun, 01 Nov 2026 18:55:02 -0800
In-Reply-To: <0ba396c9-1881-4ce9-a84e-6b96c2445228@huaweicloud.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae7fb86.c8ffc79a.e3697.0029.GAE@google.com>
Subject: Re: [syzbot] [ext4?] WARNING in ext4_do_writepages
From: syzbot <syzbot+97fbc97fdd4e4fa2ed3a@syzkaller.appspotmail.com>
To: adilger.kernel@dilger.ca, jack@suse.cz, libaokun@linux.alibaba.com, 
	linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ojaswin@linux.ibm.com, ritesh.list@gmail.com, syzkaller-bugs@googlegroups.com, 
	tytso@mit.edu, yi.zhang@huaweicloud.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+97fbc97fdd4e4fa2ed3a@syzkaller.appspotmail.com
Tested-by: syzbot+97fbc97fdd4e4fa2ed3a@syzkaller.appspotmail.com

Tested on:

commit:         6628e7d4 Linux 7.4-rc1
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12bddc8d580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2a4f87c7d3edc25f
dashboard link: https://syzkaller.appspot.com/bug?extid=97fbc97fdd4e4fa2ed3a
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1549028d580000

Note: testing is done by a robot and is best-effort only.
