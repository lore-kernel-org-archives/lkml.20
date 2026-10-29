Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283236;
	b=oV4q+QpcizOJ5YekpvqLxJGxDDSxYDdYABNFz3uhinhhIuKBN+TxNyvIVYKhS3kn+MaR
	 3Qz6UXcJQqO2PJGxZlXkkxHHI/642uNSMqakxLHjiuDYEgmd3Tq/GVJ1Ah1PyY7vYVW86
	 WzGJVjBdkYcdhpdaEBsQaTye58KGFmF8MNARU2bWx/r2V+1AINi32UfrgX+8T/TdMw6+D
	 UQLKuESS4oI8jWhqNCoo125l/Ux3aaROQgSeLptY2hkCdSTix8zNJsbGE8v9miq7w/Bb+
	 9ovpWMyIxpbJElz1Kghx1KrLgw6iYPjrOli3E7koI+YQLcGs78qQuX4TsQB4nuof/2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=3r+oUtLtuj/VEdpEb4bPGrKTCpCHtCaw4EjdujKT3MA=;
	b=WGwafKfArMXwD6X/srBDyltoByeOx39oa60H/ecsbIOnHjVZwb5St8tmIcqhbPSaObis
	 1fqHt3QNokrooRF2QTfO2t/qYgRGjiWgPdp6cqh06RnXrVw8t6mpRwjakyfVljj2PlEKz
	 cvuWaLIQ61yrQFnHrCVYDMu8PbKBCfvoUw0ZczrLCWqifU+G8ZOjGX5zCUhtpRjCJ8XIg
	 Ejvr9L5C9VxSZ19yB786B0ib5RQgJ90iCvcsdz14BTe1UV10vbL6XZcsZbJKN6sH7rw0n
	 +4JbXj7ZGHw1MYt7eOIlaOpEtEe97UvkxGRQnp2r3KdrCDiGADuc4ymQHa5yyAlxKRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f4tltNeF;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1202606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:13:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1202606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f4tltNeF
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-156cbe59524so2427131c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793283235; x=1793888035; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3r+oUtLtuj/VEdpEb4bPGrKTCpCHtCaw4EjdujKT3MA=;
        b=f4tltNeFTKLnbUz5fjFCsuUFaUTE4hef8VkRvpIXiFKDI+Q+4y4RSyo2uDZaO4cFqS
         hsX2K4LGItbsDAeTgBApvLi7AwGt4HD6ojALeFIrXlX0nSvztfjEyqHA2IH89+Ky2F9p
         3tdARLW2Y/G2DTpZmFgXa2rTTRzRmZxzUl+1rFgB8sPVOHwlsCbm6jgfq0H2qb6c6R2d
         isdQ9G/JcfhnYNrIkmftITH3EeFMIqEdIxtTFBeuDq1KcowgrZMxo7fNCZ836RU/iIjO
         LOkkKQE7j4QvBAiK3GAFXIJF0cGfkHwvJRVTcZQD261r/+cI6bCH3IeFhnSTOwWtGpAo
         K8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283235; x=1793888035;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3r+oUtLtuj/VEdpEb4bPGrKTCpCHtCaw4EjdujKT3MA=;
        b=cBSPRxXppSrnMk6nwaJaI/18O0OlLLEUbj/Wc8Vlay4zK+/w6widhx9UcrDsdz8Gq7
         Dk63PEniJMU3leZiExvTSIQwufTRUhKUUbU+4u2RaYprBKjsn2QPiL7x2TS9TPMXkHED
         atcXCqNYzunRRb9tzx7hJ7BqtNzb/dleeIECur4/kXlcG5eyYE9ZgzBbhopVm+8jAtNd
         kKJxWJ7CQ237OQJA9aDgg6kdgurK1ZFnjtBf6d09EAqtyjgM6nQdoLQiOxeDV/aq5cv4
         oSE8A9eayIiI5byWN4RL7USBYXRFvgje2perT8doZB/DL2rMReQcrn34j5WO/F1CDeLw
         Tfig==
X-Forwarded-Encrypted: i=1; AKwUvBw6QKW9CfGf9yHqXDuIl+o2quWQj0nG7BCe871kHY2wlIKSmQ7wcolhfOI3Tisn20Lp0lWFEohV+TiTYdc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIm5undOjvlQo1Zsd/M0+vikU+kvV5Qpm2WJDBbMnhQXr3nwTii
	ijJHVOHVU2e/sYTvUWwwkHLVkxfFA49i4BIoq4gguPDX/iMYGU+I0oEjJtsvHl97
X-Gm-Gg: AYBFou3/0D4GtpUzO/i1vEBv99bZD1AbafLBBVSa8JMkSmgBZvpOeJKqsn7JH5/PDZh
	clV5XEieJ6blbZdT7C1fI0FJVHKKJJkyVejjyPTxTxsZtEk4ngcv04nAagZgD+MvnT4MAa84OlX
	SgrHISbvszAeRM0MASdjGQMAdz2/vNDGLremCpXmEiWrH3Rpsp4ZjJxsY9Gl4RgJU7jK2SrSDxp
	5Z2BV/D0Q0VC6YFkuktnT0hCyj4ORjO5GR2Aj0FHnRmtTovklMUrEbu/qmxTpHCvWFHVj6ljEY8
	z3mjiaqcS4/33F3T4pvFw+q41d13wN2GPsms1Derc9s/8TTZnD6G58R30sM6/0Zkng+LBk+u3Mw
	kKb+xzyWMHqSMzc19yJ+rxVZ62ldCUKEjY3ToMo9aM4bmx7LAMKhQeVhdU02We4I5d6bbjoBy5b
	az56jttjLdOVJpbZbbA7JhVF+PtvlNFTkfL5Axipq/ZgYnfUkzBQeJLeXCvGntD9U1h7AFv6N9k
	7ym3JMBWMTLsMlkgUijKjxPPEfhKrjLR6x91GNhicDUHwiCXiqSumfeAwU8Ifo9c7e4j79x4pQT
	k3lWwZGJDTUAdNig+cr8WpV58V45lZGF2o7TdcXCMTLHeiuC6mQY+g==
X-Received: by 2002:a05:7022:6b96:b0:19a:51da:f54f with SMTP id a92af1059eb24-1a6cd498fffmr10891624c88.14.1793283219708;
        Thu, 29 Oct 2026 07:13:39 -0700 (PDT)
Received: from [127.0.1.1] (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75d76814bsm15197319c88.10.2026.10.29.07.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:13:38 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To:
 Nikolay Aleksandrov <razor@blackwall.org>, Ido Schimmel <idosch@nvidia.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 bridge@lists.linux.dev, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 [PATCH net] net: bridge: mcast: validate the source limit before replace
Date: Thu, 29 Oct 2026 07:12:20 -0700
Message-ID: <179328314075.648427.9644307795980106759@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

br_mdb_replace_group_srcs() marks every existing source for deletion and
then re-adds the sources named by the NLM_F_REPLACE request.  The add loop
checks PG_SRC_ENT_LIMIT before allocating each new source; if the
transient source count reaches the limit, br_mdb_add_group_srcs() unwinds
by deleting every source it processed, including the pre-existing sources
it just refreshed.  The error path only clears BR_SGRP_F_DELETE and
cannot restore those sources or their (S,G) entries.

A replace with E existing sources and N distinct request sources not
already in the group fails at the limit if and only if E + N exceeds
PG_SRC_ENT_LIMIT.  The rejected request currently leaves the group with
one fewer source and removes that source's (S,G) entry:

  before: (*,G) star_srcs=31, S present, (S,G) present
  after rejected replace: star_srcs=30, S and (S,G) removed

Count those new sources and reject the request with -ENOSPC before any
source is marked deleted or added, so a rejected replace changes no
state.  Valid replaces, including ones that transiently reach the limit,
keep the same behavior.  Other add-loop failure paths are unchanged.

Fixes: 61f2183512a7 ("bridge: mcast: Support replacement of MDB port group entries")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Cheng Yongkang <teel4res@gmail.com>
---
 net/bridge/br_mdb.c | 51 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 50 insertions(+), 1 deletion(-)

diff --git a/net/bridge/br_mdb.c b/net/bridge/br_mdb.c
index 0adcd15..f5b9df4 100644
--- a/net/bridge/br_mdb.c
+++ b/net/bridge/br_mdb.c
@@ -925,6 +925,24 @@ err_del_group_srcs:
 	return err;
 }
 
+static bool br_mdb_src_addr_is_same(const struct br_ip *a,
+				    const struct br_ip *b)
+{
+	if (a->proto != b->proto)
+		return false;
+
+	switch (a->proto) {
+	case htons(ETH_P_IP):
+		return a->src.ip4 == b->src.ip4;
+#if IS_ENABLED(CONFIG_IPV6)
+	case htons(ETH_P_IPV6):
+		return ipv6_addr_equal(&a->src.ip6, &b->src.ip6);
+#endif
+	}
+
+	return false;
+}
+
 static int br_mdb_replace_group_srcs(const struct br_mdb_config *cfg,
 				     struct net_bridge_port_group *pg,
 				     struct net_bridge_mcast *brmctx,
@@ -932,7 +950,38 @@ static int br_mdb_replace_group_srcs(const struct br_mdb_config *cfg,
 {
 	struct net_bridge_group_src *ent;
 	struct hlist_node *tmp;
-	int err;
+	unsigned int num_new = 0;
+	int i, j, err;
+
+	/* Sources that already exist in the port group are refreshed, not
+	 * added, so only the request sources that are not in the group yet
+	 * consume a new entry.  All request sources are added before the
+	 * sources that are not part of the request are pruned, so the
+	 * transient source count can exceed PG_SRC_ENT_LIMIT even when the
+	 * resulting source list fits in it.  br_mdb_add_group_srcs() would
+	 * then fail with -ENOSPC and its unwind would delete every source it
+	 * processed, including the pre-existing ones it just refreshed,
+	 * which the error path below cannot restore.  Detect this case
+	 * upfront so that a rejected NLM_F_REPLACE changes no state.
+	 */
+	for (i = 0; i < cfg->num_src_entries; i++) {
+		struct br_ip *addr = &cfg->src_entries[i].addr;
+
+		if (br_multicast_find_group_src(pg, addr))
+			continue;
+
+		for (j = 0; j < i; j++)
+			if (br_mdb_src_addr_is_same(addr,
+						    &cfg->src_entries[j].addr))
+				break;
+		if (j == i)
+			num_new++;
+	}
+
+	if (pg->src_ents + num_new > PG_SRC_ENT_LIMIT) {
+		NL_SET_ERR_MSG_MOD(extack, "Failed to add new source entry");
+		return -ENOSPC;
+	}
 
 	hlist_for_each_entry(ent, &pg->src_list, node)
 		ent->flags |= BR_SGRP_F_DELETE;
-- 
2.34.1

