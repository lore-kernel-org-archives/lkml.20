Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792455962;
	b=jwxCZsMi04sEqry2yRH38xLt/0/tff7zKUclrOAWXC+isKQV9cqULc98UZcSscdpLZ0Y
	 J8kr0Qh8aKEHRdPIw56O+AERleUwk0I9YXhbCRm3+mYGuGOsmgAsihgylndnMQ9MWKmCg
	 ibl70egP8JLO0OLzGzuVj0QwZwyJoiesOlkp9egMrVDBp8bjOzv43rGoVoq4zx//gUlA/
	 2qpucIAh8nDklzUktgrPagWjz02EWq5jyaSeIgmnliPSUGOC8Pd7Ajjn32ZIBgLDEaOy6
	 RT6+jMyfh4t8LEs0bxwldoKCY8GHQwE9OM290osW2a+78j+3qhqyiMqmCOVhRJmlNww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792455962;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AjWh4JhuzhVnE3zyAcaivyIWZxR4nepC/Fj6RmaJ8Uo=;
	b=QZB6VQi6LKV39tKdNTOtdaPnwh8+1NxU2EqCA98TV31pE3/uOsknhAQbnOov+zTbm7C8
	 CW95SMDcgVu8bUAxyhY2TOpAZa3HWixSEgDlp5dKY9oOhegnEIhFiPJadg/d/uEk/U0AV
	 B2rVBfHxjfxoZddKYmsWWyuA4Pboynq7pMYHlKl3VAS4c8dXEqq/oAkql4aq0/tQJokfm
	 a9MTgZoJDIQ4Ot4VcJojTcII983wMtqb0d3/dhXQcwuHUzYD4+SxtrKN/Xzqp2e/EhzrG
	 CmwYUdWEjObCOBYAPAuYgEbU0ITIjZi0nGdWt1/jRoP4NmOddz6C6N9HoRj7jnUfMkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=nfpj9EY1;
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7949606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:26:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7949606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=nfpj9EY1
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-3535a54c09bso2419748eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1792455961; x=1793060761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AjWh4JhuzhVnE3zyAcaivyIWZxR4nepC/Fj6RmaJ8Uo=;
        b=nfpj9EY1gDxC9/qh0zc6v9MX2kifMaYDp9aNP8AHWUta+3q/P0Qksv8kc8QOTaqW5H
         1icUjqoQczIXLtQ2STeafTK8tppIkTayvtknFC1a/HYUfKGaufFZ7Fpl3yTbadUvpkoY
         5V6/a829N9LECG0QPIsC/+pfK528UyJnCAlO+nBx0xtQBraRdaIx46DFbU3wi66P91B4
         jL7fCLFXu8Law6Qg6d0iUOWlKCgrUNyL3R0gg5IOUuOfvyodCw8kiGP75urkGyjHn4NJ
         mPTuSvstmVi9qa2isk7MZ+U8CyDFaPv1HD17OuZUcI7UgLlki4/TXnjB24GcOnrUebD8
         5ANg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792455961; x=1793060761;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AjWh4JhuzhVnE3zyAcaivyIWZxR4nepC/Fj6RmaJ8Uo=;
        b=n2bcqqjOwU2MW+cdBBTe/ucoc+7t2EzjZ5rH2vW3A5FqM55kOY2LUFZ0fCIXdt1q10
         Fzy6A9guh5/V2GKbJWGmssTuPQv2EW2y5zpvauEN6wDn9JL9smEdb3WChsLlqZWiMvfb
         pp2pUMkwDhV753+Bbdrx/MgzG4ag5afAgukg3bZLrF5VDud7FT5UY/JFqOGYUjryedXC
         E82zAwsqg2Pmx+Vwb9ELd0Rb5Fx+tN8K3pgJMI+vkpECSe1wS/qZJin9h9l54OKCOxwN
         40pkNKbOs56wy83FNs4e6JzsPqGMAi57utbGBBj1e/pXHOyWqXCtbqVV8N9eDm1oyROs
         2XmA==
X-Forwarded-Encrypted: i=1; AKwUvBzg7z1Jn9Spf59RwuRks1PhZipabUaWMjGMUGu2SeK8bUGPQdqO4in1UHKRhEXHt601qRYnFWG0hkOPvVo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIqzOekacGy9UVDHS++EyWImEZEu3XDcNaVDZiZDkSLe3maDYcm
	AaLFbqkGbQIhesdYFRukxTkOdgxsbS35bqmoI+mJsT2Hb5KkJV+ThkVqtbOKn/8s8MeXt/omChW
	m4S7Ok/HadIHApms=
X-Gm-Gg: AYBFou1OKnmwVQakuRyGsL+JsltSF2GUlNb7LPiySW2qtaJ47kQ5QI2CEuM0IDOCbHO
	PX2sSvvCam5iE89GPL0vyA5NNPuDZQ2qpntCcU7Ply4Nps1yiHeys1ySIQWyMO16F12wQ9Ry0Xn
	IXUKxH7mGnPXeg5fFhzmd7xtpo1Y6pn8PU2aJ/yRQB0fj3PTNx1ycT4y5iT0MrLMKDJ8SR5W/P6
	lEN+H8/cyHSytMI54W92fH2N8CHmkZHcyeDp9psyQNxQxUL859yGcl5+yC/TGlOlfidLJFdmdKB
	WyOq3G/D6kkI3NRjWgcFCTlCRypaCn6QW/2rwlCkl9+BT3WcI/N+gWX6Z37PO4qU/HgMDAFHw0C
	XhN2Xniby18vNin4WFSX8kQYDTCudUnGABw/Vyo6LqmcqNn7XPgdPOeD6D2btVdqjdrKeGekBCA
	D5xNYZGMv8UWkO4nmw5JURT/KjZjC43VsYesZtd2rTAPOcM8rqJyE4HfNZ9bu1qRhmJ3IvS/teK
	rjpEeQvbyvI/MQa3FralN5N/lTe7jsp3+7DpsNPqRaKAOgmVcuqKKvclu2yBqaR
X-Received: by 2002:a05:7301:1522:b0:35b:244b:ca8c with SMTP id 5a478bee46e88-361a23515eemr14210448eec.33.1792455960694;
        Mon, 19 Oct 2026 17:26:00 -0700 (PDT)
Received: from devbox.ts.blockcast.net ([69.25.95.32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608258aa66sm44748072eec.20.2026.10.19.17.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 17:26:00 -0700 (PDT)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Simon Horman <horms@kernel.org>
Subject: [PATCH net v4 0/5] amt: relay tunnel lifetime, validation and request-path hardening
Date: Tue, 20 Oct 2026 00:25:52 +0000
Message-ID: <20261020002557.3984927-1-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
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

This series hardens AMT relay tunnel lifetime, validates gateway input, and
keeps unauthenticated Requests from consuming relay state. The fixes were
found while reviewing the AMT IPv6 outer transport work; that work is not
included here.

I am using the existing IPv4 AMT relay and gateway implementation in a
multicast delivery network, where gateways on access networks send IGMP/MLD
membership state through a relay to reach downstream receivers. The fixes in
this series come from exercising that deployed control and data path; the
series does not claim to add the IPv6 outer transport.

The first patch closes the gc_wq re-arm use-after-free and makes teardown
safe for RCU readers and delayed group/source workers. The second rejects
Queries and Data from 0.0.0.0 before relay discovery and revalidates deferred
Queries. The third requires exactly four bytes for IPv4 netlink address
attributes. The fourth makes pre-Query drops visible, avoids counting
successful reports as drops, and uses concurrent-safe TX statistics. The
fifth keeps Requests stateless, authenticates Membership Updates before
allocation, keys state by address and port, bounds per-source admission, and
silently drops failed endpoint admission.

v5 changes:
- Defer group/source node freeing until their delayed work is synchronously
  cancelled, with separate GC links and owner-pointer invalidation.
- Preserve the original GMI expiry for Request-only intermediate tunnels.
- Document deferred Query revalidation and rewrite the patch 5 message to
  match its authentication and admission changes.
- Move the unauthenticated Request endpoint scan out of amt->lock and remove
  the ICMP response for failed verified tunnel allocation.
- Add the tunnel liveness checks to the lifetime fix and restore the dead
  locking comment.

Validation: GCC W=1 object builds with IPv6 enabled and disabled. The full
W=1 build is blocked by an unrelated existing unused-but-set warning in
net/netfilter/nft_compat.c; the AMT object itself is warning-free.

v4: https://lore.kernel.org/netdev/20261013175407.947606-1-omar@blockcast.net/
v3: https://lore.kernel.org/netdev/20261012125943.558629-1-omar@blockcast.net/
v2: https://lore.kernel.org/netdev/20261009201455.1904698-1-omar@blockcast.net/
v1: https://lore.kernel.org/netdev/20261008003606.3666617-1-omar@blockcast.net/

Assisted-by: LLM

Omar Ramadan (5):
  amt: fix use-after-free when a Membership Update re-arms a freed
    tunnel
  amt: reject a gateway Query or Data from 0.0.0.0 before a relay is
    learned
  amt: require an exact IPv4-sized IFLA_AMT_{LOCAL,DISCOVERY}_IP
  amt: make pre-query report drops visible
  amt: harden relay authentication and teardown

 drivers/net/amt.c | 550 +++++++++++++++++++++++++++++++++++-----------
 include/net/amt.h |  31 ++-
 2 files changed, 447 insertions(+), 134 deletions(-)

