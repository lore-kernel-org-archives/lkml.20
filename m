Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794750569;
	b=x9nGA91h4tcZjYoYcdocmhVhp6FAPC3Ppw0OEMO844k+h74G18vuJT3y5vLicAFbnXkG
	 OiVty75DXJsnFQP+WhW68soauCeQPksMyXd1uAsoUOeXX+I0uyVJoGTBHEuGSqCgIU6zH
	 pkfb75CGpKnDYHGA1wzvPnuI8OPjhEBBOnEXhm4ZjsLlua70mpA0avp0IvANZHWU9K/fa
	 cLxXnj9XO4N6xk5qg4sQkAANM1X2eWW4GtXxEGYLr4TZXrSCusQF8uqr12Iw6AAufmNJE
	 /7AE+HwHdl8SCt49hTEvAFv0G1OvCMuSO8DTYFBUihJaVDB0xflvJVC7J4q3mJqGlhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794750569;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CIMU95vHnqa1nwXCV6m6LvgiRUwW6SKBilk+Lblrfz8=;
	b=yZWqhBkAsXyjZPT9v2BfFA2bOG1MFWfNxxzuoheL5ifFvEsC5w4f1pm609tIKzX32YoK
	 sYut/FYGH9KqYwY0nYMItbpCMi9fGZPiV6cpf3CU20pKnJTlBe4R9vXVJtTQYkF+yRmZT
	 sATQDZo18F70sNUheBEoI4w+WglJrph7a1te1b+pw+/yNudyQ5wPlnS75ZFhp74hKhno+
	 U3a0cK787fQ48jpUncogw3Ia9OD80oyG/CGjd8tHeBl54HvD6Uuz154sM40f921cj3qKy
	 Q08VNKi0daYNedCR+NvKwWvCRPr/0tYvzW39k1TIvdIVRlCymJlXCGLh93iT5Zl4C1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AnOtCXqi;
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C5F606A882
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:49:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9C5F606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AnOtCXqi
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so4291446a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 05:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794750567; x=1795355367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CIMU95vHnqa1nwXCV6m6LvgiRUwW6SKBilk+Lblrfz8=;
        b=AnOtCXqim/fJfNWxuMpDEXkZ4wmtzv8RFwJ30ImPROwIedf9E2qrWRopIrtzvpUp3b
         585athtjSaQvFX90AYqLOI8FPluQISyBIRQbO+2HrmJj+fXYYDIT2hSIKvp6eyu4dQxC
         sab1WyIKsWjfbR0vZ0lhLKE/S378NjgadqXqkG24WAhAoOpV50ZHpVzSF5bZl1HYupo3
         nse53SoYQpPS1RXhUqKlaaIaKABt3jWmiJ9bvDcmXbnF5pMrV2EtbNj5nejxAt+H8/M8
         JMR5SG/93IzwJ0GThy4qyKjt5mzpGDerfb6ZIgqrlO9Wto+D2tVuo88IMqEjaz1CkXQI
         PMXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794750567; x=1795355367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CIMU95vHnqa1nwXCV6m6LvgiRUwW6SKBilk+Lblrfz8=;
        b=xFF+7evVEwZl9baJrWA04gu3SYbnXhbVniCbzzTF3PstlwK1Gkktxdom521q0zx+zj
         Y22cMKtUFdbS2QPmzyez3cdUbF+4Tk5x/4LxDAWsBghpmaV0+8ihekKcuyzXLXuZ9C3K
         UD3mi+FiFffIYcQldCThTgZSbedwtiQWyOcc9WvFdhckRzhSRRahpT9b0RmAd/wE9tKc
         NpC2ijWY/XUUcm5OOMe6H0HBdKgnJgEMGmZUsNvJv4bW6Lg4BgUv+Wutlt70OQ1jWAA8
         TE3cBLqgbdSJ4DCAM1ODg5EGPDEjalg3Bm8mPxc0cEiE9m6Pzu062vW27aFrd6hMBtQN
         H8bA==
X-Forwarded-Encrypted: i=1; AL+hErE2GE+1qnajBkNl96DDOAVZpIQ6UTDyAUCZP303ufzP5JD8gsLhWDD1jdo7LE3pd76ZbQF8a0nmgROuq1U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WgH2cB6SKnOALxDbQvswR+ufeV2LqVCkU7R8P2PVwpbYdFnsT
	aiJhVrPcbkC2aT5hj93azEwByqYf+dsGnfHtPCrWixVCF3lE4q1V+G7M
X-Gm-Gg: AYBFou0nlVJpgwg8S1qfrMJX3/gStN3kr5FtbIu+48xWgWoin6nivu9y5gSBA1vPhSu
	y8p7FmneSWbUqKuuDuOwhVniCxYf6Fa1hzQidSXSaHkkG0jy4qqj8M9wk2jnnQkTo7seQ7v8I64
	qW+bQiEzus+LSACFoUHKf8pBXsyJNm8VC6ZGpSHHqS5C5K/TrcNK4M3LldCd8/I8gWdo+8iPYho
	P5Ki6DoaReWZtT7fJ1PXPFkThM7jTUhQRp8zYSSLDY88+kYBRH97s05WtgmA6SjS7Ubu+9KhKnv
	AwAp08oGh5+emsHaJlbWHmFuftI5IT5cMm0ar5FctjbcpNa+JmKZovV0lSW0cIuZadVNToodthM
	5Vi2F2v11gyIEFER7Y/ZXSCQ1GSqpvEacbV00FX+HQ4/9iwX4hUZm/GkAPDPJA+yGPWw8MwBypU
	C4wR1Fvem5rTMz1u9FrYf2D5Ht1RX7G7h94hwxku7UXNELHVmMYjc9A8ZY83L//NKCuQAUUNrck
	8VflOn8XmQiugeGo8TAXrx/zfdzeMtMWaKys6/s3ROpAD7otQB6dffmByVGjvKLbytnZHMu5DWD
	A+bky/pEF+COg8lFehej0KeCsl6D7DcpflBN8ZHfQRG880n/DdKX6VHjrwR0QA==
X-Received: by 2002:aa7:cc03:0:b0:6b7:28f:a3ac with SMTP id 4fb4d7f45d1cf-6b7c0957d81mr4194728a12.7.1794750566981;
        Sun, 15 Nov 2026 05:49:26 -0800 (PST)
Received: from kordpc.lan ([2a13:e746:396c:c60c::8f9])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c25deb10sm3386556a12.30.2026.11.15.05.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 05:49:26 -0800 (PST)
From: Kordian Chmielewski <kudzo51@gmail.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	bcm-kernel-feedback-list@broadcom.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v3 3/7] net: bcm4908_enet: release the TX ring on stop
Date: Sun, 15 Nov 2026 14:49:23 +0100
Message-ID: <20261115134923.55351-1-kudzo51@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113235847.517308-4-kudzo51@gmail.com>
References: <20261113235847.517308-4-kudzo51@gmail.com>
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

Sashiko's review of this patch [1] attributes one Medium point to it:
when the TX channel does not stop in time, the skbs left in the ring
leak, and on unbind bcm4908_enet_dma_free() frees the slots and the
descriptor ring while the channel may still be running. It suggests
forcing the channel idle with ENET_DMA_CTRL_CHANNEL_RESET or by clearing
MASTER_EN, and then cleaning the ring.

The leak after a timeout is on purpose, and the changelog says so. The
review of v2 suggested either forcing a reset or leaking the buffers.
I don't know what a channel reset does to a transfer in flight, so I
chose the leak: it costs memory, but the DMA never reads a freed skb.
The timeout never fired in my tests; every stop, all made while the
router was sending at line rate, finished in time. The unbind path is
older than this patch: before it, stop() did not wait for the TX
channel at all, and bcm4908_enet_dma_free() kfree()d the slot array
with the skbs still in it.

The review also points out that RX has the same problem the other way
round: bcm4908_enet_dma_rx_ring_disable() only warns on a timeout, and
stop() frees the RX buffers anyway, while the DMA may still write into
them. That one is older too, and I'll add it to the follow-ups, next to
the ignored dma_init() error in open().

[1] https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261113235847.517308-1-kudzo51%40gmail.com
