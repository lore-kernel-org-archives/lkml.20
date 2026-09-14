Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C30345EC0
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371005; cv=none; b=eeNvGcqlynn/t5cfBSWwS1kipHWTsKG7aTII/0YHYmGho+4ma8LqOMHwNAis3DiUm3JbSnntDgBW5OnfkKddkyVRbEMcyZmOyPHom+1k4KjZCsM2jop0yKvCutAhUynY7cdCYQVK2HZT/Uw4zWuElZkBaPHv3gG1x2YZvQmJ1II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371005; c=relaxed/simple;
	bh=m9yP7u7RuPZEyrJ8+MCAtLtxDu5KRIM0QM/laA5FebM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=VVA7YAQibLV7ow5VF+ffgjNTt7BQzOQ2ocA1fsWxruk4aQrKg4ZqYRfoTJYL55DvOkQUrzB46YYIF2BTmc1oTj8UCdNTiLlErco0f6yvI0yhGg+IMLBIULFBaEwLxa5PmzCa82D1LH5QKr0puClhW4HS7Nj95m4VpvSoGpbt4Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6b1b7932ec2so2623001eaf.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:30:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371003; x=1789975803;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aRVZOxnWXeBtsbRSaLIrsYLHdgLXy5x760+quA9bYjA=;
        b=Alb+KKYZkSX0Mi+MeZrIAti5FilO+i41trjVTWFWoMVhcXi1JqqcGoeD6B4eYjREBL
         SJQvS75NmUPIGs6h66KWcOwinz27dztWXuMu8Mctwkbm1tobFiu5HW4kLLsedlK8U0qy
         gWZfeo5VJjXdVx305lzgTLh2QGJ+m0KIrRt3daqVl5dnCC8HmwBuYcENDwWVhUKfAz84
         GvynA6pH56yCm/FyXaeDZopypUKtpG3REv9Bcy85xelzWE1BYcyg7oc77AdmLz+7av30
         Okeg0FH5yljry+eK02WrQJCkzBRY8udkfOGZ6Ic738Drj40mmdrzNBYGKVGw3jWYKx5L
         crdg==
X-Forwarded-Encrypted: i=1; AKwUvBx12uAkBNs+zVlWXIN7MXEWLJFyHMFxLAT+EJRnwTxP+Cy9ex5Rr5OuzTu87IDLSbqjmp2tzJZ7GpH43lg=@vger.kernel.org
X-Gm-Message-State: AFuF++nJ4PjOyCYYanQHk70aCJioh4ioVq0x5X5Zz1Nhvljb/zlluQv1
	pjgfOSCoJdVKS3F7X9suZ9qoyYGEPX/yQvsdTgxIivuOEPuNNghHo8ptPGOuWlepsSlqjs/gGC7
	BYWnKnJ83w3MqwhkN9jLGJpAXylZiF3ZfbH1QAuoi+2nVAiHD75UKGbyQDUE=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2918:b0:6b4:117e:543 with SMTP id
 006d021491bc7-6c540085cafmr564037eaf.21.1789371002898; Mon, 14 Sep 2026
 00:30:02 -0700 (PDT)
Date: Mon, 14 Sep 2026 00:30:02 -0700
In-Reply-To: <6aa79ab6.0d4cb543.1c67cf.abecSMTPIN_ADDED_BROKEN@gmr-mx.google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa7a27a.a211d2ce.1a5198.028c.GAE@google.com>
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
console output: https://syzkaller.appspot.com/x/log.txt?x=178e2df9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5e4e3a0e188a497e
dashboard link: https://syzkaller.appspot.com/bug?extid=a079f084653164a652d1
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: i386
patch:          https://syzkaller.appspot.com/x/patch.diff?x=156c9c8e580000

Note: testing is done by a robot and is best-effort only.
