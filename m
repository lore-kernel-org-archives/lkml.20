Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBADB2D838E
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 08:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791620286; cv=none; b=ftKkOWqLWH6qtvf8cLNXyHDTMNztFSqQ93NvEoL6QsyFmp4lDFdZ68NmqG1R4M3dInrJqKD5BG05l8sxsHKJNAIsFg9LywxNyEA+YnVNHg22i+9c7+q2yrGdPGJabSzbCrNAYlaNQNF12kzfjCHOQS/8+sqJ5TYfdu2Qki3J1NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791620286; c=relaxed/simple;
	bh=hu6Mlqm0zov55YwTQJqPia7fcDNsU0zubkDA1IneIa4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=pPDg4CzwVmbEVots/19E4l2DCzHztkW02XSHy/U2c7cRPmAkzAdW51hf+r8AV4e1KUHY57BS17e9nanTcqTwvW4ZXNgUvZVEVhcDoNlTyrdGB/M17fUHHSWOfMIFzCoRa1gH8WsnXPWnyEUJPXbgDeB2c0TENI8OS6wl6C60gUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4f2040e10d8so560739b6e.3
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 01:18:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791620283; x=1792225083;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=i6BU87MQcKGaZ8lk6vjpFkNzB/ce2egktPyADqODWBA=;
        b=NJKVb1/NeUPZu/ZlxphyqQKgWhNhDxnYYlapbxIuM1peePfgjxHLJWpoGMRwYy85GO
         33ai0AtoBCMtzGuq7O14LoTRI7pF7t9p7jJhD98sTKLgU1VBzzBa12WHf24UW74xczVx
         elvEJ6yp5jYtX/CbkFWh5hoZGPwR+0brX+zetiuLVBGaTaLGFwAo5T/V+cUglXjU7yDB
         2SgOxadkrMGoGpzyq9mgUH1CFU3noeHzWPImEIHYtidca90UwXvtWnFo5WlUivprjGSS
         NA98zCqi9UJ9W8laXngbLoGoGBuvWa0aPTflJRdVzFNqZCmYRDDOL1Qxh1Dt/eFsUh2F
         WHew==
X-Gm-Message-State: AFq9FYLkH6W8ajv3xYW0uodNYVwcvgqAXU4tlJs1EiCv/PqHYuaXm3x5
	Hsad4vQldRJNSUB8Nm7gWI8RhwOoDZiC8giO4VYh5bYi9tzTxfvZs6pWZEkQ1jEVsUnhkhKMjRd
	qBZ0fQW06uWMWC7rCiFSiPWcQqvbkbGfpfDjKZJAgOt0JU1L/4JC/UrXdfcY=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:19a8:b0:4b3:98f4:f057 with SMTP id
 5614622812f47-50c41c96aa9mr5077870b6e.3.1791620283600; Sat, 10 Oct 2026
 01:18:03 -0700 (PDT)
Date: Sat, 10 Oct 2026 01:18:03 -0700
In-Reply-To: <asnXSiqYhug-s7NH@fedora>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac9f4bb.bbc4c7f9.15faa7.0060.GAE@google.com>
Subject: Re: [syzbot] [kernel?] WARNING in __dynamic_dev_dbg
From: syzbot <syzbot+6102f1c3a0ea8073fd64@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, seedandsyntax@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+6102f1c3a0ea8073fd64@syzkaller.appspotmail.com
Tested-by: syzbot+6102f1c3a0ea8073fd64@syzkaller.appspotmail.com

Tested on:

commit:         3857c2fe Merge tag 'pci-v7.3-fixes-4' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=102a649c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8d2ffae0a5e73b90
dashboard link: https://syzkaller.appspot.com/bug?extid=6102f1c3a0ea8073fd64
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: arm64
patch:          https://syzkaller.appspot.com/x/patch.diff?x=132c41d1580000

Note: testing is done by a robot and is best-effort only.
