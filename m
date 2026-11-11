Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794371223;
	b=EtOmNxY1W48Ln+jXV99InC2wS4ro59aW7NLaRXGEpN9p97UUne1yDxqCRddO2XVDPAK7
	 P1Dg4J4IiUoCrHKsfkRk76Ma5vsYrWaigMXM8cqFD/FdrZgTwTlzXcdNWNviR3rWhUbBM
	 Trp2FKIeHCOnzHhOdB95rEUydUZDV9w6wQA8t8bxrnhrSxlwJrZHykTRuNR2TY8psPfDH
	 rdyxem03y5aPEFUqgs2GF0TkVyo/P8abmSqSsmJ1qgKeXgL+bjzrmGrY45zMsbGGXU+L4
	 n90xJR6tlwSoxTQcTuKswFk1qTSgjoGiQbC1D0dDviT8ixpGHM0GWso8IJY3OZYj7dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794371223;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=1/zSW8CzcKdLAea7yxOSQnU/8mQIkBY9zhEmhJqVqc0=;
	b=oqYODDf72dDU39t2XOr3yMdIjoOuWahTg1CER7UpQV7Wfv25sFAihC9dsUvPpRmkP/L4
	 FrSKrwmRVIW0mHJkADKUhQMZiBLNR32Wn/i2NfQ3x63a0OZFHL3DeaaixZDLM82j3giqp
	 55BAbV6+HSqv/V+AAth46m8X+9Y4Fz+b2G/z+t1wBMK2oXmwSt7I6+DfPhik0SI8x5nsT
	 NeNkHwKVTHLI5cD+nDguQ4FjPc0vgntekMV8ZO2vx2WRrQdLs29UKtQrCk+wTriyd4Jye
	 A21axxtIakupXLOIIeQHexxMP355wHirTiQQAYkFUIt9N3MtANt+ZmUNGU6Pb1w1ltg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B87860A2605
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:27:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B87860A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4f8281066c4so3195457b6e.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:27:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794371222; x=1794976022;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1/zSW8CzcKdLAea7yxOSQnU/8mQIkBY9zhEmhJqVqc0=;
        b=feOhXs7JcsLDF1v8jAjPwL58hRIN4QnYk0JiDO6cbuQJq4KDJ0eUtd+h/2HHWQ9TAN
         4S6g6Keh7zuDWin/Xrwf2Itrr2eCTUK2LYn+kJchH66o54Hy4FAFFnXUPJkxGtbGmJIi
         W+MBPQwwLl4QNgvGee5+6wWI1M9+1qEK7dShmWGiufk/jF+iKwBM3IKgCN+4OnWlqj/l
         ncK2+aqPIeNOOzm7lQVNx3Kc1/MvJccl0yc+TB1EERLIeJYuaTItcg+pixO0tm8g0RYE
         5+2qtdJ/DB7B8+8WSgWIoeYiuskuERkIBV+ZWymQ1w0sXgfOhZ6JrgkyOueqm/xXbeuu
         uK6Q==
X-Gm-Message-State: APuU4Z8vJhEZjqmO1QjFtxI2E8QTi6bS7Slbhhtz+IGZT+SFyi7rNft7
	mVbDWNbAE8ouzUt0imCQgUqtkVdkWAVLdxN/UJGZrbw8Y1JOlCvmSvrLLpr2Kb7VlVzhi3Vnp80
	iH9DoKkPATAMhcRTgDWFa9Q4niOJffbmapG1qnqYX7fY2Ezqd0eLib8HlZ2M=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4f1f:b0:564:4f93:709f with SMTP id
 5614622812f47-56b9862080dmr993209b6e.67.1794371222487; Tue, 10 Nov 2026
 20:27:02 -0800 (PST)
Date: Tue, 10 Nov 2026 20:27:02 -0800
In-Reply-To: <CAO7_G+xNhBX9OmcoLHLA_ygEArCRGEVvX1fHgT5DJpoG26BbJQ@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af3ee96.9cda8233.15e390.0001.GAE@google.com>
Subject: Re: [syzbot] [block?] BUG: unable to handle kernel paging request in blk_mq_complete_request_remote
From: syzbot <syzbot+2e3bf0bd49acd9b21d4b@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, nenkov2004@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
error: corrupt patch at line 41



Tested on:

commit:         58c1eb84 arm64: sdei: Preserve the interrupted context..
git tree:       https://github.com/torvalds/linux.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=a58b6b4d667e7a61
dashboard link: https://syzkaller.appspot.com/bug?extid=2e3bf0bd49acd9b21d4b
compiler:       
userspace arch: arm64
patch:          https://syzkaller.appspot.com/x/patch.diff?x=139d7b69580000

