Received: from mail-pz2-f31.google.com (mail-pz2-f31.google.com [74.125.228.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306F035E95C
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 04:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790916688; cv=none; b=aU6Yiow+hZkD+URtu4kJonZ6d0qHkaflTVfCop+g3SYloyJwI9/hxWPUKvxyvY0etz2UQd4c5hsirw4rElEAhfvT7RZJaxFgePE4O6kLIqcWXeEowczSAgT+RIoIsJOTMHUnAXLCMfPWiSBwnpr9rHWcdSVO8t3MM70eiYBEiLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790916688; c=relaxed/simple;
	bh=NWTciQTPQGFxRl8e5NBASdT1gbmDf6XBJprffVSqZLE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W6xZ+UURZfJ9QDc9X/IvMOFaV8o9uc8IBNZuNJ3qmx46rVZADKeM7QTYF56raI0uYjcGym9iJgv7wx4XLcYljaty1TaCowm+tnDgFc30hFoaZcmPuWnqFRtwFgBpRFmn2thpGUKpBUFixJUOOG730KSrB9uESPYiMl52LpvTXEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m2xrXilc; arc=none smtp.client-ip=74.125.228.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m2xrXilc"
Received: by mail-pz2-f31.google.com with SMTP id 41be03b00d2f7-cc7d7111700so1207574a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 21:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790916686; x=1791521486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=acJBQIXpi9PcvXHZyXDn71ZRsavqRs7vpb0bJgNaqtw=;
        b=m2xrXilcb3k4jn60JkCRh7MCGKDcBSnva/PljWY32PouUGp6DHQne0z9iVbDw0XXuK
         lLCgl0L0pTgoS9ZD2MVMrH9fir8FKjAXTEv6OP+YZLrGbE3d7kHdk5CVSIxTw3E272xE
         YZmYypBMbu8sTKCaPin9Rau/Cty+nydFIg4+BVU5we5UKDjibn0vHjKjrnjGF2tTihgP
         xXhewDyDTYQeX40vLqwDLyx5MU/WGBH1tWTX0P0h45KyBOcHdNmjfDkaBR+Iw7ZAt9+R
         3KVYilAmLlas6HFrhPf4murGq5vH2ZWtxgL29GRuDHcVDOR9gx4OgDX9gPUMn3pCzaD+
         tgfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790916686; x=1791521486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=acJBQIXpi9PcvXHZyXDn71ZRsavqRs7vpb0bJgNaqtw=;
        b=I+NiGe3vBIuefhBVVtnEbETlHbcIVkCsyKCY/HvWGoPnDjoiEZ0qSHX95I9G0PRyzc
         ce+7kSAmpHpF/Qaw9gsLkoKQFi+ecG4FJvt/xbUoSBhzUPpcH8I9FFA89r48n40AP3hY
         1hqt27mW15ON8FPnPxSCcP7UpMC5FjqAo6cFzmJ5G2voneY4uRAF2Wm6wocTzGTQoao+
         nuzKmY2qRMMfcj3Lf5sR9BoGdX3syjozflzNedSMGvY+lJWQLGhsRW42aGKsZKBK9moz
         T1Z+esFIN/s6ZF32QWQBf0EyRd7lmXWnnWAAB09FoMyXhEZQZZEwavJ8ALSgeGJtUTTd
         aPLw==
X-Forwarded-Encrypted: i=1; AKwUvBwBSLH5RuJVYZxJpZgWjToEn77j/sAojJN3assBuob0s0CLf41XijSyE/VtLZoIDOXNmMZZ2WkAa6Kejgk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIRFdakyn3z7jLAyhNTz2O6ahyqoQQUdEv4IHMdee0wRZ/H9Sh8
	AauV3FXuq01hTfh680HR7OVku+4vQLCsgFq1PPF7QrBDBvkn9JGYiTMj
X-Gm-Gg: AYBFou1hQlZC+hyDwqF0bR4BS+QuOYQMghPiiBWNFC6bOO7o3sYgohWqPQ9IiVM1bHC
	aokS1Kp3buHdVN8gDrBpYMy2sUu1N8PBhlG+xZnd7ibH33v3DeoY+KXBd15jY0h/mpXhY7v+zIM
	IQw18LRNF8s0aI07fuMjLb+3m5IxIR1tQzQB54Lhb3iD8KRzAqX8ig996IEHUNsEagkZAUATbei
	I2N4rVxJqHs3QKKVw38TsV1QNKDwRn50nyxCq3qSUUbpXLzNqe4KBB8WygUeTchoPGXXer7HkKi
	QX73yv4v887+hEk+JhmyJbQZFF1cGOfqG03mGOzUCB0hYCxhe3I6wCtedlxv5Puwl/7N3NOqvHi
	Az8Jy02OOFz1s28rxCDDQBg5/QwGkI5jo29ROhvv9zPLz3kyjtYZMfQ+MW/yFJBduq87SLYJcQ0
	spCba4nJaOTpP7oRoRkjrr01ex7an6Cv46aj+EOnh0UywZHjpqI5/CWiMEAlmBFDMMSVfMSzcwE
	Wv0J/VQQ78=
X-Received: by 2002:a17:90b:56c7:b0:3a4:c895:562 with SMTP id 98e67ed59e1d1-3a6cec1fdc7mr1563842a91.62.1790916685941;
        Thu, 01 Oct 2026 21:51:25 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6dd3962f0sm642682a91.3.2026.10.01.21.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 21:51:25 -0700 (PDT)
From: Daehyeon Ko <4ncienth@gmail.com>
To: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Vladimir Vdovin <deliran@verdict.gg>,
	Donald Hunter <donald.hunter@gmail.com>,
	Amit Cohen <amcohen@nvidia.com>,
	Roopa Prabhu <roopa@nvidia.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daehyeon Ko <4ncienth@gmail.com>
Subject: [PATCH net v2 3/3] ipv4: stop route notification sizing when nexthop group shrinks
Date: Fri,  2 Oct 2026 13:51:00 +0900
Message-ID: <1054fa46165bba1b473782fa41367804aa908e86.1790915964.git.4ncienth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790915964.git.4ncienth@gmail.com>
References: <cover.1790915964.git.4ncienth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 680aea08e78c ("net: ipv4: Emit notification when fib
hardware flags are changed") added an RCU-only fib_nlmsg_size() call
for asynchronous hardware flag notifications.

fib_nlmsg_size() checks fib_info_num_path() before each iteration,
then fib_info_nhc() independently reloads nh->nh_grp. If
RTM_NEWNEXTHOP replaces a group with fewer paths between those loads,
fib_info_nhc() returns NULL and fib_nexthop_nlmsg_size() dereferences
it.

Stop sizing when the indexed path is absent. Nexthop groups are
dense, so the current snapshot has no later path.

Fixes: 680aea08e78c ("net: ipv4: Emit notification when fib hardware flags are changed")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>
---
 net/ipv4/fib_semantics.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/ipv4/fib_semantics.c b/net/ipv4/fib_semantics.c
index 5c9021ea3a799..47469b7758082 100644
--- a/net/ipv4/fib_semantics.c
+++ b/net/ipv4/fib_semantics.c
@@ -542,6 +542,9 @@ size_t fib_nlmsg_size(struct fib_info *fi)
 			struct fib_nh_common *nhc = fib_info_nhc(fi, i);
 			size_t nhsize;
 
+			if (!nhc)
+				break;
+
 			nhsize = fib_nexthop_nlmsg_size(nhc, nhs != 1);
 
 			if (nhs != 1)
-- 
2.55.0

