Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794506627;
	b=rhXJvpr1CB3/93N81XbikZw0jRvdij4v0pgkfPEPz39iYdvrlX2iEn8uLyVQXTKQWH/k
	 8vVmzmG7UDi8gQlfGcIuBQPee5dIgQofx0IWXdePT7Bc7A/qAUvZIvaquUAb9VlRl50oW
	 h0nxG5a58eqZaiv3hxawrU0be9rLzSuJN45Ry0EF+nB3WZfBGv5a7Y1k0y9Nm3xpRk6i+
	 5yEPXEJTHx4FfrG167xLoJc0e5heyVCtWsChsJqnRs5QHiHWAQ5C+umPg7JoapHTzwy89
	 qlEUCmLn9JA79Jxp9V4qi9VL48XYt34iY+I4xK7wmBI8gjRDqJti7PyBbr8tqRU/rwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794506627;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=KWmfQ4Rcktpupq70cQYmKdTekcTMgohpolHe+exndVY=;
	b=TuZr5pGmlUobNQ4LeL9317O8uwhrDnd6m3R5kKnnq8qpCxPmlNZVsDSth/QnTDM/5WXW
	 U0+QG2f8Xf93DJUJc+6bvB3PTUzq6deBfpjZmrhTJQq+1bql65cTkVgVWAchSkLZ90MSH
	 Z76EfUYxK7hSyz1IZMOSlnP6sE5MAMf2Q13MYpr2FbigtO/eWR8yTsxwQzlBHnvixEG6R
	 ETqfDGwlhXNf0m4KHka0I9FAqFPKVzjmnI3BzNNMhu4uahWHqrep0wUAhESXjWS4XjCLD
	 ucfz7igjUYW8UGeTJFKAZ52qT7PRPcGNkYRcyxzHPZ3425/FNym/foxK+pNjsGFMfdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=JEYDUHef;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56598606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:03:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56598606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=JEYDUHef
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so24232a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:03:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794506626; x=1795111426;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KWmfQ4Rcktpupq70cQYmKdTekcTMgohpolHe+exndVY=;
        b=Ouwnv9UiFDGUTmNh+jpiN7613Tfpm0wLQ/TzCQnsMdKbeKcUh35SsGGX1fOW26RKGz
         kLb3Ehn3tES1F6lXnAy9nldk9poJlvngbbfyKxWuMQ92BLpB2b1s9elM+k36r2TbeXvs
         qhouHkPtJAR3Mu6fdqkK3DMBvMcpOMxb5xx3yscZFULge6AQygMagLeVQTAGSNT90LhT
         BnNVKJwsoSmeKcu8Xdcuo5qVIR3jgetoyJWv1gdQBJJ49VIxvJCKWVjvY2UhypERx7J1
         ZA5Q1VkiS/2N1PFG4U3Snwyd89e4y8OwH7cXoCsD1gLHt/nX9YHaa4yuCZaLy49wZ5Wl
         huUQ==
X-Forwarded-Encrypted: i=1; AL+hErHxUHepF6ImjzTJmPd5JcOcF3jhIa9lagNBk/9VghInHAKPPjY0yhKHNTC8p32aL6bJHr0HeBwwrWGas7o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JG3K1zWKp07RaX02OxTHje/qQdbe35UVAdbBN6wcOVAV7JqE8
	c3eIcIf6ZvqKDXm4BB0se1Tn5mY729c5kGJmy1PBlRJisC7ScRrBEtnTLfV6PTW7EnKOF7/yeW0
	zlOn542tZTMIk5qJu0iDvDW+ziptf/ygfWQigyFP7GVDnNF4D/Q6VnoMcKO7zJLj2ZKB2O9bVkL
	hCafQ1ougeWBKEIuCzGc2cGtzM8Rm8GQOqYh1Q+dOLS54gt6vaiSAcjrLZqAuXTgupE8lKob6ol
	B9pLIwB+Kug5Uinf5mks3fC
X-Gm-Gg: AYBFou3BkveIVVnT9fQc8dUnYoJR9knInHT1nv65qbMnbWoippT2OkRga4gRYGw0tRN
	k9JVa4k0KBwnQTv5xxgaIyp4ZkMCYm+aPQzBDeb82cv8V4pN/jlWdHg1ECWgj8ZqROXTO4ovpWi
	gmFfRc3cB9SKDPBVg+cmFFK3vmgnygUd51goHqO5JMEira/YeXnoomsEAULixpKr8i1dMjhH3zG
	Sn6lMUsVCF92Dya4ZTGAEEoNQv/N2EhOvHYZbAbndJrhC2yeY0yMOeodm2nf02LdRAJPlKefaTY
	/DLf2WpNe3rfVJ/25ZnJMShYDrilRQchrG58Vp2LmaHYS4cXhn7BRwCY8FC0ULFKN9YbfBNBBu0
	DMBj50FqdRzbQd94/jFBAkD5MdPz0qFOtvwqQLjrwF5nvcGsYvLCAtUjuSvJBkMC0TCPI0z2AVQ
	S4Wds/x+VxU9JbTS7s33ON0JUBYEKe0QZyS9XnLQoE
X-Received: by 2002:a17:90b:4ecc:b0:3ac:eeb:e0ed with SMTP id 98e67ed59e1d1-3b182eec2f2mr5992597a91.36.1794506626192;
        Thu, 12 Nov 2026 10:03:46 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1ae81cfa5sm418384a91.0.2026.11.12.10.03.45
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Nov 2026 10:03:46 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b0a13ae043so60919a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794506624; x=1795111424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KWmfQ4Rcktpupq70cQYmKdTekcTMgohpolHe+exndVY=;
        b=JEYDUHeffcLgfzq4udhuNGiGnRIyktFi/daKzE0I3FHTKN7NrPzWHTSv4Zv2zSRTFi
         j+qgeQXS5mGQmnyByNtapbANmW5NiEDO+14O1FyWvOCjwKrQjprZvBxYTMd7cBe7tGOS
         w19tw7l1NcCi19du6gLRff9tBMwq9QBUSrtHk=
X-Forwarded-Encrypted: i=1; AL+hErGh3c+Btc+87LEzinCYveBNdTr+wAqdRuDu55Az86rYhfTNBbbcNIKm88feQP8jjMfw+0Nf13YHSQgeDIc=@vger.kernel.org
X-Received: by 2002:a05:6a21:798f:b0:3e1:c08f:16dd with SMTP id adf61e73a8af0-3f7a6ea0853mr7267637.27.1794506624304;
        Thu, 12 Nov 2026 10:03:44 -0800 (PST)
X-Received: by 2002:a05:6a21:798f:b0:3e1:c08f:16dd with SMTP id adf61e73a8af0-3f7a6ea0853mr7236637.27.1794506623837;
        Thu, 12 Nov 2026 10:03:43 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18abc06sm95004a12.22.2026.11.12.10.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 10:03:42 -0800 (PST)
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
	Vivien Didelot <vivien.didelot@gmail.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v5 0/8] net: dsa: b53: Preliminary fixes
Date: Thu, 12 Nov 2026 10:01:54 -0800
Message-ID: <20261112180202.324504-1-florian.fainelli@broadcom.com>
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

Except for issue #2, all of the other issues did trigger in testing and
needed to be corrected.

Changes in v5:

- resolved build warning in patch #7 by moving b53_mirror_init()'s
  declaration into patch #6

Changes in v4:

- Return success when deleting an ARL entry that does not exist per
  Sashiko's review
- Restrict the 2 Gbps override bit to BCM5301x and BCM58xx
- Restore mirror configuration on resume, moving mirror initialization into the reference-counting patch
- Propagate SF2 setup errors on resume and disable the clock on failure when WoL is inactive
- Add a patch fixing BCM5325/BCM5365 mirror port encoding, including CPU port bitmap translation

Changes in v3:

- patch 2: added Daniel's R-b tag
- patch 3: mention in the commit message that deleting an absent entry
  now returns -ENOENT, including when the lookup runs out of space
- patch 4: document that the patch also fixes the clear of the capture
  port field in b53_mirror_del()
- patch 6: reference count the mirror source bits per port and
  direction, ignoring deletions without a matching reference
- patch 7: new, harden mirror register programming:
  - reset the mirror capture and source control registers at setup for
    b53 and bcm_sf2, since not all switches are reset
  - check and propagate all mirror register read/write errors, only
    taking a source reference once hardware programming succeeded
  - use the source masks rather than MIRROR_EN to decide whether the
    destination is occupied, and write the destination before the source
- log failures in b53_mirror_del() since it cannot return an error
- patch 8: new, fix the mirror capture port encoding on BCM5325 and
  BCM5365, which use an 11-bit bitmap (CPU port at bit 8) instead of a
  port ID, and translate the CPU port in the ingress/egress source
  masks as well (verified against the BCM5325E, BCM5325M and BCM5365P
  datasheets)

Changes in v2:

- collected Jonas' R-b tags
- corrected logic in patch #3 to propagate -ENOENT, memset after the
  debug print, translate -ENOSPC to -ENOENT when deleting

Florian Fainelli (8):
  net: dsa: b53: initialize the jumbo frame size register offset
  net: dsa: b53: fix the SRAB grant timeout check
  net: dsa: b53: clear stale state when creating an ARL entry
  net: dsa: b53: reject conflicting mirror destinations
  net: dsa: b53: use the correct override register 2 Gbps bit
  net: dsa: b53: reference count shared mirror source bits
  net: dsa: b53: harden mirror register programming
  net: dsa: b53: fix mirror port encoding on BCM5325 and BCM5365

 drivers/net/dsa/b53/b53_common.c | 209 +++++++++++++++++++++++++------
 drivers/net/dsa/b53/b53_priv.h   |   4 +
 drivers/net/dsa/b53/b53_regs.h   |   1 +
 drivers/net/dsa/b53/b53_srab.c   |   2 +-
 drivers/net/dsa/bcm_sf2.c        |  10 +-
 5 files changed, 183 insertions(+), 43 deletions(-)

-- 
2.53.0

