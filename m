Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30662374E79
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 23:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788565865; cv=none; b=ifTSamTEg3afigu8jlmEc6DcrL+Vk8/adaEDOltYPF6fcFd8s4JX0Xd6MbknaQBa66g7RBc4u8ceBO8MPTh+KKpBuRHhUowDaasrGWjUPjvHT+uDlTJwoI+g0SrDtyAyc3VIXwwubKDeoAdSmUA8str2eHfuuYxG6RVO95ZOgGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788565865; c=relaxed/simple;
	bh=vSWsF6OHxd7M+EWgYSXU5DT8j0iJNEd/xRu2jXI0yJ8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=fiuOyHWtyK4spFEQQ9HPR0e4rjvXqQkDuh6CtZXNS51kNAmkNqpkPC1OB7V8Za4tKaJt56O8q2C9UzrRyiDEtQaPFTnhbgQsWiYyKqau4pyXPMPIeHT7VoHrx7wruqmc2mGpGIaRZoUybxLSKon44/n9Xc/MRZq0nZ/CADlMEKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6b34c5c6de4so1888837eaf.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 16:51:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788565862; x=1789170662;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=neBrz4875pTkfQzez+b5bFp5Nq7V+TTair63c3YhjyU=;
        b=c2v4DCq8jG7QxHB36Fcb0uzPmhfUnru/2egaZN6TtU3SmBUUMJKHxmqr2epgoEhHvz
         sS7OPvX9DN5RHqY5WaaUozL0sqZbZjf9blJx/DIv95Gy9emibxBPss0ZpCyvO+56aqVN
         qMcm9tP7/8ZRyU8pyeAL4+zkJYXTa2yG/2kaQCSc6i3qLLWBjwyrpzPm+CsU7HspHG9x
         Y2rVgspqTqRRs05ofKNpvSxXRwInbYjXi5RmYZBOvKNyX5r67Hz5sUcxjZl4/u98zDQh
         Y7epCtHyOoblFZChVBU/+zeoC5TK3R6Fi4JgdLsyaO1shRADNVw4bbe85vukRi12g3/b
         UhRg==
X-Forwarded-Encrypted: i=1; AKwUvBzvt7SNv5TnIqv7YX9tQwHMEXG0/oRe9Vx+FWucBW0P82nw4tTH3sd/q19h7AxiDx7GYvDz9Amd6cy62rY=@vger.kernel.org
X-Gm-Message-State: AFuF++nVC4uyeaEgcu6r1mA1cmk+C3gykTOrY3HLPzLqY05DNWEgQLPT
	KvbacIK3VpZh2IVPd6ssZeCD45oNKkLXS7QpJlbPSX06vS5uN9Pao6fOkGJsn2CIurkS6GkuuCH
	Prj++VekpVxyi5T1Em7LfZc/1cQHjnS0yjrcfVNdsPHflbhbUM/f8qxKbIM8=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:179b:b0:6b1:a667:f0d4 with SMTP id
 006d021491bc7-6b6fc9d05a7mr7026840eaf.20.1788565862677; Fri, 04 Sep 2026
 16:51:02 -0700 (PDT)
Date: Fri, 04 Sep 2026 16:51:02 -0700
In-Reply-To: <20260904233534.14952-1-kartikey406@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9b5966.a5e650b3.363816.0004.GAE@google.com>
Subject: Re: [syzbot] KASAN: slab-use-after-free Write in o2hb_region_dev_store
From: syzbot <syzbot+3025e3e8fc0b928af8f5@syzkaller.appspotmail.com>
To: kartikey406@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+3025e3e8fc0b928af8f5@syzkaller.appspotmail.com
Tested-by: syzbot+3025e3e8fc0b928af8f5@syzkaller.appspotmail.com

Tested on:

commit:         654ae5d7 Merge tag 'drm-fixes-2026-09-05' of https://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13d8e125580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=3025e3e8fc0b928af8f5
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10349215580000

Note: testing is done by a robot and is best-effort only.
