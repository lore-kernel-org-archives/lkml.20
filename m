Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5685C4D0CD4
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790956149; cv=none; b=py8Vc2LTCiuFbvqkv1Dvx5HRVCJsGx6NPrp/Txe++PGABmLisLOF2LrjMt5cDMtu4ZvmFxfQsoeJHSF7xfiZJUG3vvMvpPpY2wVoS13Ms4Ej/Yx/le/HMnkTssZ5AGjUD0gY2p4SEJTtyPee49rcb2r4SgzgGA6hU6lSg8RKfWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790956149; c=relaxed/simple;
	bh=VRQw48igQle4oLzfV6Xg3alQ604/xdpB1mxuoODHPYg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=OaEXeDc6/1Qb+luqJQD9GW6gCkY/NuQANL5gZkZqYtuG8KxtbL7E39FVG+JdHCX0++ftc78UM7pJodD+GUPX44EJfgCrIL7+/hmvypDmwNaeC4dzU5gvtsQrSENioED5PVjxhRBBqnyeF60ezutXP0pYLdBPIWgjgwbJQKz3JqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4a7de733fa9so31935b6e.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 08:49:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790956142; x=1791560942;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uhw897TPPtm1bbcaYJ7kO0kX6D8xGhpsPvrBMKfAbUA=;
        b=cDjYX2aD0aBmjYHSMzYYo3iRyak23tNfo286MUSnH89G6DK2LvE7LIap9bRwZAr0LR
         uimP6/NTezboAWyZ229xjG8byEwup4CypEYPprl45i2guY6IIUI+8bW/vpdpiyVTD4Ao
         mrnnx4y5xsz2A6FQvXd++lTUjnfODAOkPPKmO6Vdqy4fUbd8FnFkaz8+CzQI8vDgC3FP
         vX/ezCDZiQsjTAZ4kz9LXg9LOjqw8NamSQC/6m9p1svZ5ThUVi5nvq1v+YNB0CAV1pG9
         Vlh27sUzNr6QRYcrPqBBdmcrdnp8AoIEmMYe/DbG7WQLZ3J+JvKdekI1p+yBXi42sd2y
         /B8Q==
X-Forwarded-Encrypted: i=1; AKwUvBzgfPDchnm3rJC1j0X8L6e+7Kk8U5PDKIubav6jHh0EJ0hJ0TSvTqgt9wiyASRJURQewCKwVp7LZ5Fg/RQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kRtHRi2fXgHsBes7zPcwVSDKFlfQJGmMNzvk6kAEechFZpV4Za
	e7hMMUlxuhZ4kkZGpF6SI5mKX6J9b0/jiBXBrzdWTtA3H6BCR+zcn1ipjK7IqeI7QJJHpwfXcws
	JPtYfP9pDM7e3lKQox455R43F0rgazQC3XQVyGTfD76+670O3ytHVDv9zebQ=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1314:b0:4f6:6041:f0a2 with SMTP id
 5614622812f47-4f66041f3b6mr153207b6e.27.1790956142132; Fri, 02 Oct 2026
 08:49:02 -0700 (PDT)
Date: Fri, 02 Oct 2026 08:49:02 -0700
In-Reply-To: <20261002152415.27339-1-adarshdas950@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6abfd26e.7503fbd6.2d3f6.0021.GAE@google.com>
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
console output: https://syzkaller.appspot.com/x/log.txt?x=179b6bf5580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=24503f5016ed9122
dashboard link: https://syzkaller.appspot.com/bug?extid=085adc3f91549d11066a
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.
