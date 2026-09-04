Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E243D3D9029
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 04:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788497406; cv=none; b=qJdWIPYWaOhrLP3q4TTdmtx/AVeGYeLAFVft1lVijbK4gJMrmeaYsi5E6r0duX2FgQkbS+E9X823VHTD9lLGg7ZZMCjXrlKnwTekdg3IgYjjZ0r6bZ644DHAlYG0V8c7keLzK7yDIZPnkaRU8+twxTzFae/zavbUdQ6PMR9aVA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788497406; c=relaxed/simple;
	bh=U2BqdsZ8gB5XuyY/fHJkXNvZPUkdI7vWfQkCFggnb1k=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=IIvVDhvHfoIgT3+ThB4STLvuk5gJNf+xC+JG/p6cveFRtpzwlawsR6g+zTxaLP61wRMTd7Byt+p8CBOTJJBoA9Sqm69yKjsqz2Q34VwHErHFkOa5R7TYmv4KA0bpdRL41LXxE9EjwyjflOlhXuC2GfKvaoccxcq+NNAKDcDSq3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6b0e7370be1so675492eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 21:50:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788497402; x=1789102202;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NKTdf5FN7Ekb1VMEfUS0M3cXGmKqY/cRVtokL7Q4zBM=;
        b=bwrn6UTdOhifqGe3sKLQuTje5h9mAibAHGUM5Rj49PKcAFGtrabRBXtOjjE17pFJM4
         eajZ4RKVK+efL4ELesEr7Oht0V1MOk99RXmi8qKKBD5HqCVdx9aa8udRJtMjKG/4OEJE
         CaMHP15jDJHsfXShTt7zglGJbPeQPxHPrDdZ8IfNviovUfMcKNQn/kz0+A9Lsd9HbZaA
         JsU6tBVRP6t86ZPoJuk5u7yrNXIOt/0QvmPXjixIyhj7gil8MqVHTr4eNgXyoZaV9q6R
         6kLwDAN2G8GPzojFSPFs3IfEQLSOn2DI6xhq5Xm8wuTEzNv73HuKwNoqzxBr9QpkCP+X
         J66Q==
X-Gm-Message-State: AFuF++lpBGRHsALzkxQ5lQwyU7tEo507ob3weoCG0js2HYNC8gZogjRs
	ORfUqNjVODsmHDS0wH9vlWu36bSpwkeXCuLfCXOxbWO0A6xitSfjFNaMYUXYbUFuElrhTDZyLWY
	i+m97wGiUwAbCeghom/YRadng5UWv4lAvVQtgSHoKOFB+6EGUWfvphbnjD2w=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:190d:b0:6a3:6f5d:4d6c with SMTP id
 006d021491bc7-6b58341fd2emr4941137eaf.6.1788497401925; Thu, 03 Sep 2026
 21:50:01 -0700 (PDT)
Date: Thu, 03 Sep 2026 21:50:01 -0700
In-Reply-To: <937cda14-9b1b-4eb3-92d4-f31afacb9b0c@me.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9a4df9.9266084e.bf0d7.0456.GAE@google.com>
Subject: Re: [syzbot] [media?] WARNING in cx25840_init
From: syzbot <syzbot+9123948aef13fe92d706@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, m.harisawan@icloud.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+9123948aef13fe92d706@syzkaller.appspotmail.com
Tested-by: syzbot+9123948aef13fe92d706@syzkaller.appspotmail.com

Tested on:

commit:         a500db78 Merge tag 'selinux-pr-20260903' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16d008f9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5e4e3a0e188a497e
dashboard link: https://syzkaller.appspot.com/bug?extid=9123948aef13fe92d706
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1779cb49580000

Note: testing is done by a robot and is best-effort only.
