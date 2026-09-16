Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4642D44C65C
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 19:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789588696; cv=none; b=IkolvzMwW1l2OE6h8IGSDP3Byw6gambzEMtz8DiTE+DY7JXZmbUzSstXQ4isgI81RQFVt5XnANHJjX48JYNItK/Uv2Zf+KggZmZ2nM79P05ITPH+ltriVUMvyJ9xp6b7af5XJLlXdiN8i65MrRepXzsVLhBOqLw9Wfl9U34zFAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789588696; c=relaxed/simple;
	bh=Ki7NN7Qmcie26yOmnohF6eP+Nmz0kYw/zHwlVnpOmbU=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:Cc:To; b=G/ONE3iNCWPqUH8ZXe7Q6odEPV9TfaRpp2m12cJEt/dWkYz1R1WnD7xexvUXFrkNKnvGIKvkyfMCkY8zwblScWGhxto3JI7TsvO5Hu0PuuEjNWYZdfZy4u5zxCcstZbZ9FJeBbQkRlkX8ehi/6CoikmONFy9DYMePfYJSXkOUwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=doyensec.com; spf=pass smtp.mailfrom=doyensec.com; dkim=pass (2048-bit key) header.d=doyensec.com header.i=@doyensec.com header.b=kVzttXvJ; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=doyensec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=doyensec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=doyensec.com header.i=@doyensec.com header.b="kVzttXvJ"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c2940ef15d3so18324066b.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=doyensec.com; s=google; t=1789588686; x=1790193486; darn=vger.kernel.org;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:content-type:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7j92NLv1vusg4NTs4kzoe1mqEKCmRFXV8Wht2u0ae/g=;
        b=kVzttXvJjLKXqDrqgsf52QoNNZsNfquaHKE/bISNe+buK6nRZ7W/leqhHLraLz3E14
         2B/c/9mamrGJAbroVUYBL6ae6Km7df0bw3tcUNComJBgsADCL8FfDC9J+SEQcem5I7PW
         cY/6Zhx/n9pDHlzReVNI6l+X7nEZt76aF6to0kTjsUJP8vZtldOOuIdwXDVOO6JpKIwW
         KH1xDuffqTGGvgHldq96m6og43HEiY4PA94Gq+skXAHlqUpx4L7/ELtXO5ZW9D+KQKQY
         STJKKg2/zlmGgHpTRtyvMzM5rDOsSz8Wld5e8xKF1VWf2tpr0qgqYEWZV7xLLr4azKAp
         eKNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789588686; x=1790193486;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:content-type:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7j92NLv1vusg4NTs4kzoe1mqEKCmRFXV8Wht2u0ae/g=;
        b=sfHLiAkYE1llzIlnBWzKI5lMNBONFpuTt6zg6m71ZkhT/vmiEptNnX48ELZym79KvL
         Oylof8qLzcyO6GWRemfA1L/O4TOoblxTzG+uVF+Kmpgfl66HlmeDS7r+0QufDByEJwzh
         LOgQFqVoq9PIImEBeHrJnLEqUITApOloSnTxsEHuK3pij2OQ2RfoksgAPudv5ZcKbp82
         arlu3bsjsl7vwOfD9I2NdIOBfB+FIHQ9qx5UFOR9o/p48IMQNx0dgPPdbDCrWamSSjPC
         YVu+NhjtJQ9OqjGTNfKqMdHMw6HnCRShjLv3COGaTF8CjoVKRy0zO+kyRIUtog0rfr4b
         oaMg==
X-Forwarded-Encrypted: i=1; AKwUvBwp2P77ANelc20SnvgG9AZWhWgvBOnXWU2FYvet6HgZ6fOb33hapw7IZQTKUvE1C7jyxSGEfHvzv4j8+QM=@vger.kernel.org
X-Gm-Message-State: AFuF++kUlYR6chvbNVdEnX/rz0mZSpATlzoRwsl83JhWjzOZ3RTi0JGn
	QiBMiUvzwX8n3GWecPIWlykUbmDJG8rtdoa7hgfFO/fXP7aJZaKo2aF/0YlvGOoCOkU=
X-Gm-Gg: AYBFou3YjGodoEbfOTjOfv4u2/4OyGI/RDWjtcQN5kHb7D9BRDCQID5VLLm1pyvPF1D
	Ebgx3AnrVnI5ZzYOgLK7PFzbwZgoCnnlIUed+fY3fHydOI//c28NUJWZjOD8MbfQXwW99bAPJ4W
	frOz5zPQ8N5RccjF8Sd0EevdskljhUb0v/RP5yvLwd45jE3/iEEkpVB7PSoV5VWyOETrZWfbmPZ
	kg/w6h4njT4wSpEFY9za7WFfCcHi414UOTiFp2E7aeC6I+Ruw16YSoU7LJz/4xmor/GTuU9/uIL
	niv09Uo/jROKXuI4trZH0m6nOuMhW1tiNXRTjZbv2lQVgzw5BVJQjYEQ+QyTIhd+ocUO7NhKeVe
	l/2kqwxRa5kDxVaw6MpnUcDbiITIXppp4Rxjl1hrhJnI4x0I0Q4nTe6t1T6b5tjQOm7o/ZeXGY9
	SffuueZIfdjEwnZ4FgM4PJPLmedEVDc1RAZpvFk9Hrizr5OhyqBW9B0qHJbEUXdHwTUlMM9RA7m
	oqlD8gr/dAM49A/wfTDYrUW61cKxslcZXFa07fzJy1vqcKRnsCy4IfLuaH+aHBx8EkT
X-Received: by 2002:a17:907:1c29:b0:c25:fdbc:52df with SMTP id a640c23a62f3a-c29e5244c19mr402266066b.10.1789588686107;
        Wed, 16 Sep 2026 12:58:06 -0700 (PDT)
Received: from smtpclient.apple (83.10.8.214.ipv4.supernova.orange.pl. [83.10.8.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de5e4ca9sm178474666b.42.2026.09.16.12.58.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Sep 2026 12:58:05 -0700 (PDT)
From: Norbert Szetei <norbert@doyensec.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.1\))
Subject: [PATCH net v2] ipv6: do not let ipv6_find_hdr() return an offset past
 the packet end
Message-Id: <8F80BA1A-DDFD-432D-9075-242A3435FEB5@doyensec.com>
Date: Wed, 16 Sep 2026 21:57:53 +0200
Cc: David Ahern <dsahern@kernel.org>,
 Ido Schimmel <idosch@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>,
 Ilya Maximets <i.maximets@ovn.org>,
 Aaron Conole <aconole@redhat.com>,
 Eelco Chaudron <echaudro@redhat.com>,
 dev@openvswitch.org,
 linux-kernel@vger.kernel.org
To: netdev@vger.kernel.org
X-Mailer: Apple Mail (2.3864.700.51.1.1)

ipv6_find_hdr() walks the extension header chain, skipping each header =
by
the length that header itself declares.  ipv6_optlen() returns up to =
2048,
and the skip is never checked against skb->len, so the offset stored in
*offset can point past the end of the packet.

openvswitch installs that offset as the transport header, and
update_ipv6_checksum() then reads and writes the transport checksum =
field
out of bounds:

  BUG: KASAN: slab-use-after-free in =
inet_proto_csum_replace16+0x445/0x470
  Read of size 2 at addr ffff88810b754b06 by task ovs_ipv6_oob/629
  CPU: 4 UID: 1000 PID: 629 Comm: ovs_ipv6_oob Tainted: G N 7.3.0-rc3+ =
#348
  Call Trace:
   inet_proto_csum_replace16+0x445/0x470
   set_ipv6_addr+0x3dd/0x460
   do_execute_actions+0x6a3d/0x7c40
   ovs_execute_actions+0xfd/0x480
   ovs_packet_cmd_execute+0xc38/0xf20
   genl_rcv_msg+0x59e/0x870
   netlink_rcv_skb+0x18b/0x450
   genl_rcv+0x2d/0x40
   netlink_unicast+0x6bc/0xa20

  The buggy address belongs to the object at ffff88810b754980
   which belongs to the cache skbuff_small_head of size 704
  The buggy address is located 390 bytes inside of
   freed 704-byte region [ffff88810b754980, ffff88810b754c40)

Other callers use that offset too, so bound it here rather than in one
caller.

Reject a header whose declared length does not fit in the packet.
ipv6_find_hdr() already fails with -EBADMSG on a malformed chain, so =
this
adds no new failure mode.

Fixes: f8f626754ebe ("ipv6: Move ipv6_find_hdr() out of Netfilter =
code.")
Suggested-by: Ilya Maximets <i.maximets@ovn.org>
Suggested-by: Eric Dumazet <edumazet@google.com>
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Norbert Szetei <norbert@doyensec.com>
---
v2:
  - fix ipv6_find_hdr() instead of the openvswitch caller, per the =
review
    of v1
  - dropped the openvswitch change
  - retitled
v1: =
https://lore.kernel.org/netdev/114FAFBD-F7BC-46AE-AF9F-0D15124F130E@doyens=
ec.com/

Reproducer available on request.

 net/ipv6/exthdrs_core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/ipv6/exthdrs_core.c b/net/ipv6/exthdrs_core.c
index 9d06d487e8b1..4a9748338cf4 100644
--- a/net/ipv6/exthdrs_core.c
+++ b/net/ipv6/exthdrs_core.c
@@ -278,6 +278,9 @@ int ipv6_find_hdr(const struct sk_buff *skb, =
unsigned int *offset,
 			hdrlen =3D ipv6_optlen(hp);
=20
 		if (!found) {
+			if (skb->len - start < hdrlen)
+				return -EBADMSG;
+
 			nexthdr =3D hp->nexthdr;
 			start +=3D hdrlen;
 		}
--=20
2.55.0

