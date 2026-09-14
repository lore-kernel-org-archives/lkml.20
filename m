Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C77F35DA64
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 04:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789360386; cv=none; b=nWWqEYJHkSQxAfcnoXNEHklniXjIE2fSiEQMFMYrZtr+m0Wu+DkyG8xY4erwcPbWFQCbVvDAp05egolnNaolzQ8Bzqa8+YMUZA/wQW48A/Ec6+B87yt/0XF18HNNSw4K0TWOmKZDz7CjIr6VW/3wmhapOPpMWa/tYRetuj976Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789360386; c=relaxed/simple;
	bh=2M/3GCkX91N+ScnuhIq6B/hBjxb9H5P3POPSvc5adqw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=DE5MU+neOALoqm+5bFH53k7S3P4BKlGT/q+5dC06P13FK9NOpWb2c1r7F4/wNQKtX37DwAivjHHNVZILdZpAACsrhD00fotcDTdqjS64hy8OWeOu84hHgPuLaQooM0m31QXNrjXLqVnO9LRhtxVP0ohzhoi6ABcaBxzf93doguM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7f8931a803cso2428954a34.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 21:33:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789360383; x=1789965183;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SFJZ0yj59lnVZu5t2HLQNsKQ2pkaGc6TBnSwU16hD0I=;
        b=NGWnhM8qyphIPYt0WiRjN23Yz11XS+jA8J3vuwesGhFrRCuPWvaOPaEoTdnR7MZ0w4
         B8PHPqGUB+yIMqhDb406Wo7sE9qT7GNb1PTBqF7g++ZuhUFtnMJHI0T/in+br1XMRqZh
         lJkvveQbXUsNkPK6KgZ4UH/NdVBFDD6XsgrkeNuLyooqaujcmdYAiG01xcG2HjpeIgd4
         M9ncmwhTEdvpXbe8VZ42v1scw8USJke4DmwuUs13KnNOsNzikBVfPXwcWApYA318Xos5
         h3mmUpY/o0JZdZcrmH1N/QXZFDIREOPqhZTmIrFZLyBQLIkfrbt3yMYVi6rIicF8kJGC
         s7sQ==
X-Forwarded-Encrypted: i=1; AKwUvByNQX+ClLev5sAvru5p6ZmSSm2ba01g1ZexO0Flf1fnU1UWseZ4s5cZuU0DBbpzRjd4VfFyWFpwKfaeO4o=@vger.kernel.org
X-Gm-Message-State: AFuF++lmZoYcY6JEvGFtx2D6+jy7nuipuO9A2F5Wuc0juAqAzjlHlrTs
	QBVzCHTTA1CWa7n6aANluovFwa0QGfMhl5th5S567rxq0EeMUBba/A1xJOJHgoLK7aE3lVX50Vr
	fPU3+OoGFT4YDUwJJ/q1rGP+7AEX4oTLZIF1EIlJa5x13dqRl10MUZG+CdVk=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:16a1:b0:6bd:ea89:56d4 with SMTP id
 006d021491bc7-6c53ea5c4bcmr355499eaf.9.1789360382867; Sun, 13 Sep 2026
 21:33:02 -0700 (PDT)
Date: Sun, 13 Sep 2026 21:33:02 -0700
In-Reply-To: <6aa775d6.2e7c7dfd.df720.5565SMTPIN_ADDED_BROKEN@gmr-mx.google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa778fe.4c28b7d0.c1bba.0010.GAE@google.com>
Subject: Re: [syzbot] [block?] UBSAN: shift-out-of-bounds in null_process_zoned_cmd
From: syzbot <syzbot+abd6a8dca0f2b7726060@syzkaller.appspotmail.com>
To: jchuang26@m.fudan.edu.cn, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+abd6a8dca0f2b7726060@syzkaller.appspotmail.com
Tested-by: syzbot+abd6a8dca0f2b7726060@syzkaller.appspotmail.com

Tested on:

commit:         069f4aad Merge tag 'md-7.3-20260809' of https://git.ke..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=17d6e925580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=acc0a882b963ae23
dashboard link: https://syzkaller.appspot.com/bug?extid=abd6a8dca0f2b7726060
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=150e0df9580000

Note: testing is done by a robot and is best-effort only.
