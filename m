Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC7B5304BD
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790169689; cv=none; b=aIT5yO6TuWE+Kqn4pfU+taQKTM1JooVv2a0xXlKPPhse2lTSyvyGJEZ2sEmKGt6MxrQolua8yiSobz2xebTmAH66c9bvdQyEsC4UHGMPg9qz0B13mNnPkciQ3KVnv2svyvg2zJ32vlwL15BDpzuzs8m0mYKKYdKvmb0tygQh7JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790169689; c=relaxed/simple;
	bh=ZscYP5Jl3CYCN/ODi1n/KGM8DsiFKAZ7pnQCj8a7dXE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ft4K4K9DCS7uN7CLtHiCe00uo9hTw7RGbvL2OjTLsiverMbM806Ad++T/pLJPyOZYGchOvRSkaAcG7MO/LUhRT66cqb7tJSwv/S43wWW8cVT5hHTRM+U/fLw53T4z2Q4xqaBKqV/iqhH08SFfXLvcWU+OMkjTBYE5VPYs/Z2PD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lqs.me; spf=pass smtp.mailfrom=lqs.me; dkim=pass (1024-bit key) header.d=lqs.me header.i=@lqs.me header.b=HJEKMGXd; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lqs.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lqs.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lqs.me header.i=@lqs.me header.b="HJEKMGXd"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4aa0f1a94so425803a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lqs.me; s=google; t=1790169671; x=1790774471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jA9Ng4lpuxB+WAdNDY2KHfY2L2MitKxI8+kcR8oAY7U=;
        b=HJEKMGXdCqAzHQOMMdPpBextvolzjgk0EvkuzYlXdCWZH14ptuB3hMv4p2D/XphTSi
         Atts5wUtGMKxUUUowlc5YIq0zIqmnDXROeEGnKDzNJwwJNIc7HRNvvaFMzldalamni26
         4QT+rgAe8mMLT+DMs54EM0b70WNKRdWpPCzIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790169671; x=1790774471;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jA9Ng4lpuxB+WAdNDY2KHfY2L2MitKxI8+kcR8oAY7U=;
        b=I+lUzacOisFlBQv3cCKD/0nSrAksKjpYkeHXNTQ/phyUGe9/PbKNFpqbE1QJDea6dT
         gt24mkHeEpUBHVR/1aAUxppHqBMCJZetGyjX8OwfLVFmNbdfrS7KjjlGon3LufEnVzuR
         jaCiTED9BGiZLckNEKug3bLVINAHOtxnEKfgQfpbeAfm3NUkzELnziat/iW0SgtBNo2d
         Tqeuo2Brt7pnB1dX7UV9BDpplpbAbtPvRyyeAdkk/d60VD5K/FOuQTbGXxaasAh4pCuu
         V8AVx04UCBGbvObtgyVgUCPfVpfOYRUIkO00uo3tMNIkHh3TDfQdw4FBJeUfv5Ho+0VW
         5W2Q==
X-Forwarded-Encrypted: i=1; AKwUvBwlhjj3nCwpwK+QavwINpz87YacNK/OnFdX6d4ix0cDC8USjsq4zvloUPZAx7TxHldlnaYVmey8p7kM0q0=@vger.kernel.org
X-Gm-Message-State: AFuF++kgP+YRLLx0BmipO27pQTk2JWCF3alAQI3pt/wXeA+c7rCbbiP/
	Kt1J7IKVNpE7ZizrUb3PslU7ogsp7oUrlG7QS8O2T0qdjA+DpMrZORYZj8l1QBJ54uo=
X-Gm-Gg: AYBFou2N3SUC94hOKeJOX2G0248UsRpVdWltZDw2djcHA7HqtadB/LNqgUpv+oDIwBW
	3OwU6sUn2/b/Mm1yW8UsdgnhLatAF306mx3g2z9Suhe5Vao8t1K64Xzbo1Z97c7NCkStWKyobxw
	nYciJvdAVsBN0hjE0X8ekCO++2AUAZtypkG6h6srkZVZosuPqPVXo7qhu3PesVqJE52nV23xrUd
	/7b7e7BroYhKen6N5OJ3QGeEC3F684U03iTUQCVOyCF+tpKC++OdiQRy4/qlJlqOZ0WxcaSYZxM
	1BlP7uqFHXugkcUrOh71Pqk5ylOyT1S4WgNnHiJxWbW5ohb6eXaacsB3jJ9vMA4rx5nNV6pHpLv
	GElefi+Dz/nDBZnV2dlJ8wnlbKQZ4k5MDYQOtFOFgv9PJR9FoBV9+3bWW7w6qLS9e6vOmFtwiCy
	DFKlH3kmpAndTw1dX/RtPFy9gWyHnDs3UScBqTUnvNC+tElKA147kqxwgPhGCdaIwBi7GOJlRxK
	525XvZylXmYDsmMOojtwFbVe5WeAp4e/1i0BAWykgr1TKG3
X-Received: by 2002:a05:6a20:7290:b0:3c4:4272:b400 with SMTP id adf61e73a8af0-3ddf7e7f980mr2531871637.18.1790169669529;
        Wed, 23 Sep 2026 06:21:09 -0700 (PDT)
Received: from localhost (59x87x240x206.ap59.ftth.ucom.ne.jp. [59.87.240.206])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc75f3ba829sm1081450a12.11.2026.09.23.06.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 06:21:08 -0700 (PDT)
From: Qishuai Liu <lqs@lqs.me>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
	idosch@nvidia.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	Qishuai Liu <lqs@lqs.me>
Subject: [PATCH net] ipv6: fix prefix route expiry in modify_prefix_route()
Date: Wed, 23 Sep 2026 13:20:48 +0000
Message-ID: <20260923132048.3272878-1-lqs@lqs.me>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

modify_prefix_route() is given the lifetime in clock_t relative to now,
but fib6_set_expires() wants an absolute jiffies value. So when a
permanent address is changed to a finite valid_lft, the prefix route
ends up already expired and GC removes it.

Steps to reproduce:

  ip link add dummy9 type dummy
  ip link set dummy9 up
  ip -6 addr add 2001:db8:9::1/64 dev dummy9
  ip -6 addr change 2001:db8:9::1/64 dev dummy9 valid_lft 3600 preferred_lft 3600
  ip -6 route show dev dummy9    # expires is negative

Fixes: 8308f3ff1753 ("net/ipv6: Add support for specifying metric of connected routes")
Signed-off-by: Qishuai Liu <lqs@lqs.me>
---
 net/ipv6/addrconf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ipv6/addrconf.c b/net/ipv6/addrconf.c
index 9d89be7e0544..c90ee6dd7446 100644
--- a/net/ipv6/addrconf.c
+++ b/net/ipv6/addrconf.c
@@ -4874,7 +4874,7 @@ static int modify_prefix_route(struct net *net, struct inet6_ifaddr *ifp,
 			fib6_clean_expires(f6i);
 			fib6_may_remove_gc_list(net, f6i);
 		} else {
-			fib6_set_expires(f6i, expires);
+			fib6_set_expires(f6i, jiffies + clock_t_to_jiffies(expires));
 			fib6_add_gc_list(f6i);
 		}
 
-- 
2.43.0

