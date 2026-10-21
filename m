Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792550880;
	b=vCJe3984A8mC6XbCy95QSb+biZu1Y4HeVsn2t4cIbTtEZkGsl+ICgQQKtowrhHY79jCm
	 KrebO8T3Jn69XEIUswRhYtRhYvha/N38W3JO/sxBBHriqG4hH/iSovJWJT+flzidQnHPz
	 J5TtaQHjRV4+Ra9w5HrHAx3VGl3+QdDifRrCJrwEK1v+g3cLCahUftccxGNU3u17K16Q8
	 YwzFT0YBsSyPRHHxMme8j0o0vZCMwvvgLjhDOc5RnZS6Qd9YKQsrjbnyTVQr6np6YUbZk
	 KpmJaCDv/FnS5hmgYbX0fHF6oxVyIghdJF/v9UM2mGpu4GSR0sWwzXZ1u2jMd6rVXMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792550880;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fJiseS4iluYQLnz/LCLSPHnCYq4WmvzCwyXvRqIPruk=;
	b=p2jLnG3oCQtIPaElUOcXb+H9Qr2IH0LW5EV2NElao6pxQJtBp6OyuEw2mAHzbFvvdp/o
	 4eSct66t99yrJsI0Vvc/9IBVKvPTx8aYcX+vza7oUw3eizRE5kGFfDGvgj8ddCGu5omE8
	 QFukq8Kop3Nm+pH9WDgxfpx4NMkc8FPYgIOeBJeJNDtz6L76mwzSOVSrcgYmeP6JNv6lX
	 PjQHb4cBFsFgGcR6JDiY/kcuInG3CO6rjeC9qSLQYUXxM+gnMNCuARtyNEUXEOnN1z1em
	 oQAjnG5twLg/p7BN8OwnX5qpexjGKwS5obytphhFcASHVEcCcHwHcBngOPwHaxplkOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aixKShim;
	arc=none smtp.remote-ip=74.125.227.138
Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5B5606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:47:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B5B5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aixKShim
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-3abe4821449so118274a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792550879; x=1793155679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fJiseS4iluYQLnz/LCLSPHnCYq4WmvzCwyXvRqIPruk=;
        b=aixKShimpTDGxGTRfhefbj+7AhmdO6TKqIjIH+lAHyLujVDwOdjmJoydzSrpf0+NUg
         PE0vbFzRZOmwus3Lt3hdddXBokS/pcSx8xumMyWyfMNfHdXN8CVg3Cd/S7p1lKx4fQMh
         fWcqeJox7ssuCLe8rtYwaDsKejPRW9vKEt5lBFTRnTTZDWMdDiwYfDPML32tn3rteGX8
         PIEiHeBi+j35RylsGmyXmf8huRPJPaDlEjid8oezQd7NuwVq5E5uq+1vb+8qDEV1Rh9T
         8QWS6MCp2sDayINWu/YcZE9wXpFvJdHWmuiULlCN16RHpFNTj4kwsxcvvDThr7obPBPB
         9cvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792550879; x=1793155679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fJiseS4iluYQLnz/LCLSPHnCYq4WmvzCwyXvRqIPruk=;
        b=hauNS1w/MjR1vrRIKjSzL7qSd30h5FN1d51Z8FxXqgET9xoC96fFBU45OFYWeE4OUx
         M321Y1NYxftx0O42exeBWs6wl+x9hELYHSwturXydeYamA1NASbgQHVSe66vGwtyLmVt
         XpAHSGICVoymgomWs8lbIgWfzq5XjxA+ptSo6h0ktGM/du+zTo5tpjFjWsVbDbXRE+ep
         x/sKAe73aUaYeZRsc7ReaOUX5L45XAfIr99Yq+h8nbyVIxKTIrvHlh6etgarP2XA90N8
         vVgrt6HQsu1A1ubpv02yl11aG4xd+E8A6JwOTuYK7s15BGEFE23nkBVu1l04yoGEYCSx
         SEWA==
X-Forwarded-Encrypted: i=1; AKwUvBxk6ZZp7mDvCp3jVmYIgHoA40Lw25R5l6dT7NM9XU7rr3ksyUEsTKovZxB0qjhIkO9pO6yE4U4R27RAyYw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIqxNhu8c9PK2sXQ/Jc9bebjGF8P9ewPkt9ToDSuH5I53nDFVeI
	8IoISo9AAwLKK+ZGVgGkSDUO4V7+tIgmeQoLZajxR9VF3gqMHxi9gWcW
X-Gm-Gg: AYBFou1mlnj8Ion9kJHAj5pWCUlxE/yX2XA/W7Jbw9E6e4QRDeOb2usL7nrLywhDPbu
	z7Kv7/vq6zmlPO9yJQG0uWSibpQ23i/abvpPJG7M6HSLSbE0y5x4mlG1VVvaj5qS7GGy84YIfBG
	MMk9pK27zKWeC5bqaF/x8nsmjxj0pD9tcyjYoQSv4ws7wXu/5t9f5WgDI8Dkx0LOYtG80sAtLb+
	OaK5E7LLQZTl4dABPcwnvmL9u7uX0iV5WRPK8Rk9Yhr6IhhG5qHZrmBB++IJKwmQTSgKlQSifQu
	TidJXDzuQTEeVIOIqpHSvLlUV//0ByMON+l2um2bDRVdK5QEaq6kxJtlKNKWyLW1kZBZFmJSohf
	XDK2s+K6OmRBh4txhdyP9a2fGeSxf0l0aNYAjPCkkaHNP+9IW3CSO5YBSQd2CFJylpLnBQb8/MK
	wRHjQ/wXQaR1OEjK8231g3CnoyhjCNbspg4cub/WoTgMujz1Uh8I7VN6AkQ3dWpPV7ySmsX9LC9
	EUj/wpWXZPo6/fNf25xxmdJo3Vty4DuGDIwcrepCCtPjfbgg/rnfhx7BXonhjQrmVixXBCr78F8
X-Received: by 2002:a17:90b:1a91:b0:3a8:e1e:3390 with SMTP id 98e67ed59e1d1-3ad86d645f5mr753520a91.56.1792550878273;
        Tue, 20 Oct 2026 19:47:58 -0700 (PDT)
Received: from LAPTOP-QJLDGQ2L.localdomain ([112.224.225.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad813ee970sm1796473a91.16.2026.10.20.19.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 19:47:57 -0700 (PDT)
From: Boyan Liu <yymhvert@gmail.com>
To: Andrea Mayer <andrea.mayer@uniroma2.it>,
	David Ahern <dsahern@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	co+98d7de09cd94fec5@bugs.sh
Subject: [PATCH net v3] seg6: Fix unset mac header in SRv6 End.DT VRF decapsulation
Date: Wed, 21 Oct 2026 10:47:38 +0800
Message-ID: <20261021024738.17266-1-yymhvert@gmail.com>
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

SRv6 End.DT4/End.DT6 VRF decapsulation unsets the mac header in
end_dt_vrf_rcv() so that the VRF device can rebuild it for packet
sniffers. The VRF rx handler only performs the rebuild when a
sniffer is actually attached to the VRF device (ptype_all
non-empty); otherwise the packet continues up the stack with
mac_header == 0xffff.

Every other receive path delivers packets with a valid mac header:
NIC drivers set it in eth_type_trans(), and tunnels without an L2
header (ipip, sit, gre, tun) reset it to the network header after
decapsulation. skb_mac_header() even warns on the unset state with
DEBUG_NET_WARN_ON_ONCE().

If the decapsulated packet is an unexpected UDP GSO packet,
udp_queue_rcv_skb() re-segments it after restoring skb->data to the
mac header with __skb_push(skb, -skb_mac_offset(skb)). With the mac
header unset, skb_mac_offset() returns a large positive value,
which the unsigned __skb_push() argument turns into a huge length:
skb->data moves far outside the buffer and skb->len is corrupted,
so segmentation reads out of bounds:

    BUG: KASAN: slab-out-of-bounds in inet_gso_segment (net/ipv4/af_inet.c:1383)
    Read of size 1 at addr ffff88800da7ffff by task exploit/149
    Call Trace:
     inet_gso_segment (net/ipv4/af_inet.c:1383)
     skb_mac_gso_segment (net/core/gso.c:53)
     __skb_gso_segment (net/core/gso.c:124)
     udp_queue_rcv_skb (net/ipv4/udp.c:2476 net/ipv4/udp.c:2466)
     udp_unicast_rcv_skb (net/ipv4/udp.c:2620)
     ip_local_deliver (net/ipv4/ip_input.c:262)
     seg6_local_input_core (net/ipv6/seg6_local.c:1640)
     lwtunnel_input (net/core/lwtunnel.c:465)
     ipv6_rcv (net/ipv6/ip6_input.c:351)

Restore a valid mac header once the VRF rx handler returns: point
it at the network header, and reset mac_len, which still holds the
ingress frame's L2 header length. The sniffer rebuild happens
inside the handler while the header is still unset, so tap behavior
is unchanged; when no rebuild happened, the packet now carries the
same mac header state as any packet received on an L3 device.

Fixes: 664d6f86868b ("seg6: add support for the SRv6 End.DT4 behavior")
Cc: stable@vger.kernel.org
Reported-by: co+98d7de09cd94fec5@bugs.sh
Signed-off-by: Boyan Liu <yymhvert@gmail.com>
---
v3:
- Also reset skb->mac_len with skb_reset_mac_len(), as suggested by
  Andrea Mayer: it still held the ingress frame's L2 header length.
v2: https://lore.kernel.org/netdev/20261017120144.3059-1-yymhvert@gmail.com/
- Move the fix from the UDP GSO path to seg6local.
- Restore the mac header after the VRF rx handler returns, preserving
  the VRF sniffer behavior.
- Verify the original reproducer, datagram delivery, and VRF sniffer
  output under QEMU.
v1: https://lore.kernel.org/netdev/20261010073015.7665-1-yymhvert@gmail.com/

 net/ipv6/seg6_local.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/net/ipv6/seg6_local.c b/net/ipv6/seg6_local.c
index 7b5212220185..4ef9d32907e5 100644
--- a/net/ipv6/seg6_local.c
+++ b/net/ipv6/seg6_local.c
@@ -1113,6 +1113,16 @@ static struct sk_buff *end_dt_vrf_rcv(struct sk_buff *skb, u16 family,
 		/* the skb buffer was consumed by the handler */
 		return NULL;
 
+	/* the VRF device had its chance to rebuild the mac header for
+	 * sniffers; restore a valid one pointing at the network header,
+	 * like any L3 device without an L2 header, before the packet
+	 * continues up the stack.
+	 */
+	if (!skb_mac_header_was_set(skb)) {
+		skb_reset_mac_header(skb);
+		skb_reset_mac_len(skb);
+	}
+
 	/* when a packet is received by a VRF or by one of its slaves, the
 	 * master device reference is set into the skb.
 	 */
-- 
2.43.0

