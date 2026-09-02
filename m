Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3163128030E
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 20:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788381605; cv=none; b=ld0epdMtjs13iDRxY2EGl7uNUIIg/hGLCZAlvWVsWHLZisYMytZry5sGC9GgjKS/GxLwB4+uX2DF4WufTKCijmpQqvp2IqfEmO5qekWIsAbNjboNmOEIkOuiMxbZNbDhcY3MZu+7dl09DyVWSgd+dnYKsocHRFVa7eXu04Pl9aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788381605; c=relaxed/simple;
	bh=/JQg3RwNfZt5RiPmrCXnh3bn/wWO9A++LIx/bcLvaCE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=T+rUil6jDyjOqU82r9er1Q58Ddtv6bbERczqh/7SfFfXQpJTnJyccZy3I13SSDa7yf+WncDzA1Yd5ADLcegoYA0a+/k7bZfgycVFUgWnTdqHyaBiCkgyVlIwbQ23hkUH8SBKeBSldSxuGsMhSR9MCdbM8YzXWgTc0p8tvCk5oEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6b1b27d7ab2so1728135eaf.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 13:40:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788381603; x=1788986403;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SiYmHX+eBkOTAY/K0qwKDw6easd/JAqJvWIHq5nl8TE=;
        b=nXhoYspppRDPidYZyuuonTdHlczjperfqUOJUoeQyKz/VQRRRIm4dmjqB/eAJ9r4GB
         To2KptwXCSIblR/RGPmCFDF1q5SHTmBPh5iccz9GIesvJ5/AkI2nkB6ENqzSxKfE7nhK
         2BERRQInlvvXs78+co8b1qO5mRaONz89aVP9BMAphmLmBtUE+485p+qGdcscYzaDB2Jl
         JMp/naK7quRX26bnu089I2TiWZK3467XZrW3TIF3MKINQrbkomcLVQDEu3KKKzbU5WAv
         wULSQA2bmmy5JNdAJ3PpnntCNuH6pHbjaXSI+3O16Kz7UujcMQkOIBG7iJ0RHEyzGhHK
         /wog==
X-Gm-Message-State: AFuF++kRPK1cIgmu6+zIcXaJ4bVFCuzcxF2lBs8y9FhMEZBaquDmsE9J
	ki3bLrYPfRWPKjzZPTB9m9AR8zuCBOAuRCwz1i66Du09nUrbhQ2kzy1Ax/qhFIwe6d8GThwvcIh
	udnPec1AQy9o/s/Exan6+1tERqiWP2gk5U9+j5T/mrPZKmqB0buarZA2S7uk=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:610:b0:6b1:bbc0:b69d with SMTP id
 006d021491bc7-6b47cccb1dcmr5553500eaf.15.1788381603042; Wed, 02 Sep 2026
 13:40:03 -0700 (PDT)
Date: Wed, 02 Sep 2026 13:40:03 -0700
In-Reply-To: <apiC5snJsq1LNSdz@user>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9889a3.27a413cd.1e878c.000f.GAE@google.com>
Subject: Re: [syzbot] [ext4?] general protection fault in __bh_submit
From: syzbot <syzbot+41453ea05ab61c075f1f@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, pavankumaryalagada@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+41453ea05ab61c075f1f@syzkaller.appspotmail.com
Tested-by: syzbot+41453ea05ab61c075f1f@syzkaller.appspotmail.com

Tested on:

commit:         8b72f662 Add linux-next specific files for 20260901
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
console output: https://syzkaller.appspot.com/x/log.txt?x=15a88b49580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f0b8b8ff36ff67e1
dashboard link: https://syzkaller.appspot.com/bug?extid=41453ea05ab61c075f1f
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=148d4125580000

Note: testing is done by a robot and is best-effort only.
