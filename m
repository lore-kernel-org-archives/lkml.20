Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1968D41BA72
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789633516; cv=none; b=YFl9OOyEAeMCl/ECnK2mzo4aO07S/D3LYVSbM6+8Tj4tYsa8KwJhD2F58q7oUI0/Nh4NOqfyI9EbJfYgZK5E6sZFBSdyp4bWhbqzRW4FclXCYP/8lbXQ9xGfdGeTL8Den+145QEoP/VT5TyhMa8+1hN4sFpUpyvP5Upl/F7QdQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789633516; c=relaxed/simple;
	bh=xzCxCEzUowtsPxWMbDjD1lRzfaA5w83hr58sbAM2xcM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=BX+CVR+ZhbwyTSDFFg+9I/FIR33HXUIFKD1v5I9GazZk0vkgeDx+2rVYAX+0H8DiAlqxlwrvmRShegLI+b1psZmmDJtkp1q4V2vslN4IEQ1Pkt7XGcvZGbzkxvyzeNJ3B6x+k0Nlugs6HRXl3xewcuSp9UAVER3a1eJgwpltKrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b38ea4c6acso512960b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 01:25:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789633502; x=1790238302;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uBkL6ZMYYdQOBhaz18ohIP2qWIBpLXjs4rOb70E61hY=;
        b=uoYBFIhFTYKC5YI8e/SAZIvK25n5utdv+56buVgIaj2Qy+bdVvgT6iFxI1mAiKOEnN
         +CikAOu3D16Y2TEYV1YrvTY2X5Xtpb1uXhohyHe4Fgv2pCO6ElDgqDBtcbdi8RKiOPhb
         70+00MGQXctRMWKhYpamCMWebUdaW3t3aAUCxBPZ6lcLojdyiWOlvbII/EYJ+tmJzd1Z
         EU42JlybpVPDTbYflcCUbfs1ymsCMvvoKnOAHbY5DonsxIUgY1PziKKTZ2DcJdh/ZqLI
         eQO0AiVrfEo46ITmNaWwxS/dbLQm6Li41fdE7A/eVoaFy4kfSkFUerYH//9M/2g2ntLG
         Qsag==
X-Forwarded-Encrypted: i=1; AKwUvBwEF3El1BpCSP7JQ93ostuqM+EkqmEb91IJTVj/1K6Ce8uCZ/gbXj0nE/lAezRJBWRmIlgs0J7w8qaqCh8=@vger.kernel.org
X-Gm-Message-State: AFuF++n8G/20QXBXsbFGAnGK0z9IumCDp9h1DqSP6X/P5HyfehuxQRFe
	cs0hhLVBWkeAEDWlr5gtt/oivsTZEnGuFLLV+srxr2fMl64dgq9RyKcsQ8tNhQ41Ag3VM5n+wga
	0lapzv7lZ0qfaDI1/6bxFK1jR9lxvxiUsYGg5DnEmUIuvEpcEJKaZEkrsJk8=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1692:b0:4c5:92fb:218d with SMTP id
 5614622812f47-4ca4be66e9dmr5399582b6e.22.1789633502228; Thu, 17 Sep 2026
 01:25:02 -0700 (PDT)
Date: Thu, 17 Sep 2026 01:25:02 -0700
In-Reply-To: <aqubuvR_2XCNav28@gremlin>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aaba3de.87c06881.1db2b3.0013.GAE@google.com>
Subject: Re: [syzbot] [kvm?] BUG: sleeping function called from invalid
 context in kvm_mmu_notifier_invalidate_range_start
From: syzbot <syzbot+c3178b6b512446632bac@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, bigeasy@linutronix.de, dwmw2@infradead.org, 
	dwmw@amazon.co.uk, kvm@vger.kernel.org, liam.howlett@oracle.com, 
	liam@infradead.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-rt-devel@lists.linux.dev, ljs@kernel.org, lkp@intel.com, 
	llvm@lists.linux.dev, lorenzo.stoakes@oracle.com, me@brighamcampbell.com, 
	mhocko@suse.com, nogikh@google.com, oe-kbuild-all@lists.linux.dev, 
	pbonzini@redhat.com, rientjes@google.com, rppt@kernel.org, seanjc@google.com, 
	shaikhkamal2012@gmail.com, shakeel.butt@linux.dev, skhan@linuxfoundation.org, 
	surenb@google.com, syzkaller-bugs@googlegroups.com, vbabka@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+c3178b6b512446632bac@syzkaller.appspotmail.com
Tested-by: syzbot+c3178b6b512446632bac@syzkaller.appspotmail.com

Tested on:

commit:         f902e69c sched: Allow sleeping spinlocks on PREEMPT_RT..
git tree:       git://git.infradead.org/users/dwmw2/linux.git seb-nonblock-rt-test
console output: https://syzkaller.appspot.com/x/log.txt?x=17d63bf9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8a263b38e64491d5
dashboard link: https://syzkaller.appspot.com/bug?extid=c3178b6b512446632bac
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.
