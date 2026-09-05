Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33103248867
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 21:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788643171; cv=none; b=TkQUcUU50OlcpjWXN8LW2WF0+5CATQV4XtYxQYy4v5iOOxkCFprAf+ZD6tlaSocOgBVcXae5fMEYb4HPoqQWYL1+JsAUjOsCw3Fg9n03Eo4/PdkR/QBO5/akhgHWCAwpW2o8iLAusXT6zR7O3eP/yoaZ2SOsM9ah0c0I2xCm1Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788643171; c=relaxed/simple;
	bh=oh7oa64ahPQJ1oY0hX/CJNl3pOM3+7GitaoWTG6lWjY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uYaymzV97kgcKUcv5SxDDqJ24TJEhHZiu2esQZWm2Dmhv9AvoDnFNCkyUMMsIZvh0kC7NTXZiuuTCFdUv4O/vV8I0q/RpG6mEAaXCKd0vdaeDCk0qLTmdDkwoQSPM1fnNc5hEjwvihIhSuBE1HPkl0FtDFBMoHDDxDdz8stOnQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NZyfGnLL; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NZyfGnLL"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-39682983a0fso2412386a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 14:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788643168; x=1789247968; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O10faWGDAP+xqB2dkkb1dGKdh4Nv8p4gi8rVF5o6P08=;
        b=NZyfGnLLOE1s35qWQIHFnQdnj33fvjUkOXLMQmBz+Gj6xf4VnhZ1fLz8CIxbI483ON
         CkGRVVneXELIW3TeTmb1H3SjSGEU1QHaglzFISIi1OihbLqjubhhS4TRIDL7WIZOpSC9
         NGbPVquifNWRx1/ilvgIZ4w5vy0K5tViClP5QIpeZbpDLFgqPeN5ldbbYnh2duyL9/IH
         qZYwPYvhi2I1HOEMdjBxrYa3HnlzvNodP5Yz5ibtQkZy9nqCriax9fy6CDoGz2HJJpLv
         tecy5wZb9vlsag7txgZ09PnBcd0CO1EUuEj1N2ZolWiXpmHrR+EUKsxcfk3dVKeth7Xp
         0gfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788643168; x=1789247968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O10faWGDAP+xqB2dkkb1dGKdh4Nv8p4gi8rVF5o6P08=;
        b=UsPzuJ2LIbXO4h4hB62g2jwJ2ogx7HfYmoEAnBdpbcd1zLzVY2Espell89WtUSDy+Q
         /9YBILNRX8JJC/nRzGbibW7GLWNXXUO7xcQn5l0MZZNlHG1tnxCQ9XbzhwAKhrnBVNS8
         mbDiPjlOfGPvP0Iuq5P3ho+38x8MuH+qThUsIOqLSvbvpMb2SxEvokSrX76RRGwfkGMS
         zKw4uQt126ecCKC1Tx2Z/QBCEMVn9EZpX59OMoO1ChyE49b6BtjEJGN6rN8YYX3fthmz
         9z87J25qQ+/jDZca7xE7fMOra/wYgWIXCDHeUnP2TwB9luuHcCdsvEMyZS/KD+Hsl+XW
         S67g==
X-Forwarded-Encrypted: i=1; AKwUvByRjoE2DoVPtudKcKDPNfORUt/OjkmZiCMPpm4uoLLru+B0gfLLpxnAneo5XuVqjD6I3JXpH0VrUq4QN6A=@vger.kernel.org
X-Gm-Message-State: AFuF++k0KlqgkIUQhGeRSQ6Wg8lwrygkGEUtO3RPQtiSaz1WGFHsiPxq
	mJ94fzE1jcZrr+ft+jdzLDNcQJuIe46ehCp9qMXzZnM9XBsLVanv2So=
X-Gm-Gg: AYBFou2FBQgtz0cywYKp3EXy37D9TvoBxYGCIe2UHHf4dO+7qKzdaJ55QGyh0dx7/4V
	3QMxCA52+vVvXC83ieuLXzo8x9R1uLasTD65lg8KHDThilRaDwf8xIBbgTA/7lQG2VY5DhSeSMt
	hGlJsdDwCl/MrKoTBkdLsD79UQHuup33XsT2KPzBFBBSN+a1YCM+qFGJQnhYcSHANYSkTfzl+cv
	Adv7uenWaDmqRyHTpafpERjPGxqAhwP/5ql7HWOkU+hEYfajlhXpy7s/ZyVq8QrE2T1PL79VxUq
	HLzHiL9DNFCRFuA/yafCTmhc9at1H51Z8wDAph/U7TihaCYPbBTRUSTsnN07v7E2gu61oF+AqVq
	OP0IQzpD9JeDPFPcIDbJ/MLhvk1t+YHiu+tpMo/c7unD4aqFp08nH5YpcMy1zOBiZBgJjV39uzs
	rSchiLhtYyd91cglcMOUBzWAc20Hs6inUVFzVwtAetjbhnWGru+ZDWC/wfcyMWV9liLbGFrN2ZS
	nGQItmUL9ptsvQ=
X-Received: by 2002:a17:90b:57d0:b0:395:4de0:b78f with SMTP id 98e67ed59e1d1-39b260d28eamr20673725a91.1.1788643168166;
        Sat, 05 Sep 2026 14:19:28 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([211.230.25.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae60b48a8sm6947791a91.0.2026.09.05.14.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 14:19:26 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Donggeun Yoo <donggeunyoo.kernel@gmail.com>
Subject: [PATCH] fgraph: Remove unused FGRAPH_MAX_INDEX
Date: Sun,  6 Sep 2026 06:19:22 +0900
Message-ID: <20260905211922.1196366-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

FGRAPH_MAX_INDEX has no user, and it expands to FGRAPH_INDEX_SIZE and
FGRAPH_RET_INDEX, neither of which is defined anywhere in the tree. It
was added in that form by commit 91c46b0aa917 ("function_graph:
Implement fgraph_reserve_data() and fgraph_retrieve_data()"), which
introduced the current data word layout under new names, so anything
referencing it would have failed to build ever since.

Remove it.

Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
---
Found while reading the shadow stack word layout. The macro is dead in
both senses: nothing references it, and it could not be used as it is.

Compile-tested only, with CONFIG_FUNCTION_GRAPH_TRACER=y and
CONFIG_DYNAMIC_FTRACE=y. Removing an unreferenced macro cannot change
generated code, so there is nothing to test at run time.

 kernel/trace/fgraph.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/kernel/trace/fgraph.c b/kernel/trace/fgraph.c
index 40d373d65f9b..ed455b53513b 100644
--- a/kernel/trace/fgraph.c
+++ b/kernel/trace/fgraph.c
@@ -143,9 +143,6 @@ enum {
 #define FGRAPH_DATA_INDEX_MASK	GENMASK(FGRAPH_DATA_INDEX_BITS - 1, 0)
 #define FGRAPH_DATA_INDEX_SHIFT	(FGRAPH_DATA_SHIFT + FGRAPH_DATA_BITS)
 
-#define FGRAPH_MAX_INDEX	\
-	((FGRAPH_INDEX_SIZE << FGRAPH_DATA_BITS) + FGRAPH_RET_INDEX)
-
 #define FGRAPH_ARRAY_SIZE	FGRAPH_INDEX_BITS
 
 /*
-- 
2.53.0

