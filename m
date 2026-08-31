Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09832346FA0
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788161044; cv=none; b=TaBv623SNTx3loXi8IST0jzQEPMl1xET7x4QZqvYJD+eLguBvlFRgeWXGqtH/3OfFci0fixMcVrIP5iu8dC2U6dR1VV4QIe6dn9YGMOI7z4UFH5EZSkUXYMqw+dvRAeI5e5tcX0Av2OEuXJrS7kNbNEirlXMQogjOpH7wrSggJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788161044; c=relaxed/simple;
	bh=G2U+dpDhdyjhEF89ujP4g8nUUr6JGFjbMk4f99GYFsU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=IfLzsyH5gedz0MXEFK5pZOL9cb24wJRVbpAFi7fzDZo4EXv2FcNGVV4MmMTkCaBb8gBy93NJld6eW/Fu3qU/pneQDoGGZ6GelN/uBfFAjzMUi7bAgujacG2Sw0U7Cx94b5+aqxGwXt8Xu4iZFRC1AjWNJ1+5yYOFPZZ2D6s0YrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b2f2b8d88fso5972106b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 00:24:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788161042; x=1788765842;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=h8qoGsuawWLrFjlzcIsepzotGVqYYnfivDwWIXWf/Zg=;
        b=Lu0TZWBQpTn42P2lLNTLA4ro0DrOQyUMX+7W53QLuZA89bRVRqZkPe9795QzDsofBH
         O4jysfzWRES51nAr9lRN9NmSuKxYuAMPh7h9lusgVBCwcEwi11w48AzGLsKQ5/vZ/YOY
         Wj2ZcHYRiCT9oDQcJVf9msss8FADxaoQ9AneRuL3bTrF5FFFL1T92NkIrmHGtqH8PZRP
         rrNX4kWb93j88FaFJFloVbbMkoUwy+qJyjTrgU0cqj/YNkZ7BIKdqukGDuLw23J8Sd/h
         XF2i7krRSusDuaQCN/mc4ZVY7GK+LWqmpjlgvcIii9/Ny831JKLwJlZ5gDIQQSCvedJN
         GbGw==
X-Gm-Message-State: AFuF++nrqoLFEeFByC28QRNeRlw9KvS8eG4679GoO+DFhYkT+736mFO5
	YhzPrNPGZpH4UbCQFNat0UIX3GQfAj1TVOGOV1SqJdqvJBHj/Z/SPcZkk2Rh9OO+pbBP43GAQl8
	Pr43GyBH1BDFCNqDadLaM5oUFUl7fNoH2EN/MiE5pLGDVdV2jFZBciTVCg/o=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1794:b0:495:fb79:7712 with SMTP id
 5614622812f47-4b5b0fdacfcmr1088492b6e.0.1788161042005; Mon, 31 Aug 2026
 00:24:02 -0700 (PDT)
Date: Mon, 31 Aug 2026 00:24:01 -0700
In-Reply-To: <b51511ac-8334-4898-a586-a5e3c5d7f69en@googlegroups.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a952c11.4d659fcc.734b4.0045.GAE@google.com>
Subject: Re: [syzbot] [cgroups?] INFO: task hung in cgroup_subtree_control_write
 (2)
From: syzbot <syzbot+bb2e19a1190a556c01b1@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	tao1.yu@intel.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+bb2e19a1190a556c01b1@syzkaller.appspotmail.com
Tested-by: syzbot+bb2e19a1190a556c01b1@syzkaller.appspotmail.com

Tested on:

commit:         0e09c068 cgroup: don't block subtree_control writes on..
git tree:       https://github.com/yutao-intel/linux.git fix-linux-next-cgroups
console output: https://syzkaller.appspot.com/x/log.txt?x=16f4d379580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=31bc85a68b5b5754
dashboard link: https://syzkaller.appspot.com/bug?extid=bb2e19a1190a556c01b1
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.
