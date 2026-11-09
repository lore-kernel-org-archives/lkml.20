Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794200565;
	b=SguTYMFh2EHdty4oXcNDn+7uJiLhVjEMct26v9He8JmYBWID9fSAnaQWArQY5LaHXfWj
	 YOIGdZx3uXQpCBU9gh2aVJ59w8vaDv4h2lX13yudzY/VKzbi1sy2cpa3l0hc7qcW7LY7L
	 F0rUOCx1nhnjBdn/3hyZ2OK6C3Cd+P+CsdHmoGXmSh4BvjA3iJ0omZpD8NOiYkyJApDpm
	 Z1KiGLcvHklMFEPuITV+RNRXRsy0bSVOFcYVV6OfIS+7GfUheB9hum9A1aj3y1X9yQ0Us
	 2r8cTg+xOInCvHWVOEHb3tspptWto6H7gYRdkHKNJdHEQSVZpPE4kmldBw9OjBu6M3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794200565;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=HMYGVji39rvGpwUTzKWlZdi1xbpNuthDItoP5UGgcaA=;
	b=ifnIw2oRlf67/Bfd7ZmcUnkefn0UUwLdXZdJavEqR3Hr85xBYvwVuc9PvEAqoIYmw7aY
	 rra46JPOrti61Ibm0FfKoRxr9AS/A8F8ZDKRXJHwR34iUkv466zQFJ36JCPncMK2+zyD6
	 XMSMAaDENXWMEf9NlFHFEyj9+44NTwXj63VB25+n63tgh64n45a4r5GMrKNG/5SOVw6h+
	 GJfnN2XR4zanUP18RtsjRDvRXieldohZdhUbs36dzdmRYw+g5rWEgupOhPmScGSBt18Cs
	 kEGbyWkmhTBY3/AJJ1SDROjS8pibMHOc4iV+eDwVg5DKvrt11rsju/K0j5ngYcPu9og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=divDtsBF;
	arc=none smtp.remote-ip=209.85.167.182
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA85606A336
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 05:02:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CA85606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=divDtsBF
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-53dda625f63so308159b6e.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 21:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794200563; x=1794805363; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HMYGVji39rvGpwUTzKWlZdi1xbpNuthDItoP5UGgcaA=;
        b=divDtsBFxjKqkl9nF/I/bhDpIvPfTZ5U9B1J+E3fk7Mt8jF95qxY+ICc1yjqARCl54
         C6Jue4YCYHIP6bATImvTv9wiv7mPBc0xgrxd+2/mDXLecVGjN0D9+LQAwg2mQJDdlvKW
         KlChAU+ZKcbVkRW+uaknV66ff7No8KRbrc9Ep8uEf8k927fhdFa9+FIOHAC3hJl2Y0Ff
         L2Vla9SemlcwufoFoGhIpiXxNQmhBvw9K0I3vvORpXjs8tNqKR1infqjVzgRH1tAvNMx
         ssbPNejXK9GkPoZrlyWDg/IuoJa3XvqXiyikWqBZwLNSrlr8TpddOYcbBe9/2zz5gtD4
         /fYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794200563; x=1794805363;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HMYGVji39rvGpwUTzKWlZdi1xbpNuthDItoP5UGgcaA=;
        b=2h4f2kiKaVBbkKKzz91ldC+oFoHlcAae4MTFtlDdwcSP+44iTR8e2YQcov9CMWWBjh
         5YH0f7DbUF6IdXCvG+5d1wH/1s1C0Sn8QWjxgy2D1xWp8nxzi6xlzcQC+ixmkW3Ji0qH
         4/Eq1lJskh1AAJ1rtdBQMzYNZtJYuWsO6Jm5VrwM+CBot+cPBrS1QfFo9zf3qyOzHQtI
         B5IKv0n56DlptxlQXIDVyGGfEvLGNzHu26eNLDt6KcRXmO1SPMKjOtb0givfNQB/OYxo
         PElqkiw0jefUZ3KfsXUnnkZXkJOvfMTr3tvUhU4+nS1q+mFNAAzpvMzl0uWjSOJZLlel
         HMwQ==
X-Forwarded-Encrypted: i=1; AL+hErEnkdTgup5qJf2nh8JrVzq6mmO2K2J7T2mBJFO1gH75UC/3TVcIl1fpJUHxrD3iyMah62X1nM6zi3J3Wz8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+uIv+FXMWsfvn5sup1DshpAQaMN1mGunT3MKl4zgTUSoXO/Ce
	Vzo00RCL++0YGbWeMsDdTgC4RtLoh+r2SEmAYvDGd4JTb/d8WRns7NY8
X-Gm-Gg: AYBFou0zok/PPH6UEsDHnhxULnvhry7ao8V9uFDf1ziRGkhwZpJTQwTg4ZBURgcUMfN
	57c78Cs8pkhO/qoSAOlY3fz+Lm7jlbZD6ZCQhRVs7SvmOBl5V3gRP5b5nEZb4+VH1T4UnkxxmmA
	UDMr7HZ6l+FBlhwvregYP9u5R9/CHj+eqqJHrL+EPiqQ6MWPH8itIBjzzgHmpICrEAs/766wt+o
	DHLs65bTDI096WeGst8L4TqWAh2pV5stbAzENiN153gVEkPMNRuqitaOxRc1B9UIdvrs/oV3GIy
	KgPzEO7Iy3D2SV4Pon8ieXgmDXYgGThtz969lSXVGmTkFfYg6E0JryYX57vAa94U7NL+y/vQKcB
	xF1vbfxWjVzNXe/JWWotZP8vjN43yu3l0Tl0GcMgkychfWo5bnKk+HVXQQIdjYew5GjOknlRVc8
	x/9f4ssJ1/x4UKeCKk1/+DqE9fXCelpMiPS5+i/8INWi8jMXFQYGub2TRFTAku39nqxiLkVBAj5
	m7kg0p2/TYnUghjmSoB9o+WkqM59I2LaSBdfj0uRGGcUALrDM+ikQhj5K0qmXfj/7PPRxwfI3sh
	2wzzpI6byAeK3oUyXpyHtpDpfXI/oqFRBBEYNNRnUFhGeL9cN6XOMzFqISKnIJ27VKFAcuHdI8v
	AqukEcsIfGM2tqqIWJzds/8KErdLP6tBz27mqzkF9ERbaz0AFJgUTgE5yofp1q6SSO/tDIqWEAY
	ckQOSZf2tCHZhMiEI8m4Zdds37tyEG1kzbsAmOh4MN/wblf6y/L2L9
X-Received: by 2002:a05:6808:4fc7:b0:4e8:e664:f268 with SMTP id 5614622812f47-568145f3e50mr2135301b6e.25.1794200563183;
        Sun, 08 Nov 2026 21:02:43 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56813ac6352sm3570841b6e.1.2026.11.08.21.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 21:02:42 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 22:02:38 -0700
Subject: [PATCH 3/3] dmaengine: dw-axi-dmac: preserve suspension status
 until pause observes it
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
Message-Id: <20261108-submit-dw-axi-dma-stop-pause-v1-v1-3-c48ec19e9ee4@gmail.com>
References: <20261108-submit-dw-axi-dma-stop-pause-v1-v1-0-c48ec19e9ee4@gmail.com>
In-Reply-To: <20261108-submit-dw-axi-dma-stop-pause-v1-v1-0-c48ec19e9ee4@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2

dma_chan_pause() clears SUSPENDED even when polling times out. Hardware
can set that status after the last poll, including during the final
delay, and the unconditional clear then discards an acknowledgment the
caller never observed. Another channel's interrupt can also consume the
status because the shared IRQ handler clears every channel's status
before taking its lock. Masking the suspend interrupt signal does not
prevent either path from clearing the status used by the polling code.

Leave SUSPENDED to the pause path and acknowledge it only after a
successful poll. A timed-out pause can then be retried without losing a
late acknowledgment. Mark the channel paused only after confirmation,
and let repeated pause calls succeed while it remains paused.

Clear the saved state and any old suspension status when enabling a
channel or completing termination, so a later transfer must obtain its
own acknowledgment. These state changes are serialized with pause by
the channel lock.

Fixes: 1fe20f1b8454 ("dmaengine: Introduce DW AXI DMAC driver")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index de092f190528..33340f0e7462 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -226,6 +226,9 @@ static inline void axi_chan_enable(struct axi_dma_chan *chan)
 {
 	u64 val;
 
+	axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
+	chan->is_paused = false;
+
 	if (chan->chip->dw->hdata->nr_channels >= DMAC_CHAN_16) {
 		val = axi_dma_ioread64(chan->chip, DMAC_CHEN);
 		if (chan->id >= DMAC_CHAN_16) {
@@ -1161,6 +1164,8 @@ static irqreturn_t dw_axi_dma_interrupt(int irq, void *dev_id)
 	for (i = 0; i < dw->hdata->nr_channels; i++) {
 		chan = &dw->chan[i];
 		status = axi_chan_irq_read(chan);
+		/* Suspension status is consumed by dma_chan_pause(). */
+		status &= ~DWAXIDMAC_IRQ_SUSPENDED;
 		axi_chan_irq_clear(chan, status);
 
 		dev_vdbg(chip->dev, "%s %u IRQ status: 0x%08x\n",
@@ -1206,6 +1211,8 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
 
 	vchan_get_all_descriptors(&chan->vc, &head);
 
+	axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
+	chan->is_paused = false;
 	chan->cyclic = false;
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 
@@ -1225,6 +1232,9 @@ static int dma_chan_pause(struct dma_chan *dchan)
 
 	spin_lock_irqsave(&chan->vc.lock, flags);
 
+	if (chan->is_paused)
+		goto out;
+
 	if (chan->chip->dw->hdata->nr_channels >= DMAC_CHAN_16) {
 		val = axi_dma_ioread64(chan->chip, DMAC_CHSUSPREG);
 		if (chan->id >= DMAC_CHAN_16) {
@@ -1258,10 +1268,12 @@ static int dma_chan_pause(struct dma_chan *dchan)
 		udelay(2);
 	} while (--timeout);
 
-	axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
-
-	chan->is_paused = true;
+	if (timeout) {
+		axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
+		chan->is_paused = true;
+	}
 
+out:
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 
 	return timeout ? 0 : -EAGAIN;

-- 
2.53.0

