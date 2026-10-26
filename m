Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793018007;
	b=E659Q+pbIAOm3Dz185PtecSR9rnzW96GS8lMvmyFazKkhG0XxTrzSsmmouTEtLTAo80V
	 gspEDz4WEb38ncjsPFONOgmZenbDMze7eD5Vf5Vx0vv0jHblyUDNA6spAnjqItg0sLdEQ
	 lE9RYuXso9G9+Xv9uOH8z/Z2VbBgj08n7E1Iv7LNldDrqiJQs/w8NrGwbe74trsVxZjnF
	 gw3OlYO7Lq+OqKxYp0ClnUuR1yONBBuWf61Ty+ISxQUoK7/DnFCa8D4rAjPzLUcRkHR+W
	 3GVMz5xwAhD6IUvL3ZEdFHI9x6Jak6TVP2P5AGWxMtfxvEtV+CKGtxC1B0ccycvnasQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793018007;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=u8+pcVYUXZ59pd4XuBmGqxA5UKZbGLrNgoafEzcb9iQ=;
	b=NXln4TFpBkzSgZHd0QuH+2RwwGbAWqjceKYrTeS0pTeeozoh+jqfNa4h5v9IDY3HmHQH
	 Q+euw5uoRiDDGfCTVOwiFw88ofhrfA11I1MH9gnHxuNFEx8+lQnwNGGRaQvrl4ylsQWBg
	 mO3ks0xZb+MzofZdYnibQCQfvjIZmHPFvSMPO9rUaFRQSpKXsaHek/vS8svkeCKHOh95l
	 O5unMasPzkOW5Rm58SFxvyPstJ0kt1VvCpXMfJ7y0cSlFLRugY1n59SOsTFnCkew9InQv
	 DkvH2bYcKOdM1zs+1bhiV7FE7vuwNYeujP0DJ0dYxkdY4LFdR0AkA4hbisHouxDfUIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843FE606A321
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:33:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 843FE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4a45b3f0bdfso4502380b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:33:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793018006; x=1793622806;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u8+pcVYUXZ59pd4XuBmGqxA5UKZbGLrNgoafEzcb9iQ=;
        b=nEKRqAPtAMWmUwFVBaV/sdlYXMJn0MPhDcQacioXB8vuwXMWr6OcFR1sFDcXgyqW5B
         w+avubtYd8sGaJUnIlA7TcmhxQBLUfDwPo16jTZKHWlDhXniG0zGrfTvsDAW0VGJIYyS
         mIGFZhcbosXW29W5Tu2j1egBkgcLNlNN44kkwTvugHo0Q4IZqibVA8ck4qFZYmQASJww
         HwpXzeLtMkiMHVhkpjKjVW2R4i0XV31b6Xfo4N+cPr3NSq/P8I29HLpCLkHuyWIeAt/N
         G+IJ2YU/V+OLbrkgnhHbaq16s4f+x2ogHcjKFysAoMLdN8Doug5UECFnjNiHj9FJSg2c
         0wAA==
X-Forwarded-Encrypted: i=1; AKwUvBzLtBp/wpbbueStBDpmNINSVOXWZ++auJQTn9Idc+ILa+f1Ht8nSdwmHcqdIPoJ4+7KJxU6NdCbkeHcdI0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLxu47Bs3vCoeF+fffrXvO9h6T0V+vU/attGqikLd4xJbXeKjj
	q4MH8drcI1/1rRhScjQ779HFQYsZ4E6tv5NzHmhTpIhSkdQZa6J6rAuEpaBUHGCWBTHROOIUJ81
	kN9H5aaspqXXTSEkl+2TnU4rou1ykGIAw28IxYwXWkgCNSI5YmxJV64wGrpE=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:50a1:b0:54f:c850:fa53 with SMTP id
 5614622812f47-55c002622cdmr4280399b6e.17.1793018006476; Mon, 26 Oct 2026
 05:33:26 -0700 (PDT)
Date: Mon, 26 Oct 2026 05:33:26 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6adf4896.67317f00.38c4bc.00b4.GAE@google.com>
Subject: [syzbot] Monthly kvm report (Oct 2026)
From: syzbot <syzbot+list297a1f23e39576d8b4b8@syzkaller.appspotmail.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello kvm maintainers/developers,

This is a 31-day syzbot report for the kvm subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/kvm

During the period, 1 new issues were detected and 0 were fixed.
In total, 7 issues are still open and 72 have already been fixed.
There are also 2 low-priority issues.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 2256    Yes   WARNING in __kvm_gpc_refresh (3)
                  https://syzkaller.appspot.com/bug?extid=cde12433b6c56f55d9ed
<2> 44      Yes   BUG: sleeping function called from invalid context in kvm_mmu_notifier_invalidate_range_start
                  https://syzkaller.appspot.com/bug?extid=c3178b6b512446632bac
<3> 2       Yes   WARNING: locking bug in __refill_objects_node
                  https://syzkaller.appspot.com/bug?extid=f11512d1e5878ba5e60e

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
