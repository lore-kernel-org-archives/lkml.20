Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA26388899
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 21:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789853334; cv=none; b=Kx39lW58KGV6+HXVC4az2dI8wY24hCCISBO3G7k34hoD9FKwFabBPvdWBsRbDw2Pzol79dNa/rVkJQLf4DaDx56YcZLjxFQTNAYxn7aw2urbh7T6+afIFBK2MqAiDUSqXmDo7rr1M2O257RcT/WCgA5d+TMKBVwjykWFQgeNTVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789853334; c=relaxed/simple;
	bh=GqV5Tydl3LPYKVJViJEcI+2HDXlD6WG5Df2m4/J8E28=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FrX/FfVxCw1YSYCgYLVO8y8L+HKX/kjtFX/ZghFnVzbVr8xEw3vMGyuQH2R2w7CEQRGwNdx4xOMyf2B+8tRhNcnG+kF0HjhUXAyvZd8U/iMllvfUhs3upGrqnpNq88BSXpNYvPrXAaXe5KoGZciy0nM5mE9YYx2dd5A8dPQLtAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ko56Urlo; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ko56Urlo"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-398a147688bso1929635a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 14:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789853332; x=1790458132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fOBLndiHTILxWCu+KMp+/nYLqNdqp9uqdVWKAPhjT7A=;
        b=ko56UrlooRB+GlYTjSJf43+JDfXBc62w3xfUZjhzqevLZGPAXNq2/aG2p06xOB1oEY
         0C2MPB//BSutUnYn8pT/L6VO2gBS78+GMMOUIWlkjAxZtdfhGEUY0k3dRxTzzBWwTasC
         zI/8zjsgyJ17I0pnBgorpb86ylbvgTXwVozPyAGqLBQne8WvtHfNKLqcW1aBuYAoc84/
         K/1mx5jfJGlpOZ0vdneanEo7G5G3J3RQ0eYJMzfwIXlY6I3XIKRMAqQaWpkIkV3J6Zan
         0y9ApoUSFoH2218W7DwIEUXsrZ+w7uODePL7C5ZfNoaVMq8g6qbGPFBwKVHlW51THF7K
         s6Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789853332; x=1790458132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fOBLndiHTILxWCu+KMp+/nYLqNdqp9uqdVWKAPhjT7A=;
        b=2y3CvDJZylApyMads6Ie/+oEa1yy3WJE60TgjhZPtz8I3xU6ByRo4Mi7eyAB+s22Pa
         PDRw5Kus8yknuq5EdferCUW0VDUVK5Msu1Y+Ipp6ROeRp1D5qupDlhjz5/77BE8qOnKc
         f5xNt4WXKFNsWw67+CEJcNsEK2a+FQ+SJl1w0nP4yWSFDlsDz6D9jHRz/hXgT5UNP8nE
         x5G6f0s2pD5QezFZiuxCZEtvZqlmBcYWgmIQwYM5DuBLLoVsQ0gKV2ddFBn+iDd3yrT8
         F1irw4hnLuuk2tsD+l7sOr5K3zKQe5z3e9ggwlGMMyHEOwHKU8HhDoPenHFdA/B974SU
         CyOQ==
X-Forwarded-Encrypted: i=1; AKwUvBz1W0xlVkCULT6idwBElJ06/nE/kdtHHLslVTtZV8xmBsIsqxW3ZDHYG33YXT2392fb361Q4bAPDshi64M=@vger.kernel.org
X-Gm-Message-State: AFuF++lOSD9xaAmF3zqaDEz5p4Sbgb88QLNYAzQ3XUPOr2s6IAT0MIwS
	yCYb3ifrhk5SAcgV7lSzjdlqFQ2tL8XwEhDNfes9gvkbElAjQbO+ftmE
X-Gm-Gg: AYBFou0j+HaHncp5Q77Qs/4NO+uw2MgKZM7e7L0meGayAzsStddoHTqO5ylXxH9xgNZ
	OBZ6H22iMQ6yor7dv63VjxBA8wfUR0TkHXltoRd3KvRopVvhdZpKcRd7HymFoUsbrGU9ic91Dz1
	wCm6IAR2QLQBV7t+HDrfWX2lSps8JsUUJk85sPBpY2GXed1svg61rmK/WrYnUdctbiegwodgfOs
	wbCxhESQWwPy9twt7f2GBzaY6rsIziBmbXZzyZprpRReEY8+s/G4F7eCt0gTMeVsOw8MN/yv7rE
	79W3960HBPNFgcwwp49/lIMqN+5eUyEjEq+t2Bfw/gXsru+6WJisQUDEECzZ8yB1uNVyYm7uewD
	m+yQel/vswiB/ahkn+or1duD6VsR7Hz1c+YC1A/Whj5vfpLq0vlUdMG/W3HLBPTQThNJ47zFY7U
	QxS+Hdwp5YiSuAZ3rDezQ+rk+9Fc487n0wrHB+UcnqJWAGvXtN3n5eiId8F43ZfTO99ImWpFdRF
	KXqvG7Tp9eNIRxlUaqPoHmy7cfe5lmgSOuKuQgoBuM32JALTcGE1hp9D3CqWf+Lex0qukzE6d0U
	KzvjzGHWtG/0cK2k/abT
X-Received: by 2002:a17:90a:d40f:b0:39e:6c69:9b8c with SMTP id 98e67ed59e1d1-39e6c69b291mr5170268a91.49.1789853331817;
        Sat, 19 Sep 2026 14:28:51 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a023cf10bbsm1950956a91.3.2026.09.19.14.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 14:28:51 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: jk@codeconstruct.com.au,
	matt@codeconstruct.com.au,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: horms@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mctp: route: verify socket ownership in mctp_lookup_prealloc_tag()
Date: Sat, 19 Sep 2026 21:28:51 +0000
Message-ID: <20260919212851.3240598-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a socket transmits a packet with `MCTP_TAG_PREALLOC` set,
mctp_lookup_prealloc_tag() iterates over the per-netns `&mns->keys` list
and matches `netid`, `req_tag`, `peer_addr`, and `manual_alloc`, but
omits checking whether `tmp->sk == &msk->sk`.

Because all preallocated tags (`0..7`) reside in the shared per-netns
`&mns->keys` list, any local `AF_MCTP` socket can specify another
socket's preallocated tag and cause incoming replies to be matched
against the victim socket's `mctp_sk_key` or reset its expiry state.

Verify `tmp->sk == &msk->sk` in `mctp_lookup_prealloc_tag()`.

Fixes: 63ed1aab3d40 ("mctp: Add SIOCMCTP{ALLOC,DROP}TAG ioctls for tag control")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>

---
 net/mctp/route.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/mctp/route.c b/net/mctp/route.c
index a2c1517ff447..e411ebeca631 100644
--- a/net/mctp/route.c
+++ b/net/mctp/route.c
@@ -826,6 +826,9 @@ static struct mctp_sk_key *mctp_lookup_prealloc_tag(struct mctp_sock *msk,
 	spin_lock_irqsave(&mns->keys_lock, flags);
 
 	hlist_for_each_entry(tmp, &mns->keys, hlist) {
+		if (tmp->sk != &msk->sk)
+			continue;
+
 		if (tmp->net != netid)
 			continue;
 
-- 
2.55.0.1082.g2b9226bbc0-goog

