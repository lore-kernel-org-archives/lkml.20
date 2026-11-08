Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794140946;
	b=d1QTXFMHMwvPJ4C4g4ApJWJPWq752KxizMVwO/4nxv846/VCNztvFSPMdPPazTy330WX
	 Z9mRDZzcDhc+hYqZ2GBENd0hmVp8xH/wFaSOi9SuvpUT7k6ZWrgPO2mI2x9+MTrYRf13R
	 UTyvTPDtF/q2JValeb0WqSsNb0hajs3aKGpMfDcTDYmUrPW8slOLTK+IxZHPeTaTKfeUR
	 tIjwJ6zAmjvJmetOA4CMnLqNM/xrzRU7lGeq7DBx2qU3OAw/PihDAilxymw0c06B+RJMy
	 It4kLPr3Lf8+A+Dljy9MsIfO5bppJWauH/ZM8Bf26A6YmebKPa1UeGgL6uBfIc5MQqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794140946;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=RVhkD7YAATaAmFlE4izSXP4SPBrd+d/pegcKjvFmQzY=;
	b=lxx+Ty4fzzI8mhKKTd6UhdNmKSinp10hcwBTL5+YxWaolOijkyi4RNXKbOCJDwPzKXgU
	 muxxKBY1uWgbQoWZz0H4FjcIHKiuiatYCVqon49QymAXESB6t0CBiBTg+oHtDQBensj/Z
	 kk+8Uapj9NVAD9VeMdzGz8eJRFTbGE2VqGc6kx+dm3BZTvL/RsG2lYLNQrPhjb8witPJY
	 9ConhHEUFzXYlakBLyyfhv3kJ78lBJjdmZXNOXyRUpmU/PNagSH2faFleQFr64KIs6ERk
	 KV5weBn0C051Gq/dk0qYZF58bCcyF89/htcvxlE6yaHYNiYkC+jFlerHtb9wMCSf8tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.72
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDD7606A335
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 12:29:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DDD7606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-844bc76180bso87045a34.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 04:29:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794140945; x=1794745745;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RVhkD7YAATaAmFlE4izSXP4SPBrd+d/pegcKjvFmQzY=;
        b=b1LzWEcmOP4vUQCU6v85QgEGG8CJrgS3r2Zw+Mle8iQcdAK0atmcumrpaASIaiCw9b
         cBLkxSddacvg/ybWjvUdAvcYFJTZnhSp6D7TQdRLf5F7xBZwqhHzr6MrSVTQMkMfEObm
         RZDAeX3KL0ZG00+kjdAFuGnOU3q5KiWBlD3udxgnuqacLBDc+ZiYjFetFvkcgRw6hI3N
         yTJ55JGiWHyr8Z+XM16T6UtqGlagzuD+a2ZyGUYM4ejQjhc5e1PDiQosY8p3zrjd9D95
         AEvLe/J8CFo+MZCgPQjtWtUsbnGGj36V5RsYpscwVE6FVICu0Oo8Sjz8XW7BEvIjW/oM
         F7wA==
X-Forwarded-Encrypted: i=1; AL+hErELqZDsqJ7huKLJTdX5r1vy6zHOIGIIv9K+0ecvyojcqHryd2qFZCUyesFOPgw2oouZP7PJMkFlavrWRis=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mp8oYWl3bk34PjV1xXHCLmnmXVDZfPDws0WWaz4R1JK0AizhG
	ZzdaIGS8ye9r9ftckYYAHhcHjayJNQ/OSXBKpiHINW6GVu/I5mwEgp0chJxuz7CHXL6BC4tfRmI
	324DZ44IQXG/y2PDCSP1v02e08Xnb77u08ahjYmltceF3g0edAjrX+bJB+5U=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:5087:b0:4d6:90f3:74b1 with SMTP id
 5614622812f47-568147123e6mr863926b6e.49.1794140945618; Sun, 08 Nov 2026
 04:29:05 -0800 (PST)
Date: Sun, 08 Nov 2026 04:29:05 -0800
In-Reply-To: <CACbwGuQCm_TQHkeBsMJQaPMEojvp-3LLs=+qGPh4sf8OoH7HGg@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af06b11.5a668245.1aceb6.000a.GAE@google.com>
Subject: Re: [syzbot] [driver-core?] INFO: task hung in usb_set_configuration
From: syzbot <syzbot+c22bb42560ec86726aba@syzkaller.appspotmail.com>
To: gbughunter8@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

owned.c:1: error: VRP_SYZBOT_SWEEP_1108_7e42c91d


Tested on:

commit:         09321e9d add redacted production placement sweep
git tree:       https://storage.googleapis.com/vrp-syzbot-rce-842629920185-1108/bare-repo-09321e9 main
kernel config:  https://syzkaller.appspot.com/x/.config?x=8bdeea7ee6735f91
dashboard link: https://syzkaller.appspot.com/bug?extid=c22bb42560ec86726aba
compiler:       

Note: no patches were applied.
