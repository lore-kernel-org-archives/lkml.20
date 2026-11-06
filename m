Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793997720;
	b=ha/Cfp6hAb2YyqrEzi4oSzZ/LXSUpZeXE8ePjXce4eZ1AFcof9daVPbFm2UR5iuftMJi
	 YCke7o97w4EyNH48rnLWDeWD1VrT5wlQrLXnTQl15luupKnbZOFPGjSS/IYTTb4j3YClS
	 aqYtOnwiUphlGoApEG1SYL0oxUCAW1m7dRZTe5n3/W68onQzSY9Z66vptFez4jhqKSpgU
	 6mZHyVPxHNeNSEjOOLBgN8eVtolIh4lwNfP6diCE3wdAZYtwaFebwmcELrUgZIizt0hDW
	 Rx9Voc0axgLBSj9XYdhpae3c3S6h5ypKcVttoIfQe+bm2SJ03/tzBEcq6ZPIBO1GoSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793997720;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=yGDwxfvVcqtRERi7GpsUmhnpNyjv0Mc0dQjXwQLxLng=;
	b=ALYW/3uT2zApJD5Jm7lcA6Zb8xe147l73UkN5GhT/cEFjhYoqKzE/85XvhvzM6v8/EMg
	 /+0GaSJfOnJmT58nBaV/L2MVlEIuRung1wF7lWmAb5X/tvy/HjR+XBj9cyd2j21esi6rN
	 hr1c4HQuOuLmQsen6zd8Q92s/V3bKVctGfYp4kdMiKT0C595xJ52dganZpo+zPndjCRoX
	 y+3/TmC94x5wbzJ3/6/NyxXf0OkeN9lQ8jafVNspul0Va6Ygf3X2ir16tKtx2gY0Y9GFS
	 oLVzjv27IvQtCBiPlDO1JHCzMnL0N+UzI9UwvZBT7J1yBkn3WR07iia1WfRj6+1eUpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307BE606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 20:41:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 307BE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b2d1eb484aso1221509b6e.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 12:41:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793997719; x=1794602519;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yGDwxfvVcqtRERi7GpsUmhnpNyjv0Mc0dQjXwQLxLng=;
        b=amGx+GsKpE6YYWbH35dEX32pLc4T3ppvCPS8mmt1CfFKgglIMOaCQ+fARM3DPj+AEw
         aCF3OTqFweAE6DSrskVkTXjYBP2m0nSvehOAyh7aPTgszCGa0A+PIAckDB0g+6lNtfHc
         rdIm3tbZV1744Cmqu12yq/xpPjB+jI2+M/YnF0LGM8m7GnO5JkwQCE5O/iP7rPCeKAnH
         PGlDid7Gs20Uw+cpuRvW0jTtR1zltpR0lKRlgmR+2VWsO7jsNZHStfTPUCFwPXjTpgZK
         s02oDdT1lfrqF4crey0IQvkal8PYG3k9fF6BCBwUvm22oic2NV+I1FZta7EUHkiEfJrg
         h5tQ==
X-Gm-Message-State: APuU4Z88JcJAv7nisLZpjA91haHvVLpSoyRkiBbX/aDH6gDSHTp05hwk
	A7YqvCviHa/vK5MGPkFIdeUTi1bGYcdwysYikHOlONuwZCh3W50MbbOJcl+6AAwuQ4O1nG5XIuR
	vYe70JxymQ5mYu2Ex6pDUHV1DacesG+BE1vIOj+LYW0qRjJqX+yLEpVC5OoU=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3010:b0:55c:537:b42d with SMTP id
 5614622812f47-567e155b5e0mr3036499b6e.32.1793997719236; Fri, 06 Nov 2026
 12:41:59 -0800 (PST)
Date: Fri, 06 Nov 2026 12:41:59 -0800
In-Reply-To: <6aedf353.8be4ead1.3b45e1.017d.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aee3b97.02d3f859.2829d1.0015.GAE@google.com>
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
+	if (discard_block_size > U32_MAX / 2)
+		return false;
 	(void) sector_div(origin_size, discard_block_size);
 
 	return origin_size > MAX_DISCARD_BLOCKS;
-- 
2.47.3

