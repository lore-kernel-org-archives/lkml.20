Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793992920;
	b=d3gUBpZ01nKS9zq930uh/9Nbt/2u2Ck5vibUiiMsjy5oBINoXIAinMWEk9ORjKCiTsqy
	 Fb078hZSSGaSF1buiMKtAi9O8vaj41jXGyVVMLHt6qe8eCCSECsa95FBv85F2Pp6HKrQH
	 Uy4nDVbNDo5K5VUvoZYTjy89wvM+W+F3VzdezJXUcnSuz+mfWoG2tFaegu+seBPjNVRIx
	 N0mw2mANTpB/hGACOrve0NXLFUdsty3ffKvDw2VOwFI78OmJehpFyVaAKLrHVGbQDEI+p
	 h54yQrDWHVTc07lLYZHdXLv8XEbOpVthaCgROqaICh/iXlyYE6knozFYfXlzggwbRbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793992920;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=41ONaHYp38jSOJh3oEijkJj63g/T8bl6GnT7VMebd6Q=;
	b=axKtI3oYBjXHwTAShpAiFSwiY85tSiVeMsf8cCZTGbzLtSfPEE8LuWoSzFySB7usbEHH
	 6i7ugJLxa0UNtenTiQzzcBMZe8VRt53wNZOlST16CKz0wHXcYI6T/YnyBHB/S37om+Rt+
	 OJgy09MAD3GgHrq7/tKIW7ETzYRyzyjPkbn8eCUrwFr5vnLAiXthuFDeopkViighw0IoP
	 F1oETLBeHQNSQibtaEClkAhIUOVqcW7O2vBV26Q/Q6lwvT6oq+22u/4tcABXFqHratZRG
	 eI/UTcaDxuBVheP7w1SARt6KWuzZ7kuVlG6czSUcFgqWKWYTb0j0jLtLbZFYcYuNkXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.69
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7760606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 19:21:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7760606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-8490a7d657cso1314991a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 11:21:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793992918; x=1794597718;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=41ONaHYp38jSOJh3oEijkJj63g/T8bl6GnT7VMebd6Q=;
        b=thnAg7Z0TTz3ed49ZdlGDJjQ2EnHDSZVgH/6fdRmho2+JwNuAPniRkeRVLztSc1UGs
         uJezxnYTuy2fL+ZKSIWAIm25rNqPxY2bbI0LW73FRrm8LEHhDOTTRoniv7THAOSqm9pW
         IuNQESDSMtO06RBnj6mQkL8nHy5D+G3urgK+B0no39xn7ZYquC6OrmXhCordVjvdHnp7
         eYfRmNG3NXUeH8p5f63PVtlpxj387bvKH0AOfGqJ7OfqDlaeIhkvSMeeeN1pW9w9mzYD
         rhf2+0yVRc6AYQTmCwsJfs5AnZZp/WxXXtLnUl55OKfhxVFqACWeHd1pSCwjfVhJG/pG
         GcWA==
X-Gm-Message-State: APuU4Z9/oN2SWfGKcx8fmMREuIFC9FDlfM3PMDxw9RzpiBJ+x1y/K7VB
	wzQ9RBMehdNjwmoNYcNhv1tCoaoNM+9fyOR3KAgwGa6Uqp3Thcjwzu/tlRzWskgaHI1l/gZ7/tt
	YrnkW3hSrLu/xxIW841enHZDjm1haqmukK7x765EhlX6GedMONSugfhy97E4=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c1ad:b0:4b2:8ee8:8a38 with SMTP id
 5614622812f47-567e095e8c3mr2396413b6e.0.1793992918729; Fri, 06 Nov 2026
 11:21:58 -0800 (PST)
Date: Fri, 06 Nov 2026 11:21:58 -0800
In-Reply-To: <6aedf353.8be4ead1.3b45e1.017d.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aee28d6.4bd0a7c9.1b4322.0000.GAE@google.com>
Subject: Forwarded: [PATCH] dm cache: fix divide error in too_many_discard_blocks
From: syzbot <syzbot+3e16980543e238b95bd1@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] dm cache: fix divide error in too_many_discard_blocks
Author: drifabdelmalekmohamedsaid@gmail.com

#syz test

Signed-off-by: Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>
---
 drivers/md/dm-cache-target.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/md/dm-cache-target.c b/drivers/md/dm-cache-target.c
index 1a5072425c4a..408bc743a141 100644
--- a/drivers/md/dm-cache-target.c
+++ b/drivers/md/dm-cache-target.c
@@ -2383,6 +2383,8 @@ static int create_cache_policy(struct cache *cache, struct cache_args *ca,
 static bool too_many_discard_blocks(sector_t discard_block_size,
 				    sector_t origin_size)
 {
+	if (discard_block_size > U32 / 2)
+		return false;
 	(void) sector_div(origin_size, discard_block_size);
 
 	return origin_size > MAX_DISCARD_BLOCKS;
-- 
2.47.3

