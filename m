Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261F4538D8C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788958385; cv=none; b=ecA5kWoUOFvY+QoTmhigYeaLzSHQAc4d5WGgAs1ma5VghwYH2AI+dJB1jwdGy+yDKFVdwRDXvluDBc9934x56cfgFinI7fkK5Uaxg9NqnMIzrSxy1z6TwkJ2E98akywQuftJKimudqCYq+rgvzLooh6veiHIexCFOOaDyA2J53g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788958385; c=relaxed/simple;
	bh=T+Q/8jC2f9D7hBhM4zsklcW2L8Qh0aUP8GhNPeg0Dk8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=NJ4ivGYd3g8jWAQn39KGnF1T4b8cgnz8FnbRlLO8j/evi3icV1h5BqRBAHOY+Zdq41gxOXbbqB7o7b/vtE+/kuj0dd/OiKNPeTU/+aMN9QoxM8D/fqhFLCoEyUBJz+GrrfwQZBdIOwhCJLigNPzofsHzzibCKw7KEfMC9m8fnA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b28dbf4197so6960863b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 05:53:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788958383; x=1789563183;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FV6LIX1tsANskJe/mD5+/mSZZNnS/pTAL8niVT1OFcE=;
        b=f1Np9VTv/nSRpI3jUL1Qlsk4o+JBVByvD/RReDaiRGiI/azdr2UQLBvt/vNWrQhMKH
         cQLhdIhMlm6THXbIDakUnncwFGwn8iLrBSG3IrCXcB0DIZp8CUER/vWHeIrLCXcw0nFm
         TBHhXwmzM5SkG5zhUKQWHJ0qHxKsGLSVCDMAa/sEB6GHQk7DhrGVz6sZfiA3QTrc8eQ/
         6jvUqFMCOSJPTqd4b80eByH1+GP7sshqZ2qkTVlWOumIqClf0PeLG4dbYYrjQqgDy6+K
         Fqbk+w1c0KlIouyU9WE/cZzfJmjc1YWhn9A8v/u15hrcndcBiO12D5ZsH5sK6cK08+jD
         X/Xg==
X-Gm-Message-State: AFuF++kZZ0fnitF4Tx39UVN+RgaR2C2F/Gy/Vsv7kQ1EErvWBMDZ3K+s
	v6nTLW5tjlL/mZUmjSxtOEMxmMsBhDCKrPHzmTG1pvWahptZcG12C81y7LXdrjUKveood5lU2p5
	3XMiKXj2+/d4QaMEow9GkeoUhHzry+h3z+J9GvGizG8owQs+NcnBppY4B8LY=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1c81:b0:6be:dc4:13f0 with SMTP id
 006d021491bc7-6be0dc419b3mr2186036eaf.49.1788958382990; Wed, 09 Sep 2026
 05:53:02 -0700 (PDT)
Date: Wed, 09 Sep 2026 05:53:02 -0700
In-Reply-To: <20260909123326.8921-1-syedtayyabfarooq08@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa156ae.f2639fcc.29487d.0005.GAE@google.com>
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Read in vhci_shutdown_connection
From: syzbot <syzbot+31117fde582fe6a0cd62@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syedtayyabfarooq08@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+31117fde582fe6a0cd62@syzkaller.appspotmail.com
Tested-by: syzbot+31117fde582fe6a0cd62@syzkaller.appspotmail.com

Tested on:

commit:         893e1178 Merge tag 'x86_urgent_for_7.3-rc3' of git://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16b77af9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ec55b50193b453ea
dashboard link: https://syzkaller.appspot.com/bug?extid=31117fde582fe6a0cd62
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12a77af9580000

Note: testing is done by a robot and is best-effort only.
