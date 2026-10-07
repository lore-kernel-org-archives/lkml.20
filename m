Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549E5414A3E
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 08:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791360404; cv=none; b=BCC4j/Bv0V4QYDXYlxoVVFyrBQzl03n1h6Mkl5Tqx3NB+2f3d77rVzjzgbCrexf36IcOE3ACoOq0UufJpfaZ6KOC7eW9t7T8VZajLueI46voutT4A/dFSEo9bBJK1fXN0NzxfSCT5YepLSigbDcYd36gUPAQgy27JOxvphcWgfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791360404; c=relaxed/simple;
	bh=8fyzQ4mpLBIKsz+JaS832RNMyWZpZbjegyCYObgauMc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=h8Y7eZSkoPZJ5SabShmLafcY4WW31nG7lkeCPMz7g8Uil4O4SGlOYzuXgh33CPWKW1RSxaLN+vHePr16JQQvMLBYo7vOl/bSL0h+pewkWx2SkrVORoH9PRyP1lESwPO/LCP53nhQnoeJcPomK0FVnDpLxcD2/R9utMrOakcVH+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4eb0b989f0eso2790456b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 01:06:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791360401; x=1791965201;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RHmnpq+vWrRC0bgF4lxgVEQsFZIjFzLZS3SzLyOrux0=;
        b=aWgmS5lhY3UBuyzMbKxr24Wy5aNeO6bRAN0S2wz+18eCw+PtT/epxj1skbmYPwsaHJ
         BH4yTLKc/SFkjJL91DTmLuIIApyVa55pYRDEt9rtr6NtjVus7ED6Q2jvYJB1pATIOG+u
         tEoKxEmDmvrJMo5FACGIEOKRCeGBTmluP4/LtVXstxHTBtixW13UGIsGCYxLhfhO+4eS
         Cwwm+4R7+53mRLwnJZsWWdsc2SsIS82daqwipFl1Sg8nhmz7UeL9tcO+ZQgObm7XrJHM
         vhQSWp712W+dzFjj0OsOsXYoUtonnAbinIeOfwCJXCi84UrbDe8UNnfcVWPvI5PAf+9e
         bOPQ==
X-Gm-Message-State: AFuF++nXUh/JGabJbgvURLEGz2h88AgwW2kkyJ20qsk7tSJIUZsePIhR
	Smm4cPRzpdB5XbduwG9yVOop0dCA30uYLI9R9nfQqgdPKxUY83meVFd6yp92IORFROzLHJfZq4w
	Ee+ECFqgSwi9PgFtX+aSl6K2qU6cXMl/VD9p+MKXQTpZ7eNxr2gFfZTOppqc=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1311:b0:4b8:4703:db97 with SMTP id
 5614622812f47-4faae80f6b4mr4486943b6e.32.1791360401209; Wed, 07 Oct 2026
 01:06:41 -0700 (PDT)
Date: Wed, 07 Oct 2026 01:06:41 -0700
In-Reply-To: <6987d9a1.a00a0220.34fa92.0039.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac5fd91.34119e79.8a1d6.0000.GAE@google.com>
Subject: Re: [syzbot] [mm?] BUG: Bad rss-counter state (6)
From: syzbot <syzbot+5981772e2b70777a3b01@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    71c3e5409eef Merge remote-tracking branch 'will/for-next/p..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=137d5f25580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c7205f05c11fb4dd
dashboard link: https://syzkaller.appspot.com/bug?extid=5981772e2b70777a3b01
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=177d5f25580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/20ff6159ce99/disk-71c3e540.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/1d6172672705/vmlinux-71c3e540.xz
kernel image: https://storage.googleapis.com/syzbot-assets/923d5e083e1b/Image-71c3e540.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+5981772e2b70777a3b01@syzkaller.appspotmail.com

BUG: Bad rss-counter state mm:00000000950a6f7b type:MM_ANONPAGES val:2 Comm:syz-executor Pid:4828
BUG: non-zero pgtables_bytes on freeing mm: 4096


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
