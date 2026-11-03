Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793744787;
	b=io0Ix8zLoPKsQ0JGqNpFv2BYKntgBc6GjPqmuba+OMuYgoKrvvyurrW6w/t32ZUpDiIp
	 CjRqw8uBeKpi9oU5n4IJJU7yfozBb+giX/9zJkS2AqWygRwkRTNHjqhZk2397M5bmAvN3
	 Me+8EIiLpzTlG9ClgIChczSvFUdQUwqApfX0ZSE68YgonH1C9rJ6+1nSsWTsITfbUlBah
	 VDkMLcgVkiDXzSOdgBCrkS1lfKbP6p573vufhuPAFH2pdZ5CzLKp1BiRZYATJlssHhiFn
	 61c65cBxUp+Uf5Vs0c6P4BKUBl6K+53+pXyJ/HoZBPITjI+t7cGy6VlcLevxYllV5fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793744787;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=5OFiyLgPB9gonzWakO9Dintvadbo1GwHe3HBflThFw0=;
	b=Ky1KV/3raIfbZtIRLpQ43Sr82jTmVHmwJ0tp/HqCVNpUD41H7faLoANRsjkQPunbCY7D
	 +hoP76UYbRgHacavhQItQExQLR5I6RVVmw4HOVhcNicIsP+f1xOZUgTL6VXUVwpWy/wNB
	 PmoxV1/fw2NZ5Orl7hl7L1fpGAukkSrjSbq97Ou9x6AOFz+aZNdxYG5NI5RnksjZEeuGJ
	 DI+jzLwNVRvGFzi9kwf1Wqgq6VPcfJeTJQgS+/4dhx6DSxQS6hQotnNW/7awt12rdymga
	 FA4gwD7mblqVXo3k4MnjrzeUDcXEO+8SVyOGP+ZLtw9dBoywO6XqKJ/HUwx0b3Dvrdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oDSEy2y4;
	arc=none smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6C3606EE8F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 22:26:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B6C3606EE8F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oDSEy2y4
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-8241a56cd70so49155a34.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 14:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793744786; x=1794349586; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5OFiyLgPB9gonzWakO9Dintvadbo1GwHe3HBflThFw0=;
        b=oDSEy2y4mEoyput0d7HZH2+P/CQt1HWNoVOHRzV7uXjZRzBiBfrK280iUJNwnrPmCY
         adEdVT9w+OEfyqm1bRn66R9kzEta31zqSn7dNPQH6jFVbLWMMxif2s+pPcJS4lO7dy2A
         kftW40Lq0X8YxXi0eNL59JdGlQ2J2i/+OxPv3CG4kIzjhFEmGCAtE4bTDFm/9O+pcrt2
         I/jQyvzgpQBv+wW3bdk3UJi4RbfNKjpRSUt3ZeNM2EkDjiFyxPow152UY7BqlI1YMPao
         XYhHgryLEJuiNUgeVoHJOJ4Z9tEhfByrBlWvEoJeO/tMafA+u9ig6YxN4MwPEpdsS7IZ
         hi1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793744786; x=1794349586;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5OFiyLgPB9gonzWakO9Dintvadbo1GwHe3HBflThFw0=;
        b=PHOaNrnVhzeiiZKnA0lk++vO8sLhu9hmC+XCq3lbWl/P1RgE4ZJXx7Pl4mmD0rlkSf
         X36Lmp0whwLpbtCVrwaHD5Gzzq3d7N5CGYRM07rBIWJ2h4u2+9jF0BhxLOxo4jixXL93
         deAknCk/auNbGoU8aDWojCMHM+eXBvYx6LVMIAjKeAy/SoO78WCDwM1SRw1Prs8/wQaF
         wQePokV5neid8Wq+V8yG93UcUkgJYig5MHbjtJ3TGAyQU/R6+98Xsi54/6czJ57+L3YU
         MjICrtagvV4oFb9gPLuRL98HaADzkc4juyzh8i8Sve+fdnlVe4f3fakwx+3ynsxruWlo
         vQcw==
X-Forwarded-Encrypted: i=1; AKwUvBzdkr+kIf3h/omOYeRfob7KEgkCOTpz1gKxEk5+z3xlNoFyBmsfh4zuJY0SL33/XaET3ugNvsTyRwY/QYg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Rri7Pk5HGUByQkgFpY3zQTuabCC//fRfZm19ai9zPfTZApmc/
	++gRcNlf8nSpzcFQZbhV5kQzMlscv0wGYnIkuN5RhkOPQZtg55JsBVidXDwUv2Xw
X-Gm-Gg: AYBFou2SDGY9mEVBxdLNTmu9qFYG6AlYgCvxfPaIHH5BHFBnuWmW6HaSfBu4bauKEh7
	X21M2ALHpSIVM3H2Cni8OzaaHQ93A4tsXzxbQvP/EXCrZcvhFTdik2suo2id5KfCvW2VLzbGry5
	5fMEoHgtG/vj8c6sCwNqhau2PkqXh3CC6xB7FjMT/n7tT5PM7ZkjM6HpM9A82Y+R/7oNO7bPYIG
	EjPqcQlOwLCPlcrocmCa9AzExl9exU9BO3twHKdFIdQPICpZUtEKf0fRi0S98Z49R3PSmaInb0r
	yrmmVLipLvEAKucPyI07jpffzQlFlWqLX32IvjCeVJYu3ccfb8yZKzVTHqCqx0RAoiGYxI/+P7R
	pXjDzGzcMiJJ5BuNutadhosssdUwGyTIFQPymD6PafIgBF83nosB/9vUX+/uBPvZxG7Qr0uOwz5
	0pSGg/kDbxhfzgMM+On+2EX3Tvn/bMe0j3ZCm5mho+Q6FEWWu23Z6axFWgfvCEBZHKJNLt2o4uf
	E9nR4D0KijMvvDrCMlbIvXhXI0rqRoz4iVSigrSPnSuEIQPc41iPBIeGUmfxp+FojfTNSbmmMfz
	/DNRKKRr6eLhfo3YQZKaE9SIpGDeE4OgaBdant1ZXVQI4ZVlG0nyZjVUA3+DyXc7CcipRUs8OtT
	xmbaQU9tvty2254UaJMS5Uf3qSH7CWA4HQ628OR1jRzLUjFi/WiwboAWMMLbXpGM5KUqexkAaMn
	2l/nucj0rWGGUMR2Mbi+8zKHnw8ZEEIelxqQnpsGVtso5ZznyaQOY=
X-Received: by 2002:a05:6808:10cf:b0:4f8:4a95:9b3b with SMTP id 5614622812f47-5640df9396cmr10547961b6e.68.1793744786246;
        Tue, 03 Nov 2026 14:26:26 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9ef58b1sm128435b6e.3.2026.11.03.14.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:26:25 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 15:26:11 -0700
Subject: [PATCH v6 09/10] dmaengine: dw: synchronize completion callbacks
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
Message-Id: <20261103-submit-dw-dma-synchronize-v1-v6-9-2ee0c348224d@gmail.com>
References: <20261103-submit-dw-dma-synchronize-v1-v6-0-2ee0c348224d@gmail.com>
In-Reply-To: <20261103-submit-dw-dma-synchronize-v1-v6-0-2ee0c348224d@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Dan Williams <djbw@kernel.org>
Cc: Serge Semin <fancer.lancer@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 dmaengine@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2

The controller tasklet can detach completed descriptors and invoke their
callbacks outside the channel lock. Terminating the channel does not wait
for those callbacks, and there is no device_synchronize hook. A client can
therefore reuse callback state or release its buffers after
dmaengine_synchronize() while an old callback still uses them.

Disable and re-enable the controller tasklet from device_synchronize,
outside the channel lock. Disabling waits for an executing tasklet,
including descriptors it already removed from the channel lists. After
termination, a later tasklet run cannot acquire another descriptor from
the terminated channel. Clients must continue to exclude new submissions
on that channel until synchronization finishes.

The tasklet is shared, so other channels may schedule it while this wait
is in progress. Preserve those pending runs: tasklet_kill() temporarily
owns the scheduling bit and can consume a concurrent scheduling request,
leaving controller interrupts masked. The disable/enable pair leaves the
scheduling bit and pending tasklet queue intact. Other channels' hardware
transfers continue, though their callbacks may be briefly deferred.

Fixes: b36f09c3c441 ("dmaengine: Add transfer termination synchronization support")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/sashiko-outbox-180707@kernel.org
Cc: stable@vger.kernel.org
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw/core.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index 56a422ba14c1..6f863fae7455 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -923,6 +923,19 @@ static int dwc_terminate_all(struct dma_chan *chan)
 	return 0;
 }
 
+static void dwc_synchronize(struct dma_chan *chan)
+{
+	struct dw_dma *dw = to_dw_dma(chan->device);
+
+	/*
+	 * Termination removes the channel's descriptors from the lists, but a
+	 * running tasklet may still own a completed descriptor and its callback.
+	 * Wait for that run without losing schedules from the other channels.
+	 */
+	tasklet_disable(&dw->tasklet);
+	tasklet_enable(&dw->tasklet);
+}
+
 static struct dw_desc *dwc_find_desc(struct dw_dma_chan *dwc, dma_cookie_t c)
 {
 	struct dw_desc *desc;
@@ -1290,6 +1303,7 @@ int do_dma_probe(struct dw_dma_chip *chip)
 	dw->dma.device_pause = dwc_pause;
 	dw->dma.device_resume = dwc_resume;
 	dw->dma.device_terminate_all = dwc_terminate_all;
+	dw->dma.device_synchronize = dwc_synchronize;
 
 	dw->dma.device_tx_status = dwc_tx_status;
 	dw->dma.device_issue_pending = dwc_issue_pending;

-- 
2.53.0

