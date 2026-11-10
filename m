Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794315435;
	b=d3Y+RwGlvD6kFoyfVxmPSl1rw86mmD8v6qSM/gcXQkMcP9ZO/qZB/OebN1hnEqB+4sJa
	 Ve0aq5FmySYpftO8zsCuC9esidVq/WTUiMLrU3u4d5sxg1U1+IG4uN4k9J4lDmCqH3ofT
	 7muBx9L5r1xau1Ht+E07omcTzyZfDdvc8DSKuIg/1CDHat3Pz7Ywl5k6j7spJh5k7S4pj
	 +hrR7ILshAv1mq17NmE4hfwIJgxKuExVYEXp3xW5deMsqXKgjesfsL8SmpwU3Mez31WNE
	 bcw81Bhc0vE8WQzIswZ3AeCFoijJsJagoqz5f3FQYnMoL760BCgTV7NagkSCoIp5ctw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794315435;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=PmJW7Pt3s9eC3bn7i9hHhmRMlytssh1J8f7X9MXCErM=;
	b=FgAond0WRBqC6cttlNOrvcD7IiZwIyJLpZXuwXb5TuQ4VxzdHrlB28QWuj0+5Le3Ujuf
	 K90lHkBS7uj9ko3RBhkXf1vcaFVX64DUSydw5tddO11kN4SaPYO5cHYRyYUW1ca0smhEY
	 b7bC28QkeXV4e9+OfbAyVqfQHObXks0rUzun+1XHiN+lbHPeiUl3r7GaiKP9CiQuewMhn
	 Ej8EDDC3vpzNUmaLxVA8U7h/WVsfbCnh+wdq/7jjLaqf7DZnpIXqq77nF6Nqa/mWgsquA
	 TjLLRDW53BRfWFP9OgXj7AMNYsMyh2YPzEjxpDXCZnQlD8X8TAzG/LljPspRFh+95Aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.70
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589FE606F15C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:57:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 589FE606F15C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-8488f31d754so1300221a34.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:57:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794315434; x=1794920234;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PmJW7Pt3s9eC3bn7i9hHhmRMlytssh1J8f7X9MXCErM=;
        b=Azmpeze8mREptQHoHDfbT7kpT4qkEB4UV4GMY2c/m/is9xztzBsyRJetKRkP9jhEOL
         GTrVs4Q5DupnKgnQWN0DTtBziUiXO1///Kt+aL1m7ex3OOeEKYGY7DkJQu7HxnnYdzn+
         dmPY+WrVH3hHp/+wgg8MGfwQeLGDhpD2+rSKFsw03UcPkJq77m2AIukv7b/vMhq1rt1R
         ugKtNG6rJPlDjfAmI/bMg68K1f3KhXl6Xd1mhPq0ernFzRG8qrZ/RvHAuBa7Ucy/AnYG
         OiewltcWQ26/ry3uM/03TVv3JNd79VuKdfBoqX49WjMfRkm32XcjbE47N5Gk2OkE3S0A
         5ViA==
X-Gm-Message-State: APuU4Z+v+0ffdl4/YcJdEMQ/8Poam5p+koj5ngVkQMeVelna/HnoNKvk
	MJQFOX4H8+G+yJou3oBDRT9YP1Cbjg5rcoOHCnpSSYeKMsGfDLdSX5R9U8J1ORR3dlqph/IIk47
	CYxDZYPrtHvMBgjU4iUcpQzAqN7WqOdx7joXZ5hg5faBULM4/cVISHAC4f6E=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:151e:b0:568:cb7:9a59 with SMTP id
 5614622812f47-5683cd8d37cmr1845835b6e.51.1794315434299; Tue, 10 Nov 2026
 04:57:14 -0800 (PST)
Date: Tue, 10 Nov 2026 04:57:14 -0800
In-Reply-To: <6a8c5208.dbb3a75c.7844.0005.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af314aa.6ea51c61.3838e6.000a.GAE@google.com>
Subject: Forwarded: Re: [syzbot] [usb?] [input?] INFO: task hung in usb_set_configuration
From: syzbot <syzbot+c22bb42560ec86726aba@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [syzbot] [usb?] [input?] INFO: task hung in usb_set_configuration
Author: gbughunter8@gmail.com

#syz test:
https://storage.googleapis.com/vrp-syzbot-rce-842629920185-1108/bare-repo-host-google-chain-r2-1110-7e78fd2
7e78fd281eab187ba196dd7327cacc871eddb372
