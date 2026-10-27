Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098065;
	b=hV2W7GluT1IskT0rKfeSESUTTDnSGiJ/hie4lk60PN1BzJ7SawkXDiL/CN40gDA21KVZ
	 7VC7pRIEaMdARtl6aKADCcWADRQshbTqRD4aezy2d25WEKV3IVZL6ddVbWfBaW6sIrzt9
	 1y8lL4SVbqibpcqsRbKGONUIPPFnM6DyeyCXDc3fdMMCklye2uzMu97c12Muo2Bfr31OP
	 0Xx5A7LAKgFhUvN1SSff2SJS4Yig0cIdo6ghK6qa5OoSO666maP7UlN5AMq5jlIecSJx8
	 BO/Yr2BEoOjQAuuoOjX0I53N9DSt5E88ztfcXdfPQkjQPe2JBdNxOaSztpvrhVeMpSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098065;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=qwOP/ChYXyQgeHq4JGO8UPM3SSS01nblW3EU8Z0OF+I=;
	b=p3nA8e1wZNy6DsX7cVq6KjbKoaMmC1V5xE6fF8J9toQSte39UzqWcylr9ndLIehje5bJ
	 K+5p1zWMOFkGk1OuNSHlDwuB0qKo8uaujHnWb4JLmnYVvRMVTBIa+adai1NYONwS6YfMv
	 5dTPuKTwWq0BTOcqNhwBa8Ex1l7jT/HYHVtYteLEUbrczZX1bgQC0GAOveeenL+0GTs/k
	 l0yBP80UNT4RWEVSBKXl0PQ6OwhqNvmgs74WjWuxroQjUbPJBEaQxbyAVQOF78ihQr960
	 xedq/ovB49FKQJswxjDIXjH5Sbjrzd0Ce7GV2GyN6W1TnL/+L5d3vOu61Sw0+mjR6/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	arc=none smtp.remote-ip=95.215.58.118
Received: from mta1.migadu.com (out-118.mta1.migadu.com [95.215.58.118])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127E8606A328
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:47:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 127E8606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=p/T42mWw683F+K90Gg/h7jvsPmk0ttOQkRNGpJzra0I=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793098062; v=1; x=1793702862;
 b=YuTs0NZHMOxryt2mwDRZOe6eET0av+8LdjwteKi2emvdfdaPn5vUCeVVwplnEHqfX4D1eKCt
 SMHUe3eTZub27JqV7aj9Lgm3Jhgs+0sy0Jqle/tVBc/N+8eB0sw7FFaZL7iiZin161RsaexSM0z
 OMVh4XRy4ZdjQbZY8ZyAG768=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4f2ce23dc9097964;
	Tue, 27 Oct 2026 10:47:41 +0000
X-Mizu-Trace-ID: 4f2ce23dc9097964
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
	Joel Granados <joel.granados@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Fernando Fernandez Mancera <fmancera@suse.de>,
	Willem de Bruijn <willemb@google.com>,
	Maoyi Xie <maoyi.xie@ntu.edu.sg>,
	Zhan Xusheng <zhanxusheng1024@gmail.com>,
	Jiri Wiesner <jwiesner@suse.de>,
	Oleg Nesterov <oleg@redhat.com>,
	Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>,
	Yung Chih Su <yuuchihsu@gmail.com>,
	Wyatt Feng <bronzed_45_vested@icloud.com>,
	Flavio Leitner <fbl@redhat.com>,
	Hannes Frederic Sowa <hannes@stressinduktion.org>,
	Petr Mladek <pmladek@suse.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 0/5] net: fix misc signed overflows caused by bad sysctl values
Date: Tue, 27 Oct 2026 18:45:28 +0800
Message-ID: <20261027104701.296240-1-jiayuan.chen@linux.dev>
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

