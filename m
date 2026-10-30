Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793394841;
	b=ZDYmWjLO/CSGH4gh59Kuk4KfIQZBOvqHzN36XhlVMxWiRJM9BmkeWOvqSyUG6fHo+N4K
	 aNkJ5EX7+g4sT+59iSF+VO7c7EcZMlQVXvUJTkqYKZYmmuJQfEsbpuiHVHRCws+AqEPyB
	 YxPvnw9tvVCodqdeJBWZoZwwoGW27c5Y4coCZc19NzuMGLa3oaRPfGtyr6/LqXHorwLma
	 lgiHyyDhkChSLmw4/yAmPBMFeFObMn2GVcleonZRYJigzMfsFJkWWg+ccB2HMzPiNoDl9
	 V0XSlxgu5JqSdOjFovdxTSSuNCmdBWtPCivRHIyL7uhRRezJl4q9Lo+Dr+QBl0XfOKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793394841;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=KTlWlfuITNwuhIa6PJcKp+S8YcpVXepl99NGmnhvqqU=;
	b=F1BQvY1H3bYejb7YaR/ha4uP0XVI/GNcf/eyFMZdQfNJN1zkOH5jeas94y+LXBCpQ2IF
	 pR0SerwIzs5Na4H/N77fwfeTEYTUQWGJp7I9ZuOk3DDPNXudKwOAv8pFfhL03UhqaJjBM
	 yeTZB+OYHP7m5JLVzM0DPBYKTbuxectPPn6buoZUpDvfrP7sRUvoTsqobyqBPISfGLD3j
	 N4WBTGSPArhu+H55g1wvN1oe9iQFc0yqNYWUJTQHuLw3E+ygewUIwiGlG4Z5vpibN7BPB
	 PJVdVLE1zwNsqoNW1iJcP6+5k1u/ri3PazZyVbMyMuDGajiM1HluYVyEsH3evXhn2YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=IiqPCQlE;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1C2606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:14:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D1C2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=IiqPCQlE
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3acb11973c3so992567a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:14:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793394840; x=1793999640;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KTlWlfuITNwuhIa6PJcKp+S8YcpVXepl99NGmnhvqqU=;
        b=STfe0jjcXVsu56BHTLD0YPM0pTILW/gSqZXrl6R3+5XC1lYeLytOXzTkzYvfCLURCa
         SPcs9xNb7sxqRAQiQRNPDq7xf6ZIx/qGqH4sjggWVBX3lnyetzGrSQE323ahXdWFUT1F
         PqhsyNuHYB1q9PbkHPRcYfQFd8BAGEcQU7vsaq4rjPrfG+Py3x+snnyQRKXGaz/tbkmY
         KjeCkK1UZzGTXZW47z65FoCjaDMt+7nV/PptbCV+Dyc48X6Ai719uXAk+3xA9ccfezZr
         NqaSOPilCl990eLkdQSGT9L9PzMPK5iEcQ9zuQrHvZs1KNB4iwATZ4G7Eygsif2JeP23
         uJ+Q==
X-Forwarded-Encrypted: i=1; AKwUvBw1bgVdfbKzbcIE8A5xr+tjjlNhaaGChcp5M/IpTkc/T135YJALAMG+KCjJcBMMVSvIxIOJBoLqZltMU6M=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKRqUYy0ftQNsbVADmAQoB9B3QRrFlzor3Vr4H64HdNItotIpw
	/WmDfQ5rHceCaNW0LlF7f4VbCphRGsAx780lw6kEeB0J5U7N7a7LVGv3AsadIGHst7SCSUmFLtu
	Cr+pituATcu00WnaSXPtIhp57Q24yRyth0Xe239knkD0lgLMDCj2/MwYtEjTOkelJv1lnAjX00v
	wRrRRnv9zZ2eBfUxUAOZHHMXpd4sO47p8TST0Gc4gm36zpYawX+GxgWWZmuPtfaYeuQlowfA0JH
	ly63ZYtdeYySGGoTorPYEwI
X-Gm-Gg: AYBFou3povjsnU0tvHwMPzcbNT+D5i9+6+bbvP6Q8w9Dl/Y6XBZ8HNqXON2JraNBNiE
	vQPOzbVt9vyWeA5YU/8XItQG2rzSPu+cdgTQ56HCRbbbWNaLBa3hQyyP9rZg8QL4AauytgjB1de
	YjPibFNUOsGHfnK1N3fEDsxCOhsfHhZ4gvPrAOWi0h9FrU23//39WY0F/cTSYzPRkiExeXN9ZDq
	GJgy3a7adGSFrQuEtIMZbtM8ibpEVaSKDfu7/FiuduOIRNMETr3J2gF3Dq60YUOj81me/jRPW+n
	ES1T4GsL+d4L3QWsIfXw8XesamQWIkgFskRQCJQyPq7q2fmXOgUq4ZPOVuQb+1cUg80dIrW4m76
	FdX3nhT4gku9ZPu1H8nIH7c3GRj5TLG3JfIl7EBovnFl494rNB2PkUIihbl+65D649ZD4ZQ8ZdB
	XTkT8wrrgmUUZ+gJKiif/5iMspZxbk7eKh90RI3OB8
X-Received: by 2002:a17:90b:4c44:b0:3ac:403d:6232 with SMTP id 98e67ed59e1d1-3ae897e0829mr2857240a91.55.1793394839676;
        Fri, 30 Oct 2026 14:13:59 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae6e874b16sm4780648a91.6.2026.10.30.14.13.58
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Oct 2026 14:13:59 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so2631659eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793394837; x=1793999637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KTlWlfuITNwuhIa6PJcKp+S8YcpVXepl99NGmnhvqqU=;
        b=IiqPCQlELKIg7/8ok4QEkbADHd7RAii6VtHEfzEkGtGi7K4bQkKoeW9kLnUmMO+OEF
         dlskpvJ55ZCkCKnKPAOcXhct/wbisGsz3btz6GlNPbipO/gGt4PvbwrzmlWIrfmZqQjV
         +3wpCQ3IvD34OnZ13pnTSo3fdls1YHTvpCU3U=
X-Forwarded-Encrypted: i=1; AKwUvBzKJ2LsXejiC0DhViGqcQmrWnqqc1HoaNLkQI/X7ChDVwaT3MZoNbsiJfAy+H85npoTvZ8kRcJfrav5efM=@vger.kernel.org
X-Received: by 2002:a05:693c:42d9:b0:369:f18f:3492 with SMTP id 5a478bee46e88-36a423fbc3amr5370403eec.35.1793394837014;
        Fri, 30 Oct 2026 14:13:57 -0700 (PDT)
X-Received: by 2002:a05:693c:42d9:b0:369:f18f:3492 with SMTP id 5a478bee46e88-36a423fbc3amr5370352eec.35.1793394836208;
        Fri, 30 Oct 2026 14:13:56 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42669128sm10574595eec.3.2026.10.30.14.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:13:55 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netde@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	netdev@vger.kernel.org (open list:BROADCOM B53/SF2 ETHERNET SWITCH DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v3 0/8] net: dsa: b53: Preliminary fixes
Date: Fri, 30 Oct 2026 14:13:42 -0700
Message-ID: <20261030211350.287566-1-florian.fainelli@broadcom.com>
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

 drivers/net/dsa/b53/b53_common.c | 183 ++++++++++++++++++++++++-------
 drivers/net/dsa/b53/b53_priv.h   |   3 +
 drivers/net/dsa/b53/b53_regs.h   |   1 +
 drivers/net/dsa/b53/b53_srab.c   |   2 +-
 drivers/net/dsa/bcm_sf2.c        |   5 +
 5 files changed, 152 insertions(+), 42 deletions(-)

-- 
2.53.0

