Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7898577E3B
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 13:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788960779; cv=none; b=JzaNVJgSBrhV5d6/g8snyiDjCnrDweqWmiCmQf4z+ZnhRM51BNh2VI4XMxuo/7yw/6ikKvrqusIFBW1kuCOXwkF3+/7XD1k2fdsTfgGeXllAq60lv97DHplVDBzZzPx32hvymn3fu+2aYUDcsATafpZZjSBhPlSaWuyPCK9XdjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788960779; c=relaxed/simple;
	bh=8Cxs1swI4BazcAdCuTGtcvH4qiVFXfzzgesxxRAK/UA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mquS7pa5CndSYveUXmUZ8GGimeZvaaA2POnnVZtTaFAfu61/z28p3B/+dewy6TtfYzhVZixxjMxPcfU7vDUzMqsBY1Xz1PffBL54mYAXAz6YQDn0lcGGarGv3ZX9meoOau2UL6KP6pKlwqpGmbDpb3AYbEfuBhjDAqwSzmYCTwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J4mSDywS; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J4mSDywS"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso5072024a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 06:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788960777; x=1789565577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IYWWqOrH0BFKdSQbag3FfKUxf8azbOar4qW5b2e3MNY=;
        b=J4mSDywSNys5skQHDJWouK+7/9mX2dhD/tWVcspI1faI4n2nnIXQtyiq4OVptMO7SS
         UKa4gQ0tTXCa4gg3+3SS+AhgDC3G3CBIQ67Jb0Be7p//0O7tI9+w98pbWXRNmHEPDuvb
         DyKfV0/wy7OKKx9aR7nb3RDAsXXkyO9ww7y5yQdic645I4LueswTPsNKOzbce3nRjcI5
         lcPGX4r7I2LLMN7kaBoFmJNYB0qgHNOSF4gPw2pzxuuqd3m7mAG4Ula4kk/Q4ToxI1a2
         Yeolio3I3oX4XqJGcw6Zf7qxokAelXjrGSwonUfAsMPm0RVQ0g1vJHqO/sR3UND2t5vP
         6xHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788960777; x=1789565577;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IYWWqOrH0BFKdSQbag3FfKUxf8azbOar4qW5b2e3MNY=;
        b=LIsXt8VITdDbx+p+qQY7gRfqWVPWqo8+oLSuJLleHs4Y3WGl8c3Tyg/CJhDxidSygK
         a/zi54PjfqpT9IWgY/44/7rlCYGh6OeAKW0YaYtB7yn+UJv5HpToYcJjQFm/xALARbYU
         s8kEi40a8qt3H4AuMuHjKNii2dHM/2WQXJVzIr+hKWenjguh7T0G6tRnI4bCU53z5EEF
         e8c2LzY+acxeDVlcTtvKEaOI05UrVlmfqxCakZJK3CGO3PDkd5EUAGWGuHyQfOeYnAZI
         3vfWbmckS2Aq3dY2QmjHE43muhsqT/pOWmrQvWAFdzGmHXKYyIu4dcVIyeXSM7nruxXv
         VjIg==
X-Forwarded-Encrypted: i=1; AKwUvBxlqbb1Ico/8S4bmLW4eNzjKlgmerq3gsV3sRbBj7Dcvdp7H9puG5JvDl8Q3MrL6D0uY7UW4odZi459EAs=@vger.kernel.org
X-Gm-Message-State: AFuF++nzfXz7FR0WYo/mnlF7r+jjGh7tIcnBMZe91W9BnjXp0Y8rM8Ah
	2smWRlGvsTjEGCjG5mUacZYimr9WMPGpIssY/bAcBpGAa/NLBhsHWq1c
X-Gm-Gg: AYBFou3jHLN1RFT8K09fqsCFjc6A6locupqiVvhvtF8pFrMq4dFgMb3IlagHCAToQwI
	+FDMQJGb+comcQJtARe6DIfVIef9IVhgy1RBch00V+GvJvzHsvQM4wdCMnYXncGqhq5rBIptEXV
	QH+MpEYzPUKMswXRXBhjuZduf7jaQ0G6Kih0KKfU1DdZ+VQky/WxLmzh1L/QlEOGlKSh/elBtij
	NsEEZ+Nr9M2N2oPnd2cxTuyx5heYxGf5H6C0Hs7ux4MLdELZ6oPw5e068jmDP9kz+U9CC3SQxcl
	7qv94VB8KsHMSA2fg0+LSRNfBQ27RY79sEVrL7CkNC/WwI2+KoeKuQJQOtwMQkmMz1HZQnMaMLj
	ntgxEYODDSYVOhrWreHMgiRH0N4aCcH2efE5pWKHrQ+KlXaO6HsZ8wCGvAzWTV7p/8vshMEqmdK
	MVHaPRRrv4qkeAJe5vRluIWKyO+3babWquQM8gD1ibTg6V8rf2fN9hUYhLPPVwSMrxmqITaVoVg
	ate4O8NGQYTGG847AVk7TdyIUQUrFO3w7qxQ8K48kKPuSmUH0/q6jjf85zCLA==
X-Received: by 2002:a17:90b:5287:b0:38e:6a44:671b with SMTP id 98e67ed59e1d1-39b25eeeef9mr55298249a91.0.1788960776711;
        Wed, 09 Sep 2026 06:32:56 -0700 (PDT)
Received: from m-upc-A520M-HDV.flets-east.jp ([2400:2410:3f60:500:574b:e1a5:307b:15c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae8af3sm72564185ad.80.2026.09.09.06.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 06:32:56 -0700 (PDT)
Sender: Yuyang Huang <uyoko90@gmail.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Ido Schimmel <idosch@nvidia.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	Nikolaos Gkarlis <nickgarlis@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf.kernel@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v3 0/4] rtnetlink: dump link-layer multicast addresses
Date: Wed,  9 Sep 2026 22:32:43 +0900
Message-ID: <20260909133247.113923-1-sigefriedhyy@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"ip maddr show" prints three kinds of entries: link-layer, IPv4 and
IPv6. The IPv4 and IPv6 ones can be read over netlink today: IPv6 has
had RTM_GETMULTICAST for a long time and IPv4 got it in eb4e17a1d915
("netlink: support dumping IPv4 multicast addresses"), with IFA_MC_USERS
added later so the user count no longer has to come from procfs.

The link-layer list is the missing piece. dev->mc, the addresses
programmed into the device filter, is only exported via
/proc/net/dev_mcast, so iproute2 still carries a procfs parser just for
that. This series closes the gap so that "ip maddr show" can be served
from rtnetlink alone.

Patch 1 fixes the type of target-netnsid in the rt-addr spec. Patch 2
handles RTM_GETMULTICAST dumps with ifa_family set to AF_PACKET and
walks dev->mc under netif_addr_lock_bh(), no RTNL. The reply reuses
the ifaddrmsg format of the IPv4 and IPv6 dumps: IFA_MULTICAST carries
the raw link-layer address, IFA_MC_USERS the reference count, and a new
IFA_F_GLOBAL flag in IFA_FLAGS marks entries added explicitly, which is
the "static" column /proc/net/dev_mcast has and "ip maddr" prints. A
non-zero ifa_index limits the dump to one device and IFA_TARGET_NETNSID
selects another netns, like the IPv4 and IPv6 dumps.

Patch 3 updates the rt-addr spec and patch 4 adds a selftest that
checks the filter, the user count, the global flag and target-netnsid.

Nothing changes for other families. AF_PACKET dumps returned
-EOPNOTSUPP before, so iproute2 can keep the procfs fallback for older
kernels. I have the iproute2 side ready and will post it once this is
in; with it, "ip maddr show" does not open /proc/net at all.

Changes in v3:
- Report the static bit as a new IFA_F_GLOBAL flag in IFA_FLAGS
  instead of IFA_F_PERMANENT
- Support IFA_TARGET_NETNSID and test it
- Describe global_use accurately, it is also set by dev_mc_add_excl()
- Fix the target-netnsid type in the rt-addr spec, as its own patch

Changes in v2:
- Always validate the request header, not only with strict checking
- Use a single "with" statement in the selftest (ruff)

Yuyang Huang (4):
  netlink: specs: rt-addr: fix the type of target-netnsid
  rtnetlink: add AF_PACKET multicast dumps
  netlink: specs: rt-addr: document AF_PACKET multicast dumps
  selftests: net: test AF_PACKET multicast dumps

 Documentation/netlink/specs/rt-addr.yaml |  17 ++-
 include/uapi/linux/if_addr.h             |   1 +
 net/core/rtnetlink.c                     | 165 +++++++++++++++++++++++
 tools/testing/selftests/net/rtnetlink.py |  71 +++++++++-
 4 files changed, 248 insertions(+), 6 deletions(-)

-- 
2.43.0

