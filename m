Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F011F3B85
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 02:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789265767; cv=none; b=eg9h6fOFhII9tw7qCXELLm97PHNAe2k4BuwMyb6kk2vHvVX1l3bF9jyUIPqAhvQQ1xrRYW9I+Enep8JB260Tu/av04uDxNgjJqZbuUruswFEdkxbABHZzU7X/UFoMe7XZ3DGqOtYVJRhqEffQLeTPorB7mmiEhi8RGZx2L9QptU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789265767; c=relaxed/simple;
	bh=jPCynFnyD8ePFI5/Z0DKR8asOclPyH8aaKr3QmgOysU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=mkrY8X96PBRwrq6BaQ+ayO+DUo2ZdpETM7L5Ey3ZPf5EDIMGyWA+gz9puzkBdL2wNte6xcJxpzB+r1U1itEpuCpOl9Swr9KEObbpBIZmO25ZP+rslPPf0+6C3VUY5+ZTYdARFK4rLfPfTcTQn2Z7b4vDhqmfYkqxq2e+V1XXQGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-8056a93e0e3so1754027a34.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 19:16:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789265764; x=1789870564;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zMN/9VJ58MJ0RbqT0Si8diocy9Kx4t06T7oz/TrWot0=;
        b=gncLcTs6YXKSL68+msKI9WffNDKAlw3k68cw90OSjkzcI08x58UeU52q2t8dmiwrIu
         WKM7jXBVS4x2wYtQGywugiBq8y7I1gAfaweg+uJxYeAvM9W3KVBzSMgNCcQkTpA1mp/l
         BqxRRO673C0h9WayKyBuijCDLOG6RGeA9Sf1sV1Y9B/5G8vOIWymb5nCYHNoAeesfSOr
         sUiz4ONIQ0vy5fxnFHfL1EgPz0A7KqDt1O6M/DEK3OOPqd/3OWe26EnGMCz9ZnwYy8q7
         8VXTNsPyaeXAqbUP6J02P2NOGUgi3eK2HfMClGP7hJC1WYGgNzPzDI+T5kTiUXnFgmS8
         pNlw==
X-Forwarded-Encrypted: i=1; AKwUvBzlvDFl0dhk7FFctKa1wiAOBXH8e2Ec/xc8CapXfjfiJcP0s7kLr6m1d11tw01U3MChpBbpe4yQKdWaxcE=@vger.kernel.org
X-Gm-Message-State: AFuF++no+oyDmBJp4ZK9p++GQnl4wd7xvEuVKcMiLmDm1y1UByhBS5sR
	IV6dJyrY0MgOq5m8x+0vzXz9NyFj8GUMiZG40ZH806HmRiwxXps4yqudj0XCZnvkPR5lYNgx4Tn
	jQtW1x+NyTpJxDyfVuNWEHDJFeXR4pbzTkgXRMN5EwwmOAiBEOLUDlT7M8AE=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:221c:b0:6c2:1018:3f7 with SMTP id
 006d021491bc7-6c210180448mr7276453eaf.23.1789265764750; Sat, 12 Sep 2026
 19:16:04 -0700 (PDT)
Date: Sat, 12 Sep 2026 19:16:04 -0700
In-Reply-To: <20260913015111.82827-1-jcperdomo100@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa60764.f2639fcc.29487d.0049.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] possible deadlock in rfcomm_dlc_close
From: syzbot <syzbot+0cece8fa7d83523f47a3@syzkaller.appspotmail.com>
To: jcperdomo100@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+0cece8fa7d83523f47a3@syzkaller.appspotmail.com
Tested-by: syzbot+0cece8fa7d83523f47a3@syzkaller.appspotmail.com

Tested on:

commit:         2f0c1cf7 Merge tag 's390-7.3-3' of git://git.kernel.or..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=136ca925580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=0cece8fa7d83523f47a3
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17889905580000

Note: testing is done by a robot and is best-effort only.
