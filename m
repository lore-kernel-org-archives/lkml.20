Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FD854706C
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 18:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789671123; cv=none; b=WK1hy6/I+WqGUVU5itOz+WaC11WsaHUuctRKMmwSQ3kXn7TlYeBO98SO5m45H2kfItILLrKb28NgxrshB+s7i881w9wAaHAnuu1bmPmnqXXyXm0BoGslyWjvkEl+DsdWWpkqDOEVbd6T7HiCBLYU4K30YwlHhcUvprcD/bBYcFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789671123; c=relaxed/simple;
	bh=OG82Jxj0msnRfSdpEsWnvtGSGZhhQK5dbyKLNfGJnPw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QJISiwhH2jwEONrR4xvhYbOX47IGV0SEUMRKw3CqA7m5vJztyfZvK9VQFzt5uuooMnu0A200YysbR3cvdkUd65eEArhnSByLvdA50B0tFAvWtsQAp6iMRuMGrJHa7sg3Nvgx99cund2J4y+fFc1PZGPpcMqftPsQmEBWKMpDcFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SilCDE4N; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SilCDE4N"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ed1368so14100535ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789671122; x=1790275922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K5m8l+7VKRFbWFY6ZRBtl/OLyMFvN+m0132oJVHA/W8=;
        b=SilCDE4NY9AVRKuyT4SXl3Qsnymi2jt5IU4h0wRq8GDKPAv5wNid379sU9kbnM0LnI
         Ls2Mj68iJGjM8mc6pFJxiySpyd26UIgaZfhcpUpVbAhSYEZs68BfzvPahPR7YzVAwepE
         YSK7DJFEXYDBRFjtFr6jcYAsSgA8nfTnlZAUtdKdalC1E3X5e3A6cBfR5ijomn+G499b
         nqgQHSgP9UW9kTN3CisdgVxWfUnGSzQJGmnJvXjhFyLw7pZgF/0npCQm693+xrsOXp89
         lSr5B2yzv2c7sBAszElEAGFj+uKQrx5vl2bA9uclqryAW0yen9uK7GtIQj8OcT+BUAs7
         FlJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789671122; x=1790275922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K5m8l+7VKRFbWFY6ZRBtl/OLyMFvN+m0132oJVHA/W8=;
        b=NoUK8IevgzsOu/Vy4SL2dIbHxez1U/AfREuoopuyS5mqUJF12zw4Ui1J6GA8P4ODj+
         XkPgAtIX6Vam+D7m9X6YCRLis76Hfqo3PkVF0RN54aZnGw9kG3biWR938Nstj0Hlf/fN
         5fI4rWU2uDWY0Kv1g1sVamZugS2+yWSvgIaA7Gq6rtTRfl6E0N9kcSSXSAO7nS7Y/jpf
         U5K4jHU+7xSUCtT5X/8h50MuGCiIPOtW0RQxZYzmamGmG3yxrEd3eYS7Eml+VbVMerDX
         1SutB8ZT1HbjoscbLwhhLL5tFGyC8GeAbGr3B7tfeWFb+gH8UsFfcV7jLBUoSij+lZEd
         vGTw==
X-Forwarded-Encrypted: i=1; AKwUvBx/J/xkFGissBlsvx9zTYppmyGbyD8qZLkqnNQn04q8E+Q3tF+0F5J0IgQCMPPdCzlyV7rt7uaGm6DEYi4=@vger.kernel.org
X-Gm-Message-State: AFuF++kDKAoBrW+JmTT8h3VeJ0U8bJ5NF6Qb5CbQoR5Brb3q6QdD8rWb
	5I5EK4ntr7yM4ArXgtudlnZS19+rU1+Pea5fb7AC9ObEhxz/ATWFjRcR
X-Gm-Gg: AYBFou3ZHJ+lMBKHzziq2Nn25Fguv7KTHd3BP60yqceq/PMbHsC/ToiZ8JI8f4NHpPy
	mODbaQltYMEt3A0r6mMNW1JNoz7ChCAsucGcSd/B9sFWAIwRKT9Mco5m/EKFtzI3gLXkjxjU0WI
	K0dMoUP6Wh6147Mh9FrycIwnVw1uHqsTf/ISdHF6xphxU/W9ZVCoGTNvBd5V1pSqatRH4GH4Tnn
	yfRjWSYYxUp5zZFLBPqt7gE/q43o9qglZYbA+NtZwtKpmVwIznpYFDaSROhGFvSwl68Pet8ZD9d
	K3jvt0+AU84e4X2bqhtvJC/ynaYxjr93caU6pcvWeMJRfRE/Tls8QTFZFYbgKd8jfKHhoP6RZHZ
	kvrlBN9xKJd8PsmZiRWptSJhe4X5bV1enGVwp3Ps+NcB8xzy6zv1c60VitBHDiO8kW/FPELig97
	XWqBHZ9iVZlxZZinZ3INdfu+JNmciXnwjMGBrQRPjMN6nNC4PGVqQcMbp3HgCX4vZGg8vcgi7yw
	Up5aiKSL0OXy8qOoyO2pWV1aA==
X-Received: by 2002:a17:903:3586:b0:2dd:ad74:6d12 with SMTP id d9443c01a7336-2ddb1b9e495mr2575525ad.24.1789671121625;
        Thu, 17 Sep 2026 11:52:01 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:661a:1232::1d0:c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89f331b7sm31032655ad.82.2026.09.17.11.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 11:52:01 -0700 (PDT)
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
Subject: [PATCH net-next v3 0/8] net: dsa: motorcomm: Add SerDes PCS
Date: Fri, 18 Sep 2026 02:49:47 +0800
Message-ID: <20260917185010.3189199-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support in-band negotiation of the SerDes ports.

v3:
  - fix build error
v2: https://lore.kernel.org/r/20260916164310.3168269-1-mmyangfl@gmail.com
  - Remove YT921X_PORT_MASK_* macros
  - code style nits
  - unconditionally write BMCR_ANRESTART
v1: https://lore.kernel.org/r/20260909190541.466476-1-mmyangfl@gmail.com

David Yang (8):
  net: dsa: motorcomm: Remove YT921X_PORT_MASK_* macros
  net: dsa: motorcomm: Split xMII and SERDES port masks
  net: dsa: motorcomm: Check port type with runtime info
  net: dsa: motorcomm: Fix register bit field names
  net: dsa: motorcomm: Introduce yt921x_speed
  net: dsa: motorcomm: Hoist port_to_priv helper into chip.h
  net: dsa: motorcomm: Split MDIO bus module
  net: dsa: motorcomm: Add SerDes PCS

 drivers/net/dsa/motorcomm/Makefile   |   2 +
 drivers/net/dsa/motorcomm/chip.c     | 525 ++++++---------------------
 drivers/net/dsa/motorcomm/chip.h     | 106 +++---
 drivers/net/dsa/motorcomm/leds.c     |  14 +-
 drivers/net/dsa/motorcomm/mdio_bus.c | 301 +++++++++++++++
 drivers/net/dsa/motorcomm/mdio_bus.h |  54 +++
 drivers/net/dsa/motorcomm/pcs-921x.c | 235 ++++++++++++
 drivers/net/dsa/motorcomm/pcs.h      |  13 +
 8 files changed, 793 insertions(+), 457 deletions(-)
 create mode 100644 drivers/net/dsa/motorcomm/mdio_bus.c
 create mode 100644 drivers/net/dsa/motorcomm/mdio_bus.h
 create mode 100644 drivers/net/dsa/motorcomm/pcs-921x.c
 create mode 100644 drivers/net/dsa/motorcomm/pcs.h

-- 
2.53.0

