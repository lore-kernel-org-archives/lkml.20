Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793565214;
	b=eia0R3f8Y8C3h1kdOdKKrLaG7NERTtqdubiy+f5I7ePPI7zHilPn6itvfSDVqBaklInt
	 3iT+NyZMlSfDBMJ2X0Xa0OqKbHvVw6f9TEtBwQBsAJY9VaW/dat5FrGUi2+jPXFNu/Q63
	 h9qwKNo0jNwhNkoP4R6f/krSBZRnhJlqwWchVoX4oZHEasBNm2zG3ZSvzd9uq+Ib5k2NU
	 beXUPwMpmKh1eHHJVJNc7mNdp/hnbqhQuZ6bnNMXOG6bkjujKSI2miREQb3fpDGr1TT2T
	 7inWzjPsaLdh9CHQsWPidzsrgrpFWy9qQ90IQFAU+ULLIu/DZNE6CADY8PaAtVK+VtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793565214;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=LW7OPyjwBJ2uOfyFmmXu2pAnbnSBBaS9xioKSKoFLno=;
	b=MAt0VQXEEYuiMvGbkmAhzorwiIkHWmr8j6JFeo34BjEpWzi5a1fS8P/q5VPZQc/ASrst
	 CVUQo6I1kIbIxyD+LT9oICVPdHJQv9zpAjL+n7hMQc6b2occM4axytc1E+C25FYmnyB9N
	 ID4fvHNQrLCrU5x+LOV2OD+u/h6/CulEcsIjEiA/xH7Cn5AOfJXQ/5gPZqkG5SNAG7ALj
	 WDvtqEp+gFkKs4Nmz8WLDmmQrMlQJ2ewqb/6MH5ThOGcQ8GileGcYPhBCezb7ONOj0Jro
	 RnqRTC9xdxGh0fxt9TZc/1sXrD8/7Cga95E1WFCq069DmM0GwVCDAsu4ImiRDGLCEGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4442606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 20:33:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4442606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-55bf11583d9so3380607b6e.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 12:33:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793565213; x=1794170013;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LW7OPyjwBJ2uOfyFmmXu2pAnbnSBBaS9xioKSKoFLno=;
        b=1Dc3zJqbg4H7moohiYxHDA6HxM7T+N/OF2lTWUa8Zou4xauVtHtyCsDgr7MZ28EDW1
         5KSCqVnXQu/Wa+XFAzCUxfN9lGqHy5ho3bBjhJVcmtCIRO98xXrgKP1TeQKlSfa+ZAbx
         lg9XTdEBe4UL7kw3S3jvFH7r4wO/1fjYz73b71RlKjgfQbx5yaji2QaQJDyOQhdXWL4s
         g7nVM+JrswN72hoGlKvUDjPGAl9+rn2fphWXYMHDrGSHV/Adrmb9zntqbiUBHPkGI/xd
         exhntUDn8VxbXc0zMpoOFq71u0PPFfqJGaqeSOFTKwUGkL7ZsKMbsM9qwhpUdCzDeUZu
         0MmA==
X-Gm-Message-State: AFq9FYIps+tW+OmH4FuEwURrlNc3lfE/YF1xGAJZVYWEfZyqthZWiM3Q
	86f6UvodmFaBsYKohb9sUPJi0J2i/z9wtWYDMfpCF7Nu/KjwRstHASpedJCQEib5hbwDQGMiRJK
	54OC/mvtko0QWxnYfy/x5Zk4cnFyZHUDgpABss9TcHqhrQwoINpzwUHC9Aek=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6413:b0:540:8ca:36e3 with SMTP id
 5614622812f47-563ef9afc49mr5908539b6e.19.1793565212774; Sun, 01 Nov 2026
 12:33:32 -0800 (PST)
Date: Sun, 01 Nov 2026 12:33:32 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae7a21c.7fe51036.1ecf7.002c.GAE@google.com>
Subject: [syzbot] Monthly virt report (Nov 2026)
From: syzbot <syzbot+list1866aebaf3e7c04f9ac3@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	virtualization@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello virt maintainers/developers,

This is a 31-day syzbot report for the virt subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/virt

During the period, 0 new issues were detected and 0 were fixed.
In total, 6 issues are still open and 66 have already been fixed.
There are also 3 low-priority issues.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 332     Yes   WARNING in virtio_gpu_alloc_vbufs
                  https://syzkaller.appspot.com/bug?extid=1b129b44597a126d2d79
<2> 109     Yes   WARNING in virtio_gpu_free_object
                  https://syzkaller.appspot.com/bug?extid=3590d97d8a586fa955c2
<3> 4092    Yes   INFO: rcu detected stall in do_idle
                  https://syzkaller.appspot.com/bug?extid=385468161961cee80c31
<4> 5       No    BUG: soft lockup in mac80211_hwsim_beacon (3)
                  https://syzkaller.appspot.com/bug?extid=a009aa73657fb9a84de5

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
