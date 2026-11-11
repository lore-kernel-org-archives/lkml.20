Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794366920;
	b=WRM34XEyvb82i5bkAxdlFhemdkKDHWGmi0nyCryt1A4FeB8coGccVww37xEtL8Oigs9b
	 dCfA7seEMNw209NV72V0xAG50zSEjLY5HmdZOwIDiHuvj0LPnmHvXCt1PuSG0I+OZTmNh
	 8EpWV9/eUz60DAN+3Ma2CslHT1zd1ATV8DNvufc93z0SWArnqPs0LMLbGtTH+c6bulj3e
	 Ky+tLJsc5eNG0adFpN1zVlI9fkq1RO9vITrWFDwTTC/xE3WLml/IlYuDf/DhR/8Mx/sZV
	 NT3NpqHJAzZaBWs34NfkOOUPu1GEK8s3LiUwXXcxn7cjcSZTsNwgkeGp26HlM7ByOKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794366920;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=l0vi1fNrlrZmz7yWWkSVUxeGDZ97UBQBJwEIiwWZ240=;
	b=36vHNus/bLGCs/Nl6glUY1YFn/PoYh5FkAVBJrMnrjvAfJXzF2WYxz9taghts9emYSH0
	 ktn93a+eiIz/mqXza5/AO5wtnwXyaH4ciZ6eWjMEPiw29eu+5sFCnGiiQCd1Uy0xeD27i
	 Y1O4kubPFoLORDAlt6DrONy1sVItagBQqqo2H5+QlpOaGVM1qG3z8q9aYch/hYPq1MCCf
	 pQs/Zs4zCVqT45losX/7gXOH0qZZWjxxbfhaKBvxzNahIGYY/QREapISa2A4yZArOSaZO
	 g5N3GZGl9UX2WX8XPx3opkCeuKmImrTI6C4nhgliuORqucE5v3pr0T1zDol0qjLHsdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CmZtCQDX;
	arc=none smtp.remote-ip=209.85.167.174
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCE2606A33D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:15:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BCE2606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CmZtCQDX
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4f488ba6e90so1002653b6e.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794366919; x=1794971719; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l0vi1fNrlrZmz7yWWkSVUxeGDZ97UBQBJwEIiwWZ240=;
        b=CmZtCQDXkGsqoS/pnOdPykmsrEPZQfGaN5/EURbzXqNcLUwkPNpE2vX3tqlgkFrr91
         BFPEZ45ujN+xknq/WcbB+2JG2Xa06edZGeljUaOGN2j0g4W6yWyjTrWHmHNFMbaZ/cBV
         OIek6MgIRXBQEfP4fuW8GkihzxSvIWgua0zsWL5Z8BaywI4T0UM8vnUj6PJ5HdTuywuQ
         n/raSjacbgakZsSpfr617CrrBCwCyCswkkV9NcpgzBPtZcpI/3o2O5eMkUI0zVtKIgEa
         KM8ouVY3Q2oIivQdsxN8TAiieS64S38bt7P08MOHy3k82KgnQSTAvx9zRDwB4QuaOZKW
         /58Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794366919; x=1794971719;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l0vi1fNrlrZmz7yWWkSVUxeGDZ97UBQBJwEIiwWZ240=;
        b=OLkCPHzLcuhA4pZGklFTEyHVoqJSNJjDgFSu767ngA87lvo4pyHwCXbPwyYtByrYT2
         yWR8pHlix+iMrGGLt/d++DS29vtSyUjwBtIWPutj3rmJmzoybbCpnbzM4Kxq7GOLar/W
         yeWsAaK88Nw3sH7lJKZrEfstwysFW9t5gs2nm/c5iXukw5GbPCcYywt0+xlcpje2eImA
         tan2fWJ+73JsGwM6+uq4Y6+w91qLm3cBByoRhpSBCA6x4xvNPz7XhlZlB93gkAJ1TZoR
         Z+/wRwiNF2a9kHc9j1BsVfFEwpZZIvlzrtqZKsmPQIy4dfaQqlXT8DnsZhfmRKD9oWUh
         SBVQ==
X-Forwarded-Encrypted: i=1; AL+hErGNqSzeE5vUnCSV/qehvpkYaBYPFFesGFHv3AQwn2jD66O95EkVtLLO1cxpMSgjUqvSqdsB1rUiKBH4MWA=@vger.kernel.org
X-Gm-Message-State: APuU4Z84y8J1ldHgMsd79Nwx/1jN9hEZad+4rzmqbAUiD2sHDFnte0sG
	MNblfHL6OSXsEoLYfDvxn0ClQkNKGNvfTEIVWd9nBD7kiUTb+HeD/0M2bfJcGYQb
X-Gm-Gg: AYBFou2+HihxJoQRKxR4oBo3qTey4yQA6FyHRabLjApPo/FTA0dipbXbDfngnepKKo4
	g/KK+kX2tnDUYfiMwoz70P2Il2+BFh6Q0dt1Cn9ImQ1nq8jJlDzXHaIsMqV/QtJ4OWRa75MRZ67
	LR5zSDfyZ3GSKe+YNQl8KlFA8UisDS2LKreyAc8wgg6IV+inu+BeiLPVAvT3lLs9ntklRwpGBbW
	b6vPqNm17JMdnq/IPtxZenTcI2eZlYOKLgKNAOoB7dENJw/9fgHL2U2YsyIxtnypn9tyHoOSA1s
	oo1ydU36Arx46DMx2ZMp//1Vw7RVvV3HKgozuu7he4J+DrzzWEovtiJi9kk4fUf4je+omW6nXTt
	jRga++76xxH1M0KkEH/z1gZByL7VpW3ODZiqO9m3Ihtyss+YR9mhHCEEl33SNmffpMlfMZH1KoL
	G4up9AkEIwHf4U+zj6N7lPFFAUWXIFMwh2G7BOtOUTdNJQ23EOX5n64nOPxXbLEdNQqRQvsPhII
	wkaWIhTuTCqV3fkiTLAVJPHJBXDAw6WJ3Wz6EsSEk/8QaLT2RtGT9WklAjpmzQRy0jqTnTnhG7M
	iuxrwwBYmfUJ7stfvrcJiYM1jHR0NEOxIkXUnFJF84lubeFz/qw2U5PnE7llCiaVgmTBrscCXbx
	7xnKxXLm+/4WX8pJcJhCsfUwHAIB5SwxvvNw6wa3LZ3tZmC6atsB1VXuYpXS7kzLHN1UcLsPTAM
	L9ddAOZ3Bre9soR/xLF0PUk2QeF3T2PjFMhLhaJJVXhw9l4hnFZho=
X-Received: by 2002:a05:6808:5198:b0:4f6:2ccb:c2a with SMTP id 5614622812f47-56b9861e983mr995316b6e.68.1794366919240;
        Tue, 10 Nov 2026 19:15:19 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm3999345b6e.3.2026.11.10.19.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 19:15:18 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 20:15:13 -0700
Subject: [PATCH v3 2/4] dmaengine: dw-axi-dmac: retain descriptors when
 termination times out
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
Message-Id: <20261110-submit-dw-axi-dma-stop-pause-v1-v3-2-35fdfba8b61d@gmail.com>
References: <20261110-submit-dw-axi-dma-stop-pause-v1-v3-0-35fdfba8b61d@gmail.com>
In-Reply-To: <20261110-submit-dw-axi-dma-stop-pause-v1-v3-0-35fdfba8b61d@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2

dma_chan_terminate_all() warns when the channel enable bit does not clear,
but then frees the descriptors and returns success. Its synchronize
callback only drains virtual-channel callbacks, so terminate_sync() can
also report success while hardware still accesses the transfer.

Return the polling error before detaching descriptors or changing the
peripheral routing. This keeps the transfer resources available while
the channel remains enabled and lets the caller retry termination without
treating the timeout as a successful stop.

Hold the channel lock across disabling, polling and descriptor detachment
so an interrupt handler cannot restart the channel between the stop check
and cleanup.

Fixes: 1deb96c0fa58 ("dmaegine: dw-axi-dmac: Support device_prep_dma_cyclic()")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index 2c2435c36ab7..a9a87589324d 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -1187,22 +1187,25 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
 	int ret;
 	LIST_HEAD(head);
 
+	spin_lock_irqsave(&chan->vc.lock, flags);
+
 	axi_chan_disable(chan);
 
 	ret = readx_poll_timeout_atomic(axi_chan_is_hw_enable, chan,
 					enabled, !enabled,
 					1 * USEC_PER_MSEC, 50 * USEC_PER_MSEC);
-	if (ret)
+	if (ret) {
+		spin_unlock_irqrestore(&chan->vc.lock, flags);
 		dev_warn(dmaengine_chan_dev(dchan),
 			 "%s failed to stop\n", axi_chan_name(chan));
+		return ret;
+	}
 
 	if (chan->direction != DMA_MEM_TO_MEM)
 		dw_axi_dma_set_hw_channel(chan, false);
 	if (chan->direction == DMA_MEM_TO_DEV)
 		dw_axi_dma_set_byte_halfword(chan, false);
 
-	spin_lock_irqsave(&chan->vc.lock, flags);
-
 	vchan_get_all_descriptors(&chan->vc, &head);
 
 	chan->cyclic = false;

-- 
2.53.0

