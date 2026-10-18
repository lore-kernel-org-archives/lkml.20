Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77946453A4F
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 09:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792314426; cv=none; b=uJqg/uWecGfTUJWvvFuuqmyS4ZbIO4wrn/SYvjRuWmXs/ZZCS/t5wNiZ4vcK8oLiFyj0Vum1v3+igjOQ+B0/pU9mFV4XgEitrSioLJXfml+toienrlA6LkMlbWU26baR0s+OQdIlDyFpoaXbbxr8JZYAY7ZFIVADIY7JkShNYaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792314426; c=relaxed/simple;
	bh=6GgGC1g0yMHyiDW6Jp4r8HkCT8u6vMquUIYzw9cpJAk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=naSUBTrVt4wTVtuPU7+yv9N3OnaF/v9unD+Dn4fDJo3vhLqp8W9H58w/RD/9h9nuY4yDZfP52clZJQhVVPrTPiM52RiUDzqRfU7e69n+r/N+rJHkj7v/v02e6Asw7BwTgPwrrI0HhMHXcjhgP2W9JqJsCHw0vRMiTUCDl8vgEOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-49dd26d6f07so1469960fac.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 02:07:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792314423; x=1792919223;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mjpp1M6birhVsejB3NAHlFGxEigyUpt24TEeLxwWLac=;
        b=Q2lnYkBMlcD1WcdKry13GZqsdQRxXIF7MTtK62jnFyr5uPWaVUrzOiZKsvs1zdgYUI
         YG++7ZDdv+t6p/6NQRHNPNG7Y9PasOZAFsK/MKKwtBV4ATdEPlpDOeQbsr9u8lGO0FqW
         haeIU456m2uR70CeNg4vhq6ME/iiz7GLskzKjtFJQmXMHM2Gz/Gvy39z9IGXieNpO+tS
         fUOoH65yAC0pjTlnyUMaMwZayAp9hvOSm+g7VOkn+60fEl7CY+1iRHl8fGdixpsKXWUa
         FhfX+GyJ+LpT8sBibIVZ7PyIHXTYjQlwiDc3cQlRQUO9NJy6Huhm2iYgUZmjYkQ1tioK
         NSBA==
X-Forwarded-Encrypted: i=1; AKwUvBzVW2f1b6CtC8xnFw9RKmMwLyvfA6gEEdN5yQMMOvwUjt0vN+yCBn6HXXjg2pfMyGUr/qzmRK0K+nXevXA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJAGbubs3yGD0puoUiP7S3SvY/f55wI4qh57G13/uOcUt+wsfCf
	Ch2FNxoUO4gaU2u92tigi37Wx1IOnAQzvBUHjVX5Msnph3ZykWeccVg5N8rWF/21FC4N2RPnaGi
	oJgcjWT3j/TZLLGijM4cOyg81E4meryJStWP5gwgWSbweWV+yY4uWeRLjFD8=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6c93:b0:4c3:7695:1177 with SMTP id
 5614622812f47-53cc6b00382mr3458897b6e.6.1792314422964; Sun, 18 Oct 2026
 02:07:02 -0700 (PDT)
Date: Sun, 18 Oct 2026 02:07:02 -0700
In-Reply-To: <20261018081320.728-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad48c36.a6d1a155.34a93f.0091.GAE@google.com>
Subject: Re: [syzbot] [nvme?] BUG: corrupted list in nvmet_fc_remove_port
From: syzbot <syzbot+c98b21427617af7f547a@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+c98b21427617af7f547a@syzkaller.appspotmail.com
Tested-by: syzbot+c98b21427617af7f547a@syzkaller.appspotmail.com

Tested on:

commit:         32c52ec8 x86/insn-eval: Fix shadowed segment index in ..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=116f8121580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b38d39c45202f4fa
dashboard link: https://syzkaller.appspot.com/bug?extid=c98b21427617af7f547a
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=125cdda9580000

Note: testing is done by a robot and is best-effort only.
