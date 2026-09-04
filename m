Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1743B42F7
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 05:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788498305; cv=none; b=aN5w87Rdj8LgREbYi3bUwh5aWMV7zsI4D7Jclg1r7wfDAkqIkY/ieTIF5auPZ5+WubIoCJaGiV+m1AH96W54MzNE6qxRRLgauqFXXZdsYhkOJCfmx/JIvQUYQ26enQLqRJYWBDAKuGjKo40lVNPqU+YhmX68l+1BVXzrCOzc7GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788498305; c=relaxed/simple;
	bh=725KCkHuV0z/kkfwWORO32kaDw1Tnb8AWD9/H52lsrM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=T/Wh8dargE5pJwFwAIHPkZvGlMMUIo4W5t9dXa+5ijzB69o/3fDQQF6wgF1ewZ9aOIwSFIjhoTnFnKISh2W/w3xUxHcZmlByONM/7Pz7rreWw+xUeqWyq6L9nYp70X4akGiypzr87kqND1MyiX/d2jUWL+dy6DOoBZH0AugCSrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6b1413d9c19so650313eaf.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 22:05:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788498303; x=1789103103;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/+B4uhZ+My94P3FZ80G0ym2WsnKtlbuQXUdHGndzZQU=;
        b=ZKdtANCMgbK2XDhkzSPFXi+E6MjKqhGyKtS6iHN9OTaV5XWWruMWjVaWYjMS60TJhN
         v/SeJIQTF15Or+UFxYwyLR23ry0t/PCZVnB+JkuXTpbDPKcrxNWoyLNWF5uMq+iJRRnt
         CtuxIp3kLxV0Fnr4MHVpoRwdpjIx+n3/JYrlOLDh6FNsTD4PgPhNGzjvfMJZN0wC6M+s
         DBvz0iazp5qJnAfwZnHmVcIMud+AJojjR9/P5w4XNTBhchVtJIyaOmtWjE20RWMOd8wi
         QEtsQkOYo3U0nFhSvFEmt3tqFj5kZ3IEw4zHsc8bA8VmveGsTxWJ3OPZ7y8c0c8kDFs1
         8cTw==
X-Forwarded-Encrypted: i=1; AKwUvBxCdgXSJ1UH9vgf2QdFk7k+xvNquvm0zoYl2L3cxS56tMIOOmMtmrybJWZX7ED1adnvC9soFbqMtym1aMM=@vger.kernel.org
X-Gm-Message-State: AFuF++l2aAhQgE4ZTAsfeRXC5iGzmE9OX+f+BNgrvOpjCdyAjx3t0gRO
	F1Vvy3PCHhFfhl6ElxmFhTE0cjnka40p+vfXNfEPjilVtm+ca1oOyl+9O+HjLVWdDyfjNpp8ZEH
	JcoOcoO2v1Ag37CMLC0KJ7OxsP1r0mgC+Ivp3fsYCvhl95kyl38dw0XMX1g4=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:6ae7:b0:6b1:51fa:3562 with SMTP id
 006d021491bc7-6b6fe3aef1dmr3150145eaf.34.1788498302878; Thu, 03 Sep 2026
 22:05:02 -0700 (PDT)
Date: Thu, 03 Sep 2026 22:05:02 -0700
In-Reply-To: <20260904044105.588878-1-eadavis@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9a517e.9266084e.bf0d7.045e.GAE@google.com>
Subject: Re: [syzbot] [block?] general protection fault in blk_mq_quiesce_queue
From: syzbot <syzbot+fefa0af09f7891b1800e@syzkaller.appspotmail.com>
To: eadavis@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+fefa0af09f7891b1800e@syzkaller.appspotmail.com
Tested-by: syzbot+fefa0af09f7891b1800e@syzkaller.appspotmail.com

Tested on:

commit:         940de590 Merge tag 'hardening-v7.3-rc2' of git://git.k..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=128808f9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=85bc5cc2fc7394d9
dashboard link: https://syzkaller.appspot.com/bug?extid=fefa0af09f7891b1800e
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: i386
patch:          https://syzkaller.appspot.com/x/patch.diff?x=13e7d0f9580000

Note: testing is done by a robot and is best-effort only.
