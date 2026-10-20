Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792505285;
	b=wIQID3dGXV0T30o4EurPQANoGAps0+ZrJ+/GZ+tispSP3Lm9HBbfDOxMAEADCG88q2AS
	 hx+hrOxiKReySbT/ZZXcqAckMDRjPfFn+6SxQhPUgWf2zgd6pJ+/MdlLf1p8p43FkLkgw
	 +AtjBGWAl3x53lYxoWTq50hOTqVK45//pqTW+y8mNbMYe7SBheTq543ifcPO4lJDKEcQK
	 TuSw6/hyKqKvdVn0Nxkj0KSnGOwdfYIu/Xf0QIK3G/DEprcKZ8GHiOZpqUqoIfAck3LNJ
	 MM6hcYdLhdMkXkVYM1wsfWTd+JtGLNgDxL3qCZ3bhdNESk6K6zEWpnn4CBlv6uTRuaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792505285;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=Z+XgTr7BNZ+hRHl6R5m/SWxwX2d2nx84wkJrTDwH4AA=;
	b=tZlUIZNqIitQifd+KPLtfw/vOBxS83dWNEic9oJ2N8oEex30qq84WBQQ0zTQT3uWJc1h
	 SdMMrCLLdOhSCcl8Y4BCaf7lpLn3UIhhlFoKFFGENX+owJhGOPT72NjR+dmgLJIt6qpaA
	 Z8eDU4CCd87zhOlUlyRgwf8hdYh/uT6CRGupKXECpOdq52sdOw3C464GnTgvicuJ9mjQz
	 x7LMfYRt4tn4dGW+lv8KIDuNaFsjmu1m3wbG/u4DrXB8v2Gd4dknxxRnmUK+8W91Eu3L+
	 31PMOCAt6uAvGWArXpvwmh/23aeoMk/5feSuq869ZcT/3UIbc/qWXQiULYMM1bqhMng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5183660A2616
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:08:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5183660A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4cc89e86e9eso4908337b6e.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:08:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792505284; x=1793110084;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Z+XgTr7BNZ+hRHl6R5m/SWxwX2d2nx84wkJrTDwH4AA=;
        b=lFArLaEPGbiMqtLKO7E+DqrdLOOn4EVqeHI/u/eT0e5z9XAw7dJQ4mpxVl9T9nOSrm
         WerCAv8k+YwOfKaPSJAeaKik1Gk2J+rRvwvzp7x3+HQ3oDByiyqwSSERkTtCmXdckbYR
         OBiDYiDrmKDf0LY86o2/ctrfePCzhogW12Kv89wKhcS6zep70lIS0HcxYcMu9Gt55pkg
         10Q38muVS9jvhdv16mNuP1rjunttjc3YNELQN/0aRWSL4uzFyKo9xfiIJT+u3FzBFhMS
         Mf46UYfnZrXQLL1w54294DbYAQRFReylr1uedgdsmTk3Qm4KTPSf5Mdel7oXMxlq2un2
         Nxtw==
X-Forwarded-Encrypted: i=1; AKwUvBwTZtmdA7xwqYgQQNr8FXKguKqjKcvOYKKit1+D67FBi/XfOad/7lmfq7/W7LAaETbOYWE2bCFB3zcPe+A=@vger.kernel.org
X-Gm-Message-State: AFq9FYIvVXBVRL1UQFjs9j9TkZpG/Uqy8YuaaC8HS5DDAYV+O9JAmPbU
	lmZXJWhTlKU+HXA5m2BvpGMgLZWo5h3HeytF/YbX/YIIaw8jr9+lU+oRiqNmXUFp91kP4wC5WF2
	yc/UEa5+oAIhTRpA2I5xjlzU/Vi8AVH0DRQlwfWQWAK1BEpmBqPkgadTlMiM=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:67c6:b0:4d7:2721:cfb0 with SMTP id
 5614622812f47-53cd42a3861mr9605653b6e.31.1792505284384; Tue, 20 Oct 2026
 07:08:04 -0700 (PDT)
Date: Tue, 20 Oct 2026 07:08:04 -0700
In-Reply-To: <20261020081456.7283-1-kartikey406@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad775c4.5c73e770.1a06c9.0131.GAE@google.com>
Subject: Re: [syzbot] [nfs?] KASAN: slab-out-of-bounds Read in nfsd
From: syzbot <syzbot+561b859d032c8bf2fb53@syzkaller.appspotmail.com>
To: kartikey406@gmail.com, linux-kernel@vger.kernel.org, neil@brown.name, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+561b859d032c8bf2fb53@syzkaller.appspotmail.com
Tested-by: syzbot+561b859d032c8bf2fb53@syzkaller.appspotmail.com

Tested on:

commit:         f47d2236 Merge tag 'vfs-7.4-rc1.sync_close' of git://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=125599cd580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b8fd4ba7675545d0
dashboard link: https://syzkaller.appspot.com/bug?extid=561b859d032c8bf2fb53
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15e5cc95580000

Note: testing is done by a robot and is best-effort only.
