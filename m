Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC133859DA
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 20:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790455527; cv=none; b=iaSqr1PNzJSR9MLyc7E9niV+/ZgGbZzvwxG4ZDr7i1z3UhoczHbMCnqE4HhrT9OdSLrTsi/VQ8IQid0Vct/5Lzm9Y3naCc4vvqSetsyIQPrgC7IA7xeRrSIYlx1RQ+OcnlcHR5coVsN+PnKvoXk2/+/oopsvnsgdmuMA2ce4g3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790455527; c=relaxed/simple;
	bh=MqlDK8J55jruNGAuPsjgh2PCNLlgAIqAbN5WMHFdtr0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JJ92yQpVvDax7ptAIuWfEUB7we1gHBaDFE0nAQz1Qe1A6Wg4X+HP9bw29LjfZ1iJFLpOg1xZa6ufnJfKZVVVthMEMeZbr6tf9QyB17Y5ycFo3yoYLu/k9pJPk1Pmni0fQQlQjgHvxV0BasTFMQ3oZ4TyE1q2NptYfqOGoP/QoUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TsslIKpV; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TsslIKpV"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f63546c3so1514062f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 13:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790455522; x=1791060322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LLi/sbHjZerOh2XvyIRDVA+fsCYAAIaxVQV+uCdFySc=;
        b=TsslIKpVy90omG+tbBI/9YzTN6SiVN6eZKM9CDeSxE9/6eisz5KpnT9Es8HE9+oJ9r
         Kdn/2+y7xtvUCHPmNTfvFKVT2EPsvsOjOfARWAb6Cik7gfurSKwWJmue/rB4dbeyImep
         r0sOGBfhSYIWAqOf0+a9vP9rnQm2zASjfWYTkj8hBBcDl3mnXN4L9aeE6rC2b2U9RIuC
         KvGunak5/N9VpiEhu4fTpdP0YfEgokqPgrMF6zzxVTCNUL6v/BDld5rny+6waKdFodEI
         KNS7KtBgaFbJ8s7vyKzK/dHklssex6bdz1x0j0JNvi36LLJ5dKRyMA/zx2v2PSQFJ9jM
         dc1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790455522; x=1791060322;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LLi/sbHjZerOh2XvyIRDVA+fsCYAAIaxVQV+uCdFySc=;
        b=nw7cLLuGKAMrSiXvrDsQNxiFiInd1lmwd34NFfiel0OUsnaZFBrV/ylp35dfbowdHz
         /+qaV73zQhUh4aJZofat5G+MJrOmRf9RWzXXN0vAWRkEBPrzCy2fJO01qM+4ZISuAfMl
         At8dKocj3KC8T/Z5ttxkqTbGjWNE2XuzZcvxWFAGh40NHtbaiOwkktg60FwNtE+ZV9+1
         mp4lEnonuR8TMwra+GQXJqUfApTTIWGcWzp8EYtljfntY7JyBFfKl0+aZJ6DwGN4gYW0
         coKNBvvTFCTEjjA2U2555LAhvZax5+ptWyGKb3d6g4DcTIRKbL8i+adtVjomBX2Bo9hn
         hzcw==
X-Forwarded-Encrypted: i=1; AKwUvBwzxbbejQ9V295cXPjP8/Fhn6gCgCnaMz6lLrad8l02AYMAUMnuR/uxJ+MZyGv3nAbbeNRtH7InCqANF7Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYLbarO+CLZ/cCQxYQAxes5+qeNaEkjvOwEMyjsy5DZLwGUeMAmb
	KNgBuGQy2cIlezGzDKgIXJttpjpYdT+ilLSwbO+nJBYP81zG6wQY3thJ
X-Gm-Gg: AYBFou3kB/ZMMvbbGP3fnAN5t0hw7+ebbBelWygfmsQeoTN0u8+r6pNJICM3TBz4o+j
	hRwyB2QUsZ2EMKGAZC6AoUTOuKtTzQDI3VrKGCXlh4nyLpF+/zhK91vE8SeJwXqJt35bkb0WAFK
	K+ErqM/gZaWP5QF6OHVJ43M3L1rGWzVtgNxuIbPWzbD+ss1QcaXTMQeAqZLKfzKAlG2hzKSA7y7
	NobL2UnovaD8ynn5vHNtrx5oO0+e5llhl5IoHat2/k0gL06SVyXI0p9IiiqFccZVwoa1XF8X6HJ
	7HjHLBje2HCraH8Blk8WvFMBej/+5aetf/DBWHC7D8sLHgOCCE0nGkREcyPe16iKKrERIfNMK0v
	SGmYRkkSWjmKyeDJAtVGwHpEfah64mj6PiOSfzo1nmGtbVnhLzASRkMOgI92s6sVxoitWxbjkwR
	h1Ufy3HBGzc1CKXNc/Cc2zqBezyQX/72ENWHnFoLeC3IhG+Ic99aExZ4uebxz6ptf9vQ732WuKI
	SDo7iJAfWikRv/yxKu8+kE7wsJa3s7tqJa5J5mbS+4iPVwVS7vcYkBm6ZMHf9oRksI=
X-Received: by 2002:a05:6000:644:b0:488:7d0b:e354 with SMTP id ffacd0b85a97d-4887d0be4cfmr9257525f8f.45.1790455522177;
        Sat, 26 Sep 2026 13:45:22 -0700 (PDT)
Received: from Raghu007.. (sgyl-44-b2-v4wan-174108-cust110.vm6.cable.virginm.net. [80.1.81.111])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a355826sm16394881f8f.18.2026.09.26.13.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 13:45:21 -0700 (PDT)
From: Palla Raghunath <raghunathpalla.0209@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Patrick McHardy <kaber@trash.net>
Cc: Shuah Khan <shuah@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev,
	raghunathpalla.0209@gmail.com,
	linux-kernel@vger.kernel.org,
	syzbot+5a8667f002726fc59f88@syzkaller.appspotmail.com,
	Phil Sutter <phil@nwl.cc>,
	Simon Horman <horms@kernel.org>,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org
Subject: [PATCH nf] netfilter: ip6t_SYNPROXY: check TCP header before verifying checksum
Date: Sat, 26 Sep 2026 21:45:18 +0100
Message-Id: <20260926204519.43402-1-raghunathpalla.0209@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

synproxy_tg6() passes par->thoff to nf_ip6_checksum() before it has
checked that a TCP header is actually present at that offset.

par->thoff comes from ipv6_find_hdr(), called by ip6_packet_match()
with target -1. ipv6_find_hdr() only checks that each extension header's
first two bytes are in the skb. It then adds that header's declared
length to the offset and stops at the first non-extension header, so it
can return an offset past the end of the packet. With
CHECKSUM_NONE, nf_ip6_checksum() calls skb_checksum(skb, 0, thoff, 0).
When thoff is larger than skb->len, the BUG_ON(len) in skb_checksum()
fires:

  kernel BUG at net/core/skbuff.c:3606!
  RIP: 0010:skb_checksum+0x8b2/0x8c0
  Call Trace:
   nf_ip6_checksum+0x1bd/0x320 net/netfilter/utils.c:89
   synproxy_tg6+0x1a4/0x6e0 net/ipv6/netfilter/ip6t_SYNPROXY.c:21
   ip6t_do_table+0xd37/0x15b0 net/ipv6/netfilter/ip6_tables.c:366
   ...

In the syzbot reproducer, a 60-byte packet carries an AH header, then two
hop-by-hop headers. The last hop-by-hop header has nexthdr TCP and
hdrlen 167, so thoff is 1400.

Fetch the TCP header with skb_header_pointer() first, as
nf_reject_ip6_tcphdr_get() already does. This drops packets that do not
contain a full TCP header at thoff before the checksum is computed.

Fixes: 4ad362282cb4 ("netfilter: add IPv6 SYNPROXY target")
Reported-by: syzbot+5a8667f002726fc59f88@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=5a8667f002726fc59f88
Signed-off-by: Palla Raghunath <raghunathpalla.0209@gmail.com>
---
 net/ipv6/netfilter/ip6t_SYNPROXY.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/net/ipv6/netfilter/ip6t_SYNPROXY.c b/net/ipv6/netfilter/ip6t_SYNPROXY.c
index d51d0c3e5fe9..04db1f82420b 100644
--- a/net/ipv6/netfilter/ip6t_SYNPROXY.c
+++ b/net/ipv6/netfilter/ip6t_SYNPROXY.c
@@ -18,13 +18,16 @@ synproxy_tg6(struct sk_buff *skb, const struct xt_action_param *par)
 	struct synproxy_options opts = {};
 	struct tcphdr *th, _th;
 
-	if (nf_ip6_checksum(skb, xt_hooknum(par), par->thoff, IPPROTO_TCP))
-		return NF_DROP;
-
+	/* par->thoff may point past the end of the packet; make sure a
+	 * full TCP header is present before checksumming up to it.
+	 */
 	th = skb_header_pointer(skb, par->thoff, sizeof(_th), &_th);
 	if (th == NULL)
 		return NF_DROP;
 
+	if (nf_ip6_checksum(skb, xt_hooknum(par), par->thoff, IPPROTO_TCP))
+		return NF_DROP;
+
 	if (!synproxy_parse_options(skb, par->thoff, th, &opts))
 		return NF_DROP;
 
-- 
2.34.1

