Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793311312;
	b=eNE9MKpNILifuTFe0N9RxPA0Z9BcEzH5I9E5CzmcI996Cy4kg7ZBBrWcDDU5lH1pIlro
	 XWuA3AF3LLQbE0JoDeMW11bdtieAwI49U3PJ2L6xdrjgZkOhDBz0YcPYmK9b7QP8NKZEE
	 LH0i9burc4S7G23aoDHJOuepBuaCb6mx8eNSlSODpli9HYZFA6ifjXoFXHs5Bd3G7pHlm
	 lyxELfSfHxaK6Nmf7ZLT+FzOG8F9/fznR3gh2kXtYS90vKlUaapE6EyXsAisDSO8MLGOF
	 kSaLGBjFYXEcOfOUl7HGlTQDV0PwLyNeWXZLGLSQDNYa4natzjbHvbEgfq7F9kL420A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793311312;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8Q/lW9fQYT21QznHQjvJzPQJl55ESH89M5aAdKeZYiU=;
	b=oh3Zqp3uFC08N8Ndg5Ossq/OSB3TdT834SYclqTyGJa/nfHmu/ZaMuVv+g9mo/RHgbrw
	 gTXtFbjTLo9/+RoD2fbSMfheZ9Xxu3YV+eM+5O5YLKgXKk5vNFHYTHtUAms0CqJEoKlfr
	 CiNl4lq5emaXx8fNgCJkCaLq/T4HGw3AJAKdSmytNYMIubqLK+xqQdwXAiBo+C2ILVWd6
	 IPQsb1pw2qywK19q+aoWt8PG4pq3Q9Emx/WPcxt3oBEWF9au9zrY5ROrsltLkY6uG/19/
	 yKKcdgHme14gDo/rh2Hoeoja8/XABr0piTNdwklrVG1MUJIW/rxGo1/FbzA/pmZV1LQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PvyQ5bWt;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C08606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:01:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81C08606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PvyQ5bWt
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1931ff67a29so123475c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793311312; x=1793916112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Q/lW9fQYT21QznHQjvJzPQJl55ESH89M5aAdKeZYiU=;
        b=PvyQ5bWtfUrBDAlzm7ET+Nv4xMP295D49xeHwvk13R677MduzOlQNmJ8GxFFMVyWxU
         BqMVSEVdWZLF01pHYP3M3f3PzdfC2m8TkKQ5y9q4ykfBwM3o57cG/2U5pKB/KtuTC1UM
         e49Kbp0C5kLAkXzXMB2uk62M/uP5UfQGPMXDB4oQ3m6dPirpFaIEhhb0lkosbmyyZ08V
         sIhdgv6BtBk5FK+ja8mE+inDr3UlZKcfK+VHbV5zSvKIHkBC7yi9D4UWbgpcJ5A4REZP
         Elo5/0aBDT3cbVo1tVIbn9bnaYT+sBAfNXVfjMZC1FSoXjan17/gzi1z3FLYvcyoOtCJ
         LHnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793311312; x=1793916112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Q/lW9fQYT21QznHQjvJzPQJl55ESH89M5aAdKeZYiU=;
        b=lQ/Wju4asbpN8jsvq0s+FQ+MuzF1pCf3TD3+rnNZ5oBi+4IlsyNLxwo9gELEvTpSkq
         J/g8WFWvz9OxxoTGBNGv6y1WEp7EI8M3cVcXL8QN+XLhmYKSPAq3TxwdmNqibH/xh3fK
         RTIVnLqSedPVs70HCjQb19szGYSC7qS3Kl1O05n2rtj1lE06zi11w67hNls9r5pM8z7D
         2azucm8X21qRXQipin52BsCDAtWhwWB15P1YX8aaoJ7pLvBJPFp/zESbAleXeMCZ7XQx
         envMItov90R7JKzrjRV/hSnwArWuuDKsU/S8cAxpZwZM54KICDWgNA6F0F2yTJPvzQBk
         KpkA==
X-Forwarded-Encrypted: i=1; AKwUvBwkcK3ghLUPTFO8ldzqDlxWNuhE1YvR493mvECh2j3eTiyjdzItXLjZL+pRkxnxYdNZUAKf9auBiUCKpYU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJAYzCUJ+snuTujiWtBIuFOja391KspWkYVqYUVwidE30D4QNE0
	lz8BAKVRnOxi4N0iTaPmrRJ5GBZc5FHLvsniQ+KzDxXQgDmnKZwDTDAr
X-Gm-Gg: AYBFou0E6OWdY6SmClZz/NDl8GzPpAGLXSbLN1bxyzlSqFrUI6V6oCQ4wTbPAiZhXbW
	uhqHyszdBZFIYrIL7SnoxgPJfmVAxa0WvUD57QyrrvqTyAU65/0rZ/gKzWt1m597M2jvvHEV66H
	kaf0MvmUM/jB5ruhPBAE3+bndqjb4dAgljGxGg9o0WScwz88LbGznSTFmsW695MpzNbiw+gU41m
	pfZG40mgQjiNC4Szj6hk0Ap4XSJ+mmHafrZbZJx02eZQo88JbjqIu3esYE9Wad8y8Pz7qDGkjOO
	iVo6GDuhG1gauzg+ojEt+CU/2ij5v6lcXGFyVp8RrkgDekYzb/3tbZ0xr4WWjFupG0jZlQWU9sc
	6ZozbjrEn5FNv94/FyuCA0otD49aoOzBMXdJ4zu8jtaq3T9ZCrEGGLBu7Xqg5T/0cnyzu0bDd93
	J7GRh+FJhfGUvS+msPlmi0ZiSSjKq2eDs7gdZwhjuA827uhmt93YI4mmtWNZRfcteYIV+VxrWFj
	uoGZqevgo7NUdWUjmPcMkPgs/BBi/as/d8egg5683xUd9zVNo0E9Rzz0V7jf5Ymhs6cJUSSXTGX
	7NjHvCmfJnKqTkjnG4NNEtrnyBTlEweUsaXOoXP0WQvoJHKf2po98lj8pQrQOB8vaxZuPJMXS3L
	C
X-Received: by 2002:a05:701b:4589:b0:187:eb7f:bb4 with SMTP id a92af1059eb24-1ac5d88c4e4mr385234c88.46.1793311306922;
        Thu, 29 Oct 2026 15:01:46 -0700 (PDT)
Received: from samniyama.tailbcd61.ts.net ([76.20.4.3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1abcd6f1sm1314661c88.20.2026.10.29.15.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 15:01:46 -0700 (PDT)
From: Koral Ilgun <koralilgun@gmail.com>
To: netfilter-devel@vger.kernel.org
Cc: pablo@netfilter.org,
	fw@strlen.de,
	phil@nwl.cc,
	fmancera@suse.de,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Koral Ilgun <koral.ilgun@adtran.com>
Subject: [PATCH nf-next v2] netfilter: nft_flow_offload: do not offload multicast
Date: Thu, 29 Oct 2026 15:01:44 -0700
Message-ID: <20261029220144.2474139-1-koralilgun@gmail.com>
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

From: Koral Ilgun <koral.ilgun@adtran.com>

A flow holds one output per direction, which it resolves when it is
added. The outputs of a multicast route change when listeners join
or leave. So a multicast flow in the flowtable continues to send to
the output that it resolved, also after the last listener left, and
the counters of the multicast routing stop.

A ruleset can keep multicast out with a match before the flow
offload statement. Without one, IPv4 multicast stays out of the
flowtable only because the reverse route lookup in nft_flow_route()
refuses a multicast source address. The IPv6 route lookup has no such
check, so IPv6 multicast that ip6mr forwards goes into the flowtable.

Skip a multicast destination for both families in the flow offload
expression itself, so that the result no longer depends on the
ruleset or on the route lookup.

Signed-off-by: Koral Ilgun <koral.ilgun@adtran.com>
---
v2:
- Target nf-next, and drop the Fixes tag (Pablo).
- Use the shorter form that Fernando suggested; the result is the same.
- Say in the commit message that a ruleset can keep multicast out.
v1: https://lore.kernel.org/all/20261028205938.662312-1-koralilgun@gmail.com/

Tested with v1, which skips the same packets: on an arm64 router with
Linux 6.18.54, with an inet flowtable that offloads forwarded flows,
and IPv4 and IPv6 multicast routed from the WAN to one VLAN. Without
this change, the IPv6 flow went into the flowtable after its first
packets: the ip6mr vif counters showed 25 of 1,500 packets, and the
receiver still got all 400 packets after its leave. With it, the vif
counters showed 1,500 of 1,500, the flow stayed out of the flowtable,
and the stream stopped about 2.5 s after the leave. Unicast IPv4 and
IPv6 flows still went into the flowtable.

 net/netfilter/nft_flow_offload.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/netfilter/nft_flow_offload.c b/net/netfilter/nft_flow_offload.c
index d3c5651dd699..530e20c7fd45 100644
--- a/net/netfilter/nft_flow_offload.c
+++ b/net/netfilter/nft_flow_offload.c
@@ -10,6 +10,7 @@
 #include <linux/netfilter/nf_conntrack_common.h>
 #include <linux/netfilter/nf_tables.h>
 #include <net/ip.h>
+#include <net/ipv6.h>
 #include <net/flow.h>
 #include <net/netfilter/nf_tables.h>
 #include <net/netfilter/nf_tables_core.h>
@@ -33,6 +34,10 @@ static bool nft_flow_offload_skip(struct sk_buff *skb, int family)
 
 		if (unlikely(opt->optlen))
 			return true;
+
+		return ipv4_is_multicast(ip_hdr(skb)->daddr);
+	} else if (family == NFPROTO_IPV6) {
+		return ipv6_addr_is_multicast(&ipv6_hdr(skb)->daddr);
 	}
 
 	return false;

base-commit: 734bef548a96e8774d6eef5dfa2026c6edc4e80b
-- 
2.43.0

