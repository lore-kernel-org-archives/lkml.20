Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24BC400966
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 10:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791629881; cv=none; b=YlCSeIvWd7PM96cUZ7lmW8p3EgD8lTEuLM/aF807DeMKhbeH9n7bNQ3Kss0SSMtN7Bk1cyYaoiMyFfUIF0/Mi0oaDZNZJVh4Lca24DI1XNr8GgqJWRgaztpUUgp23nyeBrPAHY2vzJYAwDLba5UdDgasTKxce0DTSxISRAa2Cfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791629881; c=relaxed/simple;
	bh=CSVn/bx1PrbK9bFpzbIOMvQRjbhjJBLI1cvsNvJUg2Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=n4yxuq7gjsVjNOm+tEPub39pc5BY6bUZKk0ypCnS0pS1qI4yclVUB/qQCSKj83pzd8iD0WP76kvmOO7tO256RxMnUGm9YZV3DOZXLhg6p4GiJp5EjWVsj5fePuSqIW0I7ODsRJ4uROKfUizgxmlExlxYV16KKs0CVTOtB3MSpRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mh9Dj9Fz; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mh9Dj9Fz"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-15dd124bbe7so1045883c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 03:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791629879; x=1792234679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YA+yBi7KEybX/R08i8C4eMRq93G7KT8yCW9WhDvWv8E=;
        b=Mh9Dj9FzxtbsSLQhbS7imYL7EVf2A68WZBMmLN3XsJ2PsfcU9K+HMsHz3sGC+U+ZbM
         5mOEyOW1hLzihcW3ygTWo66a1nhoM6xWjZFaiX5oPAbxIgzPtuGYFEvi/J7tG5N9MyZa
         QkQl0Xu96aBxBQrq3doOAg0T6PBzSddUV4L7D36qhR0n8P5v6Im6RNGs0xN6xxtmPa64
         0BHjb5KtoiaPqljm1gNBREoeAVBzTyHvLCG4KVj8smYc5FrKeME+zxOpdqZQvfQtJSIi
         bRB5xDrRA3azwQCHBgEQzX/VN+zzUaZLOVfpkB2KDpQP57xE30eUoNl8C9D+oQblfOIz
         DNSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791629879; x=1792234679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YA+yBi7KEybX/R08i8C4eMRq93G7KT8yCW9WhDvWv8E=;
        b=X4LReLAPTZFwzSyQ1RDEXdVy6kvupnA5NqQrRA4+wtJrYu9N3X3330d9aB4jDFJVte
         ACwFUj/2s3ojxXCuhSPRxn6jIDnIuykh4sFnQQjj0Suk2jk0PtMnbGYeDGt88g6WTz3i
         esV+GaTLNexLMMPhQdaAqEdsaY35xkLkc6Hzf9RH5a/fDsT9hKsyutnOVNAvbs3L1osU
         lNaB+V4wxcokbUY5FLGAJ+s2CSvbTw7FtikAh7VeuURBSjKxz80wwm0foaBlkAsvk+Si
         wRzOO3olOC2qhxTR0jw1eEi1tb/ygaAJWI/k1EIh5HgA8OROh7crSxboTCWfZazk5ahP
         g3TA==
X-Forwarded-Encrypted: i=1; AKwUvByUBTriCBMRC0syqAtUcv3I6dgEiJ/chZh6QuzgozlXElji2Y1bq9DaxWMiWOQWqg8rOxhtDCANY+E7IbU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIG6ATDksAImt1VhzNrFtuQDAGWdWGwN4hnbG12i6vgQzg47RIe
	rvGN1Y/Rpvu1xI7ulzMpqOf5+IybOmXwrkRv3Hqzd7Kkgvt9ONMr69re
X-Gm-Gg: AYBFou3DPYbv97IHeYQJ9EYeV48pfMREYw9Lpa5U2o5cFI5lGSqYulZujByyAeGzJhY
	BRigfGsl9pqvySaMec3A3h9Yg3J0rEwjCTgKyDeR2E00DHJrTfVW8LPsz6tcfFI5p6JYYRFb97D
	9BirKRY0GPYMQvP+1ZCsBYnXwabFbKrbSSljRPep85dMZ93gATYLxrjyi9xdcMky4AqFZQ4YenI
	u3V94hAmDCYtzNTHhA1svJRSm/nM0QiDBeDOJncsxYVeR69RDipEgZXKfRFNnFUjW06gJeyH9OB
	DIcgoYRClWBzGTxAf7QwKGRt8MJEirOkwu7uAZzJ8rX23MecCUXMF7cZS6hpiBmQztDOD0DwM9A
	EjmAA8vAVyKk+bG6j2V7Xs1B00h+RKIt5/7Ob7cG6zpz5jZmDsU7K9utEcwYa3vkWmq/Lgp0mAG
	QKDfUP2joO9qAJlAulnDIZq2lIN/73AcgL6Usz55Wek8AVlWsW/RVeqk1dgKXcZ1ncr8QBmywdP
	4hqWkoq3bXypwTd9sIIe0MjzT7DHgQ1ayDbycvQhbrUOAc9S4LNH5S2qI9s0Kg1EAbFTCJ3LG44
	beQJT33cYaQaAC68GHACYYNg7NBjBqFFIetC8rgUM1iGE3L4YbutXWs=
X-Received: by 2002:a05:7022:b055:10b0:15d:63db:9426 with SMTP id a92af1059eb24-16a55673ae0mr6117464c88.5.1791629878863;
        Sat, 10 Oct 2026 03:57:58 -0700 (PDT)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-353810403e9sm13577784eec.2.2026.10.10.03.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 03:57:58 -0700 (PDT)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Harald Welte <laforge@gnumonks.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Shuah Khan <shuah@kernel.org>,
	osmocom-net-gprs@lists.osmocom.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anil Kaushik <anilkaushikwireless@gmail.com>
Subject: [PATCH net-next v4 2/3] netlink: specs: add genetlink-legacy spec for GTP
Date: Sat, 10 Oct 2026 10:57:39 +0000
Message-Id: <20261010105740.223992-3-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261010105740.223992-1-anilkaushikwireless@gmail.com>
References: <20261010105740.223992-1-anilkaushikwireless@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GTP (GPRS Tunnelling Protocol, user plane) generic netlink family
has no YAML specification under Documentation/netlink/specs/, so it
cannot be consumed by the ynl tooling used for user-space clients,
documentation and selftests.

Add a genetlink-legacy spec describing the existing family: the PDP
context management commands (NEWPDP, DELPDP, GETPDP) and the GTP-U echo
request (ECHOREQ), the GTPA_* attribute set, and the "gtp" multicast
group. Command and attribute values are taken from
include/uapi/linux/gtp.h and match it one-to-one. The request
attributes of each command are the ones its handler in
drivers/net/gtp.c reads, and the reply attributes the ones
gtp_genl_fill_info() emits.

This only adds the description; there is no kernel code or uapi change.

Signed-off-by: Anil Kaushik <anilkaushikwireless@gmail.com>
---
 Documentation/netlink/specs/gtp.yaml | 171 +++++++++++++++++++++++++++
 MAINTAINERS                          |   1 +
 2 files changed, 172 insertions(+)
 create mode 100644 Documentation/netlink/specs/gtp.yaml

diff --git a/Documentation/netlink/specs/gtp.yaml b/Documentation/netlink/specs/gtp.yaml
new file mode 100644
index 000000000000..2c61c4353c89
--- /dev/null
+++ b/Documentation/netlink/specs/gtp.yaml
@@ -0,0 +1,171 @@
+# SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
+---
+name: gtp
+
+protocol: genetlink-legacy
+
+doc: |
+  GPRS Tunnelling Protocol, user plane (GTP-U).
+
+  The gtp netdevice encapsulates and decapsulates user plane packets in
+  GTP-U tunnels (GTPv0 and GTPv1-U, see 3GPP TS 29.060 and TS 29.281).
+  This family manages the PDP contexts that describe the tunnels and
+  triggers GTP-U echo requests. It is driven by user space control planes
+  such as those built on libgtpnl.
+
+kernel-policy: global
+
+attribute-sets:
+  -
+    name: gtp
+    name-prefix: gtpa-
+    attributes:
+      -
+        name: link
+        type: u32
+        doc: ifindex of the gtp netdevice the context is attached to.
+      -
+        name: version
+        type: u32
+        doc: GTP version of the context, 0 for GTPv0 or 1 for GTPv1-U.
+      -
+        name: tid
+        type: u64
+        doc: Tunnel identifier, GTPv0 only.
+      -
+        name: peer-address
+        type: u32
+        byte-order: big-endian
+        display-hint: ipv4
+        doc: |
+          IPv4 address of the remote GSN peer (GGSN or SGSN). Also known
+          as GTPA_SGSN_ADDRESS, kept for legacy user space.
+      -
+        name: ms-address
+        type: u32
+        byte-order: big-endian
+        display-hint: ipv4
+        doc: IPv4 address of the mobile subscriber served by the context.
+      -
+        name: flow
+        type: u16
+        doc: Flow label, GTPv0 only.
+      -
+        name: net-ns-fd
+        type: u32
+        doc: File descriptor of the network namespace of the gtp netdevice.
+      -
+        name: i-tei
+        type: u32
+        doc: Ingress Tunnel Endpoint Identifier, GTPv1-U only.
+      -
+        name: o-tei
+        type: u32
+        doc: Egress Tunnel Endpoint Identifier, GTPv1-U only.
+      -
+        name: pad
+        type: pad
+      -
+        name: peer-addr6
+        type: binary
+        checks:
+          exact-len: 16
+        byte-order: big-endian
+        display-hint: ipv6
+        doc: IPv6 address of the remote GSN peer (GGSN or SGSN).
+      -
+        name: ms-addr6
+        type: binary
+        checks:
+          exact-len: 16
+        byte-order: big-endian
+        display-hint: ipv6
+        doc: IPv6 address of the mobile subscriber served by the context.
+      -
+        name: family
+        type: u8
+        doc: Address family (AF_INET or AF_INET6) of the context addresses.
+
+operations:
+  list:
+    -
+      name: newpdp
+      doc: Create or update a PDP context.
+      attribute-set: gtp
+      value: 0
+      dont-validate: [strict, dump]
+      flags: [admin-perm]
+      do:
+        request: &pdp-attrs
+          attributes:
+            - link
+            - version
+            - tid
+            - peer-address
+            - peer-addr6
+            - ms-address
+            - ms-addr6
+            - flow
+            - i-tei
+            - o-tei
+            - family
+            - net-ns-fd
+    -
+      name: delpdp
+      doc: Delete a PDP context.
+      attribute-set: gtp
+      dont-validate: [strict, dump]
+      flags: [admin-perm]
+      do:
+        request: &pdp-find
+          attributes:
+            - link
+            - version
+            - tid
+            - ms-address
+            - ms-addr6
+            - i-tei
+            - family
+            - net-ns-fd
+    -
+      name: getpdp
+      doc: Get or dump one or more PDP contexts.
+      attribute-set: gtp
+      dont-validate: [strict, dump]
+      flags: [admin-perm]
+      do:
+        request: *pdp-find
+        reply: &pdp-reply
+          attributes:
+            - link
+            - version
+            - tid
+            - peer-address
+            - peer-addr6
+            - ms-address
+            - ms-addr6
+            - flow
+            - i-tei
+            - o-tei
+            - family
+      dump:
+        reply: *pdp-reply
+    -
+      name: echoreq
+      doc: Send a GTP-U echo request to a peer.
+      attribute-set: gtp
+      dont-validate: [strict, dump]
+      flags: [admin-perm]
+      do:
+        request:
+          attributes:
+            - link
+            - version
+            - peer-address
+            - ms-address
+            - net-ns-fd
+
+mcast-groups:
+  list:
+    -
+      name: gtp
diff --git a/MAINTAINERS b/MAINTAINERS
index 51873349ba91..a6e43995ea58 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11421,6 +11421,7 @@ M:	Harald Welte <laforge@gnumonks.org>
 L:	osmocom-net-gprs@lists.osmocom.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pablo/gtp.git
+F:	Documentation/netlink/specs/gtp.yaml
 F:	drivers/net/gtp.c
 
 GUID PARTITION TABLE (GPT)
-- 
2.25.1

