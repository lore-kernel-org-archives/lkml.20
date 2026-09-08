Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A660536DA18
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 04:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788840905; cv=none; b=NQJHQQTAfcQ0xKYsjpWmIVlCIPwXm+UJRdy8yRqgjqGrRGUbqpcg8W89tf29cEuS4YYaBdb00o09/nz+jGQMe+LRp5eWXkXRoxdpLmTc7AthMZ4lJ+VEpI0YGjn9BOSJ6MKpYZQLsCHNMIKlQx2Gqabb3MUN8lGa/doDOk4MvdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788840905; c=relaxed/simple;
	bh=8T+ZRkbFPXR2KLEFa/1HQXo3wsw3MKxxkD+Rp1RCMSc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Nd26HOMS3rPCzBkijJVGQ4RVS1ez8tgiN+ZV+C81tUnaYsb824By0+ADZPhPb5VO6Vlz65SncYr0w38fJdoqCvAOsQ8pQVTJASgjXFLJs6YZPjf0XQbL9jo4+/rWj7eoLCTFUYK23d+eVkrF4R/2EOp8NcZ6BYyXjnHX3uclyWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6b1b7932ec2so3772858eaf.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 21:15:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788840902; x=1789445702;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OJeGxfQ1cnO4KfojSL4gJl33/1+VNF6TUeyMxAp1vaQ=;
        b=fTEM2JlOGMCDdTw7fcwEeBT6BHxaI3Vmoui+I8GGu1b5/QYi0mX+nG8I16CtVmoZOe
         6I+HnTT0RIWnbtJ0HUEou2IVyk5vz0Y6ltO1ZsnIrzxgohI2qgncuqEs7BkrVzihBzVe
         33ugCpIOB2xIqX0sFWrVL9iaK8PgJNT58ZEBDmLkHB1Frb+BxWl4ShuoFsX9p/cIWf7B
         c6bi78NvhRH1ARi6s4WSJYHfrXZ9FzK9/imVygDozkOOLEBb82GIunGiUHG8/BAFVD+R
         nIlJGbfnmW2dnNEYp0j4uxYjKXEMdvjzTdmhcV/WYa5/YCfqxMRI+y+537st947DocIS
         MO/Q==
X-Forwarded-Encrypted: i=1; AKwUvBykjy2oSLzEom3InEwbzUDyWp7sMbvBiXQko8GgIfCypotWtGAiJUOPcMkyyF/aoxWALT0xTUt4BrO9rrE=@vger.kernel.org
X-Gm-Message-State: AFuF++lJh3pnVsCA+t8aa1r08tIlZ+cQdHeClHbLdyzdoRNOwHyaaD0n
	93HEmTRj1x3er7KhhyTmjEMQNSsl7wRoPPozUwBPWItZZwevVpSAxFmXddQ4xp4uvbFKE0nw91D
	U8oWaeSjsslD5NCbPiwimAumKs2MA6W/SNhoulpotN06LulisiW5eKOLJgJY=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:603:b0:6b7:8415:d784 with SMTP id
 006d021491bc7-6b78415d7fdmr12916161eaf.47.1788840902666; Mon, 07 Sep 2026
 21:15:02 -0700 (PDT)
Date: Mon, 07 Sep 2026 21:15:02 -0700
In-Reply-To: <20260907192517.564ea15aa8c9d47669b3a81f@linux-foundation.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9f8bc6.f614420e.2bf292.0005.GAE@google.com>
Subject: Re: [syzbot] [mm?] WARNING in vma_add_pgoff
From: syzbot <syzbot+c6879dc677a017f0a21b@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, jannh@google.com, liam@infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, ljs@kernel.org, 
	pfalcato@suse.de, syzkaller-bugs@googlegroups.com, vbabka@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+c6879dc677a017f0a21b@syzkaller.appspotmail.com
Tested-by: syzbot+c6879dc677a017f0a21b@syzkaller.appspotmail.com

Tested on:

commit:         35b0fb39 mm/mremap: reset unfaulted VMA page offset fo..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=15e13af9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=56ed23170c168d4c
dashboard link: https://syzkaller.appspot.com/bug?extid=c6879dc677a017f0a21b
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: arm64

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.
