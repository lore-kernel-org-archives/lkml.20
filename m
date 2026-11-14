Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794680830;
	b=GoPFwtLiaq3QHuyPehButXeZ6FV50upKcIT/hBOykdN2y1SfLZRoXH2QtLX7Lq+6qKFV
	 S1GBT420JfqZJVvFXV/lQI6nJXie+QlLj45D4J5nhwNFgS0Qu7xX3PPM4G/MN65kvu4FG
	 bWoHJw5fh4zlSpI2SUljTfkqxKE5o9D4ZCEE1Al46CDO1XQBBS2l8E4t/bBK+yi0epjmH
	 PHaG6frF3VwB2CWfL80naEzoR3TjJLKhU22r1ACIjFgEGB6zLj28iUn/K67nDjbj5NLIN
	 LnfIFp1rwKwTgI7rTbTcTRDKgmoKX5NHRzKhaWXKyNRft2qUTixYTMH8p/Go/B3k2xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794680830;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MAWl3LG3vg+V+X7fxYpMkUX0eXKPDq9f9FP9gAO9J7U=;
	b=bklEeTuwK2O8uJ8ngR+3jMDOAoycxm5W+oVN25DgwfQBX9TEE5Ntp1sgaAbC0rxNTAg9
	 wMiSFX+57mR8u4IR1JSwVxj+DvRATNdhNDD0V+z0NaoW/hKTg+QVH84ZBfUpsOLwx5+y9
	 A3vHbPBX1Eh57TG7OoJn9Dfk44SqE5k/jKuH51W7FfPdJRdYdA030PEQ1vPFM41fJkTW/
	 CtNRAp8GfAvofrH/MAn2Pt5BKtkrfG70u9rNGuEetEjXI+uMfDAAncmIFg+Rts+cPK69X
	 JUncVOGT5nrnDCGwqOoW81aWkNGc3PoSa0cQrEUtbGt8h6rFsa9W8ICrr3rfSwHX2Ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=BSYPy6Da;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C4D606A33B
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 18:27:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2C4D606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=BSYPy6Da
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c5075fa7ed0so395404966b.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 10:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794680828; x=1795285628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MAWl3LG3vg+V+X7fxYpMkUX0eXKPDq9f9FP9gAO9J7U=;
        b=BSYPy6Da2odycq/xEWzn34xv7dn6WOqX4mLAmrzI6LZnzBB9mA/Ox+Oe3Jayd4eEP1
         5MZ0xMaIPxXqdakSBQjLJ5oIQu+jz/OEhsUUitWKUCi06O5X13Ya0CzGWdmJK5dZUuLk
         Q1xUzAo2e0ECrfmkWDHxWS0TJ20nS5BP+d/eD09sbWF2bUISZfpPbveRdsoH8T6kQX3o
         GTTr7i5cukJDio/L3DMKdTAQzNUL5z8noGiuUSo2hCriUQQMucOwpUlmLo4DafS4O6vK
         0WIYyYW7MHIU/C66JXrJTUn6pEta4NoNVx4GTcXGq30n9ZOTqsEhALnREC8dgS8BomcU
         XEqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794680828; x=1795285628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MAWl3LG3vg+V+X7fxYpMkUX0eXKPDq9f9FP9gAO9J7U=;
        b=gM7HOAGGoqm/Zf7IlolGNtZiDaEh5LxXWwrYIV4/C0NyiVY+ZMnIR7ASMVzLZT5bAP
         Tosds8dZ3eTrUFCMWp9EGm+asBMe5n0qkWR1pumsMdKko/omU8eloJpBL5jQOJIQbML9
         eMWm0ygZSgYcYtMhI8RZ0QPyGWA2Vrf/it6uDhdgBp4ovBCayG6hhAiqKBxeT4E1TwrI
         nHzcmgNdfUXkzYzgGkwoV+CSQlQ5+pE/1bemVOmk/noLGM3noqWT8b/U+8st/8EoH0KV
         GuW5miI/TF/qZLjfXjw8JiNTyzijABOGsIPN5M9etEtk/06xzxsrm49JKyhbMIQnpBFd
         +ssg==
X-Forwarded-Encrypted: i=1; AL+hErHTCxzOwz2+pJXdOB+SfCMQQFcQ+6quS7Csyh++OlcsWOG4/JHC5MKIDl6szS+KZaR+6z4InciWtO53B6c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/euveBhlXc1wD7aDW4YWw7X9gBvzOUvlVTxRgSRohhTACsj/iB
	bipo6fvIgvZySWVAWuLjx7vXve645JnubSOSEH6qFQRrwfh7x1Wm9YAnJXjnRJOdAA==
X-Gm-Gg: AYBFou3+HIAHrDBpp0pquT5djr/sAuhVgKsgrqrE2/dA+N0qfW07BnEqsh8wyMPn3Pf
	tVW31Fs4OYwAkLP2DLlCPtJ+hcG9KLXTOqK2wAvlQ1/JbCxEGM1EYjeEks1DsyZ/pt22qA7+Zty
	pGCZu84GA3fBIrQpqk3VlcDJ3NVyJpb7HrNIl95WZxRw8Zihoy7m+n/Qnt2V+IkLU6l+A5bZ9sk
	dWjqzjuNDG0feRf+nc2MzaX3Nv+8U2q2G5r5IxZFVzgBMwnCfd7x6sZrJSayL6cpUESKqsHkQzw
	fjCjuN8vvkVng1TEphoPNpelzWi3YKOPeXVyNMzIRCDGWOfdTcQyV9yV9jZRYIF8FsOFvpQsKWy
	3Pq/xgIMd+XLhJWGMpZiSC2TEiUHVoSXmy0bQCzGCyxy/IKdbZbwwHXXlEa9E/4UZwFK5HgCR0E
	2BtlJokPstVh06igr9+eL+kMH21RO60Gb3OEkN3e1IulqFd2g3Hv4aZKAI4JNVIed1JLzTJsIFT
	YC+b/5F3c5rpU75NskhOWb9H2bJZqj801VOl40qXOEDUnUcGAn24MYIBg80dKzOKALsupxQcLNk
	kJSqyWQmw04g6vy37HxaccOC+QyX6an8EQyZKXfZYLL8LBM1yc+/GJQbA9zP7YChhr9m1EVfRjV
	vh4M6EbX49gzOsDs1bWjw+W1POmpZorPiICgonVgyEYY+OeHqPOj0T/TrLnf4Gx5ih0H5Nzhu34
	yiMHJ9l6JBTzgQo7g34Iqg1bOVeDCGBgTR1s/pwHWNBF/WLsSJEwygk5Am06zLzH0r7jSUcKrl6
	hx3KsuxvHVVnp6/FrVhwrsoncPPl8ho/RtxqlYW6IFKShfsN88TjzBsWNkDePKkrx0X8+u3+U9h
	K6I=
X-Received: by 2002:a17:907:96a3:b0:c1c:4a80:30c4 with SMTP id a640c23a62f3a-c50962eeff0mr503135566b.11.1794680828136;
        Sat, 14 Nov 2026 10:27:08 -0800 (PST)
Received: from Desktop.fritz.box ([185.181.130.189])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5a78csm240086066b.4.2026.11.14.10.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 10:27:07 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	dsahern@kernel.org,
	idosch@nvidia.com,
	willemb@google.com,
	steffen.klassert@secunet.com,
	jiayuan.chen@linux.dev,
	mfleming@cloudflare.com,
	almasrymina@google.com,
	bigeasy@linutronix.de,
	richardbgobert@gmail.com,
	ecree.xilinx@gmail.com,
	bsdhenrymartin@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v5 4/4] ipmr: do not drop GSO packets that fit the MTU after segmentation
Date: Sat, 14 Nov 2026 19:27:00 +0100
Message-ID: <1447f5496cdf334e48af37fcbd9f56dea8cd6de7.1794151759.git.julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794151759.git.julius@bairaktaris.de>
References: <cover.1794151759.git.julius@bairaktaris.de>
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

ipmr_prepare_xmit() drops a packet with DF set when skb->len exceeds the
route MTU, without checking whether it is a GSO packet. A UDP multicast
stream received with fraglist GRO or UDP GRO forwarding enabled is
aggregated into GSO packets, and every aggregate is dropped with
FragFails, while ip_forward() lets the same packets pass by checking
skb_gso_validate_network_len(). Do the same for multicast routing,
leaving room for the outer header on tunnel vifs. ip6mr has no such
check and leaves GSO packets to ip6_output().

On an IPQ8074 router with fraglist GRO on, a 10 Mbit/s stream of
1316-byte DF datagrams routed by igmpproxy loses 14.5 to 15.5% (n=3)
and 0% with this change.

Fixes: 9fd1ff5d2ac7 ("udp: Support UDP fraglist GRO/GSO.")
Reviewed-by: Simon Horman <horms@kernel.org>
Reviewed-by: Eric Dumazet <edumazet@kernel.org>
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 net/ipv4/ipmr.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/net/ipv4/ipmr.c b/net/ipv4/ipmr.c
index 09d6b0ff1ffb7..45769d2077172 100644
--- a/net/ipv4/ipmr.c
+++ b/net/ipv4/ipmr.c
@@ -1940,6 +1940,7 @@ static int ipmr_prepare_xmit(struct net *net, struct mr_table *mrt,
 	struct rtable *rt;
 	struct flowi4 fl4;
 	int    encap = 0;
+	unsigned int mtu;
 
 	vif_dev = vif_dev_read(vif);
 	if (!vif_dev)
@@ -1975,7 +1976,10 @@ static int ipmr_prepare_xmit(struct net *net, struct mr_table *mrt,
 			return -1;
 	}
 
-	if (skb->len+encap > dst4_mtu(&rt->dst) && (ntohs(iph->frag_off) & IP_DF)) {
+	mtu = dst4_mtu(&rt->dst);
+	if (skb->len + encap > mtu && (ntohs(iph->frag_off) & IP_DF) &&
+	    !(skb_is_gso(skb) && mtu > encap &&
+	      skb_gso_validate_network_len(skb, mtu - encap))) {
 		/* Do not fragment multicasts. Alas, IPv4 does not
 		 * allow to send ICMP, so that packets will disappear
 		 * to blackhole.
-- 
2.53.0

