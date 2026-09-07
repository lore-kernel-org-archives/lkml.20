Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B327B345CDA
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 19:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788809465; cv=none; b=k4UE7Tu1m4YYSPnM3RrU25ohEFs+aFDJ00uFgArSbyvNtAHKto24xoDzRixC5AZxSTENR2XZPiiXphgzDeFz4Co1XtIcmw2bG7FddOnnElc/abj17tPzm2htRhI2BIU6feCEEs0TJfqGIwpirl3zARdOVxW8zstIgD5k8i0FdIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788809465; c=relaxed/simple;
	bh=Y/f7gKfTtD3caAROXXmlez0v7+lxdkmJJ2ksmNTB8Bs=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=XN5G7SM1xQ3NasLttqz7wcYe4hc0BkvH6OZuyVeSpCjfWGSreQfihzwIVeUsTIy3E7lcYkYunwXVFkXefjtzZgS/8Rrqr3qHs5C8KU8IEFCIibm+HcJVOpZ38q+s0xU+3Ak0mVJn9mdc7m05EZfkTuR5jpIGfEN3itg1H23aT6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6b1bf511988so5068090eaf.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 12:31:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788809461; x=1789414261;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7xhFNaP6KQHnAXOKkPy8YZJSop4UrDgQg8b1cvrfSdQ=;
        b=S1Re2FDC+8xwh+E7KBMUzsijru6FFpuzIXNqRXTho2O2ywjKVM3w8fh85/uNKoKlvv
         FM+vWUznNG7ErpFYhm7DNPrUnlaZzB7SGBTg3SjV6jmsh3cEy1GN3CJMEL1kLnVxTMiy
         lpBTj1jrnSCS9su7LgNRTm8DkxDEXDLHhdWY67JEfXWK/rFpgDI71wzho5VobUaLmdg3
         hqvERl8oe294n7VHY//tloUDsfxzgoZlx4BTX9uN0lGDvKhlBSz1OUNooSR6q9VjjIGf
         MYmhC4+XeGajhfV7dispoJg6fOPE7CAM31LLy3wHMv9P1JEo8ZHgRCo17iFQ/js24MDY
         UbHQ==
X-Forwarded-Encrypted: i=1; AKwUvBy4hqZlm5X5d4/BMCY0xy22KgS0JtBCLq8i78zHkRoHaDV8TVsRUu2ak9iw1kQgU/9cL+2PjAxdP7Iinro=@vger.kernel.org
X-Gm-Message-State: AFuF++mPBxX0LsNUS9/jSSyITaKtEV5b04lgIxI0fpLX870V4cb1cfF8
	e7TPIayKv93gAMy0BwYBeH2Arqw9KnYBky86tr2gU7N1z262nWK3PxsnweDvkGLmjF4B4AwPaAZ
	j8LE3JF3R6TNgOUBFysLw78DB/b2NX+wyQYKK3rKV3tDqwvWoG89dbT3SlIo=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:c3d6:b0:6ba:3635:800b with SMTP id
 006d021491bc7-6ba36359f2amr3741068eaf.68.1788809461737; Mon, 07 Sep 2026
 12:31:01 -0700 (PDT)
Date: Mon, 07 Sep 2026 12:31:01 -0700
In-Reply-To: <4c018446-e4c0-457a-b2d1-a5bf856d0e2e@slotpi15m67>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9f10f5.2bb5a69c.24b23c.000a.GAE@google.com>
Subject: Re: [syzbot] [nfs?] [net?] KASAN: vmalloc-out-of-bounds Read in rpc_queue_upcall
From: syzbot <syzbot+d5c77cabf7a3492aa650@syzkaller.appspotmail.com>
To: cel@kernel.org, linux-kernel@vger.kernel.org, linux-nfs@vger.kernel.org, 
	netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+d5c77cabf7a3492aa650@syzkaller.appspotmail.com
Tested-by: syzbot+d5c77cabf7a3492aa650@syzkaller.appspotmail.com

Tested on:

commit:         5965280c SUNRPC: fix netns use-after-free in write_gss..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux.git nfsd-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=1374eaf9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=d5c77cabf7a3492aa650
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.
