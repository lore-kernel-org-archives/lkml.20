Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098050;
	b=OcxmGrN9niAo1eIsNMsv0dBSoyZqtla5NbtO7TqBHq5WT4gImWElNzSDlRRPSs4JR6oW
	 D09ekA8DH2G+gup7Xr+gqvLcOPepgoD4NqiBJIlza60Z34N2Nd0xfOMz/av6jgUfEZE5y
	 712uUNkvf9f/re5Qllu73gIlEbNzzRpAetIfhhTssKGngdXOnxwIltkNqTONaBmf1nJuq
	 LglxPV1eQfqOpcMqaVP/7I2ZmjFcHKXrnGpuTi3lf8seqsBgVLhZreqCRJzAaUJpuabkw
	 YP+DwjoFfcO4mygYzJLO7zdSytCsv7LbESUIsHz4k8k0bOQ1WzGE9juIR4nJGeC0vnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098050;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KNgfDwC+3+GosfqLGHUx6kr+kkAHjH7KEB5LS7CnCmM=;
	b=q54uo0vMUjnpBvr4aa7/B0QCoC4CBgW03bA8l7rL8BZOG7ROsy++dtIB9yqU0XmUs8qI
	 DUfBn1coLeezsWpp3SqYpthAm5fRzRI/oZ7IKYIkz9uSVA1GbnJ5ebRpIMK+3yAe4uqRD
	 F49QZ2ZJ3ktQmZow9LjH2paHXTBo8GTv3Ia8Ivifv7JYRmIM5J6lIhdYDrIxeb3ljTGkF
	 m5IRoN+H47yBsBXVoyXdWgM5Gvg6HL6LdodGAKtpxO2oO8yrgkcUyh56fhjGynHspYu8r
	 pft76eGyBd4RMNlKFCl6XYZQ+NAx8/ULjB3jfHpL2ewM6wehyZts+QmawZ8pNdeqMig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MQKmLPZJ;
	arc=none smtp.remote-ip=74.125.231.64
Received: from mail-oa2-f0.google.com (mail-oa2-f0.google.com [74.125.231.64])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7845F606A333
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:47:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7845F606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MQKmLPZJ
Received: by mail-oa2-f0.google.com with SMTP id 586e51a60fabf-44cdbcd53b8so826885fac.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793098048; x=1793702848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KNgfDwC+3+GosfqLGHUx6kr+kkAHjH7KEB5LS7CnCmM=;
        b=MQKmLPZJuqcgyjnXyDxD/97XlTCvnNhUq2zFaKUbbWiYi5z8O2IpZhAHn1GVymp1kQ
         j7DW2bgalslQl2+/IGXCfHhSmtQVVPaA6O70ssIj7KARyNJBZbsgHbCx4Shs4gu3brlc
         t67KQMtNaVjBi1eL7CetaAX/3mubCTVDxvLcqwpKpczazzxFIBYEMWlCPoQAhTBbIKC8
         DbqYiw8tnf+mQQxH1FH4ktcyxqC5N72wt8W+RfCxikmlQIOW4pq1QhGK3kZg2FueRDbY
         /GM7m1trkNTyAzWVJAHYIzdstugpuQx7HBV5fuBZCkIVzQGbdIV/rpykyrYbNK5QmXkK
         NZBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098048; x=1793702848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KNgfDwC+3+GosfqLGHUx6kr+kkAHjH7KEB5LS7CnCmM=;
        b=VyJ0/qAuYDHrHNw5k+Om4I6LjUL5gPA9xBMGMZxiFITo3egfEvBsJfb+c/x+LFmbSF
         4zl+qC6IsntQXZDVyPSGY1j2GN6MTNxWqycQPbHKFg5b/AS6FM+GLyzJIsv5aVjUvNZW
         9g9MEmn0z17nOoE5jVDPmMscrAifNYqVndbxP4QgArSEeEMdni2gii/aVjFTq9V3wLjR
         yQ3hLAA6dpYCNPcbPwPycNmGgV5duSb+MSJ2TPYzEGMBfa54xPW0FAGq8tSnWKAhYxPz
         6Gnb+xd78wgx7ohqtbko8rOFr/ZSlA/hoCt9lYUmyDP3SqO3A3mBDoM1mLKpuihDHXoo
         RFbg==
X-Forwarded-Encrypted: i=1; AKwUvBz81rkplA4GeimeM2H3GkE0WQAfkvvSRSAj95eRy1ndN8CTjYzSAuALcsNZNwe3/9gDfYf0DI2/LcQDJUk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIIy8jVrOkMcf1cMrqTKTkqXNwkXmWm68EmfDrmPf79LSZf+HFh
	oFApSJMXVoDhn3GSvE8vPC4NjVWlB2M2nokg3olRyOg2hmQM7/2LqgJh2L48cV8zvZE=
X-Gm-Gg: AYBFou0R/VzIighfQEN48imNwBKoOmDhjT/ccaDBUyj5rPNTlddyMG+91FzR0aQdzTX
	FbtqLhqsBa7qA1fU2197ae4KafHM4q8k951V3qCu0dpIi8Crb0eonfSDJQ8rwCnz8EFWr0Uk6Nt
	yS41j+Xgxkq+o15whaUnZQhseuF0G2qlU1hSD5CeJ2DxUbmbN6zRAE1fpBm0e0LZnuS+JZxE9Zu
	cMLsbJvizFhm1fVU2p89UVB6Em7EZFIHBjl1qzywp2cooh0fu417EuXP1s/IcU5qW5f1fsrwFWG
	8y4jFhpQYV+aphxXPy0jC09WkIRbStdyp/U4Vz5UEt/WTyBKWQUwe6lED7KoZA1pybzfu/Kgio/
	Trrh9pTSO5spF+muy1cpoouxF69zPpsFwVoXAU7kbSRHpyWx3wznPMKPgLNOcYui1Rh/acShF5s
	u6r7ARyC5TFSXS8AtkVJgTIyhvfWD2OaoGNbK9ZyS3+so4bNUrG2EkSdllsBe4OyNBqBcZcxQVL
	DpLfsZAy9YyIVKqoCX2jcNP7PNHY52pZalNNYGStCq/r5Wf+vofyl/7HjHHWewX9oizw0JFvRfh
	7dkLMqqyrccEqvTjLJbH+2gkeRXFV7FYbNlQhqDiNdTKmX64BDxaG7XUJnEu2bDlk/GcAQ==
X-Received: by 2002:a05:6870:658a:b0:4a7:df5e:d6ee with SMTP id 586e51a60fabf-4a83f53b9aemr5207325fac.45.1793098048302;
        Tue, 27 Oct 2026 03:47:28 -0700 (PDT)
Received: from localhost.localdomain ([14.116.239.36])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a842e89b77sm6597299fac.2.2026.10.27.03.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:47:26 -0700 (PDT)
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
Subject: [PATCH net v4 1/2] vxlan: reject adding a remote to a nexthop fdb entry
Date: Tue, 27 Oct 2026 18:47:12 +0800
Message-ID: <20261027104713.328028-1-bsdhenrymartin@gmail.com>
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
