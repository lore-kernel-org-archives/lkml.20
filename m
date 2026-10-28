Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793221182;
	b=m7HK+EripsdOsQAYY7yfWYUVlI/ItUz4NZzsbAGlCZQv93rQHLeS/GVMdr9T95mPJ4xH
	 zrKJZ+Ah5a1i6qh1fEi7BEqB2d37vQOiXfxeEE85HSa4VVcEiMGIW22fhT/q+sDCQNFRx
	 I1AyGyCfKo8EvQpkwOHRtJyb3n2nxm9xOevEDV6EGzO7SlKurVwKH6ZkIVuRrtWd0u3Ne
	 J3d6lcvLsDk3tVW4w/AuPsrEinrYfHGHRVA6pKlQ+Fir8LYTPUULzCXeMEEwQvSn4lyr1
	 RXP7+967/jjCLEOyWW3dIBZbI7VLySaRxqtulJFmZWWMgynlxEo8tXV/W1n5FuTvKbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793221182;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qaQSYGMYJjRHdqv1JNYADQndewpgit/Om11IjQW+ZUk=;
	b=o4VG3iBIrExp+7AuIN8wSnWhm2t56N0xSHzRp2sPJEPULUCUfbCX4ujKrqO23ucy6RCe
	 8hnkyHLmv7inDLtp/3dqemueHZDDNKJumPRbKMPctRJ6piIY2HB6K1cQyt01GbAQj7mFY
	 aJVEflPBjLKnlxd1P2kdpVbbodoKeI+mAPQNGRjycmv1IDdiyIqvjjqJ7AteqOSe1zBWD
	 idbgYazCtKywLedZIRWzbzVRe/Jl+gU04y4tMYNzhnDsdSIZL8BHpy8VY2U1fAQVL06mr
	 HjgYZr/d1RTypCt37UCUJ31yyyljpbLo7JCMCCUcEHdV5eOm5KFjZx01tGNWvpFLrnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u5QKoSGG;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BFC606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 20:59:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48BFC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u5QKoSGG
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-14fc585291cso1295981c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793221181; x=1793825981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qaQSYGMYJjRHdqv1JNYADQndewpgit/Om11IjQW+ZUk=;
        b=u5QKoSGGKa5FcFqgzz2UgIWYWG2ytJgfO8emLPx2PdBSUJgRSZ5N50PG1CpEZfhRQx
         6nui0Ola6WQcunlDZLYRaLZ/2f/KoyJCo04OokKdxpFPaDvjBbC14iTopLpDIygIS4uL
         QSoGW/1kajxzKQrjTwe/04JOgas7wR/ROxlYVOt+upOmoaLrALsDZxElpL/v2pmsjfNX
         jAcEH9dZEairz3P9fCbq36OxGAt+bWhWv7OSP2V+/rIyV0TahtJsQMBleeuHQJKnmAf4
         OHSKPWcs9nfzUp7REDuP53RbFPkfDFZw3ywxQydWfMM8NElPvdtcaPC43iMqbq3GbiJY
         zD+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793221181; x=1793825981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qaQSYGMYJjRHdqv1JNYADQndewpgit/Om11IjQW+ZUk=;
        b=Ls0R18JrptMzzexLO2AF+7NNoz2JA/6ufKA26OVg69qpmhVNkYT+DpnRA3hUOIenPf
         s4nBAJbiI/kaI0MQrk1zxPAPCxPtID+EI+WASMpeOCl1IZZOthUSGfkXDj0y5Gf2nQYz
         2SZvGjOV/Vd9QumpEMvX8xUsKq+2nFUjiBceo127KDn7SFNH0jl1VtrqfDKNmHN7Vq++
         O0uQpMCcKMo54BQse4DrGbKTN9H+wXA+SYBO4R23OeJSvRqDqT7lUJl8U7uIySNOAts/
         Riwee30Se84fFrLuKI1gbDupzQUge0bmqH8dJF9SaKX+bEnuYbDY3AKUhdR12/ytuzd8
         uE5g==
X-Forwarded-Encrypted: i=1; AKwUvBzs7rg3RmLKMO75fbhYUhO0ZyZUjtTcDbfi1pHAUdt8jDLnpEnGIKxT9pv+/+q8Zh4+2+PYK7wkn0MYwYI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLiKWQncP79/Yo7pQ/Y4O5hUOSIHZgNK1sCD88ydEjvYO1iS6FY
	qh8szv6JFJVNgW3OeqYIXX5TcWWTHqd7+U1i60k/Gr7/J4QZqxNhhZnnPcQsKdBZ
X-Gm-Gg: AYBFou2JwI3LI6mz2MZhxYrf696kdtHXK7m6KBWSBadPid37he04B68MNa8DYO9k9Ub
	9t5Ic5AdE8i9aXqc5R1mMetnoPT8B7QJc/TCNS1lHcIJvzmNQbNR9uDeuT8DVAHZ8rnaoW0XG4P
	ZcG3dXZN1kMcdX7bfryeGenHd3VtWsVYDLiPW7nNTaG0FxMpz2VwiqBUeMnWYYRBh9rLgwMr/bk
	jr3I/CECcjdY8GyKi6ZUsH5QDG4fuhnvyZx/4ugcD6AHavMwCQDyB/k6FgjFiNS5H3U3QCviKQ8
	E4eu2y0Szpanj7cIRUuzkeUk1Qj/8Lc8xEUh1PMTet81o6BGne1TgrgbAk1ZLzzyu+bpJ2c1MT8
	hFYYVzela+DCAy8vYGUgF7VrVeC7d0kRcNH7suNkIIreFS+H55zZHJpVOZRTV/K8b0mTWKHUfeY
	r4uTcNSwzCmTf7z0ek/J0/1DAs9mxUgRv68QBAmoCDUtV6d5Fk+fHadlzfJDnTVoiS/5JdbKqP+
	DOSuSE9RuNeg28Vq6FyvJkcWa+SwrkhmR1SCnEDYDOGcP11k5sQeTwJfH5Nm9nlQ301bDuXKWHB
	l2Ypgj7Nu5G1AYCnmy0bkpcz0/7G5MBGkhZCGz1QH/IWUYlbM6ZMG2oXIm1GmnBCGOOhqa9LJXE
	E
X-Received: by 2002:a05:701b:4583:20b0:185:b157:f271 with SMTP id a92af1059eb24-1a6ce113ee5mr4231317c88.23.1793221181020;
        Wed, 28 Oct 2026 13:59:41 -0700 (PDT)
Received: from samniyama.tailbcd61.ts.net ([76.20.4.3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75d76814bsm7954568c88.10.2026.10.28.13.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 13:59:40 -0700 (PDT)
From: Koral Ilgun <koralilgun@gmail.com>
To: netfilter-devel@vger.kernel.org
Cc: pablo@netfilter.org,
	fw@strlen.de,
	phil@nwl.cc,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Koral Ilgun <koral.ilgun@adtran.com>
Subject: [PATCH nf] netfilter: nft_flow_offload: do not offload multicast
Date: Wed, 28 Oct 2026 13:59:38 -0700
Message-ID: <20261028205938.662312-1-koralilgun@gmail.com>
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

IPv4 multicast stays out of the flowtable only because the reverse
route lookup in nft_flow_route() refuses a multicast source address.
The IPv6 route lookup has no such check, so IPv6 multicast that
ip6mr forwards goes into the flowtable.

Skip a multicast destination for both families, so that the result
no longer depends on the route lookup.

Fixes: a3c90f7a2323 ("netfilter: nf_tables: flow offload expression")
Signed-off-by: Koral Ilgun <koral.ilgun@adtran.com>
---
Tested on an arm64 router with Linux 6.18.54, with an inet flowtable
that offloads forwarded flows, and IPv4 and IPv6 multicast routed from
the WAN to one VLAN. Without this change, the IPv6 flow went into the
flowtable after its first packets: the ip6mr vif counters showed 25 of
1,500 packets, and the receiver still got all 400 packets after its
leave. With it, the vif counters showed 1,500 of 1,500, the flow stayed
out of the flowtable, and the stream stopped about 2.5 s after the
leave. IPv4 multicast stayed out of the flowtable before and after.
Unicast IPv4 and IPv6 flows still went into the flowtable.

 net/netfilter/nft_flow_offload.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/net/netfilter/nft_flow_offload.c b/net/netfilter/nft_flow_offload.c
index d3c5651dd699..1fc755e594b0 100644
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
@@ -35,6 +36,16 @@ static bool nft_flow_offload_skip(struct sk_buff *skb, int family)
 			return true;
 	}
 
+	/* A flow keeps the output it resolved at offload time, but the
+	 * outputs of a multicast route change when listeners join or leave.
+	 */
+	switch (family) {
+	case NFPROTO_IPV4:
+		return ipv4_is_multicast(ip_hdr(skb)->daddr);
+	case NFPROTO_IPV6:
+		return ipv6_addr_is_multicast(&ipv6_hdr(skb)->daddr);
+	}
+
 	return false;
 }
 

base-commit: 734bef548a96e8774d6eef5dfa2026c6edc4e80b
-- 
2.43.0

