Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFC2214813
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789367044; cv=none; b=PEIpGfdos64m55XK/sKJI9+ladIT9ceTa22fvk/nm+Syi9Fl4AKvUfavCchEYDiYXUdAlMROYApkH8iWq7+OrzefJY7FspaMEATMpYnUwEfhvB1x8UeBGbn1PQ/YWd8tREiSVMIRfr6E8kQKKmPAgaYaRtqV68v4DdWoWneuU9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789367044; c=relaxed/simple;
	bh=54EmS3Fo2Olc8MVnySNsM01auKW93VAuOQTb+7ZnNAE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=dBlj/DLJli7ax5Fii5DXLn2A6gmg4QPA2YTG4NfSZiHo5PcVaOXcRO0traqdNmJi6R51hZB0IBQBDoTWlEMkaTnPmNa8jysqE/aIXf4u0d+v0GKyciVeTteyytPVbFBFhYxHImGB+BUHi7gDsunf2+yzeseQ9NFfBWhcqMgqiNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b2d1eb484aso5149235b6e.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 23:24:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789367042; x=1789971842;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XULTNg5POOwDQ3SspcwZpI0kQTmjyytZpmZYHO6ZWuE=;
        b=XT4+RP4L0WGPD6i43ASHZqJ2/aWKCFvHJGsii3dkEAaKdrto5JCVrE1vbjIUAdr7Mm
         iglyURQfnu8jC0bcES7zndglt61B+ut2QmMomY0pqS/GsirRwZsYJA2H5NQVCcdyh1G3
         +t4BkF+3w1rl2tk1HO4YMSwzGZEJpxHkmi82ZhIeDM/ic/om0GqueOL7A0IYbPQS7Pti
         hQil7kwri6WmOjrJ9zDhvXJJEYTYED0w7lwSsSxO7dH5nDN8E8pp9/5sRR5Ol5McyiE7
         brjmuWh4FVQBlwlBhXPfoQrUUCT3Qj+Pq+cgujB1UZP4aend/YWOzbfq0HF9owm40bIe
         FSiQ==
X-Forwarded-Encrypted: i=1; AKwUvBzkpZg9lhpU/aVXnpJanjXEW0DS5Iux45KJqZQFsghELLk1fkh3PvNAqceJeSGg7ItE6oMK4xYXYx+AD1Q=@vger.kernel.org
X-Gm-Message-State: AFuF++l4KeedxhADW4gtU/OEDEkLBdQKzNXxHNIWNjtq/FhntL0DD7Gm
	1D4K17uDAiHyA2TBFN/+t3Dbps9zd7FeZAhKS61nL/c1nfYjiTo93qMTfBaUJIsieZvbENraH3p
	UzGiq9+MDJWAlqp9vx3ZGieIpoAgP7GLxNJebiG0e1olpDlW5A2gGPct6OH4=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:16a3:b0:6b1:8780:70fe with SMTP id
 006d021491bc7-6c54214a0bbmr477428eaf.2.1789367041916; Sun, 13 Sep 2026
 23:24:01 -0700 (PDT)
Date: Sun, 13 Sep 2026 23:24:01 -0700
In-Reply-To: <6aa78ad4.f8cccc7c.3aceb8.fbccSMTPIN_ADDED_BROKEN@gmr-mx.google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa79301.f81106d8.2ab401.0043.GAE@google.com>
Subject: Re: [syzbot] [usb?] UBSAN: array-index-out-of-bounds in uea_bind
From: syzbot <syzbot+92f5bf49bf4ac75223ca@syzkaller.appspotmail.com>
To: jchuang26@m.fudan.edu.cn, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+92f5bf49bf4ac75223ca@syzkaller.appspotmail.com
Tested-by: syzbot+92f5bf49bf4ac75223ca@syzkaller.appspotmail.com

Tested on:

commit:         762137ff ptp: fc3: register PTP clock after initializa..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=10cc9c8e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5d652488f63e96fd
dashboard link: https://syzkaller.appspot.com/bug?extid=92f5bf49bf4ac75223ca
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17fb08c9580000

Note: testing is done by a robot and is best-effort only.
