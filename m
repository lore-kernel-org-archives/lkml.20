Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794133442;
	b=Fkm21xuiRFZf7eMn0yGPk620w1jPVbFDILXTCAY6YcmIampgXqh+yZMMs2+h3Mk6P25F
	 TJQnfBZWBRAnr1xaI5MLHoxR43gf2fOIBXwy5RJXXv80fmoTuDUHeWML7jKW6Jh53/N+j
	 lylGnjpSKnApYVllsbVD+xXa0/IJE4llQMrRSBduapz7hsWWOMNdKh+jMO0KQnwLSKpHr
	 Brl83iUCliGpBfKobGNwQ6R7Lhy5bzZTDH6bjwX191vc02eu1ns/8ns3s0HntQK+xKHaX
	 SpWRwdhHTTFEuTTqs9SITpiA41JRFk7r2NVxMQ/UBHeynnC8V0ztj+DBb6kp+yVmrUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794133442;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=5uEfbEgpzUyMr0Meimt0NFiror54LMDIw5dPkMr+Bak=;
	b=RiJkL2hVOcZSygh25Mf+3wkuqyJspckfjVANJGpB0LI8cM0tTwtmd+dMCZqWl0g7+wE0
	 Wwz54GRKLUT+2GKWO9F/qyffVSR1PeQK098Tp7R6GsrXL2f0rLYkDovADQ0BMLbzfhsWT
	 HdLEg8E6yamy2CFQFSzsSS5u3jgzi93iqzv6yiYx2f8WE/xD24PulQdqgXEiu8PyRDAgd
	 CfQ1dYTdPQjCdRGPUL7WOLc6jr8M/qNyJc+BcMDLg9pch+D1+CUncKJdYlNGT+oCd4zTv
	 fhZtnZqOq0Ee6BbbttwVYiBYtJWiHZlEpaOZTYCVMTiwky2JbaUcMj9WtzP2qX1gUFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.160.70
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB9E606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 10:24:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FB9E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-46ac13882ccso14076fac.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 02:24:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794133441; x=1794738241;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5uEfbEgpzUyMr0Meimt0NFiror54LMDIw5dPkMr+Bak=;
        b=2CCJ6VzgReeHnvWwRgcyVjZ8a2NbftX7GT7Locrv8G0u+E1NoYWTqdXjAuU4WULfjm
         jJ/nspyEyIo/YefE2uTrSecYB9J1YMaXLVUhO1u+3WIZ6pFMIR/5dm/StylimlwDFVv1
         cf93S4RdjB5vQPsvk4n/sqKOhg6EWzL5lSiX8sxBkZv8xYpAtbK27grz6E6j18ex3JW5
         eJ0VJhlshl/ypQ7GEVBUqnxR6vlpPtoIiBc5lGiJY03jY7VtYle369hyfC9y8vD0b/TO
         ytxR9D9T1QAGcYdj4ITFMMZnzIyFHIcTvu0NLtM+NwNcLtQajTeoDcRAapp9WaI1+zCM
         P0Hg==
X-Gm-Message-State: APuU4Z8SkgOp/QHM12i9lUrzywPpJAMdfXWa0jiDbPSlqMwj9oNAYtwU
	qMSvHR6BIQ8D3II8x6y/4K2e9uGNFC1vdfIo4fN2bU1tvWLeltHeg/5VV908SH6jE6v1OYyyD5E
	fpj/HO6yZyjXOSIum62nQt0JVHkhxhDmTg11Pj7t76Xe34MXywFDnOFI+ILw=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:e90:b0:564:3fe1:2f87 with SMTP id
 5614622812f47-568141ed8f1mr550367b6e.4.1794133441294; Sun, 08 Nov 2026
 02:24:01 -0800 (PST)
Date: Sun, 08 Nov 2026 02:24:01 -0800
In-Reply-To: <20261108095637.1746-1-varun.singh10011@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af04dc1.4dd4714a.f8d02.0012.GAE@google.com>
Subject: Re: [syzbot] [serial?] KASAN: slab-use-after-free Read in check_tty_count
From: syzbot <syzbot+39a2135de1558208d3b3@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	varun.singh10011@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+39a2135de1558208d3b3@syzkaller.appspotmail.com
Tested-by: syzbot+39a2135de1558208d3b3@syzkaller.appspotmail.com

Tested on:

commit:         fa4ad798 Merge tag 'for-7.4-rc1-tag' of git://git.kern..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14eaaf35580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=fed53dd9d1a160f8
dashboard link: https://syzkaller.appspot.com/bug?extid=39a2135de1558208d3b3
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=155f78ad580000

Note: testing is done by a robot and is best-effort only.
