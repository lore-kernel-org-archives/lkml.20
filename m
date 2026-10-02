Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133014B8288
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790954046; cv=none; b=EqjRwnwPFxyLU9b0ImGRyjAgqdshH+PVXnpra1ut5/LkMCYIduXh6aEePcw3rRkza9n8ohWt1f9oNcQCNwPzpeOeglOgJsm7Iens2bHUx/E/2x9kMFPyFAK+qtJd/W4pRwXUXpY0F4nT9VBbc7PHqhErrpIPqgfcF2uO38fMLz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790954046; c=relaxed/simple;
	bh=lWuD6eeNI1L0P5Gq94YhlRweitV4HNE+Y6mfL76syiU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=YabQi65IxrJvFy1t4lET3BDtRZVOqGPJHw8wHmhMCe9ICugD8JDfGKwhrZFHcQ/th/iRRJnGQUiXlvX/0u58bxmio/1QxILZOguxZudSte+iwrPNUVCZBki393lDiutT3C2xCfWpvWsVVWNfPC/GG4oKGcNlRDRjEPdlbfCf7jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4a45b3f0bdfso12336167b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 08:14:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790954044; x=1791558844;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=X5l1RKd53N5dDFaoFHQ2v0TcO0GMfQD1N+ivXCh5LXA=;
        b=h5Y2upBFVLpzwCvi+yCGbkhGOZOMTqLY35JujgYUbPacDH/UE4oJheWImZ5x+0vlbM
         xczEryIAOO5xKmDBkLV8AoB+hhn2FUT8qg6B6jV+2vuJZHnr26T8kHyV3XLguOKsDTWW
         ogWauPxIDzwJo19v+EdgQ47EoSWWAkpTy3M2zZF7XU7iWi9uy6kpkC/QDlGxGiQGPAfU
         ws17BtMknJoKeKwT1I/yhSDw6LAxCbH4uiz3PeOUkYUfdCXkraESeuTx9QnycoTnUOvF
         sfClBidK6d7+NktTJq6bl7b1swwda+lQ1BSFZEFUcws7p7WSKL6Ra3GYxEh+A7ZP9kPp
         awWQ==
X-Forwarded-Encrypted: i=1; AKwUvBxjkDksejprUlmz8gqzDBESr8uKJ9lhq+mRBqZetByNDfxVzQjSHJymy8ObiH8ZR40sI8ItoVyt/LjMxTs=@vger.kernel.org
X-Gm-Message-State: AFuF++mUCTYPqyJyg2Q9fmMZobvOzA86CQDptfOI0GAxaVCsGjw9b49h
	oDoW0Oyt8QFvI23CW5gF/tce0kD1kKL3MjCnzXrc3TlObr2Sw+cCxuf5YpQ1afgwyOg1UiEiIWR
	6Wk7llv/E8Ce9RdyCjjsucMDy2b+MmTMSu2ut1+9u4UmzJD7rAnssGEkj7DM=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:ec2:b0:4b9:e65b:8c34 with SMTP id
 5614622812f47-4f5298119c9mr2098157b6e.34.1790954043859; Fri, 02 Oct 2026
 08:14:03 -0700 (PDT)
Date: Fri, 02 Oct 2026 08:14:03 -0700
In-Reply-To: <20261002144856.26007-1-adarshdas950@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6abfca3b.9b478af7.e8d7a.000b.GAE@google.com>
Subject: Re: [syzbot] [btrfs?] WARNING in can_finish_ordered_extent
From: syzbot <syzbot+085adc3f91549d11066a@syzkaller.appspotmail.com>
To: adarshdas950@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+085adc3f91549d11066a@syzkaller.appspotmail.com
Tested-by: syzbot+085adc3f91549d11066a@syzkaller.appspotmail.com

Tested on:

commit:         ce1e0223 Merge tag 'devicetree-fixes-for-7.3-2' of git..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13c0abf5580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=24503f5016ed9122
dashboard link: https://syzkaller.appspot.com/bug?extid=085adc3f91549d11066a
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=171f2bf5580000

Note: testing is done by a robot and is best-effort only.
