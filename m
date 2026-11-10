Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794336756;
	b=mttMCcmFCmvH8hpFLrfd1kgC+wAxFn6Xmiknb+S8LrL9kAh7CQ1AEt2Nu5+za4VYNS04
	 rxrBk9n0CafUlSZKnDbmD5vTYRPaLyWGZh9ARrlMRYlt0w27S9NZYkLdVdLgowB5DfkGb
	 l8jdOsdEmCKc036oMexYg+CJGsjn0xmnZMQzj4zGMpVsIB+P53IvCihiDuyhApYHytgxe
	 +WjeLVfJpVZuUH62PeFAL8SZobwLCfSEbqtx00jx7Gnbd1poeXg6D/6ZKnlYGjKXS+lsb
	 /0VnfW4s5z/t8eN8t2jkiSH8aoH0w5p8+0Gde/5+Gvnr2o2mcvFPt4UaINPPGxU7mgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794336756;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=82DsmZVOH6Bmzv+zdcGfnH+aWcxb+EWLH3yI9GELuno=;
	b=DqUdxL+oTra0u986hACh2I4Gh1eU+kWvi2lUXY4QLfXdhXUUANeptUPxbIPViZ36JVKB
	 vXl+/XzkU9CNkAuH/iNEIa6PINKaD92walr6pkiIdiIRCI0WldWBtTmUB/9wo3aw2307l
	 bwApe3ETY0p37QkKCk2sfZ2KP4ShlyEifLFrWmmvXJIYWurXcYLMtvSGbycMIl8FJKGyn
	 +zmDXXr5jnN8QWYa8mNTIiAfatTQ0l+vQ50Ny+K94Yx54HQAvhRLH2iIrfVsKP/1ZMh0C
	 ApTw+CuATQPwX6018bwkd7fdVcl8MnWp7tBGBZydOVrKStGh2jacL//iDNYMgLlmvDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436E6606A320
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:52:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 436E6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-5384e381fbbso1898827b6e.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:52:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794336755; x=1794941555;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=82DsmZVOH6Bmzv+zdcGfnH+aWcxb+EWLH3yI9GELuno=;
        b=WhtahWgc1GW76xVRVtbbIoiO03wV+G/LMidlIRiF2KPer1lWv64mmcPvhEseR045js
         bNHGReP5MrCD29SJwD1xWvAYOl6kXSa/FMjYxkYmz7h0cLSYzbap2otiCzefCZwtLKlE
         I6INlsnnZxkw5Vpq/3tqLnXffG4R0YvWR6qCNcuerCuQJrw/xf6aPSdRLy6dV1dWSmyZ
         jp86SfLXSD5feTGRtXfYYLGPIwB6FaiVfuyYpwRxv2YzkhbJjvD9GhpXTWzdvaKKZ9s1
         Vpxyuaw4KRDviNvAJdz8PfLg67aMGh73f6JkKhll80GUyM7q1aRY8ovOg9YT0roPkpw4
         EOgQ==
X-Gm-Message-State: APuU4Z/pi/JA3IlY7QvCc3QCqwu4NsVhc0fVAZ3Q2hANlc+xsFFTJP3X
	tDAhRWScSZx2XYmnl37fV+oCyanDV8ow1OLyAEOydeH1mIUW4MV7jdEXG2vTWR+e6GXoOhRVucM
	8C/v72IXqIXP8LKd3CwMpERTt2GHbNCJ1hiFJ3yRGyl4Z78S2YKD6tfAHOJQ=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:181d:b0:4fb:8469:fc4f with SMTP id
 5614622812f47-5683cc7ba08mr2555864b6e.29.1794336755195; Tue, 10 Nov 2026
 10:52:35 -0800 (PST)
Date: Tue, 10 Nov 2026 10:52:35 -0800
In-Reply-To: <6a99dfb2.9266084e.bf0d7.027c.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af367f3.6ea51c61.3838e6.0012.GAE@google.com>
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

diff --git a/drivers/nvme/host/sysfs.c b/drivers/nvme/host/sysfs.c
--- a/drivers/nvme/host/sysfs.c
+++ b/drivers/nvme/host/sysfs.c
@@ -17,6 +17,14 @@ static ssize_t nvme_sysfs_reset(struct device *dev,
 {
 	struct nvme_ctrl *ctrl = dev_get_drvdata(dev);
 	int ret;

+	/*
+	 * nvme_add_ctrl() publishes this attribute before some transports have
+	 * finished creating their queues. Do not let userspace reset a controller
+	 * while it is still being initialized.
+	 */
+	if (nvme_ctrl_state(ctrl) != NVME_CTRL_LIVE)
+		return -EBUSY;
+
 	ret = nvme_reset_ctrl_sync(ctrl);
 	if (ret < 0)
 		return ret;
