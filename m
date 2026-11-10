Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794354328;
	b=Naiho4OfueR6lI3wQwpROo9D8V8gQOBVKg9lH435DUpfP+KxyrXESrGM3zeauiSLFJ9M
	 GZJKWOS3XQ+i82uf3hQM3kO5ZN1FYfW0L4KMYsjR5WJSPnbIwbVvfjKhQEo7x76GpskdX
	 lyaWHMC5w7fXrvUojXU1/vxD/FJjRj3LqmocOTN64IVVKpC/USJyGPslYy4dFFLoi7qkW
	 RvXKIA5NcEBZO8C133WznzYDx30A49w9V3V2rHhA6VLwL6kglkNPUC4TSjYA4lepdmxb/
	 gb+SgKn3+9QNfszFhqIdTWmthODb7OtGCe1jVimJZjuXJZDWHsETxcLQxufbx7tI4cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794354328;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gP1I/aOHIVkz2RYwsuJe4lOo/+53CVtE6Vrdu7o0FP0=;
	b=e9houe7VbVA87aB7AP2zK6ZjGEjMjBo9PqnuUA5dVCiUpom2OwhH4rMWHhpKoYewCkRP
	 p+q/ha+m6yBJcNC77xAOV4YGit7VRZgGsPIxj+y8mfZtByH5fpAKdqTEbJB1KKuiAaNP+
	 2udFgFbRkLo2ytM/pNu8lRRu1ikYgiMcptUTQxds4Dfexypu1Hl8ob1J99NF+/FGTLf3/
	 OanmLjX11zAsjhW3rSOD5zKWXeJQU6b2vTcGeaYaRjSbAh8RZnPAcw7LuwBCXAI3jelOo
	 NLFRxN0bq573MMboIzesW4zCv0czeXu0QP/cW6eH75TEINCNmCRXvJLsJ95gcv8XDvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IEMkjv+f;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C34606A320
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:45:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2C34606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IEMkjv+f
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso3863921c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794354327; x=1794959127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gP1I/aOHIVkz2RYwsuJe4lOo/+53CVtE6Vrdu7o0FP0=;
        b=IEMkjv+fJbbU0GSmzqVFP1dzDPtfTCeitmnM1jrhu8UhLH698xn8qHmqGSuLfYLKa3
         B/MoqZb05I0eh5gJrL+Rv37iOIaqrQgr75F52Rptj00aAXcOKSqTZR03n0JdeINSu830
         yct8sSlD+6Go1sxuoxY8B7xRpa07KBi7LQ3qKmcyh3TiUMJKQoEpCWlKpugWbBdJJ4DH
         n+1xiQCiEajwhuYY2p/rEKsR97lo1Jr7xbOvxohweW1Clk69ZJWEJGFpm+OSU66wc3Nz
         SeYGDqt/VHIuPXgSgN0o43upupnMcnR8/7phZNZjh8uyNJkyRzvTR3SZIk+9zRgGDB0Q
         QSSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794354327; x=1794959127;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gP1I/aOHIVkz2RYwsuJe4lOo/+53CVtE6Vrdu7o0FP0=;
        b=s5gPzhgCPfFyz/PQBhWB3OW7j6gBQLWC6GawRCiwwvySAlQOj7b/3+jk0V18KY6Qbd
         qaUD2G3dIxqsf63PrbgP/NXY58ZiPlbtNggo+R24gM7Rhl0g1pB9i5F9uODLWZb3psxn
         xNCD6+6CsstKEugi2Ig/6CCt679vxqu4sxFsClZO0nVb2vkLdz7aapTtYxxn7MjEJw1j
         ssj8HtE46swcU2T1WDGkerZmyyKEhSgJa8FRg7DXvP5egDeyBewrbDyut0xXyVGtl0TC
         7g6/oRbyNJ7ueWUWBdFmOmLIQEbdlbib9acghzXbeGtLhJ7knj2A+WZ8T9/vK3dOKZnC
         BluQ==
X-Forwarded-Encrypted: i=1; AL+hErH2fuYDA4rrsrN1xBTu5DSIgPopOdZ2g/zINCJ8CTg1SXUROaLagWKMqzfqtX1F64fPCCX90+bHPjVofm0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FhRmQjYmB1OSGvEldbBvqtfRDrYszpiNJa1TnHa247e1ci87n
	dLvKfYyAEdHoWOwhW12di7VTxEndC6BOe7r/Z+0tEKTT5DptRmelIdvGiblGBw==
X-Gm-Gg: AYBFou3+YwuHhHVtsncNdU2Hl4fVLdk5RmOPGiGWTxE46JwR+6rfvVifAXX2hmmwGdt
	6yNUHrkgPcbdwdCwMl9EwKvs/e2XObbvWK4OQUeSPsZDMSvGfOg8aIM4BjEOuurvP3BXzeMzdIt
	beOcRPLesuyzpP+0/vCUKFO0jFR49u1Y45wtUEjhP5Ge4hD7T1Ko3aAFv6eKYW4rPh34HKUt0oK
	TVmCLIa7nn5n7+d2ckDIhWuHOIuuEMW9anqsETQOeGyyHEGaZRc51UV26JPxq6/9SgZkpCtdhtN
	oZGex9lj3EnPRWdcF0qMiSsS/pL5PvGWhkobPbJmkxCgtQQ0u63FZUrvcREKnZQeG96AnGu2nwQ
	/Lyf/Gbmu/Uzs/Y0Wi+Z8oP/011CKL/RtoM73BreNjqIIedQGU0V9y7xyrTTSFca+GZ+zt/hlKd
	fDthKSNBFVfGtgQ1x9avDpjq2Jb04JVyyRAIg0Q+qGltzyNjdggMY7TJ0pE49B3Pm4sEFPLR7xA
	CWNxL77yHJeoF6+O7zN9leFpVBKj2v8bPK3zgkRdN4HrnWopxWrBDdY0DTZHcNz5a0/w7DTVc/m
	xX5FyyoK
X-Received: by 2002:a05:701a:815a:10b0:19a:9a93:c9b2 with SMTP id a92af1059eb24-1b3c02f575fmr660475c88.13.1794354326618;
        Tue, 10 Nov 2026 15:45:26 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b20c55sm9145881c88.8.2026.11.10.15.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 15:45:25 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Daniel Machon <daniel.machon@microchip.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v2 0/4] net: sb1250-mac: ethtool link updates
Date: Tue, 10 Nov 2026 15:02:56 -0800
Message-ID: <20261110230300.2769327-1-f.fainelli@gmail.com>
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

This patch series addresses a few minor issues:

- Running ethtool against an sb1250-mac backed interface would not
  return any link information, although all of it is there
- There was no support for restarting auto-negotiation, also there for
  "free" with PHYLIB
- The kernel driver reports enabling RX Checksum offload but does not
  report it through the NETIF_F_* feature bits

Changes in v2:

- collected tags for patches 1 through 3
- added additional change to address RX checksum status and header
  offset setup based upon Sashiko's review and checked against the
  datasheet to be correct

Florian Fainelli (4):
  net: sb1250-mac: Add ethtool link settings support
  net: sb1250-mac: Advertise and honor RX checksum offload
  net: sb1250-mac: Add ethtool autonegotiation restart support
  net: sb1250-mac: Fix RX checksum status and header offset setup

 drivers/net/ethernet/broadcom/sb1250-mac.c | 27 ++++++++++++++++++----
 1 file changed, 22 insertions(+), 5 deletions(-)

-- 
2.53.0

