Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794033423;
	b=KEHS7RcreNgr91WQqwaGMKoPPhy6vMttSfj96rDcxghrtBvjEmxs+QdqDfuN3hCZpR2g
	 0/hPhmw6RhKskoMkm9YEz5RB7/1SRwK0eMkInYNOmou8KhXToV42ATLyfImtLsBg4S3KB
	 Bb/MrQvFq5/RubVltieuQtC5SF+lMZ1afAGqC/rDKI0lqLN8IiR1tqeVl8C88no7b7wsf
	 dD932N3VRkoI1mE3jry+PYIp27aj+IzkfEYUndgfzvch22EyQteJTvnRuSTTpQ70LcluF
	 KJfBjvHi2DJfbz5c3nQvJuWFj+1ubsCP/TLtkW0x6SK8PNb2+IYOKEMmvcGvHmFrW5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794033423;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Nfma+fKmOvB8Kb+wDc6iuXdg0uKJemcmpk9R9n5B7+o=;
	b=EhWuGBS4MW6t5ytmx8uHWBPBylC9KRhhfEumKCSXwjGi4fLtkInkj4c+LAcN9B91S4+f
	 fCHGjLc+SJkrT1sgESLmW0QwK0lJTCIaSnGdGxPclGd7EDGlGazV4tmNal4XGkzaFL49/
	 i1nWp90Uc1N58e7khl2V6ccs7egEAUL+qLHWAKIbNxbjCfpCEzLfEqM2rGvj/VWUswzWk
	 tIazkF/ysXakv3dcC6vkCxBTe4VRcqVDxkvYM/v2HYrs5pkMTbnuDP5v5pCFBFfzZxB3L
	 FN89Ru3K9CzE0/YvLUqboC51r8Y7c4lFHJP8kuqQpVIsmQbMoRAfhGzWPslPC3vrE+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cOzjfxWL;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B9B606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 06:37:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16B9B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cOzjfxWL
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e8da6ef7ddso7723465ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 22:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794033422; x=1794638222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nfma+fKmOvB8Kb+wDc6iuXdg0uKJemcmpk9R9n5B7+o=;
        b=cOzjfxWL+j9lSpENTzhuwl27q9nHgq3B7LCdrsD34x25y4TBbS2/8Vsl29m2s8uwEE
         vqyuph5P2EplS/EpcfLSJEvAL/ujYPVeG3HiMR7R/6bM36fg8FddRBep3gYnW/rZj+wW
         7HcQ4iOEaWpB8JzQKogSwuS4hv70LY574AIYyYZa5QzADQbdBpmr7q8KDLL8h2GwSSCV
         lVVDlHUnIu6eAlQhBprgS3bcwylYKMlec59qSPMXEj7bOy1k/VO3LvWlWVnguFHZKEWU
         yyhVX+KYGY8tJPtNzxB4QDcMiIQmzQE7qEZfyrkFMauESXp+Epvt5xHlVSTQdvrY6VJo
         UOoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794033422; x=1794638222;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nfma+fKmOvB8Kb+wDc6iuXdg0uKJemcmpk9R9n5B7+o=;
        b=HunEe7ueLu51JASsHWBKlMdrONXCKV4XQKSM579OkpbDM0XTMSxwl12KGUVwszy7i7
         isKwUEBfj54M1eAQHa2keRdUOCdEGHaH6nNXGquhlsnIT8UEqy0cnEWQW22eTThmbFfm
         f6ON48kQi+N1Vd+O2YfwZNI5YspokUlQ7htgWoQUIR7Z1O10tzY9y02SEqhDMs28T3J4
         My2DfG+SZ2OeoVqXIumR0ZoeGISMhke5U49/BKdpBFY/TCtxHYlDra4j3baUwTu3p8/4
         T54lRxHfeqVG3+TrHLyDbQI+JxrHnmiHIXVn7lWufUu0sYw6IdEODXxnKUJ1VDpypN1N
         BICA==
X-Gm-Message-State: APuU4Z/NeN2it30XYS+m2iUrRHuP4IasAbLzKV/MLvd+D/O6+SS/2opt
	sDN0MX8m6+dXkeA2MjhkGaJXWGq4Yzu/BHjOYTQpXeZfeiOmiQn0z6O5
X-Gm-Gg: AYBFou0HTip1WgD03u5mB2cCUK4jFy1WdSFWs5HP8b3KPq4PwUYxNnFBhclOK/ZtHgk
	ZpLMC5sBTejzPKo92xj5OqFSW+y5tQWklQGK4iFESDSsU6mh7X7L4K/4CHrn2ghaeq1I/HkuCd/
	3GHBZ4eWw4UMIGZRMmfe80TBULyhQJ0MfXRPGYuwYxwsCIHtExdtE01uoG+9oudIqMW6ejfuNta
	Gc5cw0O0d+zqZS/+4XClRMPyxILSGPkCPOZBLPGtdWghpNwjyVnDj+mzJ4fWasUTtHVpM3PHdvk
	p0PLTyBrgc/dikGnYfwh66/QDmYmI020dmzTD+aasnp7ut53Vbtz3/sB3QAwGk+b2vzDya1sLKI
	Qt9EzrFtWoiRtNA4GXpQ/5koxADkAqiwNpA2zUujuL1t45HiuIqtyUxPdVjAxsnqnaLnbIjakSU
	OzgDe9GgmcY9JepN0cZuIrM7eLnIkHjm5kBUK1AlGP8kZowOCdUKZCe78DfYge7IoJYDG+Rr+09
	AoXjCES4BG8GYAJTKFLDFkoQHM1DNpkat66XSaZNEr7omJ82zXkjbjvyEgC4hpsFi19byWAhcZJ
	MoTTAdQng4TmxH1DTr92HJVUeS9xi+IObVdoUdumN2ACoimC
X-Received: by 2002:a17:902:d503:b0:2e9:79db:449c with SMTP id d9443c01a7336-2ed40deee43mr57053455ad.47.1794033422254;
        Fri, 06 Nov 2026 22:37:02 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47d5f792sm11115735ad.47.2026.11.06.22.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 22:37:01 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Neill Kapron <nkapron@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] usb: gadget: pch_udc: drain vbus GPIO works before freeing the device
Date: Sat,  7 Nov 2026 15:36:52 +0900
Message-ID: <20261107063652.3387873-1-hj351016@gmail.com>
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

pch_vbus_gpio_irq() schedules dev->vbus_gpio.irq_work_fall /
irq_work_rise (pch_vbus_gpio_work_fall/_rise), whose handlers obtain the
pch_udc_dev via container_of() and dereference it.

pch_vbus_gpio_free() frees the VBUS GPIO interrupt on teardown but never
cancels those works:

	if (dev->vbus_gpio.intr)
		free_irq(dev->vbus_gpio.intr, dev);

free_irq() only waits for the interrupt handler to finish; it does not
cancel a work the handler has already queued. dev is allocated with
devm_kzalloc() and is freed by devres after pch_udc_remove() returns, so
a VBUS GPIO interrupt arriving shortly before removal can leave
irq_work_fall/rise pending and have pch_vbus_gpio_work_fall()/_rise() run
against the freed pch_udc_dev -> use-after-free.

Cancel both works after free_irq() (so the interrupt can no longer
re-queue them) and before dev is freed. Both are INIT_WORK()'d on the
path that sets vbus_gpio.intr, so the existing intr guard also covers the
cancels.

Found by code review; not reproduced (needs the EG20T/ML7213 pch_udc
hardware with a VBUS detection GPIO and an interrupt racing device
removal).

Fixes: 637b78eb31e0 ("usb: gadget: pch_udc: Detecting VBUS through GPIO with interrupt")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/usb/gadget/udc/pch_udc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/pch_udc.c b/drivers/usb/gadget/udc/pch_udc.c
index 99b3ce2..5531094 100644
--- a/drivers/usb/gadget/udc/pch_udc.c
+++ b/drivers/usb/gadget/udc/pch_udc.c
@@ -1406,8 +1406,11 @@ static int pch_vbus_gpio_init(struct pch_udc_dev *dev)
  */
 static void pch_vbus_gpio_free(struct pch_udc_dev *dev)
 {
-	if (dev->vbus_gpio.intr)
+	if (dev->vbus_gpio.intr) {
 		free_irq(dev->vbus_gpio.intr, dev);
+		cancel_work_sync(&dev->vbus_gpio.irq_work_fall);
+		cancel_work_sync(&dev->vbus_gpio.irq_work_rise);
+	}
 }
 
 /**
-- 
2.43.0

