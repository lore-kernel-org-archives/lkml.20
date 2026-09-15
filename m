Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145973921DE
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 11:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789470786; cv=none; b=Bxs87qFuT4W1u3gtLaps88rCBXK1NDHNIoDE7eDPFXIKaWJlkPs3U3Wo8gcMaEJYfqWvvlH+Eu3MJYQ7XhOJIPhahgjwPv4/0Q0njPmOWeHwCrof8H8bziFBFbGH6i/gKFgyluG3n4gKr5KbH/Lwn/A9Q8DYd+Zm9d3w3kMkSVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789470786; c=relaxed/simple;
	bh=9cXrit1kfcbJSrZtKyz+gstEEfVMByvk6L/z7kbpuRY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=LVXpYBuJZeqedKmfhd4PTbwTClbySMyKDVAAz3dc5gPMhjjrwKGrCewg0tEWespm4mYNyHJPToh+GoQUuRnXwFOWRdTYReq9XjYW/RxR3sgsLWL2ciEEsbzS+TM1n6nCf0xdvHJIkrDdunafgtFsg7hSJfO9aQ+ETJWpaPq5y2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6c1e5079d43so3812271eaf.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 04:13:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789470784; x=1790075584;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fOaPb7/DHR4mx8YChgTzdptMApYKxvfnW91QbnVAxY0=;
        b=BeE9NmThkhbTX7i3yvdLlBXFPu7P1k9nEaEh1ZbjsLAFHDRP96q4b6kbPGAdyBCIpS
         hi+YKUTgwKWQv4Y7BEJGyX6w7T+HJsVnBXM3F2TtqdHOUTvO7rMAOTQ5zp175pEajvfq
         tG1FzYtIwDas0y+whKyHxbITc/XUsQdvwfFXxw6hhcyvAEeVwMpzCyZ5XbAKl1dwUPzE
         9RaxfpkZHCjPLcK0KCgO95kQOAeCHYvL7WH2+sgVeHRc3lvCSw1IfEy9wk7fx7conMiz
         ALJWHAzlYqijQ9PYqcXd32uZvxK75gwjsvIDq5ic6sUu826kr3w3mtZxf968zbYsAyUp
         r7cQ==
X-Forwarded-Encrypted: i=1; AKwUvBzrpx6ptSmeIlKN0NOPh6rXyAE79FFKD4NTb6MxeHWdCseYdGzhABhJqGLtJSBC7g7sck7tF+EclWbjHTo=@vger.kernel.org
X-Gm-Message-State: AFuF++mctnUF311kDIaLjPCShv6SjXodRO6Brhk5RYkoJ8rnSNXqNB6q
	i/giNz19TgSmAJswmxQmkvyT3CD6o+h2KGYNjo89uJ+lpMmnEtRhOpaIElB8muPK2OY3YEzmQxT
	JpvCnzHT/15llhCM6jIORccXTYgmJPrsbMvmgL3Spp5A4iGacEcSrp/m4oQI=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:a09:b0:6b1:c6d8:8358 with SMTP id
 006d021491bc7-6c541c4afddmr7411691eaf.22.1789470783851; Tue, 15 Sep 2026
 04:13:03 -0700 (PDT)
Date: Tue, 15 Sep 2026 04:13:03 -0700
In-Reply-To: <20260915034957.10332-1-kartikey406@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa9283f.f81106d8.2ab401.0062.GAE@google.com>
Subject: Re: [syzbot] [ext4?] KASAN: use-after-free Read in
 ext4_read_inline_data (2)
From: syzbot <syzbot+085a394c92518a04fd09@syzkaller.appspotmail.com>
To: kartikey406@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+085a394c92518a04fd09@syzkaller.appspotmail.com
Tested-by: syzbot+085a394c92518a04fd09@syzkaller.appspotmail.com

Tested on:

commit:         58785836 Merge tag 'nfsd-7.3-1' of git://git.kernel.or..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1610fdf9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5e4e3a0e188a497e
dashboard link: https://syzkaller.appspot.com/bug?extid=085a394c92518a04fd09
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14d27df9580000

Note: testing is done by a robot and is best-effort only.
