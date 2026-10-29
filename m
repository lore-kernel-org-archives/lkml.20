Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793282286;
	b=sQ/l/S08Fyd4FXkyQ3r6lNAnilHqw/528VCAk2EalLxS+R63SVgsSXSA5Loz37BN/66e
	 zjmCucplp5En0qDtLMvg7eiDjQcoFdQzcvlU59N3pl9ZQQzX7N4dnBz7GGKaUQvdKOprI
	 7BBF7LcdQ+HRCgnOeqm3ezuRuEgw/3Jv4XWNfOzCHZLfZ+bsanQn2/GYaY2i+L8MKa0+a
	 J3x8CVImbPF9cD5tqhLWG7/lIrZkFJ9NG7V/ybTcOhHzx9qfJ91gNRWY3j6vJq03WjGmh
	 qRnOmh3SolWMK5KZ3hWSD1rlxaVgXx+wuabjazDYiz5BGc1SF63FaDETqpaLB/XI9GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793282286;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=oPbhoST7mYqZLrYT12yNmQDQVwGK/3NLJQafgKZUyOc=;
	b=RRXutu6vOPsczFC1qXQoo1hSMOxWx62BzwFBmLXoIc4zogpN7nXNjF8LlEspive8FIYZ
	 B8rhUVCFIwWcvsueMoXU+BDI3FH4weQ7OVQqf2tRhlZV2NRebKnOR8fuIHivAarfmyl4a
	 +rv63Vfgi4XiTOzyA3yTWyL0c+B7ihvj4LblDPSp+zIBmRXHdWnTh5+MESaicrA18tfNh
	 waPo8ZcYuOkHxPmixZ2orYghcCPLgzsrtqtCy4pA+AQYplIsShA6tohKk5ojyfb8COuku
	 wQBR7idfgZ33OM3z1vLomYqBG1HROavOOXuKDBGTsGHYqhZ2W9ZLT8l2RnyXsVGT8Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C22606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:58:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7C22606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b597558c4cso3108146b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:58:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793282285; x=1793887085;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oPbhoST7mYqZLrYT12yNmQDQVwGK/3NLJQafgKZUyOc=;
        b=wX3ivb9u9JIZScm0jKRxZy2061FCzz3QhRXgTnbss7wkBpgHWGiN970jl93mZH+dlL
         wzE9lMmzUgjNJaFhsJwcmeHECuZhwl63FOyUoI2Fn3uMGKepakLppug5rUDjuU4Ac0Wu
         IuZg+Gf96Ec9n+3Q7oOz/ZsZBIqN4Bt+Ocw1tCLSvPypeMF7QaozN0RHBqzRy+SoCclA
         map213rdd/+yYv4hJSBgUJMIqvByfdkbi7Y7+a/svbW5rANPdvlIrD0mopvGIWD2CGQ4
         KCzipZTBeckPmoxmS/7YkHBr9xlPYky+hSdTdqfddeOlByQMjDtOyKhvv9Yq94UYivyH
         uwQQ==
X-Gm-Message-State: AFq9FYILtCYQ8NWA7m4WdBUF858wOSlX7HNQXJAiU8SJrIB1kaDxAkhs
	PSeHcvNhgNrvs/qrlJc9v9CjOMtFDZAMc6Da9JhmTWj1c4+ygMGnn3ITYgludPz0f40m7fdcKMo
	e64PKTfvVTisjrQOpUj418tOdDkUbaw/iSyhLEX8KlHaFvhKUaRHaEo6cfW4=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1998:b0:4f5:59e4:a8b with SMTP id
 5614622812f47-563a3533159mr3470443b6e.58.1793282284877; Thu, 29 Oct 2026
 06:58:04 -0700 (PDT)
Date: Thu, 29 Oct 2026 06:58:04 -0700
In-Reply-To: <20261029135633.206144-1-omermetekaya0@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae350ec.55b94f83.31f4d7.01a3.GAE@google.com>
Subject: Re: [syzbot] [arm?] BUG: workqueue lockup in batadv_tt_purge
From: syzbot <syzbot+61b202fdc410840f0198@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, omermetekaya0@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to checkout kernel repo git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/master: failed to run ["git" "-c" "core.hooksPath=/dev/null" "fetch" "--force" "f569e972c8e9057ee9c286220c83a480ebf30cc5" "master"]: exit status 128


Tested on:

commit:         [unknown 
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=26d6221a572842ac
dashboard link: https://syzkaller.appspot.com/bug?extid=61b202fdc410840f0198
compiler:       
userspace arch: arm64
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17ca9b8e580000

