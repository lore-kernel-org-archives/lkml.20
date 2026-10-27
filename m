Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793084452;
	b=K2COrS+/QOCs8GT2BBnRbpzOBDB3IxIDN12mz6YyxqKZtuOC5YeTb4EtUBXlrC1CZ9oL
	 QMBjIliKQOFN4smktbFk/FhdGfHZwPAM5UpCAgc0Z+ghXC1h79pWbE5UgTZjwqqCh7fZF
	 8EEhCz6/C3IngZuMjCV160JY8ytIJyu+gr3l2MXCmPck5ivLpZRYE+r949+JCA9UTJ9Wv
	 5daiW3vEsTaSp+4Tjrt5RNemrlpPseRE1/jHspSFcACBjbbsSb+lGb171LoqIrtO65xo7
	 v37fABf08SZU64T3Bf82dN0xZ4IaZG7KLhdyTkRrd+Bmdhh0g5DMjcZKWAa0VZUTq1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793084452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cGATTdkdECjcBWxNbblz5Map/VJxFsYs+1/o7jtM7Y4=;
	b=fAu8uhGbrWEsdFUwxpKpBQaL+ik/W5219LrODR/eR9GU5xq4QIjRlxdLE/Ht/0KfkU6v
	 5ihVyG4LM9QJYPU8N9uG+P4hysmF/h8G+ik9IX4CLA/4eXqJ3kDuJDfyHdD7mCwef0uYX
	 MZKqyex3ayJvIwFjPGweewxUJQ1rNngZZ0fq5Ytb9FCSFOt0vk4bw1skqUKOEL+W4OGHy
	 4uVjPN73g4MekHZOQIXWcg+aBGRYu/Xn7ri4Qg0FMW8Ssnptpfku7Z+LQS+b1I6pp9olQ
	 fD/5cB2RLjZGAsMpmTgw4oskfbvs6eL3cRYe3GEnzdn7Ug4aWDXyFx0zeFG6HvcslFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BaBobvxM;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60A0606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:00:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B60A0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BaBobvxM
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so420451f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 00:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793084450; x=1793689250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cGATTdkdECjcBWxNbblz5Map/VJxFsYs+1/o7jtM7Y4=;
        b=BaBobvxMsAvvi0DFhbcLtLgfU0Y/8bb8HS7Yk4YGK/byyIwtPmEGG6IyURf4EbuhxH
         pp0Vw/eVRZb/rnstVd6UP/ZYF/H9pWxsyA0oZF39NYsjNwg1+X9TidofS9cPLBR44Ijr
         mr57urbpSYlor+h/IdtrJ/BNIwYdQgkP0g9fbytdiYQY/QOIot4Rwdjq6Yp+dYGI3zYE
         ohcppaD3qOZce+3T8/1sy46+Ah5yp49TIjSYspOMS/6TAVbGLU4I4htShdAxmgN56F+6
         qrTv/mPeh2kE76mUw6NARL1toS6lB6QN66L/ks6sIZk82vgo7QRL3bstXJVeEZDBGPMv
         paJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793084450; x=1793689250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cGATTdkdECjcBWxNbblz5Map/VJxFsYs+1/o7jtM7Y4=;
        b=eQ7qbP7LYwNbf3fNeLUgMWd6e4YBAiMXhW+Q7BZ1uJCEwjlyn2Ue7zJ+JIvlLnVs08
         COvqX7otNUgSpX9yk7XJJ1aRFYpgeDhKaQ0HEIBXWzL4GRdPMtLWOBNYIj9oOpkqJ48B
         kMa+ZFOI264MleNkWjZX6sUAd+AIf0b0O3wLFFJTCm90ZSL2DCblqXcieUPuzCEDKxbm
         e9IJJCxsh8+nrLC9doM9FP2RZy2EpOQRJiWbbwQQhtJSC3UH6wTsBUXIot4P5hXrIJgr
         Heo6VXADj5k/xcqpQwmb7pjsFGjoA9kdAlBZFB2L/BH0wV5kzinchjT1EzaR/FHg0/u6
         onTQ==
X-Forwarded-Encrypted: i=1; AKwUvBygN2Rt6LHWAiTHdRV10y5113rjPdt0H5IbxX0GJ3oxvm8WNimw0I9tehFdD6CV9l6mQVV8nbgdMA4jGgE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPqrKS0ixN1LjLroPbKOzBWZwqPi3fGx57pMm33xrfKOj+i01Z
	RrhWkDWMc/zvcnEKoBfrVB91OXEL8y8i1IpQnHkSUe9/RN9ytt0NmvNX
X-Gm-Gg: AYBFou1Rk3gGD4ZQkQslWS4suVGLjP1LDJ2QVBeZzHhmH9hFhR41/ddFAfidZIUG2BN
	7naaXPbZQKf2yZaOQInSPuoCqg7e0aRD5ieuwuSqhxmy4HQVfMH3nXSI//Z908t8eRqwmrEUdr+
	K7kRVfVCMCGBQAyZc5M+kkwj8tK89hGH3u57G7CE4Rj9GaL2ZgFVWtk5iABrh5FsnzjEFwRNyIo
	za8Yv7RW+K37DUoBAIAdVe6yChMQmcd+sPxrdrqL3QvF7mrFQVpr+eFU4cjBmyFtgGOohVJN0oD
	pjE+c/V5s24suBpId9NJKMeXit42TVYsLk1msDhEVL2EyFohwrjfFIJk9flpTIqFu3MU12uxuDF
	bEhQvyvQ+AvxbEX9Hv+ftaVD2vpakiJ/ELBq3tJt/MsQ4bIYr9SnEyo4RNObSdOpDztw/aVDYt1
	gSn2C6I6CsfnIDWLIQhJKWdy9vYdHzq/9quqrD0R9OveCsElDAzMPx0vj+5aZ4I1yAXwBlDBHPS
	8a0MzqOWr5LI9ijJAcQkj3kZTXE0pNosy5yzsrJww2zkz/a1P86bbjWI3pOKfJjUKTG6Jz0g7XQ
	qiqGp5+sDTgBv+2foONYmZCrq+Ncy9NoVTYNkbpGbIV+VrUpDFXLHet0lwE5yasuR4uvuG0G9/o
	fTwGV64/c7DKS3/yeq+cm
X-Received: by 2002:a5d:6105:0:b0:48c:58b9:f17c with SMTP id ffacd0b85a97d-48e55a3ee4amr2846576f8f.12.1793084449747;
        Tue, 27 Oct 2026 00:00:49 -0700 (PDT)
Received: from localhost.localdomain (193-154-207-67.adsl.highway.telekom.at. [193.154.207.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f25fsm20270127f8f.2.2026.10.27.00.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 00:00:49 -0700 (PDT)
From: Andreas Gabriel-Platschek <andi.platschek@gmail.com>
To: vkoul@kernel.org
Cc: Frank.Li@kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andreas Gabriel-Platschek <andi.platschek@gmail.com>
Subject: [PATCH] dmaengine: pl08x: mark slave channels as DMA_PRIVATE
Date: Tue, 27 Oct 2026 08:00:37 +0100
Message-ID: <20261027070037.1809112-1-andi.platschek@gmail.com>
X-Mailer: git-send-email 2.47.3
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

The pl08x slave engine channels are only ever handed out through
explicit requests: DT clients go via pl08x_of_xlate() and the
platform-data path uses dma_request_channel() with a filter, both of
which end up in dma_get_slave_channel(). They are not meant to be
published in the general-purpose channel table.

Mark the slave device with DMA_PRIVATE at probe time so the dmaengine
core treats it as always-private. Without this, if a dmaengine client
is already active when the device is registered,
dma_async_device_register() takes a reference on every channel, and
the subsequent dma_get_slave_channel() from pl08x_of_xlate() fails
because the channel is no longer free (client_count != 0), leaving DT
slave clients unable to acquire channels.

The memcpy engine stays public as it is intended to be shared through
the per-CPU channel table.

Signed-off-by: Andreas Gabriel-Platschek <andi.platschek@gmail.com>
---
 drivers/dma/amba-pl08x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/amba-pl08x.c b/drivers/dma/amba-pl08x.c
index 543c2eb8cfa8..06881d3f29a9 100644
--- a/drivers/dma/amba-pl08x.c
+++ b/drivers/dma/amba-pl08x.c
@@ -2775,6 +2775,7 @@ static int pl08x_probe(struct amba_device *adev, const struct amba_id *id)
 		pl08x->has_slave = true;
 		dma_cap_set(DMA_SLAVE, pl08x->slave.cap_mask);
 		dma_cap_set(DMA_CYCLIC, pl08x->slave.cap_mask);
+		dma_cap_set(DMA_PRIVATE, pl08x->slave.cap_mask);
 		pl08x->slave.dev = &adev->dev;
 		pl08x->slave.device_free_chan_resources =
 			pl08x_free_chan_resources;
-- 
2.47.3

