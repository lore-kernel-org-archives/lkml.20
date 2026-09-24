Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97719438015
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 20:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790281563; cv=none; b=ZOhpnPflE03czQXy7TowfGgtBcwv+GxxYsjj9Nh7RicvV81A/PS4RJz1cvD6lTSK/TFqFsyhH6etnyXrsQvCiqxs39cRtL5Jsr93WHBNJRxw51aHSegvzphMUBHGgISACtjhMhLmgSCmFen3rP7AD8U1wp5w84eaP/qE4hKQeCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790281563; c=relaxed/simple;
	bh=uRYPAtAtLif7i10854CTEewWmJAf/TWjXqRBv41TdEI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Tv6keqN5ibzCPkEXbog05lVPaRULBc9Q2RWHRQTXxPZtgrupCVisuMZiWeJ0Jyvab75P/d61RKhGbvj6ABgeDtAlC7Hy4s9d5GH27f1IM8RPQU/TLaeqLkpBmw6Nkjkx2Qsb42bHzhZMm6bWxE+7QcWtGU4MwbPwxzw5myideJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XI4oiPFE; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XI4oiPFE"
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-982dd15d169so140668241.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790281556; x=1790886356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iv7JMCOOiStR26xduJ20yGu4jGk3+F31OuSygzoMJug=;
        b=XI4oiPFEvODXpDmkNwakyL26cPhBZO0fAkDbzIYLDNg6xgLvTAkKVqFwgam4Ojh4Zj
         1GsuEzJTH641jtPyku/gQLRYwtmylTydyUEgM6R0XYjqO6LGZEQI8LQ6hN6nxkyZXhGa
         7d1Q2uGNumuVABxni+c/deDXTBa1yO+AD0L0ULPNlplrPe2cglZXELUCSDIyrI2aWov5
         ZX4pL92GWVccxd6S1hNDBIqNpDDlruf1vOlgZCSbcJdlmfUE7ZquB+Trl1/bo7HO6XIU
         UWlwBKvq/NhavnzSHYDMqsVk5wnicTTlA+E9Is4YjVr0z4S5eJI7duLF57KyhTtzy2Ec
         1sLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790281556; x=1790886356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iv7JMCOOiStR26xduJ20yGu4jGk3+F31OuSygzoMJug=;
        b=FI6QpgUTHpPpE9Wxak8Uz7E+rathQIEbqD/Ofbl+Qctu0S6mmBdD7pqRaisTc8ptrW
         ST2uvAsqBZIJOMxBfbuQ19FgXyY8ijIcwTQnfhDS/5iGyxtkZ+quJe9IFK8o1qghwhRl
         hQlImL9ZQfgJIqAhNsR7LwT3r9mAsZS/2eE6pPIOpG0XDWB02tgpJrEAJPaTeSFjjI9p
         VJ9EpKKA3Y41fT1lu9O88o+2T0hcCoHiSPDqwzOSmFhd/02/K/k3BuGz3grElzZ4EZko
         WbVPz+GdV0xp55iq2dH4wMzNLsMHBfZLZyNnx7EKPlkHYL4YHPQBljvfoZaxV4ngT5KD
         KGfg==
X-Forwarded-Encrypted: i=1; AKwUvBw0tZjRzjMxhjcJlcpcmCu4SpFe4fSvT6HQ+LQ6Tu+i4+z9lqfjDfNbJfTgq13nCVIR9vKy/U4cueYpltI=@vger.kernel.org
X-Gm-Message-State: AFuF++k/7rAN+FOFrNPKJVg/fD77lfT0cR15eeuYpb69nxPXEXihyv5T
	iAunjVP95/2bYj3kP2aKlwj4B1mn5wFX5qkBzRjU3jA50uUW50s5OM3d
X-Gm-Gg: AYBFou0epdCrnq0yM/aIDr4sb/nuZqnqPbHYw9oi3u0tFuRdhqI92olxE2SABsnPegZ
	YN2ja+DqB47s1O9bz3jD2RTW/SM7RCNt2AoY+JPeLZOg9ww7Eiwm/LRRHL7FlqI+kaqAlalxrX+
	rDMbuaPcuaVKKlE6Z7K8Pn5inar/bWRoz/FBOpia/cZzO06sZVMVb+unfhGRtyXcXH7J9OfEh+9
	UTLYW1p5R8Iy7If3Gc+KggITOHo4iTBCn7APWuN+iHZLbpwCDJ4q3ZUsA13pXMvJhx3EZhA1DfH
	njG7yTL68sG9tepiId8g+wDvZ0Q/CsBTgFmNA48umzErDEeI6S7VHEE9JY2ddD1nAptN4fuCGvf
	j6h+1wQ0q0uUjuibaMYMkI8DAUtiP0JgZyZeFsfb9AVCrF9VvTWf1vjEfDJ1KJ4ZGCAUA6nIbJ4
	TvRTviJa7IOygw5eMIA7Gch3vBzyk9Me8eGNq8KWVDoLqXOHZij/1EQBn1h32O5w4atE1uayfQR
	FYWhvWV715G
X-Received: by 2002:a05:6102:c53:b0:7a1:f7c3:3a45 with SMTP id ada2fe7eead31-7af1d6c4296mr1934116137.18.1790281556440;
        Thu, 24 Sep 2026 13:25:56 -0700 (PDT)
Received: from adriano.lan ([2803:9810:3dd5:d810:440b:4079:aa61:d217])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7b0db1d1152sm782102137.6.2026.09.24.13.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 13:25:55 -0700 (PDT)
From: Adriano Cordova <adrianox@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>
Cc: netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Phil Sutter <phil@nwl.cc>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Adriano Cordova <adrianox@gmail.com>
Subject: [PATCH net-next] netfilter: nf_flow_table_bpf: populate VLAN encap in XDP flowtable lookup
Date: Thu, 24 Sep 2026 17:25:43 -0300
Message-ID: <20260924202543.1090535-1-adrianox@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

encap[] is part of the flow_offload_tuple rhashtable key
(flow_offload_hash() hashes up to __hash), so a lookup has to fill it like
the skb path does.  bpf_xdp_flow_lookup() builds its key from struct
bpf_fib_lookup only, which has no encap fields, so it leaves encap[]
zeroed and can never match a flow whose tuple carries a VLAN encap.

Fill encap[0] from an in-band 802.1Q tag, mirroring the ETH_P_8021Q case
of nf_flow_tuple_encap().

Link: https://github.com/xdp-project/xdp-tools/issues/488
Signed-off-by: Adriano Cordova <adrianox@gmail.com>
---
 net/netfilter/nf_flow_table_bpf.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/net/netfilter/nf_flow_table_bpf.c b/net/netfilter/nf_flow_table_bpf.c
index cbd5b97a6329..479f8242da2b 100644
--- a/net/netfilter/nf_flow_table_bpf.c
+++ b/net/netfilter/nf_flow_table_bpf.c
@@ -10,6 +10,7 @@
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/module.h>
+#include <linux/if_vlan.h>
 #include <net/netfilter/nf_flow_table.h>
 #include <linux/bpf.h>
 #include <linux/btf.h>
@@ -60,6 +61,8 @@ bpf_xdp_flow_lookup(struct xdp_md *ctx, struct bpf_fib_lookup *fib_tuple,
 		    struct bpf_flowtable_opts *opts, u32 opts_len)
 {
 	struct xdp_buff *xdp = (struct xdp_buff *)ctx;
+	const struct ethhdr *eth = xdp->data;
+	const struct vlan_hdr *vh;
 	struct flow_offload_tuple tuple = {
 		.iifidx = fib_tuple->ifindex,
 		.l3proto = fib_tuple->family,
@@ -91,6 +94,18 @@ bpf_xdp_flow_lookup(struct xdp_md *ctx, struct bpf_fib_lookup *fib_tuple,
 		return NULL;
 	}
 
+	/* encap[] is part of the lookup key, fill it from the 802.1Q tag. */
+	if (eth + 1 <= (const struct ethhdr *)xdp->data_end &&
+	    eth->h_proto == htons(ETH_P_8021Q)) {
+		vh = (const struct vlan_hdr *)(eth + 1);
+		if (unlikely(vh + 1 > (const struct vlan_hdr *)xdp->data_end)) {
+			opts->error = -EINVAL;
+			return NULL;
+		}
+		tuple.encap[0].id = ntohs(vh->h_vlan_TCI);
+		tuple.encap[0].proto = htons(ETH_P_8021Q);
+	}
+
 	tuplehash = bpf_xdp_flow_tuple_lookup(xdp->rxq->dev, &tuple, proto);
 	if (IS_ERR(tuplehash)) {
 		opts->error = PTR_ERR(tuplehash);
-- 
2.51.0

