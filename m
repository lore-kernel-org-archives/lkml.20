Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8EA3F86E1
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 20:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792181767; cv=none; b=VEReCa7qhDDSoMlp+TGK7F4O1O2pUnhtCHuqTzZsGZua9JQ+57yoKHTqaz4OtkxwmsbXay/y5k+TV4ynCwEqdri1JG21w0bfbgy8mznune1GYVprIpEbhI1utobyZhSCxEF5dqhWDLxIJ1FXf9gKscCDQ9MkTUqkrZpI8A5xe3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792181767; c=relaxed/simple;
	bh=1nxu4pA/Om4V0atY9ShqiD4KS7VYOfNUk0chVS9G/0Q=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=RVDJKuULJ5rzFCDZpdjjAhXc2n/r6Kf0ryuRQqjW4qrh1u+rlOxZaQOd/7B0xMenAa5TYpM2n6gx59QU4uy58DyzKDK0egSG6YvE87uTMi5hbZUlUzwW7pDQmReYhOqFb3RC1QgwYBM3v4mIpPpyblnWERvNGsqamT+Z5AYXG2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4e778acdbc6so545134b6e.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:16:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792181764; x=1792786564;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pjXHKA23cauKt6S5MBjLM3ZXgx4VBXK9g4Pk56xy3PQ=;
        b=bXNZPN6O0CYH+k9xH9YxRQYkj0Cj9jgTR+OLZj3pKRBtQEKnNaryJA98UDAm89h/Xl
         DybRlml7fdRuo4p5DVt2YSEar7N8xisN751+J6pza4dsDgpb7ZNJ/Ic7jcURfTdIPDH7
         i8ejQFOsv1WowGFUjykWhH1yax5EsPy0Quz73v6+MjlfbpQ68V8D55gOJKLgP4Ht3HNr
         07DQqVt6L6zFjxFpml9/Ri8uCYnZaE8GX2gw2ooTku8LG4uizw81eY2qmArmayWuoGdt
         fNFpNfRi2vnrNEj/XgTI6kFGRHynGYVxpDnUfBC0Br/8vUuNllKsUbW9A+QkItoxvylx
         r84g==
X-Forwarded-Encrypted: i=1; AKwUvBytUGZvgiz+al1hiMM4SUF+FzgCapwGnw5iB+yMvBa8bDJ0lHsxlhX1nnRoQYKhek1SkskduMD983KLpcM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKIFmAquUPSQXTQcxOsigcdVzZGfeR362lKwOGQeaq5K32vBnCE
	ewasy3cX3biu0L9/y3fvc2fLjU6Ew2WFNTFKqNYoXmo4agtgCIaG/cs3wTEE2CYtCr/xoB5Ph1z
	BLkQFsdDtiaqgnG94LvlU/FbcAVzK23bUko/bxJNO1/OybRGBAZOh56OpGjc=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1993:b0:4f7:f874:8cac with SMTP id
 5614622812f47-53cd5a0daeamr960785b6e.66.1792181763723; Fri, 16 Oct 2026
 13:16:03 -0700 (PDT)
Date: Fri, 16 Oct 2026 13:16:03 -0700
In-Reply-To: <20261016145646.105391-1-gservice341@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad28603.a6d1a155.34a93f.0004.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] WARNING in hci_connect_sco
From: syzbot <syzbot+5897b3c764f5989ea942@syzkaller.appspotmail.com>
To: gservice341@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+5897b3c764f5989ea942@syzkaller.appspotmail.com
Tested-by: syzbot+5897b3c764f5989ea942@syzkaller.appspotmail.com

Tested on:

commit:         70dd4ee7 Merge tag 'pinctrl-v7.3-3' of git://git.kerne..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=105a618e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1422747690f83bc1
dashboard link: https://syzkaller.appspot.com/bug?extid=5897b3c764f5989ea942
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.
