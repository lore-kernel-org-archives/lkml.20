Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793128085;
	b=HGi3jzDtUwFe9k7A0Kpo3bcEyclrzKa21+47o2VtbX0Ia3lnnkiddfv244hgV32s0VQZ
	 wFUc5s8HiqX26Ow8Brvhy4327Wo8LM/sG/ckN3rmV2tnbv8Yhz1c8PKbu/65WNekRVei8
	 TO9luMhdspAO5LLVCNyiQ5E9/og5bG/uLz/+Yd7C4Q8Es1Untwjr9DG5nod7vYMUsI9BO
	 zoIMCmh3+p98QcK8mG+pd5zWjMLMrqW9/jie1Fzi5JkkvvHWtiZdcwVlwzAsHYl5ITFd1
	 /Z0c6kwPtUDraXz2Ze4A/dNGyig2XhG17GuxmBpEqWm4yTxOZr/2b1NkpIOGPIMv4/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793128085;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=5zUcN83L2Cjf1EiXL7dGecl6Ip4FwT9ViSwedJR68f4=;
	b=zP6+dPZU8W0w+uNgjLGKeMvHlVBOnmVJYdr6Rnmhj7QmMpJAzmvL4Ut5GegWtxFV4v8/
	 3cgLcVnnJboBqm1qNNj3ZH5fC+U7OyBphMuFiPYsTmCRnOnFpXFOHmmZLYvgzrYg7t59R
	 LRlQnAMQh2JY+9JkMVa+XFyeEKH190EtxU/MgQ6ZGSMRECVtwb9Vr5GTicuthoCudOuty
	 Z7+1s9UKcYfKfD7+l21IEh54l3zPCHzFmfKHyYeTjh8zj78QEGQrwnJon25VaUQyIgjwK
	 yyrfIj4/NoiYY7HeJPVSXKwXJ47/MVWElNKJRKUVm7WJrFw3eROi1aAxeCW/0+1/KLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.69
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDE3606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:08:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FDE3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-843c6807307so277967a34.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:08:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793128084; x=1793732884;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5zUcN83L2Cjf1EiXL7dGecl6Ip4FwT9ViSwedJR68f4=;
        b=hl6glckTdzqZvJfHop2yJqvF0CPE0jteqCv2gHuKtADN8TPN4JnY1BaWy4gwH1Gx9x
         sgPC8UGJIju7zjmLGTDYulKy6/UW0ZTfM2FUokfH2ZmccVBwD2L1T9mwjtra2pTfMwAA
         qpFFlhYMxE1EJMEGIUjaIHWw5uY2TKSfN4ftj3WdO4UISsjQtO4VWxFGXACfit/ZO3Em
         pa5Mjotctj8C35EcpruNv7J8631paBL1uppMSQycFV9Vv2Mpb0cBDRGWD18r+u7x4hmQ
         ouZLTUZuvELxhVnbcmE6AZukhiZDa7qNrPNsn525ALY5LBOFx4LQHdO71ZIDcmuvW9HB
         1XAQ==
X-Forwarded-Encrypted: i=1; AKwUvBwWY3pPXxbK9LGM8CeGuHGZrDYrlVrrQBG+Ckh1pms+b7HgyJ7L8xSWJqMYUjq72xCtaHI/vggSiQ4i5QQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKAa+cdUYytkFKftEBicOdGA0z9WWxj1Spp+Jjq+jKu4jY/sh/M
	tz51e3BUl8+DKq5JojzkSLydsNyQqE1y2e33wjWlADhR/H4YPxhv5j67llys1BOR+eWSarUhPZ4
	PJjWSeXmifIBN8lHMS/YQylC+WmGWVGw1Pt0WHBAMiKn2BLlkSaImpXk2dOw=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6d82:b0:531:7f68:842e with SMTP id
 5614622812f47-55bfffc862emr7711339b6e.8.1793128084560; Tue, 27 Oct 2026
 12:08:04 -0700 (PDT)
Date: Tue, 27 Oct 2026 12:08:04 -0700
In-Reply-To: <CAGsrLdZs_9qUki=pESG8fMF+gOiQpiHm7GbqqHBumZ5BmNGG+Q@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae0f694.403b7334.342f87.0005.GAE@google.com>
Subject: Re: [syzbot] [acpica?] KASAN: use-after-free Read in acpi_ns_get_attached_object
From: syzbot <syzbot+5725792ce6a9938d1b24@syzkaller.appspotmail.com>
To: jeff@incrediblybased.co, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
error: corrupt patch at line 5



Tested on:

commit:         62c45752 Merge tag 'vfs-7.4-rc1.keyring' of git://git...
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=145fa60d73086782
dashboard link: https://syzkaller.appspot.com/bug?extid=5725792ce6a9938d1b24
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15306ea5580000

