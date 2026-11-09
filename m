Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794268633;
	b=P/hMgc2Ibe5Q8iodEyNpLLTDplAvf9gxObRd0eklCwzYjfOsNDLjuU8v2Sa3QLCL0tLc
	 xprGK63NNShMN2LR5DCzO8D+2EH4GfhyP1PNqi279aYlqg/aCrN5D0x3el0sIYENkDcAS
	 ohfMY+cP0Wk9DG37cnK8ZJ1oVTMEldl07scXVbjwu0nq/48UPL6CEyy/PASevnvAxbQ6T
	 bespBsPb2GB8M1EJpCJIni0cwQrsPKkpv7UMlGRP4hSkcXI0X5NMho2icIvMWcp7Vf8rl
	 dV8x0/wMzTUh98Al7D2ZEyoH4aHU1iN4w95HdZNgWoDmXlAWl8yOaQWRqXsIUuIstuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794268633;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bUZiKxiN9UwTPTT2/T4hOmDQIJacds4pPM6KBGzyM+M=;
	b=OtFdLTEKa46NeAEa9jnSJYNLPFJMruzeXfx+r4rufuW+zlLppE8shmTxVjBUTyFPECOB
	 U5Y4BkNQTlTVx18yiLhloubrYssIL8HD5jSnTDzzGaY38NHMqn3/uk/LMHtpPTU3/FVw4
	 fdqfIY2/DZ076kyjAhgZ2Xo/pX+w34Dqe6DmVW7y1L7L2ex+iwiU2FhyqT+IakeWwcTXR
	 0MHZZqJenKISuxGEkHDeNObprLpWP01wbzyqS3IjueIs3YmMekEfghorTojliSMoULqlA
	 R1XJM2O5xdGhnmbE0ier2nlklW4RxjWLGEIo2+vW6/J3e9uIzl9Fm3HFxlyPdKa3pzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=04yOWM+k;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5869D606A339
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 23:57:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5869D606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=04yOWM+k
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c40e02b2ebaso215251566b.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 15:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794268632; x=1794873432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bUZiKxiN9UwTPTT2/T4hOmDQIJacds4pPM6KBGzyM+M=;
        b=04yOWM+k/J2vJbOxXUDh0EaGXrGbLl0A81Sa17tERghvsaeSGEUO1m8vCuE+0+wxPp
         HMFndcKqi/rv+gYljgNu4I7TSaM1tkBnQdHQD9w7Iu6SB4UBq2NJrwwHL9hJyNk8Z6Ce
         wOj0pFWEtBGWhXXIV3v/uIBAjos0vitOGtyzqEe9Yyzw0ssFIs8Oxeq/QFZvhMG2qUU+
         9hHHnt73d4ll6A+gbVoYH2CCuGXmjxJ7xktkY/F2hgz2rG5LUc1F57PUedphiSVLw14Z
         WNxPyfzyBWjjULTdAKoRskqhPCQwF0chapsEaP7o7XEpZ5zcFzMNmvWz5HeVNENRAdWv
         ePhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794268632; x=1794873432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bUZiKxiN9UwTPTT2/T4hOmDQIJacds4pPM6KBGzyM+M=;
        b=CzPMJTav2BET1k446U+v+RoxNAEUJa8SMv8rY78NVZVV2GKPuueEwN/XR7SnHr0wZw
         vun5UaU1c47hA1EesSnmfTYYOtoFBFLrDN45ZDg+vCnJPo6pxMpPdt+IunQLgd0gxhb6
         LxLH8ITMwvHKJpoya/19QErVGinK/V75onolYHMchYgyO+qxLKT2XpPiGiqRRv1lT3rm
         7/3p3jcqDXrzMPIaf0EvXlmLiLOhPbDUtndAGjh6kug4mjKp+nXvF4ZUKxX+mwoP00Kv
         xuSBzkqs21O6P/IjWSwAaN2nlYMolqvo42Y9eI9327alVwHFS2D37k7K+psoBAghqeva
         hCnQ==
X-Forwarded-Encrypted: i=1; AL+hErGRvK2aR57cAzFNT2LXj4aAY2Dv05z/gDtlprCWuWcrqm9DnyjATi2Cy4lHhvGVZ1trz7JY07z46Nm6WZ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XnQPFedfruoFQ3h+pjjXwQMl6eJHJXF+9p+PdwP6nFXgYZa1M
	6PhTo+USZnBgeyeOzoTtXMqsV2gNiYOlyAPDmHe7Iv/FNwIaojlaEj01
X-Gm-Gg: AYBFou3//ozdI4mdItIJu1EIn4MZ6Zyuh0pVIEDHhdwACCsJ9uJElTQ7hdM8YYvKnFH
	hYRgXdvuvTXIJ8N8LM9l6GYgxITrMki5GFk2T2dcHLgr1GTdFlDEJHltohxXGFHinsNLxxR6sqr
	bKybBpq5iCGxpDcClgVc5xFHJSb0XYIXistTy7zUapaC4Yr2l2eypgQu4/+o0brcOc4wJ/cIEIi
	31dOMB6kZF2PBFctzKFnmQOMe/OQ0xeP63n/bOLNvi1gdmsa1E7IHZxvwCr2fnz/k7VNOBhu9Iu
	IHvO6++GYi+w0E1hb8a6C5ZCzWXdlnr0EBRUgHJqWZyHq1vpNkA7mOaDr8Cd3US05BX47TFkGj5
	MqD9SzIlPzIHb6bscx751+x3xjGq3seq9SF6IbuAoO0YyqzuaWSppRH3ow4iwrflGw7NNwOZ29C
	GrczxaTOplt5ewxvtiLk7Lcf4PfuikZfNYiuWR4gE4B8t94Cxvrki3WLjZjSZ1N0Ty2/PuKw5Tt
	U+veTKxiFvbwrPo1YNNveGiM6Vf4vRM5DCYJuaPLTODRzTnpUBLQY1S0fuJ4S117A0oYwqG1qT9
	hiFWHKavB49GHeP4VtZO2mMMVKN24wU2Zw+i94ugVpdPq5MwZF5lQ6I=
X-Received: by 2002:a17:906:b2d8:b0:c2a:b1cc:158d with SMTP id a640c23a62f3a-c504964fd7dmr42259166b.32.1794268631803;
        Mon, 09 Nov 2026 15:57:11 -0800 (PST)
Received: from localhost.localdomain ([2a13:e746:396c:c600::8fa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a56b772sm33725066b.16.2026.11.09.15.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 15:57:11 -0800 (PST)
From: "Kordian Chmielewski (mlody1212)" <kudzo51@gmail.com>
To: netdev@vger.kernel.org
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	bcm-kernel-feedback-list@broadcom.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 4/7] net: bcm4908_enet: unmap the buffer of a dropped RX frame
Date: Tue, 10 Nov 2026 00:56:57 +0100
Message-ID: <20261109235700.2586821-5-kudzo51@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109235700.2586821-1-kudzo51@gmail.com>
References: <20261109235700.2586821-1-kudzo51@gmail.com>
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

When poll_rx() drops a frame (too short, or not in a single buffer),
it frees the buffer without unmapping it first, so the memory goes
back to the page allocator while still mapped for the device. Unmap it
as the path for good frames does.

Fixes: 4dc7f09b8bec ("net: broadcom: bcm4908_enet: fix RX path possible mem leak")
Signed-off-by: Kordian Chmielewski (mlody1212) <kudzo51@gmail.com>
---
 drivers/net/ethernet/broadcom/bcm4908_enet.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/broadcom/bcm4908_enet.c b/drivers/net/ethernet/broadcom/bcm4908_enet.c
index 8008b44a4..778920e37 100644
--- a/drivers/net/ethernet/broadcom/bcm4908_enet.c
+++ b/drivers/net/ethernet/broadcom/bcm4908_enet.c
@@ -653,6 +653,7 @@ static int bcm4908_enet_poll_rx(struct napi_struct *napi, int weight)
 
 		if (len < ETH_ZLEN ||
 		    (ctl & (DMA_CTL_STATUS_SOP | DMA_CTL_STATUS_EOP)) != (DMA_CTL_STATUS_SOP | DMA_CTL_STATUS_EOP)) {
+			dma_unmap_single(dev, slot.dma_addr, ENET_RX_BUF_DMA_SIZE, DMA_FROM_DEVICE);
 			skb_free_frag(slot.buf);
 			enet->netdev->stats.rx_dropped++;
 			break;
-- 
2.56.0

