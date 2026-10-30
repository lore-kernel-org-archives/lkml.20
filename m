Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793334119;
	b=mTm82cJK6PiGEa+pW0BprkBHf3YM/U7NWwsq/RP3w7Qb5dsCK1f1OYA0IBRxS0+yWxkb
	 s7JpVGaz17xbt9mA4dNC/yUu0DplLaJ5b8Gfba3VgWzXSI40EhkCiYptDWAKfXUwQtBLN
	 mKRjsVzAHzDXyHlM2CsWwAL9E28m8R+odFxkVHQ+JnmlSE6F99emoK7oFlqJggSbIUehI
	 EGgxCCzzba9ZLN82R6rfYndD4rzLTX+fUTupIQxo1dQ59WTQ8CcW7xAbF0bNJEpJ+yfSg
	 q+icEHXUCsy5IusSa4haNw8/Ef1hPqzrjn55rkEyk98Kkar6w6aGjQ4fdf9cE7S44zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793334119;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uu4+KvWwIV0d7oHG+0bpuFJz50WGRRgzdpZ6XppMrug=;
	b=KtWOPVou/AWZtZmbk+oBJGGo3jJaVo1rGXmOjlj+rvJcoYSqNGn/5I+KAL914GBkYxYp
	 0k7XNN0jiMiwYaI4WGvi173YbXY3n8MKG5z6xo2kupflPftlyglEu00M37S37NzHgfhN6
	 f4VgB2kal72zGYV9xBguHMHD7iS3+a4duxVD5J/HztcB5b+4QPDcmJosGt0z8lyTSkeYx
	 A15uEJJMB9Ciiy6s4TQF/KaJ/uoRlPo6qrpHLyHB5awDKxbiTBhxP+k4aXr9k/20CMHB4
	 z50ilG1z+2C2CHbeDW006eF+e4I4U4zpJPjoTO6mOLz+ekGfkFbjQv3ET1h2zcHMZkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openai.com;
	spf=pass smtp.mailfrom=openai.com;
	dkim=pass header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=UQt10XbB;
	arc=none smtp.remote-ip=209.85.160.53
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08647606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:21:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08647606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=UQt10XbB
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-451a49abd8aso278049fac.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1793334118; x=1793938918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uu4+KvWwIV0d7oHG+0bpuFJz50WGRRgzdpZ6XppMrug=;
        b=UQt10XbBkkvXiGl5Qft/UotQH8UE3kbVRvvtssudQnkCaG9GnY6433nC1ryUbs88XD
         U8nWbPb0vXcjs5jWmQ+K5Iz7gQYZ2eJrm1GRmeXjRzkjoT1doVzYm+Lb1QYaEa59mFby
         LK0jstYeyvXJrZFbBo842W2EzZPw4CA3v1VVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793334118; x=1793938918;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uu4+KvWwIV0d7oHG+0bpuFJz50WGRRgzdpZ6XppMrug=;
        b=xeofckoJyHQkiD11ZIJpdZogaWMyvNSHDRgE2ngr54AsEQVKEHlQbgTXLKSbI9ptJs
         GSFNNj2kEDy9ulBvmdHD9OG4OWS55SEdCiLKxOlhHdRcgv7FUm/Z3VaNYzH4Y5NDq0aO
         ncF5W4N11tPfyjZ93+9PDcaSuuAeQK5fw/MAjbF6tWBiICyMGLke4aLsSdYYBJMsmQRo
         wX+w8qa8CvI7uYDJZfA7JpuiQONI/kXWCZn51M78wrtCioHLqjdAdAoMjnLkxbuJFw8y
         PhRxRbMXMoyFWk3aJWVf4ZQuKealMpmdRBZe6EsNFeNgKxSzFgTiVXzsrAufuHjMF84h
         CeIQ==
X-Forwarded-Encrypted: i=1; AKwUvByn6udMUfuxg50ZSBBBPIlDsUHGOvOUpqAuor0eBEncLsZuhqzr3luNvhY+XjHikS+e6+lZKmSm8+P6Kcc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJokPo0Qsmn+zq8YcReQvBk+EG26N0kNOQBFQqhBpq+R0pH87Da
	Q1pptWvT4tb43i8w5FW3KbKvEdUwOngcuLtMGpJbwZjQZHQZnwTFUVwvaj+F3mjFZz1kQGpHJJV
	w8rQcr4k=
X-Gm-Gg: AYBFou2cAFeig1z0GzNNPCEQlcwkw1Phl1KaY29ukvA3SwA0o5xNX8UHqUolwnEmdXC
	+Oqe1X1z0M5fZGTCSV8DGYAVhend3ckf/iRjehnL3x5479Ar1/vB9xhEbEMetLmmnkFop43WMi+
	cIYbYArvMRLP4Bsg1kEZv+qz9EQJ/MM2kj4gjnYTC9VOrtMcCQA7qXXCFkU56N9avuaBqpF+xiu
	YPIU3whot2NUdgm9JTiRvSUxRLICLsRpRph41xKWfwvb1IdcRX6u05zI683d9RQj2ugKnlP+eNx
	nUlfZzTaIyrKk7NV0TJ02e9V5VMJgA6ZnYNml+VjtWAot5BjC8smlsQo84wophY+Q8gqy1l+vbr
	xlSSSuFuCg9Q91l2wzPgUWKocsWcaFV6QOevGP1D12OCtwbI4j0l0I7nTb+u+DUwjQ6YKVdIESa
	mcD3Nw32eN9/1vrQPLij7/yfFfaKA8WB2LsLMScIBF9iK+ecD9STk0J5SphU21LtNh6hlUSrpX6
	DkMt0RG9wxAw6MqpxzRaAGCvxnKugexEI1g4139c1nfGar6dq1VIIivXJbN6CNd7DJdP6Yrbn7x
	HzDiyjRk12euxWwEW1ig05+a1ABnewNo+fGUsfVpY2vyemtkdACDLXyL/QvAVKzrQHqIln2zOVx
	1BM4AYTgecG8ZgNn0TBLV1woxItyYaA==
X-Received: by 2002:a05:6808:17a3:b0:4ec:4c7e:37b5 with SMTP id 5614622812f47-5640ddb4f38mr841806b6e.29.1793334117847;
        Thu, 29 Oct 2026 21:21:57 -0700 (PDT)
Received: from com-75606.corp.openai.org ([199.47.143.5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fd9888bsm764152b6e.5.2026.10.29.21.21.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 21:21:57 -0700 (PDT)
From: Kyle Zeng <kylebot@openai.com>
To: netfilter-devel@vger.kernel.org
Cc: Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	coreteam@netfilter.org,
	bridge@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	outbounddisclosures@openai.com
Subject: [PATCH] netfilter: br_netfilter: reject unsafe neighbour devices for DNAT
Date: Thu, 29 Oct 2026 21:21:55 -0700
Message-ID: <20261030042155.73844-1-kylebot@openai.com>
X-Mailer: git-send-email 2.55.0
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

The IPv4 and IPv6 bridge prerouting callbacks classify DNAT traffic using
the logical input device saved in skb->dev. The physical input port can
have a different bridge master when prerouting resumes, for example after
an NFQUEUE verdict. Netfilter reassembly can also combine the first
fragment's bridge information with a different fragment's input device.

br_nf_pre_routing_finish_bridge() replaces skb->dev with the port's
current bridge master, but looks up the neighbour using the existing
route. This can put an skb with skb->dev pointing to bridge B on an
unresolved neighbour of bridge A. Deleting B and resolving the neighbour
on A then causes a use-after-free in __dev_queue_xmit().

Before calling the neighbour output method, check that the neighbour
keeps skb->dev alive. A neighbour holds its device, and a VLAN device
also holds its real device, so allow a VLAN whose real device is the
bridge. Release the neighbour and drop the skb on a mismatch.

Doing this in the shared continuation covers both protocol families,
including a queue in the remaining bridge prerouting hooks. Leave the
cached-header path unchanged since it does not enqueue the skb.

Signed-off-by: Kyle Zeng <kylebot@openai.com>
---
I have a reproducer for this issue and can share via DM

 net/bridge/br_netfilter_hooks.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/net/bridge/br_netfilter_hooks.c b/net/bridge/br_netfilter_hooks.c
index e15355ff215a..726a2d17ed3a 100644
--- a/net/bridge/br_netfilter_hooks.c
+++ b/net/bridge/br_netfilter_hooks.c
@@ -307,6 +307,18 @@ int br_nf_pre_routing_finish_bridge(struct net *net, struct sock *sk, struct sk_
 
 			ret = br_handle_frame_finish(net, sk, skb);
 		} else {
+			struct net_device *dev = neigh->dev;
+
+			/* The neighbour queue must keep skb->dev alive. A VLAN
+			 * device also holds a reference to its real device.
+			 */
+			if (is_vlan_dev(dev))
+				dev = vlan_dev_real_dev(dev);
+			if (dev != skb->dev) {
+				neigh_release(neigh);
+				goto free_skb;
+			}
+
 			/* the neighbour function below overwrites the complete
 			 * MAC header, so we save the Ethernet source address and
 			 * protocol number.

base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
-- 
2.56.0
