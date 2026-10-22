Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792689606;
	b=DnbXMjqRQ7w0Hjpj/Vem652v/JUn6T2UgSVGFobdGPdZVAKKzNWB7SAtaBjDL4CXxtNs
	 AxhQHHWzPj3G41uTwYsH0z2Vy18XfYDL0Elfi3bkI1cQ5LO2PIR1Vk7h/NnjzsfynCS95
	 Bb0EhEezIu8jaV3haCgZqayL8iJloJAEg2wLcAmduotlHaSrQiXvPFA+Uuj7WzG1f5Ii+
	 cU0jDJF5CpsirimRQB8WRybbz3FhQElwsCLUq78DnHMz5AOCFDjUtPH6eSMMn+PzJzwsr
	 D/tIZ6a04Deueo2l453E+G9/jZ4jlblivFgbwNgzoGP/nBczMLGDV8T8JpfTFmhOUwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792689606;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=4UT4wBei7lo5P9ke+g//ajLXiPvxYYsQ7T5yHwgF27o=;
	b=TX+88WOmOvqlplxmKY9m5Ng4bjuWQYBUkNIlLyjYCPlEXTBnmobNCzOw1hDwiYXYaXCs
	 a4ZgXToaOGRuja7KoTDNBQT/qFxubJNfrNSQXrsvwgR3DByvrRJIamu+61CBDf4VzVbah
	 ufolebm0GoYJ5xyLpXhAf3ak3l/gtMsS+la/jYoOUJ3pi3W6/7z5yx9lAOU7m+vu4uRWv
	 ju5+7LN9hlH8OtrY/7lXU15n4mJtWSs+b+O2Loz1JznMZ9hmh1rOAA+AVZXEDjWSFOpxd
	 g8mklyp0QZinpuyYa2aDRP9NkdbY5pD+cFsvBhUdLNvYAILVkLPpgSKMjD9xPlqfvqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.70
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43143606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:20:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43143606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-81b50ab16edso2710046a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:20:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792689605; x=1793294405;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4UT4wBei7lo5P9ke+g//ajLXiPvxYYsQ7T5yHwgF27o=;
        b=XJVJAGfTrAJSEpTtNSZQYV+DeYLt5L8dooD6sEw4aBGskZnkQWRD2p/1t7+DEiXIv1
         OldUPjGxyFjIueR22kmkG4j5KH8lqyI4NQzFJdCb0HnZVFkA7M9f7IAw4rlMyq35xA+U
         KeER3++a+IuAJ5CY4byA5YmX0ouIa6fdexfHXk9VkoeEQGJdOFfdYm2DZXqUqqhoyvL8
         KNdmubX5CNDI0TkafER/cnWfuxw9g7W/tTfrt0h5da2hOpcOrG8dQU5rtNico+NLvqm3
         0fdvcopvop3gM5HJJF6VDL6O18h+nsnjmbV6bZdP7fLliELtIjbcyYWjaaKiYI5Hvj7n
         t1fA==
X-Forwarded-Encrypted: i=1; AKwUvBwJ3Gco1AkfOscHefXMlM0Iu6wczVVE3/R9S5xakL4hcTK+llj+Gnc1MlULHgIe6ElLgxC9kqKLluB2IRI=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+DyCL/7RwIve+B4FnnMyH+QrhGp2YsbBOBm8xvw4woFj4d7Ei
	XWybMRxY+LG0BpWVRs9foQJoQyQCVemFFi/BrwonbtjZHwQpkR/6qtyY5nz3JIZaV3mmrXKgD0t
	UCt2CgmJCFkeLId8E3HgotNQcCN1Qs4CxDnOHtrPjwCy4spLkIExqZs8MXO4=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4fe1:b0:4f2:f229:1895 with SMTP id
 5614622812f47-5535c2846ddmr5380130b6e.43.1792689605345; Thu, 22 Oct 2026
 10:20:05 -0700 (PDT)
Date: Thu, 22 Oct 2026 10:20:05 -0700
In-Reply-To: <CAO+rqLgLRszT2U_x49hYVULuJ6Lm-80EdokzQUyNO_mECKEvKA@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ada45c5.d1c214cc.659fa.00dd.GAE@google.com>
Subject: Re: [syzbot] [netfilter?] WARNING in nf_flow_table_extend_ct_timeout
From: syzbot <syzbot+521f7e7e2b974abde99a@syzkaller.appspotmail.com>
To: coreteam@netfilter.org, davem@davemloft.net, edumazet@google.com, 
	edumazet@kernel.org, fw@strlen.de, horms@kernel.org, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, mike.michalo@gmail.com, netdev@vger.kernel.org, 
	netfilter-devel@vger.kernel.org, pabeni@redhat.com, pablo@netfilter.org, 
	phil@nwl.cc, stable@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to checkout kernel repo git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git/main: failed to run ["git" "-c" "core.hooksPath=/dev/null" "fetch" "--force" "675adff2843877c2da27b36b2517f827bc9915ea" "main"]: exit status 128


Tested on:

commit:         [unknown 
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git main
kernel config:  https://syzkaller.appspot.com/x/.config?x=c4b098695335c89f
dashboard link: https://syzkaller.appspot.com/bug?extid=521f7e7e2b974abde99a
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=115f4d0d580000

