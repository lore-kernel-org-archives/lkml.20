Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF0436B905
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789401850; cv=none; b=PumEQ+zrM6xWc2EPJfIOhJwXdSc9Ty5YLMtLA/J2Fj0re5DiQe6UvJ+coDweVS9DcEXx7yjFZUJfp238B32Lm8v52HMeSgX1WHbPjS01RaY9AZiIgzreJuoNG3b/8/VmSZO5GYseVvnyDFot0PJdS3APRS4Ne9aQly1u+/tSxmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789401850; c=relaxed/simple;
	bh=ZzsST+LEUGeVsaNT2nlxnAzIEtfZDnpQOEj5US9Iw2A=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=XC1s0w+YlVMkdxgVWAfxdhgWInwGdUMA43CEEH63UeMMM3aTVOWsoxgqLDH81OBAUUnuqYFvc8etWfr9pJRF717rL0RcXk/55sZkcduMslcTtJL7aHVVTqBWkw7wWzf/JhsdI3DQ/A0y1Tol/MIisFXL3D9UKVsSxN2PvUTL84o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4a7de733fa9so4558000b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:04:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789401847; x=1790006647;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bqVhu3Rqi7QrX2Xb1oDXVOQWk7VkDTkLnCINgBeuGRA=;
        b=hPSaKWRxrVimozIomJN5pqfvQZ9eyfU0/q6IzctN4hpqfiMq7b3VLNNhFy0JShHZwa
         XCi5djePuoXFjeX+Pdny8dtgDxcR1uivzQSSFzDVuA0vxJrzW/xapbHaR0ug4uPAt+Il
         RlcjTh8bo+vzt9cz9I+X8vhR0SJD+E8o1NWmmphWU2aAtLa0EWkbf5DgpA13nEtEN06v
         xi7WxhsVlwAPpVseisWPtFqU6Wzp57VMWzZqdXFObTPbvsx2AXgcin8TzGpoHNh9sIcH
         raFBBOzpjtLeqAbgGhTGjB7FLrI5cbNOrfO0BFrPxg4IrIIr3VlKQGUSPRIbMIcfifm1
         fR6g==
X-Forwarded-Encrypted: i=1; AKwUvBy0XRAM+LOE53hZvbDQ1sVDzeh0zhM7lMfvCiD4LFqwV0mHpIgh5A4lKMhdI2tepC2OeJkSD6f6nNKXlqQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nrOPmla1NipyX9QHYsfXy0SBJGV+HINZAY/oTifEO0KoufcGaw
	mORFM18lPDTv8EiTbORv0Jj8J4XEpc29j+YbBFjHbTz8NK2cZju9mCmoWdpLMSIYA2FCEZBNS5t
	E9UCKafzbBxEH2S3/jYCitGxHZt1+jq3BaGK6oFPUJWB4MoaWQkXmXDZwIoU=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3a10:b0:4b1:b037:da8b with SMTP id
 5614622812f47-4c7b34d5c4cmr2158407b6e.11.1789401846926; Mon, 14 Sep 2026
 09:04:06 -0700 (PDT)
Date: Mon, 14 Sep 2026 09:04:06 -0700
In-Reply-To: <6aa7dac8.02c11d65.3148fc.728cSMTPIN_ADDED_BROKEN@gmr-mx.google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa81af6.f81106d8.2ab401.0051.GAE@google.com>
Subject: Re: [syzbot] [net?] BUG: using smp_processor_id() in preemptible code
 in sk_skb_reason_drop
From: syzbot <syzbot+dc57fd6722deb17e92af@syzkaller.appspotmail.com>
To: jchuang26@m.fudan.edu.cn, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+dc57fd6722deb17e92af@syzkaller.appspotmail.com
Tested-by: syzbot+dc57fd6722deb17e92af@syzkaller.appspotmail.com

Tested on:

commit:         50d05c7c Merge tag 'landlock-7.3-rc3' of git://git.ker..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=152a8df9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b454dc6b1b7acd30
dashboard link: https://syzkaller.appspot.com/bug?extid=dc57fd6722deb17e92af
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=154fe925580000

Note: testing is done by a robot and is best-effort only.
