Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794471786;
	b=yhhB5Zg/jD9kBQXnFosIg6NhZ29BbhNDJWf3hdWOFT0NAuFvtH3dU78eOdWWLfodeZ0o
	 +XcERqPBjF4F2wj40egPUbRIJcbUyTKVF0kjjipCpF4Z0fj1wniNESKM57XbB04XxiXCQ
	 K2X8hFUv7tEQkvDNHvb56JP5mph1Jb2Vpbq7bEjlYs4oceoz0iXCayTQDtYVIAMm0uR3L
	 InZlx4BcCS2sQIx3qGT0NW5Gzd1Z/WDqhrFF+Bz4e3GkWANC/u4fh63ldU7kS3OPyw21A
	 k2zN3vW2P+REDSn/CJa9cZ+ZOGbt0WDWHCqcReTRfKd0kculjLqBTNnrqJ8+4HlIdzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794471786;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=AOVjVYWiGu1+2CTZWPQd/l37VMMlzCbF4uz2qUZJc8U=;
	b=F0XoCUMbarvNj8M2g3uLjW9ix3QE2EdHQvyhrMIIg/FgBuRHF0VqfK+/khNplzXLJyGa
	 wKM87FDK+8RNc2JGtRxyjAKZnDMuxkCH0XNzUpDEPm1NuqcGAkpfDyYVY2L6C41lip6BN
	 m84ZW5fXWUu/uX9yFjwYSpIii5W/BGWXhGTb1STyMhR3KNkrTS9UNQT0J8s7FfPQBi1Pk
	 MQ6cvvW8zZRdJ+hrNK8+f0xzhpUrYbwfc6fNVlx08m6vQHtoqhZL7KbYSg0lu+UsqwYgi
	 wGh+g82HjktFygTCDwPHDPuWOMMpi0wYTGcP3JZtLp3TcYhuGGPALZUnCRdAyv1BJeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nebyfDoB;
	arc=none smtp.remote-ip=209.85.167.181
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1E1606A884
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:23:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E1E1606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nebyfDoB
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-4b28d9537bcso470670b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794471785; x=1795076585; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AOVjVYWiGu1+2CTZWPQd/l37VMMlzCbF4uz2qUZJc8U=;
        b=nebyfDoB1rNHZ+Kch5TPoQSZP2hovXmtIfL0xayLYT1vS0/h66ZJWayqk7Xuzqpyfk
         nt/DFcQIp+EORJzLARh413fLVZFXMiLs/5h/M6h2DUh22cdVSswUuCs1I97M4ZhQBHrA
         NiRSCH6D2i3XgwxRyJhIyl8A+RMoecUVP3sDLzGwHceMYONiFm6z789t3Z/y37oZ/GRQ
         7q5A6CjAEHsZ33yKA1Kjr3kBmpvgFcCmyUEYZ6c1zXJZ3Am2UjVWuDiz4FERC1WOdPxD
         vummTuDZAu+Jr43hHftitntzuLeFhREiPL2qiLTOmCR4RL8ZV2vt7TU+QEYyB65Sa9/+
         c08A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794471785; x=1795076585;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AOVjVYWiGu1+2CTZWPQd/l37VMMlzCbF4uz2qUZJc8U=;
        b=jUTiGTdwzN1SOtRXFMYbGD3ZgMrZtaWDVBt+a3tAQKFmRyesxWwptTedfWHbl1Q/Nd
         S/jhZcPMz67zpTV1tcrXW/bPQF9/tRUkF38Wt6oBSFlrhFLw0hUwVb/tCqn90nZu2JR2
         V27gs6UMQ03PB99kyh5NmoMRI0Cc4MjmRNzsLQR1j+pYszOznawMBULgwlPmMkeBWLn0
         4h/35QCy8W/WtZjf5ZpX9Qt3mLqN7St6IZp6PNxdmR3vmAzJ2xhb++n2ZzQCdO04WfK2
         GxUTfq+vX6SBV2xyXLiY4cqKxrzT10jXkujuTKglpph1rC3qqrfp0WLxRjfuT+S1P6MA
         DpSg==
X-Forwarded-Encrypted: i=1; AL+hErGWlkB+ok+CqtOYIWWgxWG0aJbdLzC5X9pg44rGeyz8iuqWFyI+Tda+pkV+6oUsC30/aVZG/0urMomItLQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+9VsOegPgN1C4bNISXl+uU5mY8CLQcC0BgYSHwiKNCMfkE3p5Y
	TCC0M4S2LFIAyhaPzGpzk/fuzURxcqEv3TFdpQSSSUDgyYU3MgdK37BirfUGnZn+
X-Gm-Gg: AYBFou3o35DffJ9+CqwajC/mBz/eFMsgkGrgoMaYCghECDMnMaozkhjmfUWEZCGh4/c
	FDVDT2LzU3zEXX/SANNdu6pwZjqDmBMFAZHUTknM0GCv+eKXRfxp0PkIlAoH8ifFbBztiY+9nTO
	vSr67rd0Rp8WepuV5vo1PjiBmkYdj6DjvGNUWWOh25lvHVw2xmYbCAZATFCd5XZYrdKdPW7BOhr
	ENjHtuom6hDsPUSJM3vtVr14RrH2F/WMt3PSWiIlLge/m7Gp7qzVa9kndSA3V5UTc668acIJRxZ
	nwY/eIkTQaRbkaPRm7WsbCmFsvP5AtlNKLCYmtSNr5Gf8psWLfLs98D9JRM8Atwq04FycZab58R
	iyLytIEq62yf6/sfpcagw4jYwx7Xrit+yKPYO6GoXyOohGMTagp+3/2p1CZipNbHLb6Jt4941JY
	gl2Fqyo/bPkKRuGjiDwb29jq63VQ3tIyxpc69H9smMUXm5UNvV5OTPx9wAKYe3zUrsN/tdkG15u
	Gz7ih5yiw1k3QbqcHyAeFwSHkkxHjV2k/2hKwoXi6fyJ9UmvlGB1vXgv9xrwIPznSDNvLOtQnwd
	0z1eWnOdtMSN3IJAyvaDywRPTkAyRo8CfoHgzyhGf0zp8hDZu+upHClsu7sgrfNDhjEkdfwiGyA
	JUXTui/rSBIm6C3WynY8R7FCb8l/BExtqIsmaFXRkOxOiNKHbeP5gSOd338+/Q8ojTryMgHJOFa
	MwFipFTTElL8x+gBN2v092MG9FkVLY+h8ctz6+hFbil9IrgFC1+u0=
X-Received: by 2002:a05:6808:150b:b0:4b8:4703:db97 with SMTP id 5614622812f47-56cd86f35e7mr1457409b6e.32.1794471784939;
        Thu, 12 Nov 2026 00:23:04 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905d3bab2sm7411157b6e.12.2026.11.12.00.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:23:04 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 12 Nov 2026 01:22:51 -0700
Subject: [PATCH v4 2/5] dmaengine: dw-axi-dmac: poll the correct enable bit
 during termination
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-submit-dw-axi-dma-stop-pause-v1-v4-2-3ebc24b243db@gmail.com>
References: <20261112-submit-dw-axi-dma-stop-pause-v1-v4-0-3ebc24b243db@gmail.com>
In-Reply-To: <20261112-submit-dw-axi-dma-stop-pause-v1-v4-0-3ebc24b243db@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2

For channels 16 through 31, the channel enable bits occupy bits 32 through
47 of the extended DMAC_CHEN register. dma_chan_terminate_all() only reads
the low word and tests BIT(chan->id), so it can conclude that an upper-bank
channel has stopped while its actual enable bit remains set. Descriptors
can then be freed while hardware still owns them.

Poll axi_chan_is_hw_enable(), which already handles both register banks
and the smaller channel layouts, instead of constructing another mask.

Fixes: 495e18b16e3d ("dmaengine: dw-axi-dmac: Add support DMAX_NUM_CHANNELS > 16")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index 6dae63024721..405ab9a78955 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -28,6 +28,7 @@
 #include <linux/property.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
+#include <linux/time64.h>
 #include <linux/types.h>
 
 #include "dw-axi-dmac.h"
@@ -1179,17 +1180,17 @@ static irqreturn_t dw_axi_dma_interrupt(int irq, void *dev_id)
 static int dma_chan_terminate_all(struct dma_chan *dchan)
 {
 	struct axi_dma_chan *chan = dchan_to_axi_dma_chan(dchan);
-	u32 chan_active = BIT(chan->id) << DMAC_CHAN_EN_SHIFT;
 	unsigned long flags;
-	u32 val;
+	bool enabled;
 	int ret;
 	LIST_HEAD(head);
 
 	axi_chan_disable(chan);
 
-	ret = readl_poll_timeout_atomic(chan->chip->regs + DMAC_CHEN, val,
-					!(val & chan_active), 1000, 50000);
-	if (ret == -ETIMEDOUT)
+	ret = readx_poll_timeout_atomic(axi_chan_is_hw_enable, chan,
+					enabled, !enabled,
+					1 * USEC_PER_MSEC, 50 * USEC_PER_MSEC);
+	if (ret)
 		dev_warn(dmaengine_chan_dev(dchan),
 			 "%s failed to stop\n", axi_chan_name(chan));
 

-- 
2.53.0

