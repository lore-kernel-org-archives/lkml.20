Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A36C360ECE
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 07:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787816645; cv=none; b=M6uPOtr/V99VqrMcO8U429+6mrenU2ji0ddszXHsFIUIAdig73uFPmsJfIa+jQJIImW8WV0QPDtw0WpqeWrXUh9XyPepCgwMBk85p/v2uBwsSqRv7YC3Bs04MOriJHhJr+dRbkU6nT5KQeoHQeYh0fHKc8HuMqQXuep7bV/njPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787816645; c=relaxed/simple;
	bh=qLvwCXRy3RLAF1jAexP/5dC0+vxp3bNryOjD/RQVrGY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=FdCxzLHhCbQvMVT48EjKHBU6VyvQJzImCcCfzaQe/+4oKd1WiUiIFy0H5F6Rxm4/lY0TW1ZrlgGMONYnXJJG7y3+NgbgXUP8MUk2xd6FgZF6d1TYnIrCuRcQapUB1iIg2t08y+/8M2uXEjc0CGGMAdOi7r3tC1Yle3vZuEZExYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-458326d2d9aso1335015fac.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 00:44:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787816642; x=1788421442;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=U2oh1UrHxyt7XY5/MlGcd+3IUC5ZbqN/eEEyPs+3890=;
        b=D7tWdAp7yK6/uV9r2UlJePI5fy7SXArrYrAr8fHgupBuZFZhhSuKCeMRRgoPKIm7l7
         X+U9X/rtc7OFhM//xIXA2lVTAPCcrU5NG9dyKrteJ1S9QaXIckyXlEm4IfRMWAm9kMgZ
         HhwgIPQQUK0sCotcfGUi5u5ZamlitJLzJGXILesOyTsmt8yPAjhOfUJ8DVQVIph6CI9g
         2WFeClN0L+BPZjv/N0D9AzlrZxArdd2TK03fFf+V7rM0MZpOv4qcsDew/8GHEO2CNVyf
         PbJm8HQ0uyvtvv/O2jXAi0aiMBvD96vE+w8w3fteSDEnt0yZCW60ek5AF4tWC9FKyfsc
         jGaw==
X-Forwarded-Encrypted: i=1; AHgh+RqqPzkEagXoIF9S7vjLr5izPvPBYBVyjbp/rkveVLzUZFXB+Jte8As/hDG64GHeacAw0Pz/bBc/u6ntEbw=@vger.kernel.org
X-Gm-Message-State: AFuF++lAhNh7EhgzpMdWJNdg8wrqXccJ+kxsmhY51ljc8mG+FOp2zo+L
	KH2beE56EtWqnm596OxbD5nBbK5GxHAvbnDJRu42EW3PMlPXmVUChMdin1QZWyp0IcLc+RUC93q
	ZkvOSqI0vLEC7r18GyDnicABs0YKNlANQ+U9FZiWa8mX0tI4fz2YG6cOhjGo=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a4a:e2cc:0:b0:6b1:55d0:6e69 with SMTP id
 006d021491bc7-6b1a049cda9mr9733598eaf.18.1787816642360; Thu, 27 Aug 2026
 00:44:02 -0700 (PDT)
Date: Thu, 27 Aug 2026 00:44:02 -0700
In-Reply-To: <20260827080226.4ec229d3.michal.pecio@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8feac2.50659fcc.60cd.0010.GAE@google.com>
Subject: Re: [syzbot] [usb?] INFO: task hung in unbind_store
From: syzbot <syzbot+fd7be5ad9795b7f29df3@syzkaller.appspotmail.com>
To: dakr@kernel.org, driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	michal.pecio@gmail.com, rafael@kernel.org, stern@rowland.harvard.edu, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+fd7be5ad9795b7f29df3@syzkaller.appspotmail.com
Tested-by: syzbot+fd7be5ad9795b7f29df3@syzkaller.appspotmail.com

Tested on:

commit:         73e3f071 Merge tag 'nfs-for-7.3-1' of git://git.linux-..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15bc4579580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=22381429a4c2735a
dashboard link: https://syzkaller.appspot.com/bug?extid=fd7be5ad9795b7f29df3
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: i386
patch:          https://syzkaller.appspot.com/x/patch.diff?x=124f3979580000

Note: testing is done by a robot and is best-effort only.
