Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A46039A067
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789464846; cv=none; b=OjEiu92JnV2T6rs4hQNNu958/JPpvhiflIpYSNnBnxSjMEu6DEtJqo9WJOOoXXPb++SfEgaO8xz4j79w2Ex64iyC0oyhWIFcQBITMn+oISghusY2K5oPxvaw5+kiWcV1YqWnifDGJiXWnhXI/rP2RJj4eWXkLhanWnTieMbI1tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789464846; c=relaxed/simple;
	bh=ITsZgi1YeB2uT9gqXz3oZjKqmLzfBrXkflvXsOEWnpY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=mRyFaowshThte/aZHNXnc5zysx8PBJVK15vGU9dILKR2O09JGHQVepKf3U/r9uqmxGWGcTq2K/QSo+PPMWY8QzuAFL3X+dT+gGquyEp7gTPapwHW53NAFYFYjCFZzGIzo1kYGwDUpi4Uec2FPsWvU6hwxcMA8n3I8QBlQXtBeAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-8076c66efc6so3350609a34.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:34:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789464843; x=1790069643;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=snE40jZ9NmXSqAesA4LAyN+NiOKNata8PWiBB7gvO6U=;
        b=YEE1lBTSctJFUxw3IoPSvfNFLvEMyYi9LkwG4nJGTbe5781yxMq8BkwPJIZnLR4TTC
         EKN6FLMHT0kcfUu28q93t6gj2vZMLo8x+fQF7ZvzdzxxY9VVLq58ZWnP1u88vADEUzLT
         gol8cn2YeAMO2nOsqbgqG2jhzqUR6CaghdYNgKs+PJEia7ZO+QNUEKs78C4dXLaE+Ejg
         S9iiAwyCqNpJpLsnw5nkaqTdsghNyeNv5Eul7k/JLGsr+IqF8jCOKpZSBGXLb49Ta53E
         4BPbPNNjW4vvtDdlD+TbgH2V8dToZOqMp5O35i9UemEyrwcAipHFAsKPaviilZaavpIm
         5/1A==
X-Forwarded-Encrypted: i=1; AKwUvBy3Xdtkfia+jDMi2/8bDz5B/A8+LrYvev3Dh5m4UiR3y6MgUxR11bKT3SMtkd9MaKCZRxOPv/fDvUgG6kY=@vger.kernel.org
X-Gm-Message-State: AFuF++lGOTluYQkri2sSIHtMC0Dcpm+DUZNdfrKfGvdDEcsXAeYmOXCm
	O3tQkXBhb/PiIY0/c8EKAq2ShKby21AoVsIeP+n35XIGC9eSiFJVpW9C4+69B+2FfP8t/Gowha8
	lkd7W5qxRRdD6MVWM3JcsYh2mXPas+div9tbzDe6IkzrUMsqWIow5o3Mtn3U=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:220a:b0:6b3:697f:9f1c with SMTP id
 006d021491bc7-6c5401806d9mr5954624eaf.8.1789464843315; Tue, 15 Sep 2026
 02:34:03 -0700 (PDT)
Date: Tue, 15 Sep 2026 02:34:03 -0700
In-Reply-To: <6aa8a19a.a9d33702.1eae08.2bc2SMTPIN_ADDED_BROKEN@gmr-mx.google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa9110b.4c28b7d0.c1bba.0033.GAE@google.com>
Subject: Re: [syzbot] [wireless?] INFO: task hung in ieee80211_register_hw (8)
From: syzbot <syzbot+c92af8613ad38696ff09@syzkaller.appspotmail.com>
To: jchuang26@m.fudan.edu.cn, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to checkout kernel repo git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git/master: failed to run ["git" "-c" "core.hooksPath=/dev/null" "fetch" "--force" "17ea04619614dbc19af5319a14e2d91163abd37e" "master"]: exit status 128


Tested on:

commit:         [unknown 
git tree:       net-next-old
kernel config:  https://syzkaller.appspot.com/x/.config?x=ba53f227359c9d59
dashboard link: https://syzkaller.appspot.com/bug?extid=c92af8613ad38696ff09
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=165f2115580000

