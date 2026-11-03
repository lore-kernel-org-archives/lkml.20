Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793680440;
	b=18lMeNlHfVgWYRWod6btDyYiUksZ4vhoMMRfIRx8ebo7iqaAgNVoLa27H/fCY6PxsNaq
	 TnSGTsxsqcPRdRtJKRLW7v6LgvioUNuSmISG18E+PiO++wybhu+JkqeaifRpH7i++wpS9
	 QqKB7y5kgYHCBStBT5KBk3D1W+mgxgkMKT5RlXuopFBHbo43ttVMBSOVdsuZEMO4gJRUl
	 EBDtSD6JFWzQc3Th+U5NEyeVGptsuT9SJ3Y9QmW1MABOtzU/IiApiwDtKb7a83vQFBxBc
	 +RmibM3DbJjkFaYK8T5i1Tv40YIfTLEZf12VF4pRVoz3wmUZ9pZ8LYcZQ9E5RCtN87Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793680440;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=QJLlgJibOZQAdPrh0+nB+7dj+jYgjo70c2i017bH7Rw=;
	b=JgNdBxcV07TzI2jId323r5KnghPWM1ve++cb71Kh+lC/EY0Pqr/LkAlxWo7QFqd5egLs
	 dmgPKMUCLNtqMPdlgxogLF+5bVJRw/1hAkDlb9HfCv09iFCZcRvFkTcYkBIJGIcg9PAha
	 LoINiMaDmG0WoMX/QRHUizyUOSgX3R3n0HzUBaNXbAwII19Gs5Eu+LJkZVFpi6bfkyLFb
	 zP0jQxGOsR0Dyo+bGKFggk/un+AKn5oOBk4n3t4B2jaYtDkZd7J0GTBhSlJQlVYKHRVA5
	 gG2nznVbTtSLQ0SMxjaQFgJNPRWurF3QOiHRIyCf4LuPyZgaLw3bRwuKIS10QODq0fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E17606A327
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 04:33:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93E17606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4c467e19391so5793373b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 20:33:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793680438; x=1794285238;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QJLlgJibOZQAdPrh0+nB+7dj+jYgjo70c2i017bH7Rw=;
        b=Fl4DKFp7QxC7/HDTfwxFpqHJehldLekulJTLE6mG+Ww84djT/gU7yPCJIHropqW28l
         4zaMyqIupFXmS10f4AZynPQA+DTl7ErTj9Vbbg0GR3pHQcSdmxMSNt54i/5XnZul4BFr
         bfn++QD5JX0ow7HbTP1mSPQ3gt6ThSfIQgYxmVXBH7QG0PQhz/00Umh9BTUps6HoUc+t
         VcGmtw2wgP6u5uN99BBQ9bm7Lve+WFIn6onKWR5mi1LSffgWrun9DwxAf1jiAwsXvyxP
         WjTzHghA9ZHNOkVqhFR4whxYZTdcqd8We5MkBu8/xYQsFVSGPa2bnNQ2AQRR9VZ/2wS1
         HKfg==
X-Forwarded-Encrypted: i=1; AKwUvBxRb3qjGBfk4HETRquJFNdc1fd745n0w62Ongtf4uKlcyRdzdH5NQ2vFSiRgwGv0hKW6j8w7mjmXNwTJmI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJyGqntlUMOvauRbth5WJHpdafoqAeyVzxvjrt1sjLhviYiNycT
	wrLoZY/8d/sg5dotpL2L4BiER98V2rH1NnhmKxnlxiX9HBbWoe5Onllxyx2kP0ZgZQdpvDfe/E3
	8hM+MhIC8u7Pr7B2lZLU26SZ1fIH2birdqk1g0sB0jxc8GYd6C2+O714nXyQ=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:30a1:b0:55c:844:98ff with SMTP id
 5614622812f47-5640dccb4b3mr9126269b6e.34.1793680438636; Mon, 02 Nov 2026
 20:33:58 -0800 (PST)
Date: Mon, 02 Nov 2026 20:33:58 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae96436.abb90550.19e2c9.0001.GAE@google.com>
Subject: [syzbot] Monthly kernfs report (Nov 2026)
From: syzbot <syzbot+list19f90e5105228a5cb2f0@syzkaller.appspotmail.com>
To: driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, tj@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello kernfs maintainers/developers,

This is a 31-day syzbot report for the kernfs subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/kernfs

During the period, 1 new issues were detected and 0 were fixed.
In total, 23 issues are still open and 31 have already been fixed.
There are also 9 low-priority issues.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 4626    No    possible deadlock in kernfs_remove_by_name_ns (2)
                  https://syzkaller.appspot.com/bug?extid=b50eba6bf6cd3f8ba7d0
<2> 2249    Yes   possible deadlock in kernfs_remove
                  https://syzkaller.appspot.com/bug?extid=2d7d0fbb5fb979113ff3
<3> 732     Yes   WARNING in kernfs_remove_by_name_ns (3)
                  https://syzkaller.appspot.com/bug?extid=93cbdd0ab421adc5275d
<4> 193     Yes   INFO: task hung in fdget_pos
                  https://syzkaller.appspot.com/bug?extid=0ee1ef35cf7e70ce55d7
<5> 105     Yes   INFO: task hung in kernfs_add_one
                  https://syzkaller.appspot.com/bug?extid=e4804edf2708e8b7d2a5
<6> 8       No    possible deadlock in array_state_store
                  https://syzkaller.appspot.com/bug?extid=7657131267c5111921e2
<7> 2       Yes   INFO: rcu detected stall in kernfs_fop_release (3)
                  https://syzkaller.appspot.com/bug?extid=087d9dac1f398074ca9f

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
