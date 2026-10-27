Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793106664;
	b=lfVxhKHan6A6ZNZs/OpK0qBDgkQBB2t4sGxmUtU2bfOIUcqa8sgXS+Y451cYoSDyigtQ
	 qTvhmTfaZK6dl84NQMCWTmN2HL3DhYgXhZb8yxkLLfBeRU4vlEQWbNpFRR5QTZTrpelMf
	 /P71sVWyiU91NsaPQWMmYbRC3LintAgooGaPKSUyhdEpLnHYNtCD85HAwsHlAQU6OreYE
	 eU8p0RhHBD9wktKTfjRgncEoBcJSFYYwVDJaUAPo4Jy0R4oW1CcGcew6Ob+ubnqb2//Tu
	 Eu8YNACFut3RPUj/hz6Hs7e/sx/+MSyt4+aewbkDSengffMWehJEzjosqb4aLV38grg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793106664;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=Tik/ulgABakxa1oAhx/1O8sWVbM9Zlnmz/bUllJFK3U=;
	b=oDGiXNXAW6dI3/IIgb5doBicMLvBD01a50SuDjtQyNZLKMeKyBPvobdRQAL9aHfk49G3
	 DhWE+6O/jnts3/W7kHp6gAcQ5ixcO0XJlBa1r6E+7IXKihGW9whYnB1WTTv7io3isr7z6
	 tKS+gz5D/OTIjG9Cse4YfwROtLwCAASOUhPSN0QkKURP+QiRYZLLJ9ebGabCbrtRubni9
	 WKPgOimgPgbGz6eG7cPuZx8lC7aajtKBN79kcsmi6e9EhasksBzv6SqdsBdyVja6rhs3L
	 Oez9Vw3b5ARUuQO/GEJLejSVs8VfkPPBxmpj6qhyIXGKofxBduVqIbbexxU8VFoME/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9A1606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:11:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E9A1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4ab4f652f9bso3433685b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:11:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793106663; x=1793711463;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Tik/ulgABakxa1oAhx/1O8sWVbM9Zlnmz/bUllJFK3U=;
        b=VudsXfiuxI79CG/ix9naSImYyo5dhp2VVoEVHm6kXvZjzUF7qanoadu2gM5/QYCLl+
         oe4VEWyWUJqGD/VMowm4l9EiCL41bNBwdwpdTQE6iUkujcOJbZPjpVgAg4DdSaOwlMJu
         Y4wa1r+wXISwcIrGzR1BKxlMsFK1mqYaocoC/oA3B8Lh4hEmizH3lThiTAmdtZfHHX2h
         U2nQamBi1SyYzzMBIcSunpp73SgNVd6DX8fN7XqK6fuTH7nlO37hU9+Ab5Yn4shbCisS
         WWkapxNGpUkNsCz8r9IU4fSb2evCRzD1Sv2HMbV9aOMctQHiBc9iGfdlpaX7sXNjScUh
         BblQ==
X-Forwarded-Encrypted: i=1; AKwUvByyvtkH14R886xJ2Y9Y7YfbBHLffXu4+U+VELxO1T1BF03pVFEPp851D7eZsfWVAmmq2GDcV5y5bYGQ4DU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLhn010cJDkZN9l2dVZFPPe1a7N/SHyr/Q7ELmTrTWr6/VYnJzD
	xrHPQV46h/VRI5qbumT/+MIvrexp2uhVNt5HkbBdUr0S8y6RZmrFDD5h/PEihZDNPt8Bd2ASOTG
	fUp+ZuOuyaD+1nWewsS2anGfhi5IJNz1rpz90VHI/xsiJIXuBswY4vCnNd/U=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1b2c:b0:4e5:2f2e:45b4 with SMTP id
 5614622812f47-55c002016c2mr5747613b6e.21.1793106663148; Tue, 27 Oct 2026
 06:11:03 -0700 (PDT)
Date: Tue, 27 Oct 2026 06:11:03 -0700
In-Reply-To: <20261027122526.281548-1-diasyzhang@tencent.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae0a2e7.985912ea.1e5798.00c2.GAE@google.com>
Subject: Re: [syzbot] [dm?] KASAN: slab-use-after-free Read in pool_ctr
From: syzbot <syzbot+83827f9a59abe148bff4@syzkaller.appspotmail.com>
To: agk@redhat.com, diasyzhang@tencent.com, diasyzhangqing@gmail.com, 
	dm-devel@redhat.com, drifabdelmalekmohamedsaid@gmail.com, 
	hackerowskiy@gmail.com, igorpetindev@gmail.com, linux-kernel@vger.kernel.org, 
	mpatocka@redhat.com, snitzer@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+83827f9a59abe148bff4@syzkaller.appspotmail.com
Tested-by: syzbot+83827f9a59abe148bff4@syzkaller.appspotmail.com

Tested on:

commit:         d135ab45 Merge tag 'backlight-next-7.4' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1595102d580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c899018ccfbe890a
dashboard link: https://syzkaller.appspot.com/bug?extid=83827f9a59abe148bff4
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1311fb0d580000

Note: testing is done by a robot and is best-effort only.
