Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794344743;
	b=dmgew/vqO7h5Fn0fvHxbwUuztvcNq/SgMZzmGbrA8eoIBUgPCZEwppmOklWNnnkotpEF
	 S0TtR9krNrGPmITSgAv4VqEqxT7Yz9XSImsfthuXlbnriXDIznuHaOR3mbNUlYbHqWtRc
	 wOQBbAk3ZhzhGbqJOoucET3Gjr8ex5ed4jeecOML7YFFFrVEf8JB1FFUsGao8EMSunmbt
	 QgYKXX6LVymj+zX1RSGWOPlmk8wZ7O9jB6TVn8DR3wCFlDRDT0KPTXweWR7tY+ZEiY5OG
	 JcSnboy3xGmTwlnLAyybWQ2u9R/YfwDIjiNp11ahpvhBUK+o2wp3OoOcMkHHL7sg3lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794344743;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=y2oH5arm3Ygd5Eahbe46FdEKQqO9QzIIXembzZRUuTc=;
	b=GVNYB3ZzAjMAycyz6WKVCBI4228EQaW0M8hJ28j4a1d4McPKg4XEHAolweKm6D9J31qO
	 BOTzmZwgMByKWhPopeV9YeGGxTUcvCjNuKsH05XwMvHgJmz7GSIRbwTvBuOkA0/9b4Mxz
	 Jv5MSFDibNKsttJhhkE/bEzBTVmMapZg9jF0KZE4xPnR8uAyhnxlpWI6Y9tPXdzCA17Py
	 qINGHtu3DYmjyknL8jgjmiCYaVPS8iKR6Hss3RyExmGIMQQHPHTcIzl9X0Oe7FoNcuipe
	 TnvPyrniKlQv5yGmCccc7L3ZBqWNkg8exWErwjcRC1FVRQlE2T9yV4usyl8b5PcOXpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=XHE5FB7C;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E869606A326
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 21:05:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E869606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=XHE5FB7C
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-372bdb942dbso3236831eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1794344741; x=1794949541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y2oH5arm3Ygd5Eahbe46FdEKQqO9QzIIXembzZRUuTc=;
        b=XHE5FB7C/QvHq8oisZYuBTD12ag5bJuz/L0Nt5kMQorg63lPet34bODJu8fsYNywTJ
         G4j4EQq60oS9PIKANP72ub47G/D/7Y+rAMGEWuz6BCiUa2V3NhBEDv9OF4naOF+U/Dh5
         sl/qJ48XehfSwvqlEKFdAwYO4I9ETjqt5s1qIb/rY42AuF0gls4G5hE/9RaHrX4sap3s
         VD2LDQ0Pps2FZ4vKnPHARzrg21BcUsdp1Zz9fJrSePVdtyp8lx2WtgV151z9GwNlFZ5M
         oVR3MjIQeCF9sg1ZEKfjVg75HFJnKCYjUGHXx4daV/I6PLyIlEPp8ibccf67oa0fQ1Ik
         kwAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794344741; x=1794949541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y2oH5arm3Ygd5Eahbe46FdEKQqO9QzIIXembzZRUuTc=;
        b=GiVSzdo8s6bwzizgxmEliIEnjg+uB7Gz0fHOYoie9CpCB3qMzZWecudgGJ6YMwsRs2
         MZcUQlWbbNBZ6DgTTZqtFh6RBkWqVmhUIlevnMvLdbjzLi69vu005lvl8Y7bAINBNiI1
         yWCYJbZQoO2ErbNqC3IvbH4mQdij0A/lxhXRqJFxISsR0jNy2wVJH4pyBkm5vAvj6IW9
         dm0M7DxJuszAFD+p7M2qhPCcdt9yqGHP4hXtDEsJ7x5UP335+yzYqSfEiB5217RKCnnU
         lyZk1J+lcK/3wsSQ+S0Em4HGCjOgp5+FeFonchNhV+eAsnNiyIyChyOQnjH+H8cIMcE4
         Ls0w==
X-Forwarded-Encrypted: i=1; AL+hErEke9EsXR9/Qpj33YvjJCsOaYHobTmwGxy1gkPpt22F98sLEpOcnv5opzFE+B02skcpilqDNSQmnF4+vQ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+u7GTlKXJcFvxfR6A7xon5BiKBYINdFRBwuV/rAw+eFX6fegyi
	XVpQWNfqXDjthI4gQ0oUeawhaWdgemwcY8Yc8J3cl4lO2jzZcemC5VOqJeMjrchdfII=
X-Gm-Gg: AYBFou0eUZ4t5nAJIYKNfoLa/Kdxduxwq/0yS/jsZTIlGpdSrn7W+KQEvtcvlmPxQPm
	yXivWF2a34tk9yXydfShco4JnZPWIbYbpfGVVkrZAPo/kxiJJc8QK7RH4oY8I0AsRw91xxDT8hl
	d9K589aIVa2gMvT/IlRPWPkF2TBzogP86pLE85i7S89yHIrE8WNGXpj/dZIpoDrWfWW4EyOcMyb
	3Bv51/eWfqkbNjPvSRtriFVPPQSn6k4lIAHG/c98jDiPD5JWrj6aGDrG5ImKpkE6LxpLquq83WB
	ePZ7I1k3lQWYNQIaTxpOht/XawO14t076T5rUnDql0yqE/t/NZgzusz2ZSguPzeFEbPR+HtIwvr
	WhkOYOgdZQg+6CEK7LEhBNVpryFzK3+drlhH75lka5OGsuQ2lYWZ6q/M0Z1FvFqMvvXniTo2Esv
	OSmr1gjCWtLecZOgacERhhvuFmcqX5ZEaAaT6bm8tohRjCivfrd6sklDNZI7v6dTLdQt9LEuR9t
	STx7kbS/PiPEcAAcncpaHrzATR+/dShMfH81ikV251T5TpGjJZMCjaoSMLap6U4b8fByfvMzJd9
	69PYG/m+xBPM2dPP8/ZLhP1UP1+0sJTbjYG7IVGJTjhA7PGJfhxajpVcvzgVF7JsjQBgyIA=
X-Received: by 2002:a05:7301:6589:b0:369:e8b0:af85 with SMTP id 5a478bee46e88-3768701ccdfmr923528eec.36.1794344740679;
        Tue, 10 Nov 2026 13:05:40 -0800 (PST)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm10464097eec.17.2026.11.10.13.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:05:39 -0800 (PST)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Simon Horman <horms@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-rt-devel@lists.linux.dev,
	Kuniyuki Iwashima <kuniyu@google.com>
Subject: [PATCH net v7 0/6] amt: relay tunnel lifetime, validation and request-path hardening
Date: Tue, 10 Nov 2026 21:05:31 +0000
Message-ID: <20261110210538.217936-1-omar@blockcast.net>
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

This series hardens AMT relay tunnel lifetime, validates gateway input, and
keeps unauthenticated Requests from consuming relay state. The problems
fixed by patches 3 and 4, and the pre-Query drop in patch 5, were found
during the AMT IPv6 outer transport work, which is not included here.

I am using the existing IPv4 AMT relay and gateway implementation in a
multicast delivery network, where gateways on access networks send IGMP/MLD
membership state through a relay to reach downstream receivers.

The first patch detaches the receive path before amt_dev_stop() tears down
events and tunnels, so no receive-path reader can queue work after the
teardown. The second closes the gc_wq re-arm use-after-free, the double
free of a tunnel when amt_dev_stop() races amt_tunnel_expire(), and the
group/source timer-work lifetime bugs, makes teardown safe for RCU
readers, and bounds the nodes parked for garbage collection. The third
rejects Queries and Data from 0.0.0.0 before relay discovery and
revalidates deferred Queries. The fourth requires exactly four bytes for
IFLA_AMT_LOCAL_IP and IFLA_AMT_DISCOVERY_IP. The fifth makes pre-Query
drops visible, avoids counting successful reports as drops, and uses
concurrent-safe TX statistics. The sixth keeps Requests stateless,
authenticates Membership Updates and checks their IGMP/MLD message before
allocation, keys state by address and port, bounds per-source admission
at a share of max_tunnels, and silently drops failed endpoint admission.

Each commit message says how its problems were found. The problem in
patch 4 was triggered while writing an IPv6 selftest; the others were
found by review or code inspection.

Changes in v7:
- Patch 1: no code change. Its Fixes tags are now cbc21dc1cfe9, which
  added amt_rcv(), the receive path that reads sk_user_data, in place of
  b9022b53adad, and 72d3b9a4c2b1, which removed the wait in
  udp_tunnel_sock_release() that had hidden the race since
  3cf7203ca620. The message gives that history.
  Kuniyuki Iwashima, who wrote 72d3b9a4c2b1, is Cc'd.
- Patch 2: a node parked for garbage collection is not charged to
  max_groups or max_sources, and groups are now parked rather than
  freed directly, so Report/Leave churn could pin memory until the next
  30-second drain. Count the nodes on both GC lists, under the one lock
  that now protects both; when the count reaches AMT_GC_KICK (2048),
  drain both lists at once, and run the drain again at once if the
  count is still that high when it ends. Both drain loops call
  cond_resched(). The node dead flags, touched only under tunnel->lock,
  and gnode->amt, set before the group is published, are plain
  accesses. The message names each failure the patch fixes and adds
  Fixes: bc54e49c140b. Sashiko review:
  https://lore.kernel.org/netdev/179423575689.994134.7687724928848317687@kernel.org/
- Patch 3: no code change. Its Fixes tags are now cbc21dc1cfe9 and
  30e22a6ebca0 in place of b9022b53adad, which had no receive path.
  The message adds that a forged Query also needs nonce 0, that it
  blocks discovery until the Request retries run out, that the Data
  check is defense in depth, and that a link-local multicast
  destination also admits a 0.0.0.0 source. Sashiko reviews:
  https://lore.kernel.org/all/sashiko-outbox-203503@kernel.org/
  https://lore.kernel.org/netdev/179423575832.994134.15932403659045742824@kernel.org/
- Patches 4 and 5: unchanged. The Sashiko review of patch 5's v5
  posting asked for changelog text v6 already carries:
  https://lore.kernel.org/netdev/179423575970.994134.5432026388018419992@kernel.org/
- Patch 6: derive the per-source cap from the table,
  amt_max_tunnels_per_src(): an eighth of max_tunnels, at least 1 and
  at most 16. That is 16 at the default 128 slots, and one address
  holds at most an eighth of a table of eight or more slots, where it
  could fill a table of 16 or fewer. Both per-source counts are u32,
  and the re-check under amt->lock skips dead tunnels, as the lookup
  and the Request path do. The message now states the behaviour
  changes: the secret is seeded before the socket enables the receive
  path; a MAC is accepted for 180 to 240 seconds, so a gateway that
  sends no new Request within that window has its Updates dropped,
  which the message relates to RFC 7450 5.2.3.5.4 and 5.2.3.5.5; and
  any nonce/MAC pair minted for the endpoint in that window is
  accepted. It also says why amt_tunnel_get_or_create() rechecks
  netif_running(). Sashiko review:
  https://lore.kernel.org/netdev/179423576119.994134.11181391213411379311@kernel.org/
- Not changed: the same review notes that the Request path still takes
  amt->lock for its O(1) snapshot. amt_tunnel_get_or_create() repeats
  that check under the lock, so this is left for net-next.

Changes in v6 (patches 2-6 were v5's 1-5):
- New patch 1: clear the socket's sk_user_data before amt_dev_stop()'s
  grace period, so no amt_rcv() can still queue event_wq or link a
  tunnel after the teardown. Found by code inspection while reviewing
  the changes below.
- Patch 2: run the deferred group/source GC directly instead of
  flushing its work. flush_delayed_work() queues the work and waits for
  it to run, which needs a free amt_wq active slot, so
  amt_tunnel_expire() and the group GC, both amt_wq work, could deadlock
  once every slot was held by such a waiter. amt_dev_stop() calls the
  GC the same way. (Sashiko)
- Patch 2: amt_tunnel_expire() reads jiffies once (Sashiko), and reads
  last_seen and marks the tunnel dead in one tunnel->lock section. The
  Update path refreshes last_seen under that lock, once the encapsulated
  message has passed its IGMP/MLD check, so an Update either keeps the
  tunnel alive or finds it dead (Sashiko, raised on v5 5/5). An Update
  never stores 0, which marks a tunnel no Update has refreshed.
- Patch 2: keep amt_group_work()'s loop braces, and order the
  declarations the patch touches longest first.
- Patch 6: create or refresh tunnel state only once ip_mc_check_igmp()
  or ipv6_mc_check_mld() has accepted the encapsulated message.
  (Sashiko)
- Patch 6: the tunnel lookup skips dead tunnels and amt_update_tunnel()
  retries once, so an Update that races amt_tunnel_expire() creates the
  replacement instead of being dropped. (Sashiko)
- Patch 6: the Request path's per-source count skips dead tunnels too,
  so a tunnel being expired no longer withholds a new endpoint's Query.
- Patch 6: drop the per-Update amt_update_relay_status() call, a no-op
  since tunnel creation sets that status (Sashiko), and the last_seen 0
  special case, since every tunnel is now stamped when it is created.
- Patch 6: retitled from "amt: harden relay authentication and
  teardown"; its teardown changes moved to patch 2 in an earlier
  revision. Its message now says why a refused Request gets no ICMP Host
  Unreachable.
- Patches 2, 3, 5 and 6: correct commit-message and comment claims that
  overstated or misdescribed the code, and say how each problem was
  found without per-version history. Patch 4 is unchanged.

Changes in v5 (since the 2026-10-20 posting; v5 numbering, so its
patches 1-5 are v6's 2-6):
- Patch 1: flush the deferred group/source GC with flush_delayed_work()
  instead of cancel_delayed_work_sync(). Both GC works re-arm only
  themselves, so cancelling them on tunnel expiry or device stop stopped
  periodic GC for good after the first expiry. The flush only reclaims
  promptly; lifetime rests on RCU and the cleared owner pointers, and the
  comment and changelog now say so.
- Patch 1: clear snode->gnode and gnode->tunnel_list with WRITE_ONCE().
  Neither pointer is __rcu, so RCU_INIT_POINTER() drew two new sparse
  errors.
- Patch 1: keep amt_group_work()'s single out: exit and move
  rcu_read_unlock() below the label, instead of open-coding
  rcu_read_unlock() and dev_put() at three exits. Every exit still
  drops RCU and then the timer's device reference.
- Patch 5: drop the paragraph about tunnel liveness checks, which moved
  to patch 1 in the previous revision, and fix one continuation-line
  alignment.
- Patch 5: copy the secret generations in the Update path under a
  seqcount, amt->key_seq, rather than under amt->lock, as the Sashiko
  AI review of the 2026-10-15 posting suggested. Forged Updates now
  take amt->lock only on PREEMPT_RT, to wait for a writer. Requests
  still read key[0], nr_tunnels and max_tunnels in one O(1) amt->lock
  section.
- Patch 5: say in the commit message why one address may hold at most
  16 tunnels.
- All: state how each issue was found, and put Signed-off-by above the
  "---" separator (it was below it in the previous posting, so git am
  dropped it).

Testing: on base-commit below, each patch builds without new warnings
with W=1 C=1 (sparse) for IPv6=y, IPv6=n, PROVE_LOCKING and
PREEMPT_RT. With all six patches applied to base-commit below and
KASAN and lockdep enabled, tools/testing/selftests/net/amt.sh passes
(6/6) with no splats. amt.sh does not drive the races fixed here.

v6: https://lore.kernel.org/netdev/20261107004935.2627329-1-omar@blockcast.net/
v5: https://lore.kernel.org/netdev/20261105125010.1107546-1-omar@blockcast.net/
v4 (mislabelled, 2026-10-20): https://lore.kernel.org/netdev/20261020002557.3984927-1-omar@blockcast.net/
v4 (re-posted 2026-10-15): https://lore.kernel.org/netdev/20261015220648.1545576-1-omar@blockcast.net/
v4: https://lore.kernel.org/netdev/20261013175407.947606-1-omar@blockcast.net/
v3: https://lore.kernel.org/netdev/20261012125943.558629-1-omar@blockcast.net/
v2: https://lore.kernel.org/netdev/20261009201455.1904698-1-omar@blockcast.net/
v1: https://lore.kernel.org/netdev/20261008003606.3666617-1-omar@blockcast.net/

Assisted-by: LLM

Omar Ramadan (6):
  amt: stop receiving before amt_dev_stop() tears down its state
  amt: fix use-after-free when a Membership Update re-arms a freed
    tunnel
  amt: reject a gateway Query or Data from 0.0.0.0 before a relay is
    learned
  amt: require an exact IPv4-sized IFLA_AMT_{LOCAL,DISCOVERY}_IP
  amt: make pre-query report drops visible
  amt: create relay tunnels only from authenticated Updates

 drivers/net/amt.c | 663 ++++++++++++++++++++++++++++++++++++----------
 include/net/amt.h |  32 ++-
 2 files changed, 544 insertions(+), 151 deletions(-)


base-commit: 734bef548a96e8774d6eef5dfa2026c6edc4e80b
-- 
2.43.0

