Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801CF499F2F
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 22:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792102027; cv=none; b=QeNTmB5bywcyG2iUoWxQj30GugtwnZqNjDqOnBAnjSVzlSFpRw7T3BKkb284H+XeD1xlLhJ9Zjam+SZ/TzHyZleGu5sh4wP4XDPo/IAdROQ7C7eEpXg7su8G54Ps7RTxY58J3+8VO1sRbvfk3kHwFuFEVxDZs3sp1yVzrRhPVe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792102027; c=relaxed/simple;
	bh=0TLXT0OQaGddhmq4Gd3x446wYMRH9OmcF0gTIv1Vmk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EknKeIzQbcoPBFgv/Dt6P8jL/vo0Lq1vomFNifyBvX9sh89rRqtgJi3iHUscJuqxnQSLyX/33ZWERgby9mYtsgm7qn1c9f9oVo4NEsXhRSTX7Vrr/GhJa2h1ch8/lcOirg1WllSRr69+5M/3EkDpgveXf9x8o3kQeXYVhR2ikU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net; spf=pass smtp.mailfrom=blockcast.net; dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b=ZwkfPD34; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b="ZwkfPD34"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-354ba08cfd1so9644409eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1792102020; x=1792706820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yH525jot8RHAGlZ1Vpz4ynWXS0sEFIDidEzQ+hLZKbM=;
        b=ZwkfPD346vkZ5WRHGaUeVjHus6L50fYMq30aPPyHQRMVXMoRqJ1re66Ps3BZTx6Gpw
         8yr76UhcdQLR3Pgi8FqMzbKB20DtBS7FEH/d1rPFNUh60wAxLJdIRlVXwQQvpBCb1rP3
         2FIPrlu/W7Ewc0Lfe3TjNB/9jr/8tTqhvk6KkBHLT2KlU9HG6RloTDdGXgi597LWzwks
         RCD+wCHrHDZ7pTPTq5qDIQquNyTLxARGHegaiW94fLeZzHFRytLb/VLCrYQQAru+bv95
         NjlGIlIlNP2hdzFh97db+0aKAYHDK5eE1oJo+fmukftVnMNyQ4uiXqEZIb7Pw5GNIQRG
         Glhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792102020; x=1792706820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yH525jot8RHAGlZ1Vpz4ynWXS0sEFIDidEzQ+hLZKbM=;
        b=e+vcl0hat60qA4mk+ibscPQXoX9tXqUpYcCj+4eH4GFVb9hYAbO30KIIAaDAiUp1HU
         0hSS7PpID8Vde2XSqwJlV7EnHBxwdR4swaSJSRzFtqcRUEsFDapYaSPVtYfbrXUODeu6
         t6XygFpcBcIwB9+T8Gnv+FoLuMR8S4031DdLwM8tflYzUIEBmH1xmkV8SgY+xh7c3Tvx
         5KJZzNgT2/Kh+7h4NsRK4sTYFlJCLsnx4jVNQJBfBh6oAvON7j0/++z3z69tHBTaG59Q
         c5123fgM1MvewIOPtpDIVdTVTRk6s5Ouql8o/KCDXLOc9SV7vQcY3TRumDG2tTQxgbpx
         6YLA==
X-Forwarded-Encrypted: i=1; AKwUvBxNXa9ljZ9OwT0lI7g8CaPWyEuerO/4MVOQl18jpRy0EYtv8sIdUXLARa1FCnK93Z5sUMUN0X4V21nPAqA=@vger.kernel.org
X-Gm-Message-State: AFq9FYImqwnROY0A6VYRAj6qMeUsKflfxeyJW+c7Gw264X8nS5xZyCnr
	z4xzOmkinHr4l7eb2pZWpuYfWMm1px4GEZLihQwQFuNFXC199h/WHqrTqNwJu31nogM=
X-Gm-Gg: AYBFou06yvgBcYAVRV5RikY04qKejPpim36cykj+UfUP3XBhmuWgJ/JtBE3MhBLypY1
	wnGfeQLJ3xAUimolrQMM91UIPaEDpCTn2Cf8n6ilZDfCaWoOJyiLZdplBVYmeK7tIslzH6WR4xz
	i3d1dIb6ziK7IzL2tPskdSB1pzCOlRW34YErjlWbkshG06oV3a17xOMN/OjIqZYSbMFukXeuPLU
	L9QIS7pJbnOeFvY2o53db/BWn6JInq8ctbiX55NzCG0aq91JH+xi939cGE3Qsh7JveSsDsuOi+p
	rUvS4kJivNp406d4bz/IljB9BzhHZR+SgeQ1out0lXm8KGPjx6H05kLrjRRr7Bleo1YBsQzbAVl
	LbtUaLJdgSuuw0dvDD+GY8aGGxi3hyKbeC8y6DCWM978LpmhpwYRIYJ7Uqudt2jLObZ7aQ1oHr2
	5ivJ76KE6WBsAhsBD1RoD7DbvmRhlFx65bsHF89FPX0VOuUsNQ4ThZ+JGukWc1165+6E17XLS1C
	CNzg10gO+e79xRmy2O9F8smlEEvaWT5z2wJWFJ9
X-Received: by 2002:a05:7301:298:b0:358:bbb7:88da with SMTP id 5a478bee46e88-358bbb793e2mr23668153eec.32.1792102020397;
        Thu, 15 Oct 2026 15:07:00 -0700 (PDT)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm1016445eec.3.2026.10.15.15.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 15:06:58 -0700 (PDT)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Simon Horman <horms@kernel.org>
Subject: [PATCH net v4 3/5] amt: require an exact IPv4-sized IFLA_AMT_{LOCAL,DISCOVERY}_IP
Date: Thu, 15 Oct 2026 22:06:46 +0000
Message-ID: <20261015220648.1545576-4-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015220648.1545576-1-omar@blockcast.net>
References: <20261015220648.1545576-1-omar@blockcast.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The netlink policy for IFLA_AMT_LOCAL_IP and IFLA_AMT_DISCOVERY_IP is an
untyped entry with .len set to the size of an IPv4 address, which netlink
validation treats as a minimum length only.  Any longer payload passes,
and nla_get_in_addr() then reads just its first four bytes: an iproute2
that puts a 16-byte IPv6 literal in one of these IPv4 attributes turns
"2001:db8::" into 32.1.13.184, and the device is created with an address
the user never asked for.

Use NLA_POLICY_EXACT_LEN(sizeof(__be32)) for both, so every payload that
is not exactly four bytes long is refused with a standard extack instead
of being truncated.  The range check this expands to fails the attribute
even under the liberal parsing rtnetlink applies to IFLA_INFO_DATA.
amt_get_size() and amt_fill_info() already emit exactly four bytes for
these attributes.  IFLA_AMT_REMOTE_IP is only ever reported, never read
from a request, so it is left unchanged.

Fixes: b9022b53adad ("amt: add control plane of amt interface")
Assisted-by: LLM

Signed-off-by: Omar Ramadan <omar@blockcast.net>
diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index 2e0d3aa..470dbbd 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -3230,9 +3230,9 @@ static const struct nla_policy amt_policy[IFLA_AMT_MAX + 1] = {
 	[IFLA_AMT_RELAY_PORT]	= { .type = NLA_U16 },
 	[IFLA_AMT_GATEWAY_PORT]	= { .type = NLA_U16 },
 	[IFLA_AMT_LINK]		= { .type = NLA_U32 },
-	[IFLA_AMT_LOCAL_IP]	= { .len = sizeof_field(struct iphdr, daddr) },
+	[IFLA_AMT_LOCAL_IP]	= NLA_POLICY_EXACT_LEN(sizeof(__be32)),
 	[IFLA_AMT_REMOTE_IP]	= { .len = sizeof_field(struct iphdr, daddr) },
-	[IFLA_AMT_DISCOVERY_IP]	= { .len = sizeof_field(struct iphdr, daddr) },
+	[IFLA_AMT_DISCOVERY_IP]	= NLA_POLICY_EXACT_LEN(sizeof(__be32)),
 	[IFLA_AMT_MAX_TUNNELS]	= { .type = NLA_U32 },
 };
 
-- 
2.43.0

