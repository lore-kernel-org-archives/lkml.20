Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794166985;
	b=RCKuqQyrr6seR8wSYzResqr/qo3kKgA/1p//0rpMNv3+DjjYHzGruQKOxX0nxADvwylE
	 UUziuPr1moZ9I120nRloGL4LH5JyFuXao2QwSOCzep8jFS0GlcwjbJhLMSpoUs+OOjROi
	 L7jlu7ecKqxLJx2cj2iXZTAaO+qtCTbIhfwKtSCazg0vd2d9xDzOv+36lRBBxfres8VDb
	 DsFzP94QZA33j9vkWNpDyTPMzBKhE8p53dDO7UQLHX5KgcXbiQJeQ1eAx0S/vtMtG0Mjf
	 DXFdXXUjCirlzIgVxVZTnqY9Z9tPt/jTJB/E0xSh8MkKT97Z8rlxQ7afKPqKqIDrrBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794166985;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=k/MkQLsvODj2ZL5qUWquYz9sqIgB0EuD9DfzQSrEPUs=;
	b=lkHH+xb/W9RVabnYIUgJfZvezfUWTgJKlLLFEUWnEKr8oPdh58duzjk6rOhSlQSwCMYu
	 07Hfpc0a7pc35dmaywooG/EuPkJZylz+CSkJMBQ7znMGyq/HcFoM+QbVbacO4dJbdj7Ev
	 YvUhgbfsF69LikgXGv07Kq8MPWbDW9ttWo6DY7hyWGUagqfsm66Kgx2L7alwhuA0+swvj
	 iy2EgW5HYE+JouapTPoYE/nquzhNMjCeCtWA34RKNbqB4L00oNXBQSR/FUXgPUUW6ZtrW
	 +LssCStSa0dSErjNdKUb+3kHeZxgEftNmfqsyfH7BSuWX45akUnSjLb+bPhGTauDrXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.160.69
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0F7606A333
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 19:43:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C0F7606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-47cfa971c9eso485182fac.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 11:43:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794166983; x=1794771783;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=k/MkQLsvODj2ZL5qUWquYz9sqIgB0EuD9DfzQSrEPUs=;
        b=wawJtv98liFBqb42LbhcsRZ4PyQ0/eyMW4Q6friC7VcBcMpCQXrt3vkon/EHQvpwwk
         QWS1TE355tbFZsjxcSEP7z+kEhqGgOOFf8CtTD7ewqjkPm5HMSbwbwrqmANt94UtZkcL
         F7n6SdZSjBt+d4FD+yG1myJd4Ao+lFJ++EtRq76Srj2mrI58NlZLGYe71J6bEYGFDPuW
         Q10R4NQtVZ2zkfzD+wcebKX9npYmThPSTiT2wc1oUBN+VNM85w3hrvb5RajqsibWU77C
         P/q33SXG4o8t0dCku4Fx933jckF4p+utE3RtvtXMsxhXKUNpyzkiBmOqEBgOkCuoPUV1
         9A2A==
X-Gm-Message-State: APuU4Z8XDvrp5qYyUG4tD5rJ1asMNtrsKmF3DWqSiIgP4wDBlbRjyzJF
	3Y80XofjXyms1rZIULXCXrinfC0B2erQxt6Uc3274fEV3VCERotMamPrIvL+DIPaJVHrll4YdYP
	dddFyUJgYvxfCaby5/T5a2bjdZx7aSqBHMuubHwLySf5+vcw0v1nAHk95CZk=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:13c4:b0:4b2:8dbf:ffd with SMTP id
 5614622812f47-567fd1656ecmr2108600b6e.1.1794166983298; Sun, 08 Nov 2026
 11:43:03 -0800 (PST)
Date: Sun, 08 Nov 2026 11:43:03 -0800
In-Reply-To: <avDCXm3QW1x2577L@user>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af0d0c7.5a668245.1aceb6.0011.GAE@google.com>
Subject: Re: [syzbot] [nfs?] [net?] WARNING in svc_destroy
From: syzbot <syzbot+8cbdf9aa6c281a4e6bbe@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, pavankumaryalagada@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+8cbdf9aa6c281a4e6bbe@syzkaller.appspotmail.com
Tested-by: syzbot+8cbdf9aa6c281a4e6bbe@syzkaller.appspotmail.com

Tested on:

commit:         d164c7d7 Merge tag 'devicetree-fixes-for-7.4-1' of git..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=14bc4ebe580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1cf189394a856f11
dashboard link: https://syzkaller.appspot.com/bug?extid=8cbdf9aa6c281a4e6bbe
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=116d1409580000

Note: testing is done by a robot and is best-effort only.
