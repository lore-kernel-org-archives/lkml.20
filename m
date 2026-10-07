Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C33396D15
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 04:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791348866; cv=none; b=hacT+Wqa2fxyMp27PDnqk0i0Yd2fvTMZMQu4bV3VvzEMeTltElCPT4yQ3qrRlUr+6klt8zNKFkY7TyRlI1/BqQnXX6G2OmzaLxzJj0DaD+YpOrZvcL74VfYcEp6av27DyxIC4k+pO9SYG0T1NAW7tql5YI7kyb/jXuKMoa9cVyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791348866; c=relaxed/simple;
	bh=7scUbGGukbWsszs2PDSE+tTAAKfh1GDaFhy2/fY25ig=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JcWxobBLKRDbz/26lXoB/1a+sQj7QIVblOLnzqKXHyLkwjLxyxzHwpNNLT//XE8n9Vp8BG9fs6Yf8beMilRM+ts3E7oAY3ZYBHy22XpYU8hk9u0lO3QRxxCkh+ijoFCFSAVw1/YaStdSXAS+oGLUs+drpbvvhAb/suVJeWK7hC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SYaC8bQ1; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SYaC8bQ1"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e5fb79cefaso4127285ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 21:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791348864; x=1791953664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tBd+OEzbKsaLTS0j2Uj6XjGnIaSZtWgAGMx+4GEFr2k=;
        b=SYaC8bQ1/W77VWvIidTExtP/9aWaT+JAlLRy0jaq6RmYM3XzgeAt1TREMyiUlZOiwF
         jdG2OT7jLeXwOvYypq20R8v3MMnHobZrrIPHNce6kyk0fIsybThnVvntilZV09gcz9VK
         1OfVTeouY3h1pExHpK/PoL1SiBxbrLj2+QO6rm7XOILTNCEEqphTx10gMgBXc94aeOBC
         C0W13v3kr1b3xCOIyR1UxbG4tCjoSlDQrd5rquKpavPi0XhPNUhMEdxrDkphblzQmIek
         tZiV8u7y1DFyMSVJkh+flLMCzA412Ekqv9m4X6bsmW9CfeQ1ganABuz1syYcd2PuBHvP
         F3kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791348864; x=1791953664;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tBd+OEzbKsaLTS0j2Uj6XjGnIaSZtWgAGMx+4GEFr2k=;
        b=Tn/lwhtzIX9GUHUNuMu8tMFjILPDOCjEx4ISj+Ob6g9GJeMdknBWCynLd3T1oMgHsX
         6XNE35vwBZeQIus9Hn5yB4T2CFFKbj0af3fIwdsU68R58U/ZktNutE9K8aP3+mYmer6e
         L5kBvTm5CDJTy/cE1JqQudaOFAukvF5Pi1XQUiLd58ZHkEN3wQ6q+XOBPjHyhq2WQ+R9
         MrYDNiduzuBUq7BO4z4UAm/yNxjLYcs6+ti1T2bwvTHBeC3SLXd0drBIcNJxPTu9Rg2J
         NuAIrCDMzUejvyuTGE9cRc3ZgqEm5VLlOt/hXJzyeXnQwPkb89vqC1VACXFNNTtiB4Q5
         XH1Q==
X-Forwarded-Encrypted: i=1; AKwUvBxHncIvPsZ74VsaAhAl+ft+Tns6GfAInc4xaY9PgHvN7TnmjTFaREtlyEoA2Wk5WeCx9ju37JxIav5q3YY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJejw2fzKuzO4pg/YUfoJ9xXB3Na0sonKNJKzF7kXMBW3vJu/j1
	KKR00an0H62ktjLwLCm2LnySp4h6HopWkODlIHaQ+5ukd4/19zhCoRrk
X-Gm-Gg: AYBFou0dTwBKN+YN9sutmzODrZeGZkwl6QW39KJ0oWCgnVTS97QyMVxPqhYMerhpM+d
	B0odYcMCtFuMljm85pbB6hcDFVlnbIPsHdS+alGnLxAbdV1kK2/nm8PaKnNT/GP1GyA3TZoIecv
	5GAjQfRavVZCGbn0uyO4imqsxjlYQsN3CcoLtJNJX4ZM/shIh7a2kx84OZEKVzOG1o6a/bIz+/D
	SSbqTXwitkWw0/Sci36YE0LQbyH/Uh+liG6claNHfpV1ZvAWQGZfCwDl9X3M9y7C17K0aZRx3KU
	ibe0jf0YiuRtsh7x1JXlaLpSQbNTaFYJ6l9wZErHPkCn0UlellRYt9NxK0K551VM2TzutxON8oz
	YKPcocbq9DWGABDIkCC2R+LCZv1Gn1PNdNlig1ZvkNmtZXPEsWMuuhWQBXWOyETctYS9sgAlyV4
	c7IciBNOlxbAqFGgRaqrnS74LZKwl0UiLE8LO3y4W/sr9C7ylnc3taaqTgteV75OIpPRtyTVmA/
	0fVnqSYtxs=
X-Received: by 2002:a17:902:ba90:b0:2df:34c0:7301 with SMTP id d9443c01a7336-2e5c54bc15fmr17707965ad.38.1791348864280;
        Tue, 06 Oct 2026 21:54:24 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e60494c323sm4530895ad.69.2026.10.06.21.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 21:54:23 -0700 (PDT)
From: Daehyeon Ko <4ncienth@gmail.com>
To: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Amit Cohen <amcohen@nvidia.com>,
	Roopa Prabhu <roopa@nvidia.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daehyeon Ko <4ncienth@gmail.com>
Subject: [PATCH net] ipv4: do not warn on route notification size race
Date: Wed,  7 Oct 2026 13:54:10 +0900
Message-ID: <20261007045410.3806739-1-4ncienth@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 680aea08e78c ("net: ipv4: Emit notification when fib hardware
flags are changed") added asynchronous route notifications for hardware
flag changes.

fib_alias_hw_flags_set() sizes the skb with fib_nlmsg_size() and later
fills it with fib_dump_info() while holding only RCU.  With nexthop
compatibility mode enabled, a concurrent replacement can grow the group
between these independent snapshots.  fib_dump_info() can then
legitimately return -EMSGSIZE, so the warning does not prove a sizing bug.

Remove the warning.  The existing error path still frees the skb and
reports the error to listeners.

Fixes: 680aea08e78c ("net: ipv4: Emit notification when fib hardware flags are changed")
Reported-by: Ido Schimmel <idosch@nvidia.com>
Link: https://lore.kernel.org/netdev/20261004082043.GB92032@shredder/
Suggested-by: Ido Schimmel <idosch@nvidia.com>
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>
---
No new build or runtime test was run.  This is the exact two-line deletion
suggested in the linked review.

 net/ipv4/fib_trie.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/net/ipv4/fib_trie.c b/net/ipv4/fib_trie.c
index acb1e43859143e..248514dce0cdd5 100644
--- a/net/ipv4/fib_trie.c
+++ b/net/ipv4/fib_trie.c
@@ -1079,8 +1079,6 @@ void fib_alias_hw_flags_set(struct net *net, const struct fib_rt_info *fri)
 
 	err = fib_dump_info(skb, 0, 0, RTM_NEWROUTE, fri, 0);
 	if (err < 0) {
-		/* -EMSGSIZE implies BUG in fib_nlmsg_size() */
-		WARN_ON(err == -EMSGSIZE);
 		kfree_skb(skb);
 		goto errout;
 	}

base-commit: 23609bce9e1de525d1d0e73fc68c6e7971d0b49e
