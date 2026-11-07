Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794012580;
	b=0WuW5bqO1PsBzlll4uA3crljITUxC4IrxvYvJ9sPgQE3g6Y5DNzsralsq28X1pCBEMI2
	 YdJWaTiOwuCsd9SkSpNHk4PReMUFZ4eV5iSxMoowg6kGWiu4tq/lCOhUspc8YxzduFMWK
	 dHFtrHnQKoovVJ2HJFeATSmPmI/ONUr3+TOBu8bi9MVkW5a8F4aCYGX+QHqUf8+kviZau
	 2UPTdc+hc8j3Up6yRyNto9ExcLLio/hTleReMKD2CV/Pm0AYAqYSTwXMAMk8EUlaAUcMY
	 MkWQeAKWJ4MhSGHGZPV6vyoKEagOcNJwASB4MUYL2MwXs3NzPPI7vkMQMEteqq5a9Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794012580;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eUvQo6CtcCYbofMdXDXNFTy9F7Un1CTJJFERs6q6wl8=;
	b=YgoAvYEP/graYqCnKAis7rhimQVFINb5D58iw6Jn5/pc0LDbHPxqyrCvJoRK3osxKY4b
	 NVCjXcoG5tJZ70ToTjMMZckQk/YEYa/8EWZapztfi0+HyTdYowIksykzxBti1AW1PQZRz
	 lXRU6iwz37O7hMznlNOVB0uHz69VgTRvPhns0uEEmyq67gI6c0C2ao8DSvnNmFlPCp/JC
	 ugUZaUdMhQc/alysfDz6Ur105jUJWrMw8/1nzZefnvvF/RlyvmUB9z2sCwYdbqrk0hR2s
	 7440QrhcPKAABanv2OxCDYgLPO632r2WLt2RZy6XZuPGFoB96+e4A8CtOlPIKMPjKAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=lmZu+epk;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245FC606F9CC
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 00:49:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 245FC606F9CC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=lmZu+epk
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36fb88ea38cso231468eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 16:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1794012579; x=1794617379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eUvQo6CtcCYbofMdXDXNFTy9F7Un1CTJJFERs6q6wl8=;
        b=lmZu+epkafudfNLn2NlBlr/FmHKwwjMzRnLoxFTUP4S8OHF1XTTzT0YRYNFIU/Qycq
         HTNOfVWk3RmVke8PTF0KPSdPnekveVsKKSb1uXjp0Zg2j2OAZwQ914U6/vYGPTDi2qvH
         i1jEXS3vMJwIIjIHg7OaDKjarDxoBQIwK5lzJ7SVup6mpT/CAFDNlQdl9F8S/Ca5jfMt
         VtdoWTleIam0kxcrFb+Pur02fT8bVz8BFGObMkUA7WWgKDjJ3ks6EMavoyNWiKKS6rFV
         q+OWvbvnDhu9pVvy8f64nZIHICAiWI8SPPgCPekOLmPfQN9elhai3ea/tbEw/jCLSwLj
         GlsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794012579; x=1794617379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eUvQo6CtcCYbofMdXDXNFTy9F7Un1CTJJFERs6q6wl8=;
        b=J+PHyxDGJzQq1gdMSmh5AWHrT39PoKqOyNmwDWmYuoeY4F0Q/NIPfTft98gH5ldGrw
         j6A3No3KjWA/8t6FrJ8k3vpzMf/WOhFKQPSrxrCZT/fmj+dVPucJNffh/CzzxXIC0zsc
         IQLm7S+dia3Qf/OYSotIU6KuZ+CnrYY6z1d//l955dZntjNhNao11mATbIjZhs5qdW9o
         AaL8s6C+mKJrd6tczA/ONGcfOs0OQipfn8lNb5zNMrjAJQo7f3WjCDP0pUxYIgEyyeAZ
         EarF+dxuUL8RA1ZF7q2zmwiimEi0FcUpHY5DEP2LoRHHs/Pqsc0WozYdmf/YKcr7HJ0s
         fa/Q==
X-Forwarded-Encrypted: i=1; AKwUvByoUSjcsjpA2Fs03D9dn2VoGMIeVa7DTeu9+L04NhMzCoyX7oAiJ0/JBtZNl8jOpTJ+RoD4h1LTyZV2Tgs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vOXGASFrp275syBrYI5tOKVLnujyaJ33RSls/tkp8npj3lLfw
	2iv/NnqP+ILPW5KoyAqW4VdWFh7HESoPyjNGEXd/hRBlepG6Bbt8SxGXrdem1lLvnDg=
X-Gm-Gg: AYBFou24Fb7NqtAUqiJNBK8iUky8GU4OKWfgvlOkm3xhZoJ7ZPfAUeNpWHet9wk4xm5
	d5rqdeQm/0oDHn1lTMq9/5/knbc0k9retErYyrt8s+3RmntBhmdjwJFEmfxlwlJDZRbndF/y0+N
	JFrTt6rhc4vs99bvz7mLdQV/3D9CZ1GkMn1uBRzBzDk97+vYagEmeqDcRVhyMSACJoeGOIx6hIV
	fMdY6uyPqWSOo6x/Iupmris+Bjl8ZM0hHc6KlKeLWFSZDReq6kNpOUJh/ZpyE86aQnAlR7YIq7u
	wIWawDExBN3J8OK265g0TmyR6mmYzISPlHMLRb450a64G9n5DDvDzqNFXHmvUxV9aKDX7pXC9Y+
	JUReIbNirZja2ZPfEMK4d4stdxdKfwCsBgudMJAtMkbsLZg2H6+j5r1v9ev+DEzDjpT1Ej9VTy+
	/L4ptELfPpXzaFHxE/ssjrFcAQASKfJROwiB/M8i3iAERPBI02V9mvaXac8sMD96aPV28BSLPPU
	4oVjQ+qXAFJoeYlbkp2V8jJKoKhHK6sP6gifXeO1WCjPvp6tnIQ6GCUr2ZLUIdR9LNu/H5Klyjk
	1f6AOBGBWCR0RPDvlpsj18538KCRjflHIAkpOc8Rzg3IdItIURNupNtpK3oquU2gj8E6vqo=
X-Received: by 2002:a05:701b:4591:10b0:1b2:46ee:4cba with SMTP id a92af1059eb24-1b269b2154dmr765522c88.18.1794012578472;
        Fri, 06 Nov 2026 16:49:38 -0800 (PST)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8e3a718sm11021294eec.4.2026.11.06.16.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:49:37 -0800 (PST)
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
	linux-rt-devel@lists.linux.dev
Subject: [PATCH net v6 0/6] amt: relay tunnel lifetime, validation and request-path hardening
Date: Sat,  7 Nov 2026 00:49:29 +0000
Message-ID: <20261107004935.2627329-1-omar@blockcast.net>
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
teardown. The second closes the gc_wq re-arm use-after-free and makes
teardown safe for RCU readers and delayed group/source workers. The third
rejects Queries and Data from 0.0.0.0 before relay discovery and
revalidates deferred Queries. The fourth requires exactly four bytes for
IFLA_AMT_LOCAL_IP and IFLA_AMT_DISCOVERY_IP. The fifth makes pre-Query
drops visible, avoids counting successful reports as drops, and uses
concurrent-safe TX statistics. The sixth keeps Requests stateless,
authenticates Membership Updates and checks their IGMP/MLD message before
allocation, keys state by address and port, bounds per-source admission,
and silently drops failed endpoint admission.

Each commit message says how its problems were found. The problem in
patch 4 was triggered while writing an IPv6 selftest; the others were
found by review or code inspection.

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
PREEMPT_RT. With KASAN and lockdep enabled,
tools/testing/selftests/net/amt.sh passes (6/6) with no splats.

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

 drivers/net/amt.c | 623 +++++++++++++++++++++++++++++++++++-----------
 include/net/amt.h |  31 ++-
 2 files changed, 504 insertions(+), 150 deletions(-)


base-commit: 734bef548a96e8774d6eef5dfa2026c6edc4e80b
-- 
2.43.0

