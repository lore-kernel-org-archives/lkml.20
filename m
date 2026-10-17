Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2019B47DD4E
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 23:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792281538; cv=none; b=bXuMVkXQFUaGKSNSQ6ZilzYHaDJMlSfYb/gnhBICCvXCc9qa4nSGaf/M2ubo0HQEwUaLKbhNUuj+Em1Sispcm/dKW7RrxsEBZgcH63xCNvLiUEvIiRiAdFtGw2wD4buct5Q+Tau9KuYbtEI4Q7Kut3z36pSWw+//S7Um1RMgbjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792281538; c=relaxed/simple;
	bh=rOpiqxy5Hwt3SE0e9vZaPQFw0gt21K2h6bHhN6d7H3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Kn0sxgAEeoMfS3AXL6ymvPaN+dRquWCrrwpsyqhPfTdX1CXoP8ZKszRBEgrRoiATc8pqs1aI75s9/6NLjlCeVvF0+glfzcU5UkEcEN6zztmco2BBr9G3hLhxr4VlavUXDQCi2qkOV6Yfxo6AoJfKEpMV66QEcSF/rHBWLyZsLLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=EFvkYHq3; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="EFvkYHq3"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c411e139259so96228366b.2
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 16:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792281535; x=1792886335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5Sz/9HECOnKqBct7vdatnd4ZGB8n4Dp//SRsM9tOgzQ=;
        b=EFvkYHq3KIXit4kQprAlvWxY9IQLgoJVuanjwtL6wliPZxPuhhgrWFmzf3fdd7mEpc
         GBn3qL5TYJtmVKOZoXYPG5CMKvVlLTuaEmmeRH+2XTUaG+bznxfAAYVQRi49oTfNShyK
         NUCYIIuhYgYPXQxJRgeSMFMZC3mmXd75U8SRm3+2fttad7F68zDFuNdin91L8YqMGBhX
         IgFxPs+HYnP26OCWhrknXIWhsFb4wC5pzfBJyPrzeQAWTKbecGFw9cEPRsGc/MiUhMbL
         Uw4Pckq/DZ6hsMnkyX0EeyZEmBUnJJ7X9tr2En5VoFdRCHJSWnR3Y/KDk798Rdi4+7L5
         qEjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792281535; x=1792886335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Sz/9HECOnKqBct7vdatnd4ZGB8n4Dp//SRsM9tOgzQ=;
        b=CHvEeccfJA3JZbo9TDgUzmRvj/kHzJLqxeAYxC1sUqw/qF2DtiVe6R5+rlxgNullL4
         Kjb/JQBDOiiMUiyPfgUxe+2K8AoTuVzW7irFYn6rj5IfpI367aQY8c8M2FF3mIup4PPN
         nRdF820z3bUZLIDCN6nBVkPHbh8Fy+iYe1yTzzqQ9Svf9AQK0oEFTvFVhj0TSs45GULA
         e5eAtXEoCoNJLjusqO8Qmn0/CtDmFuhjJ+gKRD5pxeqEyGrES83v6il+PwGuFlEHo7nG
         p5dSkxVFWw2si23G6zXeQ/L0rIuGmmX6XLXnkseGe7vdiOEPNogfvnTl6thd3lGFHeM8
         uPdg==
X-Forwarded-Encrypted: i=1; AKwUvByf5V82DTRunP8VZd98+FhZWNjOTmQqyts2wmsrhWF1h37R9VmIugASMbx1xuR1jvYPVCIRwksu+mUOB2U=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmlXWc2Juxx3S4RTFYpg6gcyzifO8fQxSO5apBY8I2KBfoZfhH
	HHl8qZSP8wv9/UJjgEscebwxPqtwWMaORZIL3DM13Uv1ZMfpUys4X1eS2hPEySz/EA==
X-Gm-Gg: AYBFou1Xw7BFAGMQdPH29s9zRweq59fRvv/CF7dEnmcIr1z270I2bohNb3g/0kjOiQ3
	uFkZ5pXsJqjYdRra4Z37wbWuA8g3AUvxUFLWPUwZ2SFLVlzoe1RMAYB3Ah0l3onXEiI615rbk0W
	++FbiMiZ0tclESZsGLsEehNAdkD+wKrTwIcblEN3TPw8N5k4Br40ThFTThDQ5RsBa3Q3+xYh2uj
	QOM+2PquCp8HIbKWqwfwUdelTIUc3QcHkTpLej/+hzIkzRAJy6CT6SeRZ3XGpPXjwvOwkXi4ylv
	SoUN3G7tf+yHAQjiYtYrQeqqP5g3qtKul2WuS3eIVYueNdn41plWwXxhw/1UeyC1OllDqnJKW/Y
	1lnMYli3fckwKWW+FpIM0h72lqOfSpQLq1TBWEJ3kWFKeFfpC160a3o/1bD2wyhVzVwz1y3/5ZD
	vBiXo7hIUpLhh+JpUpAyITFBi2c1OAOfJ+/5+NQQ5JNRwYxP6LVWU+0NwHyjeYxKGsjdTMNKf5a
	WA3YjHlFhN7WOA0HBpBQ070qJVJ0bV0kFCV1GyBFDcLDRaF3AFMREN4fDlVtZ2gGsexP4woWhiu
	FZLnXW/NWISfP364Gr/0wtGu/awlQ/WTMCAmCSPBfJ2q4dotgc3bXBzu5551CzWXkd1sFiNbyY4
	jEC+2v93GDZKbOluCVvwoGVg/iAIr5UfwSnU4UqySt2f6r1KbRvnRcIY1DSBVYayQt/fU7iZcSf
	MCv6WFZNCqTFF0RDal0yX+BBeAH8bWTZHjgFEZHPjRHmLSeT4ZCeH7pT5NmM17BLazEx0=
X-Received: by 2002:a17:907:944a:b0:c2a:ef15:2be0 with SMTP id a640c23a62f3a-c419e73e10emr273217766b.24.1792281534993;
        Sat, 17 Oct 2026 16:58:54 -0700 (PDT)
Received: from Desktop.fritz.box (p200300f24741261000ca3161c2b9b67f.dip0.t-ipconnect.de. [2003:f2:4741:2610:ca:3161:c2b9:b67f])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e328780sm216534166b.6.2026.10.17.16.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 16:58:53 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: netfilter-devel@vger.kernel.org
Cc: pablo@netfilter.org,
	fw@strlen.de,
	kadlec@netfilter.org,
	phil@nwl.cc,
	horms@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	razor@blackwall.org,
	idosch@nvidia.com,
	ericwouds@gmail.com,
	dqfext@gmail.com,
	netdev@vger.kernel.org,
	coreteam@netfilter.org,
	linux-kselftest@vger.kernel.org,
	bridge@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH nf-next v8 0/2] netfilter: flowtable: tear down bridged flows on layer 2 roaming
Date: Sun, 18 Oct 2026 01:58:46 +0200
Message-ID: <20261017235849.1066624-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A flowtable flow that transmits straight to a bridge port keeps sending
to the old port when the host moves to another port, for example a
Wi-Fi station roaming between access points.

Patch 1 makes the gc tear such a flow down, using the bridge fdb lookup
from Pablo's patch. Patch 2 adds selftest cases.

Tested on nf-next a5e7d8e446af in an x86 guest with PROVE_LOCKING:
nft_flowtable.sh passes, including all eleven roaming cases, with no
lockdep splat. A kprobe on flow_offload_teardown sees no teardown of
the test flow during 10 s of steady traffic in any case. struct
flow_offload stays at 296 bytes on x86_64.

Changes in v8:
- drop bridge_ifidx and bridge_vid (Pablo): the bridge port is found
  from out.ifidx through the vlan devices the forward path has below
  the port (new port_vlans field), the vid comes from the encap stack
  (new bridge_vlan bit) or is the pvid of the port for an untagged port
  of a vlan_filtering bridge
- move the fdb check into nf_flow_dst_valid() next to
  nf_flow_dst_check(), and name the hook fdb_valid_dst() again (Pablo);
  it now takes the bridge port device instead of net and ifindex
- drop the comments Pablo pointed out
- selftest: vlan_filtering with tagged plain and vlan ports, the router
  address on a vlan device on the bridge, and vlan ports whose real
  devices are ports of another bridge; no forward chain packet is
  allowed once the flow is offloaded again

v7: https://lore.kernel.org/netfilter-devel/20261014235628.197976-1-julius@bairaktaris.de/
v6: https://lore.kernel.org/netfilter-devel/20261004171605.3544792-1-julius@bairaktaris.de/
Pablo's patch: https://lore.kernel.org/netfilter-devel/20261014210256.1573072-1-pablo@netfilter.org/

Julius Bairaktaris (2):
  netfilter: flowtable: tear down direct xmit flows when the fdb entry
    moves
  selftests: netfilter: nft_flowtable.sh: roam a host between two bridge
    ports

 include/linux/netfilter.h                     |   7 +
 include/net/netfilter/nf_flow_table.h         |   8 +-
 net/bridge/Makefile                           |   2 +
 net/bridge/br.c                               |   2 +
 net/bridge/br_nf_utils.c                      |  38 +++
 net/bridge/br_private.h                       |  13 +
 net/netfilter/core.c                          |   3 +
 net/netfilter/nf_flow_table_core.c            |  45 +++-
 net/netfilter/nf_flow_table_path.c            |  19 +-
 .../selftests/net/netfilter/nft_flowtable.sh  | 239 ++++++++++++++++++
 10 files changed, 371 insertions(+), 5 deletions(-)
 create mode 100644 net/bridge/br_nf_utils.c


base-commit: a5e7d8e446af9803e37a3b6a4d416fb41178348f
-- 
2.53.0

