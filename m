Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F330C5B206
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 05:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791349805; cv=none; b=Ht2nxnOFlHqOxhDAZq9D+fFTd+ZrBP+BXA2BMsqqsCdTrFjiBwZX/yMyKBNFWC8KcJfR12G+tXmobF1oVsSuJaQT4bL1YCJCrXLrjHYuU+ThNX8byoxFzb8ogNesFqfed+IBo7ymauJUT3eP5CsRQ3DxCzQCvHEQJxll6RJmJAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791349805; c=relaxed/simple;
	bh=tA0tkMu72Lk4ZgeHAdvI9P9iOJq4eVANTAQY5qjgLjg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=mseGCdrFX2lTVep5ZnS1C4wSn0Kd8ttcI0FRyJwti+keUYAp7NlyRLY3Jn8+4/LNuOpyjimWcJZuEEpjoxv0Oanrqhgl1Fs6K5ZGAbOBDSL0FW9jLJh71VcY9aTelaiFPSdCwzxaarvO6WyedR9918c/xEj94soiwBBeBz3VO+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4c467e19391so6413889b6e.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 22:10:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791349803; x=1791954603;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bDwcY6oPs2A0+nr9FWBW0WcjfPWrrplkHbYsZt+gaM0=;
        b=ZUNa9twvfAGSAGWRyJDmwig/c4GUy/9GgTWxe9keliHG8p4Ttu5rnjV4dAuwRBZz55
         v+voNlBz/a9Hy+FzDUVzqT0O9F4Pj3kJWcmLtKZ1GAm4zLAfGrWWpDGkHES0b19aXPvE
         6qeoaZSZKJXX8svhlPqR5KQczh3JKwg79LafTApLL59LqDg1FMZII/zOA/6beb/F+eVb
         ldis7hzR/V+cgJfyKVuoxlFSSjGKXA+li2sla/Z6tO+0UXfLTrxEbsnkR5R8Wdrbpi2d
         n4HxfdEdbNQxGWccdyR9JrSsRrbmSjYRM8MuUNpp6iI3jSNTe1a32K874YZJRPWs++5q
         xQGQ==
X-Forwarded-Encrypted: i=1; AKwUvBz8+K5aS1fe1PoTbsextoN6FVEidvKrYBoUcscaVfzJO/Cei1a8dFEPJe6mqOnl7jjEqN+vPduMT4UVxOU=@vger.kernel.org
X-Gm-Message-State: AFuF++lAaHASUc3tuy2SzApbPMMXswNTCnByLq3cRhmwB3W93ztADNe9
	ny5/eCEoohoU236KjCHDIigamRX8sor1yedBsZcXIqkAdrYPxNrlNysOuYlC+JemM8uYIX98KYZ
	ZYGvjJSirfAZ+lb5t2zelNwU+MQcwNjW1J/0z0SFD2uZDq8RZ3aavYOXgEF8=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:13d2:b0:4d6:90d3:e183 with SMTP id
 5614622812f47-4fc47cbbb9amr1514520b6e.44.1791349802891; Tue, 06 Oct 2026
 22:10:02 -0700 (PDT)
Date: Tue, 06 Oct 2026 22:10:02 -0700
In-Reply-To: <20261007044940.349-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac5d42a.353c8d8e.177895.000e.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] possible deadlock in l2cap_chan_connect (2)
From: syzbot <syzbot+1fed874be1d7e459b5a3@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+1fed874be1d7e459b5a3@syzkaller.appspotmail.com
Tested-by: syzbot+1fed874be1d7e459b5a3@syzkaller.appspotmail.com

Tested on:

commit:         602042bf Merge tag 'wq-for-7.3-rc6-fixes' of git://git..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10c46715580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=929e4854a828f434
dashboard link: https://syzkaller.appspot.com/bug?extid=1fed874be1d7e459b5a3
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=109db835580000

Note: testing is done by a robot and is best-effort only.
