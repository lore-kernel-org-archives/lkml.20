Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793950094;
	b=4MiJOeGJAgyr53tFj1RrnEVno/sFHNyscZJdQi6GSKXKAO6zhIgH2nqkcJCR2eoDFu0V
	 Xm3ejGYfXmdD4kryHKvozR249EZ+wA2I0F1/ElT5KXtS09aOBhkgWryAcuvfw1JeM/t8R
	 UtRO3K2uHOjZ/xfDSh2XdksNcXow/PtJX6R6j7fZQVDxEVLRIcTg339Kt/g2tJ2tvhKki
	 zKvUhpVMPMSwfdYHuWuvlAQ7c9Mvj9+CjD5R0G3J7Zh3W2FIIFZs8g1SPg4DJKEBd9E9A
	 DMduaf5qdme/Jh8e37HpA/Z5B82lipfZBra79Jb5SYjE5Z3i1yJi5gLUegm8HLp74iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793950094;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=9Oc7Fh23vn4yA1VJvjCDMyL41Ep+4U8V9Yc3ZxpGT3s=;
	b=24Y/alGYLIFLaaBn4bbHCKBGk9gbB9shX+VA/URuOhrREJLbTodSkXtxWqq1WYerWsx5
	 ocyrDRU6NQgs2W+ToaiklLYr45HXcZaLscYGAEWoJ2dixhs/bDOD3r9MHc0ETrRTahEgk
	 tRgr4O+5tI0p+VX0NzA9zK0mvNc1Ofw0srpT6S6jkKMv5jbupoHm+TeuLthYNHS0gZ96R
	 ZtfOQyaKjCdrngpb5/YHEXqb31O496VtJq10OacbgYv0fKVYeJoyuny1dzGel9DD+t/BL
	 H+1RWq11AbrH+y4hsIAvBvlYibgFpT0USyeEX8TqKlxRS2jm/iqnJnCAdgoaUTIC4Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46743606A333
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 07:28:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46743606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4c7f887ac6bso463796b6e.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 23:28:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793950093; x=1794554893;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9Oc7Fh23vn4yA1VJvjCDMyL41Ep+4U8V9Yc3ZxpGT3s=;
        b=F4JlRGhakwt7jnYYjvdoRDnZsZBHDL04+LTCrdyETYwNL2bxIuqC7pjV3NDBsjkC48
         ZSfz/d6cnI6gC6VKvQuTtIpldsZlX1ZPdcHloIaP625OwJUL6b2JRuoDI7uR8BJ70Ev2
         rVFiUGk/ChDznq2+OSBbzXzzTO8NnFkPrKP0FelWhQy4GFUyRFTXmKE/jMYMq7q+D8li
         du1adADA06TaVhCDWiGB0jn56H4vZAfOvkohJ1SBd/JxUHKJUdn8OBWY6iQU7+mRPGg6
         A54nWJsaQ26aAtQ3wHr5UTibZ5PzZcMp0UbAbO8bGAgpryi57DbJ0eMZkjTCptA3907D
         JaDg==
X-Gm-Message-State: APuU4Z/1qepz/4tNgkfbZTndXrE/DWaHdHgyy68G5P1lYEx6HlBMPTSp
	uFjydlAk7ZxVkilrQHGvOBkfAx3JAx7wk39zKz0bjVKiKv5eiicvqag2GxNSx79suQS2mJefLn1
	0LdmcIqWNUCf6+9SMxCQJ8210x9sCOE5k3HgdHu9ACHXrksOT/UQgZNanRzQ=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:19a5:b0:4d6:308d:4ca7 with SMTP id
 5614622812f47-567e14a5391mr1353265b6e.24.1793950093150; Thu, 05 Nov 2026
 23:28:13 -0800 (PST)
Date: Thu, 05 Nov 2026 23:28:13 -0800
In-Reply-To: <6aecf26b.382bd2ce.33e041.0002.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aed818d.02d3f859.2829d1.0009.GAE@google.com>
Subject: Forwarded: Re: [syzbot] [netfilter?] WARNING in xt_dnat_target_v2
From: syzbot <syzbot+2e819f6641708bb6ab9d@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [syzbot] [netfilter?] WARNING in xt_dnat_target_v2
Author: xujiahao@cmss.chinamobile.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git master

Testing the attached patch for this crash.
