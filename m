Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793939631;
	b=UOIib/lB1fGAL84ezvfpZfxuYBvY0pITbwWSezGAGR7opL3bmGvUu5Gw1EIFbeo0hICG
	 Fn6K3yC6sPWPx2Q6LcnXEq1m9d4a9VYVG94iHTCc7y2FAkRXB6v4cuvdK8Dnl5PU9iYq4
	 vOgMpnaaRzmJeJ1eQ6YL9/gEz3Np/Jh0siubbQKDltiNjKq7yTHD7mtwfCZqR/bi1Rd1c
	 XdF33t06dG/osg7ILUZggRIT7+TKXdhPOTO8NV8ZlF6Wy/1HuCGH4fTeGw+dVwfQQuLer
	 oh4KeClajma63lI6vlo2nMpU0ILZqSK5iBDU6ccbBmshs1Y6O13TR8X0m7n85rOe1zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793939631;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=H3PCrpQOKeukqMHQivsvquj4Uxt0wqhi596+Jc4CmmE=;
	b=skcGkUzMk37A7TPVHPIAMYnTG0q5gBqziZqt8E0RWRfYGUe2ldtttC72NJYuY/zZXuSg
	 KBRmIcEWh7HIijclMLZ8tzruNcJqZgf0zJRrA85gQYnb+yJBW+CwZgreUEw1HQS08spwt
	 7E+8I8Mt97nVZQGNXEOKBUt77/KdUmzf34lVtdjf5wIMw6ybvkru949thXb2Or14UbnTt
	 cDug9PwbUhAQoVP1FD637rJBA0iazAtrE23JrkhXvkZadKcyWBgwb6zGaSpx7TiFUgl/h
	 riwX2yVqnnPHUk8oiGMb3R77mQSksohXzYYds3EnK4bkSEvtxGLLL/DTK8sSsXaMjoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060A7606A334
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 04:33:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 060A7606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4dc57e2a3f2so331063b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 20:33:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793939630; x=1794544430;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H3PCrpQOKeukqMHQivsvquj4Uxt0wqhi596+Jc4CmmE=;
        b=ssMqr+oamOdix8x37hk6I9HCyMQySDEkGgmxIS6tx5JYczARRXmcV/3hqt7OIfbdoF
         0XuRQGTp6LX05K1RGGaU139IUHejI0+ikDR/Hqo2FoLnG5s532KB+/UBwnaGEh/YTM00
         a0FIbx9wHiKVLRATkvYW0kBY4ACeAFj46zSB13AWt9VujDx9f0XiHC4cpgC5ZLk4PVgj
         NQXTQLIizXCjfK9OodmoRYGPx1mkNf+9nErFJ7+q1qY/rQkyPMGSuGlP8+RTVy5R6iIf
         3l8HQuVHkoqMmK4N6qrlg+Gw/hvxC/N+ZmMrSOsaMkhTc5pt58A8FNy7CygRJuRvhiNZ
         hCOg==
X-Forwarded-Encrypted: i=1; AKwUvBzOqdM3ZPS6zKToOrS4oDuXKHAd+kxZ6bc06q1IjBW48xEyhaBeAM4JH6cAp+ZW2lfYXVKH6yA2TOT4hHE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lCWNRdfTxvz7z6Vh9A3agNMr2gndBfgGMFxO9u32Eq5xjTnyp
	fO0qol/4WJ8vEgwMXxpvdjwbWsDTpGR61o3qt6IJuO/cPli4J1jEeZCxnRmil4nIG5w9sgJmmOA
	SIm0ZkArJeTyVtcERWISzTJjf8pqI58CA2RE5igPL1wQphGNut38qzq582/8=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c1ad:b0:4b2:8ee8:8a38 with SMTP id
 5614622812f47-567e095e8c3mr948527b6e.0.1793939630097; Thu, 05 Nov 2026
 20:33:50 -0800 (PST)
Date: Thu, 05 Nov 2026 20:33:50 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aed58ae.02d3f859.2829d1.0004.GAE@google.com>
Subject: [syzbot] Monthly ntfs3 report (Nov 2026)
From: syzbot <syzbot+list41376c1b07a9e4ea8fb6@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello ntfs3 maintainers/developers,

This is a 31-day syzbot report for the ntfs3 subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/ntfs3

During the period, 2 new issues were detected and 0 were fixed.
In total, 12 issues are still open and 85 have already been fixed.
There are also 3 low-priority issues.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 4035    Yes   general protection fault in al_destroy
                  https://syzkaller.appspot.com/bug?extid=04cf7b83f6dd2c3a54c8
<2> 703     Yes   possible deadlock in mi_read (2)
                  https://syzkaller.appspot.com/bug?extid=17f812893d5906837f33
<3> 25      Yes   possible deadlock in page_cache_ra_order
                  https://syzkaller.appspot.com/bug?extid=8bd419f88e25ab12cb75

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
