Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B8D2EEE75
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 00:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790902265; cv=none; b=gJsrF5G/LCIjXOVeYlaZhu9ipGl/WC4bKrQlTgKo6tH2IfZyCd3fZ0xYFVdzgqv76fGjyxhmIYkpfDF6UKoz0MwFPLI+ljuCklbuMHPjLBm/T+uqVCtZ+F+4/CFxdQvknsUdh/D2DQkNAEPh9UGX/D4yvavLucufcIs0YiBdefE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790902265; c=relaxed/simple;
	bh=4uxUaSB4kMiGE3cCX/ipv1W6+xKt/cRs99UJngj16Uo=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=KlDmy8IBEVLQhsSolQGzxob5qOwHyKEW/zClcOXrERA2AqvCg/FM4jLL1pfskO3Ra4qRAMrqNjvqFcQgw1eVX6x6xrsMUxwQ9cmWT4JCLhKCK1CYxzL+zMEuBlfpZfgd2uJwtE8mNxjiyTPaBpZWa40r3NMeoC3vv32YRTxalAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4cb254da90eso11173631b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 17:51:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790902262; x=1791507062;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TOOCfEFXaRbIb075v0FK+nrZYZSf/KiSCsCz8ZMWwpE=;
        b=X7tU600LrTO17YzRV0dzspv5aT3fkG3uv6V27p9ttwA0ppBiTERq27DOCwxC//7cgw
         FSyh95iuZJ1eiFdwIEa+TYotwQ17IJKdEH1vK6iEkeRsBEPcW+6DqwkjfVQxmBSEchmj
         Ksp1OW3go4gDzyUlEnQCib2mr/4AwsY8aAvPYsZ+Gl+zYDboqhNF8WfvwbErFvRWarEj
         DFM8OQjvEd6OmGWW1Zu7AM+X4hDGp6BLPndvw5ITkzel4oawZVLDGjefLnCSYUFkfVxN
         uBXNtoL3qetE3LcXrqCwh4xxJxK+B5c8Xj7VHfxxDtg/1hy2q3l6u9JINKHitqEfFpDs
         1zRQ==
X-Forwarded-Encrypted: i=1; AKwUvBxxlQ6S6lpzp/XMkyXpvWiqAIKiawvZBfhvaHRaR8e3ow7br147deh1bEQM/FmbICMCViUWyALTT9+MSPY=@vger.kernel.org
X-Gm-Message-State: AFuF++lQb4udmTTk1xoxoK17VtHT1uNsmCenLzZZDkVrEQawixVpRCwr
	6rNTwgEuKQKc9jSSERj/2LgMLsEDIIa8vgTcd9NIaZ6yOEL2DrTCOyWUqCWLLK88lS7Ln2qnIAa
	4G43HpjOWgBHhVBrJrutTWk/N4PH7MYtoqApXGS8nGaBFZnzqF3bHKAoQSkA=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4f4f:b0:4c4:8ace:cce8 with SMTP id
 5614622812f47-4f52654daa0mr1092312b6e.8.1790902262585; Thu, 01 Oct 2026
 17:51:02 -0700 (PDT)
Date: Thu, 01 Oct 2026 17:51:02 -0700
In-Reply-To: <20261001225008.1470-1-drifabdelmalekmohamedsaid@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6abefff6.7503fbd6.2d3f6.0012.GAE@google.com>
Subject: Re: [syzbot] [kernel?] KASAN: slab-use-after-free Read in
 raw_process_ep_io (2)
From: syzbot <syzbot+596b59aea1a9deaaab67@syzkaller.appspotmail.com>
To: drifabdelmalekmohamedsaid@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+596b59aea1a9deaaab67@syzkaller.appspotmail.com
Tested-by: syzbot+596b59aea1a9deaaab67@syzkaller.appspotmail.com

Tested on:

commit:         ce1e0223 Merge tag 'devicetree-fixes-for-7.3-2' of git..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12fad6c9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=fac807e4ec1c33e1
dashboard link: https://syzkaller.appspot.com/bug?extid=596b59aea1a9deaaab67
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=16a02725580000

Note: testing is done by a robot and is best-effort only.
