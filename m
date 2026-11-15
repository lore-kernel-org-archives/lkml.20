Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794727191;
	b=VZ8WHiNCcMx+8RPtROOURoezlSto+c/Zk10dIfDsnPQcjNGJtQcvevikgj/7Ycx6JJ6G
	 4fMNNNvwzdCoI2H9NGZMPvoxCa8XQFEgYPymjSZM/cTy6yMZvhDVTFbXkBSiDgHGYFmRI
	 QbEeDOKUarYV7m+sv4Ea4IpMSzV5Tm18nvaLzmyjAv5ldkvRMb4gBpLAlzPnY0Jr8Vzjw
	 44+O7adPy7ZYGZ5MlaSwHLMZVzHvbMknLDTgfyS6NdoQmdiO4/J/GErOTBZkdD4SRRTsx
	 p//qxR68HOzdF7liP/SXKd3oXslxnzeV2epi8sn0QEEePa5QlYluP6x7UxVwgnMiSpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794727191;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=tEAC3AEP0gmVOZIrEp2K5naXDusA8lAF2Ew6yHoW5j0=;
	b=JXW0J5jMAdA5Pe5bOho5mx8hkhmCk3tc1VGu8AiGH1mNjmywtmVMAHWSACTKtnBSY6PI
	 oH3vRiH7iC92H6nsp5sIaNI+1Uly5x20GAR2s3QaJowMzHzL0LYNZMzyrFlJwtoQh78MQ
	 OutgZWybzpDjL3DIrauL3lq46BAWR09Mxs7e3JAbS6unqFeDoU3xbCO9Nbt3/WlfimXbo
	 A0SYgb86V/7pYbYohKCgAdrmLYwTMYU2iS+Pa6UUC9NNvzgQzzEEuQdea8qhU1Z2ocrh2
	 rbmzQuTy6et84e4wBdQAZd0WUNBemRvBbW0zYMQeAAvQa5rEc6Cs8eMv80WKOrvyFYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ErPm0KHX;
	arc=none smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C027360A2627
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 07:19:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C027360A2627
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ErPm0KHX
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6df5e315bd1so2780451eaf.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 23:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794727190; x=1795331990; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tEAC3AEP0gmVOZIrEp2K5naXDusA8lAF2Ew6yHoW5j0=;
        b=ErPm0KHXB4Mv060O7w91PxAQZnj4lSzJqaCrlPecymxQxZufCsxz6cv+hYWfhbtihU
         pdJqmR5A/OiXJ/6cVyyp6OOa9ckp4ZrXzfGv9ttSWI2Wer420pQOhk64kRy/kl4I7ncS
         EaF2NZJtozE1gSVbKoePM1btESFdANQr2KB+8S7+0x8y4BrZfEg6Sm24malWI/UyEst0
         +JWgrXFsw4Ondp1Bnr4KDxzb220OjFurLOOTr/hXUGDG18a0K+cMOCX5CGs6ZUQUGC7s
         ++h1hAvHkHb1fHmX1ASQBODhwj3+xSwSTDOC+huEIrHtHpTM8it1Ig3jrDHMh6j2iViZ
         L1Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794727190; x=1795331990;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tEAC3AEP0gmVOZIrEp2K5naXDusA8lAF2Ew6yHoW5j0=;
        b=Fw32yTUeQmHcm633TNYi7zicGiNNiLn4aGNjNCqo5sSMfwPWQGL9/f+1hc25bAsCgF
         5z5iPwTA66aviOkxcTDPSM4ozXETjg7KxMN+Kk3BOSKPsS0IEv4gxsX702iqFfg5/a5T
         e7qjp6KK561yjRQsJFkfAXswlJAtV6FDCjA+6M7Nz6jyko+7Z39y5wlUu3xKxs0m1yep
         m3mxUb5OqkdCsVrMB7g4VaeXRYcKdBRB98x7l5yLMayeEB6kc+GaN17pzdn+AqqKVcmw
         b7PUZdBNA3bCFP+CI2lFx+stmTZ30CiaOpvyYFwez1o2EDrQYZGbRBrzw0y10fqplspS
         VBwQ==
X-Forwarded-Encrypted: i=1; AL+hErHrj6D70m3q3Dwr2b2nUN1IGrHLjriT7ygNRRwlQDluR54ZWZeVG1myuXW9D+BazHrBGBBcBES3sz+MP6k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VZVb4Jv1AEb/SMVfbO1RHBRPcoFc/AcjBB70Eu8ve+ppCkkAc
	hNHvtE8qZ0V4HO9A6D1bCtkoV0nwRebUYA1hr6PB6rZBuaJEeAiX1N3H
X-Gm-Gg: AYBFou3d2gmjdjULI1JIXY6O0kcB6d6g5i3uxL3NcQiSoqkxj93DRNqkagi7VDXB4f8
	cLj+jV8cY2UPMpQY0m4B7/V714cJ9/V+tgr+/gkdXY+HUDNFr6ZNCcYbh8x4HHbTz89FDSL9Zym
	A8f8H8S5TCCZ2LPC8SnVnRiiw5vqdo8/tatAyX7pYRVdqRzwUoK6F+x88RpQ3wJG2C1fKJmu0T6
	L1p9gIZr+rOwDoWbM8ofJcFS6mVVRgS/QgCOuiJVjALNRhGBaiVjlDoyCP2imRGrVWJMmLgLr2q
	s5lzUAgL324zgduWvYsiSxlqYkOLx+pMvW+hgihXrBhpHxb5sb0RItQef33NwLAxl0ELOv1BFpa
	Qn/Xb6gIlrczfsll5q4WwEKqYIvm4ASiRhgq+eeNxpKYl8I9HZhlLqr85GXd5hNmnL3enAuonM7
	qljASDzgYiOT79EbBqm12VXcvAIo+gWbNDmhmvwvbpKoSQ/x3MCEY/mbq26+NPs97EoMrA5aXF8
	hOzCTAeTxOxK35YcbHZkDXefNoVidfK0wmBl5loOL3NgnBfr2eSypgm0sWTRFEYvGsJUSopvpg4
	IQwr/FCy2ABZ/UQLf4qtSlS6IqESsR500Qf3fwgjMBhMaLjRfIEMwigovovVHrovvgMZEBeir3i
	WAEGYZqk71bvJszxplgJtjKrdtNj2Oj8fg6x0DsZv437uIx+1KjbDjaSCVXcfRF39y2BIavQkZ0
	CWe8leBSaNWeeHmtt6wdN/7Z04/gC/y/97qO+gLVfcULBie3dTgd0=
X-Received: by 2002:a05:6820:1385:b0:719:204c:fae2 with SMTP id 006d021491bc7-71ab4fb81e1mr4716551eaf.28.1794727189811;
        Sat, 14 Nov 2026 23:19:49 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ae860ebd7sm1145321eaf.8.2026.11.14.23.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:19:49 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 00:19:40 -0700
Subject: [PATCH v7 07/10] dmaengine: dw: report residue for queued
 transfers
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
Message-Id: <20261115-submit-dw-dma-synchronize-v1-v7-7-8d58f3d49e4d@gmail.com>
References: <20261115-submit-dw-dma-synchronize-v1-v7-0-8d58f3d49e4d@gmail.com>
In-Reply-To: <20261115-submit-dw-dma-synchronize-v1-v7-0-8d58f3d49e4d@gmail.com>
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
 James Hilliard <james.hilliard1@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2

A submitted transfer may still be queued behind the active transaction.
dwc_find_desc() only searches the active list, so a status query reports
zero residue for the queued cookie even though none of its data has been
transferred.

Search the queue as well. The status getter already reports total_len for
a descriptor that is not the active transaction, giving queued transfers
their full remaining length.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Fixes: 3bfb1d20b547 ("dmaengine: Driver for the Synopsys DesignWare DMA controller")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw/core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index 3cc8579f8829..c602ea01cb83 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -927,6 +927,10 @@ static struct dw_desc *dwc_find_desc(struct dw_dma_chan *dwc, dma_cookie_t c)
 		if (desc->txd.cookie == c)
 			return desc;
 
+	list_for_each_entry(desc, &dwc->queue, desc_node)
+		if (desc->txd.cookie == c)
+			return desc;
+
 	return NULL;
 }
 

-- 
2.53.0

