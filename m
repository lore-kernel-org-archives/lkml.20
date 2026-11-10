Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794336952;
	b=GcInVjE1ftDOk0q+15UIEssnMFgdNzpyQSR2Y4es/1uY6BfGm8eTvYha2sLjGIbtftg9
	 T3iB3zC0dtraY/LkOmc7xdPbvXs4r5I5gNUJQCDLLZz8P5HRWRnYXq3/hHzZtxrKWvhk5
	 ZkTcxSpYSiuXu5K6ThuQg0Om30AZmiiSz05od/lKTjdP5Rep+I0STDhqqUCz9oGl8HHjy
	 pyibgWIUsp6HbvZPOS865zKYW/rkYd/j5SQpKu+tgaNWIf7IW5qcejcBCavMyaRmAEivS
	 FNoA5h2OXLKUdMwxRMDIWadOZ36IBxNmKqjoPqlJPOkoaYAK7X2s3nxp3kigASwqt2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794336952;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=d4T3KCK0brU/NRXsdrm/rZ+s1mSy9+Im1pMZMMM8T+w=;
	b=cCX9T98Ry2i7TXDnP6bbCS8Ook6QV/0ZVJCurC5UEgsjXNThcCRbQgRUJ9AUQ5PJWXJF
	 Ad4sRsDlZFnUaTvagDp9aJ2z3wFl7H89yGkaKjvTFVJUkqr4+ih1+3yGBJfUjXmdo8mBU
	 JjILLQCuWFbOeGuPsIrJ/WraD9jf5+f9pG5BjmvrVbnCauBWRJ23GIyOtUbcxT+SxTq/V
	 d/m//XwZVynCdIm3V4UzQeSjQbmrYSIFm2T0HyZbPQ0ax0Cjl1wFC/WIvKRXJ72QVa6er
	 C+BLEloUbmpLbhBOgML5TsoIrv3MNpmPfh6dxKjwggmwjK1FBgdWKfx8PS76q7dRcow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.69
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5C2606A334
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:55:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F5C2606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-83c2311eb1dso3462476a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:55:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794336951; x=1794941751;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=d4T3KCK0brU/NRXsdrm/rZ+s1mSy9+Im1pMZMMM8T+w=;
        b=f5SJWRYsMPcgDC8O0C2XVOgniSxp+bozYUXuE+IF4V6W0DyZJUCiIVas4MLjmJxwSQ
         yDp9d2C+AJadbt5mHehdImbz7xepkmvmGhp+BWpKwhwWSExa/XEZ+CX/YQN1BlGmN+b0
         G3r6Ki0l9/3kfFq42Mg/GOtY05B6pLxr5/P7Z75eif24C6881OrBQhdvktis0I6iWZ36
         U57b4XsrssA93wpfdmcViccyd5cnTRBeYeX0glBWaNPwQkYlALnLVwe59BrD0s+fTyk1
         sgWep3WjdeTHHzone+8FXJBLlr7kY0E7jZUvGmUQtVTULVwepTiZANPXRMp2/R5MVgjq
         AHWQ==
X-Gm-Message-State: APuU4Z8lglsnaIlHpbSRSCe8A2UPWfrMw2hplC2c0laslxdRddsrCVQR
	Sbql5VPjnd1tAA7hvTtRNaswZsnfBYTvx9S68LPygPvRPMQ0MWfWclCGlYeygGhdXK83QrVywlE
	zQPBWiilMSq5ACUPz9dO5fVYV4F6N2yMR4ngR/oUCU4iTAIUyC6/YPYzF++U=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:16a8:b0:4f1:c824:fd06 with SMTP id
 5614622812f47-5683cc9a31bmr2523195b6e.14.1794336951215; Tue, 10 Nov 2026
 10:55:51 -0800 (PST)
Date: Tue, 10 Nov 2026 10:55:51 -0800
In-Reply-To: <6a99dfb2.9266084e.bf0d7.027c.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af368b7.17ff5aea.1b027f.0198.GAE@google.com>
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
