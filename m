Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793997605;
	b=otUIllvLZVMNGfbAHsA3ykzRDeEV6Rz4BLXGCtjmaL6pu/jl5Iune28lKomnNoJHwp+b
	 1rHOePu0SNtBPLzJXzjG67wMVCkoI/NtXen8NByqYWUeB7ySvIH+xcakujIGjUTjSDKLX
	 3PLh3jXuL4qZgf8dZJuPGHkLaKXE1HDeNHJnaX2ftAMF9sXIK4uGwX/WDZXMmhKCOqKBA
	 cEva6fDGIFfgn5QRrSOP+Ji2t7pXIW1b3+3UoHKQcDLvyfSUm2R2jpWIJdtP/wQQ4Lpnq
	 VnTPAwpLFohUzDNmm5Md6s9ORfZpLXC/d/OYeayMXMG5xNMeFuF9PEo8+dpZQA+2gMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793997605;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=NxUp48EJkiGxY+Ocge8pL9nNXlcYwAjL6UsjCiffpBc=;
	b=cs5/npqZnuxJuHHjMs04Fk2/27ZKNohnkrp5TYP9tiHMfnI5E1D/KxvEWtRpGsW9LdLn
	 8WriyzgWKNCy4cnJ4Sf/1d+9vMwVV8PSD2AQt3dzMUjBRsd4y21XNOTcFeV/GPUBEEQ5U
	 q8bdhrvXsSFbeqj3moiZQtPOomcSIBHh1L7rVa/9DFZQxe9gD/2zwBycaVpI/keLCMJZc
	 U+1doC42ygvGwMT6QRsM1Ehbn1asixTAK9ZyezpyGInWjZXNheJee2p/u1GTNjfBD0SwM
	 GKzeJTKXzrKpHASkUeKWUIKvWawZFCcLVCuTB3SfEVNu3MIuN5zNSrewjJHDKfh0eAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BF0606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 20:40:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5BF0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b597558c4cso1265830b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 12:40:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793997604; x=1794602404;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NxUp48EJkiGxY+Ocge8pL9nNXlcYwAjL6UsjCiffpBc=;
        b=Y5hCqqY9oyVQXNa1Kcgz6t/r/rEkYy/Glcl7iB1NZMbj6avA8WUbNeRGU2kbICdwym
         cNVZMgO0Y1PybM67+vTqR6raaZFqepOhYE5Fuc/Nrlc9AyZcMkmldBMIo7jXqdo7I6BG
         Fqbc+8mlYht00BqkmG2HYIoO1482PQWbjEw2qF7CaXO8Xz0Yv2VOR/BuXov1dNsMCyjI
         vaYMHhpOI+v0Qv48MVfl91P8P/Kn+dnFxgvg9oOveHPmtmB0HhmicWnovf7EPga/+axE
         icFwES/hr9eRaPc7bnzGyV9NZyghlEhd4kcobWPOutkUxiQTndOddvfGJMAduOj2ZRTy
         7JbA==
X-Forwarded-Encrypted: i=1; AKwUvBxzo8f0igaYsLhden9tdwYvqLvK6cnXBiaBPzN+ltzih1nsRo3I6YqEcRMjYhBju6kriYMrHTGOC/g69FM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xsu0f8L027vlwHwZKrYrsjy847i8U+KzhDhpblWBPbjusVjEw
	4Mv81ReYISaHnb/Pb9e4Ey0sNOeIHJakz1fAYvW7b8ErpJgLWGR9ELCDmW/IudXqnT/QvEIr0BY
	rWekBcs0qc9dnrsEbXTS/mTdehHi9SaW6sLEpafcmvPfHa9uXwRH/WNZPdCc=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1c0e:b0:510:7dc8:5ff7 with SMTP id
 5614622812f47-567e0f98f3dmr2846345b6e.19.1793997603806; Fri, 06 Nov 2026
 12:40:03 -0800 (PST)
Date: Fri, 06 Nov 2026 12:40:03 -0800
In-Reply-To: <20261106192154.480-1-drifabdelmalekmohamedsaid@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aee3b23.45cab1c5.12a849.0000.GAE@google.com>
Subject: Re: [syzbot] [dm?] divide error in cache_ctr
From: syzbot <syzbot+3e16980543e238b95bd1@syzkaller.appspotmail.com>
To: drifabdelmalekmohamedsaid@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

drivers/md/dm-cache-target.c:2386:27: error: use of undeclared identifier 'U32'


Tested on:

commit:         ddfe51b0 Add linux-next specific files for 20261105
git tree:       linux-next
kernel config:  https://syzkaller.appspot.com/x/.config?x=3dffa811bfeed6b4
dashboard link: https://syzkaller.appspot.com/bug?extid=3e16980543e238b95bd1
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=179e9abe580000

