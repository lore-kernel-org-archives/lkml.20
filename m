Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794925168;
	b=WTnRWqLqXeN+uMHufC9R1m9pisO9+Ksby+QgDdENtsU3aQc8++/7ghPWxNixQGuVihDw
	 RJ9jlX22nIqHr1soLONZVS3pkzQmkCqsvbsgSgFjQXFE4PIsY89x5/Cb5bpxi1EwV+tmn
	 F7iIO0dY5fvBHUoO+81Xm8j5Efw7i0AMSbA9p+jiLxpqOKBMgtdEatLEo/s87hVC842/X
	 YsI3qNWG2T93Ug41FoeZqNOIhGDYWNBAhT+DQwv8OkmRpgBkmjMzai4mHXCGXekp+3hkz
	 PpdwNFdswCQVgo//JD3meTQPfdSyHwUxG+DAuEcptgleM7+puPSycH+ZyOJXMKDHKRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925168;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vewm0YM3mK/oI43WitLGRasKLJvDnFpqAzBQT6/SwaY=;
	b=hBaRaDH982jxCajzFXfjks/G+QAAsbSJ7pG4TuL6b/0qp7Xmm/yz3U2L9IzyebXVH/K6
	 cRUfYWXOg/9ahUEpXgeyN26xE5IYXy2U9iYAeub0XOWPVEFxOPZg56CQ72jvm8Ag123Vu
	 StX9QPD+qQE3AzU3uT8OPvxGEM1arEVdMG+/xbXr4WXEHs8o1KYojFdLQWr6gI2tksiF7
	 eGQO1fceGc9iknd3j82xDV81wsungtTJkipuBJcQS3R1CVhtldy2qISE2EwkyRT/O+IJg
	 ejip+Y05yGVvviHd69YELgPnAYc8GTXFFQFd7BI6axdeK4O3jPrH4g0m/JEDPnGyH7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g1mIG94u;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B392A606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:19:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B392A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g1mIG94u
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c50686daf9cso69877766b.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794925166; x=1795529966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vewm0YM3mK/oI43WitLGRasKLJvDnFpqAzBQT6/SwaY=;
        b=g1mIG94uiwF/vwzgPogrWrr49hBBpuWyaBIfHz0VTF/3ud2fMbXGndfciZGknZ/oso
         Unrn2lL/ffxpHHfayW1ZDifeh2AT1/y/drksrPb1V7xh51akTN8sGKAlGIkfyizmLKwS
         emUd4aZ22uR5Ix9O4mBnymnW2NRNZVmi811c/8E4B152pLU20y3aVNnigmmAZCG9WFaD
         fe8bVTzXtLSzt5KR7E8Gqh6Af7Z6fTrncNsyQlv9sO9KEyjYUT5HoSbs/iSw40u9nHcX
         5aBFa4VryAg5TmSOmvsApllXv8XaVk5dHUXdGMiwEZ4CJV0pzYxNkaDv02oaNY4Y0YD3
         QqMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794925166; x=1795529966;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vewm0YM3mK/oI43WitLGRasKLJvDnFpqAzBQT6/SwaY=;
        b=x2fVyD3pxMtMnnvAdmlutdN9SR5ue5Cvz9Xs1r5uXptd4JKgFlVtO5zl/GeqsGUbHY
         aIdoGYgiHUXuIeLWmJ0AEbbSglJtQcj18QNKIGM4lB6fBHcoA6da2v9w4rPF4gfLegmu
         goxYWzIcWx1xP2DlgelpI/hP4nFw41kTaodeLZuZhqeF+z+m4j5PPWifCbB7cUMiJ6VJ
         xSRU1eeCbcrmqlaZ7J0B8DfNWyJNAMG05wxMyfVlynl5tFqEd/83GsZJ27GFzgYbMXll
         ES+WzF/cEU63K0KP0SalUtGh9swEGHDOu9gp8pJdTbAASZJTQEU6MEpm99eFsluHHcfC
         HnqA==
X-Forwarded-Encrypted: i=1; AL+hErHmufnoEVLzJcfxRBewtg03G72jczBG1MNRwXEjqGJUe/sJGE3j76tKyt0zVAc0QWw+9XZU0cqyqwWg9Ls=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4vCwTlfeo5wZ1VHyfYzPcRr5DlZ10vU7hf/PuTFzT8Z3h5cTq
	SEEMCr/5sT6tUupa2DNM4LA6Z20G5TARt94AZcPgeDm00d8Y1ltEzcf5
X-Gm-Gg: AYBFou34d8Nhnp6Pq3qe41iuKy9czrWTBzv/FDuOgRfiv16BmDSph0YlfpL52odAG+G
	f4SWcP8DsUeEv4K19ImnHoyG/WLcqH+ATkTejQu/KEFM9Qi36CUMjgTeblzPqHqnRO9Z9HRx5hn
	MhmRJjp4X4OrlMefUFt2VNc8CdreYYYfj+u5DecUT/vzRX3tFXvaUM6XCqhceC09W9LDic3NKeG
	oCTi4j31xpiRqG+SwVJA5wELKj6hVJKwuFUpenvBaDOAplDNIQdXntb7y1gev7aTlupkB9aSdBU
	V6Bd3h1aQ2khG+BksFhHRYaVnEEb1/V7TvwNiZkA3jOhEj92tfAeRsYQiqPWwb6pSV5jJHosRkG
	HfoQW5CMM6hNVhdnjysnV9mfIFwtqR/s3Qw8TDaXmGh4REdbbFR4bHcHYBb8LCgjjTmSFEh31vD
	77Qeh3MB+/fKB9W8EHKdN5OijvVTQQMJ5IjWmn5vcn6IC4y8aT2XJYGLtjE7OeWNAc6ElPIUpZX
	JGIBGw6poouNiargXs/5OtH4Yt52riU5u994WtJxI/rgIMZgxi5mj5zb2ePdJ47nw0l80TlHQ0i
	elEO2Cxnu9JWr73I3YxGrNj3mC8KcjPw9OwhI4orqh/axPcm9LMXlke5h8v60C0OmOBKzdbWHOa
	K2MeOwec7+jGY0hic6cNkvudPnTy4jOM+A132J+sYHt0UTHsyA5OOlNn636s3cQELzXc5ZRZMim
	jVaOaJLA==
X-Received: by 2002:a17:906:2441:b0:c41:8e21:4d62 with SMTP id a640c23a62f3a-c509614d4d7mr1248867266b.1.1794925165807;
        Tue, 17 Nov 2026 06:19:25 -0800 (PST)
Received: from L-022584.energy.envision.com (dynamic-077-184-154-007.77.184.pool.telefonica.de. [77.184.154.7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5abf3sm545215166b.12.2026.11.17.06.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 06:19:25 -0800 (PST)
From: Xin Xie <xiexinet@gmail.com>
To: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	andrew+netdev@lunn.ch,
	shuah@kernel.org,
	kees@kernel.org,
	petr.wozniak@gmail.com,
	qingfang.deng@linux.dev,
	fmaurer@redhat.com,
	luka.gejak@linux.dev,
	bigeasy@linutronix.de,
	xiaoliang.yang_1@nxp.com,
	skhawaja@google.com,
	liuhangbin@gmail.com,
	stable@vger.kernel.org,
	sdf.kernel@gmail.com,
	xiexinet@gmail.com,
	lukma@denx.de,
	fmancera@suse.de,
	danishanwar@ti.com,
	sunwenbo@cmss.chinamobile.com
Subject: [PATCH net v10 0/4] net: hsr: fix super-packet forwarding
Date: Tue, 17 Nov 2026 15:19:18 +0100
Message-ID: <20261117141922.20-1-xiexinet@gmail.com>
X-Mailer: git-send-email 2.47.3
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

HSR and PRP tag, number and de-duplicate each frame on the wire. GRO
and GSO can hand them one skb holding several frames, which the lower
device then drops or which goes out with a single tag or RCT and
sequence number.

Patch 1 keeps software GRO off on HSR/PRP ports. GRO_HW that the
driver keeps on is left alone.

Patch 2 refuses bridge, bond, team and OVS masters as ports, a macvlan
or MACsec device on top of a bridge, bond, team or HSR/PRP master, and
devices that already have a master or cannot take an RX handler.
This fixes the syzbot recursive seqnr_lock report, as Sebastian
suggested [1].

A port check cannot catch every path back into an HSR master, such
as a tc/BPF redirect or a tunnel; those still nest the lock and can
deadlock on the same device. Fixing them without dropping traffic
needs seqnr_lock released before the port transmit, which can reorder
frames for receivers without aae9d6b616b5 ("hsr: Implement more robust
duplicate discard for HSR"). That is left to net-next, where Hangbin's
patch [2] fits. He dropped it in favor of this series [3]; as this
series no longer narrows seqnr_lock, it can go ahead there.

Patch 3 segments GSO skbs before per-frame processing, outside
seqnr_lock. GSO reaches an HSR/PRP port even with GRO off, typically
from a container attached to a PRP RedBox interlink through veth:

  container/netns                  host PRP RedBox
  prp0-peer ---- veth ---- prp0-int (interlink RX)
                                  |
                           split GSO into frames
                                  |
                           sequence number + RCT
                              /          \
                           LAN A        LAN B

Some old Linux PRP senders put one RCT on a whole GSO skb; patch 3
drops such aggregates when it can detect them. With GRO_HW off on
virtio-net, the host may segment them first and the RCT arrives as
payload; upgrade the sender or disable GSO and TSO on its HSR/PRP
master.

Patch 4 adds selftests.

Tested on a lockdep kernel: the new selftests (also with Python 3.9)
and the existing hsr selftests pass, and the syzbot reproducer no
longer reports recursive locking. No new W=1 warnings.

No stable backport is requested. The remaining HSR dev->stats races
are left to a separate series, as Paolo suggested [4].

Based on net aa40afa831eb; also applies to net-next. Patch 3
conflicts with Sebastian's pending net-next series [5]; its notes give
the resolution.

Changes since v9:
- Added Sebastian's Reviewed-by.
- Patch 1: the role clear in hsr_del_port() and the hsr_port bit moved,
  so that the series applies with the pending fix [6] and with the XDP
  series now in net-next [7]. Comment and message updated after the AI
  review [8].
- Patch 3: the segment loop uses skb_list_walk_safe(), as Sebastian
  suggested.
- Patch 4: three test checks tightened after the AI review [8].
- AI review [8], not changed: a tunnel routed back through its own HSR
  master (patch 2) is the existing deadlock described above, and the
  socket close order in the test helper is harmless.

[1] https://lore.kernel.org/netdev/20261014151838.6RyMIRVM@linutronix.de/
[2] https://lore.kernel.org/netdev/20260805-hsr_deadlock-v1-1-d8a6f06fc5a8@kylinos.cn/
[3] https://lore.kernel.org/netdev/anXnxn-PBv8qH6VB@fedora/
[4] https://lore.kernel.org/netdev/4fc3b9f1-4bef-4b34-ae7a-e89037cce829@redhat.com/
[5] https://lore.kernel.org/netdev/20261104-hsr_ptp-v10-0-2c4a38ad973c@linutronix.de/
[6] https://lore.kernel.org/netdev/20261112064716.85381-1-sunwenbo@cmss.chinamobile.com/
[7] https://lore.kernel.org/netdev/20261112235027.4072149-1-kuba@kernel.org/
[8] https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112153333.20-1-xiexinet@gmail.com

v9: https://lore.kernel.org/netdev/20261112153333.20-1-xiexinet@gmail.com/
v8: https://lore.kernel.org/netdev/20261107220544.20-1-xiexinet@gmail.com/
v7: https://lore.kernel.org/netdev/20261009201324.17-1-xiexinet@gmail.com/
v6: https://lore.kernel.org/netdev/20260809121455.1745-1-xiexinet@gmail.com/
v5: https://lore.kernel.org/netdev/20260807140751.1351-1-xiexinet@gmail.com/
v4: https://lore.kernel.org/netdev/20260803222211.877-1-xiexinet@gmail.com/
v3: https://lore.kernel.org/netdev/20260731090224.18-1-xiexinet@gmail.com/
v2: https://lore.kernel.org/netdev/20260724161253.79-1-xiexinet@gmail.com/
v1: https://lore.kernel.org/netdev/20260722171836.196-1-xiexinet@gmail.com/

Xin Xie (4):
  net: hsr: keep GRO disabled on HSR/PRP ports
  net: hsr: refuse forwarding devices as HSR/PRP ports
  net: hsr: segment GSO before per-frame forwarding
  selftests: net: hsr: verify GRO policy and ordered forwarding

 .../networking/net_cachelines/net_device.rst  |    1 +
 include/linux/netdevice.h                     |    8 +
 net/core/dev.c                                |   15 +
 net/hsr/hsr_device.c                          |   13 +-
 net/hsr/hsr_forward.c                         |  156 ++
 net/hsr/hsr_forward.h                         |    1 +
 net/hsr/hsr_slave.c                           |  145 +-
 net/hsr/hsr_slave.h                           |    2 +
 tools/testing/selftests/net/hsr/Makefile      |    7 +-
 tools/testing/selftests/net/hsr/config        |   10 +
 .../selftests/net/hsr/hsr_gro_superpacket.py  | 1468 +++++++++++++++++
 .../selftests/net/hsr/hsr_gro_superpacket.sh  |    9 +
 .../net/hsr/hsr_ordered_forwarding.sh         |    9 +
 13 files changed, 1829 insertions(+), 15 deletions(-)
 create mode 100755 tools/testing/selftests/net/hsr/hsr_gro_superpacket.py
 create mode 100755 tools/testing/selftests/net/hsr/hsr_gro_superpacket.sh
 create mode 100755 tools/testing/selftests/net/hsr/hsr_ordered_forwarding.sh


base-commit: aa40afa831ebfe45e40a23721711059f2ac584d4
-- 
2.53.0

