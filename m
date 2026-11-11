Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794396786;
	b=u7cyJfQ3xuWkc+TN4q0eUURxC2/UEwirPLCFWuZpHqqa539RGhk2ee665HmGDB7VOOaw
	 ix7QxVnajUuVXt1CbgYQ9mYB5/OtOxxLnC/WY8uc7Vs2YisXbpofjzCp9N1ungaadkakO
	 d29l2c9QLHtH72X2yMmJzuZmyHu9K8spiTRUPtscyGLao7moY4BDf+PG/rWGv5ltBDUGI
	 dIsIWZ2yIEPiyOHU6T32NYAGBvFUSY1rVUUnhiQcHZTVJYissJwclNT+DiVUk8lagzIiA
	 OJLwsZoWF+o18sCuDB+azHawLC0mM/EmLF4eCT1vq6T+AMr5L/QjNZn7x40xtxwY1lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794396786;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=BXsr/+1p9fxgColISzPBBJRbo8sq11cmjfCOw5v9SVY=;
	b=oKhciVk9Xarj+gYH+fYeM432cCQKiUE5Tn25WWAlgr1Uhfx43lB+MDDi++5He7UulX9J
	 w71P/L9UCG1bNPK9X6DcZbrcDw8jOMkLNzpZa8vud8v5EqFaeLdTf0tejDL4CrpHrOcKx
	 3y5S8ihWEJaaxfH5M3xEDu14d5i0oY305PecUwIQRNKbg2I70tF3bjxlB0m8YreAtwudC
	 qJkQ4QxJIELCb1NdvS/Z9GnX2ylC6G307IOOlh3PHv1JuodmNmMiVRA8l1EnzgCy8MLt2
	 WWOUOzBQEOuAIl1p/Iuy8cmy7DGVmipMpO3QKDWgcwybLs5bWfBIjCSHMMAxrCUu6og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CE2606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:33:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7CE2606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b2d1eb484aso3845353b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:33:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794396785; x=1795001585;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BXsr/+1p9fxgColISzPBBJRbo8sq11cmjfCOw5v9SVY=;
        b=WrWKlPQzdmqL//jx/DPGw//kOLeWhYb2c18cgqXGAu0XUbwiw6/Fj6H0jfOlmkKN4I
         9pKBtEbLsFecuBVTjl14qM7pGVwbqPlnplYt2OUtUJ2KZHHvAblgFwUbbkB5ncrh1koO
         TWE+pcrGZeYCxlhTh5w8ZAdPqJJrCGQKEsgHo1ck/CbsVKRmrQqiuZ5IdfC1GhHyMPFn
         K911ZOBKYd8UZewTSHUsE0tSA+wMw10fZs14ySg8BCOc2nUPrGkY23pLWVl855nU6eQ+
         CGyLdEnGq1smZbUgvndjEF0ddxmnZv0971TeKF+TaHSTG96ckxzFVLniAmVnorZBIwhP
         rNuw==
X-Gm-Message-State: APuU4Z9v+PCUBZB2WmlNG/gbGUc9ufzpVgFUpUm1We/y9sVSOy5qDiy2
	Z1xtxXDITeMbjK9gS1iRKU3ZrJ3q6dYb/TPAQMgSwFT+5SDQ7h/PpYi2ux+KcTTvxE/Y5NbuC6/
	rLLfhfKuYP9ZxDCqnW+FDw+HxzIVpmcZddBlONVGw63utkNJYQ61iNMnAnNE=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2387:b0:568:1e54:3d74 with SMTP id
 5614622812f47-56b97613496mr1617778b6e.39.1794396784855; Wed, 11 Nov 2026
 03:33:04 -0800 (PST)
Date: Wed, 11 Nov 2026 03:33:04 -0800
In-Reply-To: <6aece79e.382bd2ce.33e041.0001.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af45270.115d70e6.153fc3.3818.GAE@google.com>
Subject: Forwarded: [PATCH] nbd: test cpu_hotplug_lock deadlock fix
From: syzbot <syzbot+72fceb8393e04ce876d9@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] nbd: test cpu_hotplug_lock deadlock fix
Author: timo.joannin@gmail.com

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

nbd: test cpu_hotplug_lock deadlock fix
---
 drivers/block/nbd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 5112e3a03027..99b129eea598 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1357,6 +1357,8 @@ static int nbd_genl_reconnect_sock_cb(struct nbd_device *nbd, unsigned long arg)
 	if (!sock)
 		return err;
 
+	nbd_reclassify_socket(sock)
+
 	args = kzalloc_obj(*args);
 	if (!args) {
 		sockfd_put(sock);
-- 
2.56.0

