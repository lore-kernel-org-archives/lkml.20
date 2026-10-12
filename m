Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560E746EF60
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791799930; cv=none; b=sWelIJE08HGTM+1m4Ws+vcNP3DDyWDWs1b6NqSTRgvxoGFUW0HxbmdSWfIOcYCYyn5nTrKWClORI6NxRZo3/IbFp19wuh971uZpavzczKToWDwR1IOeXtbNm7z74aH6ff2ihGiBg/bUlrU+VSsmjFA0mGig9JuVaPoeXiqVMj/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791799930; c=relaxed/simple;
	bh=pgDFTEinz63ffLNJReuaDXvEZpACwSMthSpL2GABIKE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=J0GUzVOl3Zps2YCLk93qF+nI8/5wzWRqw9hJ9X9I/oJWAHysxUa5iKaiHzB2p2xLkJ9NjnrasR+O/tnOL4TPxLqimutnV6tua0Qib6QLQgTKWoPrYN+0ayOglnr7omE20qaLdcIVA0aUQNe38UZpG02wyQa959035w5K/UNudpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b26d8d2498so2814454b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:12:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791799922; x=1792404722;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nX4OG2Xf42v+bja/rmj7W/GA9GBPmTLDzjbF/c9M5dQ=;
        b=TqbW28YX4UjjhVXNlThQxUlmTyJnykwbuEcFYTQgeokqrlvlE8uTaDTEyGk+B1Mf61
         +9pDl8oZMD+GDBLKhh3bmPrCYfWp+2YTBkvzQLPxeDkrEaxiq9LiYvs2s6hJWToZX+wK
         8GX42gFS1InMSgLGmVSPxQ5rppIZhtXENoRzGgCx2Nmt0KkE6LpnNTv/KIxwcNon0JN8
         AVTeBw/YCBFDSuZkQgyzBo/Gx9t1bpLF96Xak1IVYVCnxsDqQq2tjo3M3JL45MsOw6Mz
         ZoHYdW/8jGTUGn9KOq1ebh6r85x/gj69q+yGDgZdOcCxVoLbS3RjITm31XX/ugnNL+jU
         PrgA==
X-Forwarded-Encrypted: i=1; AKwUvBz/w/Ll8VMbcNmM/Oo529zABJJfYPoGY2yZAm3cmiIj1s/kp4ih8gPik0RK5cw2QK+ZvSwynC7nc6h86iA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJpZZsSYProS/WEL+wrwwSHHiG0JeJ6w+Glf51ahbGmJDhLFgxF
	DtGCClpjBesD1p/8Krw8Y3Co1uppyi6KrWHyUjMB6x25MHlBNEciC4TI7pvdV3pKjz4OJ6sDl3K
	A8kt8wz0blBZTTK8d+an6Is2oQfeMV7eog4fFGMxsvOyIJlaUJ5q1r/AUWAo=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:308b:b0:4b9:e88f:89dd with SMTP id
 5614622812f47-50c54835dccmr9055624b6e.43.1791799922064; Mon, 12 Oct 2026
 03:12:02 -0700 (PDT)
Date: Mon, 12 Oct 2026 03:12:02 -0700
In-Reply-To: <CAJAt6L_VC+8MHXNkWL6kSWw7wF4XmmN2_zFgYW+_1d=nPPajHg@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6accb272.8cdf6287.1eb53.0123.GAE@google.com>
Subject: Re: [syzbot] WARNING: ODEBUG bug in hwsim_del_radio_nl
From: syzbot <syzbot+19cbce4cc656ecd4febc@syzkaller.appspotmail.com>
To: aryanarora.w1@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+19cbce4cc656ecd4febc@syzkaller.appspotmail.com
Tested-by: syzbot+19cbce4cc656ecd4febc@syzkaller.appspotmail.com

Tested on:

commit:         08fa34e1 ieee802154: hwsim: free PIB after unregisteri..
git tree:       https://github.com/aryanA101a/linux.git syzbot-pib-baseline
console output: https://syzkaller.appspot.com/x/log.txt?x=168c8f15580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3b57b1287207ae97
dashboard link: https://syzkaller.appspot.com/bug?extid=19cbce4cc656ecd4febc
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=121f540d580000

Note: testing is done by a robot and is best-effort only.
