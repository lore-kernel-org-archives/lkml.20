Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793394984;
	b=e/h6BOJcJV5TAS1zOzMLHrCLWFiUrUbjU3qWcr+OR0ecWy6rXJh5w2PEQdGDv3j7Twj1
	 sluS8EDjkZV823h96PlgkAqlTz+msJQ77sWFSu5E8l8WLUDcYjfQRZ9UQ+UdH0FIzUTAZ
	 nKSD8G4v2aP7P4TUz4pKn4OAGuennVS+/pRmXoHskUFDVmxFMVlym8fQU9kMCIqcw8mil
	 S9L5XQeK8NNPMeqCfKg3O7r8IIysUx/1492RB9mqzDUoAxUa0lajww3Nvveyeq1ZBCdXY
	 7q487KNQFNs6Sm3MfL7Of2SfCM1Yp6eKjNJuw4KIin1YYB5FjyTvAaAzF3+pBAZK3Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793394984;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=KTlWlfuITNwuhIa6PJcKp+S8YcpVXepl99NGmnhvqqU=;
	b=3qrCUlpdmbUpf5r5e/dyDIgKzn890+6wvlLSF5B/3DI3Bphem9Bye2E1OVx+VA+cjqD/
	 dFjS3u0mbUu8Bwe/bw4UAyixxVYqR7e+IrkWcbE2qUm5ZZAN+zYLHLGz9IzagANRxf5l4
	 Hegx49BXxYz70ME9AUF2GAU8VxAc3Bsq0cOLrqWSZ3NilUgZXjc3bW0bYGB/XyuhzX3Jg
	 RAett9Lw1A43fwpoLJ/jeJYholwv6Buye3DrO1zncpg0y4wDU2lEtWwHA3H3wfLzJOxuY
	 RjXa9U7O+Rzo6sbsRhyfH7U7o0UgR6c70ppGh2Hlg22d4TfRVOqphySuwTAZBAfAcgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=N4YDj68k;
	arc=none smtp.remote-ip=209.85.222.228
Received: from mail-qk1-f228.google.com (mail-qk1-f228.google.com [209.85.222.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC5E606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:16:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FC5E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=N4YDj68k
Received: by mail-qk1-f228.google.com with SMTP id af79cd13be357-93f269e335eso146529285a.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:16:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793394983; x=1793999783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KTlWlfuITNwuhIa6PJcKp+S8YcpVXepl99NGmnhvqqU=;
        b=NuRZlJbw7efVx8gUbOwYiX1ezcfWefKqpQoJ1Yj0Tgn/qWBoLmmVtuDuWhD6z+3YRW
         WxDFvZz3pRAeZU0WgW5DcdKsb8zJOfqo8WGiBeDGnLO6tmm49334QlBMO/tu9xbDVZeF
         nIQF3v6hg6icRcLIE+arYmIEfMNzY2HrkMZZcbzbwTVfsd1pCDuLNTjAZEKeFk2cQXH7
         Vvb5CxrxYI1l3OUmOsa/NxziNHi+L+UXJIsRBTz0SOfcOdaQoBnEHmugKKEiDLGE2ni3
         DfSGAy1iJzrjqYBr4vbfT2KVKIIFvCJQMCV2XsYNOiVnH5lmwQ35RWEVfy9B4RC0YGin
         rKVA==
X-Forwarded-Encrypted: i=1; AKwUvBwk2RTTO7jCpyySMl4qXfZY4NzRq63K8pOtBG3HV39Si9XOx+/z6VzBRhdE73/D3FoX/u41DIooPa6RsRA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOxZI2LXZkxo0a8RDO9cRlmauh3ZF3k8GENzOMR/7DZoC7s/3M
	aWNwId2kH3AyPv0J4vWtmpg4zYBvb/IfYVcm15CKieZO/AQeT6c9UQvL198Xjs0zxOgbggwlJzt
	3ZzhH0OhcRQx3m1Kl9J66H/emco0SmqCNK+ntsyz9HQ6XRKvi2yDmHxXkdVv3W4htA472eq9v3M
	u1HVhXutXi/D976e00ae4C5DHV0e7UHy8HrW+5eQAzkVN+bNdzy9+npb/BD4O10guVNVKza1VlR
	Ey3a6yeLVMuPqzl2oooqhJ9PNQ=
X-Gm-Gg: AYBFou3xWezsN7jiFpoT8RaE+k+voCXXgQJaGsHM9Dppqr1RIcPZKSjdX+9lK6so/te
	kHFHYTIkxkKdBUL9pkoUTpybI/ZpS2rO2hiMvw7e32vDPdvWaqWEODC9juuv6XYgaCC10HG0h9R
	AFDpChmUgNpAVqm3GpnE8QYIrWdI0tjcpkfdzxyQGsz/xV9rZHxd074qwefa7urj7WCXJQ4r7cY
	ij6aIG3I9RkFGm4tYsQJmywwMby4mLDE28ugMSibfCBGecsdTe5HrIpVKB0+BGqz0ttwQYRzdwc
	g4CxaRvncjGy+/cDwaL6UA2JIWz0jcIgkEbFoL7XTgcCppQkdo5FAb6SEE7+SoA+19DZwQi5ffW
	z0HLUmKp0FsdK9fHwI3KnBMdPfPos8a/0bG0ggw7fvly+OcTTvTpN98ksTgR/R1qVE403y1vAlM
	UVnBn6YEbwrh8B+A+M5GgEji9LMZ9ITt0USX/Kj+2a
X-Received: by 2002:a05:620a:2709:b0:93f:571b:c72c with SMTP id af79cd13be357-944216b818bmr609211785a.46.1793394982985;
        Fri, 30 Oct 2026 14:16:22 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-944255c216dsm29056385a.5.2026.10.30.14.16.22
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Oct 2026 14:16:22 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so2637243eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793394981; x=1793999781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KTlWlfuITNwuhIa6PJcKp+S8YcpVXepl99NGmnhvqqU=;
        b=N4YDj68kQYgEbq+uOwYTqasIjgWrIfTZWz6/X+IrHhQIMXzGVKOLXMxvTqTqtAGO6L
         rf5mElUewIoP1dsmxuAzF7pI3bnztMJu3a8tcRtz1gYSjPVS2sbAFCP0bGAFThUMCi5j
         XTEHOdSv4HNj6fbEkNZWRZCgqjETVqD6k/Ebk=
X-Forwarded-Encrypted: i=1; AKwUvBzoFwbrRVsrad/xKFImELMGWjADuxy4eiNQx6yQXlel43xhtfakGvJAOdRYT8bxCH3sJzjvYAj2Y+aKvv0=@vger.kernel.org
X-Received: by 2002:a05:7301:618a:b0:351:68e8:4646 with SMTP id 5a478bee46e88-36a424199bemr4705026eec.37.1793394980965;
        Fri, 30 Oct 2026 14:16:20 -0700 (PDT)
X-Received: by 2002:a05:7301:618a:b0:351:68e8:4646 with SMTP id 5a478bee46e88-36a424199bemr4704977eec.37.1793394980218;
        Fri, 30 Oct 2026 14:16:20 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm13513535eec.16.2026.10.30.14.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:16:19 -0700 (PDT)
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
Subject: [PATCH net v3 0/8] net: dsa: b53: Preliminary fixes
Date: Fri, 30 Oct 2026 14:16:09 -0700
Message-ID: <20261030211617.288562-1-florian.fainelli@broadcom.com>
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

