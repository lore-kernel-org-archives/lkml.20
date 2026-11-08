Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794131165;
	b=plC89RBlXUeQ2AN8y3MNyWl4ktr0v5KIXWr+6oHcUqDZQA9SozmDKit/TonOIcYk1il6
	 ke0geiZ4ElJk3Pv8+iIsyHyJ0aJdvFK9ym07RMFJeZdNFp4bBoSE+e8nYDLuPKWi+Rp/m
	 9a2N2YeL4ZqFw6YsYw+n58awtry2XDmxWfvJppDnH/kLd9XWEshiN6DcwcbEPsBFPxoSP
	 vaYdbcxsnjCC7ca06eLIcwHteaW+uDUnpr+ue4MI7uBsY94ENaisTk+oq5DVO20iaba5q
	 pCSvN1dI5WuPdkZvDsf9P4SKXNzOQzgTf+3ta6bYPqvzR+vf4J3u6lk/pGVNO5WC7tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794131165;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=D1K0wrjeRxXZkT8OyeftvPsGaY/KHPkSXaBR6fxBie0=;
	b=L9Tr5A+FWx4N6J10JNZ0j6/mWQ54VB+Ekvhu+bt/wHsx8gweuVRpaL7ZxnVDOhIeXOvS
	 g/U34UHNjNiAdfabAFYhWteWhdF5N46WWAnCY7MUE9NVhmdvsxrvW4HvcjoRsTj/NsUNG
	 2S91dYyxrq24PfmoChu7SiJxyP+CV49veQigqad5WMWjCPjYC7AEcONtq1tu3dzp0f4Ty
	 IN/hdcR1WO5HjYGYMAHX4YfjAjEJBV8N+S7ExJ1tBKAgyqUqednBd9b1xZ8pcQE9taIfH
	 XCumblKU8vogDLszzmoK7Po3mVWuZmsYQWfXJOfQi/y0bxGoa36YQKykxCECwtLKRjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P6kizvfy;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39F3606A323
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 09:46:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C39F3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P6kizvfy
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e9eb579c0eso434545ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 01:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794131164; x=1794735964; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D1K0wrjeRxXZkT8OyeftvPsGaY/KHPkSXaBR6fxBie0=;
        b=P6kizvfydJEBBrd67EW+ZuJceoQtok8mvajjLX1bbZYcyblT69RDSyyGmIvodHkDRD
         gIipWpBC9yKMmbpRGSmXdk6qO5/5NngYLoXoy5LU7K8cXS7HAo2Uj+7LyjtB+T/NSiAc
         8VmP3ibaXdqvZXsfuyvq3nroSmJuRGRf9OPVJOK61xdisduR4jW5S/qs3FTZmZaY50Li
         n9nDFR8+inTfiLt2LyA4EdbWlTA3EKgwWl35KfLIg1c8zOarAtJ3zfOfBlMsDOCyx7q0
         ZT+YPn5MqBGn8lzhHQlxM/PruosuuhCiaznd8f14+kPS1/UDaDuCdFL3uD5QWswYeo5S
         JmcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794131164; x=1794735964;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D1K0wrjeRxXZkT8OyeftvPsGaY/KHPkSXaBR6fxBie0=;
        b=Dh/UYCPF6bIrm9GBXKISW2iG4ifxG1umqN8bPIeJS37/j8y8YfpbDXzDmHXb5v3ZlY
         +xggmSGooNb8y/AMBFnKHLDeg1RckE8hnK1WEfe9m96s3SPNhNKHu/M8LF7gIEwfX11W
         97nZ92wwDbjMHFNrYTselP7eBPL7S2fiFO+jj1GdffsM01caXO/5cRryvZTp9ZCEUp4+
         oxlTXy4/Ys5ukl8NgJJD+pW4iyPHBy5uo5a4nMoqdInw3G5Tb1G16d0cGJ0ZQE2n7Evm
         4m3jhQ/hHE9IHw804qwSaAz7KTWd8xZEV6ExqD5fc9MIegcfV+o+oKA/J76xSDLggUb6
         Mwrw==
X-Forwarded-Encrypted: i=1; AL+hErFsKGEYWzs4nH5GGJ30OGPC0VmSXzWL5nqmFbEna78D/tQupkP0xbGn0pfaQs+arQsOraeL0uXhYTs0/IY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+X6JX6mNTeZc4rPcUOiDEP3Tqgv+HQMtytVZWBTSgiQ7TPiPc
	mB91Zti6pwLmB7Pme3NrMU3/+cKnc5nB2rlo7Ias/nYbRu60RJlI2kFO
X-Gm-Gg: AYBFou18ZKJ1+9tvmqg4JboaUAvxei6/RDTZ8z1hlZM368OndDiS82hR9dg5w9Z4CgJ
	wSS7SQbPtf3PFxZhhzkNkrpLTwRQ4XugknG/LvRs9Ce841cVwVrzgYph+ois61rtirK57KS8a14
	yOR71e5/n7af74t7BnhN9itfACtVmgn9wQfy1W1qUKIaCHbLVjJzoYhDwEaZht8Wi5exXaQjh4O
	KvBo1mDs8dIlTD8PtNQqFNGIYIT/gqZseHo2nFXgE0HHtJgV+3x1w6KDEEHb3X0iUGMPEBGkskK
	GufJ1R2SIBKDbomCC+pRxIm8SWPJqxTdFoq2V/B3a7/JREUZ9rjcaAZRPF14cATljRQSz79j5o8
	iwsoUoFqCd4FBTArE2ihibPfZ35X3yNZCRGvmWmcjCtwJZ/V8efxUjMXhE57UQ9VXzwGcYMX/QE
	vchWmAwrEXvEqOHm9a6waI6A9+GuP9XBkcurqwcF0byuSTfNovv6n69FJduJ9uRpjwd7UHZTQcv
	pioIm+BKodcfTKBj/i18fGITUbTLyXbVvdHLDcLEbD9yuZ2DS3FSPT+GsoTdRQTWaDuZWqpchTq
	4HeeCZsa+3lhZpZwJT2MTcO+Wv46VU9HaBaF6oiwPq8XEkhAr1OfFg==
X-Received: by 2002:a17:903:2281:b0:2dd:ad73:c987 with SMTP id d9443c01a7336-2ed837a83abmr9322425ad.31.1794131163926;
        Sun, 08 Nov 2026 01:46:03 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:28::1d2:30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed813af834sm3222715ad.0.2026.11.08.01.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 01:46:03 -0800 (PST)
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
Subject: [PATCH net-next v2 0/2] net: dsa: motorcomm: Add devlink info and resources
Date: Sun,  8 Nov 2026 17:45:08 +0800
Message-ID: <20261108094512.1285796-1-mmyangfl@gmail.com>
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

Add basic devlink support: expose the ASIC id through .devlink_info_get,
and register devlink resources for the hardware blocks, reporting ACL,
FDB (with unicast/mcast/static occupancy) and meter usage.

v2:
 - fix issues reported by sashiko
v1: https://lore.kernel.org/r/20261106184811.350700-1-mmyangfl@gmail.com

David Yang (2):
  net: dsa: motorcomm: Report error when FDB fails to add
  net: dsa: motorcomm: Add devlink info and resources

 drivers/net/dsa/motorcomm/Makefile  |   1 +
 drivers/net/dsa/motorcomm/chip.c    |  63 +++++++-
 drivers/net/dsa/motorcomm/chip.h    |   4 +
 drivers/net/dsa/motorcomm/devlink.c | 216 ++++++++++++++++++++++++++++
 drivers/net/dsa/motorcomm/devlink.h |  18 +++
 5 files changed, 295 insertions(+), 7 deletions(-)
 create mode 100644 drivers/net/dsa/motorcomm/devlink.c
 create mode 100644 drivers/net/dsa/motorcomm/devlink.h

-- 
2.53.0

