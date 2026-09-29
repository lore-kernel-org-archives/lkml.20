Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD773A8753
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790669930; cv=none; b=KeXMAa63/E3GszfSWvePcB5I4VK8zicBgjhILG74dW3aBfjnaRvgBzlM/DBAv1TDIOwc2wNLsMwCrFuqVbzswgUBYQvIFLf4WLrnIjPEzekGIfSvcaNFxN7RjfUlwDTKzCYI1QtsYq5O7JojAZTBHhkk3++PXxwnMFeSNfKQAFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790669930; c=relaxed/simple;
	bh=etj2gSv1e4jPIwzchPLq5IDlNmogc2GB0Fm40qdvNAc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=HTQGRrBKXg48DjNl5Fl5+j+wGp3GKTBdc8b7EIHXKpI6z99pGMsvd0i96/hHdc4mWdMPb1xYZcIlffaZJiCTIGKXjYz7jfjlMykx7nxYXZDPnOc50m8/zarYCoPC9XFAK4g5aQ44RAWu9L5/ldO4LtR4XdgmyVZvVcywYk3lu3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-482966c4f4fso1032930fac.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 01:18:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790669928; x=1791274728;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0mM5XT5JoBESVDEqE2RGrxvjspivnon60YLp51Eb130=;
        b=0R1dAhPc91sBaj+R3PYMweRcmf2GZnh0OxO7aZYQri6XcH4899W8zMAGQiv4sav0OF
         fBKSMHI8nYGyvoC7fafv7DbeCnlFJb2h2Xtgqknxtu40GvEl73wlr/ZFdvwDEJcOoX6i
         oEvPP8wAkw5wTMLeBNgWyhOWUVhdkC0vzAMZG0ruwKutz8wlyUnLTFq12heN8m3vcZiu
         ajc+obXY4YaJXk+k9tIkeBh2MlCjabktyeh3cLjeRnMthFwThdysNUX946ASisJbbQ3r
         IiSJqqfoxer+H4Mf1hL1R6uyOG1v7iezoo7XRrh7zNesK6JDbOeVmGTirLBWHdKVsFEh
         NJ6A==
X-Gm-Message-State: AFuF++k3kVQFqEqvpbxdGkSKOkYIv6oAxc3/wTqANUTy7ERrLdN6OmTa
	fPVCeixLlLj7+6ADvzZzSFeXgMN6P1YOHz4nkBX38xvv7e4WEV0uQ5dRa9KGsskIvqIFXM1oy7p
	xJDPUlHYarEcYxa4PmRksJ9eZ/ybyKjYyp6S05iHd83dBstilQeVuWQaZMXY=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:15a2:b0:4af:aaca:7be3 with SMTP id
 5614622812f47-4edd8a63ee6mr1244249b6e.12.1790669928078; Tue, 29 Sep 2026
 01:18:48 -0700 (PDT)
Date: Tue, 29 Sep 2026 01:18:48 -0700
In-Reply-To: <6a85042a.4d75e56a.c9a88.001f.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6abb7468.69bd487b.a6f8c.0010.GAE@google.com>
Subject: Forwarded: 
From: syzbot <syzbot+e39090bc9b3cf457717f@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: 
Author: nogikh@google.com

#syz invalid

It's using driver_override.
