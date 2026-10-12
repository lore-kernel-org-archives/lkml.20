Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25362AD2E
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 01:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791767838; cv=none; b=nNMoP51bdxvGytjS4tZ5HagBKAI4BHyGmaLFSEZG3rCTtEuz1DUiYHHiSJh3Q0XMUiKf6+3cU/qqu7un5jOV4BKifVtotKvmNEE/E1TaZS/OXK0DxD6eEFdDRnWCRJni0WQOebVsinGNROvrPXNCZ3icWf8DmcOu5X4/vDWe8QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791767838; c=relaxed/simple;
	bh=f9OqVQRTl+RsOTJdCEieHRhe20rLRHVgPk2WCcq/hCk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mp0hWLx8BtpqUMsU5EFKCCGDR+vY/qHV+BBPsvGlYuXTp+da2d6uKMpwKhGF5STDjenFeynXjRsvG68YPRFgeorhNgg1y7dvbL2c/xQuga8kgUO1kuPxR9pttPv9POYjQRbox2mKP4NMV2FN+Hc+f1CU0lqVrpNERbi7IaDq+Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D5ntySTK; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D5ntySTK"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so629400a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 18:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791767836; x=1792372636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HVAtScMA0Gu/eshIKxcJc5e1pXYr3Zfr1cY3+NzAluM=;
        b=D5ntySTKjsCKR9SWPN5mC0aJGtfG1mongNfzmqMze+dEp4bgg5KGHxyg5MTDnhVQYN
         pgD0rR1wWRshCKSSZvzeRXORLc6AZr0J8Ylil7waBNsgCHoGnLp6cObdtV2/sQTFAB1I
         X0OCwxpgDwDxCWrjWXjnnngyvOfBrAMrUVDMQVM7MUTQfYqQlf0gtl4cKGElHmt2JHtj
         sAm4+QtflqQPfZlJ7+NS3yl+TXA5+Cnqix4/PgS4R2G/cbAHKQIT6LfKvg68QQs1NhDk
         nOFpQ3t6NSYspvRPn0OCt5XBjHiaEchYwgq4TYWdTcA/2OWlugm1J34Nxj9BE0HoT7bj
         KA0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791767836; x=1792372636;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HVAtScMA0Gu/eshIKxcJc5e1pXYr3Zfr1cY3+NzAluM=;
        b=T4Yq7iN7U4Om3uVxVxjXVhi/u/y9Z4JsEZsXM8NNokOojn4xbkmqOf2V38/pa0OD9u
         iaTJ+AQ9nkdQNCidlJxFAtLckn+mmVC5ZtcgEZKWzQpP7BV9P2/xJk4JS/gywbOXxfEA
         OZ4Su0xxcSqXDH+RE+w8+KuI7/eWdfnsUzQQCjRtJ0ctA0GHfmu8YdP7ebK2ecx5CHT5
         MMjh4yOYCZFPYIEm834P+hZp2C2rhuFpxRLRLHUEl16ojgNes50Kb3hPOTg3NoPYa/UM
         J3zcnD8GYPvrJN8EKhIm007J3kzoh7Qg9CUjWYMFnEwqmSBJHunDdm/57x5LU5M7g1A/
         M7Cw==
X-Forwarded-Encrypted: i=1; AKwUvByDgqdGUuMFmcxp4t51Ud5a3ie9PolEeQ7QYBA505M9tT+x3miKTR3qHNAJYQtEwbRFo2qxLrh2C96AQ5g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKaL+wZP4+EBLTfJ6KShXV8G/oi1B7/PjilZrtKjPg9KgMKjWKH
	xNR3LezLSih+vObzCr0USYGxM2fkxm45mu5SGqJxv0ULCFOumbaYfCV/
X-Gm-Gg: AYBFou2DjMOHGJ/S2u56jo/5PYiteIuTMy9HcCBWnFC4++qA/E70CYCJkI74ZAcCu3D
	ctnQj4D0UWCgsGbykUtmcr5q5pA6P80G3gReKLZx1t3qQY1jK74MMzPdUzBTQAFNA9Z+9VdwORm
	ZMsgip3UGh4gnUrfCi0VmnwKyjmdr0qIVcjo8lkI7sdEkejnJbTQ9Gmsr17moEyDQR2vnWllHqm
	qzV85ZY0LUgWQdnKunN1n5QchiVpOBk4ZlCK2lvoMVlk6yBoYyrfYa+ME5HRt9bzWTROLEwiTIA
	YD6IG2SG1i3qHa/DH+lumk9te/NSEDSdO2NpPfC//UPhPNJBuAf/QCIQ1HWqRy3KvIh6o5AUvZO
	nmF1BFyAw8bnI4EoA9cfStCOrT+26dvP1zvlF/fmlAd5C9a569/vaAvG0+Muw7u37pJqB+IKXkg
	RhErjmpK0/9PvyJqcFD5u0lqYO3VDIGVvV5DnIOXdn3Hhbegg2Rc/b9ww/3mVYRpLsja6VuFj4k
	rJBU0tSky12qnQI0tVPF0ZyeyI7iGkjokuq8JZp9HLYGnJxJ7RGzxsM9zqcnDhOyOd2NSsY2riD
	O5L7HreOXjI=
X-Received: by 2002:a17:90b:3b84:b0:3a9:8482:420 with SMTP id 98e67ed59e1d1-3ab3a8e55aamr6706622a91.40.1791767836191;
        Sun, 11 Oct 2026 18:17:16 -0700 (PDT)
Received: from m-upc-A520M-HDV.lan (oki-109-236-14-10.jptransit.net. [109.236.14.10])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38dd5864sm13743307a91.8.2026.10.11.18.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 18:17:15 -0700 (PDT)
Sender: Yuyang Huang <uyoko90@gmail.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: Ajay Singh <ajay.kathat@microchip.com>,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	"David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Ido Schimmel <idosch@nvidia.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>,
	Kees Cook <kees@kernel.org>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	Nikolaos Gkarlis <nickgarlis@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf.kernel@gmail.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Willem de Bruijn <willemb@google.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v11 0/6] rtnetlink: dump link-layer multicast addresses
Date: Mon, 12 Oct 2026 10:17:01 +0900
Message-ID: <20261012011707.3378-1-sigefriedhyy@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"ip maddr show" prints link-layer, IPv4 and IPv6 entries. The IPv4 and
IPv6 ones come over netlink today, with IFA_MC_USERS for the user count.
The link-layer list, dev->mc, is only exported via /proc/net/dev_mcast,
so iproute2 and other users still parse procfs for it.

This series adds the AF_PACKET family to RTM_GETMULTICAST so that the
link-layer multicast addresses are reported the same way. Patch 4 dumps
dev->mc in the ifaddrmsg format of the IPv4 and IPv6 dumps: IFA_MULTICAST
carries the address, IFA_MC_USERS the reference count and a new
IFA_F_GLOBAL flag marks entries added explicitly, the "static" column of
/proc/net/dev_mcast. ifa_index limits the dump to one device and
IFA_TARGET_NETNSID selects another netns. Patches 2 and 3 add a
generation counter for dev->mc changes so a multi-part dump reports
NLM_F_DUMP_INTR like the IPv4 and IPv6 ones. Patches 1 and 5 update the
rt-addr spec and patch 6 adds a selftest.

AF_PACKET dumps returned -EOPNOTSUPP before, so iproute2 can keep the
procfs fallback for older kernels. The iproute2 side is ready and will
be posted once this is in.

Changes in v11:
- Sample cb->seq before each round and again after it, and skip the
  check in a round without a message, so a change after the walk or
  before an empty round sets NLM_F_DUMP_INTR

Changes in v10:
- Rename the list owner to mc_dev and set it for dev->mc only
- Sample cb->seq once after the walk and check it once per round,
  like rtnl_dump_ifinfo()
- Read the count through netdev_hw_addr_list_count() in the helpers
  file, note the init exception in the _count comment
- Fix the FDB remark in the dump message, bridge and macvlan use the
  default FDB dump
- Say in the spec doc that AF_INET and AF_INET6 honour target-netnsid
  with NETLINK_GET_STRICT_CHK only
- Drop the Reviewed-by tags of patches 3 and 4 after the rework

Changes in v9:
- Change the count of a netdev_hw_addr_list through helpers only and
  rename it to _count, as its own patch
- Use the count helpers in __hw_addr_splice() too
- Note in the spec doc that the header checks are unconditional for
  AF_PACKET only

Changes in v8:
- Set the owner of every list a device has, not only dev->mc, and
  check for dev->mc in one place when bumping the counter
- Add __hw_addr_count_inc/dec/reset() so a change of list->count and
  the counter bump stay together

Changes in v7:
- Add a per netns generation counter bumped on dev->mc changes and fold
  it into cb->seq, dev_base_seq alone did not cover the dumped entries
- Sample cb->seq under the address lock of each device and again when a
  dump round ends, so the NLMSG_DONE check sees a change too

Changes in v6:
- Move the dump to net/core/dev_addr_lists.c next to the dev->mc
  helpers
- Stamp cb->seq from dev_base_seq and check dump consistency
- Let an unexpected dump error propagate instead of skipping
- Check for an address only present in the peer netns in the
  target-netnsid selftest, the peer and local ifindex can be equal
- Document the ifa-index filter and the zero header fields in the spec

Changes in v5:
- Filter the target-netnsid selftest dump by ifa-index, a new netns
  also contains the fallback tunnel devices

Changes in v4:
- Reset the resume offset when the device the dump stopped at is gone
- Use a tracked netns reference (put_net_track)
- Say ifa-family must be set in the spec doc, drop the AF_UNSPEC remark
- Close the netlink socket and guard the checks in the selftest
- Drop the Fixes tag

Changes in v3:
- Report the static bit as a new IFA_F_GLOBAL flag in IFA_FLAGS
  instead of IFA_F_PERMANENT
- Support IFA_TARGET_NETNSID and test it
- Describe global_use accurately, it is also set by dev_mc_add_excl()
- Fix the target-netnsid type in the rt-addr spec, as its own patch

Changes in v2:
- Always validate the request header, not only with strict checking
- Use a single "with" statement in the selftest (ruff)

Yuyang Huang (6):
  netlink: specs: rt-addr: fix the type of target-netnsid
  net: change netdev_hw_addr_list count through helpers
  net: add a generation counter for dev->mc changes
  net: add AF_PACKET multicast dumps
  netlink: specs: rt-addr: document AF_PACKET multicast dumps
  selftests: net: test AF_PACKET multicast dumps

 Documentation/netlink/specs/rt-addr.yaml      |  21 +-
 .../net/ethernet/cavium/octeon/octeon_mgmt.c  |   4 +-
 .../net/wireless/microchip/wilc1000/netdev.c  |   8 +-
 include/linux/netdevice.h                     |  11 +-
 include/net/net_namespace.h                   |   1 +
 include/uapi/linux/if_addr.h                  |   1 +
 net/core/dev_addr_lists.c                     | 251 +++++++++++++++++-
 net/core/dev_addr_lists_test.c                |  18 +-
 net/core/rtnetlink.c                          |   2 +
 net/mac80211/driver-ops.h                     |   2 +-
 tools/testing/selftests/net/rtnetlink.py      |  73 ++++-
 11 files changed, 357 insertions(+), 35 deletions(-)

-- 
2.43.0

