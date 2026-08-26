Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A0B22579E
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 15:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787757353; cv=none; b=ZQTgyUczC4HnXw9pkfXYgx1nkXRknzu0bu9Pt8R/Cx41t5SKkKom7/Gul4shoJBqFrhKJzXTRKyOzgp+Hufn/01Ww6tEz0EVuY7ROpp8EWe+2v5loMJ4w/OQxPu52h06YZGNklmp+S/uSAuuCUVcaWIs4z/74fWLmU6Cnoz79aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787757353; c=relaxed/simple;
	bh=bAuBeeb68Py8UGRJAItmIrBFGrQoRBO6aHLkKHMvBDY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RiTuYGhdzc2mxACXOHMIGBADs6fQwe6kI4oUuMQkEjnPBHhlOfmNdtiv7Ao8XyaY8NmUbnJ599/GNbWdmazd480s99FWCD50S1+CHr7tyO+VzwfmU0kPtCAe/QV7pNxnq/GNHBDvgGYGokFte2/fIq+LZxwRWIFrc9eU+HsAEiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xbow.com; spf=pass smtp.mailfrom=xbow.com; dkim=pass (2048-bit key) header.d=xbow.com header.i=@xbow.com header.b=EmTn0K7L; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xbow.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xbow.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xbow.com header.i=@xbow.com header.b="EmTn0K7L"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-395ea741d07so1131618a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 08:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xbow.com; s=google; t=1787757351; x=1788362151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UXbEbgExHY/t7d7GNe8mdR88tmMCAvM05gHfcSb0VPo=;
        b=EmTn0K7L1UMPlKyGy4wV7/d3AJSBVvviTcEWv1likUTJUaLeboOE4fJndxZcTxe5aF
         2rMEgzVw1n+lCepccfCWnlsxtzMx4TPLqXX4fdBT+/V4lVs//Hq0JXDpb2LW4OYk9/cp
         lrmteIhq776OH7tzrdxAfau1Rvfq323b/C4Kt08BDiMG+Y6Hp+hq3oDCJCmwxRBqdusF
         9lPjtJVDXhgKtNeU6w07VSiAzewjnPGdm7kOhFq6QrIGvchcv6UlFOzSNmAvYoetbaZ9
         /fobAZuODcLi0QoOHBwKoDK6SsvOJi/4led6BsaG2tOp28cRsxHniC/QR3UxeOcVUyhq
         D9Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787757351; x=1788362151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UXbEbgExHY/t7d7GNe8mdR88tmMCAvM05gHfcSb0VPo=;
        b=ZhvUHCn4A9/Bu3lmuT5GWmK10egYTJh9WpPJaF6XeW40X+lqy7XcHVifRF8eTtE6p2
         nkOoNdxelxxY5jxEjNk5USEQvsbF4cqEGbi1g3AxIK78ogbuTF49hWeNgUoK2D7rE9tl
         OP6L4kVmCEXlyTbvMoOtrmypZclk4ZJ8BUQjluOg5lRkYUTUUB0wPeKTLP6A9a6RUCuR
         QBhlAW0jBLgKc/2aHfzRjh8rGseIRgfPd0N/HoqPEDYZh0FvQUYy2sGgxrVnOQqGvZl3
         UYCrtKcQbdPVgY7TxCNbaph72LrB9Vxt5n8+8h/K0muE1NsEHbsldL/pVM+2hFBYVTh/
         fSBw==
X-Forwarded-Encrypted: i=1; AHgh+RrnxoDfAlWNNc1mUrtWab3C28JOlrh3PdPCRLsPb6HPDw1ideeBTtnemKb7WFAWH3N5KdqG9qtkHgGzvtY=@vger.kernel.org
X-Gm-Message-State: AFuF++mUJ65EpSx0g/c2Zx81KO45fKftw+UVbImQXg3lWPxpMAaob8vq
	mAqBMITQGNzzMPalSCVvE6jc6WnQZth3VykfKAxaenadV4KfRNqelRFrAwkqOR0c8X4=
X-Gm-Gg: AR+sD13uEatRTzzrZJBFmJoKRtX4S+88vd/UN6iX16jbt+YkROebaAZsm0qpDH3iqX+
	W9Kq794EtVYsDvBKAPpCWiQTriZ/jfk8S73+Bkq0+RAE069bI8JsVy+00Run47KHOONTFDy3iLa
	+beDdCWC/XBCOwJFlS6Hk+EUjo/GosCRYfBdcYqMtfYEYoKg/MZ5Jzn4Jg77Ws3QVhWgZZHic7c
	Q/n4IHPPMemjMVExFA1ratSQGPNMXdj6xFS6MHglT+fda2zYtShczGeHq498WVYVekOT6o/Tqe4
	Wt6SJfjHpk3xGxM0vNqp6r6shbtgQeTRFLGOqsF8TZ+qiMLjqn1muGQab+p59X/VPlOl5Au5XNj
	YogW6+tS1atVuBuM5Qya0f3EK5HhrQOi6pE5dsoho2cgk6q4SSRVQ/Z1QN1zCQuRKjIkTMjptAv
	KlV5u6TJERg+Y+1pwq8dS1BKdcfcCGZHPtEAjvxYsAQ4WWrd0kEQdW4rErUTNFpLUVF+gzQ0oqE
	k+Du7Wr3A+EATFpp6DSs5nCmCagZk9qqQ1w6Q==
X-Received: by 2002:a17:90b:3b4b:b0:381:11eb:d78e with SMTP id 98e67ed59e1d1-3966d8b6295mr16465687a91.14.1787757350757;
        Wed, 26 Aug 2026 08:15:50 -0700 (PDT)
Received: from Mac.lan ([125.128.148.126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39668a57396sm4831991a91.13.2026.08.26.08.15.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 26 Aug 2026 08:15:50 -0700 (PDT)
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
Subject: [PATCH net] vxlan: mdb: Fix use-after-free in vxlan_mdb_remote_src_del()
Date: Thu, 27 Aug 2026 00:15:42 +0900
Message-ID: <20260826151542.68815-1-baul.lee@xbow.com>
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
 drivers/net/vxlan/vxlan_mdb.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/vxlan/vxlan_mdb.c b/drivers/net/vxlan/vxlan_mdb.c
index d71e1925ecfd..7986c5b5dc67 100644
--- a/drivers/net/vxlan/vxlan_mdb.c
+++ b/drivers/net/vxlan/vxlan_mdb.c
@@ -354,6 +354,10 @@ static bool vxlan_mdb_is_valid_source(const struct nlattr *attr, __be16 proto,
 			NL_SET_ERR_MSG_MOD(extack, "IPv4 multicast source address is not allowed");
 			return false;
 		}
+		if (nla_get_in_addr(attr) == htonl(INADDR_ANY)) {
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
