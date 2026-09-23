Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4023346BE
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790130000; cv=none; b=olKn9SsXlMhNmKY9H1n8RDujCgQkp9d5Z4fXrWZbQ3PRBKDvpPUVj1dkOtnhbc8fuHKybb3Yg1E2aygXLt3FI6zjXa7SHovFqKI6eq0lCy0Z7ZpIiXkJm2/+OzuL2NtTnRwIXHHAqBuIuE9tKxv/aFPfTF4i/9QQeZcjyk09AKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790130000; c=relaxed/simple;
	bh=LcXQdWRW2GsS5I8GuOOeQZtsFoiw+GjNN+se5mePlKU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q4AadV+jINPLn/inMWUs9TNKS1o2wkdZEAHpdAXnt4Xevm8eTJ/JNRyTjvYpZxv3WdGO4mFsX6qr6bcFquVUk8R/cwyOM8p1nUZQk5tBwpnNHUCs3JaDp9uH+A0Oq/gGp2RtXmbhbJE9+PP0U03X4cX7Hnksjd+lMM6hkMjRkJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hiaeL965; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hiaeL965"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469f204f6so288928b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 19:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790129998; x=1790734798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=INaxH1K5pqrMxiyJhIWa4Nj2ZwXkK6QpSGkNU2jCGiE=;
        b=hiaeL965MDC5qSnfkhMsBISJMV6YdJjZoT5uXAzP8TJghOmq9pEKPma9oRPJLroDkZ
         xVcuS7lvxcBRB098rYjT8ONvhzA1edqBxCYCNXn9MkJtwxgSm3yGUU7q+zrHoQ3Z9Ken
         KsAIg/apzr3soec46Opw87fmLyKJZd0JRG0ivXfuyoZr2rIsuPJ1gYRnqOwelJldy0l9
         V1BMNbAkfEJiJQSDaw6rhuJsDZvIPUVlPjV26MAnJy28MbIGStA3okOJfiRMwEXrEdEn
         aZgDh5pAV/sGVL9nubHRjsgPzVxaOIRSQffLCI8QBcCEucNasYFUTsTbcmdv/dnPm/zV
         ISvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790129998; x=1790734798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=INaxH1K5pqrMxiyJhIWa4Nj2ZwXkK6QpSGkNU2jCGiE=;
        b=VsdekfsmNvwbPgm9hMaZw12tEKgj4K2UWRWGfWGGqer2ntkoYlF+XzQH6xCrlQ3qGh
         fkIIWt7uEoksSoQnGzMQnuJknR6KsNim5B90kU1mz1azSKqenOIr9bgTTWqej8q/JNsb
         2YsuzODyv9HKhykiwdgp87FdByeYlwWdZtYk8w6mWrf8Qbnr5f/mu70/p24MdzdRJhlm
         tvemfE0Uad+7Abzt9vjcuslr6kga16jU0r4BYrE2rgS8KkrTefURZFDSVEWj8wFMsnRk
         GbVH2e1MLOSLLg8vGlgaJSO1ZPhIjQhizONwN5W7FYjGuAJy3a6jPs4Q+7LJA1QARv5N
         HspA==
X-Forwarded-Encrypted: i=1; AKwUvBzDY/oIdl3pucPZLapOauYZ5fdRCOXwX8G9LLCMzSJBliFelYwPi0n9118sWe13Xzg+2mPplg00kD2SwBY=@vger.kernel.org
X-Gm-Message-State: AFuF++krKv5MxT9KKbtY7bQ9SzF7x+D7Y0xNRB5SLWPB1bkDctDjNd7N
	jOJj64itYJbF5LcEdPOdgwMtK8U2caQbIgse8lI/NjCemriK1dyrVb+H
X-Gm-Gg: AYBFou1j0+lEIhpo6KYt9PEOPflZ1jiRiJvXSh2Md1vjc8CuBdGDUiq3+MTWkgdSYeQ
	xXmIpwatuJwgWSQYIGcJejjrTuvVZMBSU/US9UFDk+E2UTS7AqrZt3+cqzTNCGwMJqgTlNxxeZp
	GdZAtiLVP/X+n/wlCIrbEPPP2TtdjUc2MXjYUOD0Gvfn929IfizeBAtP8jkN6Imc1eeWIXyTctl
	S7+mZCQHe0ZhVoOk+1yjGe8K7stW/KEIsadTfjx+7skWXnODZJQ3GXZveVq8wHOfQ9HqsUrGN04
	3GUEDWrspP9hRyC6j0NZBaty/CDmEUrQIKqsKPYkLYKmG33g4haFNaa3E3whN8TKJXuVZ2uKrkD
	b75hnKLdTPSZnZoFyzjYpIf3tcu7EBA8+Iapi/BYMxJp+chnnKS3gGCKiMHGRkcqSPzzHxIPlA3
	93VS9SPN5rppkUvEMUrpdFvaiwF03KiqkvUnb2wm0lX4mxwL3fA8jRCVKNAAxM5bgwKN5PsCFJJ
	pI8JpI4whN4jlm3/TN/shro
X-Received: by 2002:a05:6a00:2ea0:b0:878:3658:23db with SMTP id d2e1a72fcca58-87d1d9d2934mr1261390b3a.52.1790129998428;
        Tue, 22 Sep 2026 19:19:58 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76c0:d30::4d0:61])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1e0f4fe8sm502924b3a.51.2026.09.22.19.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 19:19:57 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v4 0/8] net: dsa: motorcomm: Add SerDes PCS
Date: Wed, 23 Sep 2026 10:19:32 +0800
Message-ID: <20260923021945.2203368-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rework chip_info to tell SERDES ports from xMII ones, identify the port type
at runtime from the pad configuration, and add a phylink PCS driver for the
internal SerDes, so that the link of SERDES ports can be established through
in-band negotiation instead of a fixed configuration.

v4:
  - fix 1000basex
  - YT921X_SPEED_NUM -> YT921X_SPEED_INVALID
  - reword commit message
v3: https://lore.kernel.org/r/20260917185010.3189199-1-mmyangfl@gmail.com
  - fix build error
v2: https://lore.kernel.org/r/20260916164310.3168269-1-mmyangfl@gmail.com
  - Remove YT921X_PORT_MASK_* macros
  - code style nits
  - unconditionally write BMCR_ANRESTART
v1: https://lore.kernel.org/r/20260909190541.466476-1-mmyangfl@gmail.com

David Yang (8):
  net: dsa: motorcomm: Remove YT921X_PORT_MASK_* macros
  net: dsa: motorcomm: Split xMII and SERDES port masks
  net: dsa: motorcomm: Identify port type at runtime
  net: dsa: motorcomm: Fix register bit field names
  net: dsa: motorcomm: Introduce yt921x_speed
  net: dsa: motorcomm: Hoist port_to_priv helper into chip.h
  net: dsa: motorcomm: Split MDIO bus module
  net: dsa: motorcomm: Add SerDes PCS

 drivers/net/dsa/motorcomm/Makefile   |   2 +
 drivers/net/dsa/motorcomm/chip.c     | 524 +++++++--------------------
 drivers/net/dsa/motorcomm/chip.h     | 106 +++---
 drivers/net/dsa/motorcomm/leds.c     |  14 +-
 drivers/net/dsa/motorcomm/mdio_bus.c | 301 +++++++++++++++
 drivers/net/dsa/motorcomm/mdio_bus.h |  54 +++
 drivers/net/dsa/motorcomm/pcs-921x.c | 247 +++++++++++++
 drivers/net/dsa/motorcomm/pcs.h      |  13 +
 8 files changed, 805 insertions(+), 456 deletions(-)
 create mode 100644 drivers/net/dsa/motorcomm/mdio_bus.c
 create mode 100644 drivers/net/dsa/motorcomm/mdio_bus.h
 create mode 100644 drivers/net/dsa/motorcomm/pcs-921x.c
 create mode 100644 drivers/net/dsa/motorcomm/pcs.h

--
2.53.0
