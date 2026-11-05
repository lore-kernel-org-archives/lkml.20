Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793903044;
	b=GIMw/6tLOpenzHirYkx5iqztXDRbe30a+ezLsx8rCnO8qPu9Xeiivus/P3oLKJ9NrBaB
	 hVcX89J++uv08KB9fgNVFnOiCVIZ2JSxrAd1phIzT4jBCV54Rr1IpJFZdseFwICE02RiE
	 MuwFY0mmCagRreOKH9ojp7TEICG90ZqJzM2SMh5AiVDZGmfgUAWyw8IEo5gbeiEjLaJ1d
	 WHSPYJWdVU6iwPemebC/y1v7uCEgKpsqgQWZTSOwqxUau4tlsvOEUUSlsi1FJlXLFE+ZQ
	 r1FXZYKH/Uie2kVGVKF9OxRmbv/hlc6uLamor421yzEKEPP4JUZlEwI4N5VQL0WTRbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793903044;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=FZYaPiXF5uqkd9py2yyYx1geKocgOLas510kMd12DD4=;
	b=nYEMixmnHhpyD+05SWg1lz7aYvD6X0Ec26L2ZyNnCy5YkKYAcS3+MbSFnwzjeIcIkFjJ
	 V0w8CMLkPBbbC2Elg+yTwIwhMntIiUno2+r8TCR4iH2aEc6AnWSyJFNwsIb8+d4TImxgz
	 5DuufOu54h30aED7hj+8F1dlrpnYwWjBqlp4/kzga1DAvelrq05uFiHyzRVDJbTZK8El8
	 lx6w/P6DLJ1wnS3z7XwcVa/t1pJI6hq+VdITeiEMIT4SosKNAviD/Xh6YSkOsoPXQzgOv
	 8N7x+3eO+yHrgLW+1DDN2yW/8m+nSH/VjR2tlUYTGlpfrYfit6tJF/w6FyCHemmsOcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63839606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:24:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63839606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4cc89e86e4dso2962975b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 10:24:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793903043; x=1794507843;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FZYaPiXF5uqkd9py2yyYx1geKocgOLas510kMd12DD4=;
        b=yMh8Y7L/I0tGBMCZWnk4CWf+Z2WSwG+nWQr/HgcUnK6B7xOc75DQLLSvvar+t8ln1z
         1NgM3jQq9i3E8mm1xc02XJJT9rK2/rqhzFv5VtxoGTI+EGr0jrmG1W+oX3FZMkdQ5Ka+
         hdtNa40hrq5JTSy6ydYOhqHpH/jCwb46IxFqq1KwDBhXXPuGSoK5qy8nsM7RKoSg4Rvu
         DRDa26wMKvR8+BwurVgYphhzEGpwIZBJymtUNEaISC5lGIqXFrJxJVhR0kQPHK7FD230
         RcGIn4XC9fz5K0jyxs9//hxi/1i3b9+RvxO76dP/FJSgPGuNFXtimTSF7WVUy8g/EsFY
         QVlw==
X-Forwarded-Encrypted: i=1; AKwUvBxVbfbGmR9SfY0IpTY9y8LLDLG4P94B0ciLAVTQJAn/Z5lErLnddQKh1tr4Sq7IGRyGtzoRuPCJ2iQCAqE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HSpgoZDTtAaVYe5Xju9mYErfGstjlblrD9koTqZDLM3nw+SBT
	NWdzSNbnhxTw6AIKboDcQ/3BbPF3LMG/RB1zsAp3O6RAOlfhNXTgSDqxXqVqZRTSJ/UgQQTxW7Q
	397NOoUXwdXDEOtvQjgXXoVGURfkbRpmBvDWUNnqbhGtMphMClxY7/iNQ61o=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3c48:b0:4f4:d7:b16d with SMTP id
 5614622812f47-5640de8713amr14198871b6e.60.1793903043331; Thu, 05 Nov 2026
 10:24:03 -0800 (PST)
Date: Thu, 05 Nov 2026 10:24:03 -0800
In-Reply-To: <20261105180403.675338-1-diasyzhangqing@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aecc9c3.ab333cca.1deac.0002.GAE@google.com>
Subject: Re: [syzbot] [ecryptfs?] KASAN: slab-out-of-bounds Read in write_tag_3_packet
From: syzbot <syzbot+2e8c4ecc07730b29ae27@syzkaller.appspotmail.com>
To: code@tyhicks.com, diasyzhang@tencent.com, diasyzhangqing@gmail.com, 
	ecryptfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	roberto.sassu@polito.it, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+2e8c4ecc07730b29ae27@syzkaller.appspotmail.com
Tested-by: syzbot+2e8c4ecc07730b29ae27@syzkaller.appspotmail.com

Tested on:

commit:         05441d69 Merge tag 'cocci-7.4-rc1' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11a70cfd580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5c210800cfc8f61e
dashboard link: https://syzkaller.appspot.com/bug?extid=2e8c4ecc07730b29ae27
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: i386
patch:          https://syzkaller.appspot.com/x/patch.diff?x=102ba969580000

Note: testing is done by a robot and is best-effort only.
