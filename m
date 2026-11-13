Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794562603;
	b=4bHO/c9i+xp0Kc6NAnuqqV+x5rVFrNBSt4cFDM48MV7jHD1/raIvw1vrhp1P5eITk9fv
	 N/WLYqmrUOlZesJWuc1WQj8iQXv9DhK8haa0D1JSDgTzT2vctCznlDPBhoCyob83d5Zru
	 7fEj7T/IHyByEL4OJYVLxBBXvKl0jbBBDFFu9JrSPt8k84qDwP2MR83clCK4KurtHjSft
	 TyqMw4odymSxQZwRU50rAeZ1im0lmApsex9kmlP07OmF6lc7pA4584jnAN4zKwCf2k0zJ
	 yPoG6tPoUBFs3OgwzBsvVuFMhZipcoYE5LtHA9dSSagmAjZgtVzrqPiu/n5OEGHLsRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794562603;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=AOVjVYWiGu1+2CTZWPQd/l37VMMlzCbF4uz2qUZJc8U=;
	b=CJb0hrD18zJmW8VlLsIa+HSWs+9MFqIaCGBtR6+fj8ezXydbyxkXNaShAlNY49E2CqWO
	 81kn/+pWnofG2nPM/fZLXFcD1EFJEv3UyGxc0B6TqIp91Mv0JeuYM/yXDw8KH3rzUYkUD
	 4RHBbKoVUdn0FBIJp+UcxBBP0i83Nlnnv2HcMOcQ8HmkP0RTp/GyuOL9FfHnRZx/Dh+p7
	 l9W2wla/CGZJ9aime/O4psw+DVgEtcnhubgOMZELxx/99J7IZ26C0ON/PhpyV20p/0yC4
	 6CMmJrKVuYohKHq5nyRc0e5ErOs5WVVYhWHACS3gg0Iu6OlaW1LJhMcy/r2vc52yu4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YZqKS8CO;
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96A8606A8B0
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:36:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C96A8606A8B0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YZqKS8CO
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-844a8bf7e25so1053952a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794562601; x=1795167401; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AOVjVYWiGu1+2CTZWPQd/l37VMMlzCbF4uz2qUZJc8U=;
        b=YZqKS8CO+L47qI+y071rEAYWsqn8na8lPqPIfRIuKVIskEb0dO8N2TTSUgOKp9OHMi
         dXOJjdntFBfJR9n/mWYCP2y3k+NFaz8kz3cxsxurmXBbaqQwH6PHFJuTuP8s+5dlBA6m
         VezmHGZCz2/Fxq6MbEO30+gLcJdoHDVcUZuFyjJNeZ0/WKBqN9y4ryFOabHueE3xEo/y
         b/qQdVwSgkKbEoWhcC6tI887c7m/N9chrlN+mQ55g8iWRuOWmbAbzXDSZwNGM5fjO5Bo
         MfltO8ZNnptKtZG5GMUZ92z0R2xaCxOhqAHQsAvHaeamh9uZNu6Ws6a3VTcwTY2g4u/w
         bVsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794562601; x=1795167401;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AOVjVYWiGu1+2CTZWPQd/l37VMMlzCbF4uz2qUZJc8U=;
        b=TVede6XBBXm2cEmtFkR5tI/+UnR0IU3UU5U79dhYo1q2sAYFSjGEo1+mkTF2LDFQnQ
         iZTeo4GReCqYKmjL34dTH8dLznvOMDOOjbsPp7UmSdnKwzchBRFWKMfKkimLXlLQP8Yw
         eQbFamsefo4eFz62DL0UMM8yNm9YzDIdseMfJAWn+NEq6s54gt+F+Klu7VhimCHIjeJB
         /Y6JlN1ytJ8vDDGvLp5ejWrf0SY+ttiRJxSzMAe7pmRnr+uEfbs3nJ6M3EI0xzyyh7QG
         9FSiOzstSSJbHWEUvc2uPCkxYBbQbIqFOpzoXTS2njlhyYD+tB6Vd6xYP6Zgzr9nleh6
         eEVw==
X-Forwarded-Encrypted: i=1; AL+hErEOfALzf2wVTIpTsBhZbnrip1/KV7uq4KdDVpyYO0e2tAD7T5/znn+CwiazmisLNdaGNpITQsweFq1IJJ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/T1tZqrUi1A9SF3Cl5Emu8G7FyOkLpiAsteimxWjJ+hpx+75oc
	6nHnkZ2mdV7icD3jAwzDwpHMULUUfcYLG3kAs/OMQLM3vc1YxIDP76PQ
X-Gm-Gg: AYBFou3Ry7yGMEYJiALdsTQ8dSFH2wGQQLTmyydPChnhPtCq5AjWH1R8NhIH8mtq6zU
	77s9N4SkxF9AOWFRjhJxGRJr0MA9vxl00AF2EQD6PHidyHCao8e9KEoZU+NRzJEju8iZeLb75J9
	OMj9usLEvVW+gnXVtTKxaaP9AnSHJ4BU3HGj0BzaQY68+qiayGC+BQqrO4oWFJmPqgFZZ6aQLhT
	H7tMjf86/oOglPTdyrESiFc4CPmeAO41vwr3yzu//rKDhKsmx+LXJNOd3TlzXNQgTtTzj5p/Bdf
	i8YhsWsh0CRDGgr7N0CsJGp+yQhFD4rmWeWf8TBFNb33Tc1+/LI8+eqny6AFklEmfBAzIN7BHKp
	0PU/o/zXsLN5D4JeATQZ0qROWsZzVRCAfQqIdxm3j934NZPG96c+BKEzvy6ga1AriB5yvuqqMT9
	Hyz1YxE5Q/O6Y1V5bQTDGIOtTtScGeB9sUw7F5BWhoc1029R/ISh0L85WpWR9wjDmQeCAViv0iX
	yQHmIN6FVIq8nfuAGxj3DaLU/DtNt/1kD6OkJ0WyuezYO4RCA+tSUvlr7CHbjFYnU4w7yhE+bqW
	sz/3uRNi+2UXPjUGDSCcl9iGmRob4tMnM53sz67Dm9KJTkU/neo1MzptUbplfHB0jVwkpfBprS/
	lcK5Hu+jaqquN8CXO3bsx3lkypjLdOgs83ZIM0WXZHOfRnrJOC8KkCIWrygg04/ZO5vkduyKYLZ
	CPhqk9I1zbV+Z/5fxxkLTUl//A/1MHAz9y6IBwebwXJ/glycyE6q+V
X-Received: by 2002:a05:6808:3387:b0:4e7:3fd7:2752 with SMTP id 5614622812f47-56e6530f73bmr1545762b6e.54.1794562601546;
        Fri, 13 Nov 2026 01:36:41 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e6fc42a8asm1627607b6e.3.2026.11.13.01.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:36:40 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 02:36:35 -0700
Subject: [PATCH v5 2/5] dmaengine: dw-axi-dmac: poll the correct enable bit
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
Message-Id: <20261113-submit-dw-axi-dma-stop-pause-v1-v5-2-8523a27b5788@gmail.com>
References: <20261113-submit-dw-axi-dma-stop-pause-v1-v5-0-8523a27b5788@gmail.com>
In-Reply-To: <20261113-submit-dw-axi-dma-stop-pause-v1-v5-0-8523a27b5788@gmail.com>
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

