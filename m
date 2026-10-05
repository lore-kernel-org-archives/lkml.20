Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534C8DF6C
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 01:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791164344; cv=none; b=CAo6MrW2A3pGg1esebZcVNwyKaszkEPrtfQxRMVe40CccwM2q5LLgQ2xOFw814g0mMz4gZOiyioCZy+/egIIwxCIny5nUczEuP+IYcXBNX0nxcxU9ZP3WCA53pY53PCHoeOssQYJF8r2f2BBMDIJ2A2mE3prCVQ/qMZ8cmql/uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791164344; c=relaxed/simple;
	bh=fCgNLd//sYpL5uhe7t1BvXCyNcb3u3jhqafrIJWpNyQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=W95j2y9tS+CjpzcOrJNKzOV9L0s8hmzhbJdPSRuxjqbCJFsl4khqXMLPeQlgTFOK/716Aqd9uaLTDhckyK17S1VlsQIxJ8qbAkB8bWWhc1iZwF01LloKz0kWkeFjMo+a2qBGJ8jl7ysib59q7O8ZbtkzVBlIW8Fr09RV7rj3tBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-4566537e644so1957979fac.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 18:39:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791164342; x=1791769142;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IJ6dkMqm7qGQst1zb4iorPBZL3B3T7jJSR/nxO2JZU4=;
        b=gDsTgYZF2+Bc1Ipw/nOookuFNO4QgjcPFif5llE0nM/LdDJk/jvSduJihHlEp2bZ6X
         Mj1bYYZSe9SJe5+vErLSMRJviBXaRWO9dOsv37IhEZsUmiNXkF7K+P3N5pHr4cbK4eYs
         9l6+StDaEnNUvdYihPXqDC2S3jHXuaoh9zdMrt/ctu8wy265HAvS90VCSDxUi7IFX/H7
         7LYrKUNr6SUV/gpiPgg9Im/xgNKeo2iB1e5G3DRdYoX/aTWuhKUbPMnJ5Sg9JFq/kD60
         sasBAhaVTF98LjH6enX97GebyoOomG5mJcoam3/2AUPSPJwYqXxGZSFWNG6yzwCYsKcf
         Mkig==
X-Forwarded-Encrypted: i=1; AKwUvBw2OpJJAirNdJi0BtfZBieD+0ImFqgbUM78Ad1Y3Xxz61khND+EzLNHJcft8NNP+3OjK9kPEgFN3jwR09w=@vger.kernel.org
X-Gm-Message-State: AFuF++nMSrx4K3brkTQzkOfZTOLQnlnjISgWTIa5xpFE9Hviw5esU/0o
	hiWX/X6xGU7/yUrZ7A/f6GKa+4zToDICu1hR5DXJqQLh4TJ+ocBtmxqHbUpv3o9NNUuKiN6SW2C
	pDbEmUsy1wAazJLUozszaXJQdMKwESJ3WnObFP4XxpJ+xputCSIreZ/NuHp8=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4493:b0:4d6:93c3:3e90 with SMTP id
 5614622812f47-4f52b3ae2c8mr8712327b6e.67.1791164342259; Sun, 04 Oct 2026
 18:39:02 -0700 (PDT)
Date: Sun, 04 Oct 2026 18:39:02 -0700
In-Reply-To: <20261005010141.96208-1-adrianox@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac2ffb6.34119e79.2f92f3.002f.GAE@google.com>
Subject: Re: [syzbot] [ext4?] KASAN: slab-use-after-free Write in do_split
From: syzbot <syzbot+09bec78ee77613a3efdd@syzkaller.appspotmail.com>
To: adrianox@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+09bec78ee77613a3efdd@syzkaller.appspotmail.com
Tested-by: syzbot+09bec78ee77613a3efdd@syzkaller.appspotmail.com

Tested on:

commit:         72d3fcf8 Linux 7.3-rc5
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=1472dec9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=718e346eb0b8f38
dashboard link: https://syzkaller.appspot.com/bug?extid=09bec78ee77613a3efdd
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15ccdec9580000

Note: testing is done by a robot and is best-effort only.
