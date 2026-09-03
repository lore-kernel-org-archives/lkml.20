Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3D034EF04
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 20:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788466995; cv=none; b=ATw32OJIwNQTUMLMnt56bfVGeWE8BZ8+Cfvjc/BG3UGhuEGuVcD1lySXwlRPIRAMyvDPyhnLZnF8gD6ljDuZZkBba8437tHn1r1xc3tANtSKb07EP3Nz+kXXcNyVkcnO/M302vTPrBFb7snqfaYEQWrWd0g7BBA9qA1RhdZBuUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788466995; c=relaxed/simple;
	bh=gtDtVgb03NhbBfi0jqqxfX9akkPlxNgcHpmkyNqQG5Y=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=AifXqjlTbGDaPLEOavXcvPb9emeGl0K81L6a3TRLUT6mVOy3PYOZJ03EkvHSJ1rMJwUk+eLrn2XcsQ+AIsMvpV1JhSzMJ8BJh+jFcAllumaVidF0iDmQkbgnjb7RYpUEBaPKUH4wTJERgP1njK7wEjkZVwul/WlZCAs5LPRO/Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6b13d095a33so245420eaf.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 13:23:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788466984; x=1789071784;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ww81hJhCRRyXUdaUtWUtQEttWdGhVpJjenFHmNQFR+Y=;
        b=mqpCEFXlX2SWwWMhiwMMrkZu7WsJa3Bu5sdH9ClIIIn9OX+Y+8t2ijhurCUNjrFEjt
         kUqe0ZEPszoXTXmERG29ATtcvhdvb6RbjXs+IW328pjyjSkdmifGcYmTl6JXDRDBwqgl
         WNAUtZGy8wTlgE1e0kwAnw1eOYb5ePrBM55JM0Fv+bBobiniyiHXjq/a1z/XYMjQ3qxR
         RRn7T+IAyuw/dph+9wR7ooVsFx2UTIXgJUPTVEXVbcYdVB5aHYv/r0ybQO6Prcxpa/S0
         WbbW8XQ9+X4q11J5e+XErAxU6G7+Bt83hWNP/CAKHj7j+rBcdyDyFcKNgOmiGB4xlCBJ
         uPPQ==
X-Forwarded-Encrypted: i=1; AKwUvBwVIqRVgGRg6pfXQHJtb1tPiQuBa0TohKELq8OvApTP6ri0rZ34iG1f9uNK/ziSvxd1NHZt6d2Yecn5neQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nI9WDQ1qvG+DI+PDJ16T7sXsPHW/SEPcatMSv5zJaFH9Gipqc6
	5bIfKWG9fojM1OYG/SYq/E0lN6hTW8RKvGANPhKjiSoZ/oC5EjSwcO0gjJXEYjVjnqJ7MKim1JJ
	kb7MrTxzEEHM6vIJP0VzXVwxIhgzB8V+w4bnzlVmKab5oVM226N5J1Z050lM=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:179b:b0:6b1:6136:956a with SMTP id
 006d021491bc7-6b6fccdb1c9mr1289079eaf.15.1788466983891; Thu, 03 Sep 2026
 13:23:03 -0700 (PDT)
Date: Thu, 03 Sep 2026 13:23:03 -0700
In-Reply-To: <20260903200806.155310-1-adrianox@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a99d727.2e567484.299ffc.000b.GAE@google.com>
Subject: Re: [syzbot] [trace?] [block?] KASAN: slab-use-after-free Read in blk_log_remap
From: syzbot <syzbot+4dfd96209d744263a972@syzkaller.appspotmail.com>
To: adrianox@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+4dfd96209d744263a972@syzkaller.appspotmail.com
Tested-by: syzbot+4dfd96209d744263a972@syzkaller.appspotmail.com

Tested on:

commit:         841e384b Merge tag 's390-7.3-2' of git://git.kernel.or..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1182fc15580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=4dfd96209d744263a972
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17d4d0f9580000

Note: testing is done by a robot and is best-effort only.
