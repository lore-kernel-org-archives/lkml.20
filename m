Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6D4395AE9
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 20:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791232421; cv=none; b=oVR+O7NdcEYQEB1CTb8N5z0Zw9mY29TxooGdQ1WEtmDosK6A917NUNQ3Dc2KtffH1G6mBNIhS1a9WKCDotxoM4dN29tDPxeNHLoMm7miUzM7jfkVQi06tkfUrzss61X1h/wNV7m4a68esIhaBEjmA7Q3SfiJwEKNDZGwl5dEVKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791232421; c=relaxed/simple;
	bh=Wn+dezwOG1k7TtTfi67rlSmNqRy3ScRlO1oloc7xTiM=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=s2czQKAsA+oyamo+HOFZV+mnt+tX+IqxVJ5t0RVkHJZd28jIgT7RUIkPyp40vYJyuQGFSZDYZ5xi7kcIFO5RcbLj0rs0xFrcxm8I2ssf9yjr+ZfqmSL2K8gZHSE0HQW0iMy2XEaaj/SIbEowPFtSfTM4o+BrTVTnqHfup9tJ4X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b2d1eb484aso3334389b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 13:33:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791232417; x=1791837217;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NtIEXTPSdkYP5S5A4G+u9IsP3J/p10TykbRmGowqaqw=;
        b=OFKutAubilBcpKhmq2T1Px5HfN/0EBjQR7+Po9X0q3QY60MnsjgYn7AGoL4WZgbCtC
         ao9NkqK0hNK5+/mnLLeOv1YC2Vac5K0TwgBs2igx2ZCbGE3ml5S4sUKA4Pf+axCiH7Xz
         f0IIStQCZ8sEitGiCSBSvxaktSC5b7aO16SKUjFh81210EITxwPBdg5opmbpjOxzmFJD
         kH2/lprhDmShLLEjTTsymv4wZnRd+vz8Q94vuthq6oKMaAoBUdRfoowocUltkI8a8ErW
         x7RYhFHXFtcHOFzFBqsGXtBDTT+LQEPBQvyDKp4QVGZiW9yTNaUhyqUY7jTPk/V3fbFt
         uLsw==
X-Forwarded-Encrypted: i=1; AKwUvBz66y1xFqZacgvRsdjfLWV7m5l/PZTf+9NBjFVrzukrSipREjYZd6ZdziVf08KjTJ7EgEjsPNnQax7GvBQ=@vger.kernel.org
X-Gm-Message-State: AFuF++n6/b+YuEGx61sVEmDbIbj25dOwyXdD6wdGUn01zjwGb6GQh9MZ
	Q2BpPeTq83zLWFSHqv6Qb3N0bXJM7bpwTp+J+T64Se6Ij8AMX1XeJxEQgRResRj98Y+cHs82d6O
	KhV1eJaOYOhDhmLERR/E/4s0rldlKR3vWmrvxXRA/MOYchOfYkDnyRJORx38=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:221c:b0:4d6:92f4:d684 with SMTP id
 5614622812f47-4f67b96ee05mr9364527b6e.63.1791232417116; Mon, 05 Oct 2026
 13:33:37 -0700 (PDT)
Date: Mon, 05 Oct 2026 13:33:37 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac409a1.ae2c267a.265a6c.0006.GAE@google.com>
Subject: [syzbot] Monthly ntfs3 report (Oct 2026)
From: syzbot <syzbot+list5c1b0e54ec58a24b17ce@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello ntfs3 maintainers/developers,

This is a 31-day syzbot report for the ntfs3 subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/ntfs3

During the period, 1 new issues were detected and 0 were fixed.
In total, 13 issues are still open and 94 have already been fixed.
There are also 2 low-priority issues.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 2417    Yes   general protection fault in al_destroy
                  https://syzkaller.appspot.com/bug?extid=04cf7b83f6dd2c3a54c8
<2> 666     Yes   possible deadlock in mi_read (2)
                  https://syzkaller.appspot.com/bug?extid=17f812893d5906837f33
<3> 530     Yes   possible deadlock in ntfs_fallocate
                  https://syzkaller.appspot.com/bug?extid=adacb2b0c896bc427962
<4> 104     Yes   possible deadlock in ntfs_readdir
                  https://syzkaller.appspot.com/bug?extid=cfc6e8106bec1c524f7d
<5> 68      Yes   WARNING in errseq_set (2)
                  https://syzkaller.appspot.com/bug?extid=57f9327d593d301ce2a2
<6> 21      Yes   WARNING in wnd_add_free_ext (4)
                  https://syzkaller.appspot.com/bug?extid=323f07d372f692a127b3
<7> 14      Yes   WARNING in attr_data_get_block_locked (2)
                  https://syzkaller.appspot.com/bug?extid=7be6ad5cb228286af3e3

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
