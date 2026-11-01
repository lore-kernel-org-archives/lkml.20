Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793528046;
	b=GZz9aKP5uq4Mo3cVIKnLNIX/DlJGNLQra8rgoJrvSZGP5gdjQpfi7Cx+GMdhE8PPAOPN
	 nccJiKmKty7on6cKjZkoRMPaPKj4ShQ0XAU/15Q5gB7dCysr3TR9OnYnTCPn96i3MntF/
	 QpxfM9DGBfmTkSkH87TY9YiZ+CrDWeKUJQ317GWZp7ETN1jTXOhqu3ScW3mUVhVshjdha
	 yjYOFpgDxcNE+V7KksW0MOfVea643qZgjizsk4CfU8BH1Zv6KgHZw+GQQTB5j0oBimIhB
	 zE4qgwz2wotQ4oyjwrlIdInfQgkqBNoLHjFv9NsQtnlNovCTLDKsaeGRem1m8w2kgKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793528046;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nNYlNFeeZkLPD3oIEioU7XoDwSaoK+RX30RYfFQaNjM=;
	b=iojvh06kyiP2EcGzOV3h5hFbQyL9T7yFPRffvP2bvTJwtmVb4g0pbDjZDq++TneJapv/
	 hBUDG0q2W8QkYR3b5y7bgJV/z9/jUiPAAZEv7psMTqzIOrspbmpTovIBKk4TyUoSSiric
	 5HtX2rJccA/ocaWbxc3mS2znDOtaT5r585+SpvqWhq03tcJ5B9seLMoX8jMr0uI5nIILo
	 NAFtqbZpFH77bOjzC2QxmyVzXHwT6EiboqD43J6MPUQ8D/9Rb7eXYQZ5On0sdMNU18V+w
	 U6K8jgHVy4zqWwcERPDwR6OvXY0/DaV96IhfCaMDag9sCwyHuJA0+IgMkTBx3l+QQsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L4N2vD9s;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E4D606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 10:14:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37E4D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L4N2vD9s
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1a3c08d6928so2439668c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 02:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793528045; x=1794132845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nNYlNFeeZkLPD3oIEioU7XoDwSaoK+RX30RYfFQaNjM=;
        b=L4N2vD9sKaN65CeM48/SmKhr3rNLIZeiMnTXzFPH6P0RKCuPWbtGEkOeH1cBC4smTM
         B60xqS9Ty1CP+PSNrVfbtlZSoY2f5xY56qc5r0FiWeeh0sWfJ1lc9q7KXaErLXsQD8qg
         73B3Y2lvT4lOo5cl8oGe2LiJ7Hezw8v9Xc5v9OmjRy+rdqg0RhcP/Erh/1I1S8iRFbJz
         Fmbb6pYoppU/HsukYf/Fk0UMGNuMHYTvuQWPQTfiRmttGG6qIGIsaRWgxqLtMPjkCL4y
         i+VGuD/7N6zvLqYWuUx7z0yS8SZlPDuuEUtnG8b8/owmeZwfBsuGJQluLmlvmeD+OJcq
         jV9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793528045; x=1794132845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nNYlNFeeZkLPD3oIEioU7XoDwSaoK+RX30RYfFQaNjM=;
        b=TmiXmjhwKGT7C2HmJ0GV891bHqDlKSeVuqxLfPrprh6xR/nUb+dB3Tnx7yc6UQC/HP
         ld8k8BrZ1rtUNN4fhxda73Tjmt8ezA1fivw9h6us5y1cd3vuiSfAEgDZ64Sq3XVcGO49
         LAg42MAf7VsmIKvhe2oEbgqodmezGq1QabBxCbVhEi7ani5fdVuOxkx4Yv2DxaVJcG6f
         CuV+bHwrbceFiOEDnKCXZmdmw+NLfPnFpJyyO9VLKIDLNItvrb6YVuD9dql0/lhwBD1b
         ReQdgXnR0lJlS0bKK6ftpRWWbtF0Ocd2AGM/98xtkfJI22YGp7trMzQdAYcTkqfXkwBu
         cGHw==
X-Forwarded-Encrypted: i=1; AKwUvBwLGlc9WA16bkqo4EgD/LmCC7wHtFcTTFYpADr5aHFkmVMb82l+bQrfkw0ZuU2ROe9JOdzwd40BZ7wDEEg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9gK9j8MCZwBA6bynZWmKRNAbErnqdqlyMgD1sY8b0kU5uYPMM
	mZAC4CFnekmFfgrR2E6P99htDB5PPjImaQtwar5vpz2PMc2JKzGifwZn
X-Gm-Gg: AYBFou0/dYxz1ey5RqUV/1/AWCUcpyH2BDIA1sDaawkHKhsHNevQubaqzfckYTjQ03l
	gZYAe/wT6F4/JsHKA0M/HTtU9BaQmXYCjXawpPkapPpRRuvMl7ZCk30hS8wdumJAyNbi+5aesZ7
	D2RQdtZTwKhmFPwUadVCrVBkfhzDziBSmNNb8HDfVhcCoQnJmD8Me/IGHty/VAGTx5jnM4V2Lju
	qtJFgKTSUihDtl0syLoNq9YZ7pQrUL7Tbq9ZAkC7ARj9cUex/8zHLjPN8plyJOQyqPrfT1UsHi7
	uNcvskDzdbM6tKWHKu8qnnCKElSoxEruGRH421GiJ/HfVlrJj1Y7LjASsGLtO5R92+yovHbHf6G
	jS1bLcVA9aclSbViZ0Rt6AaFEYcmVTXeoFDzU3Fj3qQMHamv1R8p49VpvKd7/7gsUenxOIeW68L
	HfCQSdJ9SyqF4bIMoouOs4dybbFWfv7FimemCDKln/PWLd453lnkx+1Q45ih3VXPjAz0sG5GbFS
	4Mm8Id7h3V2CwJoOExDHGxf+YbreH+q0tIj7ubv91PEw0YyROKY55tNtU/H2dxSheWJcE/pYQdz
	i+l9GtTrRdNT0Aa+mnphR2WPd73g75mRCGKJZE/r6whowhrtTSuOIst0rfLiSprfTpbWslhb9Gh
	OKVJlXV/alK5bXd1nELCOhxxxLruaI1dzyjwjxmSdB24YkKfUwdhfH6U/i/sMU3S02cOII4hiPA
	==
X-Received: by 2002:a05:7023:90c:b0:16e:c820:b20d with SMTP id a92af1059eb24-1ac56ca0005mr11334862c88.5.1793528045113;
        Sun, 01 Nov 2026 02:14:05 -0800 (PST)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42662f23sm29799664eec.2.2026.11.01.02.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 02:14:04 -0800 (PST)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Florian Westphal <fw@strlen.de>,
	Mat Martineau <martineau@kernel.org>,
	XingWang Xiang <v3rdant.xiang@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	linux-kernel@vger.kernel.org,
	Anil Kaushik <anilkaushikwireless@gmail.com>
Subject: [PATCH net v3 2/2] netlink: Check a group again if it was released while joining it
Date: Sun,  1 Nov 2026 10:13:47 +0000
Message-Id: <20261101101347.3910654-3-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261101101347.3910654-1-anilkaushikwireless@gmail.com>
References: <20261101101347.3910654-1-anilkaushikwireless@gmail.com>
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

genl_bind() checks a group under cb_lock, but netlink_setsockopt() and
netlink_bind() set the membership bit only after it returns and the lock
is dropped. If the family is unregistered in between, its members are
cleared before this socket is one. The socket then becomes a member of a
group ID that no family owns, or that a family registered in the
meantime got, and the GENL_MCAST_CAP_* flags of that family are never
checked for it.

Count per group in the netlink table how many times its members were
cleared, which genetlink does when it frees the group IDs of a family.
Read the count before ->netlink_bind() and again once the table is
grabbed. If it changed, the group was released, so check it again
against its current owner. ->netlink_unbind() is not called for it: the
family that ->netlink_bind() checked it against is gone.

bind() can then fail after it gave the socket its port ID. This only
happens when a family is unregistered meanwhile.

genl_bind() was added, with its first capability check, in the commit
in the Fixes tag.

Link: https://lore.kernel.org/netdev/179340003139.3131.11274717768928642724@kernel.org/
Fixes: 4d54cc32112d ("mptcp: avoid lock_fast usage in accept path")
Signed-off-by: Anil Kaushik <anilkaushikwireless@gmail.com>
---
 net/netlink/af_netlink.c | 61 +++++++++++++++++++++++++++++++++++++++-
 net/netlink/af_netlink.h |  1 +
 2 files changed, 61 insertions(+), 1 deletion(-)

diff --git a/net/netlink/af_netlink.c b/net/netlink/af_netlink.c
index fec2879c497d..e1af3ac4bf6d 100644
--- a/net/netlink/af_netlink.c
+++ b/net/netlink/af_netlink.c
@@ -780,6 +780,8 @@ static int netlink_release(struct socket *sock)
 			old = nl_deref_protected(nl_table[sk->sk_protocol].listeners);
 			RCU_INIT_POINTER(nl_table[sk->sk_protocol].listeners, NULL);
 			kfree_rcu(old, rcu);
+			kfree(nl_table[sk->sk_protocol].mc_gen);
+			nl_table[sk->sk_protocol].mc_gen = NULL;
 			nl_table[sk->sk_protocol].module = NULL;
 			nl_table[sk->sk_protocol].bind = NULL;
 			nl_table[sk->sk_protocol].unbind = NULL;
@@ -990,6 +992,8 @@ static int netlink_bind(struct socket *sock, struct sockaddr_unsized *addr,
 	struct net *net = sock_net(sk);
 	struct netlink_sock *nlk = nlk_sk(sk);
 	struct sockaddr_nl *nladdr = (struct sockaddr_nl *)addr;
+	struct netlink_table *tbl = &nl_table[sk->sk_protocol];
+	unsigned int gen[BITS_PER_TYPE(u32)];
 	int err = 0;
 	unsigned long groups;
 	bool bound;
@@ -1023,9 +1027,14 @@ static int netlink_bind(struct socket *sock, struct sockaddr_unsized *addr,
 			return -EINVAL;
 	}
 
+retry:
 	if (nlk->netlink_bind && groups) {
 		int group;
 
+		netlink_lock_table();
+		memcpy(gen, tbl->mc_gen, sizeof(gen));
+		netlink_unlock_table();
+
 		/* nl_groups is a u32, so cap the maximum groups we can bind */
 		for (group = 0; group < BITS_PER_TYPE(u32); group++) {
 			if (!test_bit(group, &groups))
@@ -1057,6 +1066,22 @@ static int netlink_bind(struct socket *sock, struct sockaddr_unsized *addr,
 	netlink_unlock_table();
 
 	netlink_table_grab();
+	if (nlk->netlink_bind && groups) {
+		unsigned long released = 0;
+		int group;
+
+		for_each_set_bit(group, &groups, BITS_PER_TYPE(u32))
+			if (gen[group] != tbl->mc_gen[group])
+				__set_bit(group, &released);
+		/* see netlink_setsockopt(), undo the others and retry all */
+		if (released) {
+			netlink_table_ungrab();
+			netlink_undo_bind(BITS_PER_TYPE(u32), groups & ~released,
+					  sk);
+			bound = true;
+			goto retry;
+		}
+	}
 	netlink_update_subscriptions(sk, nlk->subscriptions +
 					 hweight32(groups) -
 					 hweight32(nlk->groups[0]));
@@ -1686,6 +1711,8 @@ static int netlink_setsockopt(struct socket *sock, int level, int optname,
 		break;
 	case NETLINK_ADD_MEMBERSHIP:
 	case NETLINK_DROP_MEMBERSHIP: {
+		struct netlink_table *tbl = &nl_table[sk->sk_protocol];
+		unsigned int gen = 0;
 		int err;
 
 		if (!netlink_allowed(sock, NL_CFG_F_NONROOT_RECV))
@@ -1695,12 +1722,25 @@ static int netlink_setsockopt(struct socket *sock, int level, int optname,
 			return err;
 		if (!val || val - 1 >= nlk->ngroups)
 			return -EINVAL;
+retry:
 		if (optname == NETLINK_ADD_MEMBERSHIP && nlk->netlink_bind) {
+			netlink_lock_table();
+			gen = tbl->mc_gen[val - 1];
+			netlink_unlock_table();
 			err = nlk->netlink_bind(sock_net(sk), val);
 			if (err)
 				return err;
 		}
 		netlink_table_grab();
+		/* The group was released after ->netlink_bind() checked it, and
+		 * may have a new owner now. The old one is gone, so check the
+		 * group again without ->netlink_unbind().
+		 */
+		if (optname == NETLINK_ADD_MEMBERSHIP && nlk->netlink_bind &&
+		    gen != tbl->mc_gen[val - 1]) {
+			netlink_table_ungrab();
+			goto retry;
+		}
 		netlink_update_socket_mc(nlk, val,
 					 optname == NETLINK_ADD_MEMBERSHIP);
 		netlink_table_ungrab();
@@ -2031,6 +2071,7 @@ __netlink_kernel_create(struct net *net, int unit, struct module *module,
 	struct sock *sk;
 	struct netlink_sock *nlk;
 	struct listeners *listeners = NULL;
+	unsigned int *mc_gen = NULL;
 	unsigned int groups;
 
 	BUG_ON(!nl_table);
@@ -2052,7 +2093,8 @@ __netlink_kernel_create(struct net *net, int unit, struct module *module,
 		groups = cfg->groups;
 
 	listeners = kzalloc(sizeof(*listeners) + NLGRPSZ(groups), GFP_KERNEL);
-	if (!listeners)
+	mc_gen = kcalloc(groups, sizeof(*mc_gen), GFP_KERNEL);
+	if (!listeners || !mc_gen)
 		goto out_sock_release;
 
 	sk->sk_data_ready = netlink_data_ready;
@@ -2069,6 +2111,7 @@ __netlink_kernel_create(struct net *net, int unit, struct module *module,
 	if (!nl_table[unit].registered) {
 		nl_table[unit].groups = groups;
 		rcu_assign_pointer(nl_table[unit].listeners, listeners);
+		nl_table[unit].mc_gen = mc_gen;
 		nl_table[unit].module = module;
 		if (cfg) {
 			nl_table[unit].bind = cfg->bind;
@@ -2079,6 +2122,7 @@ __netlink_kernel_create(struct net *net, int unit, struct module *module,
 		nl_table[unit].registered = 1;
 	} else {
 		kfree(listeners);
+		kfree(mc_gen);
 		nl_table[unit].registered++;
 	}
 	netlink_table_ungrab();
@@ -2086,6 +2130,7 @@ __netlink_kernel_create(struct net *net, int unit, struct module *module,
 
 out_sock_release:
 	kfree(listeners);
+	kfree(mc_gen);
 	netlink_kernel_release(sk);
 	return NULL;
 
@@ -2113,6 +2158,17 @@ int __netlink_change_ngroups(struct sock *sk, unsigned int groups)
 	if (groups < 32)
 		groups = 32;
 
+	if (tbl->groups < groups) {
+		unsigned int *mc_gen;
+
+		mc_gen = kcalloc(groups, sizeof(*mc_gen), GFP_ATOMIC);
+		if (!mc_gen)
+			return -ENOMEM;
+		memcpy(mc_gen, tbl->mc_gen, tbl->groups * sizeof(*mc_gen));
+		kfree(tbl->mc_gen);
+		tbl->mc_gen = mc_gen;
+	}
+
 	if (NLGRPSZ(tbl->groups) < NLGRPSZ(groups)) {
 		new = kzalloc(sizeof(*new) + NLGRPSZ(groups), GFP_ATOMIC);
 		if (!new)
@@ -2157,6 +2213,9 @@ void __netlink_clear_multicast_users(struct sock *ksk, unsigned int group)
 	struct netlink_table *tbl = &nl_table[ksk->sk_protocol];
 	struct hlist_node *tmp;
 
+	/* the group can be given to another user, see netlink_setsockopt() */
+	tbl->mc_gen[group - 1]++;
+
 	sk_for_each_bound_safe(sk, tmp, &tbl->mc_list) {
 		/* bitmap predates the group, can't be a member */
 		if (group - 1 >= nlk_sk(sk)->ngroups)
diff --git a/net/netlink/af_netlink.h b/net/netlink/af_netlink.h
index 778a3809361f..d5e2e404fd11 100644
--- a/net/netlink/af_netlink.h
+++ b/net/netlink/af_netlink.h
@@ -64,6 +64,7 @@ struct netlink_table {
 	struct listeners __rcu	*listeners;
 	unsigned int		flags;
 	unsigned int		groups;
+	unsigned int		*mc_gen;
 	struct mutex		*cb_mutex;
 	struct module		*module;
 	int			(*bind)(struct net *net, int group);
-- 
2.25.1

