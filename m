Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794336825;
	b=xDJMtLi6MaR2DLFPRzWMwBKC5R+brgLx/EI89b50bblttuWhTZKNLxstMDpMNRUjDzOY
	 BOWMtR2bAXjxo/tbrrutcbRQhvGFTQfTNYIk2yTTLF9NS1QRsA6CegvAQ4INL1+l7P5q5
	 fDxXocZWRX3rPynuMW1QVzeO4RMJQ0xYwhJOZeJG0OeLqIUZckbUHBh9U5JYBi3sbCFY1
	 XS6wBK/xHAihbX6pVkSJLrPI+DXNk4JvJIMyxgCAQa5EcYp0aXzsS1zYXSG+9HhqqGFRi
	 6kY1ZiOcPicGtNN04/st0FWc+JrTOW+Selg9f3haYBvR3TQ5Ju/oWMfueEwOwRRt24A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794336825;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=WfgVb+98zze5M/HUuNMbgboxdFsP2UahqL/P5wxY7Ys=;
	b=kGqKgCQgb2GvTrpCZ9N3uoT1HvZT6isnpjsuftDunKYlMOjZ139w9e+pHA1uaWElrWBF
	 +N2XkiZ/17cCm54ZPdAPIKknu8Yxm3B+501vU9ZK6jg9XHDa8JhbsutzisrohKJqOJFfC
	 bIMd0wkZBUu438PFhPIXzIMw/SMQdGzY8M6LWs5IyZZqHiXewP9gY6tSsj0WpPPTQt89K
	 frCCu9pJhgozTYkD93j2pd6oV2eru348/Po3UHAX2iYrl9PZ2HT+d13MMcQucKv1RJWjh
	 Pe78OGb9eI88SCiORm7fT7eTdrlF/EwPqHxW9I5ao//bvSQHXcanOTqGz6LgAqZ0isw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5712606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:53:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5712606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-540537f959fso2730058b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:53:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794336823; x=1794941623;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WfgVb+98zze5M/HUuNMbgboxdFsP2UahqL/P5wxY7Ys=;
        b=bE+Bg5iaQNCjPcwxiYlx2PAK7RSLoC3n/hWI4XD0DouYgBZI4G6YEDWCqE2WyBsXeH
         KFdvz3w3ZwhJ3CEQhmgBB/HoRD6/KuVC2W/0rgyjSyn7QoFyBzTcKbuYLY0kvsE1RlwQ
         bOaLVuhssB/eWEi77Fc6cB0XZ4h28GI9dXsfghaYVkcqWptAWV1NfN8XpkkaNnrkSYky
         a40vKoPvMmzOASgdAbLu/OLnRZ0Hotat+mnzYzB79RIh4TIfnaEh+ojPreTxleq83D9b
         /Ttx8E1fThaPEGWsk8oPqIn0J1+bhQS+5SAasHzYUgItmvpFi6JDPmnpMo4U/727NqlY
         5ayw==
X-Gm-Message-State: APuU4Z++Jk66O6/vwjN0+pxe6Y17VLh+xFjrKFvo0lunBZzzAX60zryG
	MePcE5znHCQsrSmQGu6JVR2Y3/OX8TFMmUMpRvIToIUfN6Dh8wmI5iQ/nNTMO4S4xOFAyBAiW3H
	HmvtkkH4yDDPv5YqpKDvxr5TEP/79avXjjpC06TNwkFlssyfjm4uGLn6kCpk=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3505:b0:567:dc3a:c63e with SMTP id
 5614622812f47-5683cc9ee30mr2532896b6e.10.1794336823726; Tue, 10 Nov 2026
 10:53:43 -0800 (PST)
Date: Tue, 10 Nov 2026 10:53:43 -0800
In-Reply-To: <6a99dfb2.9266084e.bf0d7.027c.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af36837.c2a1e073.10a5a1.1172.GAE@google.com>
Subject: Forwarded: Re: [syzbot] [block?] general protection fault in blk_mq_quiesce_queue
From: syzbot <syzbot+fefa0af09f7891b1800e@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [syzbot] [block?] general protection fault in blk_mq_quiesce_queue
Author: nenkov2004@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
master

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -680,6 +680,9 @@ int nvme_reset_ctrl_sync(struct nvme_ctrl *ctrl)
 {
 	int ret;

+	if (!test_bit(NVME_CTRL_STARTED_ONCE, &ctrl->flags))
+		return -EBUSY;
+
 	ret = nvme_reset_ctrl(ctrl);
 	if (!ret) {
 		flush_work(&ctrl->reset_work);
