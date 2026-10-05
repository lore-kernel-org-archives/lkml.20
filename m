Received: from mail-lr2-f32.google.com (mail-lr2-f32.google.com [74.125.230.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7978B36F90F
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 20:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791231265; cv=none; b=MPI4p6QWYBfPk6OHnXMl+393PCQYmbU98DXUtt05jEfFPMReV4pmweUnezFJagFZaKjyb21eSkLpOwFUp5eMpIle3xSpYTyGAgkF2TW6/3AKR6nheZ0K0gjvzlsFckYk3Ueo/fGzjFrVstcqVCv/fWuUL1H2iAau6WvBglLIzZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791231265; c=relaxed/simple;
	bh=VJtZChjk1YzuZkS3wi8cphgv6wsquzVP5wCjRV9LqzM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a44JozISivqycbdYey9VYTx6sVX5yqLRG1Sje2rWVLW2ipmMGfOshhV3rp8Bp1zqLgyTbFhczLvGJVeccyPe8aF7T0JY2lzepgHgskkc3dhrdX+kynCRitjFxmmmB6GnFaCrrP+0lYRpTYYJPEiQ/PVmtP2ORYjXbpxIWDy0Qn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yi9Tn4SN; arc=none smtp.client-ip=74.125.230.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yi9Tn4SN"
Received: by mail-lr2-f32.google.com with SMTP id 38308e7fff4ca-3a96c77840eso23107551fa.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 13:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791231261; x=1791836061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pikQ4+zyEB4/ceyMLU0ilImsRw9sRxceQzVMlJ5+60c=;
        b=Yi9Tn4SNntOnBkpuHQBBrjCpPkYIvdZ4JSD2NJz4uvmcmB8pHNRyOGMsrViTPiFVFE
         +mxgG+v54WTJUVgOBmk24377zxS/tZywzQZvkD/lySRPEqEX0zmF3F/k7RcvLD6RVxlJ
         CDAeG+QpMgoDg86ny1p3lvbvbYIeHN8UJVNbDNQBPxWlmdEsTopj+pxqq58PBj4U2/UW
         FLqr5mosDoHP2QME4CAuFGXskVrLq3O6RJsa9uyahAvhpSefwTD4lgvlXAVtKdyM0vws
         /igv/DjlGuVKyhjkz8nxJQ/zeo5z3A5efjJNgwKMX4Pm0nDYjzIm5VPmRBIba14IKBm0
         WBTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791231261; x=1791836061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pikQ4+zyEB4/ceyMLU0ilImsRw9sRxceQzVMlJ5+60c=;
        b=00lehJgg2KSG9fV7es9m3+OeLfW/LMjYKXp9AgjsajuDYNEu3vj0rEitzkPGPFOGpa
         HG1wf5IgzPvzS+Ko6egtBS6Fl2SGCXeku9zTXHA/86VvdwpdoBRt2XPWaPwLO3yd05/U
         rjPgfTshLPl7whfbHp5Q/5Ike/VPH9r/rTArUTkscmCUIni3mql3AQH28CkRpMaorbxa
         LIj+zHazVx5VDjMnDjOm0zn0mZvVD2ORftPYpyB0SSpTB5E59Dy1AxnkfdXWN+PUWgug
         WsAOt6mJeGZiHynMUJrtGZEruzEl+q21l9Q5slyXkQChwFUGnrLXlxWySPOGkTCN8sSM
         E9Nw==
X-Forwarded-Encrypted: i=1; AKwUvBxXawqdGPJP7Q2MSzuMhw0gGxZOovX2iH5hZAcRfFR+ZzKzJSu9O7Ad0QdNKSCFnkpkNy+TcvqxntfE+8E=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3nhyc+bl2SEjX7B/ax7ho9BjbaxqelkR4ASEhqnNDMgO9wY8U
	eWHImoUKhx5BCGBeqPZMHbdTOFH6DtsDXXesZ7r2/fUa249tgjG4Qhlh
X-Gm-Gg: AYBFou32QER+6QWYLK5hCOV++xPHh8OdkPks7Sc59VCatIuCriCZnsrSSGC3v/q0kp/
	NGpGgYbPkDZ/L6+y4VGXEOv8eBYJ23oDdcwPsM80fohKDe0KoGM14aFCsXkBM5NL8dJDROCBOcU
	Tz9glqmO8ZGMDPAX+iIb5zGPWcZHeYn4meI9zdYXo4gpoWT/CpAXCa05x1YB13IO+3l7eU+MuCT
	gRdskKFP/0zRou9ooCOSp+BRLPAxF5SntVeX1Z9mpMd52jbcW6/whVJCJMB5+SmXhXzp9T/Az+g
	oExWHWuoAqxLGZlUGcw5hLbFDnPU+cXiGfWEtsrr2s73Fitm2k2SC6j3ruzkGJ0ee8eYRdirGCl
	QlRBa95XALOIziolbdHgUYgOKEVuiVg8m8Cnw1xsEYB3J8nJGTtHVp6YhMpLEfby5Wv5Z5/Qn9h
	qXl4u7fbd8XBAf0Pyc2XP/Vb86jfe1DAC0CeCNhuXSWBCx6EgqSEyI7s//MMohUZZkVtNj2mB4g
	LGiiXGIK4PWFV/PZGG3/d8SemZmn+IOPgE8r5g/QJPJevo7f0wU
X-Received: by 2002:a2e:be9b:0:b0:3a9:82f2:2a4a with SMTP id 38308e7fff4ca-3a982f22cedmr15653411fa.20.1791231261231;
        Mon, 05 Oct 2026 13:14:21 -0700 (PDT)
Received: from dau-home-pc.. ([212.35.161.1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e303889sm43114681fa.20.2026.10.05.13.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 13:14:20 -0700 (PDT)
From: Anton Danilov <littlesmilingcloud@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 0/4] vxlan: generalize and refine drop reasons
Date: Mon,  5 Oct 2026 23:14:13 +0300
Message-ID: <20261005201417.906344-1-littlesmilingcloud@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series makes two vxlan drop reasons generic, so that other tunnels
can report the same conditions with them, and makes the reasons vxlan
reports for two other failures more precise.

Patch 1 renames VXLAN_INVALID_HDR and VXLAN_VNI_NOT_FOUND to
TUNNEL_INVALID_HDR and TUNNEL_NOT_FOUND. Their values stay the same;
the names vxlan drops are reported with change.

Patch 2 makes __iptunnel_pull_header() and iptunnel_pull_header() return
a drop reason. Until now they returned -ENOMEM for any failure, so a
packet too short to pull looked like an allocation failure. The three
callers in ip_gre and ip6_gre that tested the result with "< 0" test for
a non-zero value instead. Patch 3 has vxlan report the reason these
functions now return: PKT_TOO_SMALL instead of NOMEM for an inner frame
shorter than an Ethernet header.

Patch 4 has vxlan report a route that goes out of the vxlan device
itself as RECURSION_LIMIT instead of IP_OUTNOROUTES, and adds this case
to the description of RECURSION_LIMIT.

These were patches 1-3 and 14 of v5 of "tunnels: add core and gre drop
reasons", split out as Ido suggested. The conversion of ip_tunnel,
ip6_tunnel and GRE, the rest of that series, will follow once these
are in.

Changes since v5 of "tunnels: add core and gre drop reasons":
- split out of that series (Ido)
- the messages of patches 1, 2 and 4 no longer refer to the rest of it
- the message of patch 2 says that vxlan keeps reporting NOMEM until
  patch 3
- patch 4 adds the tunnel case to the description of RECURSION_LIMIT,
  which v5 did in its patch 9

- v5: https://lore.kernel.org/netdev/20260930183910.3151873-1-littlesmilingcloud@gmail.com/

Anton Danilov (4):
  vxlan: rename the drop reasons for use by other tunnels
  ip_tunnel: make __iptunnel_pull_header() return a drop reason
  vxlan: report the drop reason of __iptunnel_pull_header()
  vxlan: report a circular route as SKB_DROP_REASON_RECURSION_LIMIT

 drivers/net/vxlan/vxlan_core.c | 26 ++++++++++++++++----------
 include/net/dropreason-core.h  | 25 ++++++++++++++++---------
 include/net/ip_tunnels.h       | 10 ++++++----
 net/ipv4/ip_gre.c              |  4 ++--
 net/ipv4/ip_tunnel_core.c      | 22 +++++++++++++++-------
 net/ipv6/ip6_gre.c             |  2 +-
 6 files changed, 56 insertions(+), 33 deletions(-)

-- 
2.47.3

