Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485963;
	b=flio328MQrkfVEkgt1rst984J2SwV3Rm9WT6ebaPa6Wt8dOBu2nv4gl6/B4MTMWJSaiw
	 YEKwEDYt0iUJ+PHrh+9j8RuA/30hmUf4vrNsVlYnKqTIZXtj3iprGlfhH1PLuGKcM8OMk
	 I8CgToe8zB4Qh5NCdqlpoT9boHwZhqYVtH8Z8X4pRNWD8/EWsmgr9cFNLBRicOfgojdlL
	 YaQDlSbwjOHU5x5UDnAXgbmfDhlMWPMgambYyX4wPBTenJykTOq084XHyuGI2n4a1as5a
	 oJv+8uTzkHPtvDzvf4P5txYzdllP8OvsxNTAbWzDPM+6j6cAT7Db2p3MBHqEnUd76RQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485963;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=r+n9kpP6+KuFZV3wferc72jxCsAkXJABKbiEAiTkZpQ=;
	b=4kD8aX2sgP8uUxhwsZmiGXF4HjhVkFIO6JbD139nKPtYVwNxOlPCFMKXEo61fjPkNYM+
	 O46NDdnuggwUyUPtrnFJ7g9tfe83SqCHx2HlC9QyMe+VApJp2R8YCfoxQNohYjKS2+nMH
	 bAyZhsAH7v8EPY+sThV6A95bY4TME6L/SORQ6hYSdNKBNvj9Di1KuJdqlmuvwZ/eZ0FTa
	 W/iOTwQU5Ydc+6y7EtiGw3KaaDhX9y3/8FIdRkSuN65Z0VoEzJ5+EC8sJtlOqwVYPQsT0
	 G/3e+3kTRVkBzNIjFA6WZmnfCFMGnaT7LvcX4IGsskB+CkQpUTl2lYLxZKiVoDNIO+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3913F606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:46:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3913F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-540537f959fso3607692b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:46:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792485962; x=1793090762;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=r+n9kpP6+KuFZV3wferc72jxCsAkXJABKbiEAiTkZpQ=;
        b=DLuJ48AdJ9DPgmOIafs0/0NGVcUBrfvC4XX8qvhkoha7nVMbD7lKT6A17dKzqWZgqN
         GyqqAdGyfxx7f0sWhjKM6B/B+dRGH+/4S1I5QitJ8GHJ+clTEVVfPL+xxjjhF+VCuxjP
         xptszPOc2rKiRHWN75oSWrn28jB1+xSyCWf0MhInMHk7vNA7ponSAyfwcNiDvW7S5eBc
         T6njcursaN9yhOXZthvu6rBS8rbREJbToBniKQqMLnLny885GqcOw6RuT1SyEjTAnL4k
         VBqaIN0Bbf1HxHWbNeH3W0X4CzjGQ7fktKVBGXlBOBVFqZ4SjgmjfmAQXz2+KEm6ix+q
         MxjA==
X-Forwarded-Encrypted: i=1; AKwUvBwAnywlHjQPU8CtfqxoDfkH9cw0E2YHqwHOJ2In9lhzQAxel9FjkKTZXZaAkidO4M7Cp+QIYu8WBveu3A8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIp1VizDyfH1yEQ0KWeg290cRBrvC8qh2V6cvon0qm71F0jfD41
	sLrbbbDibyRaJs2YRbrBtTn8pbuNNYOeE2awcBy1EU1+DxTlSEup1/2R0kOgM0ZCLyqC/gyu3+g
	+yDULCTzCCVN7ERzfuMriup7DjP2HiXyhdvyHilzBCQfTGLHtYPdzYqP5DMg=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:14c6:b0:53b:f96:ba4f with SMTP id
 5614622812f47-53ccd9ba76fmr10754176b6e.36.1792485962252; Tue, 20 Oct 2026
 01:46:02 -0700 (PDT)
Date: Tue, 20 Oct 2026 01:46:02 -0700
In-Reply-To: <20261020083034.8155-1-kartikey406@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad72a4a.a20cb897.960b0.00ba.GAE@google.com>
Subject: Re: [syzbot] KASAN: slab-use-after-free Write in o2hb_region_dev_store
From: syzbot <syzbot+3025e3e8fc0b928af8f5@syzkaller.appspotmail.com>
To: kartikey406@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+3025e3e8fc0b928af8f5@syzkaller.appspotmail.com
Tested-by: syzbot+3025e3e8fc0b928af8f5@syzkaller.appspotmail.com

Tested on:

commit:         f47d2236 Merge tag 'vfs-7.4-rc1.sync_close' of git://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17930771580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f5a0e1a0c1f8a1fc
dashboard link: https://syzkaller.appspot.com/bug?extid=3025e3e8fc0b928af8f5
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1442eb71580000

Note: testing is done by a robot and is best-effort only.
