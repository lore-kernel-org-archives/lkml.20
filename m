Received: from mail-wm2-f11.google.com (mail-wm2-f11.google.com [74.125.225.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F524EA39D
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 20:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790627000; cv=none; b=lS6EzXdJ7Uoz3q8bUIulujHcp28oPIv/kcryD2c2uqv9HXvbIqdJlgA5Y8W+7ZYeS44Oxm8NX9RE+6RVAFhgqE1fO1T7BgYaunguR8b9ucL0uoIn6kPFQix2opmIsHjF12aHPuFjVUJPZrczwoX0aM+Y+IWe8kddBXxllLq5jhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790627000; c=relaxed/simple;
	bh=iLiBo0vYpod9vZLl9UBi8bgWGF2bDNR8qRFcnNTeCHk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CFM+NRysbo+2tOjkZlCRzFD0yawuBD14Cl/UiPGXD2XljvFp3KerY45V+crF/RnqhKwEqTMXgIs61uX9ZgiYBogosne9H4u+vDeuOVWIj0fkZw/jn29f072zcSHvsMATgo15S6eAp3FtscLUAxGWV4iNklmUaDd2lFg6+UEIXCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net; spf=pass smtp.mailfrom=blockcast.net; dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b=SOnF6IhM; arc=none smtp.client-ip=74.125.225.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b="SOnF6IhM"
Received: by mail-wm2-f11.google.com with SMTP id 5b1f17b1804b1-49ff906e297so3859355e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 13:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1790626996; x=1791231796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zy3J2tytWwgmIV36YeTTMRjanXAuGoVq/tIKUKUhT7o=;
        b=SOnF6IhM67NUoMYEuW4Aw64sjECJ2uLqytTeLXM4FfhDSM683MKXm+KxOMN4hdjrFj
         WDhTDMeIE3MmJzqCNoInb1vL101zxSfGJwoxf2Yx+m9E6bIvRjpD6zZNHG7RhzM7Ne3Y
         6bxTLY1HeHQA93zW7ORRztmvmxm1EkNP4FtghaFYa4vyB8TZPqMA9qhUg1nc/BOFsBPw
         99n2SjibgNgx5b3wbtS9fPJw+0NbTLcBtagye6BDCE1pu+nr+Xd2SzNDyZmTJ3UZ93J3
         xHR3aJMUrbfC5VLfGTsa0wpnp1yDMaTL21JDW6xTz1rfoMr7AoaVKKy80/EmJvTOyvnt
         28QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790626996; x=1791231796;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zy3J2tytWwgmIV36YeTTMRjanXAuGoVq/tIKUKUhT7o=;
        b=tFNY/VLRaps2d1lTw6LrNKExg3TcAUSkAnzYKCjoUiUeFuNdxnXNLmWZHAY8Re+vw8
         IGHcAhTDlfkuALTKr4vZrb+IbxfYAzQlWElI8sSwlBT50nK8mXoO/GsyLUUXTKvs9nQ3
         E0xGRDiZ9QnNU3rZgcToisegDxeEnC/NX+TzaIAYNvWGVGqQYdstDGH/XL7ItZiMn7hp
         ZQl4iv2COwwj3SD2jbwmZeo5CgK68hrkQT2INNVcubIF+JhZHgrk9bYf9rS7y60vK3SG
         DoiHt+omJ3NlkAhAXOtKlc/dMwmgQwMowqQgiGMcCnK8bBvo7uRMa4wmyyRANcsF6UsA
         RAug==
X-Forwarded-Encrypted: i=1; AKwUvBxJvoidlnS6cdaN5Tj00zMNoPpatoEHTYiSr697tQSJ5erwnWAI6vQamEpUSx7sYEXmLiv1XpXlAM525FE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIHBiRnTh6ybaktE/Fup8C8jVAeiSr104UYFGMx9zyyQFbwDr1h
	dBqg1AfxlVCwHDrPyXJZHIAUP2ZjgDGAGCLWHIG5Y2uAUP1v+q25KB4AqaygDTHgHzc=
X-Gm-Gg: AYBFou2EnTlHPrmLOOvXxqst2r4W1ENmEKGiKcOHzuZb4irymR5lOYy9gl3QAy7dsBV
	3S0Q5pnZ9R6OHWN6Mhk7OModZ4AE6gmkJbCLk9ZCdO3L4TVbrKxsDUZOiWu/uwetJb6PLwyPc7w
	LRJvP9xzcpNmbjBr8dzOrDoVTDiY/cl88fzh37RgpZWX188JKAmRxNZqmFSQQWjwCUcvu4t0erI
	CFlNKfTuzgQJnYR0gqmPWNym3snUUTD0IWgF3cCKbZ0+xyF2ee9rktqw0O952wgEl6rgwJrbirg
	ly998Vc3Q7Hft4PoIH85oE6S/IsxTwSaxowDmDf65PcljalouPt5lvDsOx6PSayO6DTMg95Uguh
	0zq2gGOBKm/t76uWmUBg+7ruiP47blO6LOp18ACFuX6DqtpqJKBUios1jb8KlyPDumFtjAOnJz4
	GivAwmUXNrRjSP/EP5R78Vo8ucvT9OyVbcSaFfXnZIBWfQyiyKK+qyT3scSXv8kAnw++HLOCVR5
	kQgc+JneRaGihS8f4lJHFtQgN/83ip19C8r1/xejvvlMMpedgI6ftgE6La1oKFxvrQUR7el9lD4
	AQ==
X-Received: by 2002:a05:6000:2504:b0:487:1256:ab80 with SMTP id ffacd0b85a97d-48871878daemr25904268f8f.57.1790626996226;
        Mon, 28 Sep 2026 13:23:16 -0700 (PDT)
Received: from localhost.localdomain ([197.51.38.79])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30bcdbsm29620500f8f.2.2026.09.28.13.23.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 28 Sep 2026 13:23:15 -0700 (PDT)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	AutonomousCodeSecurity@microsoft.com,
	Xiang Mei <xmei5@asu.edu>,
	tgopinath@linux.microsoft.com,
	kys@microsoft.com,
	Cen Zhang <cenzhang@linux.microsoft.com>
Subject: [PATCH net v4 0/2] amt: send the relay's General Query directly from the receive path
Date: Mon, 28 Sep 2026 23:23:10 +0300
Message-ID: <20260928202312.74574-1-omar@blockcast.net>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The relay queues its General Query on the amt device with a raw tunnel
pointer in skb->cb, and a query that waits in a qdisc can outlive its
tunnel: a use-after-free in amt_dev_xmit(), reported by Microsoft with
a KASAN reproducer. Patch 1 sends the query directly from
amt_request_handler(), inside the RCU section that found or created
the tunnel, so it never waits in a qdisc and nothing is stored in
skb->cb.

Patch 2 adds the selftest Taehee asked for. It counts the queries that
leave the relay through its amt device and expects none. It fails
without patch 1 and passes with it.

v4: patch 1 is unchanged from v3; patch 2 is new.
v3: https://lore.kernel.org/netdev/20260928181601.85857-1-omar@blockcast.net/
v2: https://lore.kernel.org/netdev/20260922214150.13970-1-cenzhang@linux.microsoft.com/

Omar Ramadan (2):
  amt: send the relay's General Query directly from the receive path
  selftests: net: amt: check that the relay's queries bypass the amt
    device

 drivers/net/amt.c                  | 48 ++++++++++--------------------
 include/net/amt.h                  |  4 ---
 tools/testing/selftests/net/amt.sh | 29 ++++++++++++++++++
 3 files changed, 44 insertions(+), 37 deletions(-)


base-commit: a7bfaba4823e3c165bb2004c74eff7c096672bc7
-- 
2.47.3

