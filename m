Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793761326;
	b=nF+Ucs2PYU0Brb7SycEmKlCgxDqZH7MQs4yXGmQG5YQz+8mdNlYoxUrO2OrmMAMWEzoA
	 fTlfc1Nfp8Cc9OLDD49xogJOFgNoRjLiA9DtUUrVq2jdOtp+2kSBNMRGv0015vMmlJMJO
	 Zk0s08/Vv77fHjyEtDUJakey/w0zYY+2Tb9hOG2Ua+ntFsxJCijVZ4NwRQbOP1aSqdK/b
	 nVQr71yL4cz+/u3uqvWvW5EW1KgqOnsGwyURVVO6WOnRRZj8JYu/SHx/LeSYSnjb7vpdj
	 Vd7N2IERXezYBiAmPggLI/GOLy255RuMYhqRB5yp4AQy/FK/kk4pW7Oo21ePICiPHQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793761326;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=iDYxGLT55TzX6jPqPBoAIPLk6mfk9JpVSGFvzZQZY5Y=;
	b=MRtICA5eEUzXT+9Wm6qZGuM/VZCI541R5vlHFOVaYqEixkpIXniuMOoQ7FXpgvq1X2vN
	 BS10/eY9CYCZrPOQNGlrY37T2HBtQ9XZd/iMkykk6iqQlKX5WNLnQLVajUIS8E3HZNYHd
	 9KRmEbczskEN6xPLUqglIBX+SUpeYEazAbIZBWQgFYHmsOhZysy7g5URKRdgyq/oyfIlb
	 GNzLam1zGEl9N3YBVi9+8+Tn3LAl7bmGJUQUoWE6G2EuRMYpQ4Lk92QCLI8cMs2yH5+Ph
	 3Y2e/eTCDzRn5OGQWQZAHsNKZTLpbjaY8B6Nd7bXeYP7tYuspmn9F8sCETItRQufbFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D25606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 03:02:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1D25606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-540537f959fso410068b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 19:02:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793761324; x=1794366124;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iDYxGLT55TzX6jPqPBoAIPLk6mfk9JpVSGFvzZQZY5Y=;
        b=rQkWwy1Nph3zlgFoUrHIUrPX2SfPhf6xQ1Iu3QZ7J6O57hsVVYn4k5plKUEyGDDYQa
         tnqKtgdpf/Vec//Ar0kNnbFWGd+SVDcW76KRhc7EbHh4ZFctViNYwTb3R8S3EPJdNZbA
         ZpsoCUJJtq08v4e5EkZW5rk6Zflajj5AqKZwQak9Umzshy2xepB5nRexIRl0MRiB8R3P
         ff5OUJiX0ZoinbtAA1fIpuZlYHuMNwdEk+I6cR4LAhST48HsTK6umpmfZRY9eGekKkx8
         8rMZ7AjGEiw8qzB3A99wzcHQqEs2vOPGGw2BLLlo4daefjykMlbNaFMlAvYXgrqMvNdo
         aFFA==
X-Forwarded-Encrypted: i=1; AKwUvBwQOp8JAUnXH6HD++35skq/u1ssDxkkRTptHBVKwMYuSyydLtOjcgVhc8Mbc0qHcck2qIwv+AekLzMWh5Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZOGSD8fwiCLp1GBWO/eHk9GDBqrqme1r13ffULdL/z1Ocs3EV
	4d4IaPbuoFxxoPI3K0vi1i8Qpn9DU9+A4+JGwuAtqoRcw+FHZmYj4o+PrzH6UkzTC2P1t+UBrhG
	bXW7gPAxg3cqFwX31xvtjtfM1tbp7ge4EvrtITVSg0Dc3OwhYqkgEozLQek8=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2396:b0:53f:3c0e:c74b with SMTP id
 5614622812f47-5640d91a298mr11244060b6e.9.1793761324771; Tue, 03 Nov 2026
 19:02:04 -0800 (PST)
Date: Tue, 03 Nov 2026 19:02:04 -0800
In-Reply-To: <20261104023802.3832959-1-fei.yu@intel.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aeaa02c.bf891901.a11b2.0002.GAE@google.com>
Subject: Re: [syzbot] [dri?] [mm?] WARNING in drm_syncobj_array_find
From: syzbot <syzbot+95416f957d84e858b377@syzkaller.appspotmail.com>
To: fei.yu@intel.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+95416f957d84e858b377@syzkaller.appspotmail.com
Tested-by: syzbot+95416f957d84e858b377@syzkaller.appspotmail.com

Tested on:

commit:         05441d69 Merge tag 'cocci-7.4-rc1' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16d2344e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3cc6a7ee2d24d208
dashboard link: https://syzkaller.appspot.com/bug?extid=95416f957d84e858b377
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=16fb38a1580000

Note: testing is done by a robot and is best-effort only.
