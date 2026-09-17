Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141F7400DF9
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789626128; cv=none; b=pock0Nzm+/M1myIkwTHz6j7zWZ1iVdn3zIrVKoLqxkbDotDqirB7X4ZDNBxzhmZyxkUeLzDvo2D54VWARdDjnx4Ika0EOlIccLB6CMntutSR1l/FpKdNPkQixz05GhWbmou1rBh2ObNJdqfZRl73ZqrOg2RyQXZoJiDeKTey6t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789626128; c=relaxed/simple;
	bh=3k2BxK+Z3kjp0FhZbXd1sKf1oRtxOy5b1V0t9mIJ1X4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=e4yt6xT0RbpgGKFLbYU41hzdA+mWRoNb3XiYtYNM3Jlhwp1LfH4nZ1QRPohEaw32ng3WjZ+rRg77V/aoiWQ+AntPTzwo9EGbNZ+RgwcCSSzG2MchQBZxQvkxi7LO5HHT1QEpk0Iyc6bZU4oZxemFZpDGFB06Cckx4k/p5bDPcQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6c2c5c1f843so550981eaf.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:22:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789626124; x=1790230924;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rwbr88JS2qjrdyIUPnUYi4gGQPQP+L17w9UV/XLAB9Q=;
        b=pW1n7b/WeT1ygt8pWc+xTtbd0+KS+N8mthCiDrXqLn/Vcd/k40VgFmO9L6GlPqihCQ
         HunjmSAgRTlsdketK2j9Su93U32t7HcvTGJ8MO6dwS+P6g2XFLUu+eHcMxmWXAnUkipy
         5dmmM3YOy9calJbPKZlqiVpLznPPeCc/wyleNupZQuNl7S+2af3JdabXoZhRkL4pfsOj
         +5Nn6YwBtVaRJ/adDhvRDayADeSET3PhLP5+qM4LtnvzGoPEwm48FXMcOim8JF5zlNu0
         0FBAqXIdaqP0lQnWbsqNhU4fG68tm/DI/cGEEAy139e6S0XU3FNW6vnbuQb5ZW5c41bI
         87IA==
X-Forwarded-Encrypted: i=1; AKwUvBzbJl7G/+KTmG8HdzOdn1mKFuYqDDihg+Y+U2tQhZ+FsqDc1alrHjtu6DuHsKhkCRxwZ9MV3oY7hMFfWYg=@vger.kernel.org
X-Gm-Message-State: AFuF++lZc2h5v4+mHinbNKvNq8/w/wFIwPhKWmf07rGTVfYsUppjh92V
	H4ypBrDvVQQvq9ELf8Eq2ZbmMa0eDM2VaHRAhr2H9s+2gqISevVE22BrLK4NIKxVha0Woyog0Ck
	f/1B5F1KRLyCXyiVu9S0gIDKCStJpB09YIdSo/j9PY+VJ0kdwHznCFk77x9U=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4b91:b0:6b5:ec2f:3568 with SMTP id
 006d021491bc7-6c8fde724bamr1566680eaf.25.1789626124141; Wed, 16 Sep 2026
 23:22:04 -0700 (PDT)
Date: Wed, 16 Sep 2026 23:22:04 -0700
In-Reply-To: <6aab41bf.727fe05c.1f19d8.c7a6SMTPIN_ADDED_BROKEN@gmr-mx.google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aab870c.87c06881.1db2b3.0011.GAE@google.com>
Subject: Re: [syzbot] [netfilter?] WARNING: suspicious RCU usage in expect_iter_name
From: syzbot <syzbot+4bd730aede2791e40bdf@syzkaller.appspotmail.com>
To: jchuang26@m.fudan.edu.cn, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+4bd730aede2791e40bdf@syzkaller.appspotmail.com
Tested-by: syzbot+4bd730aede2791e40bdf@syzkaller.appspotmail.com

Tested on:

commit:         8d9eae69 xsk: Use a 32-bit compare in xsk_map_gen_lookup
git tree:       bpf
console output: https://syzkaller.appspot.com/x/log.txt?x=115c53f9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5e4e3a0e188a497e
dashboard link: https://syzkaller.appspot.com/bug?extid=4bd730aede2791e40bdf
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15801115580000

Note: testing is done by a robot and is best-effort only.
