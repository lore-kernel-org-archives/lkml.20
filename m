Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794174309;
	b=JOl3fF+Mm3XqsA22Uy+A/XhBmifnnATzFVco4s9umYIi1mnNTwxgbhKidU00LCOo0LCk
	 fw3ImeiyF0LYHYMJF+6cZBjFAFvbJtMfjMZua1xXYvIF4oUcEGA0QIMu2PTh28gGkvEe/
	 C2aqzWOiyHpDQAZG+EnH9rJ3L96VxXZIdDJyqmXt/9NH05yPeeer8+J2xVTkrorJxs5bg
	 2ydsFI1d0/ErCRbGrvkNP+jD/C+a7h5vfykZVedl9DvPrwiKIIo9qRPgvShqFgf/1LrDA
	 CALTcTyvenqxVNIOyDck3f7CQ5ZKiBvfA1E+tA7vu6E8fHY4TgvyDmVj68ovChz7OHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794174309;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bV6rF11efYV9YrKCAFoIXwnaGS419MER7+z7uQlw/1Y=;
	b=Qm2ng5SQyOZx216eb+X4+b7BC9+7pR8CEB+uD+GQXY9SLGJ1xu6P6EHcTTw6JnuO0Qk2
	 qQkaFPGRXzVB7KtOzSmTXbkvkX3+pySh0YnCl8Xe7VVPbQ5urnyO2FmuZmEjjPf5Sggwq
	 47DlpJmXQaQT61sZVT17tiMrr+YlT/OTOlDMcmCfQzJJOECPxnjbzmv2rojvPLP1eQxlr
	 rm1NVi1UatYtIKVe2/yRHMC/j0xBlwmTWadn8MzaZ/Kciv4w0EyG96n3yXayb/aAaiD2L
	 hpyoYQAqnJp+PQ/+bCPTQQAj3oZUyEnEvb7wgOZRUUdlsCvfP6syxKyhUGrZDQZKr5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PpHEkBPy;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C84606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 21:45:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69C84606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PpHEkBPy
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b0d09df973so203624a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 13:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794174309; x=1794779109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bV6rF11efYV9YrKCAFoIXwnaGS419MER7+z7uQlw/1Y=;
        b=PpHEkBPyQp97hgnQ4C+qJhtOcjJmFtTDiVbYcmzg1chGPrwZqekj2visWsB2VPcOiq
         fxRJJeX+XnlEKJWE6Sic6KG9BkOzNqq3Fm/uSTE38nDGp3TpmjkVc/mu4Pl2B0vjsG4k
         sLTRxkH96WJhAWVegLSIuP3iicQzTEh+tBcBj/oa9VVjRZ0q4m1evSpZBvh1KFBVgzJL
         L6xOxTG570r00CurfRi2NmFpq/b++5Okcqj81ZX1QfPAoALxuI6tkYh6oueVRhkh6PH2
         pfVhGaWqrykM3NYzRojeaHqhhYAnNbGRgY/kjufyedLCdkgwnSUZDeJpu7lyugpwVeeS
         m97A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794174309; x=1794779109;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bV6rF11efYV9YrKCAFoIXwnaGS419MER7+z7uQlw/1Y=;
        b=aVsjOMBVUo4zCqH9MJDSvGXQZLXeHYP0/xAz2baZigca3IgT6OWQ/gD+mwXYbxHm+P
         iOlJ/U2HPvgbJzCFeAFB9Gv5Knyknn5Cz7QSXMh0jYf16Cf7YQuGX02qO5Ha+KP/ihpz
         +I9vLQ8KHrAUxObQhirOpUvzPX6lj8M+lNoUIngYEjA688R8ABFgsEBVen4/HWe9dOMv
         6PusvN255ZeqCBy3K0GD9sWujZKgJzftI/8QwpxCMS/Im7ZMt0phNlpu3jV2HFURz8lc
         3as1q9EBBoNH7mqVu6W92g7AsxHPxGDyoDAM2eHss5zIHkA9sPOCPqy1Tow3L7b8w4O8
         5lPQ==
X-Forwarded-Encrypted: i=1; AL+hErG8gH3stvJ8zQeOLtdXKX3yNMA9+sEkpbP+7880fvdRoD+8FTEsD6h94LTdLlWqeWVutD9do601JmO1S2k=@vger.kernel.org
X-Gm-Message-State: APuU4Z9VSuA+35nKxhMqhT3yLJzfhnGFk05KUNTCAGJryJZIzAQ1rpTR
	bm8wi+qNcy1rrjxRrtJVqkh+CLRQ5WwbgOu0wX6k4Gcaxr8qv75SW/mV
X-Gm-Gg: AYBFou1znL+kW6Ca0vlAB6UmDpwsB98uTckWi93ApXb8gIzmIUGgfkje/esXHFIoHjO
	AyXfpet0u2nyJfzIrdJ2uW8oNexD0tvqvlwpf6kHs6w7lMq6zfZJbpFz90MN19rjGPTDlatM4t0
	ctb8SjF0m/AGHZagk/q6T5W8iLnvKMwDpmqXJA5mW8KLPg0G5Jb2X9jV2b1Wuv7Bdwk5uVD4vrr
	5QGYQaveB+AD+BKzXCzEO6koWDF0CVu+DwCt3X+MOwGG2QiOBZhD4ApNQoAshlj0E+SIb8gW3uj
	i8XtYyb6UGH+3rXNeEKvDqMwnn7fMfTEyhdcROzUJKsaGXZPYKQkFYqiGLgR4OprkO9ev9aHm93
	+MqlcW/Z5hw9qQYv1GTyYWxRjIY70uGasrb8tegRd665m2hSHjTAjRlFRloumPJ0GLhPao3Syyb
	KrBUSCPXKORg+b9YZSWwOLAcUhxEl8bDD6qlbJS0Zh4Dfv0qxWwruimheqAakzC8oRpe/Od8DR7
	coxjzbwjSvlH+LwUwLpt3v70Ev05nb5femSWQL70+THF0KHxNcP1VezSS/1hBmlvL0LQQ2GtwZQ
	cuSDnMfU9UrnjqRRRkPJel03ofGqhxJynnhGyMbsZTreCJdNF3QLcg==
X-Received: by 2002:a17:90b:3d8b:b0:3a4:f8da:2478 with SMTP id 98e67ed59e1d1-3b12d3556e8mr1972627a91.29.1794174308555;
        Sun, 08 Nov 2026 13:45:08 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:28::1d2:30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1034718f8sm4619463a91.4.2026.11.08.13.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:45:08 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v5 0/7] net: dsa: motorcomm: Add BR_FLOOD and BR_MCAST_FLOOD support
Date: Mon,  9 Nov 2026 05:44:40 +0800
Message-ID: <20261108214450.1662362-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Offload BR_FLOOD / BR_MCAST_FLOOD to the hardware for bridges when
feasible.

v5:
  - drop patch 3 of preexisting issue
  - fix issues found by sashiko
  - program RMA registers
v4: https://lore.kernel.org/r/20261107121631.1040612-1-mmyangfl@gmail.com
  - fix VID 0 handling
  - reset port flags on bridge leaving
  - remove local cpu_ports_mask
  - translate FDB VID for VLAN-unaware bridges
  - limit offloading to exactly one bridge
v3: https://lore.kernel.org/r/20261103140109.874443-1-mmyangfl@gmail.com
  - refactor port isolation and filter action for standalone ports
  - recompute flags when a port leaves bridge
  - honor BR_HAIRPIN
v2: https://lore.kernel.org/r/20261011030228.2761810-1-mmyangfl@gmail.com
  - fix build error
v1: https://lore.kernel.org/r/20261009005542.72860-1-mmyangfl@gmail.com

David Yang (7):
  net: dsa: motorcomm: Fix VLAN SVL and learn limit definitions
  net: dsa: motorcomm: Drop VID 0 VLAN table programming
  net: dsa: motorcomm: Remove local cpu_ports_mask
  net: dsa: motorcomm: Isolate all ports during chip setup
  net: dsa: motorcomm: Translate FDB VID for VLAN-unaware bridges
  net: dsa: motorcomm: Report inconsistency on bridge join failure
  net: dsa: motorcomm: Support BR_FLOOD and BR_MCAST_FLOOD offloading

 drivers/net/dsa/motorcomm/chip.c | 242 +++++++++++++++++++++++++------
 drivers/net/dsa/motorcomm/chip.h |  21 ++-
 2 files changed, 213 insertions(+), 50 deletions(-)

-- 
2.53.0

