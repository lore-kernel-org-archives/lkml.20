Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF63494815
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789398966; cv=none; b=ltJ9RZjELrb0bF42Ib+9SXVjyglBNJ2uf02GJ/m+FAulEvr9pqYQ9LZAtMXpbBtYj6THNpcvhuM/GxFmb/+rKvzrxkw9JoNABy3V2PP6i315oGhiMspIZvn17F81bqt4qIUKgNq420dnerYYKH/tE4rdjOcYn/hsURPxD3jNttA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789398966; c=relaxed/simple;
	bh=4dJKpMh0ArrJHHSBPxvIe1TnCuCwIXRdwPGtVCVI1co=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=PWBv8UVJTCgGwaT89l/rqJEP3CAJ1ETH1jERbbYK0k/iLC7Gw2Ng2l/r8PA1UpwB/XQpkoSPwGrkN/imP1t9WfL+dyXj9T/2zSh+ZItaw4grT+vWu5xE2f7Nhzy8magBqkb3dGt8iYN+WchDwF906g1cuTpbfGI0S8M28KKleco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6b1c1538784so3905481eaf.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:16:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789398964; x=1790003764;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=24sCPG/o3zU61A9NY8NO+diIPkVFlz/cGFo7L1Cw0Es=;
        b=r+puIpG/3JBCIPtvNqVIFJ2D7foapoeHKyjs+8rf7FkFj913sUEb1WFaTCv3Zpq8mT
         tzl5XWebIXKYOTSZ2/Wwn0OUWfOxQG0mlBfi4byC/sG6/tM2Nl/k4py/cZ3g6X0x6Tqh
         H5J+a2a+J8w2MtfFQ49LpRLUmeyCzmG5R7fCU3lFtmb9hvlxa8vAlKKnE0zpZ7IDbYkD
         zXBPosvxuqi1UGtKqBBNkWWBCWC6aCZAZ+I5pI6fRiMhaEk5CkfX2JIU1S+WIUQQNYr0
         wHECsQJ5k9PihBFxewf/BGN5+hDI+awUKXEWgHcJYu76X+TcSYPDYFU3VmDdGIcqTNR2
         5EZQ==
X-Forwarded-Encrypted: i=1; AKwUvByprT4zcpYBYVZ4+rDLrQ3Q9HyY95eoTw2UR2gJsLUyYaekIpVxLAURPMXUPn8NyVlbu0Yw6bUlD2Ot/ho=@vger.kernel.org
X-Gm-Message-State: AFuF++noQ1EH7vW0viFERV5fGbWIKNTlI5TY3yDx9P3ThfqoExbNuoy2
	Wp6styVB6E/TuGMgGclOIASlYV/e9DUwjm+qhKdc4XGyb7kZmNCS7t43nfxWbEHWAAj5eiewJn1
	ek6KOJ31N3UGMeSf2YZenTHEKZ423LjEN9wzWIubxRahwvg+2l2s6XgQR+BA=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:98e:b0:6c1:c628:b0bf with SMTP id
 006d021491bc7-6c53f44bc19mr1552308eaf.13.1789398963953; Mon, 14 Sep 2026
 08:16:03 -0700 (PDT)
Date: Mon, 14 Sep 2026 08:16:03 -0700
In-Reply-To: <6aa7d3c4.e3f7d457.2eeb0a.f494SMTPIN_ADDED_BROKEN@gmr-mx.google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa80fb3.f81106d8.2ab401.004f.GAE@google.com>
Subject: Re: [syzbot] [kvm?] INFO: task hung in kvm_gmem_release (2)
From: syzbot <syzbot+ab6273c58262b9de56d9@syzkaller.appspotmail.com>
To: jchuang26@m.fudan.edu.cn, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+ab6273c58262b9de56d9@syzkaller.appspotmail.com
Tested-by: syzbot+ab6273c58262b9de56d9@syzkaller.appspotmail.com

Tested on:

commit:         50d05c7c Merge tag 'landlock-7.3-rc3' of git://git.ker..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=118642d1580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5e4e3a0e188a497e
dashboard link: https://syzkaller.appspot.com/bug?extid=ab6273c58262b9de56d9
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: i386
patch:          https://syzkaller.appspot.com/x/patch.diff?x=13d7e925580000

Note: testing is done by a robot and is best-effort only.
