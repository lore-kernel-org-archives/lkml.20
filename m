Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DF8359A91
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789619943; cv=none; b=D9GIhLIg28bN834tjdJ1FvEM7+GLPz0I7qCQo0qeAkEovQGgG7Dvbsp8UzY4UIMgAuNJJ+f8Zu8oXc48bXu29/7j9vXAD5WFQ2dxVAMpEWpdCXCIdTGsdz0NNqFP97CftZDP6quVFoQR1MBhCvUiiLw4HWD+RceHAtB9QXAbVck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789619943; c=relaxed/simple;
	bh=zRWoQcnt1AtrFvd89D0l0IA9kzku33Jra670bmlv2I4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=W7QW0XvogW8hfhhkyY6Y6ydH6fKu2TncKVs+Mi0idoLzqhSKBVoBG9OYzp1uvHiSU8ToiIIAOEw5RKA+Dps30bu6QtdppGpf82zLhE64uKPLZOxuNspN6u9McNL9fBHNwklI4g0KR3Rl5WFR/XtGEzlI3PVV70gUe/M+hS/QHOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-45eb9967696so677221fac.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:39:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789619941; x=1790224741;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OaAy1tcZDeHgpl08AKhiq6q7MhDpc3vUc92NrQsRQN8=;
        b=2Otn3Rkw3CgQWzrrp6rDtTneXiv+qM2b4KTUbp6taLr2j7PQq2wXz36R46FsIj2NRW
         ptRYnETs7DMKwne5YCRrE6hP8RnrP/DEUTmMhxLgyPEhDLzksE/X0DgKkw+4fmpWKkwP
         9bnYou0vaBcKI8zs/NwRt6ik+7HuVcoI3NxGvmlwm+xlzklq/18K1f1HHbzG/GQRIPUl
         T0Z601ys0XPshvCqBwI1OadW9EFVORPezifhmcU/pumj4vpPBMmF8vojU3obz5gna9S1
         PZKmcstHv8vXMAh2rU5dNZH2+QGF4zhnm3tSmY4D2n+eLMysxMULBAj1z/3uB+tIDdaV
         +ktw==
X-Gm-Message-State: AFuF++kpES/DrfCSBJem6SLiQNQ1qrrl6IaCjPbkorEB3gk+POeyYWq1
	+CydFkenR4MkRuJh+cK9ocSL6p98G7JXKEsBniuNdl7vuKQmwVIszWInxcu0idI+tBA4jZxg5Ca
	86fPPNLqefJMnRtTP8K2zZUjKUs9/Rc6zwT16ijUY0XzN6YAGufPnC1HjnGw=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:c93:b0:6c7:6c8c:148e with SMTP id
 006d021491bc7-6c8fe7cd3f0mr1362957eaf.30.1789619941609; Wed, 16 Sep 2026
 21:39:01 -0700 (PDT)
Date: Wed, 16 Sep 2026 21:39:01 -0700
In-Reply-To: <CAFJkwZw8hjL7xSTayRqbVS37RYYENU5XFTgT0b90J05dG3gVXg@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aab6ee5.71f81b7d.278072.0011.GAE@google.com>
Subject: Re: [syzbot] [ecryptfs?] KASAN: slab-out-of-bounds Read in ecryptfs_verify_auth_tok_from_key
From: syzbot <syzbot+b9529ebe6a9394ddf825@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, neganhat@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+b9529ebe6a9394ddf825@syzkaller.appspotmail.com
Tested-by: syzbot+b9529ebe6a9394ddf825@syzkaller.appspotmail.com

Tested on:

commit:         f6e7b42b Merge tag 'sysctl-7.03-fixes-rc4' of git://gi..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=1481ebf9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e909ffe6b35dddb7
dashboard link: https://syzkaller.appspot.com/bug?extid=b9529ebe6a9394ddf825
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=161658c9580000

Note: testing is done by a robot and is best-effort only.
