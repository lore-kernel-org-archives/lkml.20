Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.230
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793513668;
	b=WRFf2N25Xf/Bj4/B459sMxv4JA8xLgCOr7kt15gxfl644fiZRI5qg+17fozHCCJ6UbrV
	 EczKx9m0EuscDSiOTtmqGlgYobq9LxZ2+2YHk76qeMXqV4PLW0HVn9UuBq0+mtrj8IPgj
	 v+o++5CiBm6I1RLo6FnUqmvMzqGBtGoqp1oszS+wGn8CCEAjP7hiXoAN040+4HFgv6fdN
	 pzZ8bLnanb1b11xH6NJ/I6hrIhXBKWkodLasEphLcFc+1X/jGtLzaxkq15OUd62bhVgiG
	 +wdByyhYmMCimjVJjEuj8XGoFYo8uMBUMk1lB74s0iOsG7fcrZOx054/mlmBrdogHiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793513668;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=BZ+qxJq3th4ghv/HaIFllJHWs6fjP2dPXQ9z2rOuZd8=;
	b=KCgR37MPOMMhi7uzw56q1976rM1F7fr1X5sZTlUcNxCO/tCU6I/M+ie1PqG/TV2wSVRw
	 fwNdxshCCH3aPXsr5qmoPlh0udWUIg2wNVuzYMDcs/awpyxiKmTrGdWvfHqJ6ljt8y5D1
	 gT6p/r3/L6xJDm3DHWXxef86bdPozpSkytQrDFuFLLNSjZcFR42oRwovXTRLri3VnOrjI
	 YvSQEH+Mvw5TFglYamI4chzC5/+benobol/2zjmKPrn28EcbmVaIFqUQo2mSzXBFmc2Ly
	 EdBmLYXsZ5GPjCcIiKZe8+6rvZMnwXop0FM4Ob/ZpoutQNQCnwyVBFpvzUWsI+BJ17A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wCy6R5HK;
	arc=none smtp.remote-ip=95.215.58.230
Received: from mta1.migadu.com (out-230.mta1.migadu.com [95.215.58.230])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4C7606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 06:14:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F4C7606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wCy6R5HK
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=vvNq7kxpfhjhHJQl3xgXHJx+UgUXDgNtOsyO934aHlA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793513664; v=1; x=1794118464;
 b=wCy6R5HKBYHYQCMOSY1UW0E8ul0UlgvSqU/50L8wNjeQICCtnwCIcsPk+uksnTN5l8bOwFFX
 5ptWrwnw25ASdIYQkiJKbFxrtZsYQs6Lsz26UiZUQfna9dxdlmFO3NLoX1C6LfemcP5K1xo0XN0
 iTH3kRDzwP9HrwK7mQWNMHNQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3a49dc99ca7b4b25;
	Sun, 01 Nov 2026 06:14:23 +0000
X-Mizu-Trace-ID: 3a49dc99ca7b4b25
X-Migadu-Flow: FLOW_OUT
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: netdev@vger.kernel.org
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Joel Granados <joel.granados@kernel.org>,
	Fernando Fernandez Mancera <fmancera@suse.de>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Willem de Bruijn <willemb@google.com>,
	Maoyi Xie <maoyi.xie@ntu.edu.sg>,
	Oleg Nesterov <oleg@redhat.com>,
	Zhan Xusheng <zhanxusheng1024@gmail.com>,
	Gerd Rausch <gerd.rausch@oracle.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>,
	Wyatt Feng <bronzed_45_vested@icloud.com>,
	Hannes Frederic Sowa <hannes@stressinduktion.org>,
	Flavio Leitner <fbl@redhat.com>,
	Petr Mladek <pmladek@suse.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3 0/5] net: fix misc signed overflows caused by bad sysctl values
Date: Sun,  1 Nov 2026 14:11:58 +0800
Message-ID: <20261101061331.286404-1-jiayuan.chen@linux.dev>
X-Mailer: git-send-email 2.43.0
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

Recently I have reviewed quite a few fixes for variable overflows caused
by config values, i.e. a value set from sysctl, module params or netlink
that is accepted as valid but later overflows when it is used in a
calculation. I believe there are more of these still out there, so I
used an LLM to dig through the code and it found the issues fixed in
this series.

All of them have been reproduced and verified in QEMU.

v3:
 - gc_elasticity: make the max bound an unsigned int, matching how
   proc_dou8vec_minmax() reads extra2 (Kuniyuki)
 - message_cost: kernel-doc "Return:" section (Jakub)
 - picked up Fernando's Reviewed-by on redirect and message_cost
v2: https://lore.kernel.org/netdev/20261027104701.296240-1-jiayuan.chen@linux.dev/
v2:
 - gc_elasticity, mld_qrv, igmp_qrv: store the sysctl as u8 and use
   proc_dou8vec_minmax(), as suggested by Kuniyuki
 - docs: add the missing "Maximum: 255" to the mld_qrv and igmp_qrv
   entries in ip-sysctl.rst
 - message_cost: add proc_dointvec_jiffies_minmax() instead of a local
   handler, as Joel suggested
 - redirect_load: reject negative values as well
 - kept Fernando's Reviewed-by on gc_elasticity, mld_qrv and igmp_qrv:
   v2 narrows the storage type to u8, the fix itself is the same
v1: https://lore.kernel.org/netdev/20261023091419.167088-1-jiayuan.chen@linux.dev/

Jiayuan Chen (5):
  ipv6: restrict gc_elasticity to 31
  ipv4: fix shift-out-of-bounds in ip_rt_send_redirect()
  ipv6: restrict mld_qrv to 255
  ipv4: restrict igmp_qrv to 255
  net: restrict message_cost and message_burst to non-negative values

 Documentation/networking/ip-sysctl.rst        |  4 ++
 .../net_cachelines/netns_ipv4_sysctl.rst      |  2 +-
 include/linux/jiffies.h                       |  2 +
 include/net/ipv6.h                            |  2 +-
 include/net/netns/ipv4.h                      |  2 +-
 include/net/netns/ipv6.h                      |  2 +-
 kernel/time/jiffies.c                         | 40 +++++++++++++++++++
 net/core/sysctl_net_core.c                    |  6 ++-
 net/ipv4/route.c                              | 10 +++--
 net/ipv4/sysctl_net_ipv4.c                    |  4 +-
 net/ipv6/mcast.c                              |  2 +-
 net/ipv6/route.c                              |  7 +++-
 net/ipv6/sysctl_net_ipv6.c                    |  4 +-
 13 files changed, 70 insertions(+), 17 deletions(-)

-- 
2.43.0

