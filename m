Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5000839D6F2
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 10:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791024784; cv=none; b=b4gz4vUUKjXKfaUOzXVLhXxpHe/jgKm5rmiVjxrCNh/XsdIzuOsQJA0l8W0xEbWu2OpA8y/dfA9/LDuNGIZ/z2yax+PpiCr75zRlbQZfT2NuaxurK81VBnq3JTUAh37o+2AFwMspfUqf4216CghT/Sof7PQaiX0kSG3lS4+HZDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791024784; c=relaxed/simple;
	bh=9VrtdVxfuLXZi9LPGL27q7BYdJPFICkwLHsUrRaX/u4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=VI+waK41YLsnMsuszz7M053XplUKlVk32P1/HDpc31B84fbE1uj+9H/hOMfHMW7NFx/vkKeEm/YozgL8Q9fe5bE/HAMGhqPMgOQwDu71CEDjS+PFLRID3pSZrcLUiUgoW2jDqmHN3yExM8PRIiiiPAfagRxTTpgSkqsP5Cvqv38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4a45b3f0bdfso560097b6e.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 03:53:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791024782; x=1791629582;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zif2d3b7Om5ebgFRi0Zh5XgIaq1W0IB0b/PNvQhmOWc=;
        b=Wz/x+TpRGgtcXlzez2x7dYgkqPNIP8xHHAWuYZMA5Md/Ze9IGXpT/KduQe/3GJUNTI
         LkGP86atttAcmPYoWjpCDidv6DAOwMjhxBaxdwZTXVajyfo1pnhQqCjY0EloQuIwzpZH
         FCirxp98V54AxahFc1kmKdVVgstHNFiziwJ5OC26IyxelxKLTi8CXK+oiZImHnKPtbZ3
         ysTpoK6lP197hM7Q19IrcBvuRYfT8GDnP/f7X6gfptaJYinE8VGoAD/8tSwW7NU5I6Df
         ibm03s4S5i0YOTz0FulFIsyM4+r6o1FKSzZRA2XMaqZe4TO5CIu2ivvM3k2WT0vyl4Uv
         tp+g==
X-Gm-Message-State: AFuF++kUE+dzN5zjmRRLXyVEC64yHKs9vI6Teu+URMlcSLlLjQOS2lpQ
	1O6QVAaXB0NjsvaYJkMNOaXRuRdZA4KiVfkwTTY/0X+oPXx4WiiFweHTX+EsI+nHehy5j8DLI85
	FjKpWeThVbP5RwsRH5LawKMLes+GhYk5A3gYo4u1FsnT4aVXO7+b63i6pnlA=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:5396:b0:4ea:5e0e:7dab with SMTP id
 5614622812f47-4f67aa18985mr1910731b6e.37.1791024782155; Sat, 03 Oct 2026
 03:53:02 -0700 (PDT)
Date: Sat, 03 Oct 2026 03:53:02 -0700
In-Reply-To: <20261003103642.910-1-rajojha047@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac0de8e.9ad129c8.3858c0.0013.GAE@google.com>
Subject: Re: [syzbot] WARNING in wiphy_delayed_work_cancel
From: syzbot <syzbot+e9cbd080a7801f06cf08@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, rajojha047@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+e9cbd080a7801f06cf08@syzkaller.appspotmail.com
Tested-by: syzbot+e9cbd080a7801f06cf08@syzkaller.appspotmail.com

Tested on:

commit:         e767a4ea Merge tag 'probes-fixes-v7.3-rc5' of git://gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15e29bf5580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=929e4854a828f434
dashboard link: https://syzkaller.appspot.com/bug?extid=e9cbd080a7801f06cf08
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10013bf5580000

Note: testing is done by a robot and is best-effort only.
