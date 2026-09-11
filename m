Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E56488741
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789132990; cv=none; b=P1H1/BfP1Z291P+krhx02Nq3nHvnI3MTfd58QrR/DxKZZayBFO0sYj4p9HHb9utE3wPybcHu3hcE1bt8eVJEQJn/o0aFVBRajJpsgMtRMl6NJnl0+fv8nFy0+Lk1sRsWXTsM9IuM+wAh99Km+Qfz8YH86f35dnfg7+rBc9u3GxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789132990; c=relaxed/simple;
	bh=7s6P67kakpmEknUbWsz0KIt+CkZbpihY7OIiR+JGOXw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=h62wlJlNatcgucNDgrBEmUr/1FZ5B3WPgVtZT3+zHnD1urHZYFAvGurNgG3VE9B+tmfGg7vgA6P7sMIVK3y3y9872ktnEbQH+4Q2bqLsfR/4q/5Ub1QBBBY598g79XxDK0lFb1KxTfyedpKKxHWbh4Vy2RXBYGlDwNFbfZ5o0LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6c153bab4c3so387278eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:23:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789132985; x=1789737785;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yx0+Krjhf2SZkuzG4tK6Nd+hHJS5c+8I9Axg6uSmazE=;
        b=IzK9QSgLeY/SZ9aSnsuDL/dvLM0WD1mxEh/QBoTzjU5rYe3adXSgbrU6XUTE4J6tKU
         Ma1aDkJPxqNbWaB5ggMTlZFU/LF11ij3NTtRsEaF0gmQo3SgTYzXGun5Ba+PYwjXz7Pe
         E6yhUhua823oiYgUvRd2nzuYnwza82jjVS5N6UZd5DL+x2oI1GgrfJDV7V1VQpqdEZ6F
         2nFm/g8uN55b8IX3jrGodfjX+wU2GdI5Tq30iFLKhltLL7a6T4B9zMh3M4ntrjLS8F5F
         fwRAoQlvRWdUsUYFXqSdUAxae09etOJY0PWd8wKFX/wtrtT6nYQJEMmCOGh7goI2lCDu
         7Gsw==
X-Forwarded-Encrypted: i=1; AKwUvBxB3djh/W95bi0LhhHdIIsf+TrQKZ4xkB/oR61kPP5Cw/qOGWNFLkOPEy4bEorw6O5Ei2D1E+iuD0sjWl0=@vger.kernel.org
X-Gm-Message-State: AFuF++nT+OLyrskKUZbfjPBmpDAgbGRnJsx3MpkeMnXlvPSQaQLGqq++
	Zkt1XrH1rhVlwbiJ7+nyxmgxG7rrUrLzMePFDOTvL7V+VQRBZzByQA3keP5cDwTN/F5GrSqP1fS
	81zsELv7fK+BqSz0+ELEo0LChm1E21+557QFEgrh7kRm3kQWoKPVG7X8EWsA=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1686:b0:6c1:65dc:6903 with SMTP id
 006d021491bc7-6c165dc8073mr1307451eaf.45.1789132985159; Fri, 11 Sep 2026
 06:23:05 -0700 (PDT)
Date: Fri, 11 Sep 2026 06:23:05 -0700
In-Reply-To: <20260911130108.859638-1-eadavis@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa400b9.6e6c5f9e.28f11f.0046.GAE@google.com>
Subject: Re: [syzbot] [ceph?] kernel BUG in __open_session
From: syzbot <syzbot+1dbed5969931c19d3eb5@syzkaller.appspotmail.com>
To: eadavis@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+1dbed5969931c19d3eb5@syzkaller.appspotmail.com
Tested-by: syzbot+1dbed5969931c19d3eb5@syzkaller.appspotmail.com

Tested on:

commit:         50d05c7c Merge tag 'landlock-7.3-rc3' of git://git.ker..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=13b294d1580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=1dbed5969931c19d3eb5
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15c22601580000

Note: testing is done by a robot and is best-effort only.
