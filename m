Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794211797;
	b=4VzPs2ARx61U2BXY6fkoHJ8NClUWf4ZuPQNQMRucbQMpojeY00IxPNxPCstzTgUnlpPy
	 xxl9/n5T/C9Tnos4h04bwFuOCO3RvO4ZyDnxAa1aQ3NA4DAzRAjaKgm3Y5MziefNbDSMj
	 xv5gaDdBZt1734g86YaUFVk3rMrOfVE3HQt8QNyTpoZdKDH1nzI97UNLE2DtRQ+0mSm9L
	 dGQqRU5fjYr0uJabLZFpk9SX6JDyhB3f+Pb/0iauLjtDKQoHJSKRYyG0geie9BGiJox1r
	 x43X16STq//HbyZ7NahMJW0AhjBmmNUXaV/IvoM27wosAZf24LpHNWaYZlPYbWwWRNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794211797;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ztQlNM7XWz4CEoSo6w0e4xwJ1jm6ckTfoK4mBSuQIVc=;
	b=f/5DgfpPoM5RNelrsP0hRgV7Lr1DzWOiUPkCo6eAr/IE0c/jw84uA4ySlRF/fEJ0/11c
	 1FHRiEZMGBfCdVWl+NRor7p37Xb7bnTzN2SnqgAuc+D95pHOXyRG3H+rbDxgrpXyC7IWQ
	 stSluU5DD2Tgr0Wb/k9u1G8ndMk309BL11ZIx/GRd2TfB5oCcYBLUxh1rfqsYhIh0w8fZ
	 pU4BFfjx+9unCqeceDWnuIs1SchSOnEwNw4dD8O7/O+GQqS9RW9gB31m8W+sw3mhDGAqt
	 Nf64pkeh47KUn0LojBC+oirOTftpBLXiuWvo4r/qCQWbqaQWS+iZ2u4+7ZRX2Cw2mLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w8GXBhUy;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74234606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 08:09:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74234606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w8GXBhUy
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36fb88ea38cso817941eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 00:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794211797; x=1794816597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ztQlNM7XWz4CEoSo6w0e4xwJ1jm6ckTfoK4mBSuQIVc=;
        b=w8GXBhUyTBNA5I6vw+zUjd2EKLqqGh6hy8FxyCgrtCmny5K67D5B6rQE6QFOPd6V4N
         jkFVI2pEKed1G9uE9R5cMCoF7aFqlC5drolEAv/pnK0Sn+YrtT/TmahNNCH7xS71amhe
         ny3d6XQKb0IwhNyheyRIQWiQjjpEc7RyYyTuqp3rK9uv10VIY3HmZjwlCSp9wiQHv1IP
         z97vSRmENuHlBPqfr9QJIMzHAudOH3FpS+2Jj+lYjio3hBZiTRVSqc77fNA6drEW3M5i
         erXP9eQFraE0BVum28c9fHS+chuHjXdAHm0feRXcB+UfgYZ2841XgEv0MlFZVO36LQsS
         Zjdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794211797; x=1794816597;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ztQlNM7XWz4CEoSo6w0e4xwJ1jm6ckTfoK4mBSuQIVc=;
        b=XFfCNcru7jDgF0PynsfjqakqDAawYyqMdInJekqzS7An4kPpHPPyEPURxteUAKui37
         L583MsXYcfQA92h0FlF1qBB7uoLtT+/qvD+Vds1VNgbMdS/T+FBvVSpfQ6xDv+SIZ/Yf
         qwoqEdMFEWMhK6kYX205B96eRKFu42zdNyBgKptCJBaSxCy0lCdvJuweMVr9dBewQanO
         yqaWCdkRK0ZGi4wNBgy1ZJd3ujDHUrj5zIiVVDLXKiwnruO6tYBf0vNcKqEp10rz+s4E
         OwjtvshwCVGxRYzfdOq7GI30nmTMnCQkVTJzZRG9Bw5nlxPlXx152JqwGbOAyuSLsIxI
         2gNA==
X-Forwarded-Encrypted: i=1; AL+hErG0TbSz14CDG4EenBZSWcUNOBhhz79bUQwV9C/b2yfYb0EqvJTszHHvWfT0az5RwDPxhyX+77imb15Akuc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8RCV1sJqzxx1On/+ObPnQQbFUvgx9Ij7/BdFZn8IIUEa2Mj5LZ
	+NoHTcJTC01rc/fwGRmcGZEzQ2YvvFeeV+Evtof+b+dzWdbyxCvfEeEP
X-Gm-Gg: AYBFou196p2XeAPNX2eCoHaByJax1f3+0tJKpPvFFoOYXBuRJn8hzjr0PPxS+bAW5q0
	2L27WY44Fq5dZCKxGBH5wXRPpmH+T1TNCtGDIBwCjoC0A94JcokSPliBjwcMg/e3Wv9RQA4Yylo
	0NllbpZFRjpyOC16iZhlL4SVLTifH0ne2uz3okktE0AK9wg+nyijuez9Fp4FPmDr4pboP5+11Q7
	KXJkC/QXXHQkYCLbLHD+RTHTL5H+bvu4hzOM8sfRInHflMg1XFfmnxdoVJ0SXb/fbReIZ7rCGHt
	0BZ5cov4/abf881kCiOhk6slZWr+OIxm/T67zmHz1aX+uHWM10/43wbpW4i6rMko4Z2f/vexc/Y
	tVjJEQE4QeHmPLcaSJktMhmRKTOtGlB6nlyeqBQyuirHBgrlv4myxgzDvCm8FVW8TEiFC035jej
	XDuL3SgaLs/mKw+jxfcKb7l4GbPkP2x5Q0AlZn9f49xn5AYZQOK4qgQN0NKmy+ad7PcAg+0AuIb
	qZapLlWuiiZilJO4XvpdxYqgxgFysf29gFFbo4GPo63dv0RvosXqK4osONUo+H4C64P5WbzTNeW
	Kvgr7ljowP3H6e/ag9e7hyyGUhYFnYU26JMervxu6LxrZpAs
X-Received: by 2002:a05:7300:ce09:b0:372:7af9:bb0d with SMTP id 5a478bee46e88-3727af9cbd5mr5545311eec.19.1794211796529;
        Mon, 09 Nov 2026 00:09:56 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3726039c635sm10835245eec.0.2026.11.09.00.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:09:55 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	Zhangfei Gao <zhangfei.gao@marvell.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] dmaengine: mmp_pdma: kill tasklet on channel teardown
Date: Mon,  9 Nov 2026 17:09:44 +0900
Message-ID: <20261109080944.1368218-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hyunjung Ko <hj351016@gmail.com>

The per-channel completion tasklet (dma_do_tasklet) is scheduled from the
channel interrupt handler but is never torn down.  mmp_pdma_remove() frees
the interrupts and unregisters the DMA device, but the channel objects --
and with them the tasklet_struct -- are devm-allocated and are therefore
freed only after .remove() returns.  A tasklet scheduled just before the
interrupt was freed can still be pending at that point, so it runs against
freed memory (use-after-free).

Kill each channel's tasklet after the interrupts have been freed (so none
can be re-scheduled) and before the DMA device is unregistered, mirroring
the teardown fixes applied to other dmaengine drivers.

Fixes: c8acd6aa6bed ("dmaengine: mmp-pdma support")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/dma/mmp_pdma.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/dma/mmp_pdma.c b/drivers/dma/mmp_pdma.c
index 8abd24e..2f0de65 100644
--- a/drivers/dma/mmp_pdma.c
+++ b/drivers/dma/mmp_pdma.c
@@ -1119,6 +1119,7 @@ static void mmp_pdma_remove(struct platform_device *op)
 {
 	struct mmp_pdma_device *pdev = platform_get_drvdata(op);
 	struct mmp_pdma_phy *phy;
+	struct dma_chan *chan;
 	int i, irq = 0, irq_num = 0;
 
 	if (op->dev.of_node)
@@ -1140,6 +1141,14 @@ static void mmp_pdma_remove(struct platform_device *op)
 		}
 	}
 
+	/*
+	 * The interrupts are gone now, so no new work can be scheduled.
+	 * Kill any tasklet that is still pending before the channels are
+	 * freed, otherwise it would run against freed memory.
+	 */
+	list_for_each_entry(chan, &pdev->device.channels, device_node)
+		tasklet_kill(&to_mmp_pdma_chan(chan)->tasklet);
+
 	dma_async_device_unregister(&pdev->device);
 }
 
-- 
2.43.0

