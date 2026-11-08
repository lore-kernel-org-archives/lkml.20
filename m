Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794122351;
	b=2ORF6GQsFgtNXU1XvM9FrSzmbid337BunbNkd7e54uIfjHK++zEWWa+P5LziHH50/HLL
	 tyfJZuMoJcyTl+83BQ8d1UdsfxGJ98rCoGbUO2fClxiqhhIkjRsylSQnM/duEIOzubsXz
	 FP6efSFIvg3fBcLBMV3AZPnEcsw5TObKeXp35kV3Ssl59NLIIBndzY5JFPaF41OY8gODM
	 XfsNVV49VnGASVzUciEFFZlKLCYrH3vlvhOp2vcZhNHLc1IdDYu6VXYRYZkQmF3jRGHjY
	 hiPytSbr7xo6DA5FYMU+gIvCMoySr4IIh8xLYQsTZhxZRWPwGtetZTKh7dET+krwjgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794122351;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FVF9NClJHJGhfa8rb/zBRKRxBPdEmM7xBMkClhjxaOI=;
	b=UEER0QxRVWptZzXxGJaE7KrPJwG7Zr2M3nL7qM7VnD9VWCz+kGaQisOXIVeYRiJmTkNQ
	 quhEgc47NiSqLc9CNTpGkKn/Eh90HzJc1qV7AZVe6kUdTwwvNt/A1VDff63/5XyfHootQ
	 ipmmwEDbIEQXybciHm0cD7SAUySxnQIsYXJ99RG3WjeyW+3L59iGpSpgmDsEp7pEMRF1s
	 /lgNpNGX5bL79o7tZpA2f66lt9IHqz0Jcf4FSwoc4PmSHT7jj/r7KAXvtqDIejq0mf5FU
	 kdqtYz4ETnVviI3Iquvu2XbYfcdpiLiWIRUUy7H7IP0lnG30NU3UCGxfND6/crl0NzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WnpJ0AOE;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C33606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 07:19:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35C33606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WnpJ0AOE
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b1ce85287aso74676c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 23:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794122350; x=1794727150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FVF9NClJHJGhfa8rb/zBRKRxBPdEmM7xBMkClhjxaOI=;
        b=WnpJ0AOE7lggVyl003czQ+c3YZmY9hxvUVX86ifJtceYUnI9JhaSRdcbwbM9nwufjN
         hk5QKRNWpK8UVS6DChnBBFovDnMAZaQhnbZLy2nWqmD1mCAxIdFOa1K14vo7GSR4qyK3
         ++26acAeKq9lLCqsUCCA7/TKc5rI9aDPRQtJpFRlhcFPNFd5GMQMthNpJ/HU2mxnstvR
         mSMoyOyRQRImQdOjV+MnPz5GN2E2JPvTYfeQEvg+pobx9ElJl8ijiRHXIQINDVgk+8Yg
         P/2XHHQCCxHkIwqmdEw/KuWQhR0rju641gt3JAs6e2jq5GUCXvq7ToQ3SsoTqC3xd0ee
         FEUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794122350; x=1794727150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FVF9NClJHJGhfa8rb/zBRKRxBPdEmM7xBMkClhjxaOI=;
        b=C22mlVv0ab+gWccacLwoIVLgBI6J/KxpsoD001JsYeXQgs10rq09x2/eXjVh1AzIC2
         HBMCHsiXVwwuOBvfv6rJawR/xxq07QdZU/4UW4U9HfGOViqBCVBFpceNwsRHrbS1GXRO
         AqDaHYiPIioBnFZddE+cjWE1QhCKlW9/CxORRr+YIlF/N+Pr79dpejJoC5T5s1dWzhtN
         +cNev45OFn7narYmcP8qSswIvgwVW2tV5u0gkMsdCFWkhiGp/C4E+APurQSay6a5AW6s
         wK6CF//9QaY+JQP6YCbU4YXTmoDKQYkznIxiGV+ziIZl0VXEL4tiBZrwGCFkCnjJ1GeO
         hoXg==
X-Forwarded-Encrypted: i=1; AL+hErEpn7N7t0LckH70X36yotNb1K5r4JbXm0EhBvfrUXpVoT/8ZKoYxaReRMbnhjNw02bmuQ+v158FYTg9Wr4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xxr0kCnhOzzejEBkt52acYw2t7gNomYATCoPbubzHWRWsfWUP
	KNr0Vn4iGVu4tFrWvJGUwkY/12e00YwvnQ1AAGwlI2Kzh0yPMIRYeYtJ
X-Gm-Gg: AYBFou2rgY0Z7gM0yHVXSCCJEh0X9h2le4VZRfrMlGxeD+jscM4wSHtSX7E1wCWQDkj
	JAIhIBDS1OW0HnK9IczSHlCmRm0BV84UEZWorqcHAwp7GZ2GA42sSDsIRx0S0kLVLp/sxwM8ZO4
	R0HdZ1x++TUkOcMENyz3GN7Nq5BzT55hHbmMjnRPjC415K6Aoj62QhceoseFSJAThwGPhC+6Js2
	gxr1ff81FiiO7t1O3pSFQUDqZ0M0bbXyqV/IqK1fw6RrdLx8nbqahmQSZbfKI0OZ48tTXxJCLU+
	cADHHuXPx/yY6y61SAD2fgpXLjSZjiCxuCPJdlIfuJnalcTKlZMOv9maczpM5eb1BOL0KwiFI9x
	6QBRA3+MIv89uSE5zQ1RTHtYkF+plT0WYHFaeMDUyyTLl1qSKRYojT10es82kP+/rw19jAxCmZ7
	SuVJ1HVxESTYpp/7VV8/YgnG+TOMT9HksC1GaMKXqh0dgIytuwb6GJPXGcU7KZ+vDVLWwYQrugF
	/1wDcOAYkcgcr/epf66+wBlo4kggemb23E0WH3m7o+lwnjYzEK7LLHVup9ZF8nLodkVI6XtdOO0
	tO2mHZ5zj/EeqqlPbo+EAsvHTPTsOl0VZtaQYeT871YOiA==
X-Received: by 2002:a05:7022:294:20b0:16f:c9db:c5af with SMTP id a92af1059eb24-1b39fe92ebbmr1311793c88.11.1794122349973;
        Sat, 07 Nov 2026 23:19:09 -0800 (PST)
Received: from cachyos-x8664.nitc.ac.in ([61.1.180.57])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755e8911sm4207262c88.5.2026.11.07.23.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 23:19:09 -0800 (PST)
From: John Robin <johnrobin044@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: kuba@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	John Robin <johnrobin044@gmail.com>
Subject: [PATCH v2 0/4] wifi: mt7601u: add AP and Wi-Fi Direct support
Date: Sun,  8 Nov 2026 12:47:42 +0530
Message-ID: <20261108071820.35303-1-johnrobin044@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <7ededd2f-98d0-41ac-91b4-2977963c4637@gmail.com>
References: <7ededd2f-98d0-41ac-91b4-2977963c4637@gmail.com>
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

v2: Split the single large commit into a 4-patch series as requested.

This series enables Access Point (AP) and Wi-Fi Direct (P2P_GO/P2P_CLIENT)
interface modes on the MT7601U device, allowing concurrent Station and AP
operation. 

The changes are split into the following patches:

- Patch 1 fixes a potential out-of-bounds access in the rate index and
  safely falls back to CCK rates.
- Patch 2 registers the AP, P2P, and ADHOC modes, defines the interface 
  combinations, and sets NEEDS_UNIQUE_STA_ADDR.
- Patch 3 implements start_ap()/stop_ap() and adds beacon frame handling
  along with appropriate SYNC modes.
- Patch 4 optimizes queue management by routing management and injected
  frames to the Voice (VO) queue to bypass firmware suspension.

All implemented modes were verified to be working. Tested AP mode and
simultaneous STA+AP with iperf3 to verify stability.

Sorry for the delay in getting back to this, and thanks for the review.
Here is the split series as requested.

John Robin (4):
  wifi: mt7601u: fix out-of-bounds access in rate index
  wifi: mt7601u: enable AP and Wi-Fi Direct interface modes
  wifi: mt7601u: add AP operations and beacon handling
  wifi: mt7601u: optimize management frame routing and queues

 drivers/net/wireless/mediatek/mt7601u/init.c  | 31 ++++++-
 drivers/net/wireless/mediatek/mt7601u/mac.c   | 91 +++++++++++++++----
 drivers/net/wireless/mediatek/mt7601u/mac.h   |  3 +-
 drivers/net/wireless/mediatek/mt7601u/main.c  | 56 +++++++++++-
 .../net/wireless/mediatek/mt7601u/mt7601u.h   |  3 +-
 drivers/net/wireless/mediatek/mt7601u/tx.c    | 19 +++-
 6 files changed, 175 insertions(+), 28 deletions(-)

-- 
2.56.0

