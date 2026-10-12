Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D6949D5BB
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 17:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791825305; cv=none; b=cnFfMmIwLSPRxzHON9WWWjbb11hU1pq/nwMdmMokv8QvK4qiqfQ53OJNQLI9r4gUGryny7Izt1KsuH3C8IibQSjySdZetLHp+vGqxgu8S0P0oewBFHKEpHUvb2DsEozb9uoNmUV59MWj165KTGmk5itd74/WQY3P01cx1Fh4KCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791825305; c=relaxed/simple;
	bh=3kpHaQTx7lhlVAel3Y6DeuJzjZ/JZFe+SiEHi+HxrZc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=YAsdafk7fssayu0U6+uVXnLa5Le9IZAvZOr2ZdewZnqC4WXmuYLKT+P/ULzNR7YNLc+VEjy8PcK+llXi5dBfM+V26TvfnoHWrze4Y5YrR6Yanyj524hBRpuWAHsS2wtycrNsLnNzaDnx3PXlPejusOSy3sLxtvQk8aSic9Mugs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4a41f46d629so4330394b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:15:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791825303; x=1792430103;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2IIyEQxfHHFBHxgCoJ+BwG8HHgD/6gJXfx6vpwgjaJ0=;
        b=RN8TgQ6yDCPTOjB1yEnvMQeVHfg0nZOsXZQNpCbzKyLPKRgdaqcpWLer1W3J5n7iIQ
         1pYOrwbhZY4ESDKFP4O4MDu8Fg9A78iOqBDPkHkJcGi3fRtxbsUsbRsgKR2RSxxK1/TJ
         zaWtd8VEcetYfz7toXI1U0wWM8wwabjjglNLh2BBjFRdXswzfenfTJAPrVD3EimXkHwm
         BFzZy5/G3OO9pFXI99ZOK4/U97/UZWRphbL0OcLCNZRbYIZyTL63RvHrhUileBGWMyqK
         euNG5xyUmd97dgpSvEDp47/113CtsVqjsKocd0hJSPsGI2mwBP6nfxRdHa7XzKS9bdfq
         nISw==
X-Gm-Message-State: AFq9FYK1F20w1mq9ksE5Vxqjz6YF0FCSk/mppZUd5Ja76Vnk6Rnt2KOm
	DXT0b8Zhqu3akBHhn24ps3WL5Zfg5SZJORcKFwLyOTkSeb3dyCIQKMUrRSfpkaxjp8oHZEJlZgB
	u6qixSsh7w2TZcCWC4nTJYWYrsaNRsbOjfoSO+yDXQMmSUS4acJGaGZfObs4=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:13cb:b0:4b9:e65b:8c34 with SMTP id
 5614622812f47-50c54177a60mr8563550b6e.34.1791825302841; Mon, 12 Oct 2026
 10:15:02 -0700 (PDT)
Date: Mon, 12 Oct 2026 10:15:02 -0700
In-Reply-To: <CAEfrx+Dh3KTQOhuFOJbErSx8Ct8JGExWeEOsJ0EDLUz0mPxb+g@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6acd1596.0e5b5d80.2c029c.0584.GAE@google.com>
Subject: Re: [syzbot] KCSAN: data-race in __se_sys_inotify_add_watch / fsnotify_handle_inode_event
From: syzbot <syzbot+181b8b439f5207144b16@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, spannme41@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

init/main.c:14:2: error: ASDF


Tested on:

commit:         24a19b95 Linux 7.3-rc7
git tree:       https://github.com/torvalds/linux.git master
kernel config:  https://syzkaller.appspot.com/x/.config?x=ea1e6d8de13bab08
dashboard link: https://syzkaller.appspot.com/bug?extid=181b8b439f5207144b16
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12fa25d1580000

