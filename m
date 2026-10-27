Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793132560;
	b=iYKG+CWB/6uVS5T0bSFpz4r3k9tvsUEVT9MmB39CArk6gRfvFA/DHFAenjYUIhzMXC31
	 1/j4XzgVtYrjsrZqTrKjfOCZUfAJBavf5A24E5vcpm+Hzrjd+GaYOeDJ6OTDXEpqOZSxn
	 1joQ9OYUDiRMbcaiZheDll7NF5KMiY7oZ0m7v5iC2Glm3aWT+XpB0zUO2IDXp2wGaxGoj
	 mPWnxaA+3ujSmwVimKHNuPH1h93FhjjTFw6oug4rZiYEgp3R8VlCOJWzp4kR8IlT8dFx5
	 NDAmtkYvHYRkoDhBoq1h0vXjm+YbSic8t6wjljfGvN4lo/o7qGGXk4X+GsZHMo1R0Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793132560;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=VUv6HB4C2stQq3xByuoC9CaZvjSaPUQ+4hRcV5y8Phg=;
	b=D+eLA5tSXpDnlgvq3lmN4W9M2nveCicDxOJjwjHRLGK4cIIQX4xCdAbZ+XipNagZ1IKg
	 ruBPfTtQl/9chdMg65i5jlNGWvqYe0yFh9TDfjB9ms/ZqTxnihL28hlxeVta8bUTOpQXy
	 V4E45gI2X7wUpo4zE4aUa/SGPCx6u6RIVb4/xP3mWCe4m3ebS0mF4n9XhORpW5HL19KOJ
	 8IB/AeONQgchYcXG9Ix+8wtZZbdLKOwFmqsz6Sdu7HgqZCQ8nz3geHGr3Wk+V46ZIO0Gh
	 2tMJqeu1JSbf6uWWwRxljafyfSv523Rv+5ujSBoi+DkNiS+pzLq9EVBZV570gF8ECvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=NHJ8CX7T;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E250606B5DA
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 20:22:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E250606B5DA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=NHJ8CX7T
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3ac6794fe45so254312a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:22:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793132559; x=1793737359;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VUv6HB4C2stQq3xByuoC9CaZvjSaPUQ+4hRcV5y8Phg=;
        b=yekvFagQ5sf+KvdP4DgvUsrGtoETyqLVxLQlLswSyjNqPyCesXKtNzYo3HZmkTSxtE
         ZS8FB8tgyexIfeSxeaqUwkHuS+ZFbvMyo5/3nRFe6Zsqjd7DhNgxS1LlHzpW+SCtaw5w
         LySlvgS8LV3nkkVgi6VFfx9BMhnmHEnwEMlhVxqdmCUjMDcuirsQNCAMKo0Prk8Jf7Mz
         MS7Z4EdICqU1A3w8iBrCH0HrVNR/jTXYANyv5KibN2jpuU7CG3N+QSpoPoQ10XqKHu3+
         oKBNTA2VsbIbjXSP6a/I1rzDnbuJewueEnLYA4MRB3csK9QLVlC3I3o/uG1cGTz/DIXh
         W+Mg==
X-Forwarded-Encrypted: i=1; AKwUvBwjCC9bk0DE2rphScJDPzI6Iw8MKpLZzk1BvSHwJIqHqKq/yTqdsU4NadCif9McydiJEae3Y1caFF4btlk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIuuPJxdE9+SWDn4qyIDF3btoWOjTvalzMcRAJPoHnf93Vl40rZ
	ffdG4JR8sHBYD5HQtOpvh1JGfUesxnspbYw/MJQKLwib0ofxcQn+r3BM2Jp0oVT5SoQcE4opb8B
	HmYp2Eh6mL35L1tJp0yreR6SNtV9L1TNPJnWkpWE+0pmjHnj+tcsiy4vJoFoEvykW54BxSIlfBl
	sziXipd/QW7h6JTUibYgYQSdl9X0VH5KxeeTxdqYdn3zM2PL3rlfEqsCFthLY13qGYfEI/d476W
	w5sXleSmopf8424auD/xdqJc/E=
X-Gm-Gg: AYBFou2PO5BPLKZZ8pOB1TeRlaU0IzazvHmwQU4ZmFf1kueDpc5uFwAdCfc9WQisDaf
	/e29A7NwYzwITYgvb8gF25WJk8x+775hN4a/QTt+Vf4p2etJMiiXosuIypKmXu0boJWvDmknEEu
	RGAAROKqkeza5Gkare47/9YbcFWsqed+h/LM3LDt6HHg4vMyTbkgFmPk/o8uUJmtWOyFz1R1aQY
	eCgSkeN7lyLUTsq4G2GDbeZoz5dKiwfOi4A4LYaMrtqOt5KzrshahGW61AVmHQl7J8VEsL9MYxF
	v1ssTrtqDjD83eA8lEtusmuxjS9L+WUv22s1V7/s/Hvi/0PUBtPIwoY3GILAKKR8lBq7UpFfDHc
	OQRLGxNNNCbHnvvmpG56/OmpG6nz3caF/wruyaGt8s6pQO+qIRPLL+NGudp9CPI/3tEb4tIFry+
	zLHc3qPC61PxFlti5qmuKYydEs3p6FUu7X+/Z9FXuq
X-Received: by 2002:a17:90b:2743:b0:3ab:188b:c5bf with SMTP id 98e67ed59e1d1-3ae57f637e4mr138320a91.18.1793132559332;
        Tue, 27 Oct 2026 13:22:39 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae55d4f7e0sm117115a91.1.2026.10.27.13.22.38
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2026 13:22:39 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ada8bc8575so461978a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793132557; x=1793737357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VUv6HB4C2stQq3xByuoC9CaZvjSaPUQ+4hRcV5y8Phg=;
        b=NHJ8CX7TkxcbJgWDw47zCQGgDRmlSvRxBSTl5HZFFHoPg8sUmqcaAcYqKupDGwI48L
         BO0BAnozDwAwR3SzySaKahVYVrB3RMEPRnpU5cfrAFw9OirdJn3TC0WmcbpYDRGQOV/8
         0KUrqEsH2EgrxCJPej6p8itiI5CsaLfwNc5CA=
X-Forwarded-Encrypted: i=1; AKwUvBzT+QmU7lY94KkGCBr3K7qdLnGH0XcnL837cm5Zop2AFHBT+d1tyxYoP6+Unzm4yYsTwAoh3Hmfo0ctFRM=@vger.kernel.org
X-Received: by 2002:a17:90b:57e4:b0:3ab:27f0:c90b with SMTP id 98e67ed59e1d1-3ae58140325mr148368a91.53.1793132557557;
        Tue, 27 Oct 2026 13:22:37 -0700 (PDT)
X-Received: by 2002:a17:90b:57e4:b0:3ab:27f0:c90b with SMTP id 98e67ed59e1d1-3ae58140325mr148343a91.53.1793132556871;
        Tue, 27 Oct 2026 13:22:36 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae55d1650csm275486a91.1.2026.10.27.13.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 13:22:36 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net 0/5] net: dsa: b53: Preliminary fixes
Date: Tue, 27 Oct 2026 13:22:25 -0700
Message-ID: <20261027202230.3539646-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

This patch series contains fixes to issues reported by Sashiko on the
b53 PCS bug fixes being submitted, and then some more that came from
code review and testing.

Florian Fainelli (5):
  net: dsa: b53: initialize the jumbo frame size register offset
  net: dsa: b53: fix the SRAB grant timeout check
  net: dsa: b53: clear stale state when creating an ARL entry
  net: dsa: b53: reject conflicting mirror destinations
  net: dsa: b53: use the correct override register 2 Gbps bit

 drivers/net/dsa/b53/b53_common.c | 42 ++++++++++++++++++++++----------
 drivers/net/dsa/b53/b53_srab.c   |  2 +-
 2 files changed, 30 insertions(+), 14 deletions(-)

-- 
2.53.0

