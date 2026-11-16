Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794863390;
	b=OcVUWMa+WgorTJACq6GDWPKgBP2zdM+KuXypROvBiUK7H7zG84qIGDvNYeTC4U20HGuk
	 4X7YIf470z4nLKDuVx1/nNNtivVAPOfOjvfLvxpZtKa7MHwomeIE9DKrrB+5TXzBbrSyw
	 gFvDe+W7uYRssE25m/wjYFSHKb2LjuE7/Nn5vZy86b4iecbJ2EMK4uAWx2nAaTU24vfdO
	 oDQq3po8h35MHBXoTmOvz2x+XjqXBiHeKVNx/6Eo1ViLuzV5fMNFkILw/28rauoi6rthR
	 Rw3uMMKam2ltyBuDfZcZpoY4ZNNifu2KZKHoU38BCWArAigZGRBseIh6vNkcBkR8tTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794863390;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=tDKOjLIrGRWdnFpabDolKAXG+Pxw+0h1CyxXZ/xbAjc=;
	b=ELNxLkTgzl237cEN0y0FF58MPk47rkUYsiejrL2rp4X/eoGBw+pnESMjSr2TyYsBbA/G
	 ZyNJDMTrpPYxTj0n5OmFt+Wi5GczXdx60rm2qpAg3kQVFszd4nT6tiF40yAfOEahjyRl4
	 GIBCykolhUjm3iQ+oTw57VpC3JDlL2j17qhqWzOfw5D0VP04Q4LfawA9aI0fnoJfKZYKr
	 TGtvL3hs7GWWTFJ5X7BvLn+5B20e+ch2En82Ilg22gIamUZx08YrUWSsyXZ6LZuREUVVV
	 XJGJVhfGrQ41/QvA7VKobtcbA8YLYAkC3J0oYfIFhHUaIKBLwd7Lys8zmTwEmBgBPhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Mcq6eI+Q;
	arc=none smtp.remote-ip=209.85.214.227
Received: from mail-pl1-f227.google.com (mail-pl1-f227.google.com [209.85.214.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEECF606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:09:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEECF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Mcq6eI+Q
Received: by mail-pl1-f227.google.com with SMTP id d9443c01a7336-2ed06b725fdso2390485ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:09:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794863389; x=1795468189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tDKOjLIrGRWdnFpabDolKAXG+Pxw+0h1CyxXZ/xbAjc=;
        b=K6YrdwXbAQuVoC0O8XLLoO7V690yXCAg8rbT5sjbnDTXcv2WwsGTO0fIP4mHf3NsY8
         5r+we5K+5uZJ38ftd37CeAPbWzVxAQw3jTAijK+n5DJ4N6nEs5SqgWN5pbGvZdoLk+ec
         4HiPhMLjsNbemvR2WwhEuKmvObmaO/5872UYXYhT7amB5/jZJ4o8ZwgnfB0TZ8u/Ppsu
         5BRoglwVqG55G3mxpEmLOppM2va++L0wtJfsuOvFWcyXiOEHBisWIc30PqQCwtwD6w2M
         qbgIc+ARTewBWylQySFfQyUiMYIX1u4RGniYMy1zT2uxkwtst9jaP6MYlc/RSlWYhUfr
         Y+2Q==
X-Forwarded-Encrypted: i=1; AL+hErEffn84Xxy78kWCGk6d7eOw5TtmK0IIw5N0c9S9NJBpcVJK9G3M+zXTWxZu3pFtkSGPxah4hn3MbnRzgYs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8i/6tLQpLAGehU1mOHzvLyFumVQyEEkgzVA50cVLQTfUbd7rut
	HHCGC4gtphDvffP5Ww1S0QpRQnpm4QLK5aiJfbUK8NUYp8ha/BTHxisfI5mXh2Iy2j+ZF9Jx8II
	1wWtpOCQSvWCF8xrbLT52fPdifXi7ZDQamSKoTK9bwgLxYSwFMphDXOtFtVxEMuLl7i9HpshTcP
	ccGJAzZa44USAo7dgUlZr/I3cClHGVPYb/vcrgM7/0/dynwE1ZfOEY1skd1gEF3dDlPMpioOwFw
	e/nh3kXThL7o3+aiiIp8KOU
X-Gm-Gg: AZFdTZceM/FhNw8i1Oc3HY8KBJZslPbm3PrrSBf19FSk945bvmlWdvlYT9vqBiWexWE
	4D9Q7IbRkLqSeY3UMNAKYdr5YuwNRgox3ElUMZMOC0oz2P9v0B75/+lIBvf71CA8jf4roTCx5J2
	MJBhDPlA8sejIDazYvSHgkNtPVlQ/ni/JXa3/rHIkhC8f+BgTWoNwVzFM4n26Na0I/fGVBMRACW
	eYds0i3CbZ97xqG7ghpndg2zhO5L/Kp8z3wW/dMtGX/Y00gg3hlU6mIh0M1A0HnSGLSXfdTwi+b
	OZeCKm/i8Nj0ihczk+BVxEbyhha2+FZgL337y9r9BYg9VsbzX9nfEED74kArCC7u9+5/s1yX+Id
	uKR/uCtEG5kq0Qj74PBu5OyLkelVjusRIL9Y03tcQcuL7TgY3mpsOu6J5C6jcyU8uwQbJCwaSAZ
	DIL4Zj3C4xUl6ui6AJLzbnZM8WB/sBWvXWSXOAH6QO
X-Received: by 2002:a17:90b:4c90:b0:3b0:9bfa:72ac with SMTP id 98e67ed59e1d1-3b3abb6e35amr406387a91.21.1794863388767;
        Mon, 16 Nov 2026 13:09:48 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b3f74ffasm5272689a91.3.2026.11.16.13.09.48
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 13:09:48 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91ec0ed4af9so3255466d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794863387; x=1795468187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tDKOjLIrGRWdnFpabDolKAXG+Pxw+0h1CyxXZ/xbAjc=;
        b=Mcq6eI+QU0M5fXNu3qml4t6mVM2z72NHTaVgQQBkClIc+To7L3+0GJerY+ihSJGsRQ
         l8UogqyJYWiH9hqmR42Mj+/oTee8IU2CXQlT8B9g3i2t6DlSs8GfJUxKzhmdtytpi9Lc
         Owuzk0IjrOIpOv88N4J2kzE52GO5nNvMfijRg=
X-Forwarded-Encrypted: i=1; AL+hErG8VZu69idasKO+ks0RnpzJL1CMocn0ASHtxO+788yDXYqIIBk7cEdYS8EbR+WnIMFwAmPYeHFegwMNmvU=@vger.kernel.org
X-Received: by 2002:a05:6214:dac:b0:91f:ffc:69cf with SMTP id 6a1803df08f44-920fd451275mr11930326d6.35.1794863387348;
        Mon, 16 Nov 2026 13:09:47 -0800 (PST)
X-Received: by 2002:a05:6214:dac:b0:91f:ffc:69cf with SMTP id 6a1803df08f44-920fd451275mr11929756d6.35.1794863386673;
        Mon, 16 Nov 2026 13:09:46 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-920fe17eaaesm3601396d6.33.2026.11.16.13.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:09:46 -0800 (PST)
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
Subject: [PATCH net v6 0/8] net: dsa: b53: Preliminary fixes
Date: Mon, 16 Nov 2026 13:09:34 -0800
Message-ID: <20261116210943.1352656-1-florian.fainelli@broadcom.com>
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

Changes in v6:

- patch 3: drop the commit message paragraph claiming that deleting an
  absent entry now returns -ENOENT, the return value is unchanged (0)
- patch 4: describe the b53_mirror_del() capture port clear as a
  cleanup rather than a separate fix
- patch 5: add a Fixes: tag for 41af38324341, which covers the 2 Gbps
  set path on GMII override registers
- patch 6: do not propagate the ds->ops->setup() error from
  bcm_sf2_sw_resume(), setup re-registers the devlink VLAN resource on
  resume and would return -EEXIST, leaving the user ports down
- patch 7: document that active mirror rules are restored on resume and
  that the patch depends on patches 4 and 6; verified the mirror
  register offsets against the BCM6368, BCM6362 and BCM63268 datasheets

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
 drivers/net/dsa/bcm_sf2.c        |   4 +
 5 files changed, 179 insertions(+), 41 deletions(-)

-- 
2.53.0

