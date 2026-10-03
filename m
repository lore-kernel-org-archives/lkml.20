Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA7E3A6F06
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 09:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791021427; cv=none; b=IojQn1AidOqXBzGoptbyXMkjiMVRXqg/HxCWEJpX/XN/aR1Tkv2YeQxHvCGlVRk2WwdQ9ygPbo96sLWg9Xl5gBuYpZcxKlRM5CSJRpo9lSKNj3JcJO6zUGd1O4eueQv1YaQQ/yQXHbw3R/xFvErgzGTTbi9ZM5EKoI4B/UsE4+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791021427; c=relaxed/simple;
	bh=EYXOm8OU0nCoDjsHRNDdxa3wCnac4SEMYsa49Yjw2hQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=B8CuqFd5eOzKdpbTwq3dtXganjG1lbXHJbrZAFkuxBlWCivHoUv3tI+U36SQgSoOBh+tqSpus+r4PLtXvxZI9l2LJuyY/FbpF2lSdujlF4IT88FyL7M+U5ljOAIW8oCRYlp5h1HQQPiHB/PFzYf/WDgnHsZAHf2lhvqrEo/qVpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4c55ba309c2so455548b6e.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 02:57:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791021424; x=1791626224;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GzofMsg7bVh9IoRlAWNBZQOnn0OSea2oapj9qTB7ckk=;
        b=JhHcvYMLGZxygot9lOwgytlp6UJ12tlW+SvGA9lKwmehQJTZPqNaaMo68cqA9RKDoD
         mp5RO1czYXX4iXLi/gTeXatQu01iKVec9MCAAsbf+GqL7W2+0a1TXFHrCzeln4vC443b
         EZJTPRc9WFp5dKretUoD3cPt1KRNGU96M59yLj2AKvo+d+HIRc9IGRv60wFXg8ipKjjb
         1B3wYR1wgi4GnAM5SCVmiZsCIjiZplx+YDfeQxFEOMyssIpzFwLfJo0oPtNnZHV+0AAR
         RmpFuBNLzd1icWX0DAsPbRr4pILqOuGFWFD0Nhd51dRrIzu5FZnLCXrbjEmJgLZfWUvC
         ecNw==
X-Forwarded-Encrypted: i=1; AKwUvBx3Bxv61zCbfloEbpX4kZ1TTZpLUoS5JHoSlahagt8/yIcQQXuaNeN9jRv6rgMbZ209i8DI840KfBu/ja4=@vger.kernel.org
X-Gm-Message-State: AFuF++mtJ1CGf54MwPmthwbmrnYBCyKEVGJCfsggK1tYOkqpwUnnoRT1
	L+3SPTeGZsf+1g3gs9ukq7iMeUOODGCLd70px3ji45ZFOU/QHG1ZAl801iXPM1n4Ub8dulUFuBl
	A5HEzt/+8evfV79GrByOQrTRWqph3kZmCu/2eGgJcmFRaIIMyxCAWXrR0Vlc=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:ec7:b0:4d6:92b3:5c8b with SMTP id
 5614622812f47-4f52bbc2bc3mr3889879b6e.65.1791021424393; Sat, 03 Oct 2026
 02:57:04 -0700 (PDT)
Date: Sat, 03 Oct 2026 02:57:04 -0700
In-Reply-To: <20261003091512.17099-1-adarshdas950@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac0d170.81dddff3.363068.0006.GAE@google.com>
Subject: Re: [syzbot] [btrfs?] WARNING in btrfs_init_new_device
From: syzbot <syzbot+3bf3e110b2d406b8166c@syzkaller.appspotmail.com>
To: adarshdas950@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+3bf3e110b2d406b8166c@syzkaller.appspotmail.com
Tested-by: syzbot+3bf3e110b2d406b8166c@syzkaller.appspotmail.com

Tested on:

commit:         e767a4ea Merge tag 'probes-fixes-v7.3-rc5' of git://gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16925725580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=341a98f91c13ec9
dashboard link: https://syzkaller.appspot.com/bug?extid=3bf3e110b2d406b8166c
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10ea3bf5580000

Note: testing is done by a robot and is best-effort only.
