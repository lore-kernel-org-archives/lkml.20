Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CE4381AE3
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792163525; cv=none; b=S/mH3oSR6B+gwbfv6PpyOw6Z7COggaRWi7z4w2dO7OoInpLcdN2CGYkOmwj//Limxd9J/cHscDFkxVBuON0OZoPJ4XR9VXZdprQUOvrGTPYdYJqpVfPgB0HdRzX9zEkbmVAvHQDH1E5O3sq9SH/pZODLSH/GZvQGSnnpicczAow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792163525; c=relaxed/simple;
	bh=5r2EIw4MIdO3BofI3GoCadnxae+c996bWWF4XREag70=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Lg7yDP2ROWLx3cNt7MhtlKyqvWDFNev1LsmqeCapyrDy4w8DrEEslutQDTulErrqt5ybJNQhc7pdQNxerAArL4gWH78bYrMp3r3rbWbMQcNbySj2bTwBWcMs4wzxUUepd3o5loxvbJCkE92tqFAKOwzmD+FB08BXyzMlmtY4/8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4fb73e868aaso157714b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:12:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792163523; x=1792768323;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0wpisORu/N2Lu921HdH95TvpzyngUIVLVmzMzokPceI=;
        b=c7puJPzZ7zX9gTfe4ljmu67PVc7/rfBI7+LcKPzPNbgRITXLEQqd8QD71Nl/VoV8YF
         plThjGnecZKEbhN4FEqRaQu1G/o2TubNTAM4LdMX/waXfJmh+sI9Skxi6ifusgTE7mOG
         P6+5crfV4A3pwm5dAC2lRgQ4tjnLx7TOJR/8zWVFBVDIv29AxVZ6cv7Pq1R1Ve8rDKnz
         6ynxT1cLgjUDHP86gVPPgieiVSxJZhql4iyVFWrfv23BqtmCOVfZWrCmdA8/4Dbdgr18
         ZYiLrgyhVYvltVqkdDauF51nMbQXL3UK64fqEsPPss/YQ2tO4I4ZyQujOhm8NyzRauUR
         UEdw==
X-Forwarded-Encrypted: i=1; AKwUvBwRNHaFkIRtSh7EWPgwF6qNfrKh8/aBuAjYLBmdhSVI+71GIT7UoMRKlLOz1a/IvMrbBsz5WPlLmBxJqfg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJl/ok2Ezlc4/8om+gPr5CFzo1PxfFMlNH7gCjB51OItTLSNsLE
	+8qcQebKUQ3cZLX8Y5VDnVvITbKwfJevYE1u94RLloWf+XVpVn3O6e7zybea1BvQSGGCeGTy2w/
	AsGgBtzmoyBwmgtn6yP1ppmkBslFQXhD7gnhCUHLPnbqK16ebZkBN1T7rWjc=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c40e:b0:4f5:eaac:5173 with SMTP id
 5614622812f47-50c5b46b9ecmr21524907b6e.57.1792163523199; Fri, 16 Oct 2026
 08:12:03 -0700 (PDT)
Date: Fri, 16 Oct 2026 08:12:03 -0700
In-Reply-To: <20261016105431.155417-1-krishgulati7@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad23ec3.6814cce4.34c49f.0008.GAE@google.com>
Subject: Re: [syzbot] [input?] [usb?] KASAN: slab-use-after-free Read in report_descriptor_read
From: syzbot <syzbot+bc537ca7a0efe33988eb@syzkaller.appspotmail.com>
To: krishgulati7@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+bc537ca7a0efe33988eb@syzkaller.appspotmail.com
Tested-by: syzbot+bc537ca7a0efe33988eb@syzkaller.appspotmail.com

Tested on:

commit:         d419d682 Add linux-next specific files for 20261014
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git next-20261014
console output: https://syzkaller.appspot.com/x/log.txt?x=124f518e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a61f84753554317e
dashboard link: https://syzkaller.appspot.com/bug?extid=bc537ca7a0efe33988eb
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11ce2f01580000

Note: testing is done by a robot and is best-effort only.
