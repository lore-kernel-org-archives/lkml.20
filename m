Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793196412;
	b=uXkpX+0a+nuARX+cpYJVJdOnCusCk3rkUOGG5qhSsVggKaKAzQ3zhUPyCFYBpvP7CsMW
	 SahwzZ/nlNd549FHdIxoh7THAkxWG+lhCS+lE73mYrADyiLnQVj8g1qc51B1G5OY80wT4
	 68Bu5nyA1lxxpHxQ5gfUufyjRlgUsA2f0WWub8/c7nnn/UrqEie+3m79XHPBEQz+i0vMv
	 91qwHyJqzVk1aFatw0kxJ+qIm7VXgn+qpdXR2CjUjpLwE1rU0xf2BkqI0FBxKAUATyAAa
	 r/IV1zu03xuoK83MQdYTKJvQOqvsPYa3fau09phGHgNQDjhiqN/DXHlwVxaBy28jLag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793196412;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=50oFqaE6zzSCf8rWRykty3vZggZYvwWueGf/nJ/C3Po=;
	b=ZbWC2vC/C8+bZBXtxS9zU3PFmzmJ8pQhNoOP7DMRj9SKyYH7XXavgan5q1yEIWkT6mJx
	 dFjAeqtOsVnexGc4ak1mQHjlLMJHk4fszMSXgh4VX36B2EObZpef6pQd2+19dkutYabJH
	 Ri5dVXMO/uzYgR8WdwBTNABNJDfeJ6mYvk7cdUj4xNwNt8Ol9M+l7C82ItKhiDYYwTLo/
	 fozrY/O2RO6SEd5+OA9Ew97tbpKCjKfslQgMd/txRPIGfdjqduGQbSAjKTkTNfBQSKR4Q
	 ARo90wXLiKPTEqu5Kav9QqwsbYYK8pkTD8bhBMi0EFl7iBMa+VyfQTbBJH0pLVlHATQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F5F606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:06:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4F5F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4ab4f652f9bso861003b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:06:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793196410; x=1793801210;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=50oFqaE6zzSCf8rWRykty3vZggZYvwWueGf/nJ/C3Po=;
        b=mnlgGLS0lJennky0rbuoM3vQ+WqOOi62l7XZCk6ZuzFEAU1ouB10gqVU+RpNiz/9w9
         TvHrkQSwlZ0729PkXPSCZ/hqOyi+6pwMX3q80I+oEkRTXsCldWRQPR5tFOraKKpeEgS2
         mvvO6amWTsI90q0VyPs7c8JTp7NKd1eChnTEmnrfk6NcUY0AT96yuyF+CPRKDm2poMC/
         lVzuu2QoysfLA/MNFPVj5Gj6OODg3cwQE+UpbEph81xSmcLUU9XuP0Rc5ULq054p3oj7
         R8a2Q2J19fkuxfPLXYfbJhQlMz2c7gdxdcWDH3siCgUqQwx9NQChO0//wXHI0WJ8nBxQ
         aoDQ==
X-Gm-Message-State: AFq9FYI9vXElLa+iu/70/Oj9k4JBFbirDcr79P1wHmopMPaRKr/t/SKk
	orl386l1wMzmr9nNiWnwz6HoPEVlrM3QjJIwwW3mqI1L8mknJIF3yDZyFPJRxjt92+A4q9piB3X
	xwFhhNDJFspIUltRcsyZJMtpn3OZp4Y8K/OnRSEf6fmmK6DZ0Oma/wFT0FKo=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2383:b0:53a:e153:e8e7 with SMTP id
 5614622812f47-56383484350mr1403526b6e.44.1793196410752; Wed, 28 Oct 2026
 07:06:50 -0700 (PDT)
Date: Wed, 28 Oct 2026 07:06:50 -0700
In-Reply-To: <6a8cdbd6.dbb3a75c.7844.0013.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae2017a.5136369a.6f73.0000.GAE@google.com>
Subject: Forwarded: test bug for patch
From: syzbot <syzbot+75f49ec552cc74d9d69b@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: test bug for patch
Author: gowtham398gs@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
master

diff --git a/drivers/md/raid1.c b/drivers/md/raid1.c
index f0646fb24371..88038d535727 100644
--- a/drivers/md/raid1.c
+++ b/drivers/md/raid1.c
@@ -3050,6 +3050,16 @@ static struct r1conf *setup_conf(struct mddev *mddev)
  struct md_rdev *rdev;
  size_t r1bio_size;
  int err = -ENOMEM;
+ size_t calculated_size;
+
+ /* prevent baseline integer wrap-around anomalies first*/
+ /* Safely calculate size; overflows automatically saturate to SIZE_MAX */
+
+ calculated_size = size_add(sizeof(struct r1conf),
+   size_mul(mddev->raid_disks, sizeof(struct r1bio)));
+
+ if (mddev->raid_disks <= 0 || calculated_size >= KMALLOC_MAX_SIZE)
+ return ERR_PTR(-EINVAL);

  conf = kzalloc_obj(struct r1conf);
  if (!conf)
