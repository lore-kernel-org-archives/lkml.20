Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793378327;
	b=oyoJtrAAp36NDyk/AK9eM7VjEyBvWv+EY5mt7+NnTvLKtBeayD8axuoBSlarMEmw/j4I
	 yh2ArAniCViTHmCYo+tu7tNlGrbeUCtU8Eo7WeUUiL4Ak/+NpDD0XM3U1yX9Jty0qUdhG
	 LFZmskQ2Pz+tgpwZsxneFmhKtLCn/ngIeIEozXqeP1repi8mwGaB5tWcsK9cjWFaqom/a
	 zyMS27/cEQM1bx4KBmq+kY2xLB3SZFOimRR5FQXbGpUcIPa8yYPJ3VhtpuTv+GDjZ0x+g
	 asM7qJTB5bXVCHzO5NXkudrjM+rACPaqo4WJr5Ajo0ebTsiXRGh9wUzEunrKTRK0MsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793378327;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=ke3/NWZsXHkoIHiK3oahsDbBAdlKv5+dfky7d6TqMf8=;
	b=rHa28kaYSqBXKVpMokhaarRKZMklkX5/TwkgD4/ynN6nRtet/FTEnJqntwIFynkdWYh9
	 Z0luPKd4oQdfnL5mq5ofH2PSMtlNA0epEnmXQPenDXEdgXJBwshPZMKyHvEQVZoDx1TGY
	 FukxzPrpRkCOkiQwFqQ7iY0oDf3nJLwzBXMiweU+vvtSJ7QCfVnY15W/pNO+M2Z70uk/I
	 eDmZUcsu/ShZtobQ3HbJQfc9a0klrGZFGbQ2UYRU4wte1nJxwrermjjvRYFQayCAsa9KK
	 wW7yr1JtxTsrwNg/JrlT+aRnmMOA5DsW7huKOg5hkeuTX2gje944r+0kc3kax9vUb9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FA3606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:38:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28FA3606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4c467e19391so1290683b6e.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:38:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793378326; x=1793983126;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ke3/NWZsXHkoIHiK3oahsDbBAdlKv5+dfky7d6TqMf8=;
        b=H2+zvw2r5S85jJdlqHOiGjiZgCv/WLsARsbvpUHm/YeXI/veEVMroiyFK1DtZtB+Jc
         GWnm6YYg1HKB58cbxxljAdLDqbhRri6XHl681/ov9qFXBX+KV1/MwOkadtpG+mBetu8f
         X53Wdyp6DKiDxamqRojkS1o9PUXskVn9gvcz0etUnGXVMj5QIxlDgZXdoHD4x4t1a+5c
         oWcJyhCJ90ntrjyN6NRguv077EHoic0Muza/dAajrQA+iL/CXgZHVigjQQI0PtbR1Iyl
         OjolKPkke0tBR0wnd1aQ4UEAUEB5unriFPPs5BrRspUhYRwUkYLgB/f8r2Znog5cjWri
         6pZw==
X-Gm-Message-State: AFq9FYISfqwNoumWMOl4dU6SNO27Mmw7ABkrA05DfC2LbJNIDcyzPwPS
	9fbErj+9TRCAAogsovfBynvnm9vncPdJ/AjEUv0TTXSyia5nnYJ37+n8BgOhzCzxSLZdHd4WnEM
	XBMyZ6jTP3736yeJMrDxC/WThlDT/R1Qmy9/Q6NygbCW4DSIbz5U6N8pmi4g=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:14d3:b0:4e6:cc78:edc1 with SMTP id
 5614622812f47-5640dd5fcffmr2136884b6e.42.1793378326234; Fri, 30 Oct 2026
 09:38:46 -0700 (PDT)
Date: Fri, 30 Oct 2026 09:38:46 -0700
In-Reply-To: <6ae402ba.0c1d3ab6.e3d48.006b.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae4c816.6713f5d0.92cad.0002.GAE@google.com>
Subject: Forwarded: [PATCH] spi: core: do not WARN on allocation failure in spi_controller_id_alloc
From: syzbot <syzbot+41172204e7323356ecdb@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] spi: core: do not WARN on allocation failure in spi_controller_id_alloc
Author: gowtham398gs@gmail.com


#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

Signed-off-by: Gowtham S Bhushan <gowtham398gs@gmail.com>
---
 drivers/spi/spi.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 40cda0037ea5..319fe204da3a 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -3631,8 +3631,17 @@ static int spi_controller_id_alloc(struct spi_controller *ctlr, int start, int e
 	mutex_lock(&board_lock);
 	id = idr_alloc(&spi_controller_idr, ctlr, start, end, GFP_KERNEL);
 	mutex_unlock(&board_lock);
-	if (WARN(id < 0, "couldn't get idr"))
+
+	/*
+	 * Modify the error handling path to only trigger a WARN when the failure
+         * is not due to an out-of-memory condition
+	 */
+
+	if (id < 0) {
+		WARN(id != -ENOMEM, "couldn't get idr");
 		return id == -ENOSPC ? -EBUSY : id;
+	}
+
 	ctlr->bus_num = id;
 	return 0;
 }
-- 
2.56.0

