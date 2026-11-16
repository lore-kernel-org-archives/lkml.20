Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794844923;
	b=I9xrStgl07G1+3DK3H7ihpake6ZQgv6Sp+0u3F7k74uw4JxNqW6KMnDW0HAFhpeGl1vz
	 sSr8tJYMVPQzUQGwp4BEixo+CedjeOmK22kP3SPaBRVJocB/uGTGZdLXqvapamuH7jIdl
	 8GRTjXP/dNDWfMeKRhJJr6OuTWlemK3LM5fcWtisJcAbEkkfIa2g1CZJj3jd8nHUPwaqW
	 gmtShGYyQe7Ldjf5FoZEtyCVOh6RaNXWmlfRGMwK4bJZv4ygulVBDkT4Kow0yRMliBsrd
	 9cxS6cT+ak9Yo/igkkMHwHO+YNKJda3Owyf/pD7MJWzb9gnKhoBmvBmJNf5g7DtwSGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794844923;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HIdoE9s9+AzNn9chfedKhMG83r47ugKY49BUgMQi/3g=;
	b=dncyJJoGQgtpvrB2bK2TeycHanEAZK+qOWmR6K5+Qr4rR4SepLzCHx5niC8WFXQwmZis
	 0qxWatcZI4DyMoRjT0uCc0MHs5dMY6VvnStX+E0rovK78ccvXqSLaVkGUMylv7YgJCTaW
	 UorLWiDLaBf/uE1vfl1LefXe3GiE0JS7vuVO4KZQV0DIH1CB1x9emJ8uPbFMwSHgoBEuj
	 xuGfm+Ev7bFxn/aIsZNHCLOk0f70NhscfiuI5Ypy1kYy6AQtZjaRS1XgXfy6dNFwbQOAB
	 hsdcYd6UpekOKJcdvz944Ta/N7qT4lfZ9ROVFpbYsQgCixqf6sx0Z665aETGISrABxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="m/+nOmrL";
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A26B606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:02:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A26B606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m/+nOmrL
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b37951a397so1542073a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794844922; x=1795449722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HIdoE9s9+AzNn9chfedKhMG83r47ugKY49BUgMQi/3g=;
        b=m/+nOmrLUgsGWqB6IHwUFNbAa88hsnd+irTEqCh6P5BADHuAaA6FhZNIeKhBKGkpdZ
         sgZ9M7lEXSylEztPRzfaw4yc98lG9DkvD1Ruad6IzUnS4Snw4QnyO9FMZxw8JxhXcvt/
         h5w4UZe/k9CJTvDU5JfwboBjYPBUjZWZVWi9zVtc5YQmyi9R6VILNPZc9O+3+Wd89n/i
         wdV5Qum8NJsHjYIrUQk4UC2zSXgkYG5XYwczK2LdvbTLU6AbUVV2cHOhQt+Vfg76NMhA
         n5g9F4vw7kuC7MJBWGvVMVZeUZJouZZXc9ILAcBQhDGDp1UNE+0uLetv9pxKxD+zy+Xj
         ZV2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794844922; x=1795449722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HIdoE9s9+AzNn9chfedKhMG83r47ugKY49BUgMQi/3g=;
        b=zD8InKxisf7xru9qfnaz0SLZkhgNP5/Rw7ekRET0uWhZj/e6qBGpIUYGUXeYsStQ6R
         q1a1ydqHfoDzWdL9Z7GV7uHVg+jR638iop4iaDZXHWgvNr3xgNjExizD/vqnZ+XHU6nS
         WWVSBtI+4HJ0t62tTBTNGJpPmb8h8kGgLOqyeHxLnFYul5yCXjJXn+ZMqNOlsV6WZqie
         PPXpl1v0KzfI4cT+JFFC1f8QvVn7r6Go+djSzNTB2wStvhFanF6HRQKdcEMV9P1yhH09
         l1LzA0j+aJ7PHBcRF4F3ZlVvzc7n9CZ/pu/ntihrQSEdLATLJDyEAgAxifdHdV6hz24u
         pd3Q==
X-Forwarded-Encrypted: i=1; AL+hErFuEKWPmml2rZ583YKu6zWO/+uRmlKzHU00gWCCCUf+ec4xMQ1df6LMU1fOXzbVN8LU91hB4rBEYjM8Gi0=@vger.kernel.org
X-Gm-Message-State: APuU4Z803Uj1JFE5kdSc4ABm4b62hseb7JLax0NQMrayi6ytgtUF7MGk
	s8pB+MjocjF1ejdEYY5JyvqwmlqjDo3svG0fl0a1wjbn4eVN/DZLWYDxx0BVfQ==
X-Gm-Gg: AZFdTZdoJczTtQLvTdlKIru+KYuinYRIIHMDsE5zR7JKG4vBlnznBYdXYjpOdsj+OH5
	ZX+JxaR6pRntR/a7mhF+PH2KyYDFN7tz5onTZ4X5uZw4hmyySSO5FuhoMHZ8JaxVqzimftw1ZUd
	IyoQTzbqwhxnwOVIbz5DcTKJoVYW9bCZz4aQlviBkaqXXX/ipAeFKiIDJC2osAYybmLPcpaWoYt
	EhbAiMb76n9szun86+8vd94TBjFH7FVOVg+hZjw9RA4blwlxmGwJdVLPPkulWfpuQSJcVyvSVxw
	+xb3FEPRu7mrIlXIY8e/cUinNDNHrnIi3jmagttuatph7PoNCN3TBfSyqgSLkSNX8/BYbmF+q48
	xcgRyRYntUcgmQEJMMqDb2Hn6voovYlOKOalsHmWRgIREhpHSwQFLPvwbg7FnVXfMq4kB+/TPZj
	kXOAdWQzLkpkBTxZJ2k6b5J0g+dlAhaIQHm3wHXAvRTcZXWk0pHAeND2TN/6horNfrNmFPneCjF
	fdicEBNoNUfe804P33kzJDmxp+t9kBvSoOzC/XzVMeblhZQOmnisu7x1CdIgXVDht+6Oaoo3P6e
	srrFt+KB+3b3hc6oHbFlxcIVGKuU71BijN2VgkvWmXd3u7mrLDjEWw==
X-Received: by 2002:a17:90b:2247:b0:3a8:49f2:8ddb with SMTP id 98e67ed59e1d1-3b1b0d4f314mr10849802a91.60.1794844922108;
        Mon, 16 Nov 2026 08:02:02 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:28::1d2:6e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1ae98151dsm17432051a91.2.2026.11.16.08.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:02:00 -0800 (PST)
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
Subject: [PATCH net v2 0/4] net: dsa: motorcomm: FDB fixup
Date: Tue, 17 Nov 2026 00:01:00 +0800
Message-ID: <20261116160107.1351198-1-mmyangfl@gmail.com>
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

Various FDB defects. Assisted and verified on the hardware by LLM.

There are more gotchas about multi-bridge setup, but I'd leave that for
net-next since multi-bridge has always been tricky among DSA drivers.

v2:
 - include the CPU port when rewriting FDB entry
 - read the port PVID instead of bridge's
 - fix PVID when port joining/leaving bridge
v1: https://lore.kernel.org/r/20261111234110.1449602-1-mmyangfl@gmail.com

David Yang (4):
  net: dsa: motorcomm: Do not inherit ports from dynamic FDB entries
  net: dsa: motorcomm: Rewrite FDB entry on port migration
  net: dsa: motorcomm: Read the port PVID instead of bridge's
  net: dsa: motorcomm: Use VID 0 as the unaware PVID

 drivers/net/dsa/motorcomm/chip.c | 160 +++++++++++++++++--------------
 1 file changed, 86 insertions(+), 74 deletions(-)

-- 
2.53.0

