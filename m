Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CB836B932
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 07:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791617507; cv=none; b=R716f+EDpYNb20lXmluue968UyQL5qZ08abPyx98lcHndczVPbdiMI3h9kA3OEB99KRnIe6fGIl/DRn852HMr9zSqHkDsgMnsJdz3gt1vCyXSWJLkTetYb7OgQT84Xq+89smV6iC7hT1sM8TQ2CGmtXBY0wJ10ogqJwl+LUgitE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791617507; c=relaxed/simple;
	bh=Sk+YEE6RhtCnMSZ9XmdIy9B3iFVIZ/w+u+UC0S5g7bY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NTClahlrKgicU7guNBIyVNHUF9tn7MoIzVhHOavjKShbXIy9j38VLjEks6y4iDtk+9h3nLMaSC/AwdkYOjqbZmHguswxE2/IGQrv6dkiIdKYCWzUpyYgWuTtNL/WgYVAPBLgXtTmq1T2Zsck2QdSzl9PhlULL9G5HQXozq3mXeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f0gBFRxB; arc=none smtp.client-ip=74.125.227.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f0gBFRxB"
Received: by mail-pj2-f5.google.com with SMTP id 98e67ed59e1d1-3a7adbf1b3fso120440a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 00:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791617505; x=1792222305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gt+VmyNWTGnkgPMPZ6xk7DUg2EVMBLgEkZCEB+aUV5s=;
        b=f0gBFRxB88I8d8niA1kvBbiP7PCSDOU+ZxLf3ZJsAhtbvjRodLrKN6AM2GLngncf1g
         PJgR3cONJRgILmKGYWmnaS6dSdgOSxABWZ9N4nfvFPw/5Shimu4OL6KMWLwszBDpCOv4
         u53Y/yqDDitn+Wya6X/mAMxgAK9nAYLYklgyr8H0DwO25p4b0t5ZhBgtUB/+ITnf+cnY
         XK2Lp3hMlcrQSBfad9Wr3JTe5TNRV+PCYAz7JYTOjlUIiYwgKaoDohW//lXK18BRybni
         y6FwUHqdLcreW79q2LWXZPu1GiCC6kHwuZP6H0FoqXMLuSOHKu4QFQA2XmkXZ4dyrbNa
         od4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791617505; x=1792222305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gt+VmyNWTGnkgPMPZ6xk7DUg2EVMBLgEkZCEB+aUV5s=;
        b=Uyp/RZ0Yx7kw71wkzdPlYq5h72HzBM5b798VHF84/LVmSsOh8re8A/+cUftdtpEegT
         WYJvndfV5Qf0RrEhBV7ErMUqJR0v0REzc5stnCH0Hu3v+Trcl4FVrqOTsz9cf6vZw5EL
         RD9v+oW7etPd4Q56ZOf25Z8kZ7++NOhXD1kMOSUSF0zZYbRxEKKtgkHwBV4HvLDbvKm9
         Ae+5fAqmZCgCiVe3oBKIB0nCKcAlVPWlXsI/690WPEgD1NXUNv46qavA5E6vOChduaJr
         8ElCNeE9ZxHIYMh49QgDTaMRlQ3qOlMu1pIyFGc5DBp4gh3OqORo9+VfsME0s7OCsuav
         Nqhg==
X-Forwarded-Encrypted: i=1; AKwUvByrcU3WSUgeOtx7Hx3bs2ZY2KBlt0Hlgs+9yb6qtNQaR9oYqnc0KAXffNJOoc6l5q7HIAM1D+46hoXL7Tc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJVN2FD1VWhIhtjT9DPW5Nzplm/2KVndJdQyX2NIVSpFaUtkbM8
	kwW/ZmprB8SXa7XJ+j9r0PE71yhBAZHxCXRsma4A0+L74nMmpdbEjwfK
X-Gm-Gg: AYBFou0YylX/864nUqDIdbuWFiXDRASLIAiH9A0bBkloe0LDjEN9XfS6Q086MZOWAGW
	OMrn0ea8lEh8tLRB7P1fA0A2uxrdrfom7Pi4mlkH94t4AKmxcZ7BveVntHLnZbJeHQ6ykmHVtn7
	giVU5+DYlmEqX5Bo8cSBhf38gYbxLWMhzT5vM/itNurV+dtoIznMMbSFuKgoq5MQRMJlFBmcqHB
	0t9JUEN6XNBLbDyXzlh7sZHYKqHhWfj7gc6Oo6X58AjdW4SK7TzObOu7nMPVG5U1CRuyU0CU8B8
	jwgcLzFmbpdAtogl7dxw08ZLgmIbagKqVkdLz6rKgAvh7cZL9XbNUUwxRxLykDFnhTjSHZk3B5L
	m4x7QNv7ZmxFOJBcc6c4630MBnQXYEBLrYK4VT8mO1alHTxkw6G70V/rX5ISdjJdiA3QjG1jvu/
	+swqRuQpefuL78Trv3X9HlvfxJFUvYQdckVBgO0lQLbLK4mIW0lO1Wj+r04CsSmSniqDIDq6Ih8
	KfrbdsiGh58qOnu
X-Received: by 2002:a17:90b:52:b0:3aa:f2c4:12e7 with SMTP id 98e67ed59e1d1-3ab3a7474dfmr3614097a91.20.1791617504599;
        Sat, 10 Oct 2026 00:31:44 -0700 (PDT)
Received: from LAPTOP-QJLDGQ2L.localdomain ([112.224.13.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38b9639bsm6795955a91.4.2026.10.10.00.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 00:31:44 -0700 (PDT)
From: Boyan Liu <yymhvert@gmail.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	co+98d7de09cd94fec5@bugs.sh,
	Boyan Liu <yymhvert@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net] udp: Fix out-of-bounds read with unset mac header in unexpected GSO path
Date: Sat, 10 Oct 2026 15:30:15 +0800
Message-ID: <20261010073015.7665-1-yymhvert@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

udp_queue_rcv_skb() and udpv6_queue_rcv_skb() re-segment an
unexpected GSO packet after restoring skb->data to the mac
header with __skb_push(skb, -skb_mac_offset(skb)), assuming
the mac header is valid.

SRv6 End.DT4/End.DT6 VRF decapsulation calls
skb_unset_mac_header(). iptunnel_pull_offloads() can leave an
inner UDP GSO type (SKB_GSO_UDP_L4 or SKB_GSO_FRAGLIST)
behind, so a socket that does not accept that GRO type runs
the unexpected GSO path with mac_header == 0xffff.
skb_mac_offset() then returns a large positive value, which
the unsigned __skb_push() argument turns into a huge length:
skb->data moves far outside the buffer and skb->len is
corrupted, so segmentation reads out of bounds:

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

__skb_gso_segment() resets the mac header to wherever
skb->data points, so the push target only needs to be a valid
header start. Fall back to the network header when the mac
header was never set.

Fixes: cf329aa42b66 ("udp: cope with UDP GRO packet misdirection")
Cc: stable@vger.kernel.org
Reported-by: co+98d7de09cd94fec5@bugs.sh
Signed-off-by: Boyan Liu <yymhvert@gmail.com>
---
 net/ipv4/udp.c | 5 ++++-
 net/ipv6/udp.c | 5 ++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/net/ipv4/udp.c b/net/ipv4/udp.c
index bb8cfc62c..fe5a23f1c 100644
--- a/net/ipv4/udp.c
+++ b/net/ipv4/udp.c
@@ -2441,7 +2441,10 @@ static int udp_queue_rcv_skb(struct sock *sk, struct sk_buff *skb)
 		return udp_queue_rcv_one_skb(sk, skb);
 
 	BUILD_BUG_ON(sizeof(struct udp_skb_cb) > SKB_GSO_CB_OFFSET);
-	__skb_push(skb, -skb_mac_offset(skb));
+	if (skb_mac_header_was_set(skb))
+		__skb_push(skb, -skb_mac_offset(skb));
+	else
+		__skb_push(skb, -skb_network_offset(skb));
 	segs = udp_rcv_segment(sk, skb, true);
 	skb_list_walk_safe(segs, skb, next) {
 		__skb_pull(skb, skb_transport_offset(skb));
diff --git a/net/ipv6/udp.c b/net/ipv6/udp.c
index 93478d1ad..8db4e2869 100644
--- a/net/ipv6/udp.c
+++ b/net/ipv6/udp.c
@@ -895,7 +895,10 @@ static int udpv6_queue_rcv_skb(struct sock *sk, struct sk_buff *skb)
 	if (likely(!udp_unexpected_gso(sk, skb)))
 		return udpv6_queue_rcv_one_skb(sk, skb);
 
-	__skb_push(skb, -skb_mac_offset(skb));
+	if (skb_mac_header_was_set(skb))
+		__skb_push(skb, -skb_mac_offset(skb));
+	else
+		__skb_push(skb, -skb_network_offset(skb));
 	segs = udp_rcv_segment(sk, skb, false);
 	skb_list_walk_safe(segs, skb, next) {
 		__skb_pull(skb, skb_transport_offset(skb));
-- 
2.43.0

