Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607C72931E9
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 00:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792283405; cv=none; b=M15tVfJ+XbATUL/GANphdk5eKcox1sP4nQeKDj2LIJnrv/mWCzHN+PNwMCdp+lw7Twhx8zE8uYYx6PANMTs/FgPnqvAuIvPUfnf2zY93dVLh0W1kVJM/B8Q4IGoOT+PRHaE+WWUg+ZyqF/76XECoyat6Xo7NkrmtoZllBJzefeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792283405; c=relaxed/simple;
	bh=+ygMTJzw6ClfM00LImARfxorTZJZ8Szh1xobQAQvfew=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=f8KUsi8Ma9+fxv9rhm+aVkVQOCMNkfyefXgXitBRTGiVPIlRLQkL2x7KR/iATjzLEBY89kfn70qSHvOKvkJn1OCwTovGmOvfVVENCyWnF+CeDH9D2MOOAowIY+nNR0QfucTQTwybA0usg2BcFs4ssYZQ0Az0XxpPQJRdMpqEeN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4a45b3f0bdfso1685712b6e.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 17:30:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792283403; x=1792888203;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+odE83EtqGyxZPWxT7Q3Fx0iSfUuBWAZA1y0Z+FPAHQ=;
        b=YIempfMzFFRRy324Vq12hSutipbXhvUWuwKwZWQ0RB0ebP1VnhFbq5SJaPgWJ8FSm6
         rHTRdayIcZQUECf+7RptzQgB8YwJXttxWuvsowncpD0xJdWxsOABuotN1Pqy4aFkwORy
         +WKoigTpPQ31d+MhjKJD0qnLHbp3JWwgnTzIC/ibHp6/0kZPLEzqC9GWbrVA6FspDmyX
         SbLD+3qxQBRP0p+5CjwCCF0XXku6fIn6hmL1Fmmazb2Kw4QSFkfdbdX5nuO6dKxD+UJX
         MlX3TNOw4q1hAjbT2lrx5+tPzPPlJ3FJZMWhX/HalhKH5JdgNRmSW6ZxN2ikeB+NcQsk
         V/hw==
X-Forwarded-Encrypted: i=1; AKwUvBwP1wuxSU6G4zfctNoEuANQsTEvndvqh3dAYCUIIZsrNIfN8n6BERtggD5LCs0K3Jchwe0M5aFLqM4VVMU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJb4nAMvdqkmKLFvtLcCDqIZrdj7cR7DjVTg3l4O3tYYQcEH7by
	SZasBRtdCMGIIWisJ7C/eeJGguI7eP5mE3G2lET383rB8W0IG35Vdq2hbZHjm8jV2L9YT3zVzCn
	ZTJuKlcgfrDOnBLRBBYCLHAiq06ZPoqmHWrvPtsvNu0cu1IL7u/E/t1+whbA=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2387:b0:4d6:92d4:c804 with SMTP id
 5614622812f47-53cd20a090cmr2778395b6e.60.1792283403194; Sat, 17 Oct 2026
 17:30:03 -0700 (PDT)
Date: Sat, 17 Oct 2026 17:30:03 -0700
In-Reply-To: <20261017233219.7632-1-kartikey406@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad4130b.7f4e89eb.3d59aa.00a4.GAE@google.com>
Subject: Re: [syzbot] [mtd?] memory leak in phram_setup
From: syzbot <syzbot+c9d8bc9f8ccc03799e1f@syzkaller.appspotmail.com>
To: kartikey406@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to checkout kernel repo git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/master: failed to run ["git" "-c" "core.hooksPath=/dev/null" "fetch" "--force" "f569e972c8e9057ee9c286220c83a480ebf30cc5" "master"]: exit status 128


Tested on:

commit:         [unknown 
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=eeccc827207f48ec
dashboard link: https://syzkaller.appspot.com/bug?extid=c9d8bc9f8ccc03799e1f
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11f36ce1580000

