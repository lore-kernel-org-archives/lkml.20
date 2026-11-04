Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793822659;
	b=wbkkKqJffNEK5VViykaj5MrRJ8IABcn41gEjBhTNYFRpKyskEaUzDhVG4RgYDTwqh9Dq
	 n6gQOZ8m5Va7s9fZKCL8l4WKJNl/WpgGB09VbDHoos7cpLYyHLu0JwtTRkexiN48oLdn3
	 bMzp9HgOOhIZIbFwA0sdEAi8r8vokXbMDa25gHDAPfrinYqgDI1yfy+2qcdam8pPquz9k
	 Ej66Vvp0Ewdy+ItGLPNV3y5241XNxkTnnOhfB8D8fpP74rODFbPDinkVrSBwuIeD33Mex
	 id36INs0oUYHI3DOkWDDocKBwGy4itkhLrOLuc4mm/GVtVR3QFpaeSO8f9PKTuc6SgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793822659;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=r9/eIU+FnAWdLR0w69M05r/29MzcUR3vux4EI6BM8TQ=;
	b=xMTRdGtH4TGapIOiDC3UFoOpXGNmJxZq0xOEw6L2CqeJ5CjMPcaZ06Cbemt82MZN+Jaq
	 821WLgbdpL3e1LSijZGtwZukeXeDeQMUSBvAZvoh/uTsnxiUGlO+N/nClh8SuyDgA0rYv
	 K3IkvIPEBQqSQN4RMRExjWmSw8B6XqPPDxSIbn3TnR1B76xTTouHhWUPPVjd/yTCFm4YI
	 H8AkDgN27hRQAnTawU9lXpa99G+CC2ZOidOZNyKnKNM4AR0SG0iX9frBtgcH05mgFKEvE
	 RUFEKVCTnzcNIICRdfyZQEREgVd80SlNDPVOSLq8apsBKcIYDArPBd47D97xi36++QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ITkVV/lq";
	arc=none smtp.remote-ip=209.85.208.175
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A81D606E83A
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 20:04:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A81D606E83A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ITkVV/lq
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3ab4891fc73so10024791fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 12:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793822657; x=1794427457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r9/eIU+FnAWdLR0w69M05r/29MzcUR3vux4EI6BM8TQ=;
        b=ITkVV/lqV3pmRjprq/RI736OUujqbhkGPmsQfyiQLZrfwsRY/8ho0oOyTqoTndSHXz
         qf/PkwR5GDPJgRmLi5Ap15hdlxt7OVssd6+O/HtTvkghiLb4iFWNv9JxCZPHWCNfA+BB
         n+4fgtOJK/xQoaR61Eb0LhldN3+2NLnDLj3d39VPL8yq8D1sDPT6zQ84Y4yG5x9a50c+
         GDBsx83ygq/olVCl0znBqVnhKr0P4K/4nx+AklKHfEspCebf9M4K1g6Je6a5hU8G5ZGA
         43f2Ou0F+Yi2qY8Np5LHn/C3S+NTxB1V37k/p8khAyDUv5cNvV+hNGRcue6fdb7uJBER
         iSbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793822657; x=1794427457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r9/eIU+FnAWdLR0w69M05r/29MzcUR3vux4EI6BM8TQ=;
        b=2CbjjaQJdLx/uces0pyW+LGgRl0EFNPnvXKyHh3kgTBeOIfCx/AzbsLogmocXPggiM
         2BMQYq85gYdEHPaVjFdXICb34K54NHCcTN5MUoqqtIgHVrxWB5lUolW+98Fa+F66jCMI
         zSBfznjbDpaABtbBSVKbO2u27ErI6nkV5dJjGN/byEl69oeftsMHsJC9EimQXMhUIdUb
         cbxoQClwUPD1csIYhfmBD8O5Pt/fNe07NrPtAK7aTEaMNs43cKCjlGYID4vUG3OGdE9N
         +2mJM2pCEZ/LOD211UtxFy1DueAjKKrmSsXKKricWtA4bVUw/OvXnPdJZGjQY6BuSSh8
         tZ8Q==
X-Forwarded-Encrypted: i=1; AKwUvBwDzfWGV3uMd4UERL9R+xjbb63yhes6Le7IOe5nrubvvg1Zhbe5yL8kKL5NgEzEuV8r+SQPGDCd1SDkYPU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+oqGyWoggsxr6RtMgvGJLW5InPU3w5G0f9BemuBkhM7lUfX+8U
	L4g8pjoL5Dx0R4fMLfaMDZOVJmQbllluZZj0uy3cyST/+bzwB1mKY/p0
X-Gm-Gg: AYBFou20AEIGU2ayfO1HPGj9QqEaV/XjUDiKGN5PRRu4R4qzDkGe6OmvLz7uBHW1kJf
	TmK/Z75dgQHDOwlBJ3YydHRdiHYViYC8fwu0AaMOpIyWqaHhCYl69AVgbMmKCnThBZL1oOXT4nB
	OBlDxhGZxVsgdLrOvZrGoP+3I4NrSqS74s4GJrcG8pzhpEiw+twqbNr7vqX3OHZ6e6rV2aclETR
	2LQz3o3qrgCiYdGmKtHWSBhA/ioyM9+3khht5FUCOiOqp2lvovS/cabv9MF+7DnQWk49KWC0Ppe
	oUsx51VY1seFsowMGknk/oJJXjYVEb4xc8w/owSnYMDIQpcVHlaigbjae9eMSRHGLQrRnbZLWXL
	Book57ORIXo7pLsRCsSit9sbbDVlaXRwBvFKD7xG6zxq8eiEfLaPaK55jJKQwUg5UW3cYkE/94R
	FQu6CGw/fcQErar8DUYA48D6d6P+snrIZg8ZaVvr9Xv+x2c6XpEgobVbOpyaQL05kgL7FwWIeUd
	PZJsKP1VsWc/pQ2e8CjxGBj5n2Xc/eEiFssZidvqWpqg1S617hroq445bmA2XlK7vxw2yy1qLoD
	eawQ5shPaWWhKluce1Kc2nqWKLYAZw==
X-Received: by 2002:a05:651c:150f:b0:3ab:3af4:c2d8 with SMTP id 38308e7fff4ca-3acb7ac0035mr41427011fa.28.1793822657073;
        Wed, 04 Nov 2026 12:04:17 -0800 (PST)
Received: from gentoo ([95.55.209.127])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acdc6e9b60sm5848021fa.35.2026.11.04.12.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 12:04:16 -0800 (PST)
From: Yaroslav Dudkov <aroslavdudkov622@gmail.com>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
	idosch@nvidia.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	weiwan@google.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Yaroslav Dudkov <aroslavdudkov622@gmail.com>
Subject: [PATCH net v2 0/2] ipv6: ignore link state in gateway check
Date: Wed,  4 Nov 2026 19:56:53 +0000
Message-ID: <20261104195655.1406837-1-aroslavdudkov622@gmail.com>
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

IPv6 gateway validation can reject routes in non-main tables when
ignore_routes_with_linkdown is enabled and the nexthop device has
no carrier, even though these routes should be added.

Fix this by ignoring link state during gateway validation and add a
regression selftest covering IPv4 and IPv6 route installation.

Changes in v2:
- Fix variable ordering.
- Add a regression selftest.

v1: https://lore.kernel.org/netdev/20261028152634.3355852-1-aroslavdudkov622@gmail.com/

Yaroslav Dudkov (2):
  ipv6: ignore link state in gateway check
  selftests: fib_tests: Add carrier gateway test

 net/ipv6/route.c                         |  2 +-
 tools/testing/selftests/net/fib_tests.sh | 40 ++++++++++++++++++++++++
 2 files changed, 41 insertions(+), 1 deletion(-)

-- 
2.54.0

