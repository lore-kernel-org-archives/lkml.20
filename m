Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A88230BE9
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 10:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791022024; cv=none; b=nQgPWAYnUqE2kouks3qXd+r8SfUMgNy0jLZ9EBXNOuyabRQdT/RyJYSJ+M8l+yz3likTKbPX9RVdvWtlFjltJ4pl7f2RcIemrVenBxoPHfPp6T3lTbBklOSVh4ueP1m9EMYy6QqedU5HjP05wy8hpypYOC7o1U5LwecNNW6bZsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791022024; c=relaxed/simple;
	bh=N/0rct/5wUZBPFMlxj4jSoXwNXbWyxJzWcB7XZyouP8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=NMiQo4wlApbLEqfMNRRgWC9+ZoBjje2U9+nKVDxT+/UniyzLPF7YK4Z9h6tXG71qXIVRipMOHgJVsEuQG9zlq4VofAVktR5Wrl1CP+IYwGX4PGFtJMdfWgX5dBCwcpbyOcIqgkt745Xp/NzQ2fgDqrHliqe+Ri56fiJL5pjS4M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4ab260600easo756049b6e.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 03:07:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791022022; x=1791626822;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qp/n6rtFeunCkM9NpTFFEPZi6c8VNIYIKHo9MOMSGFY=;
        b=c+8QS8oxZ/VXkMKP9tfsX9Lr1QdN6T21+R60ASrBK0oeg9SNZuQnpuIqrktJL8lX1x
         Fw7Z5FwRWqjWZQiR7FjGiNIkAoYVDkIA97fCkoB3+pRl1NxMp3ADZ/v9MnuvzhV+Mzc1
         932JKjds/Qmc4rn7nmyrYvgoXBK2F3oovn8QkV/NQY8S3p5xYjyfujJgZnMwUvi2KzWW
         OE22RWdd/mZVqS6KACHrHUN83qUdFPsdQQjnbefwMGM9by75zJ0xKEAqbAfGYOLuHba8
         lMy4yz1ml/mOsNdIGhKJVz3EycKrSSypUJEGlMcgAKSegfJFh85hZDwEAipjS8kQx3yv
         mwHQ==
X-Gm-Message-State: AFuF++kw3AUXWZvIlO7ooTM4NF5VNZXh+pO0zMJfau7ZWkbylf+JrrUt
	jztG5J8xLGFxhEHyms7DPD6qRW4uqUTs1c8BVIHMiKZsoZZd5HF+5C8TxGNY2qd7lYek+cnVcda
	UQMf2OoWVvsrF7RAYODi4TPuqUfAqfQjki9SYQgmSLDor9rnnD4XGerub3OU=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:87c9:b0:4f5:dc0d:e013 with SMTP id
 5614622812f47-4f5dc0de3edmr1877890b6e.4.1791022022304; Sat, 03 Oct 2026
 03:07:02 -0700 (PDT)
Date: Sat, 03 Oct 2026 03:07:02 -0700
In-Reply-To: <20261003100515.1554-1-rajojha047@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac0d3c6.9ad129c8.3858c0.0010.GAE@google.com>
Subject: Re: [syzbot] WARNING in wiphy_delayed_work_cancel
From: syzbot <syzbot+e9cbd080a7801f06cf08@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, rajojha047@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
error: corrupt patch at line 19



Tested on:

commit:         e767a4ea Merge tag 'probes-fixes-v7.3-rc5' of git://gi..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=ccca94d2c01b9e78
dashboard link: https://syzkaller.appspot.com/bug?extid=e9cbd080a7801f06cf08
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=143b07f5580000

