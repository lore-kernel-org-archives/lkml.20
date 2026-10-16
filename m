Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CF53B95E4
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 20:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792182906; cv=none; b=LLTsR8MGm5TXrN59DBkJBplRggaQfHzmo+zSqLo5yY4GqUH5CA8PTg1XVzbGLo2BlYggK0UYEbru2rbTgTIlaGZ4rkmKojpZMXw5Ihi9u3YkBTXN+tU9fgJUbca7+zOTM3yY9UJIf+2EuPcTVMxGFHK15pfXKiS4oQi22c5YrwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792182906; c=relaxed/simple;
	bh=aylVOV9Iwng3B7wnW94lanr5gkCVlxuFNjmk9Xt4jDY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=RQFpPtIvncN8picV34+sVekbazI4rlw+EVM2/WsNa8ZVckM+mNq0ETTTMYudenCrNPjhV0pXAfUmEJHURHUn9xCTXYScbYdtb+K0ppfWXTWqIu1aeyCzXG+iKa3dFwYMSQxevofs3D0x/OhbZt4RIby8sOe9AGeft9bY+KUs15U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4e937c5bd4fso473454b6e.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:35:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792182904; x=1792787704;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tBAdxDAPRq/mqSvKWY8PdfrDRm+BxIg9D152QKXzvJ8=;
        b=xX9Fq50ppV3hGdtQR7br2znuCTFaJrP2jua8dxrZa5iQuiFocR0EBxjsLQj0V8FXFo
         cNoHHh87FDHNT47CEOahxNKsv2XhEyEPBTloHQr8GpQLfmPXzMfuGNyNQiWgxkuHky4a
         xYBTYY4RpkvMd3r9ajLLUuQ0n7OjYJGo9qbvKYlNj1wbvEo0VVgqWXQmlVXH0ggT6B1/
         2kAigQsslrIxTXc4Ey+TBHFqXtDxi7O6F1kr99tDhzxnDbZDmlCYSH74uFciTj3TviX5
         v2JjAx3cJ+ElVM3aWg0JoqLLt4RWbsedR6d+zGXNUcFRg6YvmSl9BhRNQ+o6mAmtGVaz
         T1Hg==
X-Forwarded-Encrypted: i=1; AKwUvBz+M6q6sPaGh+8WnnjV7HB2O1s0xiYpLjP29mezNoONgrspPFNw2MaMt71eeG9ZY5IoOTdnCx6iau8xk3I=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEwQhJBVAlRS9jVJeFUA8eZj75zC8D3wuSN7kT9Yhz85GpNjXq
	bVCkApn25a9/OH0enEr577pTdpAzoeOPd4rO8U/tyctkRG3jne75bw+HTIvQPYFluwtB1uQ6E/o
	uKLE46XeVqSd9Bt5+0gU1AXqksXZ88VAPwKFAzD+Gh6jZZRLuvi+fbdu2uyk=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:11cd:b0:4e4:86b1:f7a0 with SMTP id
 5614622812f47-53cd2581f9cmr687604b6e.53.1792182903817; Fri, 16 Oct 2026
 13:35:03 -0700 (PDT)
Date: Fri, 16 Oct 2026 13:35:03 -0700
In-Reply-To: <20261016145701.105414-1-gservice341@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad28a77.7514cce4.1ece07.0156.GAE@google.com>
Subject: Re: [syzbot] [bluetooth?] WARNING in hci_connect_sco
From: syzbot <syzbot+5897b3c764f5989ea942@syzkaller.appspotmail.com>
To: gservice341@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
lost connection to test machine



Tested on:

commit:         70dd4ee7 Merge tag 'pinctrl-v7.3-3' of git://git.kerne..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15250031580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1422747690f83bc1
dashboard link: https://syzkaller.appspot.com/bug?extid=5897b3c764f5989ea942
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=16d1bbd1580000

