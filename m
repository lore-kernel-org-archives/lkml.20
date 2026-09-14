Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C649330FC1A
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388527; cv=none; b=gQPcors9jcotxUW3ptBon8nf6uGQtspiLvK9qj2XcWCqHU5uSRqDlyKruPTsp5e/HEi0D4mF59ghCZ6RfZq/vrhgZfkK0MUOpDZssoU95wbabmtnTecbWaGeSOAX8OTVKf9xyDg5mGTgw118WeCHDA8kOwNv1C4KNlxIPqJNPnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388527; c=relaxed/simple;
	bh=5req5SntRtYHUxoX5wBCpdM0p1F9kdOiYuLrxLQdbKI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=PGFB0d8L0+Ix2+N7+73BzpmbWBwaZ8SI5mutRfTjwSAPkrl2RsqxiFxju9dq9IJvPoS9vYzrTfkJdoeuh7E047ByafrM+Zw4rrX8WS+FxdPdrPkhJa5RJmd+QFe2sjxHVsqxSIWzJfMBlP6dg770VzThk9IoRO3sMvPNJiF9TXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b3962f71e7so4479494b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:22:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388524; x=1789993324;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LY/e3/P6knAOl6pZlWEPeMN3nlgWF/DW1SNPm4QPcbk=;
        b=ZJHiLMJx79HSriGlpJPH27WGpUlL1FBZLMO5Iybx4rF8tSEgoeAhrcqSAV8mpTPSj3
         8dlHDo6cLLpR3ApS8AriXCU/5gPFecPxcOsqzNN+GdO+RK9r2ydK1DfVG03D+6VoeciB
         i+BWKJ0ayzZbCLn7zvUojWUu4e75zmuTS2EDEL4hOgYXlVozlcSJ0QCf9JlgzoixzIGs
         ieDn4mU9Qc1EmadJw3hRlFpUgzFXYk+TBvg2osQFqv4WMPj7ip7tY3Mna1GXpP6Gbthu
         BKzyx8xdGGS+WwijIxHTY3hykoS90dmT6tIfq31egpaR4ytv8l1B/tpkPaitu5xhYTUf
         hlaw==
X-Forwarded-Encrypted: i=1; AKwUvBwy0XIyK8c2Y4iw9Duhwy4N6/u83bHvlH+FG8qpDGJtHJMogesNFfn2+5cTChiDwEvfsVgCMS55Xlb2vDg=@vger.kernel.org
X-Gm-Message-State: AFuF++nOZ2Z8UW5Y5Ep/xtcA5AmVn24Ts5d4IpM3ydoxpZbRBOVMJTfr
	w4Z8YDKJ0cnwEs9WpLc+OIb7DwHDcI4BU8xYgqKdNshh21F3GYJPzNnm+j3Ys1JTSUyAGAQ/162
	LIR3QBLyQfpzGqq2GjwTf8SSkfq/aBv0HR7E+Hg/C5il5hHsLca2MIB3clDA=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:14c5:b0:4c5:d5b0:4062 with SMTP id
 5614622812f47-4c7b579f973mr1156980b6e.21.1789388524619; Mon, 14 Sep 2026
 05:22:04 -0700 (PDT)
Date: Mon, 14 Sep 2026 05:22:04 -0700
In-Reply-To: <6aa7e2f7.a57c3ef4.31ae31.eb81SMTPIN_ADDED_BROKEN@gmr-mx.google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa7e6ec.a211d2ce.1a5198.0292.GAE@google.com>
Subject: Re: [syzbot] [nfs?] [net?] KASAN: vmalloc-out-of-bounds Read in rpc_queue_upcall
From: syzbot <syzbot+d5c77cabf7a3492aa650@syzkaller.appspotmail.com>
To: jchuang26@m.fudan.edu.cn, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+d5c77cabf7a3492aa650@syzkaller.appspotmail.com
Tested-by: syzbot+d5c77cabf7a3492aa650@syzkaller.appspotmail.com

Tested on:

commit:         df290809 Linux 7.3-rc2
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=10a01925580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=d5c77cabf7a3492aa650
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17bfe925580000

Note: testing is done by a robot and is best-effort only.
