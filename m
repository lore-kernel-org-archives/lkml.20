Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793858283;
	b=VZN33qu3ybONHKP0GDnn0Sd0o6wSUGQ2xMGmpzUGi/MEV8vgZ6Y2j6V0upg2E9iDfsYy
	 tXVsbjmKTqjHoV3M2xiCAxjAhBCEUm9ufVsq+VhReW8YRjbYLGaXO/ySg/k+xEOLDDqCS
	 +IXY5B1Rn0f7j0CugfsgLQpcf5zcWjToK74VQmKLzctH2i/OQmyvdI5ZlUXIapgujbGqP
	 jpeXA6GYgyYumQjuVOkTphmNfCubHhWEJS6bobX+h8+7MlkQ043Pg2Dwb5FfCatyCH8lT
	 NIf6jdAdIJV38Ckzd2h9DRXQDTWgacQYyAwOy/tWubjJRkKUKvDgFCLNxtXtgG7rOEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793858283;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=1wH492CuDGQlMpm8S8AiAKQgTkLnHojMbDZ4iibtryA=;
	b=ygux1S/l5XYMyfmXxoLYLTRhU2UjXyYU+R1yIavFqEVi7J39n3cBe5Ee5W1JNHU/0+vT
	 dm9Qnt4F69oBugVKHK5+Olk3quvaO4RyQEEmMT2WKpoi7HoMgcG6JTIGxKYanwCE2eshL
	 jPtVXGLYCoP0JjhU0N2I3q7NzVpQPVyU1sFuuhKmgQUiob81HfgBOer5/TLA3HgNg/DtV
	 uKhiOFdo3U4MxilHZYh1Aa6+BzxSqM0Djq5cQ+Rp/R03gp8zrMhFzvMkl48IPp0nGibgh
	 mbS1iRKYFHDEN8TN3YRrQLY90MaZtuXrtoktQRoLb6twAOz96/0/2RKWsnkjNecpVjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.72
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD53606A32C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 05:58:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBD53606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-84478a97bfbso2161998a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 21:58:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793858282; x=1794463082;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1wH492CuDGQlMpm8S8AiAKQgTkLnHojMbDZ4iibtryA=;
        b=vvd8EMYVZz7QQ7xpc5st6e0a3ORhgaUVT10ShYzMWXwIyDHucE91Qbki5xLyZcIaTG
         zsrIChFzmFQ4/nBeO+NFxl1f9bqMd1NDr3H/3mG3QuPxHOCgljxGu4hIag+WXeIK/5I+
         Oe5YLmKd3Zjsny7zN5ZrKtGzo/fVZZT5WFOMmTw3UvU8P452M8ECTZwxtdJB4HLTW4Vg
         4PuSIA38qVDPNwb3jy2/gRJgQbtsu2Xu88vUlfGImnpHi6Bbg8mZPgdDe24wLwRw1FlR
         0sPvDWvVPSLjvgMavL0cKUpnMISpRF5NsSaYPzCdVeSPSAV2G8V1CBhh7QgqLvpe3poC
         EGHg==
X-Forwarded-Encrypted: i=1; AKwUvBwai+XLx57G5hplXSxwdQmUrIUd0jYjQo7neKQFONv3zUqPZHP8Zs2GqAPLHk9MHeVbKLgcEgK6KQjCmhQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z80+miC8ExIZfj4E72kvKpxd0hjuIwe7yQgGAYkKqZnep/AQxhw
	h80IrRVBlo9V9CCZlao7QrJgKJ7OSsJxyyqCl5/X79S3bvLt6rVfRtsj2WJax5FevtCRujex51N
	cP1WzerfaVoOXH7/eN4GA/VDph6eFCGFAQGFvYvmMxDjpW7GeLWjXrspLjRM=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6820:c3c9:b0:6da:4b62:b6b2 with SMTP id
 006d021491bc7-714f2928f60mr6539028eaf.40.1793858281785; Wed, 04 Nov 2026
 21:58:01 -0800 (PST)
Date: Wed, 04 Nov 2026 21:58:01 -0800
In-Reply-To: <20261105051637.54502-1-eadavis@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aec1ae9.f31022ea.233d2f.0003.GAE@google.com>
Subject: Re: [syzbot] [media?] [dri?] kernel BUG in sync_timeline_signal
From: syzbot <syzbot+cba1a1f459230395a076@syzkaller.appspotmail.com>
To: eadavis@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+cba1a1f459230395a076@syzkaller.appspotmail.com
Tested-by: syzbot+cba1a1f459230395a076@syzkaller.appspotmail.com

Tested on:

commit:         6628e7d4 Linux 7.4-rc1
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=16817d8d580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1d2c97eac7d33533
dashboard link: https://syzkaller.appspot.com/bug?extid=cba1a1f459230395a076
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10f6e455580000

Note: testing is done by a robot and is best-effort only.
