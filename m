Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2091B4257
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 01:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789607709; cv=none; b=t3IG7Z2ekj8Ty8VT8akFgmMVa/YRwzisR1HLrVr7EglOAC/unL5iwQ5yXGA985F82LGjYmEi1AkO9gcx0UFr0awFMj2w3pqCz8AqvYdiOnTLQOxVKmBJtionnJC2YGdksVqtY/ohTcKpbe3ANVblnwJyesdZSIowpisTrsWcFLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789607709; c=relaxed/simple;
	bh=PgeIC/6vl1sG8ajab7oZ1+VnM4mXkkMq2uJPJwCrsg0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=cIWtUh00j7w+0FD7KkMuRZyKC0HgMT1hwPlijcEbqhtDQuVb4gJX2yUWbeaB18xeCyz4ebXk7ZPLgsIeyrKGZPMtTOaX62+Kjjkmrun4wl6QRBMwqnQ+PhIzq/mCazVyCgSU/k9r8Rxdr5Tw/tSUyo5VbxlIF7xNYblyWkUDFoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6b1b8b593a4so408810eaf.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 18:15:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789607706; x=1790212506;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/WeKGDBZ2vtP71PzQm16tGvVEgbzc1JjDqniJZwRlIk=;
        b=TDHPjg80eHY23m8/lcOSVCChvvvBaY6dBF7JhjewVqwuwjSSXOYAROMPUH2tNW2t4r
         QChqMkztt5LbxhhxEn5ZIHWmkLam8x17kQtyeYBMPPuCqPVLCXPGLCIlhrznXFbWY/W0
         wO4krranE4Uwy0HLBqsO44bHgOh7FneEqe6APU5ZBMYfnTZqZK3Oa1WiGH01PIY5YNgo
         6eiZ2X+Jo02VeXURfJFZNgpd9G5euBEyyEeqZYDhhKzkINPqq+IUpsxzUMQK9TUVa/up
         rtfTWOJiRVNVCO5hA57YUh5GGxBBsQhmbLRjUx9eWtOfc/S0X59WFnu5aE6qYN5Grccb
         ixTw==
X-Gm-Message-State: AFuF++mjMSRWyWBCTPeWxr05EHY5+mytMA6Ke55BEPmQT0nFC6E2lbI2
	7JwEiCqC7Brsfo0mAfkFkfqSXMcJuTY8qqxFng7zS72Hh8yTNMSDN7FRS59j8kPCBnUctfIXCAS
	wuGY2UY9QlYksRDmgQGfHuQ1nHVbUkdBVlKgsKvW5nITiAlvxFJTrmDy1vkc=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:16a8:b0:6b3:61f7:b8bd with SMTP id
 006d021491bc7-6c7d0bee1c3mr4510455eaf.1.1789607706444; Wed, 16 Sep 2026
 18:15:06 -0700 (PDT)
Date: Wed, 16 Sep 2026 18:15:06 -0700
In-Reply-To: <6a9b44e0.a5e650b3.363816.0002.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aab3f1a.b398a7c9.1f86be.0001.GAE@google.com>
Subject: Forwarded: [PATCH] BUG: sleeping function called from invalid context
 in null_insert_page
From: syzbot <syzbot+95fdab36405e5ffdb680@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [PATCH] BUG: sleeping function called from invalid context in null_insert_page
Author: jchuang26@m.fudan.edu.cn

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

Reported-by: syzbot+95fdab36405e5ffdb680@syzkaller.appspotmail.com

diff --git a/drivers/block/null_blk/main.c b/drivers/block/null_blk/main.c
index 6beb1f5b7..d5ece457e 100644
--- a/drivers/block/null_blk/main.c
+++ b/drivers/block/null_blk/main.c
@@ -1861,8 +1861,17 @@ static int null_init_global_tag_set(void)
 		tag_set.flags |= BLK_MQ_F_NO_SCHED_BY_DEFAULT;
 	if (g_shared_tag_bitmap)
 		tag_set.flags |= BLK_MQ_F_TAG_HCTX_SHARED;
-	if (g_blocking)
-		tag_set.flags |= BLK_MQ_F_BLOCKING;
+
+	/*
+	 * A shared tag set may be used by a memory backed device, whose
+	 * ->queue_rq() performs GFP_NOIO allocations and therefore must be
+	 * allowed to sleep.  blk-mq picks its locking (RCU or SRCU) from
+	 * BLK_MQ_F_BLOCKING, so always mark the shared tag set blocking;
+	 * otherwise I/O submitted through blk_mq_run_dispatch_ops() runs
+	 * under the RCU read lock and triggers "sleeping function called
+	 * from invalid context" in null_alloc_page().
+	 */
+	tag_set.flags |= BLK_MQ_F_BLOCKING;
 
 	error = null_init_tag_set(&tag_set, g_poll_queues);
 	if (error)
