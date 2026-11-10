Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794337036;
	b=cFPDKzrRRPiwyOs6dR4Bh34JdKrv/7iJmibOjPRTfOLLsrzUo7JEauKvcC0Pk+xoSU66
	 Sy/NpB4g9nvX+vYG6PfWDP3BRBaC3P//DwogD9UWGWnSqkYkK6p/ZgWZGqlPYuFZzhLDK
	 8iY3bPy4iba4pM67jLiskjvN7xxQ9a8+p2GGe1nh0pxqbSZhPXPY+9RY4BHtQef9GqPDw
	 e72tcRPHosUudLlEOtk2ZQS5sKmbdkABQv08ZwSEo3bP4H+HNTGY+43CToMQDHTmbEi9p
	 ufe+FjmpVEZjv8IERLN/Wl7d9kqAUH+QQIqtUneatrNiU0RaTq/tKzSCaUeC5hSrQfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794337036;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=d4T3KCK0brU/NRXsdrm/rZ+s1mSy9+Im1pMZMMM8T+w=;
	b=P7s1C4Hr54xBv7w9SR71RUtrUXbtvhNFLW8Edcn0F81XDfvHHvCeSSM/nHL7Z/cTMjZ+
	 /zRKDWfHm2XOf1C4X0ZR6fydx+HgpIFko/hL1NlYL0/4OF0aGjum6ouBtj54q8qnlbS+K
	 c2MiLOvIogeSzlUgM02HW97r8snDXNREcPu3S0Teyp8FynsBDL9mgZ1yBUclJElDmmRcY
	 QdTQDGGriFZhAMdcXqPrqNG65sG3IlbFU+R7we9dYt/hExA0WQG8I3MNWoUiMrdrWA+k7
	 /YTXIs21imKOyaMT7ksJbc5oDA5/KfhiJifzXjJChNFHvQdk7JWiOVRvsI8xGykQnMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBFF606A334
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:57:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FBFF606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-55bf11583d9so2579371b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:57:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794337035; x=1794941835;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=d4T3KCK0brU/NRXsdrm/rZ+s1mSy9+Im1pMZMMM8T+w=;
        b=jX840BWRVdfk4cT+36kVKwCcsl27KfDbrmV0hlS5RIVRTJo87k/jRoFaJxiEzxjQ+b
         6kA3MBqD3UkfNhvrnmRRoppiBJ/4XRBiBT7AUTxlxXbLh5qozuNIe/kQsHCgdgK6CRpX
         W6qzaWoRF2mIPKbsyGfV/MrVFVeZz4vwzGeckJQD3HvSES/T6D5VHrp2X6bgTASuq9s3
         70/kIo4RGGDcxKFqvzu0u/qSS9XLecAW8XLh6XBsNbjaEvreUnPZW0L9a/+T9WFiRXDf
         Mju+1Pvrfw1y2YVhw18vHB1eItFtQ/XBtf0s7Fc2XsN23CdpNjgMi1RTu3+FWdSXOxqs
         CTTA==
X-Gm-Message-State: APuU4Z+stOs+CQGSPeqoMKRGT5QzvEaaXJfSTSU3xyTum5Yxdm1C4gIX
	lBbpBxI0qunqOPK7ygtXXKlqjWy+vy6Hj4mMlBapF9JzowXJDBNwdMGyWRtcRD/BimOsNRqHEMH
	c6K1y31ORPk4+T70eQ4ohPKbX1hatjVoC2d345JYsAeOhHv+W9lEch9vZVNw=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6412:b0:4ca:9850:4dd8 with SMTP id
 5614622812f47-56881290c6dmr1960271b6e.10.1794337035122; Tue, 10 Nov 2026
 10:57:15 -0800 (PST)
Date: Tue, 10 Nov 2026 10:57:15 -0800
In-Reply-To: <6a99dfb2.9266084e.bf0d7.027c.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af3690b.17ff5aea.1b027f.0199.GAE@google.com>
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
@@ -17,6 +17,9 @@ static ssize_t nvme_sysfs_reset(struct device *dev,
 	struct nvme_ctrl *ctrl = dev_get_drvdata(dev);
 	int ret;

+	if (!test_bit(NVME_CTRL_STARTED_ONCE, &ctrl->flags))
+		return -EBUSY;
+
 	ret = nvme_reset_ctrl_sync(ctrl);
 	if (ret < 0)
 		return ret;
