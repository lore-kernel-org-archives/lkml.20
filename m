Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793553783;
	b=mLtPprGM3hK91cwFUE2v+0ymn4hUmXWVC/q7imZUmitertrBMr4Qn6VWaO4VZA2pOH2R
	 ypPr5/fRFOOtQf37rUTRsArzxnSzHmc0gFMFmCkinpKU2qMkI1lEzI3THrw1XEfWqYX7G
	 zV37lAP6JHsoftkjARZAQbbEugiKAmskt9bV7pj0cqft5PRpb5eweq6zwcxqX5zwbtba4
	 wbF7KKR+3mX4E5Dcjm+qoHXp8k+LBX1SkWZq9yr0DR59eQEjMvQf3+L1fVPboXh95HLuD
	 r3OOpSqmEl4pyatimJF4zpljTTzxl5d8isZpPEHLqHvZMDRVXQHDySegi6np2dmWDFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793553783;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=7VLjjmWGwHGq6Pgha6WPCNbDxLcpZVjCm1Oh8KdPcpA=;
	b=pG4yA7R5ClirR0EVkEQ3xHTH6bdrVyhxaptCGO4e+LPmRKNJLKVbMWQ+nCbKf5+43wj3
	 PhauNC4Qy5+U3Oov3IILk4NElkP/bVCl8Oqvo95CsNEKbM+Y8GLHDUkiN6Qh7legLLigZ
	 2+TPw1GUEkqcr5bqrhzyVqCD2i11jo8iwEVHdBlQ1cCukTMwnlHi2nr1hDh/O7a7UUMt3
	 Sfq7fRBShBER5PRpZoYUN+mQJJZiIU5rNbwWl2EpGvgxdg2y52mf1juGKVoDJ3cfwajde
	 HljNALxXzcVWL4VWk2igr7++YoAfVkrT38H8xLzVRpMMz6UP+HdnX9WBhUodAplbMeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.160.70
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A99606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 17:23:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7A99606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-482966c4f4fso6627038fac.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 09:23:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793553782; x=1794158582;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7VLjjmWGwHGq6Pgha6WPCNbDxLcpZVjCm1Oh8KdPcpA=;
        b=gavFB0eI3mB+TFMCJi/x2KbT/UPUqp0oi5YbNav1BwurhQhWBV+ks2oQ3Fx6L4xbxh
         c8jGM9rFt7szt/x9Ufb0UB+R3vtTeaXkwYD9dF8YqcDcSlwLa4g+QqJu9rt46axjKXtl
         AXBUTHQEH67kMxu9DNj71Ir+WyvnGi9wHU0nlrCjAjfbswMTXhsmabIJR/GvpR6t9gph
         kbdByrR++3WYtA6qm34l6ygHjNued9RZYDEZuIPmBxTLNMBc5KTlAFhtyrEg08rUbleD
         GE8zs9mhCWvD0zc5c23EJcSjb35rb/w+FrW5Yse2numsb5wR4S+KoBVCbMAtueKj5Bbq
         y5+A==
X-Gm-Message-State: AFq9FYK0QRVN/u9WenxhLzLR9RQiSoOIlxJil/MtRLuugASZeE8Ubqh7
	jV9iKoFIbUmG0rv+5xxx+tusWEEZ6nEYEaaLjUX106hVfrqgsDftjDcNFy61oUSqAxZphbxFHE7
	pbSneY6ASGatVlxrnaalcm4Z70JJ1Zdzglk1sH7Px6LbecFQPKwL6NQT3tzY=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6404:b0:4b2:8dbf:ffd with SMTP id
 5614622812f47-563ef620659mr5575976b6e.1.1793553782017; Sun, 01 Nov 2026
 09:23:02 -0800 (PST)
Date: Sun, 01 Nov 2026 09:23:02 -0800
In-Reply-To: <CAD8CXU=YL+6KG+ny7DfRKqAEqBp0Qeu2y8Ej97+bB+xM1JcksQ@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae77576.64e51036.15cf6a.0013.GAE@google.com>
Subject: Re: [syzbot] [serial?] KASAN: slab-use-after-free Read in check_tty_count
From: syzbot <syzbot+39a2135de1558208d3b3@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	varun.singh10011@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+39a2135de1558208d3b3@syzkaller.appspotmail.com
Tested-by: syzbot+39a2135de1558208d3b3@syzkaller.appspotmail.com

Tested on:

commit:         cbbddb6b Merge tag 'power-utilities-2026.10.31' of git..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=165ce62d580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=245a52f53bb4b06b
dashboard link: https://syzkaller.appspot.com/bug?extid=39a2135de1558208d3b3
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17f6dc8d580000

Note: testing is done by a robot and is best-effort only.
