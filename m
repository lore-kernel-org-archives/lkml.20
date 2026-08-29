Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0A21FCFEF
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 14:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788014942; cv=none; b=DIz4vvSLxS3BEpxLs63Is0075RSqb4/zGc7USWWelPt9S7dxYvKoE/6wwfW9J+LBtKpFMjBX3c2h3LOjK492FYq6YI31bVyEuu2ma4hLV05CNNpjZH6OdojEmSRPHS2DW99fQAv5UdjdkQC7eL0MuKOSbVlqLRSpmEKO1PLh0EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788014942; c=relaxed/simple;
	bh=VkiTfQVxUTrw0T26RyfgyZTH0MoOGSFKlFOsqotHuPE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jaR+4pIl5IIbVOe10Xb34Z3k1ZM8pj63lVyteowGnwcv5ulvJrYdHZr0RTUg5dJ8UvP3GeC4ycV+B0eb4OVkdShDw0yaOU7u/yQ4zMVzPqADUseDUCCybQtnh86Ye/kzKMXDORPNZ0txZAcNRsSnPrJ97cNxXZYWvzGVPPHmYLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ix/ccs39; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ix/ccs39"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38511175ad3so2154569a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 07:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788014941; x=1788619741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3vrBLtTPaDgsD3NUp4Z5b+goMknBBh8lYG+iL1zb6xU=;
        b=ix/ccs39BIkx1Jmu6621VW4snUtHMjO9KNOanFOOaeKuFToQDdsVqtXmi+IE3tl1ll
         MwoVhjyJUlsNfimIBnYfjBCVwYze7ufqNgPs7KWxflfME5ijyQtPMd0/qQINrwR0WDqC
         fO9xx66dEOZVwgLXul//pFrXG7XK0BrHzCzf42+tfFjP5epyJ5bsUL6EjoD3J+NUXCL5
         KL+WQASyyGxw3LjvE04ghBZD/6XGK4g64oWwVfIXgFwoY8/q+GssLuBQqbMd6mo3ksyy
         ZODGWmMeWRz0nXF6b/0HXCAjcFslyOrHAjHXDeLSKGlpQJjJloF+uiu7S+cPUQlgNFq7
         p7uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788014941; x=1788619741;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3vrBLtTPaDgsD3NUp4Z5b+goMknBBh8lYG+iL1zb6xU=;
        b=HkAcv1iwmS1hdXAlvUqt7kuQlvE/3KnGCunYCysxnLcPioCT+FOkc9cIiy7N41UFen
         PiW598QfUIvqe0764pwqE+ZlYkk3g4BhYwjXrYiDPgiK5xFq9hUQqG3lZi/BUm1M8P8I
         Y0mu4procEzfJbmWfNlSnK/jhRtJUp/oYRjWIEJGy6QsEPlTMAyL9px9d+6MoDix9Sih
         dY5xvuyEWHIVGjamucqFs7/PJ+6AE0ndoG5cAz5iZmAEcUwhfnA7Nvw25v4io0uhdxhf
         bhgT6wwW5fnfNE2c7yYdNlvvuKUbwUiEZflnqP/DizVBbfZnZakZBmzEvNVKfbringxO
         0Xhg==
X-Forwarded-Encrypted: i=1; AKwUvBzPTL8lmS9saRM7c4f7vzz8WJ5diHd23raUePGxi/A/04Lm9CCWd0+M2ESdKCu4GbwU+Doyl8uKVir9GPs=@vger.kernel.org
X-Gm-Message-State: AFuF++lcUcrkRGRpOb/tkzN7c49QvmQ0h0ejY6kA0eBWkQ2Rk/CTEeh1
	DL45k4zawZxMokLEocrBi94YsjWYPejtV6X/xn5AgBiZGTd7tr3ZyT0OpTKS2w==
X-Gm-Gg: AYBFou2WXfEwU0788ORnt0rItvEdJLZUX7S6W/FbdO0wCPaFsb7ND5CsojMH3ITnD0I
	X4Pjj2lzhQvDNYXwbdX4lNKZ1TAoyLYyrUwmNxh0MXUVU/zGPB0GoY5xIhP52SVufTJrzdzdUuq
	uWky+UPGWfpMyubdETV/c9L+cL7U1/79HY5ABZjga1uNbKmxCJvpv3SPcz+4K1FE1pUb0RRZswg
	NuCvKZbEFBJ0a2KlxEw8egnaBQGF5mnXzI6CUqT+P9961K8AFM4x6Un1ur46QD0uiFQoglkiOJe
	coFc8pfGpeUxpHS46X9IQT+tH2Sh9nnVFv2LHjCUVwiOhEZ8H8hL7cICX7Uz+7d4X5hHIM46J4d
	Tsc88aMahwJBdx7d3jPPWqH/ddAFK8md5JUsEdy1wVonDIVtxjLwnn2fwKgIPpK5STWbb6jmBNC
	437CvSbDlBEt2DbtIZZvDgoZeWfhjZujRYgAzDR/KOCGqKUdLu3/FPL5t5Zjb2IbIHSHiAPbxu
X-Received: by 2002:a17:90b:518e:b0:38e:1497:af5b with SMTP id 98e67ed59e1d1-396d0d2f6d6mr27108885a91.1.1788014940747;
        Sat, 29 Aug 2026 07:49:00 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-398bd57b18asm1540071a91.0.2026.08.29.07.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 07:49:00 -0700 (PDT)
From: Daehyeon Ko <4ncienth@gmail.com>
To: netdev@vger.kernel.org
Cc: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2] ip: skip IPv4 cmsgs for non-IPv4 packets
Date: Sat, 29 Aug 2026 23:48:44 +0900
Message-ID: <20260829144847.1738294-1-4ncienth@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

IPV6_ADDRFORM can convert an IPv6 UDP socket while a native IPv6
packet is still queued for reception. The converted socket then receives
the packet through udp_recvmsg(), which passes it to
ip_cmsg_recv_offset() as if it were IPv4.

This makes the IPv4 ancillary-data code interpret inet6_skb_parm as
inet_skb_parm. In particular, IP_RETOPTS can take the IPv6 lastopt and
nhoff offsets as an IPv4 option length and RR offset. A destination
options header can then make __ip_options_echo() copy more than the
40-byte stack option buffer.

KASAN reported a 152-byte write on 3/3 fresh v6.12.105 boots and 3/3
fresh v7.2 boots. A production-shaped v6.12.105 build instead reached a
hardened-usercopy BUG followed by a fatal-exception panic on 3/3 boots.

Check the network header version before parsing SOL_IP control
messages. skb->protocol is not a reliable discriminator here: IPv4
multicast route cache reports can leave it unset, while software VLAN
processing can change it to ETH_P_8021Q before a TX timestamp is queued.
Both paths still carry an IPv4 network header and valid IP_PKTINFO.

With this change the original trigger returned its payload without a
control message or a target KASAN report. The no-extension and native
IPv6 controls passed, and IP_PKTINFO was preserved for both the
multicast route report and software VLAN TX timestamp paths.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>
---
Changes in v2:
- Use the actual network header version instead of skb->protocol as the
  discriminator.
- Preserve IP_PKTINFO for IPv4 multicast route cache reports and software
  VLAN TX timestamp error-queue skbs.
- Validate both reviewer-reported paths alongside the original trigger and
  controls.
---
 net/ipv4/ip_sockglue.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/ipv4/ip_sockglue.c b/net/ipv4/ip_sockglue.c
index a55ef327ec932c..01d264e8f34ea1 100644
--- a/net/ipv4/ip_sockglue.c
+++ b/net/ipv4/ip_sockglue.c
@@ -174,6 +174,9 @@ void ip_cmsg_recv_offset(struct msghdr *msg, struct sock *sk,
 	if (!flags)
 		return;
 
+	if (unlikely(ip_hdr(skb)->version != IPVERSION))
+		return;
+
 	/* Ordered by supposed usage frequency */
 	if (flags & IP_CMSG_PKTINFO) {
 		ip_cmsg_recv_pktinfo(msg, skb);
-- 
2.54.0
