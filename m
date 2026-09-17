Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8ED3BAD9B
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789618506; cv=none; b=FL28T6kS92WcWAW8zc8L0v8X32b/PxWnMnYTaey6AZDquHPX+Dm8ZWh99F3tSt1gRama7JoteAr3ye53udscd81Jx5MGGjKDIcmvwZd5MpNRcxzPrnrKnjQIjJMdqJB8/lUse9oeMcfajD9ha6u5GFl1pk//SOQ71ewgKV3Z3i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789618506; c=relaxed/simple;
	bh=mUNdLJQTkJSl5P8tRqLjDBQm8g++C7BTfZLiOHJxsrY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=EdQq8Ty0R344E8Rc2qf6xwCvuc12o7LKxuWfDmGVPJtrsyMSC5Sniei9pRjdKeG33ZbpLyLLGLrZTmLpFLPyUeq0c+bqRAs9SXRLwl8tVQlH3/N53vGeuqEa2H6wBdcjXkdy/O9G4nRxDp2xX3lXUs96uBxz3EUy5/K9sEw2I2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6c07dcbe60eso474915eaf.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:15:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789618504; x=1790223304;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=c3q7pvy0kWnNflUEFxICrdD6rZ/0/PXz0z8B3GwVfrM=;
        b=t7lwWsJw75sKzhkyYD0ylql/JSoN/Ktl2J/Ekk3yFxwwX9mlTv+Nbw5N9Gkpd6velC
         CJwF9p11T+DiVopmJ3ByzTIAEdz7+Wp9SJhEtd4w/8/SG6cCpCUIG+F0vvbmZjIuJ7RW
         E5vFu0P5pQrTdGOIjw3XDZF438Q+afN62XU32q4UBAF4kn6H2Lsrwwdywv5xKS8p2zvq
         zAPlPCtZ8WOEAu1+ZLexn2G+ANyJ2jsEjk2kx0v18zhxIdlVLpDSXWQtw+e3pkkSbMfl
         6eGYSmFmTNLBkDNwO3vkhH3pD+xDyv3yQXf551dtwY0VCzeup3l1jf51+K0HJUh4/k7G
         wO0A==
X-Forwarded-Encrypted: i=1; AKwUvBx2ftQ4lANNCYOgzKz5FbsXBRva9vohhcf8PusrR9qipHIv+YTlBLpQmXgyPzPrTRRm92tXRD1fI0SX8Yw=@vger.kernel.org
X-Gm-Message-State: AFuF++ksVirQwdJbD03J+hRu0tHqv9/M2DeLogs4dlfPSF5RurzAZb+F
	ibz1EH02JWgFsmOErLe/o4AIwmpew5XZ5ri4UbhC9B6Vl7st3U7t8YoOQfmy1r0RTz6FxDudYYS
	w/NreTwiG1xRzitz/GAkdD2igqcXaKbW5qe7NP/hA/mYklZYdBoMwE1oYKjY=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:80c7:b0:6c7:af50:b2ef with SMTP id
 006d021491bc7-6c7d3404f25mr4946442eaf.36.1789618503864; Wed, 16 Sep 2026
 21:15:03 -0700 (PDT)
Date: Wed, 16 Sep 2026 21:15:03 -0700
In-Reply-To: <20260917033925.981926-1-eadavis@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aab6947.b398a7c9.1f86be.0010.GAE@google.com>
Subject: Re: [syzbot] [ecryptfs?] KASAN: slab-out-of-bounds Read in ecryptfs_verify_auth_tok_from_key
From: syzbot <syzbot+b9529ebe6a9394ddf825@syzkaller.appspotmail.com>
To: eadavis@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+b9529ebe6a9394ddf825@syzkaller.appspotmail.com
Tested-by: syzbot+b9529ebe6a9394ddf825@syzkaller.appspotmail.com

Tested on:

commit:         f6e7b42b Merge tag 'sysctl-7.03-fixes-rc4' of git://gi..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=126eebf9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e909ffe6b35dddb7
dashboard link: https://syzkaller.appspot.com/bug?extid=b9529ebe6a9394ddf825
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=177f93f9580000

Note: testing is done by a robot and is best-effort only.
