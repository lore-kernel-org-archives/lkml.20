Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793712933;
	b=hB4kaEw5SpqJkzODRpqSGh3OAVkyEhK929wBKpMwSrAotm9V5c55lXKJL/+2zptIY5qd
	 ENeW3ZcfWeeuPKtTB9plcvDmJJ4vH33gUR/OWNIIh8vFHmCbwipm9hKecXIU79pboSQJz
	 KwZ2TTwf+8CwnUHKLGVrr/vlCgN7h3VSkcbMJoQsfuO4NH/xbKTIcsOoAT8I2JIHbLu0v
	 Hs4ryASzYTVcHSo53GZfburzy154+zLCJV6Uw5DVzO4DbnTwtWRWa5amXqeGXKHns55qe
	 yFN1Hx3N/8mrVybjjyRi9E4Ze37TETUeHpJyXGck6+YCWzFZnC3EMhBaWMoUNtNb3Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712933;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zqqqt1bQikgmsTno5raObEPlIaVtYNiSxU2NrfmKzh8=;
	b=5jUAkT4mD/6yMJHlD1w7LQhgH4GYJMC71bB+4s+JyTUjCbKSZg6tgwC1ynFCxxQk+Jcr
	 fONdGziAn8S2ACI7JwOetk8NMVpcTtjx4uZNfTXdzQO3BIrPiOri1x8bIoSQhDzFytsv+
	 dBeep8Hfch3zbXOFhTXEpTo/aIF0FDUkrFpus6KMRO30BApNcC+yYo2Vzkovu3+SJ8Kfv
	 hrz4Z6dvrRiy/hqHoA8T25CuqOmav0iZFZfuIbMy8BOTksNgBcM1or6yeWjCjpI6c6cTp
	 T91pVEQu+hE5dypMChRbdIqek+w6neP8tQ1T3s/RUTiopUUjBhqjXJvTr2C3ZL8yzDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZmIombpa;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C6A606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:35:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1C6A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZmIombpa
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so474412f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793712931; x=1794317731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zqqqt1bQikgmsTno5raObEPlIaVtYNiSxU2NrfmKzh8=;
        b=ZmIombpa+vjIFomYPhSt7J+C3mIU2PimU68TMd3aqil20orO3pB047VhwxX/hMMleZ
         2OHBWhLWzVGW+cFSTuBIzTdRhcJHtnCH+V3fR3I4HPrIo18S2o50aVIzBPW3XsQwuqXd
         61OZe3wSLrkE4hdeCh/lz7Ql5hM8yjhVpjVWlB/3Key+jLNue6gjGkRLk/l7XM2BSr9B
         MFP3Kpd2TeXNAp4oHg02YdhgUQ6QtLPm1fnjQf9QtEvZdFGTnRhHJVezOW57SgCrus+3
         Zd5E+Pvvx2uNHCQRCFYCOeLSoO109TzZMMT9HfRRLc+u5VaNfHyK7Tg/HBZSfDEkhIEU
         k2FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712931; x=1794317731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zqqqt1bQikgmsTno5raObEPlIaVtYNiSxU2NrfmKzh8=;
        b=gxf5QfTm9OOLXXm3EEkvgDUIelqvgm2cAszzxu7mxk0UyIxrEQYTObYkihCCCRyaFN
         HT0aWlGxHEieybrUfnSZdPeXSA/9GY9kCrV601acBYliXDaBHlR5YxCH8gkEwvW22B4+
         lZclGWK/UduolLzHFzkJd1iwFOFwTP5yD4JMpGiIvTuyOS/kQJTUMz30WcViwgpzWyy/
         ImLeRi9q6aQwrQlJUIRypdUyGJNfLm7Z6FfoMkkI7bxnXF2ZApPzuedS0pItpWV9lSMn
         ImumN1dWMjXbUZ1s0yOdVerbLtA1lIpla28ZOOOdUfE6ZsGXA+L0jO/NuMciO9f8ixRj
         fNEQ==
X-Forwarded-Encrypted: i=1; AKwUvBwFnB5xWCSPZ3H/0H2byBIBo2lUFmgJ8cnqSxLaBvLLGjMC8BRbdYq0FfKqWg2/4tXxfFMw0BtvzlSHGzE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LJm6VrQi/BR4BWqsFFJAnLLYYkdPS8djVRseAV3RA92HAObkW
	nwNbuuM5cTLY9E/nvDhR9r9dm7gu4CaR4NiNiYYL8/jOD+YjXTi74tCi
X-Gm-Gg: AYBFou3p7QkdXURcJ3IxGIPDdGtcfa5BO9aSvNmEbBrPDFlKkORkgUgo+0enc+7prHO
	YUvqfpsAZ5o7+v2uyHUfN+Y0WObmEOy0eIBHghTfnqgkt88fENoI/4Nvkon/euLZ7t1ltcTiXWu
	/H8VeRud6pyrWEqA36X0f/BSIgAIuVB+ooUW7nPZhKLgJJbetHwgXN9GKg7Tt68EpJ6ZmeRICoT
	v1qWpr2SwNjay9M4mlwGot+ee1gvSVgK374mfSIFQSKKRkse/bvzKDsAQ37K9c3G9pX9Z32n7/w
	jfpzCIQ3nbS6VCAnod4KEKtxwdI+iD8zomG+b3n0rOCgmzkafaVNB5O6h+ECpTirqj53/O0p+pS
	TL3QchoYhk4T6MPFNeQ2ThwS8qhqbqoTBFaKGbNKmn5zoAdc0/TeQWqAy6o5oZjuXitFTvVGV7Q
	ed27vIff18fYaveRhxVDfZTfC78NB8Gp3agkadIEoaeuE8QMena6he8WJl9VGLU2YUCVaVi04ZE
	DtjWOLYn5OQ0Sj3NJELCFWa1uAMRIIpvXR8FLUTC00Dk37uA7VROCV2JAnCyuxOhWIu2fRWni6M
	skMFQEamrDC1VoKilAFTbz71KY78yUepV+QaRhEyXnamcHyR6Lve3HsAes++nxoVthdpZq07EvW
	cVQzuJAZakBt81SZqUgxQKBR7yKWAFXKmmbk2yAtN1+NkXt4v+4KU2am4OjS9vxQmSZ2lJhz8Ni
	QR0FDiIyhabybt5GmGGSND8/aqDqfNlikxwq8PboyL9fQP/LqdMuyx2Q==
X-Received: by 2002:a05:6000:250a:b0:48e:643e:de82 with SMTP id ffacd0b85a97d-48e6e2cb652mr30505104f8f.11.1793712931006;
        Tue, 03 Nov 2026 05:35:31 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-d09e-6586-7547-87ae.ipv6.o2.cz. [2a00:1028:8388:a84e:d09e:6586:7547:87ae])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b80eb1sm26661746f8f.34.2026.11.03.05.35.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 05:35:30 -0800 (PST)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	JB Tsai <jb.tsai@mediatek.com>,
	Allan Wang <allan.wang@mediatek.com>,
	Quan Zhou <quan.zhou@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next 0/2] wifi: mt76: mt7925: LED support for USB adapters
Date: Tue,  3 Nov 2026 14:35:26 +0100
Message-ID: <20261103133528.53197-1-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
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

MT7925 USB adapters such as the NETGEAR A9000 have a status LED on
GPIO 8 of the chip. MediaTek's Windows driver asks the firmware to
switch it with UNI command 0x2a, but the firmware in linux-firmware
does not act on that command [1].

This series drives the pin from the host instead. The layout of the
CBTOP GPIO block comes from the coda headers in MediaTek's gen4m driver
for MT6639, which uses the same CBTOP register map as MT7925. The first
patch lets the mt76 core register an LED that only provides
brightness_set_blocking, which a USB driver needs. The second patch
adds the LED to mt7925.

Tested on a Turris Omnia with an A9000 and firmware 20231227 over
several days. The LED follows the throughput trigger and manual
brightness changes, and turns off when the radio goes down.

Sean, JB, is it fine to drive these GPIO registers from the host, or
does the firmware rely on GPIO 8 staying in its default function?

[1] https://lore.kernel.org/linux-wireless/20261012125310.13917-1-pepe.schlehofer@gmail.com/

Josef Schlehofer (2):
  wifi: mt76: allow LEDs with only brightness_set_blocking
  wifi: mt76: mt7925: add LED support for USB adapters

 drivers/net/wireless/mediatek/mt76/mac80211.c | 12 ++++-
 .../net/wireless/mediatek/mt76/mt7925/init.c  | 51 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   |  2 +
 .../net/wireless/mediatek/mt76/mt7925/regs.h  |  8 +++
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  2 +
 5 files changed, 73 insertions(+), 2 deletions(-)


base-commit: 991a73f4909f1348ffb4b38765cdb522a775e4c2
-- 
2.54.0 (Apple Git-157)

