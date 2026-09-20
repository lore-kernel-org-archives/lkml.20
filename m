Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6658E3A9013
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 16:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789921566; cv=none; b=gUQHiGEBKkbrP3W7rII6sQtBlXFZwcdxRDSCwEWvlcgoZUReA8NNxxohqTOaa4T5Ul9Uvh0GHF4trkzoVYyHA2VKq9JSbRPmHsEPQm0vX3bvgBTH71GW9ASUCU5HvwG1iwgzGgdgN1rMKx29SVq5jYLK8In7hRnXAA8E4Luy6TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789921566; c=relaxed/simple;
	bh=Fjjho6VJw91VrAcRXjopNv8ysWLIDFycL7IuPex8zgg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=VbQ8JdPiH7duLl0OfoL89ZIwXDqHJmtEgH2XaSepj8WX4wCbEB2Xi2PDXvDnpdGuAorbiLPn/WzFyNdVQwywTmkET6Mr5GX1Hg6fybd3g0ctnZP7zCe6GtFnLzTdmCd8IpS1a0Z+tfZf3AkL0B9/fjqb76c67Vh+D8RYaEhcpxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6b1ac969b92so2778708eaf.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 09:26:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789921564; x=1790526364;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Y09R4TyzDXz+1BvIReR3qakaXcoJY6bs098u2lGzhBk=;
        b=hSvAgOuwkARUhZvUuGrbsx8znPubqM/BH5Yc/hSns3fMXtE5KDbZnLugIweYqc5XFk
         uSQW2M7w0mzGvKj6FX+HAMbbipWc2ehLR3P33omwutjqGyrrhR3I3VMS6SsX8KUNJK9k
         9iquQndgprBiAdFiRNMiHNAZKY63av90bUSqKDY52RmIs+hi1LClByLcrQjG4yRxHMdJ
         xOXMvMSunbR3WohNKk99b14WnExget8awQTJ594F7x03m3aEH7Uixbj3HU5LkxIlVlmB
         wX/bRuecyHm6MsRT02P1r2v0GhRqA7e0RhoUJLeOVcB19jkrvK3NHEOwmF6tJKlsXJJX
         oEIg==
X-Forwarded-Encrypted: i=1; AKwUvByWyYr1luOc/+dk49A72ff7vSLBtSRnI49eesg+C/j8750XycSmHuV8A7e1xs+XtCn/n0A7f//SYg7xD2A=@vger.kernel.org
X-Gm-Message-State: AFuF++mRdpQPnY/YphFrRnYIMDHCqS7s0riAQRBs7zuUqYePpwSNV50l
	SpFXYNDiAUxRy6m4kVOsDieB1gev3u/Vk1nTZ4pIQK/m5cGgpGOTXXR9nqgGvBXyLYjpGnbh4q/
	QTcqUL7epVVUye3OMh0+EiH2Bk2SNmiJ9dO+LfgUjb3X3nD/DBsiBSBxTYLk=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:c0c5:10b0:6cd:3fec:de7e with SMTP id
 006d021491bc7-6cd3fecf3dcmr3186064eaf.84.1789921564416; Sun, 20 Sep 2026
 09:26:04 -0700 (PDT)
Date: Sun, 20 Sep 2026 09:26:04 -0700
In-Reply-To: <6aa3307a.6e6c5f9e.28f11f.003a.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab0091c.3179f8cd.1e36b2.0016.GAE@google.com>
Subject: Re: [syzbot] [net?] WARNING: locking bug in finish_task_switch (3)
From: syzbot <syzbot+b5ddc2aecb8d1b29c871@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, hdanton@sina.com, 
	horms@kernel.org, kuba@kernel.org, kuniyu@google.com, leitao@debian.org, 
	linux-kernel@vger.kernel.org, luto@kernel.org, mikhail.v.gavrilov@gmail.com, 
	ncardwell@google.com, netdev@vger.kernel.org, pabeni@redhat.com, 
	peterz@infradead.org, syzkaller-bugs@googlegroups.com, tglx@kernel.org
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 8fa30821180a9a19e78e9f4df1c0ba710252801e
Author: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date:   Tue Jun 16 07:09:14 2026 +0000

    timekeeping: Register default clocksource before taking tk_core.lock

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=10d09525580000
start commit:   50d05c7c76c9 Merge tag 'landlock-7.3-rc3' of git://git.ker..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=12d09525580000
console output: https://syzkaller.appspot.com/x/log.txt?x=14d09525580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5e4e3a0e188a497e
dashboard link: https://syzkaller.appspot.com/bug?extid=b5ddc2aecb8d1b29c871
userspace arch: i386
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12ab4525580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14d4e915580000

Reported-by: syzbot+b5ddc2aecb8d1b29c871@syzkaller.appspotmail.com
Fixes: 8fa30821180a ("timekeeping: Register default clocksource before taking tk_core.lock")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
