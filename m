Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628333502A5
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788419944; cv=none; b=J0LYr5quq+XYZyePh3JBPdcT/bSpPMXGD3GJoFfuJh0b7sClZ/sDUlTvUP3WmPtAZNgB38lyGKVw8+8YhGS+basZNpBmpqNKXLo7v3AzSmTEUby8fT56IsaOiT6Yhouln6iz3g/pLCQdIj9DN4ULAjm4+kUa1I++gxCQ4gUSd2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788419944; c=relaxed/simple;
	bh=7s0IgKsh9IFyg4XPER7UoxK2NbYKJzBkwdol3Oqt/fk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=g6FZeqj6DIKYVK4LRSuaKE1WaVj0pwdvG7YcU/R6U8JGZD+Owp6p+OrPXPznyMoW+PWEdmProqb1jAqm350Hzg9drkfbAP1Z80MsSlZcDm2Am0dKGQLQTkXq6EOLkm24Ar/dEqWChfmSqRo/o+2dR326sDAHoyBjeoev4HViEHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6b1b27d7ab2so2391924eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 00:19:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788419942; x=1789024742;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SCxrpIPnTx1GnPDfaRyx+2MaggSNB61XzIGoh+e7GI4=;
        b=KAGd5GKqhXJEhgYVhSDPXCe4hJxIa9OybYUtDwPaQdKjpQLkpkxECoN2GLhJSkZXta
         FscQo4vc9O3QqYgTnSaraZuahJjkdx5Aijlmy8SgDwQSGx+GMoXWc35xGwJWUSzWuGCo
         JTvENiNmqdUbvCH+6wlzbFn52Xo0HzozFZoNkO3ClWfLfzJbbs8VJWx3SXBRYKsjFiSQ
         hqOCREk+9tCoDSpgQOuZ2kGZ74g0lRGGwOandEk3IYYX/8yy7Qesa9LM27HZ+Yy3PVPd
         n6Sa7k3VVcFIOrNU6dI5YBQuyR/s/GjPKOWIYx5qUnQ+u6INCdac+Vh0ls9S7NysNKJN
         7XTg==
X-Forwarded-Encrypted: i=1; AKwUvBxdFZ0PAY7h4ZKAl9oZcYMNfw0XwNSes/gmZuiQln0IXZXROF3AU8FCIro6PkDHQngxIXxrU9AEXDPCIwg=@vger.kernel.org
X-Gm-Message-State: AFuF++l3eZrYRsiyBzUBH6sMy/l0L1AZxMFRTzYeQ585gPHCHpf6HzN2
	Q8+NQdnNlY3Km5jRBe4+zIRnq+hXwDDbbW0JftNvn+ehkSMlro9bWZCKLEqDtOlbqHOwqEdr6Uv
	wCBUqpdGV2stwA33wcOnN4ZR/Y0w97OOZBDUnWzvvpnJSu2S2QwakCW/iuFU=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:f036:b0:6ac:8e23:3078 with SMTP id
 006d021491bc7-6b47bcc1ff1mr7789535eaf.5.1788419942280; Thu, 03 Sep 2026
 00:19:02 -0700 (PDT)
Date: Thu, 03 Sep 2026 00:19:02 -0700
In-Reply-To: <20260902234825.9202-1-kartikey406@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a991f66.e7659fcc.146146.0004.GAE@google.com>
Subject: Re: [syzbot] [input?] [usb?] KASAN: slab-use-after-free Read in roccat_disconnect
From: syzbot <syzbot+c492a9e154f81127551f@syzkaller.appspotmail.com>
To: kartikey406@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+c492a9e154f81127551f@syzkaller.appspotmail.com
Tested-by: syzbot+c492a9e154f81127551f@syzkaller.appspotmail.com

Tested on:

commit:         940de590 Merge tag 'hardening-v7.3-rc2' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14c050f9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b454dc6b1b7acd30
dashboard link: https://syzkaller.appspot.com/bug?extid=c492a9e154f81127551f
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14abef79580000

Note: testing is done by a robot and is best-effort only.
