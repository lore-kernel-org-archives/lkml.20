Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794457466;
	b=kLHrpCfTGhUDvovqDo6uxaVI9TsEVSAHU2Cq6avRxqvxMBC7xaKxy22SLMz+apPPjtkX
	 n6rWzOU+SUO0u6XuhD91Q6niTM4mOw+RZqNfXjnCquNjNHsMDrNfkmac76VnvFk+RtiHl
	 Ku7VlTLfCWjfRMzCaUrcnYJCZbDaVkVqJHO71Pzmr1zMLvroPK5OTZsbslEzUWl2O4K0z
	 eZzerjoN68KVCETlOxb5sMyo8yc59sZPA6TArDH4cOCfpiNeh60/2jAGwIOAlRyAUzg3f
	 0uJgiBT6Ohyg5of7THV/+8V3WnxEplYSzZyjhGlnS6bxBnzjA9t5W6vAKozpxgm1hAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794457466;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lpp4FX5gZJokt1GnwgH1j6FAHpdM7kiuFK8F/Wda8qU=;
	b=i89PIaKiCY5BXKfIyCRBd6L1brvj2QOGLC15+Ry+cwRN4WYTZgYmka3bKq2fB1vZ+4ZJ
	 SQQrMHbBUGvrZyMXO3CTXBGHtHc+Rye8JAqFqxdvI3jelVOVjhm21gT0a69+BK+2xjpol
	 8PJXbbGeNS7ZRdhiwwsxEHBiIJcJWtIZXVTI8BZLU2xszO1miwgGWTFX658DHRZKfigCK
	 KzIWLF0PMJebw5GsrLfL6/ecaabzzBi4UkQ2DPa2I2s/uHjElKk10/1uYNcw0nIft5w2e
	 /ctKqMVgy485sXE8H5XDTGhDz3kJIiftjD60W+GO4nYNOIcR7Fre8WQhBrcNQAdwA+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dZp+0eOc;
	arc=none smtp.remote-ip=74.125.231.197
Received: from mail-oi2-f5.google.com (mail-oi2-f5.google.com [74.125.231.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4052D606A330
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:24:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4052D606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dZp+0eOc
Received: by mail-oi2-f5.google.com with SMTP id 5614622812f47-567e79972f6so155570b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794457464; x=1795062264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lpp4FX5gZJokt1GnwgH1j6FAHpdM7kiuFK8F/Wda8qU=;
        b=dZp+0eOc7wf67+aV9XcOB9yjsrNEhiEJuWZRMp4y85VlJLW8OlwqJMn7CEYTRAzwg3
         W8VJKgm/oGP9cCmLAHuHiJ9izkrdETd/R/a4uRiAditF26dNTa9ZRgeHOb8MaI49JokK
         Zya0oeg80Id2CG9kYrNJAP/W/O/+NQy7mg0mQuQPdaFLRwmkRd7+mpIou1v82/6lJjM1
         MfhuQk4m69Ia9zNaQS/Sqsoovgy2nt9aMRJxgddK91Ax456Qqft6YjtAOfqEpM4/HuIx
         cfAj4tPrB13Xdt5Afph7W/8pPWseLrqRPszMQitrPgVtUeuW76plj+LOoDYA+cDWyex1
         pktg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794457464; x=1795062264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lpp4FX5gZJokt1GnwgH1j6FAHpdM7kiuFK8F/Wda8qU=;
        b=vJrlL0Gfeo6VbQ4i/RKJEiIcLL0NvfYynscG571UzqrKeFd08pI+gvG596FNEgkV2t
         uC+dQX8895lihf53hJrP2rfTecmg1yE1SXjiH64SqatXzq1rTJCTQLcH3LSUippQa2Bn
         xzGjrzPjrJu6JuHezC69oSUw5eHiBgvAFW3hNdDlrSX3mwN1bxMbudYPY1yWw8+3b8la
         9xhiRSEts5kkyskDbwXmykuKs9OX+beudOK10mutkKMTz8XiVjMrVXowjuE40ge6Mnzg
         9PSCeDdGdj/IFkorKMaEdK0toW2qVzeqeuf95M916iv6D1GAGZ8kkp5lRFPhghQDpKxH
         YBuw==
X-Forwarded-Encrypted: i=1; AL+hErGfbsuV8usKR0dtocvYqdp3Vj0tXdzzXOyVGYy6UdfiiOQ5o1g6AFWxyBCh4Gp5Zsc2oEk9eDqKMHgYWko=@vger.kernel.org
X-Gm-Message-State: APuU4Z9RCsGjKdIW34sGCwWf07oLMg551EEIhQgNy8iMyCuVpLJtcmX7
	d97Dgzx74wb3lzPixLiK53+3bACBRVWYzMyTVJvX1EJXVm4AbR0PcL4s
X-Gm-Gg: AYBFou0x0H3OOdm2BTjzPJpPARU+0f1ULhgDDGsne+MMZBNlZWnXg1RYlKHbT13o010
	jwS0U14rMKDUq5StHzHiulQk8H9Glv4U3ygp2FbFbb17IOguADFksMPtjZPLTZHucRX2PvOjSnE
	eGWzbchDlqZLFD/JG3N0qPozcgo6g7J6x2pQzMxSg+9EIQfVdMClRRuztg1tVCQS8/v78d0OanA
	xGbBa4QFQ0Spfx9gT/NGP48pNhzlR62Oij+I50tR57Y+FB5uJmZRF2dlhpLTvjVc8JJUXKXDPWL
	WTTX9IA62kUfWEKl5nbr11pLt99a9Kr8KqTN1LVWT5HAjX2OGBiuIA1aeh9BwLKAMafGySQ4wnx
	/lMG18Bi5GfxaWsLWWqHi3KUrqo4y7AAat+9IEoHwCCfU3aVkLsjdYchrJvO3jYsJRZQOgasfue
	wLbPoKX5mHRUrtjSPbTOO2+0OI4dij1Xb+ues5LjdZIbRIDXP0EdGKNOHvrZSMTRvJ5RnC/UoE3
	BCJBwtE/uypAZ0tkgHK0BaExWkzoyl/fwHXP1+hOKs1I9DkMmyz8tjHgGU++/l65Ipay3CEet6/
	3ZW3NzA5TvfzfEFo3LL0Mhib9NaSxgNYVFt8sk8b/aR9zmlbki/gjCoQ3upqcW8zG3o=
X-Received: by 2002:a05:6808:1246:b0:532:6c52:9778 with SMTP id 5614622812f47-56cd65417d6mr1113652b6e.20.1794457464100;
        Wed, 11 Nov 2026 20:24:24 -0800 (PST)
Received: from localhost.localdomain ([14.22.11.162])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905146a03sm6947187b6e.6.2026.11.11.20.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:24:23 -0800 (PST)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net] ip6mr: prevent info-leak in ip6mr_cache_report()
Date: Thu, 12 Nov 2026 12:24:15 +0800
Message-ID: <20261112042415.617221-1-bsdhenrymartin@gmail.com>
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

The non-WHOLEPKT branch copies the IPv6 header at offset 0 and then
appends 40 bytes with skb_put(), but the mrt6msg is written at offset 0
after skb_reset_transport_header(), so the appended 40 bytes are never
initialized.  They hold stale heap contents.

The report is queued to the mroute6 socket and copied into the
IP6MRA_CREPORT_PKT netlink attribute, disclosing the stale bytes to
user space.  The stale bytes can contain kernel heap and image
pointers, and the report is reachable from an unprivileged user
namespace (MRT6_INIT in a new netns, plus the non-root
RTNLGRP_IPV6_MROUTE_R group).

Use skb_put_zero() instead, as the IPv4 code does since
commit 4f34002e2e376 ("ipmr: prevent info-leak in pmr_cache_report()").

This issue was discovered by Tencent CodeBuddy Security.

Fixes: 7bc570c8b4f75 ("[IPV6] MROUTE: Support multicast forwarding.")
Cc: stable@vger.kernel.org
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 net/ipv6/ip6mr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ipv6/ip6mr.c b/net/ipv6/ip6mr.c
index dd0638d3c3f95..b7ae220d6b21d 100644
--- a/net/ipv6/ip6mr.c
+++ b/net/ipv6/ip6mr.c
@@ -1154,7 +1154,7 @@ static int ip6mr_cache_report(const struct mr_table *mrt, struct sk_buff *pkt,
 	/*
 	 *	Add our header
 	 */
-	skb_put(skb, sizeof(*msg));
+	skb_put_zero(skb, sizeof(*msg));
 	skb_reset_transport_header(skb);
 	msg = (struct mrt6msg *)skb_transport_header(skb);
 
-- 
2.43.7

