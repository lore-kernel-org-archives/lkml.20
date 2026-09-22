Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C6753C3C5
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790076670; cv=none; b=BltrOaD4vvVgW8qGNkmgAnAL6yIyrxD0GktEPMMMHOlOYXq5OBn0I9L5Esr8OLOvgjws8OXu06h08Y4s1Ml73p0OtNvqfD3HRR6gwh01PW/8RHOY1WxqRfOCyY2Bq5yXdFBcVqWaAJ6HEZx44J+bFW5pXlodN5t3Z0dZQ10U6xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790076670; c=relaxed/simple;
	bh=kCKBJbbIc/tC1C6vLbG/2So/Y5lzSQg7Lhxk+JjctoU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=VKVREq2RSbN7GKlzFWEjUEXX+/990iAk3j9Mn9t/of6k895NNEdiHhAmDxpX8LgrEwU0su5yJvni7imlUOUQVX1w2orxPrtL50qQtipLYhMw3mvGbjoaIhuyXgIyj0+5BHGTZcfqAgSAMaeYOtSuIzfP/aukkWY7C4FOir96ykE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-8076c66efc6so7148387a34.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 04:31:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790076665; x=1790681465;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=meUk2UYrxTTZSsFFkz/31fv0iAciJwZtuhV7yCk4WIg=;
        b=V7yTv3A09rc5E7JzoOcesJA2cmrAExTebCwJoJUKef4opvw/aJbQTlERKN8AUj0NP7
         Algc/i9BAPPjjb3l/WF4XGLq6NfrX9oYsXFcvLvYF0c6bbdVOXV2SZfuIQKDt4APktL6
         lyvQPdCd18ZqqWEgtXhZi6FRlP9G2zjrVdgc8fBMNgkuZ6O5DhdIydzXuRMfdbifJ09P
         T471aRKEe7w5ZNhhVysQXqaXTLZo9VYFrx5Ml/D7oG3bp3pcu4ubmKvRZVsMJwGXAa6H
         JkQ6rW/wRKMafdlIj28GCuN1zua+iczXimxiMpzuNQv0GG+bJyRzRO+LeG0yie1yyKog
         fTow==
X-Gm-Message-State: AFuF++kR2PpC/YmhyPgEB9WPC9tW3srkoqWEwGtyfg6l132sQhaak6ET
	VGMYHITvEGKmUV9pNfJ2cQrbqgqqg5b8Xozd74R/L0KBs+mhmueC10AejkKp8RzKx3s2x51HGcw
	xTgafaEekYt/hfttizwpzki+2lE2AnDnTXUP0xfaVEuUOGNBOsocf+b5PYcQ=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1799:b0:6c9:82b3:f6f0 with SMTP id
 006d021491bc7-6ca9cd50ff3mr11884714eaf.59.1790076665563; Tue, 22 Sep 2026
 04:31:05 -0700 (PDT)
Date: Tue, 22 Sep 2026 04:31:05 -0700
In-Reply-To: <20260922111651.44953-1-syedtayyabfarooq08@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab266f9.c68e76dc.23da29.00a8.GAE@google.com>
Subject: Re: [syzbot] [fbdev?] KASAN: slab-out-of-bounds Read in
 fb_pad_aligned_buffer (3)
From: syzbot <syzbot+bf4020519fbd94b2355d@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syedtayyabfarooq08@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+bf4020519fbd94b2355d@syzkaller.appspotmail.com
Tested-by: syzbot+bf4020519fbd94b2355d@syzkaller.appspotmail.com

Tested on:

commit:         f0100363 Merge tag 'xfs-fixes-7.3-rc5' of gitolite.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1080f525580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8981e77a6210d85
dashboard link: https://syzkaller.appspot.com/bug?extid=bf4020519fbd94b2355d
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=13f11805580000

Note: testing is done by a robot and is best-effort only.
