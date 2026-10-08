Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738D638C2D0
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 05:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791437387; cv=none; b=rq93Vdrg1Gj7c2w8i7kg6Yc3giUEq1r0tRnTQUg7gJB3vUqV1rKG83aNsuzxv8BXJ3GVWTjmNFLVoflEZgQF51/2hClFBJ4N8PLJrCPVJPyBXFEqeWI98sz1wPLIiCrf6tK8Hj7o48BFq68gzRxaSVpUL1LJ8Kv6+BZn3VCZJ38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791437387; c=relaxed/simple;
	bh=psF77OoksKyKszlVeKZVEcGxdgyZQCg4lQ4qS9TLvj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kHEv9ftF0IFYgJEf5DclYlYhLsXyMqq1bGDVPlZ8+wV0kxFpvBcl5/YhzD1NuR+jMaepwJcebpxme9LWkKRswfz3iqqYlNl7udDv2ULpR1GL61pmyMCMGTcmyQ1B9so/PK6XdV1PuExsrGGhq+r5rhzfZQGsRxyU/7MmPjXspKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XLykfNY3; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XLykfNY3"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ab10550338so12172a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 22:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791437386; x=1792042186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tNMJn/lOvJR8pkwjdlZTd33Az5DYUmJYI23RTsbII4o=;
        b=XLykfNY3osHZuek4PDYA4haYFOXe8nEllRKqvHLZVsXckFvDUe3oZR8qP4GSaPwaMI
         WbG8xdD6YVCvX0/IMkFcpbbv9hFwfeXAaIz1gnIatJ87eT97gY5CN3cw69+xr3kNHtWZ
         Ud/O4yP66wz0KtkWDCYx1GvGCSOno+DL2rsmEpjJgtpqlO/SwLi2KOrC9YgZ9Dzl3o8v
         5G1g7DK+kz0xqrxPX2sICPSV92+RGh8/nHlcMTa6j9DRO3oov2iacIYgKwd7fZqOOW5q
         3TK/tV1SMEiRnN9kv+gP6UtbmRGyI5/zWflHtGQbjb28G6RzY00Ez61rCcYqkkHbj/11
         eotg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791437386; x=1792042186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tNMJn/lOvJR8pkwjdlZTd33Az5DYUmJYI23RTsbII4o=;
        b=gPMls8nCu33rYo+NC/CP36j3sOMwyGYFhi01F6T8YuHKcbDHKyGL0zmrQA5xVB04Z5
         HsukL01OtJLEX+k0AxuXbl59ZV4YKMKaXmKB5QlVszv78wCzfc5K0kyvsMlPyMUw44B/
         SRcUDOhyDfx+7zpKmmLvKlpEeRjaLS/1MNm9EEexFmhfpMz0NkfTQsU3b73q2CtInqZ0
         uEw5+kfSdjDcKQ731+tIVWAL7ublNqh1ZBaaspmHxBmEAZiGK6TPJzErRPHWwHVB4cG2
         4cRwiAICKnVKr2E7MG0GLwj7w42GYbNj2qSQQ0epPhCTLgmM9Z7IOyOvvsi8klehvlKP
         LjDQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZKMO7gWteDx4q6pwEqPNIDEqKui4sRWRTT1DrCOkLIb3Svp+cznBmTCrYoMJbkE6bL2rvXqbK8FSoqQU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKsxsgNHqMZXvj0RHhScLkxwMiCJa0lfRGHVoySsIx8/4JMW00M
	9buOsgg8IQHBENJ2Rgn839e9R3P+iQ1x9Ioqx4DVc80xMMxM/7MT5mSh
X-Gm-Gg: AYBFou0kd4bqs90wI7hbZrkmu/mPolDacdUnUaO509oGK904a2oQdCPzS1SfiUqRRof
	2k8r1e/qgUyEa1z8J/b5m+HvLK92v1viyYouo5pOGmVA4MY36hc7WUOZKgPge43WqtbsRHZRTqC
	qZh6hntAkowJLihd/s86Vs/pTTfERejKTMkePMVEZmPTdEeL0hBmA0SxBRdU9csrr5xqsNQug2H
	IsXPjU1RtzUvYJys1xx1QAIXoIxnpoxt9MK6YRD86HsL7Zi69388WBu+rDH5jBpczOM2Hod/nGi
	iLnb6Mv6BAq4mGebWrBhAvIDB1URKQGMMt3+SHAg6Gi2bFcS3dj5Irt3VtsmpxIqCmdaj5cyGVK
	uuehhinHYTGjIa/rJR3/GU7SgVE8NcIa1/hAIjbd5mdG9Cs8Bu3Sp6IfFxRCamW7G+nQQEmu6QH
	+OvY5yTXri04JOS2g8PP+fHEYZA9MYCCnBeffiDj/7RNzSP4x081wp2xofW4A3NRAd6AHd45Hnw
	JczOnDAQ9A=
X-Received: by 2002:a17:90b:4fc5:b0:3a8:5fd6:cb6 with SMTP id 98e67ed59e1d1-3a89f4441femr4035599a91.0.1791437385760;
        Wed, 07 Oct 2026 22:29:45 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a89dcc4e04sm3758223a91.1.2026.10.07.22.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 22:29:45 -0700 (PDT)
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
Subject: [PATCH net v2 1/2] ipv4: do not warn on route notification size race
Date: Thu,  8 Oct 2026 14:29:22 +0900
Message-ID: <b7e203fc5867651cb67ef84aa03e082f0f76008e.1791423190.git.4ncienth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791423190.git.4ncienth@gmail.com>
References: <cover.1791423190.git.4ncienth@gmail.com>
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
-- 
2.55.0

