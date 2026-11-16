Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864901;
	b=heMYobiVvIrnLFT1aJws60O+AhhT785XW8ys7AOoJdP1jVAnUo3XzRcyL8EP4pAItx92
	 Zuc80VSnfkHvLsXhrc2zBi0NiPEtrI46ahmLQBPACgjvs+1MlInEig55E/RiP+AVjQwmO
	 cjTRNzTZ7MXeWTyr6aztkoJbvUlIFYbHOo0LpZwCsJpL/cnzy3wtmmUfTkxegAHcHnB8C
	 Y6O1JYOQxRP837AWOri3srMXCQKS1ORraCR5oVmRLMUAdgTXB4C4xq04GFsafR5q0DVXy
	 4tQiZGt+ZsNdI8mXUN2hYvY0B7xLqcDGRXg7WzUnxQbXkmSJvZE8MeARn4sC5IDSscg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864901;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=Sd1rFukqOAe6TPv7bNF1pQ9Arkz+EF+wh5ErxvPTBXo=;
	b=wxKkuqmWtYzY9s6J9cp0jhZc227YozLONgw5HcEPyO848wVZK92euuCEqrb9J96HDsbF
	 OnNnBohUtHFCAfZYtj9+qMt/vOpev88VAn+mKPQiL1mTVlupL7lzQr7LLI/c/g28dSCIF
	 Xun+ac9v3Dbby5cOQU5T6j/MGmcMMv0KXjqO7ziYrLct8hbPsXuJ5dlVpTKSBKVRN7ZKP
	 MPWBIBVT82YUn7yuNKVLm4AD3VDCKEGOckjeC/oOamr1UH4bdacnsHsUj8GLB7dh62BIE
	 EgzfpBNXqy7lZ5IGixBSbo1xBXrh/Rkgs0GABWXSROuXAkxtajamSeL3ih7+HmWvNXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=heV8i5ar;
	arc=none smtp.remote-ip=209.85.210.226
Received: from mail-pf1-f226.google.com (mail-pf1-f226.google.com [209.85.210.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB681606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:35:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB681606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=heV8i5ar
Received: by mail-pf1-f226.google.com with SMTP id d2e1a72fcca58-8a06cc097c7so3436002b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:35:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864900; x=1795469700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Sd1rFukqOAe6TPv7bNF1pQ9Arkz+EF+wh5ErxvPTBXo=;
        b=moi4PEjJ7QV6FtC0wL28JyRUEvmpoa3GMqUIYv47AA8ix9z+3mNrXHKaaagNGmG+Hi
         XnnHHe5Q40aeNFwTwH+VsMt449t5QrA6dd1TidYu3hs6+i3nlz4D7b74A+xM6WfdGuKX
         TVfi+Wt1jYDr+tAzEbb450fILMLxpIzsUWNU97BDTqnYa/XxmGPEvdyDNAbDv8YZia7C
         V7f/B+2pIbW3I8Trq6CcDzaT5pZiplbq7EmbYamTxbU5DM6vdwlsAEFX4f2QV4w346k3
         tMNfYvoyVhhw7heGDFvXJkPcFwJ8IjxdCr27ifnGvYZcofQLHauMXxCwwCE1zo3Q3Xwq
         ueZw==
X-Forwarded-Encrypted: i=1; AL+hErGJ1YfPZrh7i3TF/ytCc7HMJlG7Dz7xFFkZ/gDAFPErk7GCQVw6VjPGFmRxQVIqwWcLCiWPqAUd9+kmh94=@vger.kernel.org
X-Gm-Message-State: APuU4Z+F5fWd/KufF49EUKILVBYXsKhSXy8pK3cZ5VjO2s5Oam9Es7wz
	aL1XjMruLBHtYpi6NvvWUpnR3eadCsXYJhUfUhryaYJhLddO9N5Ltqbzf+AOewKlRvbhdff4Idt
	zRc4b5LBE5jIBUZatCIc2SSIpxAGZbfHNN8RhHaoJBhu1+J25/WAOMp6awf/fZ1AFHm71XJZgQs
	mWSWfpc32xuiEP62dklsMOdiFaf/cftF6mopcdKfVJWlVY/HHlS8HGSrr4Y6JrQWUof/stkJ9E1
	mYb3sebJVmv3fRQIkV7rKAk
X-Gm-Gg: AYBFou2xRg+4LTJ8v3ZMjV6a5Ji8H+cKQON+tCvMjAg2W0qzTJZkOl9oTskLBJlu/KY
	2cEh5zNFFkfwK+bMSRMb4NWOakaCcjve7CC+WJPD7aBGJEHH4ygH5WJ47LTR+erqX0xhwXMaoRL
	9dS42mkZc31q9VZpqcoJ814XEFxT9Y/juK2AEaNUaHJwW4pR9WbFjve14zMbYFFDpvPy2j7D50i
	QBel2gBWe+Fg93dNyZYSDQUWqsS7NjheMhUg2v/RgCe42eWX1NR8hZzoemmkAn9iVE4Y02RCepd
	YX+eVSlddmwX6UmETLfzYQRhxG92aNMYjTErjP3g2U7cD705sKwv7+dM2WMWI5MP3cgw2FU3vQI
	2XD8ui1/ouJjaA3L9n74seTneZPUAMTYMxATUV2kdbUdN50MoKVnFiY4s9+nql39jezZSbuLuFA
	IIEj8LqrUKsqJCuik9MDuB8m49pj96R8z7xuZFMgMJ
X-Received: by 2002:a05:6a00:17a8:b0:8b5:a10a:a3ef with SMTP id d2e1a72fcca58-8beb88d300fmr10532230b3a.51.1794864899834;
        Mon, 16 Nov 2026 13:34:59 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-8bed224825bsm177441b3a.15.2026.11.16.13.34.59
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 13:34:59 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-55c5cbc838aso71109541cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794864898; x=1795469698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sd1rFukqOAe6TPv7bNF1pQ9Arkz+EF+wh5ErxvPTBXo=;
        b=heV8i5arYbt1Rp9l+apnCzyyxgTnN4dzI4tQR7q8Egvw7FFeSYmUgKXCLuaCrAF2IF
         Zu/eDCEF7nEK9ZSpsr1JxzQ6oIaAONgBWt4p+sCA19RiTnlZI8C8oTE6qQjK8ZaPP/I4
         4Yc/IT/PvU6qUW3lSNcu4YFbX9pTQKQ0sdk6g=
X-Forwarded-Encrypted: i=1; AL+hErGdNc73A3hiQpfq3OfL4YLdwSuZf4otubQmhjZEK3Uw2CJZWDYcVUdPGXBirpvNZ19odGUtn2iRLLoYwhY=@vger.kernel.org
X-Received: by 2002:a05:622a:5b90:b0:536:5663:5558 with SMTP id d75a77b69052e-55ac47982bamr181486071cf.7.1794864897766;
        Mon, 16 Nov 2026 13:34:57 -0800 (PST)
X-Received: by 2002:a05:622a:5b90:b0:536:5663:5558 with SMTP id d75a77b69052e-55ac47982bamr181485641cf.7.1794864897168;
        Mon, 16 Nov 2026 13:34:57 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d34a139f6sm40744171cf.22.2026.11.16.13.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:34:56 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Doug Berger <opendmb@gmail.com>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org (open list),
	Mlody12 mlody12 <kudzo51@gmail.com>
Subject: [PATCH net-next v2 0/4] net: mdio: Clause 45 support for mdio-bcm-unimac
Date: Mon, 16 Nov 2026 13:34:45 -0800
Message-Id: <20261116213449.1682731-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

This patch series adds support for Clause 45 MDIO operations within the
mdio-bcm-unimac driver. The series breaks things up in this way:

- make the C45 bus scan done by the MDIO core carry on when nothing
  answers at an address, as the C22 scan already does
- scope the existing defines to make it clear what is C22 vs. C45
  specific
- rework the polling completion loop to be a tighter loop
- add support for clause 45 operations

Changes in v2:

- add patch 1, since providing read_c45/write_c45 makes the MDIO core scan
  for C45 PHYs on all addresses that are not masked. On a bus registered
  without a device tree node (e.g.: GENET with ACPI) a read from an empty
  address fails with -EIO, which get_phy_c45_ids() passed up instead of
  mapping it to -ENODEV, and made the whole bus registration fail. Reported
  by Nicolai Buchwitz.
- patches 2 and 3: collect Reviewed-by tags from Andrew Lunn and Nicolai
  Buchwitz, no code changes
- patch 4: no code changes

Florian Fainelli (4):
  net: phy: Map C45 probe read errors to -ENODEV during bus scan
  net: mdio: mdio-bcm-unimac: Define MDIO_OP_SHIFT
  net: mdio: mdio-bcm-unimac: Poll for completion at 1us granularity
  net: mdio: mdio-bcm-unimac: Add Clause 45 support

 drivers/net/mdio/mdio-bcm-unimac.c | 130 +++++++++++++++++++++++++----
 drivers/net/phy/phy_device.c       |  24 ++++--
 2 files changed, 134 insertions(+), 20 deletions(-)

-- 
2.34.1

