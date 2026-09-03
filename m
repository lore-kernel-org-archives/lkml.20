Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1194E412C06
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 10:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788429666; cv=none; b=n+C+T4Ez9kTNuPLw5wtEiA/uOp0Jct9rdaP/3QNJi14wOFVZyO5UsJESJA2/NaXA2JZuhqiQ9fDirET/rj5Xo8jtCM1UZiJzKY2I4QM2NKQj6PaUw+GaKXdPr+xyQcNT6elux1MUJIHkg7jRQD/PCWOncT8MgbfePyfUQlK1T3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788429666; c=relaxed/simple;
	bh=ryInLUjJI32PSk+T2NMhpSbpKFvxq0wpSaolLnU3XEs=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=EMd+sySf2vsk3eCreXI+0Bi1Qf+OnR8eA1QgXQixuihX4kCILaJ+TEIU1f9N4LgCo35fgGkFloIuay71awH5zmeBvetwOjPEtkkXNyvRbhfIaWbnDWWbRxtaLtsokke+1xzIZh+6hUiNBkYo9TiKsa6QiNeKOeJ8wSUnfQxpAMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6b1c1538784so2136397eaf.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 03:01:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788429663; x=1789034463;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5+izbsP1CRuSYp7hZOU5ThuvWBJhaTYyEvZXcdhmlzg=;
        b=ZCNaD5xGAVWJr2AhJAxU0XIcmLXa5jUCfJq9QIlJQIBsSNJONkxbuORJSWOTGCdItT
         7vutcuyMMa1DNhjgvzWy0/4cKR8Et9Qc4Z2Toeh97uIan5QKfG98xiEboi+p8lcov1gY
         WrZg3RcOSdKukDYqv1kTqmmEgcrYdgUvXp3ujHSdk15+rXT6424kqgzO4i9Yj2PurzWM
         57KpLT7IYk9e7NUs4xI0danGrsY+BolT3RgbBmmrHfBJGiGc1DPvIhAwGzwKnQU0tjal
         4TEKdOeN7iVkG9W1BsqXdpXpSy/p5KMsar2lE+TFqbbuFn3rhpP5py/Z383r237pTeoA
         N1pA==
X-Forwarded-Encrypted: i=1; AKwUvByoe9GdN/2M1wBDP4RRI3BcHijs3W7ayUGGmmmjKw0zRPyZenCI3t6vT2M+3xP4EREbCHIvRGSBQg0HaRA=@vger.kernel.org
X-Gm-Message-State: AFuF++k8Ql3WwDEWacuC+Scs5olZg06G8WBYbwh57uza/H2xmOr61Jo1
	PAvTEgZN2m4SO1eHPW6rAOIcXl3obkV72R2VoNoT/Trgsc6SiR8y/jS8vIesoIHA6/P9z8R9UrZ
	AYtS4hfA2swq/emJw1wqhnzPmGUvrmalpo9aaT8vXrB8TghcZ4kLgDmFCg4s=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:f004:b0:6a3:1dc5:3570 with SMTP id
 006d021491bc7-6b47eed58c0mr8176756eaf.31.1788429663005; Thu, 03 Sep 2026
 03:01:03 -0700 (PDT)
Date: Thu, 03 Sep 2026 03:01:02 -0700
In-Reply-To: <20260903112417.21b76017.michal.pecio@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a99455e.9266084e.bf0d7.01fa.GAE@google.com>
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Write in usb_free_urb
From: syzbot <syzbot+832ce9fa3face1b7d44d@syzkaller.appspotmail.com>
To: bolewara@gmail.com, devnull@kernel.org, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-usb@vger.kernel.org, mchehab@kernel.org, 
	michal.pecio@gmail.com, syzkaller-bugs@googlegroups.com, tiwai@suse.com, 
	zonque@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+832ce9fa3face1b7d44d@syzkaller.appspotmail.com
Tested-by: syzbot+832ce9fa3face1b7d44d@syzkaller.appspotmail.com

Tested on:

commit:         940de590 Merge tag 'hardening-v7.3-rc2' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13da7c15580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b454dc6b1b7acd30
dashboard link: https://syzkaller.appspot.com/bug?extid=832ce9fa3face1b7d44d
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15527c15580000

Note: testing is done by a robot and is best-effort only.
