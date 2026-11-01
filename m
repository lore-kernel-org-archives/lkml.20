Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793528041;
	b=cF5bBgP/hgKCJ7/6V/42cacuNz9RmPQroPwK1LmETmWKajO0mIKtDXWgoAUE1u5c2Z3o
	 XdpLdZBViTCzjf3XwrYYWoYWbhJkppaSMgJ/JAk16sOqik8JDB5dqCGxsJzlNqpcdXslr
	 E6/RIvKP6j8bfYIB+JU46JwMzxodF6Dkch7TBWL35eVWC/9+d49mTI/ZRXtCAaackrdS9
	 KYWLfoe47g+1DgWLTZQ1gYPSCS8f0d+iPJFprFvwZh61YWxEG8XlhyLoYiz3rthWm6Qav
	 Ey23w+rXsSvdejZbIyWHg6Jaq0th47A6uf8olyRgndpirunb04dTloT9oLOFv1Fg20Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793528041;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=G2n2IA1tkyXWwdIf7yrDgeiQ3S2zukN2iU0KIGIZH14=;
	b=AteIGr+iKs3MgM4e8e8jCujnu0DzAnqYPcbb9GUYSrWwCRO6G4WPSzheozxXgzFs2ShR
	 fr8wTRUPHBpYcWXy4s8Vktimd1JX3z3pUI70fFtePn90n7ku/69Nl1FyPnOlNnTI3s+FP
	 oOQ3ueVZ1W7p/ZTBQj1MkwjfIV8zp7TWOfAJ15a1t/GfgbFIjxOxh6Jv177kr3bJtu+Nv
	 XL9GMbM+ro18LBNb3v9N2G0zYDelCxH+zdzz1emYS1Ze1N63AoNxivApm8lL59LMbxVYV
	 plgVHECnwGg6VxGnZXEdwIrz58gLhbQosCMHhDKMznsmlSNw8uG26nGCkN2K7NhvHEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0PDUrKIc;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2110E606A329
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 10:14:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2110E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0PDUrKIc
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-35b2c599f43so2718828eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 02:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793528040; x=1794132840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G2n2IA1tkyXWwdIf7yrDgeiQ3S2zukN2iU0KIGIZH14=;
        b=0PDUrKIcb8W8AKbJw8jtrP1Xjmj39IVI+/5ert6Q/WSsxJytM95JznSJy52DcdIVqB
         4Oa3ovjCq8ktKSBc0UeSqhck6YJsGADgPNKkIjAVDjBAOkOatz3Wi10nu9pqp3ps1Io9
         3vG6XRaBGAI6dRVRsXgozUBdu01uNHVbJ2oLrA/Ar3pC47iBgiIbsmqi0lgW7o3orX+w
         G1FLanwQYAN/Qv9AVwPvayytH0lWVh7USuv5ABfpNlMiPbHyJ7NaTv9dLM2vXh6/uMBo
         GdYJSGkHHZ9yViaDLwKepg5txqi07s7FgFIO/eDuaYQaFJ2VY3iHo5OdwYQ+V+kxJnnH
         KSsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793528040; x=1794132840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G2n2IA1tkyXWwdIf7yrDgeiQ3S2zukN2iU0KIGIZH14=;
        b=iGFifmbTy82iB1Pz8Wts+HkcVgi8axRAtSUoEa1AbfCIK2SY8niq69la5L8cgGSHmJ
         8eYuYV+03oxF0RMkfAOj1734kvRGt4cjqYKQwN9frTqU/P2l5ZBtpV19YN6egJY7WTgf
         gDaP6mhkrvAbdlVzLrMMmBRj37lpO+8DhlcjCEXaXLleDZJGLHejaRBq13WOqz3X9AeW
         /+pmKcEmJU6RzDedfNOWGIca8LoU04QgFp/XrijjgzHen2oa2hdzK7X5PSEfNOetusMt
         FtS/G/YQhCx2+3nmYTS4//vKVloZArYY82RNWpbgjDLJIi5mebpBPYvRJOJyZ89rZsgN
         Wcqg==
X-Forwarded-Encrypted: i=1; AKwUvBzUJ1FuiGQuXbxBnnLf9S9fJQV3xBslHEqGFqrFvhSUMZB1oruGesx3QSSzFrablQS4V7GRnS0MEson8FQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vnL/2wZfP7DTz2zDjrH4wy1w9ChMM9tBDU/mB2ARb+3Y8k1v+
	ju4LM9SYRJ+mLgefHwxHQXZ7ZnRHdAbok79nEmRYyI63w9EhTHxlEs+S
X-Gm-Gg: AYBFou3G13/DMTHMUbgP+HKTjT983Psy2cIzl/6cp+jxNBKY5miPsq7br9Y+HNk678d
	aWu636/KO1XXJQBPCh0asCscJztORfzBSvbzUSpAc09B+GH7C2AEXHS3JKGTAQjJ4ocFMTtSysH
	d6KUVY4i4Nuh7ldWpz7RNXbBLvgSESBXHr/lChs02+/4sNua63NTcIcTurgcFzi4NQilHRkWpjE
	NC5w9YU637CSIqABXjZX/KI811nEasEt44Y91QKy6t78wkQBGOBUxUyY29Ybyr9+O8hcxxp0rr+
	bch4wsYtyrYSKHzAdO11wgTM0mTloAEoCW5T4SVTsbHNGeSez1TVxZWfvXxRWHVp/7q6LJR1VqR
	4mIBK3Qlo81Cml04d8hKyTW2Z5DAeef4MOWQL3dZlrnGBmdpoqCNQEKa4Q3CRYM7iNQxuhaS2V+
	PkDAIBGnNFgZ53icPqwSP9agP8TvPIXQm7+R+hQlaWkT8fqjaUIvl1cWXnR61y5mEh/HAVsbKZB
	M/kxTo/n8Lc6o4kwt47pKR88y40kbmB+O8V96hGQntCs0g7VsevvOyZno/vIjV/O694NMmdr9kv
	bNX4iZkAl7DA2bkVzG0jyxZH8U97yXjDd3zyR32IZbtPYkjNsAziYDv+Wrv5Xm43+i5PQ38Ubcc
	NAXg0vAUSTKKkpRkGrJ9NzrB/jkpqrGGOlm8hEIkZ9VGpYRcNyCxipYhUZwF4kUVLvykcyD0VRw
	==
X-Received: by 2002:a05:693c:6092:b0:361:7ab9:479d with SMTP id 5a478bee46e88-36a423ee70bmr13091324eec.27.1793528040052;
        Sun, 01 Nov 2026 02:14:00 -0800 (PST)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42662f23sm29799664eec.2.2026.11.01.02.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 02:13:59 -0800 (PST)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Florian Westphal <fw@strlen.de>,
	Mat Martineau <martineau@kernel.org>,
	XingWang Xiang <v3rdant.xiang@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	linux-kernel@vger.kernel.org,
	Anil Kaushik <anilkaushikwireless@gmail.com>
Subject: [PATCH net v3 1/2] genetlink: Reject joining multicast groups no family owns
Date: Sun,  1 Nov 2026 10:13:46 +0000
Message-Id: <20261101101347.3910654-2-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261101101347.3910654-1-anilkaushikwireless@gmail.com>
References: <20261101101347.3910654-1-anilkaushikwireless@gmail.com>
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

genl_bind() checks the GENL_MCAST_CAP_* flags of a group only when a
family owns it. For a group ID that no family owns, it returns 0, so any
user can join it.

A family registered later can get that ID, and the socket stays a member:
nothing checks it again. An unprivileged user can join the free IDs, load
a family module with CTRL_CMD_GETFAMILY, which calls request_module(),
and then receive the notifications of a group with
GENL_MCAST_CAP_NET_ADMIN or GENL_MCAST_CAP_SYS_ADMIN. For example the
drop_monitor "events" group always gets ID 1, and is free until the
drop_monitor module is loaded.

Fix by returning -ENOENT from genl_bind() when no family owns the group.
Nothing is ever sent to such a group, so joining it has no use.

Found by the Sashiko review of the gtp multicast group fix. Tested as an
unprivileged user who joins all free IDs, then loads gtp and
drop_monitor:

Before:
  joins: ok=62 EPERM=2
  gtp/gtp (ID 15): member
  NET_DM/events (ID 1): member

After:
  joins: ok=19 ENOENT=43 EPERM=2
  gtp/gtp (ID 15): not member
  NET_DM/events (ID 1): not member

genl_bind() was added, with its first capability check, in the commit
in the Fixes tag.

Link: https://lore.kernel.org/netdev/179324692107.3134.14443689892607921337@kernel.org/
Fixes: 4d54cc32112d ("mptcp: avoid lock_fast usage in accept path")
Reviewed-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Reviewed-by: Ido Schimmel <idosch@nvidia.com>
Signed-off-by: Anil Kaushik <anilkaushikwireless@gmail.com>
---
 net/netlink/genetlink.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/netlink/genetlink.c b/net/netlink/genetlink.c
index 5cc1037d4917..f038f04ef4ea 100644
--- a/net/netlink/genetlink.c
+++ b/net/netlink/genetlink.c
@@ -1825,7 +1825,7 @@ static int genl_bind(struct net *net, int group)
 {
 	const struct genl_family *family;
 	unsigned int id;
-	int ret = 0;
+	int ret = -ENOENT;
 
 	down_read(&cb_lock);
 
@@ -1841,6 +1841,7 @@ static int genl_bind(struct net *net, int group)
 			continue;
 
 		grp = &family->mcgrps[i];
+		ret = 0;
 		if ((grp->flags & GENL_MCAST_CAP_NET_ADMIN) &&
 		    !ns_capable(net->user_ns, CAP_NET_ADMIN))
 			ret = -EPERM;
-- 
2.25.1

