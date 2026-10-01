Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9149E3803F4
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 20:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790887742; cv=none; b=G7FDpD5W89khNXlQTLLMGE1kRCsOmUeAREIad0ntLQuNH8QyTOqPhOr/4OlbBjGkBNRq9wVPvX+d4Lmy+YYBjX/NJvn8BQSmzPKiISHBXMqOhT3JmPuhufyezpN3zgZYIX0JagSNVqkX67IeuxJ1K7BLVolhUxiC2+YZfdTlK/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790887742; c=relaxed/simple;
	bh=gK7i1R2R8y0ow3LubgXS6PxW5W+N8VcRjGkt+FYuZiE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cAllJmQShatR/A29ezTab6tYtCdeCNsuw0jW2+xUmWAoo7IqHbcaDESWqhRio/6vrkRWkLAyMcO0/CGbGL+GUj00wvUnplI+YQMkY3TAtBHYIf+nl/y2jNpsvChG8JP14G7xUCiSX9sQSNEqxbpBqHD0gmpXQZG97PUWAIUA0x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k/7AtjGO; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k/7AtjGO"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccda24afso3624843a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 13:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790887741; x=1791492541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GaNhy8Dh25vssvZWVoAJu0vGDz+eGpNkgK57kC+Sq5Y=;
        b=k/7AtjGOIkNljKPEF7HjAf1Z/w50E3Y6Zgwir5V5Rr46DeQEZx2UI70he94pwNd3GB
         6gW9SehNb05UHFKZFZtLQ6U7omPYs1jNwZjKmwk+FzEPdyvRP8JUTFCo8+wrPbOm5Igg
         l3u4m7TMqKaFZuCN10H1J1S9biqAODXPJM8EpGpb9EXiLVR4FS0NX5R5iZZOf7P9tKoT
         LDr1GUlAqZT7lhkPGllSqUEYuQBNLn96pxTY14EK2eCamMWJUZvr7hMY0Aejo+BEMnO1
         eWKRnrkSDVxwjdXVfjSFySaB55/kbo1kRdCa6CYr5x4x6IaZLyN/U6NoRXKaZXDu1i/R
         loxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790887741; x=1791492541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GaNhy8Dh25vssvZWVoAJu0vGDz+eGpNkgK57kC+Sq5Y=;
        b=YGN7DxvV2xPEWzOyn/LBOCYmNyBjhd2fZmwWkIKNchsaG2yMeTerM1wFceIUdRvn30
         fDPCWXZ5fdQir+e/4aZfZ6z9Bsvho26OtEeP4yieS6sw/heqFma8C+V/W/aJhRspl95b
         8DKemOyrbygr+krMtHCRjNoUYBrZeZ8Tz314hadrmZjAyMrxuOO5qhyfLgIc3MCFPpW0
         zGLtHERK3zQFCHqlH/wiIShHm/NfNGWHiEMOvQfRX1K83YsGfc10kdD5xp4N1qHqB/ZM
         amivTOtO2+UfTlsyppS35/SfprP/xZsD/AT+1kef6yQEj8W8hZTi6eTD0ZGE8LJzUO53
         Qq9A==
X-Forwarded-Encrypted: i=1; AKwUvBy/1utSvl7fibAPL7lN5feFpyplkTiZ5GvwHI4o27wuPwl0K2Lw9S8EHJd9hpo/J91caP56JxMaSNT3IrA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ93UsNsGNstFArv1fZL0qfhc7vytdf8f5su1bNHLP38oq1IcO3
	mCKzKnttXFg5yBtIEzqH6V5MHZOrLVq5/numIygfsIenixaP/pkSGmLt
X-Gm-Gg: AYBFou2j3Qk7GSsGumqEqmeFjbE7c7GXGSAEQWk2veu3DeJ3B6teSAW3jk18xGoLUH3
	h8CFZ2q6GH75iL1r97RErW0fzASJCZ524Y/4FlYz7L8kcIHxU2RMZP6dKPDjLHdzLl1WqApjO8z
	h1Gl0i5iUmxah/LoC/cEMpv4am7PDiRYDiK19cGNYP1lhzFXsqqLfYojOUM38JCZ3ksMRBcqwrx
	82AdzoC0HXqzbnOChgvfe6h6/cQdOHLowEKqgxtXHx5EyzK++ONT5rsTdzF3icm3dQE1sugX6pB
	Y1dGyK3cPgBQF7GLJC7cztRop82eCmsUymjyr1CrFYrs+6xFbsb3Pq9WJHCu2Kj/8FJ0OJtBYj6
	ZfRfBMqxV89Hr9TdYwd/hOjQRsEoZne8y2uDUhcuZ67bQQIAHxt9spdVbGL82zsvcfmzJS+kX7T
	CJkyNcs2p7Dp5TWtu5W1gjIyXIUlFBrNjvsPUZp+11idl13KziWYZzTbSkGLxkato3mcjbTPESm
	tBzookSL9SxmXtualxTItztyw==
X-Received: by 2002:a17:90b:1b0a:b0:3a4:b911:e9f6 with SMTP id 98e67ed59e1d1-3a6ce95e913mr261740a91.56.1790887740754;
        Thu, 01 Oct 2026 13:49:00 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:661e:3050::4d0:26])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f478e9c6sm5658797a91.14.2026.10.01.13.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 13:49:00 -0700 (PDT)
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
Subject: [PATCH net-next v2 0/5] net: dsa: motorcomm: TC offload follow-ups
Date: Fri,  2 Oct 2026 04:48:43 +0800
Message-ID: <20261001204851.2576101-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series continues the traffic control work on the Motorcomm YT9215S
DSA driver: it reorganizes the offload code and then adds ACL enablement
on demand and flower priority mapping.

v2:
  - move type casting helper into chip.h
  - remove flow statistics and broadcast/multicast policers
v1: https://lore.kernel.org/r/20260926211813.935723-1-mmyangfl@gmail.com

David Yang (5):
  net: dsa: motorcomm: Hoist type casting helper into chip.h
  net: dsa: motorcomm: Split TC module
  net: dsa: motorcomm: Use NSEC_PER_SEC
  net: dsa: motorcomm: Enable ACL on demand
  net: dsa: motorcomm: Add TC prio support

 drivers/net/dsa/motorcomm/Makefile   |    1 +
 drivers/net/dsa/motorcomm/chip.c     | 1568 +-------------------------
 drivers/net/dsa/motorcomm/chip.h     |  355 +-----
 drivers/net/dsa/motorcomm/leds.c     |    7 +-
 drivers/net/dsa/motorcomm/mdio_bus.c |   10 +-
 drivers/net/dsa/motorcomm/pcs-921x.c |    8 +-
 drivers/net/dsa/motorcomm/tc.c       | 1524 +++++++++++++++++++++++++
 drivers/net/dsa/motorcomm/tc.h       |  379 +++++++
 8 files changed, 1982 insertions(+), 1870 deletions(-)
 create mode 100644 drivers/net/dsa/motorcomm/tc.c
 create mode 100644 drivers/net/dsa/motorcomm/tc.h

-- 
2.53.0

