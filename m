Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A489347668C
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789402685; cv=none; b=gC6aRs18ANmqUnf4VB057WKNz1KAWg9Te4AuldQ3z3bsYr/+LepgPNF4R98nIeDlELdrwDagVSGLdR9tRktXL5L3bKRakQnACcRuAp/esfH/e27jhWCzgJCyArwvKcf9NmizDTkbrD/bE3JXV7dKNutO32k3LaCMIjgNej5T/K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789402685; c=relaxed/simple;
	bh=zuARar12XFMKQWyIUww7t2WzzCmxZbAOSFUqmie1sdM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=VBVqn9zjjSPkCiX1flqK1tWl8IOzPocfhCmvTQDQDAV+V0v9NUto4/SSfBP6nZaCN1RjHcPT5KAeZsr/U5fNSg1qIj6eoyrqwD7UZtrnO/mQfpRsyXi942UUziAErfF1z0sPffON/Ni5x1adCeY90xfoqWcp0hgzvSdb3BJhUpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7f4e4b52404so4184233a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:18:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789402682; x=1790007482;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CHx4S70M15ciZne1aLuEfwUpXc+z4r4taQi9qQ5bsfE=;
        b=I/P/k2lUgEj4hKcaxPTGb6vj2F70sUpJV+2VrnFqw37XC02lWVP+2sRwPoTgdU9KhY
         /pYRXxaUDXLR3xLDDTghREgcR8EI8yYy7ptiQZbHsQLYBkdSNxAre+F70EQ+fccjns3T
         zaKBXclxxI9zEb74HjYzyJH9ZkSxsmjyzrfvr6wzWPW9f4ekIuat/95c6sVjiLMjmeSp
         4BXDnSvbw+PLQ3/cPRPgxTAvXPV4fhhuAjXb/QQiwkF11TbQjnbPb1+fQz0IaZTz9PxY
         hhR3wCR48y/XzHbu+E1usoz3pvO0m+SwPawUafpFuyBAmno1OywoECh/bikgg3IbvVLT
         ISfg==
X-Forwarded-Encrypted: i=1; AKwUvBwtXfXXZMfIiTiSKZgVviplFw5kUqif9prB3vMLBW8L3j3jbfT8Y/XNV5FwyJdCbx+rveNsSQVVw2iSdeE=@vger.kernel.org
X-Gm-Message-State: AFuF++mhONW/wvaY1hY4fk5TlYz8IESLzeUGEGOw6pr/EQx+hQcPiycM
	3XS2TlAZIJdk8ny9imkcslmgaPf2m4IUETUi9YO3yvQum8FUx12n4HZJvlCJ17/BeALaoCyfFSf
	xZWfkQTmPqcacT84/Gjj3IOoNZAW/jXt+zmqBgSBX3bVZI8g6SyXmGKKJZik=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:f028:b0:6b7:46fa:16a2 with SMTP id
 006d021491bc7-6c54234528bmr1839177eaf.55.1789402682396; Mon, 14 Sep 2026
 09:18:02 -0700 (PDT)
Date: Mon, 14 Sep 2026 09:18:02 -0700
In-Reply-To: <6aa7dcd7.caa6ce30.140852.4da4SMTPIN_ADDED_BROKEN@gmr-mx.google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa81e3a.a211d2ce.1a5198.0294.GAE@google.com>
Subject: Re: [syzbot] [batman?] WARNING in batadv_iv_ogm_process_per_outif
From: syzbot <syzbot+a079f084653164a652d1@syzkaller.appspotmail.com>
To: jchuang26@m.fudan.edu.cn, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+a079f084653164a652d1@syzkaller.appspotmail.com
Tested-by: syzbot+a079f084653164a652d1@syzkaller.appspotmail.com

Tested on:

commit:         50d05c7c Merge tag 'landlock-7.3-rc3' of git://git.ker..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=14721925580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5e4e3a0e188a497e
dashboard link: https://syzkaller.appspot.com/bug?extid=a079f084653164a652d1
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: i386
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15afe925580000

Note: testing is done by a robot and is best-effort only.
