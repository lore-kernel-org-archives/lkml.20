Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A39743E4BE
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 13:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791552270; cv=none; b=KS6wrRux7+1dP5JflcIzxCdi6SEztrcqK5DORQw4NCEEi7btnzK5FG/FXPArnOguV5BGJ8ba2nTjg1vZ4MUAFT7zQocvC6UqUnN9O0nh/CTtFrPnF0s/CjJZnVxsCah2tTmMGH7LYfi7/AxWMWHBUHKURo2lDJI2lSCj6MgIdQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791552270; c=relaxed/simple;
	bh=Lsi/A++xhrGF04JgKe8hR94JWb7Yq8PNQFayVgZOH1M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rqu30JOwjG6pQY3RIQRzSpukvq8fgjN0K+JzTigDlhbC7Izk233RJoLVnbyXPJg/YqR2yNUNh6+ndtqbjBK+QIrjrNCsV0JeGzzXPISIJy6lpLndLDQaKRDodjUI3obDLf0tPKWsw5ZbU8H8iajIVNOPUmpnlvbxiB4XXn9qPDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=aayushk.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=aayushk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e623eda81cso16378605ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 06:24:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791552269; x=1792157069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FAt8XDz6F5McT3nQ0Byv0pTFouwykBOXxklKXve4ubw=;
        b=F7hlb6QmxYn+IkyotOmR1o8nwhAQeMdqqp/JGwdIvHuU3qdH9LbD3qGo32NTTDGSF9
         5zlfgaUdoQawK5jRTxEnn2xrIM9BBf8PoSWS0HvbuxV9z6vjdG6Oiu3wMdjmd2xabvpA
         t41nABpMp03k02EzvghOZrgbMPVjShyove/b4vvP5ZuLW1KhGrZF4gbRvVkARmSGCONg
         GApaJBxwNUw5eW0VhMt5MLBcArLfLV0uwfYsHr1hzrkMhS3CPNehkF9ncDppHQie+gRZ
         W7qEUUJm7YzAwXJddCKRBD7QEbLj0uIaKpA6WlOj9QIggY9FQ63urGCA29HtubZ48kbI
         wsbg==
X-Forwarded-Encrypted: i=1; AKwUvBxPLlTC0naQDW9VHFM084yzXujBJDMBvbA3as7nu6SOb4BU3urqQdExPx4kAHCdiF6FD0/p6eHfcb2qgb0=@vger.kernel.org
X-Gm-Message-State: AFq9FYK86oMKRb4U6hsJNOsRKTdEsUnbvd82X1AUdypRkRvHFtRI6vfz
	u0N25Afv0/+TUHYpkILYUO0HwsLt/sdSrLoRGw573K/sH1rc7vV8vkyg
X-Gm-Gg: AYBFou1QeTKNMmmU2w+/mjXs0T1JpNLaLs3lpWwpPoVYD2FZvegei6hiNiSY5bRyOun
	tZurtdqiisTD9XuKuxlbnqR/Pz/V+bLrnR4LKVREk9bUou6yL9WCiKq/wtydNkRuOxYrtUu/adG
	XJl2o7Snxe5AwoVK3xHjx25euFx1JhP7TcJ7HTIQzJQutHbJG0KTGzRQ5RIFYlhGeo+kkU9VnaG
	TPwjlbF9JEGsMcFbLcwWXS90JTzFC2gk3JQKMbcR2r33paB3s+zXptFvTGZ4db3C2EJbE8T1aVh
	50A1TgHnVBvnSaE1O0TI3whDkSR/xj38Krrs7U2tPzaIoS0l0DtaTlzHTWjDUszEFM80naESX//
	4hTjIpO41ObXsmQxqZyE+3ml38FZM9IxoMYmRURzVDTzOnNqGHUq2A+04lsZdQE2eeZTdo+P2WA
	a91wLKhnth4mrrPpaBamyBR4HesxE3BFINhSKSs/j4KxcDaZ7jxuzHy/Dx+r4=
X-Received: by 2002:a17:902:f612:b0:2e2:c191:e388 with SMTP id d9443c01a7336-2e842e01de6mr15465345ad.59.1791552268574;
        Fri, 09 Oct 2026 06:24:28 -0700 (PDT)
Received: from linmach ([182.156.30.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422e2570sm9327705ad.79.2026.10.09.06.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 06:24:28 -0700 (PDT)
From: Aayush Kumar <code@aayushk.dev>
To: broonie@kernel.org
Cc: linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aayush Kumar <code@aayushk.dev>
Subject: [PATCH 0/2] spi: use devm_platform_ioremap_resource() in sh-hspi and jcore
Date: Fri,  9 Oct 2026 18:54:19 +0530
Message-ID: <20261009132421.557758-1-code@aayushk.dev>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert these two SPI drivers to the devm_platform_ioremap_resource()
helper to simplify the probe paths.

Aayush Kumar (2):
  spi: sh-hspi: Use devm_platform_ioremap_resource()
  spi: jcore: Use devm_platform_ioremap_resource()

 drivers/spi/spi-jcore.c   | 14 +++-----------
 drivers/spi/spi-sh-hspi.c | 15 +++------------
 2 files changed, 6 insertions(+), 23 deletions(-)

-- 
2.56.0

