Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850183BCD17
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 07:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790494932; cv=none; b=ivfBH44HZTQak4wtGwDtH8Rp62JrCDPVo2eSCIVNyJl5yuJurMOATVshG27bYegfYhYumJy+ja6UH4LFsIw1OpkIiahfU3WUcIDYmICOrIvYc3ocFNYym/qkFeFjClD1Uxnq8mdeSSn/G5wDw7RWJRp4AeFb9hwV/IhkST7uZG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790494932; c=relaxed/simple;
	bh=75A9M5TgIoM2gIrevlAnIGQ7eccqokJJNc5o6u/pqks=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=TguwZz0aP83bFZLdIQ0NLunJQZNQncBPJeZqZCFgFF8siQ6lcYQg6iHh529ueFQA1kzKD5k/uRm/Zttcqlc4KPywV2Grk/BvKsYwuCPECKNy2t2pOBsz4cpZ+RjjzLPODD6ydGtKtOJ/gOIgb6iw8pQC/yclBcKFlYzghvjXmPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4ab4f652f9bso2528791b6e.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 00:42:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790494924; x=1791099724;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+dLWqk9Lfa1A8/fcjUQdJzQN+AEtevT8Cachr1mDVq0=;
        b=DFWb4HoJlTH2UjZkMr0kSIKK1UxDinubOo4P2Owol4GrfKML+sv/fRwcq9ZA8bnHiG
         WMO7gIqRGqBMcunUBj7IXtSMqQ/qkspBjpw7ge2Xx4ejbQM+bxPcJ3YMB7wRMUBEC/R1
         hiNgmtyfdZmPQg8So4i3yJY88HWBqGzoO/a835VCxvy6XCcRHCGoxWMQ09CNZqgnwsf0
         /p+bgpZojd8ttkrNeEeCndeGsRSwFUkEKZgWWeh58ce+FXvfnK371C9nJ8CxCDabYo00
         DiC1f+keHMpG/agov72nR+L3NfMcd+QplDqQtGeWm2K1Hk77YOn4LvHTpDLO8+h/wVJs
         pytg==
X-Forwarded-Encrypted: i=1; AKwUvBxjNGVAK/cXpvsHvFnuSTEUxGwmPv8qrOwtTQ65eAC9M/N8KhHbwqMYMZJr5L+RNRECynmTS3XKESLK/gc=@vger.kernel.org
X-Gm-Message-State: AFuF++nu/o3Boykuzyjmhd0jTO9eCBrPwRO9JV8EJDJD+q0JjVjZg/v0
	LJvpXTVDxv8RRkznsaXl47YMycpV0leX4vFE8HFGSe6151S+m3Xb0GHoof3iNtPXKxGqxcPZXet
	J7u+RbBr6DI31sA7hJgEEIY+vfA2dCXIlNJP2ASmcjh05oep98RpVS9gdDWM=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:308e:b0:4d6:9232:b3bc with SMTP id
 5614622812f47-4d72cd363ffmr13140368b6e.51.1790494923975; Sun, 27 Sep 2026
 00:42:03 -0700 (PDT)
Date: Sun, 27 Sep 2026 00:42:03 -0700
In-Reply-To: <arjFl-vgg5vz1WWN@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab8c8cb.e548f532.1ca396.0037.GAE@google.com>
Subject: Re: [syzbot] [net?] [afs?] kernel BUG in rxrpc_destroy_all_connections
 (2)
From: syzbot <syzbot+89001660f14fb7684c83@syzkaller.appspotmail.com>
To: azpijr@gmail.com, davem@davemloft.net, dhowells@redhat.com, 
	edumazet@google.com, horms@kernel.org, kuba@kernel.org, 
	linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org, 
	marc.dionne@auristor.com, netdev@vger.kernel.org, pabeni@redhat.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
error: corrupt patch at line 25



Tested on:

commit:         a7bfaba4 ipv6: fix prefix route expiry in modify_prefi..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=7d012d9c67977ee4
dashboard link: https://syzkaller.appspot.com/bug?extid=89001660f14fb7684c83
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=134df2c9580000

