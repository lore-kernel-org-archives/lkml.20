Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794337441;
	b=rZs28UQfRsUrVTt5ARwlGAzr1c7cls6lXHvEkIiHsjlet0NCwK/tlzB3PxIUgByOP+m1
	 73g5r2+L0yj6Zu4kl9wyurodi3APeO6Hqcrm8nPsJCb1+ohl0im+8LvS4Gkq1GLeGQU4b
	 eCo4JqmuW9hWw6Ypt5U9lNZepCEBYcfgdVuGLXAW//NMmcS8a+3oipuk9DVGkkbbrUnRJ
	 N3O5YDnumzn4T/JhII04KIXRcUJ0mDnV+WSLvZVskVWA2vupvCH8LkMX1C9tjpB/y1wEe
	 OuhkRjc4vTGOkPnzXJcBIfxNzKv+dAx7wpzz3BnHHud7eZbaTic365qu/1CUm3pLqyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794337441;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=y7OEPRzVAkT9KxrEHaCyuc9a3WhCwxEMUn9niA8KRjM=;
	b=HCX2mu+gCE2f510xei2NvVcyyN93wOhMA4wY52eTvVv8c+Y1hvJ083ew7pXdlNr875aS
	 lxXrlcqpd80r6U7DIT8vXn1s6mdk49gyV0HXB3w2M+JayRm6mcYxu+GhExKH7IrcRof31
	 XVmzjqEsPQTQaeRNtTe/j9kWRKgK28MoR3NV9Lm2zWkXlkNLk4GTizfSJebrLcz1TKNnS
	 5G9ZW9OfhfnftOwA7Pkkax37oz1Mye/kERkZCLRS7HMPzSkIM/CXirKLftGxZlrSqVjEx
	 awNOs/ncb2jk3QaJBHxUkBjt86P9Ju8U4LuVwfjc7U5pEc+LhiRVYOV3mxgj+aaUFGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D8B606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:04:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50D8B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4cc89e86e9eso2837662b6e.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:04:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794337440; x=1794942240;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=y7OEPRzVAkT9KxrEHaCyuc9a3WhCwxEMUn9niA8KRjM=;
        b=n57d3x53HTaXAeXwrfoqstz6uoWYJYbIus58xPW5B2oqsQtA1CJjUryypQUC4FuAtb
         AbxMGw0ZgBTTQXGWvMeZmFpzSf2R3Dop+sITQNoTB6Au2bdVn3SDzEIM6ryJ/M9c9j8R
         4ue8i5YXBrS9gbS6J7qId+QN4QimlqRn/olRQ779X4qZzNDidnO91X6QxNMxT3e6v8lS
         MBC+QLnc7gPu6c1G61oCYHTxd1uNMzWYOA8wRarznyKizkwdnSjMevlGE90pRoETeUMc
         emCO0/aPev2HT0MpA6/VJe78OOK+SMjE+mO1kZnrOXpc7s1VhmVvzWVuA8AA55asT33q
         JmFQ==
X-Gm-Message-State: APuU4Z/IjjbvvziUbkOmgkgcXHYQLl2tLBKrvjInV2BfeRh8doQLQ3v6
	Xg9gwVEQBG6nXZPTiNo/NjNMDvhV75ni6hWtWht1+999VmFutGGffb3RE6jcz4W0SCVlJdzzW7b
	FfbTyb3N5G2r82YXbX5j4NLlf+VJftxeDWXiGQNY/GeeKGYzDjjqo7R3zn7Y=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4441:b0:4e5:c2b4:33a3 with SMTP id
 5614622812f47-5683cd3d8c7mr2623847b6e.45.1794337440340; Tue, 10 Nov 2026
 11:04:00 -0800 (PST)
Date: Tue, 10 Nov 2026 11:04:00 -0800
In-Reply-To: <6a900c70.50659fcc.60cd.0013.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af36aa0.17ff5aea.1b027f.019a.GAE@google.com>
Subject: Forwarded: Re: [syzbot] [block?] BUG: unable to handle kernel paging
 request in blk_mq_complete_request_remote
From: syzbot <syzbot+2e3bf0bd49acd9b21d4b@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [syzbot] [block?] BUG: unable to handle kernel paging request in blk_mq_complete_request_remote
Author: nenkov2004@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
master

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -538,6 +538,8 @@ bool nvme_cancel_request(struct request *req, void *data)
 	if (blk_mq_rq_state(req) != MQ_RQ_IN_FLIGHT)
 		return true;

+	if (!(nvme_req(req)->ctrl->quirks & NVME_QUIRK_SKIP_CID_GEN))
+		nvme_req(req)->genctr++;
 	nvme_req(req)->status = NVME_SC_HOST_ABORTED_CMD;
 	nvme_req(req)->flags |= NVME_REQ_CANCELLED;
 	blk_mq_complete_request(req);
