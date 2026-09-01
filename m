Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBFF2F3C18
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 12:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788266015; cv=none; b=d8qO/jwf2YbmtcxXBxvbYhPs3J831j7J3AJHFTd+TyzBpsjFsyzx0QZK8NqYofT5qCcZQExCfpIsx/STyS23BWMslD0wL1DIb+pRnGfP6SvfdP57ninoCk8CoFD3nK9bYWVWw0xe4GyX/YunD1V3baSkbM9t1s76+3Y6VpJocAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788266015; c=relaxed/simple;
	bh=OR/+6+mxgLMiTnv/t3JzJQRK+sE11J2XzfsLt5mkz54=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=cnNSlYDs1b079y4EuIAoQgfIxPfCFsBzDPmyQ6rmsvIIrHRg3pPzTpOvEdnYnIYOCMm9jiX3QwL79oNI8/d9TMElUPs0mLuEvmbQa3+8TWjIF8uyJquT5JH7KKpHMJpK8J63gawUKBm81coZuyGT9FCfa02pEvcsxoEIn/aAB24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b1bc2e44e0so7358912b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 05:33:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788266012; x=1788870812;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O31KF1bx9pdjUZkEEGUWR4q75msQ5Y234D7nSHmhi/0=;
        b=hQfrVpFewhSV4Rpo7E1YsFYr6ZejihKnVgwriLLd+gAttGejNKVobSoVjp8dvaJagz
         3uzUE17MrLZdcJQEAXts9N3NzUpE3ZLKGaBBkh9iBahHd2R5XKkqpA6dPTxB003GBf//
         ZfzrIGJZnsBuqxCNTi5uymbexIlFwz0cbKGgyjjNjkSLDct82v88UKLWstc+KTS+p4tG
         7O5m6B0A97oZkVwi8+FmTIaH9FB3c1GXeHMn4WCdYNZve67ZkRqUml+eYPSJNl2kWPIu
         vphHTRCXmDfHYGehOM0/iWeKW6NTkZ7EbFpwVoB1TJkXapSBbR9+D0BbESbhYfi5wbe5
         kBbA==
X-Forwarded-Encrypted: i=1; AHgh+RoFleTHPMvpUDa/22YWidlVQAPrBoAYcBZoy90WuYMKn+52uTtY8Zt6aJa0WlQmyC1G2PVKAl7iirpLgkI=@vger.kernel.org
X-Gm-Message-State: AFuF++lvjHLDZNKetmItk/Etbkhr7RyLJrAiDLblNpoVo9EPsAYL5wRT
	3+4NLGjfG5vg+PrXlnd38c5wRjG95kI4FSoisxfR7Bq7vJ3iBzN56+MUUstIA+ub9pR/NP/7rrV
	K2eLZLGj7bz6k5zdP/vbptlzuMFYZEoo2d052KI8bb6P+wkTwxinBa1EllwU=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4fe9:b0:4b3:8ae8:7a47 with SMTP id
 5614622812f47-4b5b82d6323mr8554597b6e.16.1788266012510; Tue, 01 Sep 2026
 05:33:32 -0700 (PDT)
Date: Tue, 01 Sep 2026 05:33:32 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a96c61c.04428c52.29b18.0004.GAE@google.com>
Subject: [syzbot] Monthly dri report (Sep 2026)
From: syzbot <syzbot+listd3be96098b5843b34a80@syzkaller.appspotmail.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello dri maintainers/developers,

This is a 31-day syzbot report for the dri subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/dri

During the period, 3 new issues were detected and 0 were fixed.
In total, 11 issues are still open and 38 have already been fixed.
There are also 9 low-priority issues.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 2279    Yes   WARNING in drm_mm_takedown
                  https://syzkaller.appspot.com/bug?extid=d93b9064fe5f74af3aa3
<2> 167     Yes   WARNING in virtio_gpu_alloc_vbufs
                  https://syzkaller.appspot.com/bug?extid=1b129b44597a126d2d79
<3> 65      Yes   KASAN: slab-use-after-free Read in drm_atomic_helper_wait_for_vblanks (2)
                  https://syzkaller.appspot.com/bug?extid=0f999d26a4fd79c3a23b
<4> 60      No    upstream test error: WARNING in drm_mode_config_validate
                  https://syzkaller.appspot.com/bug?extid=5caf8faef4fa32603577
<5> 3       Yes   memory leak in drm_mode_atomic_ioctl
                  https://syzkaller.appspot.com/bug?extid=3fc9eecaf97147282c87
<6> 29      Yes   general protection fault in drm_object_attach_property
                  https://syzkaller.appspot.com/bug?extid=1944765c3659f63d3777
<7> 7       Yes   WARNING in __drm_atomic_helper_set_config
                  https://syzkaller.appspot.com/bug?extid=ca23c8570669ead78867

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
