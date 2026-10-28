Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793197093;
	b=YWJQc4xREDWAjAPjGyQBJM95vqJThV6iwPYys3zRtB+ntvisGsJJD+x94moFMjPni3aY
	 XbzYpTiW9PAiXEHXgeot4QhyFqUsiqW6uTS8IfHC46QB9nfLMmQguX/J+8pKwLi/o2BiR
	 RwSr2MKiKfzC8F1TYD8gBGE6Ix3aVy+8W1/yS14rVivN7gyBQOkIRVkErzjLWLABEgPQb
	 21eha3mBdI72Yr22TDAk7k7SWGamUOuE//QKiwyzbirK8j5xxQlJHKsfRHb95fLXE4aDj
	 GTl7eS5oXeYp+3zJjpntsdPfFvQ6ZGGiFxyWBMyWhReK0SE9yEVDrS/ra1RaN3VHkwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793197093;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ONCYbawM4xmouwx70v8kk5rZch7dwor2A7i2JVNx4cE=;
	b=uI2SN/aug/hKAaQrM0TVS6HSvdlO3hnkfnjzBSByuvg7LACcSGrUI04D4MhCK89Zl6uj
	 zml3czjgBcQRLdwouwBLNOqx9qqZqW2L9dSyUO1vPURecrFtzFbxaCvOyc6+6VXyUFVwu
	 gNKyjFa7w3tWx9Qs36w1XNo8sVcsWPqNvWrVKMPsKWFIA30V4/TDpSI3BpDUfRUIp4L5s
	 qrR8ur7fTTsBoZaU6YH9BnCukO0o0i0NzJsNZd6RprRETAUvelBWRfqWb4WuwcGgQqk8n
	 O0p2nD53vH5bGr4H4mLqC0LpzKYhsrULHaxXcpk0r6vxop8v9+Z8v++2Ed9u4JNPbwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z30BiNlA;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E608A606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:18:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E608A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z30BiNlA
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8a06454116eso564798b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793197092; x=1793801892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ONCYbawM4xmouwx70v8kk5rZch7dwor2A7i2JVNx4cE=;
        b=Z30BiNlAmfN3QCpYBCecmQ9PQ2Wdr9QubgxX1f95degqTcCzd88fZ5UPKlDhv2zdO+
         hSRGWdePi4U+IElKgRifUb9NbjaKcOtNuIe0KeJii/BrT+fCPI0Fr6BF3SRQZEJbM6+Z
         8W+JWsFc4zNU1g+Nfuz/9/LiuBHMeiX9VLwYnhdH9fAAEDXgu0arH2jE77+JDs2YMm4K
         NE8UGF6Js7UY3B1/Zkk0lVcC2xKbtbTMpdkj38AecnfgYgSF4rBSLtuH3FAxrDwTMhay
         4HNTfhUZBAYyLKN3AHV0o9GRVHpOBO0d9odCQ9SiqQZkjJT7/sc9sxajHu4gfkGSdVxe
         tzlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793197092; x=1793801892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ONCYbawM4xmouwx70v8kk5rZch7dwor2A7i2JVNx4cE=;
        b=t8HeAxHVfhrv8fSdoll9LDFJIbXAiaMyRLcIGegAbzgbmyoJElaLtBEuvmYr5L0WC1
         MIwf53JWjnTdZ9wu7qek9/019wTFN672E8xLgYDfMTIzPCu0uV3WwIu+fEd/LBT/xH3b
         DP8zonGSOCI/0bGK2JnTQCo5QIT91znisWQUTdbtwcr9syY2swELphv7jwKYewufLjYV
         wf8ZN+NFQMTbyDClnJpmLigsIpA2LwJ2acf6zYU80S/xZxl8qXzqV6rmy30dQdjoI2aK
         9ZyGllso6O1qyc7Ah94W0YA+iNaNzDBq4/LDaD/ipPkGkupCC9E99HBTZI9N0gam2FZP
         qRAQ==
X-Forwarded-Encrypted: i=1; AKwUvBxxyqlwXRPLXnTJEKhPNmViVNTiWeQs2HU665VdVPOnMpngzaOVISE2D/UFj5qfoBxG/jOxNQmTUzMFT54=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4npjWWmEduiYAAW/XLldnn26aCuQ+jRHbkSmGdSjB4mjBp5rX
	qY3tNQNM+g92LbSwlwx+qWwt1yr6j08SBP/idvPMtXNPS35NV/tfeZoMJbB00B5H
X-Gm-Gg: AYBFou2syGwDAIrGibQ9VxCQc941Hyh6K37Y7Nw1Y1gLE04sUIK/y6xDBxfxA4fJYxI
	a+IJWZ7PlopR8gwctP89in1NDlz/5zbUbJomhAANyMBJeKOSQI73rXjBwX/lCQI+FzT+i0SPNLo
	XiMDnbRo2o6LfpalRVXIUUj0iZ2Yl0gL2OnUNqm1xiRPJ/3+jAqm8LrDGP7wkgyAQ2as8u4RP6G
	ZZd4Fv/cPar2mG8adNVRQ4EgTciMA1WvRQqElKtlfQzx/KqckJgAfwhRDRb6VSbtfV7h6iiTFIV
	qxbre3nZauuYnXBy97d62rFl2an7MiBWtMWoULN0NFnfAcFFqHdBfY8DkOxW+IDRku1o8Wgj3e/
	9MMt1vMT/zgDO+u1w2stRTA8uQw/Tb8GdgJqccpspJxJ9fa0x+Vscmp1hbzZCZpOZk/VZXIX77q
	A+cVpNbL7275ij1bppxL01mv4VjokhYEjaiGJTiALquLrZW8zhCECPzlWMBwhPlElxMaj9FJLBd
	CBVRRVizht8pGO9f9IlXmoVQko7z64/beUuxqsx4x7bc/elukG3VLeDeMbM5nT/2Q+n6H7v5gDf
	RZcZd5MY8j/wAhhHSzGSScPERm3gDFeuU720dzdmK7XqnUU+b0GyrtAXKCWKzDSiiKUZpPqOp2/
	ZsQ+D1t3fqrKRJOQ=
X-Received: by 2002:a05:6a21:2983:b0:3e8:b7fd:6265 with SMTP id adf61e73a8af0-3e90229776fmr2122487637.23.1793197091768;
        Wed, 28 Oct 2026 07:18:11 -0700 (PDT)
Received: from KRHW1CJW23.bytedance.net ([139.177.225.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a3d5e302sm1284996b3a.7.2026.10.28.07.18.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 07:18:11 -0700 (PDT)
From: Zhao Li <enderaoelyther@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: "John W. Linville" <linville@tuxdriver.com>,
	Javier Lopez <jlopex@gmail.com>,
	Jukka Rissanen <jukka.rissanen@linux.intel.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] wifi: mac80211_hwsim: fix netlink release and radio removal races
Date: Wed, 28 Oct 2026 22:17:49 +0800
Message-ID: <20261028141751.6728-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The first patch ignores release notifications from netlink protocols
other than NETLINK_GENERIC. The second serializes radio-consuming
command handlers with asynchronous radio removal.
LLM assistance was used to review this series.

Zhao Li (2):
  wifi: mac80211_hwsim: ignore non-generic netlink releases
  wifi: mac80211_hwsim: serialize radio removal with frame commands

 .../wireless/virtual/mac80211_hwsim_main.c    | 27 ++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)


base-commit: 25e73f1d6868c759c8eb56cad4e411692c5341b4
-- 
2.56.0

