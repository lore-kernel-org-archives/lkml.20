Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792785245;
	b=uUh/QyxJfTqut9Di8rikKdFzOlpMq7TBPLYdw36MkWPC1ov9YHN4aM6pcfzvrtx7QIv3
	 1knLuqvNuLmVTh4PvpiIIeB71nX8LluHcF4hku7hRh7jTWW1iiu270+pXr5KvrgOweyth
	 pj5lIPmVOW7e1O4AT17CUf1egFmv4x5Saqlh8T/hBXJJJbFO/gN0FBVG8azZZvTFtvN0c
	 3nWit3tuQBQb3FsXyiHe8FvPfUemYk3NQZasy69NIR8UVkJgoL2XSkhy0M43DjnDLLQgf
	 Vuhd/n5divHW+BubbFwMNRTt7puNLZuLCbo0KZVnZ3+ETbwtIjkYbHkzqrLRJG7boWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792785245;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=y/sybD6YF8pEOR4iuvpSchqYgceX2IuNdq94snnQsys=;
	b=ZDPVtSoczmNQlOgLXw7Aucr2T9VSqreSJrZiUwehBAZHz3zuDH022FHWE/Oh72ELM6Mm
	 mzLRvWMJbfcRqxpIr6q/JJAKpP/RcagHm8CCPhrQDo6zE2oL4UvrIjQykrpKJml1N1fD8
	 V94o5xLMQBYUsD8MR1uKX+acNGAj2L0y+LCHOpiiUIkFa5rZmWy7dtiA7e5IpnnYVTg1e
	 +J+pBE6kacERDMkwWqqTlTKean7cw0ru3xzj330xl1CRR+J0hx870t5WqJaOkCsVVqi2u
	 bxqLYDtS4B+kXJmCfxOQvsUSYV61w1Xs16tvjE6bCXKDgvY6Aqgt1Q48cHsGQms+G+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kDO2j2Uw;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C78606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 19:54:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13C78606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kDO2j2Uw
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso842570f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792785243; x=1793390043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y/sybD6YF8pEOR4iuvpSchqYgceX2IuNdq94snnQsys=;
        b=kDO2j2UwWFwvGWxii+D/B2dwST5vOkMFB6995qrsjTpInhR0p6cgLFf4Lf2aWKB/8X
         f+EKWq/GcAckmE/XvZ2gRMPLfLy1i6JWD8Jvp5GDw+SO4PRkMdymfp5W1J4iMwjoKCTA
         XHmuL6M7JJrIbNM6LD+GNe/+i81Lj0UuFBb74ghiyyYdlix8Hnb8Wv9Xh/GGp6ZWaxVX
         2p2eUhWIDjE1AeEUdNk2e2i2Cvm+fUdWgkJF2dinLCopnrFwe6X7vxwRlfw4NX7HPsjt
         ImP2VGg/vPvAJhmJaNrznreRs1+/6m/sXheKiTH8giYFD7Yf59FNO2bB7fbDqY2C1KFf
         1iig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792785243; x=1793390043;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y/sybD6YF8pEOR4iuvpSchqYgceX2IuNdq94snnQsys=;
        b=nyskTowPoseF9LP4k/LP79VorKWWdlCAQ3m9fVu2uZbTousy4ryTF2WIsg3YqNZrj/
         h2xIq4jCWf8Ut2JMCPHb3kApi9NAVAapQS4X7AtQ/FIRXtyGHNoFOtyLxvzI55UH0UDf
         5vYhytEB1YlILKM7sOfW6TXh+KBqmZkcugpEbQslmin6RMRVhqfea+4KtOwi2NP+Tdro
         T3H50tj4Ab4cE+VxUmF9nwAdQ2401UpLcxSPD5/YtoBw7b2lU9Xvols92jCfOdn+rL1Y
         DuvPRPPcIlitAFEoiBrIoyvTPrLQKsjzYwWwBKjL6gGVD1UtUevG+cNjNoUn8+3DgCW+
         K8DA==
X-Forwarded-Encrypted: i=1; AKwUvBwV5ZDFYBAQ9ZK/bHaSxz+hOpjZYShQlVvMHXAW2bRNIooClxiKjE3IeRDEsSce0c+dHjwcVO1VHM+b/+A=@vger.kernel.org
X-Gm-Message-State: AFq9FYIAE4OQl2w07LQDRKgZ0wIYOnba3dwXaNxQ4Gso3Un8zQV6Qf0F
	t54mjHPMoBkv4S0wnpK59s7co3ceojS+dSMxuo0a4Whg6iut5uA+rOg=
X-Gm-Gg: AYBFou2gGjJcYlUUFOEI2L2qJeM1y2z1CFGo4tiLoNsD7RZQqqOkxvM2WxZSq9hb5qO
	YNPdHsyZZvr3OEPhQCPfYwHeSgiK7ZRuC7lMj5OWml7JhRq6nDvSbfK662wFedJ+hWHCB+GhHZn
	WWCq3Z58azhWDKAyO0L0BMuftqka8rnF1Qf/uZAmIp+QVVAD/k0xSTMS223Ynx4IM+gK5QFxUrX
	7WiegALs9ojRtFbMkSGpZ/rTnkvE+MsjP4LcjO3Y1s+gq8I+G0Cm+rpHiibgzeLMlZuJYisMQ4R
	FlaTLRPEqTlnYeHvbCWCy3Bg33t5gwvci34H9C3PrWmSJL3dBGCYMHnyhgGIFOnjEpBUXuhIKvS
	Kc8wnOMDL319kLu4PWlFzDZNX8BAw+GXGzLp4448ESlcZZKj5kjoulVW5XPuyVQWX96pPsrqnVF
	PDo0jVsjJ7xpiJCtL2gg2saab4/SZCfLenTmvtfPLcBZmWAZ7/8Nvky88TQgrTWsilP5dFkd7lj
	fpts/Y0ICR+hScYc1mV1lCK
X-Received: by 2002:a05:6000:4011:b0:48d:c29e:40c3 with SMTP id ffacd0b85a97d-48e3eba80b2mr57511f8f.33.1792785243224;
        Fri, 23 Oct 2026 12:54:03 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ece13aasm32783f8f.58.2026.10.23.12.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 12:54:01 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>
Cc: =?UTF-8?q?St=C3=A9phane=20Grosjean?= <s.grosjean@peak-system.fr>,
	Wolfgang Grandegger <wg@grandegger.com>,
	linux-can@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH net] can: peak_usb: add missing dev_free callback to cancel restart_timer
Date: Fri, 23 Oct 2026 19:54:00 +0000
Message-ID: <20261023195400.3531721-1-tristmd@gmail.com>
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

From: Tristan Madani <tristan@talencesecurity.com>

The PCAN-USB adapter uses a restart_timer for bus error recovery
but does not define a dev_free callback.  When the device is
unplugged, peak_usb_disconnect() calls free_candev() without
cancelling the timer.  If a bus error armed the timer via
mod_timer() and USB disconnect races with it, the timer fires on
freed memory.

Add a pcan_usb_free() callback that cancels the restart_timer,
and register it as the adapter dev_free handler.

Fixes: 46be265d3388 ("can: usb: PEAK-System Technik PCAN-USB specific part")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/net/can/usb/peak_usb/pcan_usb.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/can/usb/peak_usb/pcan_usb.c b/drivers/net/can/usb/peak_usb/pcan_usb.c
index 8fd058c328564..b0b3c76b2ccb8 100644
--- a/drivers/net/can/usb/peak_usb/pcan_usb.c
+++ b/drivers/net/can/usb/peak_usb/pcan_usb.c
@@ -882,6 +882,14 @@ static int pcan_usb_start(struct peak_usb_device *dev)
 	return pcan_usb_set_ext_vcc(dev, 0);
 }
 
+static void pcan_usb_free(struct peak_usb_device *dev)
+{
+	struct pcan_usb *pdev =
+		container_of(dev, struct pcan_usb, dev);
+
+	timer_shutdown_sync(&pdev->restart_timer);
+}
+
 static int pcan_usb_init(struct peak_usb_device *dev)
 {
 	struct pcan_usb *pdev = container_of(dev, struct pcan_usb, dev);
@@ -1051,6 +1059,7 @@ const struct peak_usb_adapter pcan_usb = {
 	.dev_decode_buf = pcan_usb_decode_buf,
 	.dev_encode_msg = pcan_usb_encode_msg,
 	.dev_start = pcan_usb_start,
+	.dev_free = pcan_usb_free,
 	.dev_restart_async = pcan_usb_restart_async,
 	.do_get_berr_counter = pcan_usb_get_berr_counter,
 };
-- 
2.47.3

