Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5903C37AF
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 16:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791130347; cv=none; b=VSiAKiaU+Qj/ZbiGIjLvfL6xa69wrrsU7o/cQEW+BJ/cP68oK2fYAOf2K/00+MmO8wAN+N7sNrTHi1Y0ku4upG1N/pdjQemoDj7GYgfpTv0v+jnACSn0NLdPsxWVKZ8E8Of4P4BZRN1bjrGr8YUvnPk85V/C3WiOwB+6zkdtGm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791130347; c=relaxed/simple;
	bh=cygj9XrML4i1wJQ8hHaGD+G5g+hpr9bOnAluhNYTSDA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mKOstL10CksRt5GomtyKuGRbc9E+eLHLokBZtuDYRFjG4jJvubHBxvJQqVGnjGUXfIfJMxa47GAPpE8Mv64A3VZAnwHbHwKDu7mNTZs+eaEkEbCS0n85iRBh9s2ZO60YkB8uVPlOiFgvhgYtjEs5UJaW3hnsOJR0WdJQYbG/lcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net; spf=pass smtp.mailfrom=blockcast.net; dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b=eh4qp+TF; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b="eh4qp+TF"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48b08452cafso677521f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 09:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1791130344; x=1791735144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0IQefR0ITJSQZvvgSeBhwGRR05na9J9C3XNmDgSGtQA=;
        b=eh4qp+TFOKpPkQo9I20hLQA++A85KCA+XcbXBxi21mt6k33ZMEKwcC5h9/IiikwFXL
         I3GJ0zgmHCsIaL+ifdjwL2fj8dJHuPeidzqGbvezXqppQs2iJleaw7WOOc1IrQL6iP/e
         hWW58vOqivsdc6ACIyLIjTNAVfjEMYZF9Zx1nwdAzDXy0YR3KF3JKSFs0PUJpt2Szo1/
         eIBl5lwV15t62DTLrE0fLmDzJ5fFJwBCPXxAd9W8TF2EU19v2CeKASCLNUBtjjb/Swu0
         TsvFr+tQLlTvbsSTyUGq6VXASV/UaRX8geyxkauZyb5TCz43xQMkLJILJJ2RNe5Ud5LR
         R9kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791130344; x=1791735144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0IQefR0ITJSQZvvgSeBhwGRR05na9J9C3XNmDgSGtQA=;
        b=GEJqENodfSe9TNLE0Ug9Fy275zYT8Nm2E6xijhnDPYhi8VztT8Z+zh8tgfsFIkWXy9
         jcXDTx+NtbFStNtrpeFd7lGt3jJ7R5OPQZylDoeBGCGLMQvBgZyhda1XgXu/eegYUben
         SO3g580f/oJr3GkDwlOajLtJAK7PGfD7AgoYXKosqbRz+xoOFVDKKZpswkSLt9FwuYlU
         3zqB4G6bzxcM/AmDH6Pyw3WSIdVjuDyisAei5aDlHwfQL1jzhWLcg5D8iebWYJx3cZuV
         7XeRVWN7m9PKGXxYx4Ts5DuaSA6d832W9gM65MrFkz8HEUEX+R7dHN+o7oskATtn5JZy
         vyFQ==
X-Forwarded-Encrypted: i=1; AKwUvBxqW+uE+uynUfzW7QP74Mbnl/0ZBDTpufUvvvchUSzyl0O/SEAEjfOiT4UeHKg/+R61wGY+IM2Uflr6wNk=@vger.kernel.org
X-Gm-Message-State: AFuF++nPHkPxMUVbB9vIDSjfdsnqAMEleD4P3t+AjwLqUasTW7CFVDcB
	MXJUv2Lr8rV3S40OU/7IXyv1xEzZRGVMt3XQSYFoUts1D5TT+iCKUnNnzSvYpYcs3ns=
X-Gm-Gg: AYBFou0kE31LI1bLBYhzApHSF0QmMDtyXWqWpQOyeoznfeoz+U2J7R27PTeUvZyrR03
	TXx9QfyDP0DPiufN36vBbILfQGkUgXqfcYySqyvIb+c2mJvUy03zKisSyNWI4J5OjH5E8++ei0K
	8nCoHe/uxX52sLXhRF8VEJ1S3odeyEKuU4wCz1VkVJRoX29h99GDSrefZYEJzXdTfNuiydVD1UW
	d0yTAwAWnk+g+i2sSv850p6wY61hzrk2GNOZq2s6GxnbQ4PJyjbSwo6P4gW+j/3p2mxeARo+XhY
	EnvvjvFge1WYu3mOEShMDgUnyn5ZoXi2xijgYTJoGP4Uf4EBpOrq4AUrQAuA8Pjoqx76UZw0lg8
	Imx8FTteQ7Qo52qzwXI1jNAObN2nM8NyPqZI/gQR6K9ZM67MAaf8sFtJlOIb1s1RkU8yx55OfmY
	jGfpIA97VgRwcFJey/58lyJmv8DV9ZMQZnncYP8X0whIibZcblVcRIo0PEBJnmkGPA4TFXdf/O/
	YqQGZ9vRsDlIfZUZkzEsJ7+FSxAhcfwBlfWD9pPv3cSOCB55FTbCD2VDDHISglhJBQhQhpXpMdz
X-Received: by 2002:a05:600c:6092:b0:4a0:20c7:6d4c with SMTP id 5b1f17b1804b1-4a027452eb0mr134814135e9.0.1791130343733;
        Sun, 04 Oct 2026 09:12:23 -0700 (PDT)
Received: from localhost.localdomain ([197.51.72.2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a02854073csm244512275e9.3.2026.10.04.09.12.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 04 Oct 2026 09:12:22 -0700 (PDT)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Eric Dumazet <edumazet@kernel.org>
Subject: [PATCH net-next v3 1/2] amt: mark relay data as a UDP tunnel packet before sending it
Date: Sun,  4 Oct 2026 19:11:59 +0300
Message-ID: <20261004161200.27196-2-omar@blockcast.net>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261004161200.27196-1-omar@blockcast.net>
References: <20261004161200.27196-1-omar@blockcast.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

amt_send_multicast_data() encapsulates the multicast packet in
AMT + UDP + IP headers, but unlike other UDP tunnels it never calls
udp_tunnel_handle_offloads().

If tx checksum offload is enabled on the amt device (off by default),
GSO packets (e.g. from a UDP_SEGMENT sender) reach amt_dev_xmit()
unsegmented. They are then sent with neither skb->encapsulation nor
SKB_GSO_UDP_TUNNEL_CSUM set, and the lower device drops them:
__udp_gso_segment() fails because csum_start does not match the
(outer) transport header.

Call udp_tunnel_handle_offloads(skb, true), as other UDP tunnels do.
udp_csum is true because udp_tunnel_xmit_skb() is called with
nocheck == false.

Also reset the mac header of the copy before recording the inner
headers. amt_dev_xmit() pulled the Ethernet header without moving
mac_header, so inner_mac_header would point 14 bytes before the
inner IP header. That makes tnl_hlen negative in
__skb_udp_tunnel_segment().

Suggested-by: Eric Dumazet <edumazet@kernel.org>
Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---

Notes (v3):
    Found by an LLM-assisted review of drivers/net/amt.c. Reproduced with
    the selftest in patch 2 (x86_64 KVM guest, CONFIG_DEBUG_NET=y), tx
    offload on, UDP_SEGMENT bursts of 8 x 1200 + 100 bytes, IPv4 and IPv6
    inner traffic, 40 runs per kernel on net-next eb0c18404c89 and 20 with
    this version of the selftest on 071876fd5048:
    
     - before: 0 of 900 datagrams delivered and tx_dropped +100 on the
       relay's egress device, in every case
     - after: 900 of 900 delivered, no drops and no UDP checksum errors at
       the gateway, in every case
     - with only the skb_reset_mac_header() call removed (two runs, an
       earlier version of the selftest), the packets are still dropped and
       DEBUG_NET warns in skb_udp_tunnel_segment()
     - tx offload off, and non-GSO datagrams with it on, work before and
       after; amt.sh passes with the patch
    
    Not tested here: hardware UDP tunnel segmentation offload, hardware
    checksumming of a non-GSO CHECKSUM_PARTIAL packet (it now leaves amt
    with skb->encapsulation set, as with other UDP tunnels; the selftest's
    egress device has tx offload off), a forwarded GRO packet as the GSO
    source, KASAN (the netdev CI's debug kernel ran v1), sparse, udp_csum ==
    false, and amt.sh on the unpatched kernel.

 drivers/net/amt.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index 0277e4c..a8236d4 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -1078,7 +1078,17 @@ static void amt_send_multicast_data(struct amt_dev *amt,
 	if (!skb)
 		return;
 
+	/* amt_dev_xmit() pulled the Ethernet header without moving the mac
+	 * header. The tunnelled payload has no link-layer header, so the
+	 * inner mac header must coincide with the inner IP header.
+	 */
+	skb_reset_mac_header(skb);
 	skb_reset_inner_headers(skb);
+	if (udp_tunnel_handle_offloads(skb, true)) {
+		kfree_skb(skb);
+		return;
+	}
+
 	memset(&fl4, 0, sizeof(struct flowi4));
 	fl4.flowi4_oif         = amt->stream_dev->ifindex;
 	fl4.daddr              = tunnel->ip4;
-- 
2.50.1 (Apple Git-155)

