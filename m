Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794468597;
	b=AKAcBD9q2RWl9U5dcXp2SkY5v+dyYyFxTDpfW8SLYW2smRH+VBI8nT63kt21tYLMcnJK
	 08UpA9733xwYz9XOhsC1rvpIMr8c4yj3aYBcDEkdQmtr+2xL9mPoh1gzmSBsFaX/wH5BQ
	 fXGpyniHVl88+QZvOE2BTnsYkvDlbyA4o15Qfiq1wGzWcssrDxgvYER3NfsBHzkEX3Z3p
	 czLY/GsboZ8bIgIzTmZa13wlsnspc0PyK15qM2EzmxV6j0jqpxhQWEuahKs0sUVDCq4er
	 LevhpV2MF90+QanLUN0nkToKQFM8y3uREXyyymA9Ha6e9GmTJPuMPrpEkJWF0mVTQIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794468597;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BY8ogzTFjE1WMQglvfjtMG9sRYsnsNS31vRIHu7zQgc=;
	b=fLQ0a7WkDV6H3hc0rZu99G2BEUcZFZmbiY/zajqsO7FUXNfXLCJDMiTjlD100l8cSw1o
	 Wk2mWkkqnNlOsr/VL1L4FP27qNjE5At01PX9CUX5TH3zDpWJvbektuGLJxKse5+0g3g9A
	 zk1IbxYu6ETLTL5ufAc8hsC5Yi9vNVqSnngdp4tGULvxwHgS9U5Ug9PFfVWpfGiB8Lzvv
	 zTzHD4XstIdUxeT6qWGKN5WlX/tV23CnR1yGy1qkCvq9Tl6OeSpWG835itrJ68iiAPqCB
	 XEgJN+7rsxCtRCaQ2kb2CeLlfe/K5CUKBoR9rzXAMwukNNEPruKobQonwEKLAjopVBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=heOlUVDT;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F814606A330
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:29:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F814606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=heOlUVDT
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so38773855e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794468595; x=1795073395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BY8ogzTFjE1WMQglvfjtMG9sRYsnsNS31vRIHu7zQgc=;
        b=heOlUVDTWOMZbiOj8L9eNeQJVLq5a1Wx2OCVR+d1Llk0fVyNvDJ759+uw7CrMYNCNV
         NfFTC2cqxZ61O5qstKefBLQ8iQ/Am10MHBSeYO3mLSGpvXSbHkJ+dYwZ2Kdnl8ks3tvJ
         xHN2HrS/7QVOac0rPROeJcxsgpJlRcn6CRNjQbzEBjrPBWONiT+NZmUfs/fq3T6dsA+H
         MY3f5hH7en8FDiMOjAVVO8gNF3ODv0vTu+IihRUpkBsTrGvrb/4Odup5ELNnM0F5rcOO
         uoglq41y9dpaorHKSh1LlxCHw0zdcxmkl64D3vSSwTPCkTRNRlZMFPweODgRjZMkUCzx
         VxVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794468595; x=1795073395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BY8ogzTFjE1WMQglvfjtMG9sRYsnsNS31vRIHu7zQgc=;
        b=hoW3Btx6o7by3GVJzuoVjpkeDBYRFA9PMR9j5AC92SDtL1lZuhJ0vW6HrL7zoMGHWK
         kqSZzHUziIZQLzzaGD+xqFpZWVqhyQU1V7gn0r9NsoD/j3Y9Wl7I5d0pn510uZUNo3K5
         NcxAjvFre/Be5R4QcCeoS0o2/T/CL3t08LH/zMeFpgTyL1O4WeLdwWV791jEw7aMtHIR
         gyRAU2YNTXDgye1W1lF2Cdx1wcHtX+51ZE1k2yxqFlW29KlLr1eqvJmpISxg8Y16+6Y7
         8kOsAWsXH9XiAkFj9HmpNgjo6EYW3G/9+OwIwqsbsAztQM+rgSs/ITAdXfLlKeow4kOq
         Eymg==
X-Forwarded-Encrypted: i=1; AL+hErEw0y1GPEZPWAcfHMYMJiXPmQUwGqmzmciFM4p+eHf5ggDdAM01todHzTk3tMkQmsro8+NqC0SpbCJjHFE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6ZBZHE4rHIJxfF9iFvbzCuS+a+qo9rXNnfCGJ0mqKNh1+a/MT
	tO5oTqP5WDm8mNVhJAo/hnC3NILwoFZxtQA3jD+sSLkNDJyoikF+mAUi
X-Gm-Gg: AYBFou0Cde2xDgz1okMIyFzOEoRG/bzxfV0U4imloY2PthGgtFlMSWw/KWVhbrpvsjT
	QoL1eKgYu7yBWPWDkLFmjDMnpOzxchutw6Bl7RXFV0gkByZuGievImSxp4TULmZilxqJCXvfjWW
	kyOsIZqmpv4/enNrS0XP9asgJCt0AurQhDyzjt74Eox/ChdRIWiWUPRR1Hc0al6UFlA6Eg1UEUN
	zyrdnVsKiwlt8pcEjZB/F1tM+eTVhar79gFJLf9QqsaVuIU9KX2nJu99NuKtWbS1mo+7Ljz06YC
	mjMtoQb0koj5iLaUunJYPCapXqNmAqmMcZoTCszhg07QnWanPLVVmHx0BqyOHu24rAUe18Pj2J4
	TZkG5n7qbrA6+LPgjY22Vcrg7XChS7xl31WfBjvL7jtnRBQT4yE8aUxV4DVGVBVbFJiRbAAo2TP
	vQB761KaIzIkfJphhDKZK8ctpw1jYq40QjzWm1OC8++ldb+ibw5lMf35E7iVJkZd1ql9NsRavIc
	vtxc+TSTrKlTNy3+wqsHNSQfJVqmMSWRJ2BPCpRS3tjvJGOatjqzWlxO8hGzHjc6dKrAIZKyewt
	u7Q3j2mkUipWatPT9d59xFxZsRFadaQZK0U=
X-Received: by 2002:a05:600c:4f55:b0:4a7:8fe8:130c with SMTP id 5b1f17b1804b1-4ba0938197dmr97544195e9.28.1794468595304;
        Wed, 11 Nov 2026 23:29:55 -0800 (PST)
Received: from dev.Default ([86.127.229.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0951bf2asm81897575e9.4.2026.11.11.23.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 23:29:54 -0800 (PST)
From: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/2] ARM: l2c: honour status = "disabled" on the L2 cache node
Date: Thu, 12 Nov 2026 08:29:51 +0100
Message-Id: <20261112072953.989664-1-isasmendi.agus@gmail.com>
X-Mailer: git-send-email 2.30.2
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

Hi Russell,

l2x0_of_init() finds the L2 cache node by compatible and never looks at
its status property, so a device tree cannot keep the L2 cache off.
Patch 2 makes it leave a disabled node alone; patch 1 notes in the
binding that the firmware must then leave the cache disabled.

The user is the ZTE ZX279128S (dual Cortex-A9, L2C-310 r3p3), where a
PCIe read on one CPU deadlocks against an L2C-310 line operation by
physical address or a Cache Sync on the other CPU, and the board hangs
within seconds of WiFi traffic.  Running with the L2 cache off avoids
it, and that was suggested as the fallback for the platform when a
lock-based workaround was found too invasive for generic code:

  https://lore.kernel.org/r/20261110153522.1620088-1-isasmendi.agus@gmail.com

Whether the ZX279128S device tree disables the cache is a decision for
that thread; this series only makes the property work.

No in-tree L2 cache node is disabled, so existing device trees are not
affected.  Tested on the ZTE ZXHN H3600 (not in mainline yet, on top of
Navid Ghahremani's v2 platform series): with the node disabled the cache
stays off (control register 0) and the system runs normally; with it
enabled the cache comes up as before.  Builds without warnings with W=1
(board config and multi_v7_defconfig); checkpatch --strict and
dt_binding_check are clean.

Changes in v2 (after Arnd's review):
- drop the clean-invalidate-disable path for a cache the firmware left
  enabled, and with it the "factor out the number of ways" patch: the
  firmware is responsible for leaving the cache off, the kernel does not
  touch a disabled node;
- new patch 1 saying so in the binding.
v1: https://lore.kernel.org/r/20261111133930.3665251-1-isasmendi.agus@gmail.com

Agustin Santiago Isasmendi (2):
  dt-bindings: cache: l2c2x0: a disabled node is left to the firmware
  ARM: l2c: honour status = "disabled" on the L2 cache node

 Documentation/devicetree/bindings/cache/l2c2x0.yaml | 3 +++
 arch/arm/mm/cache-l2x0.c                            | 5 +++++
 2 files changed, 8 insertions(+)


base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.30.2

