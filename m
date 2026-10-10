Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58AF17DFFA
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 13:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791638329; cv=none; b=chDDmKJTa5t9BhJlWJlxDn2Wa/X+NEz5Y2lnqSqb7Ag+pmxmnEK6k/IUK1DFptaDMqlhOQWvCqrM0RZIwlB65c9gOIi0Eo32DB1g8JncxNK4Gbj4NoWbaguoHSTtqlgWG1a4KYRkAdD2KVNaQHj1M/Hz/v+HLneFd3MhOkXQLJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791638329; c=relaxed/simple;
	bh=27EJi6TjnSjImT4pHCWgdTRpbgTyfiGZ4/EEqd3SyYw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EbA6LGlf5TFZdPqqCsvVWhY05R71AcXmrM9KnaWlXVCfoygfwYlDZCqJslW86WBDuTA0VQ8cMKar5sJ0MPwEGFx4rA848jlX0CDcbBQnbkVn8W1yO/xEkUcmq6bKp1AaBlwzBsqCCiCv8Zdk+3uCQhcOG3H2FY90/vkQOz/k0Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=MPsd7qxq; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="MPsd7qxq"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c315a445752so103012166b.3
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 06:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1791638326; x=1792243126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0vnhpg2eJPBEtq3hlcvYRHNoN6r/MHFNtAkVNtqnggE=;
        b=MPsd7qxq81KYUfZCQHDRzHjfvCU9Q5jan7kfW1Byl3SNs0MDaSD73x6hu/grFysVBe
         1VDXL4YAXkuctWfHGOg3shOhKOXocTnE3E7866XUI57zFfrh53g4fwQWov5l548ZYcBH
         nnI8BZzblQuYWGxNSOzLvplogbUAMeUPWjLVXDyvPBud0HChdu/KXYglGq2n0zEgW9m+
         8Od2wO2kUta8nTM4N7Wr5XpINBgZtStokms4QFjlis86/VwXqNc8VRVChuObg3CyJduF
         /9fOfvzr1bMDPmY9zZp9Ga74o0OdAPCeJLEVZxGzJw3ImXB7p8U3SHGUhTdBz7t4pxvh
         tkYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791638326; x=1792243126;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0vnhpg2eJPBEtq3hlcvYRHNoN6r/MHFNtAkVNtqnggE=;
        b=wy7w/AiuODlSn240FDkXjJa8lhwIk9oVEFuVVAh/M3F4Nuoj8LZDB7Oy2ndGa85zPv
         6B9mdfBjAeQZyiDHd3TVaiLPJq4wQHWCS+ms7FiGqReyWoOFsMj89ADQO6GY1RgymESx
         uOCcazZJkfKKe8hq4gM2JFgrLK3JCoWdKBhvszmJURGEHRv6lQdcncO5F9X52xcV7oY2
         aRwxbkBL54+yzLt3Ihr16Sab0i/nFQV6l/l269PgO7iBu0lKOvtwln04wTdVdfX3G48s
         Qw19itKP7CZy4bW2NSq82c4VBYaRaS97TdnL0Z+ZCYTbTyjxhjkXEnKsRM0DrKuHvm1H
         dTvg==
X-Forwarded-Encrypted: i=1; AKwUvBwWjWz+1jYdxI7uVirO0oCn5WB7Up5wVdaLrEAQEaXeWdDau1VSDUwW6MSuavyLjnH0jQudn707U0VX9TU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJXl8NDNexD67Lv8N5C+VbCHM9lDyFE6GLclYHJFN8MGedcUUsq
	JDbsf/d3w6DD6zV8YsSwdn1nJ5ltGefzkxC5Ug0HprpUqmRCzPvFZrVPCXZ1uh/Ucg==
X-Gm-Gg: AYBFou04F0Lx7+aEOyeZ2zd9YUscruXe92KjYA7ZPTuA6nX9k7C+Wp7nUVpQx1zrKkb
	d2QDs4v+zWxdm36yxwwoGp39M6Kp9wNpt9YcX/6O7B/553VhHDNAK575MTr2wa1LKj19X3q/nnz
	9hla7kPkZt6bOnNTEWhz84GJYZaK9ZerMhD322JBHrOx6tReWsroB1Bojw2bgPLQUdEg1MTxVTG
	2APDi2l3rQDyX2SDMJuJQ3K9WDIbAIgsK7yok9EGZ+52HomJoInM900Ceh/4blnnhAgRXt4dQt7
	GdXp2kIE4iwYQNVrXRjklh4Z2GEXCsw7ZBFTmQ5cR1L4DOdW6N4tChi2AtoYP8MaUnbhm3Iia/2
	zI769J2bPCiuhdMUvPAe3gemhQ0mzIETh619DdR7ESPHBWdoBA7Ex5D2b5VhqKAQEKW1LW5nizW
	ZVU/2uOxydZhrXMSKmChLfMDNyepS6ijnMivEF+TTFtrGmajBX42KeE30vg6l7T8So1BHd3/fpF
	abCfrio3g3T0y3XQPjexPWq2cgiB/QVFCKdvZnpZad6rmZpxjNeifpHHXzyb/fZg2MdWQyxFhiG
	1Qpr8qS2NoRXYwYeTc20KaUixOMwkSIJ/BtZJm2TinNGRx5djCODrKqpcSBLDgqSqkimlcYWKRH
	caIPdorhjq0DucRxAUUiLydlWP14p5vfsKZJ93GmapUTGlmA4Zpzb/hr9mWtAJrPGXWJWXNyi0v
	99Pe4HynPy
X-Received: by 2002:a17:907:3e0d:b0:c2e:80b0:deb3 with SMTP id a640c23a62f3a-c31a9a10e74mr527796166b.7.1791638325616;
        Sat, 10 Oct 2026 06:18:45 -0700 (PDT)
Received: from Desktop.fritz.box ([185.181.129.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c32af0a00b4sm102832866b.53.2026.10.10.06.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:18:45 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
	idosch@nvidia.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	steffen.klassert@secunet.com,
	willemb@google.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] ipmr: do not drop GSO packets that fit the MTU after segmentation
Date: Sat, 10 Oct 2026 15:18:41 +0200
Message-ID: <20261010131842.2157365-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ipmr_prepare_xmit() drops a packet with DF set when skb->len exceeds the
route MTU, without checking whether it is a GSO packet. A UDP multicast
stream received with fraglist GRO or UDP GRO forwarding enabled is
aggregated into GSO packets, and every aggregate is dropped with
FragFails, while ip_forward() lets the same packets pass by checking
skb_gso_validate_network_len(). Do the same for multicast routing.
ip6mr has no such check and leaves GSO packets to ip6_output().

On an IPQ8074 router with fraglist GRO on, a 10 Mbit/s stream of
1316-byte DF datagrams routed by igmpproxy loses 14.5 to 15.5% (n=3)
and 0% with this change.

Fixes: 9fd1ff5d2ac7 ("udp: Support UDP fraglist GRO/GSO.")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 net/ipv4/ipmr.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/net/ipv4/ipmr.c b/net/ipv4/ipmr.c
index b9c544d48c452..06c37b4e653bf 100644
--- a/net/ipv4/ipmr.c
+++ b/net/ipv4/ipmr.c
@@ -1908,6 +1908,7 @@ static int ipmr_prepare_xmit(struct net *net, struct mr_table *mrt,
 	struct rtable *rt;
 	struct flowi4 fl4;
 	int    encap = 0;
+	unsigned int mtu;
 
 	vif_dev = vif_dev_read(vif);
 	if (!vif_dev)
@@ -1940,7 +1941,9 @@ static int ipmr_prepare_xmit(struct net *net, struct mr_table *mrt,
 			return -1;
 	}
 
-	if (skb->len+encap > dst4_mtu(&rt->dst) && (ntohs(iph->frag_off) & IP_DF)) {
+	mtu = dst4_mtu(&rt->dst) - encap;
+	if (skb->len > mtu && (ntohs(iph->frag_off) & IP_DF) &&
+	    !(skb_is_gso(skb) && skb_gso_validate_network_len(skb, mtu))) {
 		/* Do not fragment multicasts. Alas, IPv4 does not
 		 * allow to send ICMP, so that packets will disappear
 		 * to blackhole.
-- 
2.53.0

