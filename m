Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792984181;
	b=X+r3MQCoWQtosE071RU6/9mnNK/kTqgm3h6IZ36lkRPnkq+RfgvnJq9gSsTV08Q/jPP6
	 U58jW2XTUrdyUR+PVjtoM4Elda0Qv2nEowSIijxmFsIoJ0aGtc2ma0AAC66Gf6SnhEUP3
	 McirIy8lCjyrhqxecaQ0L2AQYPssBSr0/AbY8y4fO8/gJosiws/YII8QPt/VHaaHcGMUK
	 f5yBJAfRqB8/ALj0uHXW07F2by7qtdjrwRLeHsdgfUyftPjIwZ5uvZM1gctPaH3Bta2vQ
	 o8dQV9wTenb34HK1FhsdtS4sWgYGMphqpJyuTxZiKamWH4jowqMYUjNkwLdQpJVWpxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792984181;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cTXVJUOKRughwuSMYrqOOlwP+3rFl6wn/3gsJxxcBAs=;
	b=zVI4muX2cUW2acr7IZ54K+fFYoeMrWEEU/dxJWoAL1ZxgJN3SgLzuCsP2E3erdL4X/0I
	 R0dyRLeXcqP3W6hordbMRjoRd1BTx7YkEDuQDfEJvfmLO6Swlz05bK4+s9u7RGcrEflRG
	 BZeazoDg88m5qYqjoeASFPHuwtDwKgkGlgKTA1cfv9xaKmzjP8TOJTY/mZv4r+zpteAqK
	 MEIg/wSmeL9mT8jxIGuTZXZKp8lvVRSjCGfHjrLhGt4cgpMv4rsH0kVXcYenJ/Vhef5na
	 DAHHw1JXMdaGq37ayghhcqpf7oI+Oy+yCCSiAaOjVN7EsPhv69EGE5FCj4X7yVqfBNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=a9vwO6vH;
	arc=none smtp.remote-ip=74.125.231.133
Received: from mail-oo2-f5.google.com (mail-oo2-f5.google.com [74.125.231.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D7C606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:09:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4D7C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=a9vwO6vH
Received: by mail-oo2-f5.google.com with SMTP id 46e09a7af769-8458555b6a8so757521a34.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 20:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792984180; x=1793588980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cTXVJUOKRughwuSMYrqOOlwP+3rFl6wn/3gsJxxcBAs=;
        b=a9vwO6vHViR2IX71zNqDPxMmiKNbdhMXQsJDsyOC6Dc3KyPpmggtN6/HcRB5LPL0KS
         KrflVexMxIHJZLnl58zHgz5pcVGamHHVCcmTuNfYJgqysLIwKYAbIlCHDPvYlmaHkkDe
         gCXTvxAwVxiCPNHi858NcbI0SrwXK8X7W79fsLHMkjnAcMP0QkL/YwdM1x9VR0nBOPSO
         hdUomy6/i/ehZc7jXvjfYuNb4u0GtYx2YhFtPJtKIh5DDPKY1p1AiDmzMJCs87hiSaUj
         lQz17fXmF0n1CqTa5jVcRQwpY5LnyBYEzZJ43foTCPO5bC7XApYEuTkLfamggna2TUgB
         c7zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792984180; x=1793588980;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cTXVJUOKRughwuSMYrqOOlwP+3rFl6wn/3gsJxxcBAs=;
        b=jOj9IVby4Zzj3XscwBTBwt4JGICdVcHxbuhSwoMt459kHmzsAbrQpWoX00XXN7FkOI
         31c4zT7kUfuiPCIUlpPTfjU0aTkGKzVg+hLqH91SAX1LlTm+6N+ztWnwZqnbiBIrgmJC
         FRM90WMV0+HppTwLwj1chloxfQbdpS0uWcTpmj0Y+8y+4GfkROqnfzWfZ0JmnLdcLKss
         fDvz0O9aOMaJHJhn6FMvTpM9eBVEePmJnmzu/Zu3CAIdhSYj4ysX820N6zjtr3kjxmXy
         2XnPTuEzL0fDZSLLZPH0B/roYNVLl6v3B6cLkTN51ry4UNwDAZlrad7m8L/HFKektWLj
         fjxA==
X-Forwarded-Encrypted: i=1; AKwUvBz/zjioIPLlmouH4habUoXJUFB1j12D9dxXP1/GEvm/elQr9VBcuSjwdK/PL4yRX2Kyon96HcHiVoNwdkA=@vger.kernel.org
X-Gm-Message-State: AFq9FYL8kqc+eV5ycFbmEz9rg0ekEHNNHOFsPMROfoy5HJ0z858r2SOf
	24A3gZQ/3iDLpjcJu9zI0tKw7SqJh3/Bo+7SmgSq7+LWIWiqHfQu+4ut
X-Gm-Gg: AYBFou3iImBKGKzHL58h3a6wF5kyZ3j5lYf51y4bCn2O+Q14P6dgRr2L+h9tyW/suJa
	hwpdVievVeq7JUVs80HeHDrCHoK5tZyg6/6zMn17qbG1Ud6k/c3kVPjI/9g+Z4ESDO7MWo17gdx
	6Av4U836ipvqIwh0lFaKM4gKSKnE14bcOp/RGpUnoYZ/+qtgftadC5N7w88Ir4WrHx81RHBtsif
	hnYPDdStV2GxvYYRs1AXdIF6zxlWaLW+SDdoc0/GuEgqwMoCC+99/dbHjbRSl7C0YCsGqc51RJE
	38yGcmGrXpkLKXick/ScvcHKA6cQ4PALSoPkZMw18AqPyhwWASGvZFapyMMpTSPLoR+3seAwcdC
	hGxJvd4yUsd9l7zD573EzIhy9OsLKJUREgRT8GRaj5u/+KKXDYonIQOhnqYkSpt6KD+spwFpddn
	d6l2+5dKu0lYa6YEV2iyjxuE06zMtDbOhilYn1yWbNpi6Do2yIkz2FNCIjgZXx9HOr0m7yjHzji
	fZ6Sk7sisoKUHEu7l5Fb2XC1i1TUZVRJXrjJhu71VzQ2FythwOUMDvFOshNJODrpGGXSVVLj5pC
	gh0WLo52mVeTsfl5yGYBrCNfY4yWzQFVTGRD5ouX1A==
X-Received: by 2002:a05:6820:440c:b0:6cd:3fdc:a936 with SMTP id 006d021491bc7-70ba0f81592mr2345843eaf.83.1792984179731;
        Sun, 25 Oct 2026 20:09:39 -0700 (PDT)
Received: from localhost.localdomain ([14.116.239.40])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70b9e04aa58sm6421308eaf.7.2026.10.25.20.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 20:09:38 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: Eric Dumazet <edumazet@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Nicolas Dichtel <nicolas.dichtel@6wind.com>,
	Kees Cook <kees@kernel.org>,
	Ilya Maximets <i.maximets@ovn.org>,
	Breno Leitao <leitao@debian.org>,
	Jeff Layton <jlayton@kernel.org>,
	Kexin Sun <kexinsun@smail.nju.edu.cn>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>
Subject: [PATCH net v4] netlink: fix out-of-bounds bitmap access clearing stale mc groups
Date: Mon, 26 Oct 2026 11:09:28 +0800
Message-ID: <20261026030928.719276-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.43.7
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

netlink_realloc_groups() sizes nlk->groups to the number of groups
that exist at bind/ADD_MEMBERSHIP time.  When more multicast groups
are registered later (e.g. a new genl family), existing sockets keep
their smaller bitmap.

When clearing a multicast group of a departing family,
__netlink_clear_multicast_users() runs netlink_update_socket_mc() on
each socket on mc_list, which does test_bit()/__assign_bit() on
group - 1 with no regard to nlk->ngroups.  Skip sockets whose bitmap
predates the group: such a socket can never have joined it.

The overflow windows differ per architecture, both needing privileged
module (un)loading.  On 32-bit kernels the ~54 dynamically allocated
genl groups already exceed the initial 32-bit bitmap, so the table
can grow there directly.  On 64-bit kernels the same in-tree set fits
the initial 64-bit bitmap only while allocation stays contiguous:
genl_allocate_reserve_groups() takes the first free contiguous range
and unregister does not compact, so an unload/reload sequence can
fragment the ~59 free IDs until no fitting range remains, forcing
the table past 64 bits and reaching the same stale-bitmap overflow on
the next family teardown.

This issue was discovered by Tencent CodeBuddy Security.

Fixes: 84659eb529b3 ("[NETLIKN]: Allow removing multicast groups.")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---

v4: Skip stale-bitmap sockets in __netlink_clear_multicast_users()
    itself instead of guarding inside netlink_update_socket_mc(), so
    the guard cannot silently swallow a future
    netlink_update_socket_mc(..., 1) caller (suggested by Eric
    Dumazet).

v3: Correct the reachability again (sashiko review): 64-bit is also
    reachable - group IDs are allocated in contiguous ranges without
    compaction, so fragmentation from an unload/reload sequence can
    force the table past the initial 64-bit bitmap too.

v2: Correct the Fixes tag (the clear path was added by 84659eb529b3,
    not by the dynamic bitmap commit), drop Cc: stable and describe
    the actual reachability (32-bit kernels with in-tree families)
    instead of implying generic heap corruption.

 net/netlink/af_netlink.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/net/netlink/af_netlink.c b/net/netlink/af_netlink.c
index 9fdf964224ab4..ee0a6df6eb5d6 100644
--- a/net/netlink/af_netlink.c
+++ b/net/netlink/af_netlink.c
@@ -2156,8 +2156,12 @@ void __netlink_clear_multicast_users(struct sock *ksk, unsigned int group)
 	struct netlink_table *tbl = &nl_table[ksk->sk_protocol];
 	struct hlist_node *tmp;
 
-	sk_for_each_bound_safe(sk, tmp, &tbl->mc_list)
+	sk_for_each_bound_safe(sk, tmp, &tbl->mc_list) {
+		/* bitmap predates the group, can't be a member */
+		if (group - 1 >= nlk_sk(sk)->ngroups)
+			continue;
 		netlink_update_socket_mc(nlk_sk(sk), group, 0);
+	}
 }
 
 struct nlmsghdr *
-- 
2.43.7
