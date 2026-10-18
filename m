Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06494A2A69
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 12:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792328348; cv=none; b=OD80PSluosj/p+astxdRXJLbKNnhcpijQNNUWDiipTd8w4ho4FVl3fx2YvNyLpOz/2sgV/3O2cxfkhQlm2nLDZ2PxqTSfeIriYCY+R3JyBRtDXCCkPyJl3wW97UeC3Uho4szAjnOjQALvdqyPbSDadwFSkY105fetY8lPOwV57Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792328348; c=relaxed/simple;
	bh=nWS0ydmrO4FpPtgExlGrGBKn4Swl2QUnK8Q7wPcpPf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qlBYnIDck9OVLM3yCmIjJ9DmR2+wmr3Z6bY/EhPi/Xk4OncVhOwWFseUey9cXZXXk80vgeqU9gBp+UI0HojU3qkXc//vkL6c4d+X+w8Afs9xfRuxWwZYMlt6uK8JaQeHq3qLdqq9E3W5V6amIgLoF92xlaGHh+veqmYIG6V6ang=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=fVnKhipI; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="fVnKhipI"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c2dc63f8d8aso199488066b.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 05:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792328345; x=1792933145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mzu8LVWuEVBDU9lAlwBSEvZPtderP+BauzcapsS8E9A=;
        b=fVnKhipIoGeId8TdF/Z6g9LI43UOZLwMbalZnC2C5aG/YYEbIGh/OoW5TGfVM9aHl5
         aNX+qUaUErc59ux32N7PzWd5sSjEXFgZycNjt14U9mgPAmETpS4x+rVanzLy4cj4kzMo
         aDmPaOjOwACVCzxpuUNigJPckCWAsdHPPKdE3Ei1dHE54SLNQgrJ5eIZidz0E33FEH2X
         c1Fu2Q5RshvxipWebxzlTPBMcXxMXk/vSERK1RLSzefkri/1/tBZHQoaKSot8E52LqiF
         5OsSjZIbH/npaPFcdsgQWr4Yce2TsS+UtqJl8OAZ2z710HIcq4SmdS9WiHnZEImdatj3
         48Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792328345; x=1792933145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mzu8LVWuEVBDU9lAlwBSEvZPtderP+BauzcapsS8E9A=;
        b=JrENvDIEHD/I6ISQewPlvASUairyGup6PpTraDhJjfay1wFeelSaU6AZKi1tHbRjwl
         mUAbAuJduP5Qu1Q/mrjB3AZ52HnuoIcYf+DdLQGrlltdwOnZuUFOWaSB3fTKCMLuN2Hw
         NG4JHYgB5UboZZfVmMDBVOBb7R+dWW/XH7RrDh7inlCKqNuZ2cPBmhz0oJRU3Rr71oCS
         SQn0o/G/KfPEKMWHRSXc5VBu0kfuiyHNykx6b6rZJM7tahL4qqnA7kywrsin/asJHUSW
         TZtojZnVhbM0ZPZwxw8lcyYjLQ4qfOqcsTJtkrJd5opEl22p5xkfPB6X1Xe4Ds8FLdEp
         bSGw==
X-Forwarded-Encrypted: i=1; AKwUvBxb5WLST7fuBPaYa9JUrRVgsW7zMOfwcdBpDY+VNpBo4v1o+xA4U+NcykP73x7XIahZk+kjMPOpmf3KYCE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJsUUpT1G141CDNsYb8ykgdRFZFFS+qoXEvOkNKqootbaGBpVC
	aPbUyXtqn50on8dQsMm1I+FvPLIfuw1HHVNrmzrUNS9E1fkT7+vDRHuctrRoxAwKxQ==
X-Gm-Gg: AYBFou3E1EC28nSTbTB62Zn/16XhrZ2Iqpu0gdDSuFSBiHVG7uXdfFQaubLwbAv+hR9
	Rbp8Edtr5AsFMK0RAZTaBMVh6Y+sF0Q8Sa77K2KOQLQ5ex2Eh4RFP71fF3Rf+r8g/EJ10ip0bwP
	AcbkpSvK9tM4x2TzPpnfGJwGwNM9grw6g5gbxLwPlMGWvWQelCpjEFA/GIwqR2RYunzHxLWTd8Y
	L2M0DEIse0Tvqm0GoqFTsYWZ25NUvhsSyHApo/sZKc1XSzjIF9ijQHl5EjAHMGJkhSANLnnl/W6
	kRdgLZ4uMdc1PkUVyNCrIG3paen7HRAibRkeeoCtLuB59YBPUDHGOQwOqxt+2XZ7g9znluNcR2h
	0whRMAHkNJGjiEldWnTbVX3CjgcZ4ghS/SQderd11kS2s4768bPHzEoHeR2ExeBG3o5aUi0V2WV
	cYZgt0YMfD0+yU6jgeMuLzHHoA+eSRzQTberqjyDrcUdr6wv+MTSg0z7NP+KdakV6N48sDAwFhe
	boRneeLO5VmVjvazLNK1BF4JcNu0NDn1fiCs6EEgADt+72etBS6BiX7U3f/cIFQuzfcflDAxN01
	9DovDNg/M+lLBHu85HEWwSUY3zEwucrZHAzRcv+ZRJ8dxiyJ+/e4osZLsCxrhpRuOajSxtcYZ+7
	Ax6AGxGOABc1dDkjbgtiW7tpNkxWX1h6Xy8O1qt/8VnASbNT16E+kPqXxeGB/ot4LsuvBXitkiv
	tBonyD2B37
X-Received: by 2002:a17:907:3d50:b0:c2d:ca32:2176 with SMTP id a640c23a62f3a-c419d540bd9mr324041566b.8.1792328344943;
        Sun, 18 Oct 2026 05:59:04 -0700 (PDT)
Received: from Desktop.fritz.box ([185.181.130.213])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912ce05csm259032066b.33.2026.10.18.05.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 05:59:04 -0700 (PDT)
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
	jiayuan.chen@linux.dev,
	mfleming@cloudflare.com,
	almasrymina@google.com,
	bigeasy@linutronix.de,
	richardbgobert@gmail.com,
	ecree.xilinx@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3 4/4] ipmr: do not drop GSO packets that fit the MTU after segmentation
Date: Sun, 18 Oct 2026 14:58:54 +0200
Message-ID: <ba6744246a54f77d4ff5acd72a0f1a1ee695bdad.1792327155.git.julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1792293419.git.julius@bairaktaris.de>
References: <cover.1792293419.git.julius@bairaktaris.de>
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
skb_gso_validate_network_len(). Do the same for multicast routing,
leaving room for the outer header on tunnel vifs. ip6mr has no such
check and leaves GSO packets to ip6_output().

On an IPQ8074 router with fraglist GRO on, a 10 Mbit/s stream of
1316-byte DF datagrams routed by igmpproxy loses 14.5 to 15.5% (n=3)
and 0% with this change.

Fixes: 9fd1ff5d2ac7 ("udp: Support UDP fraglist GRO/GSO.")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 net/ipv4/ipmr.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/net/ipv4/ipmr.c b/net/ipv4/ipmr.c
index 6f2eb571f30f7..0a2c573ceeb79 100644
--- a/net/ipv4/ipmr.c
+++ b/net/ipv4/ipmr.c
@@ -1914,6 +1914,7 @@ static int ipmr_prepare_xmit(struct net *net, struct mr_table *mrt,
 	struct rtable *rt;
 	struct flowi4 fl4;
 	int    encap = 0;
+	unsigned int mtu;
 
 	vif_dev = vif_dev_read(vif);
 	if (!vif_dev)
@@ -1946,7 +1947,10 @@ static int ipmr_prepare_xmit(struct net *net, struct mr_table *mrt,
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

