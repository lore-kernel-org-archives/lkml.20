Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADEF4570D0
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 20:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788294823; cv=none; b=RReUoTvvRpErSc7dFWNK5LKDsDnODHke72voNAmOz9PCBYsiyfHYZxgaAEOYfJMa1w/f2dBsKs5zVIdTQnJfgmsqy5XJ6yG7szHenYbZ+7OM6pBsror84TauzK5B/m7diTrKXXBUWrNj5TuVISFXquLIalbXXIkJXzBf2J7smIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788294823; c=relaxed/simple;
	bh=3oCjMOugf9n8id5FEBviXkGIxKiYZEhQY9Uckiz961w=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=qOYrtBC3b1G7v7AS1jKnjBkcgZo/tFjdptOYtbSmQmnIxo0cf0dMZmedjWBUgj+NDQZV07y6OU+gJNNR7WIRmnmnf19Z1ne79USDV0/YHUQXITv7lsNqYZV9nEdOaDTRKaYoKlZdgp014JnJUq9CYbmoxO+leKHOEubLqG00xf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7f4fa572ba2so114863a34.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 13:33:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788294821; x=1788899621;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6lraIklJ7nBnQfTqg41noi1MbpCSYxFOZk+mm8HnxDE=;
        b=lAr16mXKRm/OTaS5WDFjX71Wv92wVUiNupqDutYRg0MPPsuiDfxnpd1bqsvb0NvBYY
         UMr/tHODUykwLHoiX4C2gukBpz6ILGovBtvE9thr6EiSRaQyRBSxVH9iM+D4lh0+oyK+
         PsMXSawh/8DLyfr/VjKPEfgBf4jWlHkM1jsUNq0sVIKI3bIF6XHCvxQF35P8+o9D572Z
         sSDb4jd5eKh2Xjywq3u6SqDC/dqLYVca5yrNHdEt8ZVAORfG6eCRGGeVnaQTj10YfydH
         zHXfbl2+Bno/MUAAKqxOILEjSqvfjZUG3CyFJX+OLqZcvKDr4t5Lsz79JHpeGHmG4988
         +obQ==
X-Forwarded-Encrypted: i=1; AHgh+RpFL7C3jb7nZrnHTXf0tNax02O2WICCqugXyen5aSGwBiu3ksfuKJepgRKKS2NFRaD59dJ+QFrx9Nw6stc=@vger.kernel.org
X-Gm-Message-State: AFuF++nUByI7ANYEyyf9PQRKQnpuTL7EJVSUTHZ4SdniN66LYbFq/NbU
	33laDCQt5AZA3VKPxNfAptS1/2zBjuwWzYiLXIS4BLi2Tb3LMw5WWaKNhRpNa8+E5KOxAFbGRGt
	QE/yamfr7jFRW3hfHkMqqsDl+COc8uGhQtDwDhF6AMEijxQYGu6clOGVRK6E=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:60b:b0:6b3:bb82:2736 with SMTP id
 006d021491bc7-6b437eeffd9mr968949eaf.17.1788294821114; Tue, 01 Sep 2026
 13:33:41 -0700 (PDT)
Date: Tue, 01 Sep 2026 13:33:41 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9736a5.e163c37b.143a1.0000.GAE@google.com>
Subject: [syzbot] Monthly jfs report (Sep 2026)
From: syzbot <syzbot+list5549dac3e08ada7025c9@syzkaller.appspotmail.com>
To: jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	shaggy@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello jfs maintainers/developers,

This is a 31-day syzbot report for the jfs subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/jfs

During the period, 0 new issues were detected and 0 were fixed.
In total, 67 issues are still open and 73 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  107949  Yes   kernel BUG in jfs_evict_inode
                   https://syzkaller.appspot.com/bug?extid=9c0c58ea2e4887ab502e
<2>  73273   Yes   KASAN: slab-use-after-free Read in lbmIODone
                   https://syzkaller.appspot.com/bug?extid=ecf51a7ccb6b1394e90c
<3>  55195   Yes   WARNING in dbAdjTree
                   https://syzkaller.appspot.com/bug?extid=ab18fa9c959320611727
<4>  48955   Yes   kernel BUG in txUnlock
                   https://syzkaller.appspot.com/bug?extid=a63afa301d1258d09267
<5>  8378    Yes   general protection fault in txEnd
                   https://syzkaller.appspot.com/bug?extid=1d096d31de6a0491b55e
<6>  8054    Yes   KASAN: slab-use-after-free Write in dtSplitPage
                   https://syzkaller.appspot.com/bug?extid=a939a1121380d3212940
<7>  7863    Yes   kernel BUG in dbFindLeaf
                   https://syzkaller.appspot.com/bug?extid=dcea2548c903300a400e
<8>  5317    Yes   INFO: task hung in lock_metapage
                   https://syzkaller.appspot.com/bug?extid=1d84a1682e4673d5c4fb
<9>  3290    Yes   UBSAN: array-index-out-of-bounds in dtInsertEntry
                   https://syzkaller.appspot.com/bug?extid=5f7f0caf9979e9d09ff8
<10> 1915    Yes   WARNING in dbJoin
                   https://syzkaller.appspot.com/bug?extid=a67911c5a11315aa55a8

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
