Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6774D4D794C
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 21:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790370245; cv=none; b=WyMq9OLMXEYiptVg2MrOUma6QBBswvRoTHKXdy7IHo85KUwX6vG1LiFyvSZgk7J/JnSGodZIbzRtbUJIZe6A99VAFSsES3Vxn05K2/3mHSqc5R6LWsDETQnn1pTnqetcPX0Hj5RWoWRR6ZsS125Pr7JLqHzSH7gt1TpgoR2vc0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790370245; c=relaxed/simple;
	bh=BE21cmSFfuAQ83Rs9m2L3At3+YqRFs1oevcw/2tS8mk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=kIy7xM56+vfKbQbRciuewvhSkXaQ1yooMDI/46ABid5PkX6rRnmr9EL4IgUB3K330291zGsYEriqoD0RDlLpQVFd4N/W1uYA+hVuumCjAmJ1kcM77nepWK0w59CTX1yaOb70FcGZ1IHDmRFaGZU1MnqcY6Cx6Jjeb1l/IURTv9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4dab94dc3e7so2206030b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 14:04:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790370243; x=1790975043;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QMv4zUnWDsMBQN3OtbAXR4nIKmgx+GY56qtAo6bYdh8=;
        b=YJZindGMXAX4S+EM4Siw/XW9IPFZCWCxvVD75uuv2YYaYlRz2VYamDmmKcnC+X1RT6
         3Rkx/kXKQ+TOiawJU28jb+9zoRm6gkoj2wxwZVo9m38bqxhDJXXMI/46jCh5vx0CSj5q
         eIgSd88AsMvJi3Hvz1kMHxsXUJUpoBKxj5Axn/xjqRWVrCj4L5FK3sAxCvLxaKr8Q+5o
         qd4ZxUKY4jjk3tyRM8ncLj2KqacOEWZdah6N++QTClIMijvnuLhRVaT6HFyAhi4YRbNP
         9IWBMJvbotO47cc3tTJfqh5WguXyYBGRfeseS1xpmPQdBYW8ko7MagssUYdZT+uy5yyF
         3k6g==
X-Forwarded-Encrypted: i=1; AKwUvBxJb9C21Sj0wvOKQbKFvjOxyHnlibSumPVFbpskvYRkOoIG/ZHvQiSs3tASgS243nAOyeaqZzqZnmOTp7I=@vger.kernel.org
X-Gm-Message-State: AFuF++lyVIPEgk2a1mTH8aYt03hIbRVjmh2nticimQF0UHVuAUU9YVax
	G1Gmpp2DN/bV+zHxGUm20jhdTWiIiIOa+98m6e8HUrDvEEC07vfRt/rbSeI7y/5adf+qOPXR3Lz
	6UQoV7G9VsWGS6pVJbsJjnKq4QPuwQfuHoZzm3n3WnXRrbkl+h7UCWklirWI=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:50a3:b0:4c5:cd9d:c6de with SMTP id
 5614622812f47-4d72c635ff8mr7595835b6e.7.1790370243336; Fri, 25 Sep 2026
 14:04:03 -0700 (PDT)
Date: Fri, 25 Sep 2026 14:04:03 -0700
In-Reply-To: <20260926.053927.1813206630085668690.konishi.ryusuke@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab6e1c3.7eec07f4.c25c.0007.GAE@google.com>
Subject: Re: [syzbot] [nilfs?] WARNING in nilfs_rename (2)
From: syzbot <syzbot+f6c7e1f1809f235eeb90@syzkaller.appspotmail.com>
To: konishi.ryusuke@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+f6c7e1f1809f235eeb90@syzkaller.appspotmail.com
Tested-by: syzbot+f6c7e1f1809f235eeb90@syzkaller.appspotmail.com

Tested on:

commit:         89a31299 Merge tag 'cifs-fixes-7.3-rc2' of https://git..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=1725fc5e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=db6ce8c8614a5a8f
dashboard link: https://syzkaller.appspot.com/bug?extid=f6c7e1f1809f235eeb90
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1021e2c9580000

Note: testing is done by a robot and is best-effort only.
