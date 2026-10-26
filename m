Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008683;
	b=yOlWl2c4wWlt5nM4MRqt2mAQED/uzclXfXYM7WDD/u1hLmzNeFYWZC979w2biQP2zYvS
	 AYw9FS4eSLDIbeJN85KH5pZF0SJP+jAhLzGYMC7blOrCXRVblSd16zlPDiwbN9lzQo6hb
	 FeetkSZqecRKiQwegTu9MXmBLsfb5JtjagiD2bugoFh7r1EMrhkzec16XhextOgLDpcN1
	 oPSsR1n0XUN6YuF1TpZ2Zan7PlwhReZhfebXm1OlcXB/ErfLDGprmjJ72+gr7WzZK0huG
	 MaD3oPvobNoIw6vdaKLaICBhn64+VqJHWP9Wb28v+WgnGZ+BtbjhtQu4oQGxPM6MYOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008683;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ZkrjTGKpjcuZ/tYx9QE/Yhm7rGoild+k5lq+5pxzVsM=;
	b=h+ENdUwDwcN0w7y8lrMRygAiNeyT1b9/bSu1idGeH4MXRpuDvz7ZwL7Ow1tgXEgA4Xks
	 0if42noV07ZpEZoEhqVksITH5eI1n0eZGHJUK5Um2KM4PzztRVspVihoXVuw5R54PMTFO
	 dIizkWYXlRAm0Suq5/cYg99+yl5aumwZFvXXSitqWDK5IIRkN8adp5HEsI2BWTe3VuQo6
	 LoCxAgGU33uo7dXhDNeqfNaAVAhjrxETMdn6c99iFSHw72Xh1DyjDmTGLxxzrPE1z/ooN
	 Mf/5zkPPgD3tc1yCSLAXWMVH1vi48UTq3hCeInnxRtwnQ7Fv8K9mDfxhC8YIPiLKHHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=A6kLDphG;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F4960A2631
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:58:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1F4960A2631
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=A6kLDphG
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8a05effaf8dso1821991b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793008682; x=1793613482; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZkrjTGKpjcuZ/tYx9QE/Yhm7rGoild+k5lq+5pxzVsM=;
        b=A6kLDphGCGeqVBVIeolzEZd6o3SSCK1ZkOFxV27r03qo8RtyvT4ZnCpajo9MMtrsaq
         SoHCYtJYk9j4zhW4f66GSang1cUaCaUdcuc0vzqeZkGoyvWWyz3KeXWozD3or94/BWgF
         w2LTxmcmIpr5dyrE7rRw7bMnU+duIlwOXfto3FQiRLANBRa8m6DdRvOC4vKWA2fz2Bs6
         XK8Pih/q565zVV56EB5wEls165pNOkwkoEggmMpfwpXwI9J5it0lm4OiYBC93vSY1iwJ
         5Lo89sr1Zgp27+ClVP9t47y/uMOII3u5ZcwBSVUELfE9UiS3C2BN6xyTVDlGZ7/dahZ0
         wIHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008682; x=1793613482;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZkrjTGKpjcuZ/tYx9QE/Yhm7rGoild+k5lq+5pxzVsM=;
        b=IB76Z/n0RJW14u2gC+JITrW2NyvhUmOEzWunu8rE6qTndzpuD+KCZqq5Qdx0zOBzZP
         OTNxHyhAnqFhmpGWHs5bb2auO/GgEiRdGUktUhGOOAdUJyYSyUpUo0Z1R/YVoFbNIZ7H
         gpXFnNX+TFy+Zz2MjYK2gRyvSJ9H5ppfHzGMjUJkNf/20yp0vMKj6UnIStwiAG89PGZF
         IXaeGWqxDJ/uyteAEBsCYmpBfXLDhqJA7NjfEtbTjlmlSbGmfSrKOQ4/uISBKHD44TZK
         Nl1Ai2UzUjfXX/UZzFbQDJaRKm/Kho8NmhldZ6iCSTeyGgIQT95ZWLzg1SmJ3lV7fpeF
         u9BA==
X-Forwarded-Encrypted: i=1; AKwUvBzmNcjIGWy1d5BbrML2aY2lqIePXL5oQPCuo6AyG5ZxHQTHcBGBtfjMd9VwwWHhF5SofjiluqZiS/vfwno=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6kjsRnALNr6834lx/W3HMAY8cyaTmMP1nOiScmZ6U/ISnoeX3
	UAoZV1VaTN3jpkk8Go6OBW5ofMlN5ohRRRTqwObOMwywVDoaFD3tV8qs
X-Gm-Gg: AYBFou3jGxcIKX5uT0eu3YekDA4zH724N9FCtAJiZUSL1f7tdvXZL/9hND5NRiZyxFE
	bnKWl5ZOF1j19Z61ld5MjghIZJq+LR/3XGXIJceVQNBl0dvddqiucAjlqV8EMIktc67n3VT2z/X
	JFEskL1sbv04KkPbB0W8/m0tl6t/f+d0QQGCnoWRKNIUThpy1jRuRGA9bEksW/pWMZaEyJB05BD
	hdXwiFtaGitiepP9qDy8mXCH+1yUMimA3+AlYMo7u7krqk2jSF2suWDMoQ+au3TrYgqn9FVQmsi
	CeuCAqtA7tTh7xq+L7CbW+IqLVoSM2E9HnPvcZQ1A8xALDDyzFUijVxdY0cf0gMZlWp+Vs8Ovei
	gazTeVkmUtn9j1NMK4KhlNaF51hIBbiCTfmee+LfT+Lvtv2y0kB/eqMsgRIxjHPdgf6IpjBgK9k
	ByDaO9h1j+npdl8pm9CAouuNaYiU1lZgTCceQZ619Q+Hl5GgtbwkStxZ/nY7MDIYwtaUZ75Pq3t
	rCjgbjrP07n657LDwK+Mpio9DptOqZs4ZZLj5Fjhe408S9tdQwwOODVmtTuVSFK/GHoQyC8IyS0
	tmLqdtczNQ==
X-Received: by 2002:a05:6a00:9093:b0:878:3783:8a88 with SMTP id d2e1a72fcca58-8a3689a9e0amr5082831b3a.52.1793008682324;
        Mon, 26 Oct 2026 02:58:02 -0700 (PDT)
Received: from [127.0.1.1] (59-127-145-64.hinet-ip.hinet.net. [59.127.145.64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a36bf0f4dcsm1095577b3a.44.2026.10.26.02.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:58:02 -0700 (PDT)
From: Zhi-Jun You <hujy652@gmail.com>
Date: Mon, 26 Oct 2026 17:57:29 +0800
Subject: [PATCH net v6 2/4] net: ethernet: mtk_wed: fix reset condition for
 rx wdma
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
Message-Id: <20261026-wedfix-v6-2-a52f6b15d2fc@gmail.com>
References: <20261026-wedfix-v6-0-a52f6b15d2fc@gmail.com>
In-Reply-To: <20261026-wedfix-v6-0-a52f6b15d2fc@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sujuan Chen <sujuan.chen@mediatek.com>, Rex Lu <rex.lu@mediatek.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Sashiko <sashiko-bot@kernel.org>, Zhi-Jun You <hujy652@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793008668; l=1247;
 i=hujy652@gmail.com; s=20261026; h=from:subject:message-id;
 bh=KHuNb2dXEaBZgB0w45LgKUexXhH4JlXqWzUxUbg3sfY=;
 b=ZGYVb454jS3iS7dka2Wxnt/z9ajD8qAN2Wb5iUIt2lWi9KINhIlEdsUJT8NTJapNe+/51Z8Oq
 /hngfvKzvT+AkkuPLM0fGdef/c2DGWGBEQtdQ/RmPTv9fVm7MLdmsdb
X-Developer-Key: i=hujy652@gmail.com; a=ed25519;
 pk=uXjqvnRsKEfHEyUr63sOg4fEJIDs4AmiW/rB1cWarXg=

In mtk_wdma_rx_reset, currently only resets the CPU index of the rings
that doesn't have a descriptor. This is wrong because no descriptor
means the ring is not configured.

Also mtk_wed_start makes sure that all rx_wdma rings are set up this
would lead to no ring getting their CPU index reset.

Fix this by inverting the reset condition so allocated rings will be
reset.

Fixes: 4c5de09eb0d0 ("net: ethernet: mtk_wed: add configure wed wo support")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/patchset/20260724172040.1653-1-hujy652%40gmail.com
Signed-off-by: Zhi-Jun You <hujy652@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_wed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index d55042ccaff1..3f0be70c3f14 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -257,7 +257,7 @@ mtk_wdma_rx_reset(struct mtk_wed_device *dev)
 	wdma_w32(dev, MTK_WDMA_RESET_IDX, 0);
 
 	for (i = 0; i < ARRAY_SIZE(dev->rx_wdma); i++) {
-		if (dev->rx_wdma[i].desc)
+		if (!dev->rx_wdma[i].desc)
 			continue;
 
 		wdma_w32(dev,

-- 
2.55.0

