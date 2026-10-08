Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCFD3C0603
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 18:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791483059; cv=none; b=Ewv1CUFpQf09aEaMOfJ+boVznHXkr7/qQLjtpnpoSLgczIt3F2okMpONR3nKAz1h8bSR2pcsK59wN7WAvrPtGmtchHR6mK4FUZVzr0oFjNuzhXGD4WMnplTcqHUVu4pOtCZjJjCK2zyBXYpR24IlxFySO28ldCBXKdCWVQDjIUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791483059; c=relaxed/simple;
	bh=GdwEpgAXRzdLPGLowuS38MRQbJCymEeH0/+Qr91J4hc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OJdVz+OVfn9WT9JKUCHQDIyq5mBSxSHXWQ2gErhmQh5DkBhlvvHsqpnlBpLoNPHTb7YqRFRbnQr8bDJRgrXYgg1TGUGtADYCACpHZCtO/p2GuD3dRamA1pCoU2150bo91dxh6CyhCxaII/e9qUxe0hDfRDCu89SItzUtMEE50RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jzWVL+Sd; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jzWVL+Sd"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-34bb8b31647so8655770eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 11:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791483056; x=1792087856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mvGXiPiHpimUTJd3v9MQIw2AZILZ1+jCLyBE+b25BWk=;
        b=jzWVL+Sdcxv2GKk5A1fOJ4PRmfjCe+ee3dyhxFyjn7dK1nmHsB5rRMJrPDS3g2nHZ4
         yGaQWuNEoajNQGCxt+kIah3r+yqRh+5g6YkptL1vc7P0DMR6dtaJpifzKTQeRp9dXX3N
         clZYY63l7EAKw56qGyEgyUsc5I4chkVXa+5BLTJMaj/G0S/amOkkK5fCAw/wR7HwwsKm
         GDtRpGaFn3pvnXkE8qXXRH2HzSd2MGgOT/kS60Md3Q164zanSXYCC2MDq4AZM1sqMSZI
         NWRncidGFRN0oHKBDLb+lM/7A7btJhkjs1lbWPo69VCwjY2pJOAOmDGFTrmBzffcVCtH
         07XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791483056; x=1792087856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mvGXiPiHpimUTJd3v9MQIw2AZILZ1+jCLyBE+b25BWk=;
        b=2A2L/xCt3VblpfeG3JdCfHjQJHpnHHgEMfJ4af/tVodZtaUKPaHpTEOD1oiTggtLJn
         Ndba6WaK+a35MwqMJCyfPLqQvfz1AFeZCi+Ed24joIdpuCWvp4KMCBH8fm2rj5ZPTAdw
         2kocjNfFv7+8eKCuEfjU1UG+4V/r18w29M9fxGcz/cyK2YJoDvnGECM9Ies0fJjFftCI
         zE62ZdUkT01AvBmmaIP0mGkw3PgGjyBgWHIb64SOPfSdEZGsRyQUky/mXLVNwdmaQ7lB
         gNG6pVx1BW54I+XdYFBTBt4IMy48S8Jfdkewi45IPn6FvxxbjP/pw16LcQNBTjvgmAmz
         PHjQ==
X-Forwarded-Encrypted: i=1; AKwUvBwOUcgkDm7iWKdEuIzQBhB/tGtNtA3CA3CBdaS4WcUsPbyXgCX+JUpVhpTgq6LHNpL51Keh/aTajZU7EHs=@vger.kernel.org
X-Gm-Message-State: AFuF++nnvOr3FIxUlju5aZxDyOccpmhMiy/sJEx191lsLMtsLdfQMfZw
	NxugdfJ9XBVSs4yHgpJ2kAwythdIKbB+tiePIKJQe1kMM7b/61k81QmI
X-Gm-Gg: AYBFou3TZ18PeEK/mM6e0GoavSFE8T0uYR5jTmUqZeTo5xtS+dvD1amaVz2mSZiz4a/
	4/gi6jVLOifbrGs0D/WOB1nVrOsfRHrsrSuXa1I4got2qbWmToyHd712APV1+Tc2mGy2L40lsGC
	8UUFXscFanBf1JPBQSkFUaUO7+ypHcpSuyfpIuC2gzVl0dB0lc2HhwC60YJJSv6960j5h7h14Dc
	5CX21W9SKFnHXKVPAewelj9l6PX3Em9JDYGRAhLhLQAiT1lcB2lN9h3DZRvhSU83DLLlB8cxW7G
	4vUl5HSd/EA7b1aCpNxrqoRfkcVX0y7BXQBRumZNYXfWsAzyfXoWeF2XSnfmxdaw6zftKq5SsoA
	KYgmFx/mSABvWU2X92z/3a4fMDx0RMc1NxTo4zDRLi0la0uRJa8w0cbQNsVmqAlmjn6ODw9Rqug
	hEcqdsZFIKM1JmzAd6dce/QHIGvzcyqFRcZUOXH9iwN6WsBS6zUm2AvSGQJ1RPY7/0YZF5uiutS
	VeRD7tETTgLTEmfHxylArikJpsoBDqtwOgwV1msZz5u9HSbYCm4EZjAtUQW9qGhyZZaMicUoa4F
	rCAum/6OOyInu8Y1nZtwx5xgAHf08F4DAI73G5vw7mk=
X-Received: by 2002:a05:7301:678f:b0:351:5af1:f53e with SMTP id 5a478bee46e88-3515df405e2mr11128340eec.29.1791483054914;
        Thu, 08 Oct 2026 11:10:54 -0700 (PDT)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537b479e76sm162161eec.26.2026.10.08.11.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 11:10:54 -0700 (PDT)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Harald Welte <laforge@gnumonks.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	osmocom-net-gprs@lists.osmocom.org,
	linux-kernel@vger.kernel.org,
	Anil Kaushik <anilkaushikwireless@gmail.com>
Subject: [PATCH net-next v2 2/3] netlink: specs: add genetlink-legacy spec for GTP
Date: Thu,  8 Oct 2026 18:10:30 +0000
Message-Id: <20261008181031.4129029-3-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261008181031.4129029-1-anilkaushikwireless@gmail.com>
References: <20261008181031.4129029-1-anilkaushikwireless@gmail.com>
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
group. The spec is derived directly from include/uapi/linux/gtp.h and
the gtp_genl_policy / gtp_genl_ops tables in drivers/net/gtp.c; command
and attribute values match the existing uapi one-to-one.

This only adds the description; there is no kernel code or uapi change.

Signed-off-by: Anil Kaushik <anilkaushikwireless@gmail.com>
---
 Documentation/netlink/specs/gtp.yaml | 170 +++++++++++++++++++++++++++
 MAINTAINERS                          |   1 +
 2 files changed, 171 insertions(+)
 create mode 100644 Documentation/netlink/specs/gtp.yaml

diff --git a/Documentation/netlink/specs/gtp.yaml b/Documentation/netlink/specs/gtp.yaml
new file mode 100644
index 000000000..7193f5e53
--- /dev/null
+++ b/Documentation/netlink/specs/gtp.yaml
@@ -0,0 +1,170 @@
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
+        request: *pdp-attrs
+    -
+      name: getpdp
+      doc: Get or dump one or more PDP contexts.
+      attribute-set: gtp
+      dont-validate: [strict, dump]
+      flags: [admin-perm]
+      do:
+        request:
+          attributes:
+            - link
+            - version
+            - tid
+            - ms-address
+            - ms-addr6
+            - i-tei
+            - family
+            - net-ns-fd
+        reply: &pdp-reply
+          attributes:
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
+            - peer-addr6
+            - family
+
+mcast-groups:
+  list:
+    -
+      name: gtp
diff --git a/MAINTAINERS b/MAINTAINERS
index 51873349b..a6e43995e 100644
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

