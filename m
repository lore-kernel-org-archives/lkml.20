Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C94131ED7C
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 18:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791483044; cv=none; b=SlstLEE33T93uq3tKRepKF5/Dh92IMlnGUp0Zqn8F5CZAtGYI0X2wlZETm5CY81Pdg/JQDthht5UT5tsD/m2UANJIYNrB6VgkLEQ07GD1SKgnXaj28e+mqgNOqYvgezngOkWezlWh5cVtn/g+HajbPsHOrYawZF9XcXFO6Hmhqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791483044; c=relaxed/simple;
	bh=6T6mmHnv7hYSALP/oKnLRb2Iv1oQZCIBWfY/um8auys=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pDyIQqV3XTdSOpvkdnN+9S+7DVD0nohARlfxLKV9KVpUWEejkq7lWtfxLZXf2vG1B4GR/kqr/kAWLCRC4J2qcLMtgO0Vq4FfGSUj19APT0SAWLAT4ft4oJ5r5J+uCnWYfl/iWFFQlKGv4eiEph9ne5OlBgYICaHlbM3EvcTPOk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q5y3UrXr; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q5y3UrXr"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35154cb9de2so4852462eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 11:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791483042; x=1792087842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xD4nln5lOiYRoFakO+Qj2Z+jCtHD1Oml9vzGYNX1Nj4=;
        b=q5y3UrXrAs5B9+psUvEgjqx1oRaBxbbGi4ATLK2PS/1ryTBLQ6XNlwbMK6Xx+ge6eG
         iKNuf5Qn/ua2vHO/qseluhlTOKZeVCZdBRbAn4wREwao9Op/ct7JwvxnW7RmgYUv8sT5
         kXp8SleIJ75T45VqfzFN9fb3TYN2gm99xXBQZSx0XAIdExpSzwfm2iaaZ6/HaUNoHfNS
         BWTtfPlOFn7zIdOy8x+WhBJggC3+ko6NXwkgGInsGBXlDWWtutFpkyoNartwlY+WlOyF
         TbnJrR2//yjgEisI71H9TNDac0ippxtS0KWf4rGegcMDaOjt+0lthLljjx6xyMuGJZD4
         15sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791483042; x=1792087842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xD4nln5lOiYRoFakO+Qj2Z+jCtHD1Oml9vzGYNX1Nj4=;
        b=wfK4TvI0ZzmZaQNkQDcfK1wFbuLVJQ0ESFMNypucugAJOmV0KcOJVpImFKae7AxUnF
         3n061L0pD59DAE75o2nYdgP/FBnuPe71DMmksyOLdQ4rYViSv8stTQFKjKF6cGK0qGqg
         B6bAt/4/gOYuspf4QtE+9GrzlsYV6ZuWuNmFO62qFCIsnFXYMksKbuDIFA9Te7j1bzkO
         LHIAmZ9CHbCJX6gitNlyZIqrm+0px8ShTcNpIEZ7ifhyq9DnC2qk5Z/br2PO9Z7/dci0
         KGxKKSKubp4lqfxUR2q0pHwESFk39twJ3L+9dPaWXm+JW8J7FqFXw8NvjlwUpQM2UWBq
         DK2A==
X-Forwarded-Encrypted: i=1; AKwUvByzUtjAobxi/9hiyZYaMFyWPdq142curXw8nM9fPzRVZr0ah4081JAUowFKmUrRFTGpRRWa3pZ8myfN+Mw=@vger.kernel.org
X-Gm-Message-State: AFuF++nK1G5ys17e6hDXZFOvWTgCsr0BD9UW4Amw50SDZ2PfS7sz0dPq
	27H0R6B7akaYOE8R57R7DsTGk7pHPXCGv9OEBrpsRquCPMg0hMZ1hAV3
X-Gm-Gg: AYBFou1P9YZLkhC8p4NcEsec/pwSkYHcOWjQAfPczTK8Darfu7oIhse/IRwBWpMDli+
	Xj/FTi6zEJksIVQ7UHt5z1RXoJatq/o+pjSdeiWFH2IM3qzg/Os5SEhsfir9Mkpx3QttZyNhD8c
	VW1Os2G1zVFBoQYTCk9l4uwKjjfFbWy5sjmnfHnyZtOiSAS1ZUJ0DHdo2wiqSSRD+BOB4giFvyF
	98BS1kLZzkWgrKsaqAxftrzESl3GcOSyYYeW48sWLf3FxPFnV19yaBLDZwy/R2SUjaHm28ONcvA
	qCkU5n8FC6wXpEGE7/5LzWTbsw+0beKqQyxVbuEmhkURWDPPpzb1GVLN+t90ORYYL24i5YhgR16
	u5fBqYZHEpl2V0eQVhwCTEJVha502S4Sf1Re/EnTGA3zGnMFZRlaHd0X8FZB5E5aN8Tbo24uQ0L
	rDJ32i7mrL8r5fZNU+e13kTNrGl0eUbFCPC3t0hA095ASTgmY+hrcceGuV2M7lHiT0Rk5Yp+SvI
	4nagmqIk63oyfNns4sfK2e0va8W8xjdTM49bFFEFpw20oFkWQSuswVaAY2BnZOf4HNetccsrkEC
	uk0OddKoClFcAEDK9OyCP3yB+YSzB4oyz35/zvzAD4x1i+ozUdtSBg==
X-Received: by 2002:a05:7300:3a91:b0:351:657e:a426 with SMTP id 5a478bee46e88-3535ecc1121mr225278eec.0.1791483041903;
        Thu, 08 Oct 2026 11:10:41 -0700 (PDT)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537b479e76sm162161eec.26.2026.10.08.11.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 11:10:41 -0700 (PDT)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Harald Welte <laforge@gnumonks.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	osmocom-net-gprs@lists.osmocom.org,
	linux-kernel@vger.kernel.org,
	Anil Kaushik <anilkaushikwireless@gmail.com>
Subject: [PATCH net-next v2 0/3] gtp: ynl spec for the GTP netlink family, a reply-command fix, and a selftest
Date: Thu,  8 Oct 2026 18:10:28 +0000
Message-Id: <20261008181031.4129029-1-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This respins the RFC "netlink: specs: add genetlink-legacy spec for GTP"
(netdev, 2026-10-01) as a patch, and adds a driver fix the spec exposed
plus a selftest that uses it.

While writing a ynl-based selftest for the existing gtp family I found
that the GET and dump replies put the genl family id in the command
field instead of a GTP_CMD_* value. libgtpnl ignores the command so it
never mattered, but ynl rejects the reply as an unknown command and
drops it. Patch 1 fixes the driver; patches 2 and 3 then describe and
test the family.

The turnaround on the respin was slower than I would have liked: most
of the time went into pinning down the reply-command bug in patch 1
once the selftest surfaced it.

Patch 1 sets a valid command (GTP_CMD_GETPDP) in the get and dump
replies.

Patch 2 adds a genetlink-legacy ynl spec for the gtp family
(NEWPDP/DELPDP/GETPDP/ECHOREQ). Description only, no uapi change.

Patch 3 adds a selftest built on the spec: it creates a gtp device, adds
a PDP context with newpdp, checks getpdp lists it and delpdp removes it.
It skips when the kernel or iproute2 lack GTP support.

The 5G PDU Session Container / QFI work that first motivated the spec is
not part of this series; I have no mainline userspace consumer for it (my
5G user plane uses an OVS datapath, not the kernel gtp driver), so per the
discussion with Harald Welte it is parked.

Anil Kaushik (3):
  gtp: set a valid genl command in PDP context get and dump replies
  netlink: specs: add genetlink-legacy spec for GTP
  selftests: net: add a test for the gtp netlink family

 Documentation/netlink/specs/gtp.yaml          | 170 ++++++++++++++++++
 MAINTAINERS                                   |   2 +
 drivers/net/gtp.c                             |   4 +-
 tools/testing/selftests/net/Makefile          |   1 +
 tools/testing/selftests/net/gtp.py            |  77 ++++++++
 .../testing/selftests/net/lib/py/__init__.py  |   5 +-
 tools/testing/selftests/net/lib/py/ynl.py     |   8 +-
 7 files changed, 262 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/netlink/specs/gtp.yaml
 create mode 100644 tools/testing/selftests/net/gtp.py

-- 
2.25.1

