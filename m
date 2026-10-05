Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEF54AA56B
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 15:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791214932; cv=none; b=SpsGX6BORCB9C3N2Z7ymh2od48A7ipXLE36oRsPfh/2iLayHVypZ3VoZyM03HusI8dh1wuyq57Y9rLMMCAyP99iBN4BuBPiAay3oMDls5//2n3oWLARuZg9Pu4OpLOv3cOTIR1MME9Ugy/fYH7+OGpxgfwq3biCbnUBfwugwbsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791214932; c=relaxed/simple;
	bh=f5XFnfv9EXuhMpZm5j6s0si9uaFWeURZahFd1BqWAsU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=kGzcIxAWrTJ+LedkmkdWAkJM6LfNAF9ZsCWea28f5M/Zdu9GtS0cplyVk7qDZ/WnzSJl+17QGFMJ2DA9q9ldHBkXtBqH9gyu4Yi1ufj2JCdCslFqt7GBuwwNGvJbmqCt88neQ6WDYPpeSU3E69ymG83DexFv2M1Led3sc6LFyNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b2f2b8d88fso2939201b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 08:42:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791214929; x=1791819729;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nGnhcexkAUc+OU0SrBQYZTon/no6yuWYKsBcgNu1Ds8=;
        b=XD1ISRn7TBgOvtfTAdT7GJ5E1M69KX21y+lVZRrJG7dY15FFyGK9kf96NpCvB9Bhow
         Ia69nPJW8q/BkQkELpjKfg+0oCcuDPhUD2XlI50D5oZLjiRaFdn01P1oHjpPODYQN929
         3z07Nw3LET5+gm6NSGIbYbVEYrqTONYOEqKNx1p1mkwhYQTWz95VOEX178O8FJGo8XVT
         Xx+jxwDm+vH5kEKJHsnOcioWKJu8j7eb+6fDO8xplxc4dXa0UarnQGP92bjt5fkdtHpq
         nWwTjdgo37sB/3c+pXqWgljCNafVgfYv3oer4J1fSRGZwbIEYSQRIH3EBG1t6bupo5ld
         kE9g==
X-Gm-Message-State: AFuF++mb5MgzZu+mNJOsQ5nGJpT2v025zvOZi4XMHQXnKRH/azmi9LcK
	JfINB3NfVp1IoVjWpztRkTjwW9h5MSjyBrlW+HCKojSCsZ3kcQqL4TvNtCRlZ80Z9Px7Gdj+MKm
	NaxRWziv8qY7wPLAqzZ4fsJkmOq66TqGQq/NzxxKpoDxnVGo0jvJR794HbB8=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:f02:b0:4e8:3707:d4cf with SMTP id
 5614622812f47-4f52376b295mr12426925b6e.0.1791214929665; Mon, 05 Oct 2026
 08:42:09 -0700 (PDT)
Date: Mon, 05 Oct 2026 08:42:09 -0700
In-Reply-To: <6ac33576.53659fcc.25f34.0004.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac3c551.53659fcc.25f34.00a2.GAE@google.com>
Subject: Forwarded: [PATCH v1] Poisend page in hibernation
From: syzbot <syzbot+609c80047e3e808b465c@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH v1] Poisend page in hibernation
Author: nsvatoslav515@gmail.com

#syz test

Signed-off-by: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
---
 kernel/power/snapshot.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/kernel/power/snapshot.c b/kernel/power/snapshot.c
index b209712cb2c3..a893d48e770d 100644
--- a/kernel/power/snapshot.c
+++ b/kernel/power/snapshot.c
@@ -1256,7 +1256,10 @@ static void mark_free_pages(struct zone *zone)
 
 	max_zone_pfn = zone_end_pfn(zone);
 	for_each_valid_pfn(pfn, zone->zone_start_pfn, max_zone_pfn) {
-		page = pfn_to_page(pfn);
+		page = pfn_to_online_page(pfn);
+
+		if (!page)
+			continue;
 
 		if (!--page_count) {
 			touch_nmi_watchdog();
-- 
2.47.3

