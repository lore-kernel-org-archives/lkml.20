Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB0143B4AA
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787765786; cv=none; b=i1yUA0yQfSezrKnh6XA1fqIPZNycj1O8rGy3FLTB/yuFD63u1d9JcMzMlwoPf0o9QY4SwXhGEPpR0KplY0NN6O/TmhQ1R/xH4H25emBCOLSHP9OB1zSpUcinafw3/w0b8ntKDlJCJW9W5QTXUGJPF+7yiz6abMcj4SVXMBPRWqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787765786; c=relaxed/simple;
	bh=RNr5+skCEKXH/X/aJ2huC2U3GVw9Zuh/bcGTYv6LzFw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TdoLqfGCiWx+sxJTC+siiER1Z8cD/knCw24X2qRIQMprjTZzVOGjs2FiuILT7wk9GIm2keQmYnNxdl4IW0ktxOX464NZ5f9ah/6Yh9Ds++kki6BUuzXakECPBBaP0d2gtprDRij808yofHGUbo7WagKpd7TJrxnY00qlZEWTh0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xbow.com; spf=pass smtp.mailfrom=xbow.com; dkim=pass (2048-bit key) header.d=xbow.com header.i=@xbow.com header.b=PawsvZp8; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xbow.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xbow.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xbow.com header.i=@xbow.com header.b="PawsvZp8"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d71ae3455aso8346225ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 10:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xbow.com; s=google; t=1787765770; x=1788370570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IoFkQHD73GB7NsCsZGsy+4lh7/qZ6ZC4MY2deLwJugk=;
        b=PawsvZp8Q1LhIj7Fv5/8A6e6WQZJ3e4wMo19p3+4pRpOk73nEP30BkCnJl2RKujgNH
         xq4/OaHyqfXBATJ86uhzYHu+Et45y2A9c7eZf1rR12lg0BIvomHhSwiYlYQ5EYwjl4f9
         gCLQHctk1o4/fBWg9lfCPGsZVuwVX1oHyoMwWaJKzBccm3+4h5M4Ra/Fdr8Pdb536Z0d
         5kp5lRUHVFL3rHG5TB4zcxh7rJ3KUjPbV/fPfdxW4Q95wclOHM/iwAw0fVtj7ga8N335
         I+zwfKJ1nBSadXe2p899ULymsH1iWdPJKqlA99MOfQ0FcalUuPVoaooYlmf9ida3RbZY
         yf5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787765770; x=1788370570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IoFkQHD73GB7NsCsZGsy+4lh7/qZ6ZC4MY2deLwJugk=;
        b=YUlhDQhqG7bBgQjiiKoEe+aULi2hkbPHJxHwWSB00LXkTui1oG3Tt4SFhy2pC9TW11
         +ryVNgIw6LTYQkUP13sD3Pnmh9S9mLtteNh2uMXlOcyi9T8NRtTozBqWg1CNkJHO1yRt
         XEaspisT35+oBLxKMwTttpV0dO3G3FCauivAR3zYPgXjXiZLXngw5xwyFzdzV3o8tUb/
         /LU6v32szpgO5fK1vm66oeN1Rxnii+ZLFtm+00usQcqehkc0yRtnSJNKJa8DfGWI6HrT
         63m7ezoFhFukF1EwXzF7l7eVlDBZTCBs0Bzf3FGcQp/tEKRhvROZSFbWdCrh7pklA/yC
         pgyw==
X-Forwarded-Encrypted: i=1; AHgh+RrYPwXnKJ6V9NspTaS37Oq6MhdaftXm3pmM6dQiPJc8y0pkhKT5jCw1oR5L5igF/ySwRgQf/nGMjmvQYV4=@vger.kernel.org
X-Gm-Message-State: AFuF++nXRXJYeAa0GrHGUmYXTr8KIXESfhAjX3yOMKJzRK4rT01ag/Du
	LeNzU9bIT6T2PCmF4qbA26ZzXXKTQZxU6TaYsMfKEAmEFMI1LTnxaKL6ot7MK1BpWfY=
X-Gm-Gg: AR+sD12rramX1ZsSWw3TNL8yhmJ9+KB2jM1UbDIwYy+tT1nBJ2itEwFCRbzJbBmqq1q
	VPLpe4I4mhdkJ//5sYGKC+8FXATAp/Tuz6ChfuEgHisi4C++vF5xHfc4PqH81gCNRyg2ySlnomt
	WsiNR/szHLsjCD5lJTKwPwuoXvx2aMxoYRi9IWpWN7imES5xmMZ6V5bXoBRNry9UX1gW7Nk654g
	xDLD76ug56bZgY5OW5He6fCHIV9Vk25YfQIHtrjncWz8mNsb4SDYfSI3D72RMqfwERqczoW3ttj
	UEaEJkyRvym/q9Ut/3Ri/hw3BHDGIPoXvrqJ8YsQcLFa+1pYet9R+VMxJ2iNWWwVHW1e+zRXViz
	pZDvn+27las45ubvfax11TEZM8cwCa0BRmAn0YJq40t1HbZ3dDx9A+ndCB4FNIzkEIkxDwL6m+m
	1W5f0ydrxCJ3qMcPEgAdJDlDxC7gA0OHYq6WrV28kPwEE+xQcK5LMAfQW8XxFs1yKRUL2Z0p9H5
	E4u0igYWEABqRBq+i2uE1r8Y6Ub
X-Received: by 2002:a17:90b:48c9:b0:36d:b424:4f17 with SMTP id 98e67ed59e1d1-3966d3690e2mr19281903a91.1.1787765770023;
        Wed, 26 Aug 2026 10:36:10 -0700 (PDT)
Received: from Mac.lan ([125.128.148.126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396689efae7sm5329549a91.11.2026.08.26.10.36.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 26 Aug 2026 10:36:09 -0700 (PDT)
From: Baul Lee <baul.lee@xbow.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Baul Lee <baul.lee@xbow.com>,
	Ido Schimmel <idosch@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	federico.kirschbaum@xbow.com
Subject: [PATCH net v2] vxlan: mdb: Fix use-after-free in vxlan_mdb_remote_src_del()
Date: Thu, 27 Aug 2026 02:36:04 +0900
Message-ID: <20260826173604.90158-1-baul.lee@xbow.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vxlan_mdb_is_valid_source(), which validates MDBE_ATTR_SOURCE and every
MDBE_ATTR_SRC_LIST member, accepts the all-zeros address.

A source list is only accepted on a (*, G) entry, whose source is the
all-zeros address, and for each member of the list an (S, G) entry is
derived from it by substituting the source. Entries are keyed by a plain
memcmp() of struct vxlan_mdb_entry_key, so if MDBE_ATTR_SOURCE is present
and holds the all-zeros address and the source list holds it as well, the
derived (S, G) key is byte-identical to the (*, G) key and resolves to the
same entry. Omitting MDBE_ATTR_SOURCE is not equivalent, as the key is
then left with a zero address family.

vxlan_mdb_remote_src_del() removes the forwarding entry of a source before
freeing the source entry:

	vxlan_mdb_remote_src_fwd_del(vxlan, group, remote, &ent->addr);
	vxlan_mdb_remote_src_entry_del(ent);

With the keys aliased, the first call deletes the remote of the entry that
owns 'ent' instead of a separate (S, G) entry, and frees 'ent'. The second
call then runs on the freed entry, and its hlist_del() reads ->pprev and
->next out of it and writes through them.

Adding the (*, G) entry with NLM_F_REPLACE and no source list marks the
all-zeros source for deletion and reaches this from the sweep at the end
of vxlan_mdb_remote_srcs_replace().

  BUG: KASAN: slab-use-after-free in __vxlan_mdb_add+0x1cd/0xd70
  Read of size 8 at addr ffff888102852500 by task poc/84
   __vxlan_mdb_add+0x1cd/0xd70
   vxlan_mdb_add+0xc0/0x140
   rtnl_mdb_add+0x157/0x2a0
   rtnetlink_rcv_msg+0x207/0x5a0
  Allocated by task 84:
   __kmalloc_cache_noprof+0x153/0x360
   vxlan_mdb_remote_srcs_add+0x2eb/0x440
   __vxlan_mdb_add+0x803/0xd70
  Freed by task 84:
   kfree+0x14c/0x3b0
   vxlan_mdb_remote_del+0x129/0x1a0
   __vxlan_mdb_del+0x4f/0xe0
   vxlan_mdb_remote_src_fwd_del.isra.0+0x162/0x1b0
   __vxlan_mdb_add+0x1c5/0xd70

The MDB operations are netns-scoped, so an unprivileged user can perform
them in a new user and network namespace.

Reject the all-zeros address in vxlan_mdb_is_valid_source(), which covers
both call sites. A (*, G) entry is expressed by omitting the source, so
nothing legitimate is refused.

Discovered by XBOW, triaged by Baul Lee <baul.lee@xbow.com>

Fixes: a3a48de5eade ("vxlan: mdb: Add MDB control path support")
Signed-off-by: Baul Lee <baul.lee@xbow.com>
---
Unrelated to [1]: different subsystem, different bug class, different fix
site. It applies independently.

v2: Use ipv4_is_zeronet(). Add test cases to star_g_common() and
    sg_common().

v1: https://lore.kernel.org/netdev/20260826151542.68815-1-baul.lee@xbow.com/
[1] https://lore.kernel.org/netdev/20260815172032.79740-1-baul.lee@xbow.com/

 drivers/net/vxlan/vxlan_mdb.c                 | 8 ++++++++
 tools/testing/selftests/net/test_vxlan_mdb.sh | 6 ++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/net/vxlan/vxlan_mdb.c b/drivers/net/vxlan/vxlan_mdb.c
index d71e1925ecfd..841f42ffecb9 100644
--- a/drivers/net/vxlan/vxlan_mdb.c
+++ b/drivers/net/vxlan/vxlan_mdb.c
@@ -354,6 +354,10 @@ static bool vxlan_mdb_is_valid_source(const struct nlattr *attr, __be16 proto,
 			NL_SET_ERR_MSG_MOD(extack, "IPv4 multicast source address is not allowed");
 			return false;
 		}
+		if (ipv4_is_zeronet(nla_get_in_addr(attr))) {
+			NL_SET_ERR_MSG_MOD(extack, "IPv4 all-zeros source address is not allowed");
+			return false;
+		}
 		break;
 #if IS_ENABLED(CONFIG_IPV6)
 	case htons(ETH_P_IPV6): {
@@ -368,6 +372,10 @@ static bool vxlan_mdb_is_valid_source(const struct nlattr *attr, __be16 proto,
 			NL_SET_ERR_MSG_MOD(extack, "IPv6 multicast source address is not allowed");
 			return false;
 		}
+		if (ipv6_addr_any(&src)) {
+			NL_SET_ERR_MSG_MOD(extack, "IPv6 all-zeros source address is not allowed");
+			return false;
+		}
 		break;
 	}
 #endif
diff --git a/tools/testing/selftests/net/test_vxlan_mdb.sh b/tools/testing/selftests/net/test_vxlan_mdb.sh
index 58da5de99ac4..f9600aabd4a2 100755
--- a/tools/testing/selftests/net/test_vxlan_mdb.sh
+++ b/tools/testing/selftests/net/test_vxlan_mdb.sh
@@ -685,6 +685,9 @@ star_g_common()
 	run_cmd "bridge -n $ns1 mdb add dev vx0 port vx0 grp $grp permanent filter_mode exclude source_list $grp dst $vtep_ip src_vni 10010"
 	log_test $? 255 "Invalid source in source list"
 
+	run_cmd "bridge -n $ns1 mdb add dev vx0 port vx0 grp $grp permanent filter_mode exclude source_list $all_zeros_grp dst $vtep_ip src_vni 10010"
+	log_test $? 255 "All-zeros source in source list"
+
 	run_cmd "bridge -n $ns1 mdb add dev vx0 port vx0 grp $grp permanent source_list $src1 dst $vtep_ip src_vni 10010"
 	log_test $? 255 "Source list without filter mode"
 }
@@ -784,6 +787,9 @@ sg_common()
 	run_cmd "bridge -n $ns1 mdb add dev vx0 port vx0 grp $grp src $grp permanent dst $vtep_ip src_vni 10010"
 	log_test $? 255 "(S, G) with an invalid source list"
 
+	run_cmd "bridge -n $ns1 mdb add dev vx0 port vx0 grp $grp src $all_zeros_grp permanent dst $vtep_ip src_vni 10010"
+	log_test $? 255 "(S, G) with an all-zeros source"
+
 	run_cmd "bridge -n $ns1 mdb add dev vx0 port vx0 grp $all_zeros_grp src $src permanent dst $vtep_ip src_vni 10010"
 	log_test $? 255 "All-zeros group with source"
 }
