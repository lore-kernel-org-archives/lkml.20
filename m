Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.73
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793186201;
	b=L9OXAo1mlBofJQ8J/xiqy4dXTijnniig5Rhi5s6FcJvuimsC+TE9DTXY9SdzT2HOGn+r
	 zMqb6Rzk7UwTjHUHXhmi8SpYM5oNmVh0fiNHIIBxaheImrLDiyN6uMJoaaRVYiqXa+uUd
	 +9VUdpD0Nr8L69bxeRqXCPsNYgzYQeC5jp2HjI3iu6pDkXRSs87sZVvE6cX3wvQQAeKaO
	 qVe/nbLoqVsC7JQh9ilQ6fJ3anqZ/BOMiGvL99taG1OYCsanqZP103v8z/A18CXA7JhDj
	 pc33qQOJh0VVesOERMkuPbxdx2LppZ+ezu+ITI1jBBF1NAbkz6X7sdc6Q9Wd/E7RVOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793186201;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6CsZbajnX+G6EuNM0dqIWI4/9BGRckaGe/eL9AlMfp8=;
	b=XNf1Fm4sVoK35SBicD1bkGX9rwRtfzZLRkkWtaMWqbDvIp79/CojbyMEpqTik75XLgMs
	 XTc6iW69Zuj4H2Mx1MEneXzWcF1fCpz7wR9b+gvI3rmA722oZaLeABL1j57s1ewgnspI5
	 m3sWbcA30YvuZGKtVJXAxCPSXGOvmO8QwXftIZaaK9mVnqVpiKit3jwdmyeHYXNnso4qK
	 cBhlThPt4g4FqWEgSKN35Zj+/ildT0iWppbG2U5lxw3OPy3txAvNhNMavMc1PfPWASn3v
	 BP4jHtKtRNH06nRwH91udaZgcDPgk23gnvhm44mJEBOs+EzTzaHG6LR/0alF9NhHBjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h2jREAOS;
	arc=none smtp.remote-ip=74.125.231.73
Received: from mail-oa2-f9.google.com (mail-oa2-f9.google.com [74.125.231.73])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81B5606A322
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:16:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C81B5606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h2jREAOS
Received: by mail-oa2-f9.google.com with SMTP id 586e51a60fabf-47bd4bcc3e2so311259fac.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793186200; x=1793791000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6CsZbajnX+G6EuNM0dqIWI4/9BGRckaGe/eL9AlMfp8=;
        b=h2jREAOSuuQ72nqFvBTUYdWom2DGLw0p6qr5n8hSBNKHH+Tdm4XDi31OoSdAQFsHFD
         1NQiDxeYXTeq3GqMlYTesswoboxDtEtPhX9APEKg1ivRVGFHLYiCAfjtendZ9clfDiFK
         tC5Wxqh+hOP77QNih6iRcADM3ZK5rKrvknqPnU6+LvIVj2wvmSkknMiodIofXTAHrMZ2
         oNGAl9NuGErpdhDN1qW2n3oVl78df1GgeStnjta+lzG4kC2eafJCBuwuHMBy8I4lRLtA
         ++5ml9dntmHPYjL2bkcrLs3wLpv6MK2s0VJUJhKVyZ+cqGjMNeffsQ3OPtnZX+oNXdMB
         C8bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793186200; x=1793791000;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6CsZbajnX+G6EuNM0dqIWI4/9BGRckaGe/eL9AlMfp8=;
        b=OpGKc4cZAv2oVOAXlPRUVzWXozejJg7NE4ve6G5Q7rDc6J7K88cO+lLG2X4ewVEcaU
         YnoVqmPaxjtjXPFJRaYOdt2yqBa8AE0UQJ2AMsJcZBAYxsqmnQgItsjVnp0BGiVE0zbf
         b45vWUuhO4CGKM9focWubqxLseXkMehRChA2waADGQFW62cc6H7a5MaPceahhofEndOZ
         lB4kIaKUQt4scQMjEKQkE9t0MUcYGdPEHGkyQ+k6dDHQF8nlSGh93uGTR+0z3YDt5l9z
         GdFqbHwOpIeoBtmbuQP8odMZQc/VfF41CpILzNxHvCmJ47/TyaZXvrfj+GCR5Nfb0YdP
         DTVA==
X-Forwarded-Encrypted: i=1; AKwUvByXX7R8bWU61KmMEiHPbQbejKDoWhGbLgXY+KUQ8PMbdSMsP3ZmacpKFcCG/ejdISkYDzn0GkveirmgTTA=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7Wj7/hcVnZIZlOC7WdX1lfueIPK0M/IkzBtxjyai75gUXoYnw
	tq0kCDB+Uwm1RvAfLCilJdGSXMQmdyZOwEHyOVFM2bvJBHJ3tgTbWpGHsXXJ9Y+rtxIQXQ==
X-Gm-Gg: AYBFou3/qc3FuiMBY/avUSSKpm6/96abO4MhzHonP1YIOR+acKb3onc84qvgjSkFZPJ
	nb067S2BxjTq4QpwkD43+KcG7nWiOkUS0ER0CMSBq0gLXJYx7mX+J6dNQtWCHiSWtcQ632kFnGh
	EeRvVjvYRdu4wbGNsQco1/ZteHAbnnCrGNh2dENczls/JpegI6mJnpkVrMSL4AZYoJeVx/TN8gn
	BdRvk95gWQ2JBR8Ehw2qAAKKO8z09H7wGc64qbCWpMHuLdbntwZooO9lQj1oI/Pap1YodUQb+Yo
	Yowvcc6ftrJ6vjwjzyOyUQlhTHnCwFLMOL0lEDaUDxs16ZGhnRLu+cu23hif+zlM5EAevX7e/q/
	DO6Ql74ixo8BcAfVIaFRo8xkJgtMDuHzM6F+8F5hF91FzIHmkMgFSzsBM0kfy9qSt5ZhG8HxXXK
	LVPMVtKFJ6vGemg5bU2F9ZimV5flxV5ibt3WS/e6g3RR5DOwLHBDcuxtOXDVxJ/H1fnsffMIgLY
	/V8NY2/sTSQFp+XKLfq7aRztGmeLuT+yM0f8ZCf1bJ+JH9a9ndCe7YpdBi0+KV0YjaN5SADMtjI
	dQ1I974BDyu+lYIX/C1uTm0fxGPxsTvOzyUocuzwJq7Q7tocLpiJtct3j5TRE69hj6mr
X-Received: by 2002:a05:6870:1415:b0:49e:f:1e42 with SMTP id 586e51a60fabf-4a8bb76a453mr1550624fac.60.1793186199604;
        Wed, 28 Oct 2026 04:16:39 -0700 (PDT)
Received: from localhost.localdomain ([14.116.239.34])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a8b77ac4e4sm2003351fac.3.2026.10.28.04.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:16:38 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: Ido Schimmel <idosch@nvidia.com>,
	Ilya Maximets <i.maximets@ovn.org>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Petr Machata <petrm@nvidia.com>,
	Ferruh Yigit <ferruh.yigit@amd.com>,
	Antoine Tenart <atenart@redhat.com>,
	Seungwon Bae <qotmddnjs@gmail.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net v5 1/2] vxlan: reject adding a remote to a nexthop fdb entry
Date: Wed, 28 Oct 2026 19:16:25 +0800
Message-ID: <20261028111626.3460759-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.43.7
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

FDB entries backed by a nexthop group must not carry a remote
destination list.  vxlan_fdb_update_existing() currently appends a
remote via vxlan_fdb_append() on an NLM_F_APPEND request with a
multicast or zero MAC even when the entry is backed by a nexthop,
breaking that invariant through three different callers:

- "bridge fdb append" with a dst on a nexthop entry;
- "ip link set dev vx0 type vxlan remote <ip>" (vxlan_changelink());
- "bridge vni add" on a vnifilter device
  (vxlan_update_default_fdb_entry()); this includes a plain
  "bridge vni add vni N" without a group, which falls back to the
  device's default remote, and a unicast group.
All three reach the append block with nhid == 0 and a PERMANENT
state, so they pass the earlier nexthop checks.

There is no crash and no leak: the appended remote is freed with the
entry, and the transmit path ignores it (vxlan_xmit() follows the
nexthop whenever f->nh is set).  But the stray remote changes
deletion semantics: __vxlan_fdb_delete() destroys the whole fdb entry
when the matched remote is the only one on the list, so removing it
via "bridge fdb del ... dst <remote>" or "ip link set ... remote
0.0.0.0" tears down the nexthop entry, not just the stray remote.
The entry state is also misreported: vxlan_fdb_notify(), RTM_GETNEIGH
dumps and the switchdev FDB programming all prefer the remote list
over the nexthop, so user space sees the dead remote while the
datapath follows the nexthop group.

Reject the combination at the top of vxlan_fdb_update_existing(),
next to the existing nexthop guards, so a refused request has no side
effects.

Also move the non-unicast NLM_F_REPLACE rejection to the same place;
it previously returned -EOPNOTSUPP only after the entry state and
flags had been rewritten, skipping both the notification pass and
the err_notify rollback.

Note the resulting behavior change for the rtnetlink callers:
operations that previously succeeded while silently attaching a
remote to a nexthop entry now fail with extack
"Cannot add a remote to a nexthop fdb entry".

Add test cases to fib_nexthops.sh in the same fashion as the sibling
fix, commit 98fc57d16744 ("vxlan: reject dynamic fdb entries that
reference a nexthop id").

This issue was discovered by Tencent CodeBuddy Security.

Cc: stable@vger.kernel.org
Fixes: 1274e1cc4226 ("vxlan: ecmp support for mac fdb entries")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---

v5: no changes to this patch.

v4: Also move the non-unicast REPLACE rejection before the entry is
    modified (the same half-update class, pre-existing), describe the
    stray remote's effect on __vxlan_fdb_delete() instead of calling
    it "unused", and note that a plain "bridge vni add" or a unicast
    group hits the check too (sashiko review of v2).

v3: Describe the actual consequence and add fib_nexthops.sh test
    cases as requested by Ilya Maximets.

v2: Move the check before the entry state/flags update, next to the
    other nexthop guards (reported by sashiko, confirmed by Jakub).

 drivers/net/vxlan/vxlan_core.c              | 26 +++++++++++++--------------
 tools/testing/selftests/net/fib_nexthops.sh | 18 ++++++++++++++++++
 2 files changed, 40 insertions(+), 4 deletions(-)

diff --git a/drivers/net/vxlan/vxlan_core.c b/drivers/net/vxlan/vxlan_core.c
index 3390e341d1e58..13143085065f6 100644
--- a/drivers/net/vxlan/vxlan_core.c
+++ b/drivers/net/vxlan/vxlan_core.c
@@ -1002,6 +1016,22 @@ static int vxlan_fdb_update_existing(struct vxlan_dev *vxlan,
 		return -EOPNOTSUPP;
 	}
 
+	if (rcu_access_pointer(f->nh) &&
+	    (flags & NLM_F_APPEND) &&
+	    (is_multicast_ether_addr(f->key.eth_addr) ||
+	     is_zero_ether_addr(f->key.eth_addr))) {
+		NL_SET_ERR_MSG(extack,
+			       "Cannot add a remote to a nexthop fdb entry");
+		return -EOPNOTSUPP;
+	}
+
+	if ((flags & NLM_F_REPLACE) &&
+	    (is_multicast_ether_addr(f->key.eth_addr) ||
+	     is_zero_ether_addr(f->key.eth_addr))) {
+		NL_SET_ERR_MSG(extack, "Cannot replace non-unicast fdb entries");
+		return -EOPNOTSUPP;
+	}
+
 	/* Do not allow an externally learned entry to take over an entry added
 	 * by the user.
 	 */
@@ -1018,22 +1048,18 @@ static int vxlan_fdb_update_existing(struct vxlan_dev *vxlan,
 	}
 
 	if ((flags & NLM_F_REPLACE)) {
-		/* Only change unicasts */
-		if (!(is_multicast_ether_addr(f->key.eth_addr) ||
-		      is_zero_ether_addr(f->key.eth_addr))) {
-			if (nhid) {
-				rc = vxlan_fdb_nh_update(vxlan, f, nhid, extack);
-				if (rc < 0)
-					return rc;
-			} else {
-				rc = vxlan_fdb_replace(f, ip, port, vni,
-						       ifindex, &oldrd);
-			}
-			notify |= rc;
+		/* Only change unicasts; non-unicast replace is rejected
+		 * before any state is modified.
+		 */
+		if (nhid) {
+			rc = vxlan_fdb_nh_update(vxlan, f, nhid, extack);
+			if (rc < 0)
+				return rc;
 		} else {
-			NL_SET_ERR_MSG(extack, "Cannot replace non-unicast fdb entries");
-			return -EOPNOTSUPP;
+			rc = vxlan_fdb_replace(f, ip, port, vni,
+					       ifindex, &oldrd);
 		}
+		notify |= rc;
 	}
 	if ((flags & NLM_F_APPEND) &&
 	    (is_multicast_ether_addr(f->key.eth_addr) ||

diff --git a/tools/testing/selftests/net/fib_nexthops.sh b/tools/testing/selftests/net/fib_nexthops.sh
index 431d7bed76224..bdc23205bde4c 100755
--- a/tools/testing/selftests/net/fib_nexthops.sh
+++ b/tools/testing/selftests/net/fib_nexthops.sh
@@ -547,6 +547,15 @@ ipv6_fdb_grp_fcnal()
 	run_cmd "$BRIDGE fdb append 02:02:00:00:00:17 dev vx10 dst 2001:db8:91::11 self dynamic"
 	log_test $? 255 "Fdb mac append with nexthop group and dynamic state"
 
+	# fdb entries with a nexthop group cannot take a remote append
+	run_cmd "$BRIDGE fdb add 00:00:00:00:00:00 dev vx10 nhid 102 self static"
+	run_cmd "$BRIDGE fdb append 00:00:00:00:00:00 dev vx10 dst 2001:db8:91::11 self"
+	log_test $? 255 "Fdb append with nexthop group"
+
+	# fdb entries with a nexthop group cannot be replaced with a non-unicast MAC
+	run_cmd "$BRIDGE fdb replace 00:00:00:00:00:00 dev vx10 dst 2001:db8:91::11 self permanent"
+	log_test $? 255 "Fdb replace with nexthop group"
+
 	run_cmd "$IP -6 ro add 2001:db8:101::1/128 nhid 66"
 	log_test $? 2 "Route add with fdb nexthop"
 
@@ -697,6 +706,15 @@ ipv4_fdb_grp_fcnal()
 	run_cmd "$BRIDGE fdb append 02:02:00:00:00:17 dev vx10 dst 10.0.0.3 self dynamic"
 	log_test $? 255 "Fdb mac append with nexthop group and dynamic state"
 
+	# fdb entries with a nexthop group cannot take a remote append
+	run_cmd "$BRIDGE fdb add 00:00:00:00:00:00 dev vx10 nhid 102 self static"
+	run_cmd "$BRIDGE fdb append 00:00:00:00:00:00 dev vx10 dst 10.0.0.3 self"
+	log_test $? 255 "Fdb append with nexthop group"
+
+	# fdb entries with a nexthop group cannot be replaced with a non-unicast MAC
+	run_cmd "$BRIDGE fdb replace 00:00:00:00:00:00 dev vx10 dst 10.0.0.3 self permanent"
+	log_test $? 255 "Fdb replace with nexthop group"
+
 	run_cmd "$IP ro add 172.16.0.0/22 nhid 16"
 	log_test $? 2 "Route add with fdb nexthop"
 
-- 
2.43.7
