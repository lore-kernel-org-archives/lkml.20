Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794497618;
	b=jPTcQe+IRycvqYw4QflWICyGCQomn8le46C861F7KJ0Wc/wLwgzXWK+rgZPFIXCgnI4K
	 cu+RuHOr5I2NFtExonWPwzlabl6oHJR6AatpMN5YWgj2os3NmUxWO4VLQHUzQC2vX8d5A
	 XCF1QWHAIXBdwkDQjskr6vFGUflfeTgmq0tch+Sy/mHurDgtnjo5GXFJmUO9Uw1xNCT2Q
	 eX89ZdOGT5o23NEw1FGiK9X5mnywcQh/vpF9+DwTNuZoFs91Q4Ijo67uC9kDQnZHz0jtL
	 Oztpi7MXr8DFuRouXwA72vjGvuvpLQPIgObIOjitU4A13P7KPcYR9NCWJ0B9q2ggSVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794497618;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rEhQI3hSOE9lI+wJjJwvBECQfjSinYgfuJ/QdhixFTY=;
	b=QfDOurO0WLPN9Cn0w3cbu8a6gWz+uRbJV+4In6iCcLP3OKFz0PlVIwsMk6qKANZN+Nyw
	 RLcSGITY4NGBWH09v5bPFb++HmoMSXPYROOec4tyLWCf38Rvx+RZC1/f0vPUxU4WwMxmx
	 9RSY+zxQvjAkHxWY2uJ/YntxCHUB9AVh6+ak9Kji1pmIGctK9X6mm0hdD7br0WgiHxH2/
	 uMsRFVojGKMK+Np5sta3jZne4N44/ingFQtDXniTsi0iM0tCeg+kBabgzx5GX6zs+5dBC
	 AvS1/8Lsq4XHuQlGnYIfMtdUgA3RUv11ruQu8E7Ow/HZ3LRgNrVj88LWwdyjh0lg/BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jMLMrqdr;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01594606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:33:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01594606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jMLMrqdr
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-49a357e48a2so135658f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794497616; x=1795102416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rEhQI3hSOE9lI+wJjJwvBECQfjSinYgfuJ/QdhixFTY=;
        b=jMLMrqdrw+sf9VotlU3FcMTa96S3NZy1TCicumpr6ODmSsTZMyuvA+ILiUWWR1qRuF
         373uxwLJPAZENG6ysZRpyusJXuNW4CIuQ4h2/3GhBk7ZtY+Hqi2dmnQNVz18cEFgXz0n
         dS+CM5qBPG67oWoVh0tYOSRNbX2SxhCYWKfdgh5C2ItnfNZyBS3Lt/CNfq16WvWWCh2p
         6/fc16B6JIsFxXluBO+yC/AAVXPpkzbarh1WPa160M8tyNgSjZAuBLcec4orXcd7L8Np
         H5/MO5WwkylQHs2n13Gs5celfVKXmvV8NJUwwnTNMw0qe6jGa3mXHSekqwRMeS/V90yI
         mlmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794497616; x=1795102416;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rEhQI3hSOE9lI+wJjJwvBECQfjSinYgfuJ/QdhixFTY=;
        b=gWuifyem5aS/5qqWzMOfSVackzyanXLJX38VIyrfYlc64LMPhDP1idGM51bIQj/NaY
         vgUhPstxlM5enNqMOc9k6c+Ri0DeOrhw95HadEzwTlNALNjHYHg0piQWLI9WJH1dcgMk
         LJ8iNytKlA9uN/5/DMRZ3EMN4uEmivn4ZSx7enzAAhsGBmUoL0ioIxdkTvLAQ63PZqix
         g6HaQak6NRb5QsehYPbgiStavnQJcDNcYaCBpHYJHJcQzC683tVOjcTbcwW0RjZvJ+7k
         0Eoftd9ibzlqEtojoCamkNKfE3MM86D9D4oSaqbNASj776YXq0aRhskzG+sp904z23mB
         qkZw==
X-Forwarded-Encrypted: i=1; AL+hErEEr7M7XccvP+h4oeoSUHKgeaZMvUIhh3CSelkVCBxMh+3PO+wg4Y2W73ggG1ujly9Fcb8iTPASLUU0Kd8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lJMFz3sLEkyKzZIWkeBQA/xYjdAKvywnOzvAIrgm4QgK/sfDF
	uFc2CWn4EwT1QTl9+N1PdwVU0yj1TEpv+lFlaa0w12V4UL5i5thCDPuI
X-Gm-Gg: AYBFou1twYf2jhhG4G6SxMUsQXTBzpT/EBYxjODtWUDu0d2wyqoDyzukHhmuxSQCjww
	DNuUfEBfx4J9QKb7FMg44B1L9ytpbjhLlBkXIfJbYm9R76EtyDJ5RfGI+45EfsOvSZhgd2iw0RV
	lJfwmWmtqib0DuzCBauCU7rWNTw+aYTR2pZ9NG8QNa0HZr/Y2vvBI8HAZoFp/8uo6zUOW1dnScc
	66a/clFxT1rtfmJjC0wf8CzEuSwtgft1mXJEACoDXgP9ybJGrkufcXs6yx8Rno5ZVBn0QCURpEd
	VmxHynnp2h6lhuQ57xucaHtAEmco34ONbbKp/43yGTvAM0WVTYzf2k796f/5dyHsWSri7NBYZOo
	d5RW7i0yZFyysu55O+O/iHVcBqnr5SQ+l2BRsmRzFaUaPMtk6MFG1FzspgjpuJ5FvP+DH4FiHkT
	mt99d72irCFCqO4iLDlCk9FmXYzRz438F67wjfuyy47KiatKEI3svpQIS/Wul50FwUlFJwGKca+
	9aD0o+keMwPjrBTVwXLqD/t8zji1QMrqxsR+XYZ4cHzUxMUZJLTMCXjsFUkBn10Lr4rEAH769gr
	E55jeCY8JYvwjqlKa4eWEL1NR2FX9QRNSNESJki3du1lDY194K5y2CUABj6ZTNjFQi9gJb2iwi6
	gQV4jJvIe9Evwd83fjWCd51kOkdq/nFPwgPCiOjE/y/Zxq0YvE8uOF9DsOXqL41I=
X-Received: by 2002:a05:600d:8448:b0:4b6:2242:d0be with SMTP id 5b1f17b1804b1-4ba091a5d00mr85202145e9.0.1794497616053;
        Thu, 12 Nov 2026 07:33:36 -0800 (PST)
Received: from L-022584.energy.envision.com (dynamic-093-130-172-139.93.130.pool.telefonica.de. [93.130.172.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08ddbe68sm229331185e9.0.2026.11.12.07.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 07:33:35 -0800 (PST)
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
	danishanwar@ti.com
Subject: [PATCH net v9 0/4] net: hsr: fix super-packet forwarding
Date: Thu, 12 Nov 2026 16:33:29 +0100
Message-ID: <20261112153333.20-1-xiexinet@gmail.com>
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

Based on net 30c71476d842; also applies to net-next. Patch 3
conflicts with Sebastian's pending net-next series [5]; its notes give
the resolution.

Changes since v8:
- Patch 1: the message and comments say which ports the rule covers.
- Patch 2: macvlan and MACsec are refused only on top of a bridge,
  bond, team or HSR/PRP master; all ports are checked before any is
  changed.
- Patch 3: copy a head shared with a clone before segmenting.
- Patch 4: no fixed sleep, no need for iproute2 to print the HSR
  version, new refusal cases.

[1] https://lore.kernel.org/netdev/20261014151838.6RyMIRVM@linutronix.de/
[2] https://lore.kernel.org/netdev/20260805-hsr_deadlock-v1-1-d8a6f06fc5a8@kylinos.cn/
[3] https://lore.kernel.org/netdev/anXnxn-PBv8qH6VB@fedora/
[4] https://lore.kernel.org/netdev/4fc3b9f1-4bef-4b34-ae7a-e89037cce829@redhat.com/
[5] https://lore.kernel.org/netdev/20261104-hsr_ptp-v10-0-2c4a38ad973c@linutronix.de/

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
 net/hsr/hsr_forward.c                         |  158 ++
 net/hsr/hsr_forward.h                         |    1 +
 net/hsr/hsr_slave.c                           |  145 +-
 net/hsr/hsr_slave.h                           |    2 +
 tools/testing/selftests/net/hsr/Makefile      |    7 +-
 tools/testing/selftests/net/hsr/config        |   10 +
 .../selftests/net/hsr/hsr_gro_superpacket.py  | 1456 +++++++++++++++++
 .../selftests/net/hsr/hsr_gro_superpacket.sh  |    9 +
 .../net/hsr/hsr_ordered_forwarding.sh         |    9 +
 13 files changed, 1819 insertions(+), 15 deletions(-)
 create mode 100755 tools/testing/selftests/net/hsr/hsr_gro_superpacket.py
 create mode 100755 tools/testing/selftests/net/hsr/hsr_gro_superpacket.sh
 create mode 100755 tools/testing/selftests/net/hsr/hsr_ordered_forwarding.sh


base-commit: 30c71476d842b094651bd7712f6c8ee8716147d0
-- 
2.53.0

