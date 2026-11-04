Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793793698;
	b=OKOs2TRM6UHcBBOeQQQs4a7fNTEn42k75Q3MzjviihK4ij4bN4Qki6OKMdMkd8snUyBR
	 NN1TFoLt1FxvEu2wgSxAo7hulunwwqnlad3lbRIaOWtfE6icqCIWaZj2K5aVpDqntnHeg
	 S9WPPhoOQIcP/WKpRzPb1cUFZQuLpjFhGXH8mioUdnyQL6qZzb919jQNpIZi4I48LH+C/
	 gvMs0/Q1D53ZMlRJw7R39MOY+zQdaK9hGOEsIlbrGmqwrTUzuB+nyYrLZ+YPDmLvzvmVq
	 7Zy07ijrgnEs8G+c5/IdqejtR3rILzEO8K6g14kJh2umfcsewNofrJYiSwbj0pFVa/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793793698;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=c6Q3xJJH5SJiVioyuWGDRhiHpOPbXK922KYJTEbUcSI=;
	b=4TvVi/Vn1DRNz+nUtOyy4zbFvZLnj3i/IhF0P69lqByhN+rKCojhXfh1i/KEZ925ReRn
	 C8s9egyXd+KWaWyyj5UGwxQv7GqFYeDpBcgkG/dEoZ8p1+uODD9F5X6B+lpVIw1Aobx2P
	 OR4t8wO1GEzmr7CJ7esb3r3BQbuhVDryahliEIPV0Yja1Nllfss+AtQQk6x4NIDBFmY3q
	 3dSw84ock9PxcGowYsgddNW0/PGmnYgl5bLhkX41Hpwgmc7eyU28uIi9VaGuzRcmAL9Ld
	 VUrgmACAGmwCccvc6lsSpb3ZtV+IikUp5VBw/6ny7CzSfVcG7lxSMORKNcpBo8/1hJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LgsakOl5;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2618F606A33E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:01:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2618F606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LgsakOl5
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4326803b54so24963466b.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 04:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793793696; x=1794398496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=c6Q3xJJH5SJiVioyuWGDRhiHpOPbXK922KYJTEbUcSI=;
        b=LgsakOl56Zrxx2pzmOn/BovgzvRHGM/xH1iS9saI2poegNqCdsoaunrFyYOMzrmei6
         7fn9nBs2LGWjfzJX7xFY118KAfYqukNMuLyVbG6PeeI3O0HrcDMxccep0+0VfEF1aCOM
         z9t/ZvvoRpVzJrlt2ALTtk20K6+1gb8FZEsJPgcX4fVZusNTx/vpcOp75g5Hrbiy82TL
         1aSWfRuoEq+KUWvNu30MQPYzTLODqaVB3AfbEKBbtbUkMZpxa7+2zWrFsXH5EH6cgAXa
         +DJ9cmYLN15jOxwhGGRFZe3P8ya0TABvUpdbz8aZwmkmggj3vVjRQN9dTzXugA5oh3zO
         9xLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793793696; x=1794398496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c6Q3xJJH5SJiVioyuWGDRhiHpOPbXK922KYJTEbUcSI=;
        b=rGQYzEigfkpr/xAz+7tAvbiZWp/3x47CZispYbl8nDfr5UDARYNxAzqvSCuNuaSCJ5
         bFAcbNe2M3/3GBqB9i4GYcfmlcNxonaX9pMVgJ5bPA+axzzB/2kzb3sfcPq4COqyi4I6
         sDnmWnotKwaqbyjbkXBPRYtZrUddEUlp5Pn/m2fESmAqtgdECCHmoGzQjf0PGrvgkI/6
         rbAkrx4qdzRwXhUO0dvm1MSk76yh+l2wRQNuam3JZ7hQ7D3EDCWA2T8OYxuIsaYSWXBN
         +GJa5wW71DjG73SD8zns8RSdFxe48lUNQ8LYm9WVZ2h+VWaQ1+hfBkgi24KvwpPmxFEc
         CcsQ==
X-Forwarded-Encrypted: i=1; AKwUvByCMRE++8FcoTRM/cEFN6n7GHlE0/DJbDTFiA9qFAiumqSwy2pxY8XlxLLNvSUBFXfPyHY/QFx0LhtXMoE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pZfmqOnGIZuBbJaueiYSpgZyrzES8lHdjBb4PlB03cS+lJgRC
	+6XFGNMBrVhfVICkzuQW5iOSlOYvI7bq2Gegiw/qjZBr8HTXeWDxVrsi
X-Gm-Gg: AYBFou00+7VY+gl7nDTUXYl9CjyX69AjW4c1a9sjt4HxTDAhVlfJmDVt9rqlUAiEjNI
	6s+4rzyjep7G2uAFjf3m1fsc3dA1PJLrnbCs81jEtCHQlJvd3CT3oxGj0n9Y0No/VDzkE8mdM/G
	oDz34+t/05qCmJQYcIT+qquCz9SIKp/RSH/F512W3bSle+f5fxdEYkAzaS3moxxmhODDzkmROxm
	STXb+q6inhsfZoUIB8sJkMhJW2UgdBidTuapp7yw4tZqB8iDD9nnMkX/QfIRWcHcOncVghw0zJB
	nBjhEXy+pyw4CSVlTLEk6lWhqdfdGdcx8ncAwlaPpqyf3rDD11Bk/kh9H89TyHzZiTlnbtUqoBI
	JX7mKsqd9MgVZ8we12fdTCG2FmCeBuW+3OcJKJKjMv+aYK7NFiNyufqbQSrGxDubzETjvsM1LAa
	Y0Qc7FD0yupxhy00Ctukw7Q1YUbWNJ3imZd9tSKt126yl3DMOs+Fo2WLn2qxwGuzilHDUlc6HGR
	tGC2Y6G+PV30emgDc8UXROd0L3RvYpQXsZBmYU8dr5T5Gq2FLFKyyhPOYvJiOsCm4Dh3Etoowxk
	PJxTcC6lgoCstZ4j5cgIfIuczfsgPyoiyRF9Wynb6IASFwxZnE1iPS9rXYpHRdO4/d/3O1GHikT
	iHEJkLUjcbZtK6WxriJ6H+czjNoADjkqLMg==
X-Received: by 2002:a17:907:980c:b0:c49:903e:1e19 with SMTP id a640c23a62f3a-c4ca7a82557mr1350207466b.26.1793793696132;
        Wed, 04 Nov 2026 04:01:36 -0800 (PST)
Received: from CCM-PC (83-233-221-133.cust.bredband2.com. [83.233.221.133])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e424f94sm60940966b.24.2026.11.04.04.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:01:35 -0800 (PST)
From: Yongzhao Chen <yongzhao.derek@gmail.com>
To: netdev@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-kernel@vger.kernel.org,
	Ziyang Huang <hzyitc@outlook.com>,
	Stanislaw Pal <kuncy7@gmail.com>
Subject: [PATCH net-next v8 0/2] net: dsa: qca8k: preserve port state across MTU changes
Date: Wed,  4 Nov 2026 13:01:27 +0100
Message-ID: <20261104120130.48455-1-yongzhao.derek@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
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

The qca8k MTU callback pauses the CPU MACs on ports 0 and 6, writes
MAX_FRAME_SIZE and then enables both MACs unconditionally. That can undo
a phylink link-down decision, and phylink callbacks, which run without
RTNL, can enable a MAC during the update. Patch 2 saves and restores the
port state under a new lock that all PORT_STATUS writers take.

Sashiko's review of v7 [1] showed that readers that do not take that
lock, such as the PCS poll, can still corrupt the saved state: the qca8k
regmap is created with disable_locking, so concurrent accesses share
regmap's work_buf. Patch 1, from Stanislaw Pal, lets regmap take its own
lock. Stanislaw posted it to net [2] and offered that I carry it here
[3].

As Andrew asked [4], the series targets net-next: the problem was found
by review and has not been seen in production. Both patches keep their
Fixes tags.

LLM coding assistants helped write both patches. Stanislaw, checkpatch
on net-next reports the Assisted-by trailer as non-standard, so I
dropped it from patch 1 and mention the assistance here instead; nothing
else in your patch changed.

Testing: the affected arm64 objects build with W=1, with CONFIG_PM_SLEEP
enabled and disabled. A local KUnit test on UML, not part of this
series, runs the driver's regmap config, register, PCS and phylink
callbacks, MTU and suspend code against the real regmap core, with a
register-file MDIO bus. It forces the work_buf value interleaving from
[1] on that bus. It also covers both CPU MACs running, port 6 down or
disabled, failed pause and restore writes, the second CPU callback after
a commit, retries and a newer link-down decision. All cases pass, and
PROVE_LOCKING reports nothing on the exercised paths. Without patch 1,
the two interleaving cases fail: MAX_FRAME_SIZE is written with the port
0 MAC enabled, and a PCS poll of port 6 reports port 0's link. Not
tested on hardware or over the Ethernet management path.

Changes in v8:
- Target net-next [4].
- Add patch 1 from Stanislaw [2], which v7 was missing [1].
- Rebase on net-next. qca8k_port_set_status() needed manual resolution
  against regmap_assign_bits(); the MTU and PORT_STATUS code is the same
  as v7.
- Say in patch 2's commit message how the problem was found [5].
- Drop the Assisted-by trailers from both patches and describe the LLM
  assistance in this letter instead.

v7: https://lore.kernel.org/netdev/20261022155837.760-1-yongzhao.derek@gmail.com/
v6: https://lore.kernel.org/netdev/20261019173716.198475-1-yongzhao.derek@gmail.com/
v5: https://lore.kernel.org/netdev/20261015104550.43169-1-yongzhao.derek@gmail.com/

[1] https://lore.kernel.org/netdev/179303171241.3134.15019965307136674652@kernel.org/
[2] https://lore.kernel.org/netdev/20261022192933.384898-2-kuncy7@gmail.com/
[3] https://lore.kernel.org/netdev/20261028145622.195730-1-kuncy7@gmail.com/
[4] https://lore.kernel.org/netdev/47e9713f-815e-4caf-8928-a7ec12d0087b@lunn.ch/
[5] https://lore.kernel.org/netdev/179268501671.3290.6623232109527554630@kernel.org/

Stanislaw Pal (1):
  net: dsa: qca8k: let regmap serialize register access

Yongzhao Chen (1):
  net: dsa: qca8k: preserve port state across MTU changes

 drivers/net/dsa/qca/qca8k-8xxx.c   |  34 ++++++-
 drivers/net/dsa/qca/qca8k-common.c | 149 +++++++++++++++++++++++++----
 drivers/net/dsa/qca/qca8k.h        |  15 +++
 3 files changed, 175 insertions(+), 23 deletions(-)


base-commit: 7b6ab4dbc156e2f96419715130b3d5738a306c93
-- 
2.43.0

