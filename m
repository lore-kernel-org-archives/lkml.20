Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794302716;
	b=ImB3jQ1uAuhtHpqMuT+yb0mrsa6XCkAi2IJ7KIoWOwsrv4pX7+uCbsL5koQzvq8AwWP0
	 aVZ1FEgInT2dwQ5OLVfzehV+PvUjMgwCB4BaBZyWtnZTyYfiwU/8j3XkQzFs91omUy83J
	 zR61LLbLvIls6mOBqIWwePcgD5CyItI5vw9+5dqu2aUdaPuu6mICkq+EIWvpWiyJpaHvX
	 03xiB+LdjFgdE+90O6dcn+TWhGpfW/1d99tSDr6J7xHGjDzcy/9d42APhAmPbBgmk2LXU
	 W0vLT5e3tjJFYky0XAUl9DVDfLXeNrXoox8hrYQ8m2+lIgGYoDaAF1gg/L4hJjvvDTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794302716;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=Iw96EVLy3uo7NO5SdGl826YFCr+7nw016vGeTrGSnIY=;
	b=OE3yVMz9fCMJ9k/lCrKJiXBd8X/lru2pjdbAihs+GDj8xeh95XJnFaepnh/ivhqqDBo7
	 tvcZVEpIMa2nKx1PrBuy67qqehe3mn1B2T9Q0sSHe/6iohwMP1W2tIIcOHyzRUD8dFpbr
	 fCQZUGYaI6+ewx/WdfepoXETyzbj6GZNDiGLT139anJx0IU0JajO8YnDhmsbIFuxUcKjl
	 scjcfECs6b3A78t0la/wz2RCrJHWOs5MhP24LS2GDDNOyXvRICvODf/SzxLXHOrpoL9s8
	 a+WKi2WnHasHHaVFim8r6MwHRDe3QdNbV6XgiJzkvWvx8sLwMfN8oIXk3cnzzFR5m9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--sewookseo.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XY1Rck9u;
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B6E6071E69
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:25:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73B6E6071E69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sewookseo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XY1Rck9u
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b07b06027eso2312796a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794302716; x=1794907516; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Iw96EVLy3uo7NO5SdGl826YFCr+7nw016vGeTrGSnIY=;
        b=XY1Rck9ucIY5y4i1J22jkm2YLbQip4P3wN/c7gTbA6FcOikGK48j9hDEcGuyG2rA8x
         dJ2U8yt8TdnUv0p744gxoGf8js5JAXBEY8W3XAE4+42h/Vog2Gwe1r54gP0oUvcU4PRU
         Xvo9ja+7TTrtCDFnL96fhmNFlBEFBtAhMAcdHi2H9fSKLCe+qfWL3D739t35sTcfMBgu
         S7hHkWuov1cG2e84DJIAdZa5YYBUKcT+UnO7+JAymQVEB//t7uKVq/sLckbqb2UQecPT
         RgO2fffJf48CsmorM1PdlHvbwaOR0PXIfUP3RNebwDwtd4y575Wc+d944+SnET1wMEif
         W4mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794302716; x=1794907516;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Iw96EVLy3uo7NO5SdGl826YFCr+7nw016vGeTrGSnIY=;
        b=btywxEvhCU9mz09tVHcIuA8ooqZSV2eSyWv5PRkY3O/XVPyfpNtaB/wxKbd+8NLVt5
         E3YvJ4pK8qB+BihBVmCURXzO+JQDmTdFHO+weYIYWCTsABEXOk0cj+n/vxhm8aGRyDua
         3v/15MaEIRWFtTux1GwSZihNAYMXS/TzWDd0C31wGjDH5uiSUIfRKFBZqv8JmEhiUu/g
         vDY0C3uEYRd+Z4eQRbNlqdb+YbK9GplNcu1LJgGT9xBiBESKQRkwf7dmiBc0G7ONYxhX
         8BQRZnc7mu+dvsVUta2QV0xdTcTgCbdx0MUxHSYbzJZae5/ngSVTqsoG2Rm0sOP1oHXR
         0a0g==
X-Forwarded-Encrypted: i=1; AL+hErHxf7rBI1m4LyPxRPpLDgvYxJAetXSEBtP7sQOkACACwdeyZPPVNQ8hTju0owAI3X4uLBQx0iGXeHwBUOs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pI9nGfDfbuNbaf28P7jnex9CQq5bB4VTkilRn/+dDjSGkWEI9
	F+kaN5qJMCbYY28dyVHnkLdQpytxcs9PpjBOF+XGgWmUBtzzmh7Wr3NPh5UdZWwV/mo1wKWFgEg
	cZAh458tRNVpWnTHXOA==
X-Received: from pjbsv6.prod.google.com ([2002:a17:90b:5386:b0:3b0:a489:6e84])
 (user=sewookseo job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:224c:b0:3ac:7f4c:a68c with SMTP id 98e67ed59e1d1-3b166fbd19dmr2275693a91.49.1794302715465;
 Tue, 10 Nov 2026 01:25:15 -0800 (PST)
Date: Tue, 10 Nov 2026 09:25:12 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
Message-ID: <20261110092513.2375648-1-sewookseo@google.com>
Subject: [PATCH ipsec] xfrm: check inner family via skb_dst for small_ipv6 DF clearing
From: Sewook Seo <sewookseo@google.com>
To: Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com, Sewook Seo <sewookseo@google.com>, stable@vger.kernel.org, 
	"=?UTF-8?q?Maciej=20=C5=BBenczykowski?=" <maze@google.com>, Lorenzo Colitti <lorenzo@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Commit 6821ad877034 ("xfrm: do not set IPv4 DF flag when encapsulating
IPv6 frames <=3D 1280 bytes.") intended to clear the outer IPv4 DF bit in
xfrm4_tunnel_encap_add() when encapsulating inner IPv6 frames of at most
IPV6_MIN_MTU (1280) bytes, by checking skb->protocol =3D=3D htons(ETH_P_IPV=
6).

However, its caller xfrm4_prepare_output() overwrites skb->protocol with
htons(ETH_P_IP) before invoking xfrm4_tunnel_encap_add(), since
commit 0c620e97b349 ("xfrm: remove output indirection from xfrm_mode").
As a result, small_ipv6 always evaluates to false, leaving IP_DF set on
outer IPv4 tunnel packets even when encapsulating <=3D 1280-byte IPv6
frames.

This issue was observed on devices in production use over IPv6-in-IPv4
ESP-in-UDP tunnels where an intermediate IPv4 link has an MTU smaller
than the encapsulated packet size (e.g. < 1362 bytes) and ICMPv4
Fragmentation Needed errors are either filtered or not actionable below
IPV6_MIN_MTU, causing encapsulated <=3D 1280-byte IPv6 packets to be
dropped instead of fragmented by the outer IPv4 router.

At the time xfrm4_tunnel_encap_add() runs, skb_dst(skb) has not been
popped yet and still represents the inner packet destination entry, as
already used a few lines below to set top_iph->protocol via
xfrm_af2proto(skb_dst(skb)->ops->family), while skb->len still holds the
unencapsulated inner packet length. Check dst->ops->family =3D=3D AF_INET6
instead of skb->protocol so small_ipv6 works as intended.

Tested on User-Mode Linux (ARCH=3Dum) with a four-namespace IPv6-over-IPv4
XFRM ESP tunnel reproducer across a 1300-byte MTU router link with ICMPv4
Fragmentation Needed filtered (verifying 1280-byte inner IPv6 frames fail
before the fix and pass via outer IPv4 fragmentation with the fix, while
larger frames still preserve outer IP_DF), and verified all tests pass in
tools/testing/selftests/net/xfrm_state.sh.

Fixes: 6821ad877034 ("xfrm: do not set IPv4 DF flag when encapsulating IPv6=
 frames <=3D 1280 bytes.")
Cc: stable@vger.kernel.org
Cc: Maciej =C5=BBenczykowski <maze@google.com>
Cc: Lorenzo Colitti <lorenzo@google.com>
Assisted-by: LLM
Signed-off-by: Sewook Seo <sewookseo@google.com>
---
 net/xfrm/xfrm_output.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/net/xfrm/xfrm_output.c b/net/xfrm/xfrm_output.c
index f1f612cd7b43..60ffe9549c09 100644
--- a/net/xfrm/xfrm_output.c
+++ b/net/xfrm/xfrm_output.c
@@ -275,11 +275,14 @@ static int xfrm4_beet_encap_add(struct xfrm_state *x,=
 struct sk_buff *skb)
  */
 static int xfrm4_tunnel_encap_add(struct xfrm_state *x, struct sk_buff *sk=
b)
 {
-	bool small_ipv6 =3D (skb->protocol =3D=3D htons(ETH_P_IPV6)) && (skb->len=
 <=3D IPV6_MIN_MTU);
 	struct dst_entry *dst =3D skb_dst(skb);
 	struct iphdr *top_iph;
+	bool small_ipv6;
 	int flags;
=20
+	small_ipv6 =3D (dst->ops->family =3D=3D AF_INET6) &&
+		     (skb->len <=3D IPV6_MIN_MTU);
+
 	if (!skb->inner_protocol) {
 		skb_set_inner_network_header(skb, skb_network_offset(skb));
 		skb_set_inner_transport_header(skb, skb_transport_offset(skb));
--=20
2.56.0.542.g3ef89b7020-goog

