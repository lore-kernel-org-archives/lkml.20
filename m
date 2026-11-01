Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793528036;
	b=y4uEnpMi3M1IRbm9q1NUctKAmv2219mE+CV+1iN5F9/tuAw6ZN7b5L6Up/W4Dh/bNu07
	 uLOF5lluEpSlIG8R6mO0Cg9EYVPnsgit0C+6doGoTvVW0pm2lXkzDTFnSWWr88K+GHhKS
	 WcCfIGa6YRZIPYcEGU3xExv/wbxwNtm2nS1+kUgRUO2Kg7tRAzAMMB1+IZoOEMTbHyu0d
	 xRnFCjYwAsAK4L3rTmDzTpH1LpG+elbqGmbnlBrTCToF6mPtQluiDvEhuhRnYLOocwzIc
	 dDTcROhRrBYkxjfQiFebPSm0qfSReSpYHLHe7kdIUkva1KnHakhWxiSelRH3TpcWHzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793528036;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oUfwpBkFzgWbXZ3OGl55vqxu+rm3oEmMdWSQQc845j4=;
	b=h8SHnCoTVlYWEzfgDFwUbWEDuZK87z2e8uLN/vhGE0fNZooc2oN90P7PKeM+Vz7cXQdG
	 lqldKy+M4TWduz3unvEwZNq8A/e2hGzFd75NwdbxMhwJRTFjPk5oCMs95Z3c4h2iVvmFD
	 flJrYvXSHDnr/Eh9ExEuQfEJlAox5lhy5qJkUL249z4zdmeFRypTIhWC4tIe0ReSfSiR5
	 eexvN7wvgkf2iHQfK5iqhq2ZY/WHTJUR2s8L6HsW5U81vB8vIKvP4tpLWbl16IBW7JB9N
	 hH66ieFMVZjHYsxJmgZeiErJTkIjKVSImlOfaSeve1wjL6Q7AyDfBMvYPR7f2fx+3IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AvtRaWpz;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51822606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 10:13:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51822606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AvtRaWpz
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-353804b591eso3623248eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 02:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793528035; x=1794132835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oUfwpBkFzgWbXZ3OGl55vqxu+rm3oEmMdWSQQc845j4=;
        b=AvtRaWpzrSLSE8iiskXZs7831rIAmvR3q7WLdW3gRLNC4dcC8ZCOHFsSpkDtORgH4s
         SGBHq81AESbJGyRl7IvnTcwDpwgq0YsOOP8D/y6Y/rTSH2vRZRKQ633T1Gz8505tmWaZ
         7kefy0TLXoXgdu621M2bjoA0srhdzx4vYWbrJhVgDMhkOfrGBETO+6v63sfTLOKUp2N0
         lACg8xeJ7+SYzWyqroN/nyyevnXdIF3FDnsxb1bChgnQw+5CFg7WNXnfGe5Zl3OwS6VO
         F7fDxuVY+Z6pPv/xAJ6g35nS/RS5YfaCHSUbDcvvEemTYVmUJcUh4KQTBKcQQJfacxNY
         ZZYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793528035; x=1794132835;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oUfwpBkFzgWbXZ3OGl55vqxu+rm3oEmMdWSQQc845j4=;
        b=2iNq0R03uhXuSze5XyRApF79jVYuRdYEZ+qE2rTjfbYzmth3GTGwSgI8rVrbIawgZQ
         PbxHrNIPxDtcmv3a9bmkA9ZVTR9Ky5iwQ4AMNxpyoNZ+Q/gpGx7PkceZJ7n0X01UFQ5X
         +ATtQ3objzXC5bClYY46YHSQcoGL3oiAzrmXIZJUkaP+CtV18PFnnCWitDxjKGbbaXap
         QJxa1o22Dk3APlOjXw0ODJzzZPgKoPDk755QJYXxqX/2UwrD8IiwASyDWkOrrDxtRT2t
         9acSWIWTLyjH5G3GyTQA+r7SKo777q9OdWEmHg52CdF9iIt+/XKIGimhvLogYi1JZhTs
         6O0A==
X-Forwarded-Encrypted: i=1; AKwUvByyyzOCu69FJ54h9mwKTBMLJ3K3/84U419o3U3sGtw5rNYsnsmII8rfhN9KGAKJs4mmKbutpKGFR9+AF1k=@vger.kernel.org
X-Gm-Message-State: AFq9FYJtVBf2eBI62akDml2bCsBzL23EFeF8sbTrYGVCTIq3dsb4O8hd
	MUrXa3dY373XtfjxfBCqixojqdM4h4IUJL5+qVZdSUlCvXzQdDTtvrwX
X-Gm-Gg: AYBFou15ORxdycSfnc+Axu91Bo8l5lYmKaEmL2gNJ55MHdJDsB41b2GvLOM0iQvK3cd
	QCihrVrErE5DimbiihKmqk+EgEll0K0IHzfgIAeDyXthKt+QOWL1bQ5Ja13jp+xcC7++ZjlODER
	R/yrhTxCWxfbx75b6JB64ZzE98Fr52zDx3liP4oYLOQCayzUmhWZ7YmMiCDrSuSzTXvK1wTDF4q
	ftHPcuNd7F/1cKkzwVml7x4+Shm1iw+Ijy//UA1G5Z2PX0V0pNbSZ7eDwtN1soiijhl1WbKpD8l
	ylLG3NdepMDeHMuTVWrmO/qPHJgLQSbAiLbDObo+k6gAvEsZ1serq6JCZ2vz0qo8LStZpq14cTf
	LfB3vdNmyV2ecNJEQ70dqAMyCCxT9pSrXYjpFdysL2UqVtsksu/EOobjfi7CWIMbEmzSoOVljou
	JSNKcpKdfFcnTsYqJx6Iy40FpddL8X3VW83LGn39NNHehJzvlKF6+6dDyXUkcwCk2/CKEjm+cge
	HQ++B/Njtq3XcgpLhWFC3GGCXZW2ObSERejsGLQo7nM+JYnIqyMFR85eHIwPc5gdz3wkNIbKQEV
	cbbSNM0lqE0IHf1vILZUy6jBKqndHaVFii7q+zm0oGTVK7a3aJvyp7KOFS70siAMBU2JtEH6XBP
	DKYRu74C5JQz0qyuC6vVU/yxQlfjXQzhkgOY/EkSKCXuUfqSIXMBlG8yso+OGERKXTorQITgNgQ
	==
X-Received: by 2002:a05:693c:87ce:10b0:36a:1fa2:fbbe with SMTP id 5a478bee46e88-36a424658edmr10939415eec.41.1793528035020;
        Sun, 01 Nov 2026 02:13:55 -0800 (PST)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42662f23sm29799664eec.2.2026.11.01.02.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 02:13:54 -0800 (PST)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Florian Westphal <fw@strlen.de>,
	Mat Martineau <martineau@kernel.org>,
	XingWang Xiang <v3rdant.xiang@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	linux-kernel@vger.kernel.org,
	Anil Kaushik <anilkaushikwireless@gmail.com>
Subject: [PATCH net v3 0/2] genetlink: fix joining multicast groups no family owns
Date: Sun,  1 Nov 2026 10:13:45 +0000
Message-Id: <20261101101347.3910654-1-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
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

genl_bind() checks the GENL_MCAST_CAP_* flags of a group, but the
membership bit is set later, after the lock is dropped. A socket can end
up a member of a group whose flags were never checked for it: when it
joins a group ID that no family owns, or when the family of the group is
unregistered between the check and the point where the bit is set.

Patch 1 rejects joins to group IDs that no family owns. Patch 2 counts,
per group, how many times its members were cleared, which genetlink does
when a family is unregistered. If the count changed after the check, the
group is checked again against its current owner.

Tested as an unprivileged user, with an msleep() added after the bind
callback in netlink_setsockopt() and netlink_bind(), and a test family
that registers again with GENL_MCAST_CAP_NET_ADMIN:

                                         patch 1 only   v3
  setsockopt:
  unregister in the window,
  register later                         member         not member
  unregister and register in the window  member         not member
  another family unregistered
  (must still join)                      member         member
  bind():
  unregister and register in the window  member         not member

The test family counts its bind and unbind callbacks: they stay
balanced with v3. Normal joins, rtnetlink bind() and lockdep show no
change.

The test from v1 (join all free IDs, then load gtp and drop_monitor)
gives the same result as before.

I used an LLM to help write and review the code, the tests and the
commit messages of this series. I checked and tested every change
myself.

Changes in v3:
- Patch 2: check the group again in af_netlink.c instead of clearing
  the members when a family registers. This also covers the case where
  the family is unregistered and another one registers, both in the
  window, does not walk the sockets on every registration, and does not
  touch the members of a group another family still owns (Sashiko).
- Fixes: tag of both patches: the race exists since genl_bind() first
  checked a capability, in 4d54cc32112d (Sashiko).

Changes in v2:
- New patch 2 (Sashiko).
- Patch 1: no change, added Reviewed-by tags.

v2: https://lore.kernel.org/netdev/20261031054632.3697295-1-anilkaushikwireless@gmail.com/
v1: https://lore.kernel.org/netdev/20261029062214.3407223-1-anilkaushikwireless@gmail.com/

Anil Kaushik (2):
  genetlink: Reject joining multicast groups no family owns
  netlink: Check a group again if it was released while joining it

 net/netlink/af_netlink.c | 61 +++++++++++++++++++++++++++++++++++++++-
 net/netlink/af_netlink.h |  1 +
 net/netlink/genetlink.c  |  3 +-
 3 files changed, 63 insertions(+), 2 deletions(-)

-- 
2.25.1

