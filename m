Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792509585;
	b=l/cZuwLoxIaUAOyqMbXHIQdtS2ugSu1q6ZBGjOjzj5BRvhKlormHwUxcbAykcHupCT53
	 QUfhVTxYbZfU6YkGbrbYTUYjfN1X3NINso3I3v5bZd9UvobQ/qER4RQbV2iWFXpO9aw5H
	 Mj5TvtLyVyXXU5cxcafYTifbrUk0pbOua815rap00rw/mgLb18q5qycpiwwrcE717xbRw
	 /TYP6uZ8mrKW0Qf6sELRUgfuacCXMs70+h/3Dq6kQcvF2hJKqHVOBW73Gra5pQMUuJ6xv
	 XDaNRK+VRS/ZMjL+v8TMcJrKEISCtlLvLIByDQTYGGTW3MyoXVrTtjKWT96KIwwyqYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792509585;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=EQYvwkMnfu+WDRyfOhAk5xxSPl+eH8WAQuJdlRRhiZE=;
	b=3cBm65E2k4Lp1IiStvXD9sjsQ5Pw7uqdLk+qE/gkTOasTe4vfWmM027iInbf81/buaNz
	 8rWNNRLaoq+lsePi6t+s77xHviMAsN9B4w4SkBhSoZ/Bp0pO0BOWrTrZYbfdow0WUjqAR
	 sHAzXSarvUgDjLwqJyqkrfym0bofZc20CdEENWrMbvKbPY5D/P6j067eZwXS5XRG4BPF7
	 dth+X7L6I7lVAhdpxHNKeG6ABkeLA0cQDkiZfuGzdiesdjakh0TZjDCVaC+ddFNMPU3tc
	 pUAwdfsPLLdUdOUcHTX5Pj11nDZZ5D7wBrTBc8h9eAFwnj0j8G7sLV3R8Jfy1pXV4iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=elOylE67;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82720606A325
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:19:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82720606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=elOylE67
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-881269371acso385032b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792509585; x=1793114385; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EQYvwkMnfu+WDRyfOhAk5xxSPl+eH8WAQuJdlRRhiZE=;
        b=elOylE671FpYPFqd/y8nLw9VsadwwT47Kg+iRfXDgMFTCtriwXTRp1fTkSkCjiKmGV
         oZypjRWDYk0PzitNTdZ5pPRRkiNH/TK+jr1C8Ifm4akGuMsehZCTYV8IImHaajn74l7A
         PDQTEt7PPz2CM+vb1q/KmC1rSkK44cmvjN6E7qHTnmJGpCIEWPAKr2SHt+rQlLCCBkLy
         +OBdmK4BIJ/93KFrWzonjE0+wIe3q7rYAf/AhNr5dfzdqC/PS/5WmiEoRflfaNoaDz1v
         QKswNAkg1kOIfdvHW8z4BSaN5hrIlA4W5sH06uZNeUTI0M4rUs3lM1ZZqgrbWZFwgFhV
         0JvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792509585; x=1793114385;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EQYvwkMnfu+WDRyfOhAk5xxSPl+eH8WAQuJdlRRhiZE=;
        b=1X2JsEhCoTSCMcKnHojomVBrZXvrAgT5r8lwR8FEJH5B4tieFn8f9aG7lteaMkXqJS
         +torvROcq0UTG79oP7Ogc/jzgXFKD4Qrf528jNR2KKBTktC2KgfQ23LIwFju7hGa8sgU
         ejigpJLFkoUZn+JweE9J7qJ4B4vH3CK8RuJyksuMPcHJ3N5PRP6U7V3WP0usOLcogTbl
         sncmPCL0/9TLAsUH4QbFYp/bTQTRoz49Ga5VFWERJ6MjC/FsUcX5IN2iLBRt4lCLqU86
         fCxjvd+1Xm3AiZK6ckxZ0KSUunfIe2jLdY7cRBhrPtxGRvarvK1fSTAncKLUS0O/pgMT
         N0lQ==
X-Forwarded-Encrypted: i=1; AKwUvBwSJ3uMv/CI+7jDpljHLNrgpeZ0+X6QUL990WQ5KdaiHG/f8T954KRyCTIldK6j44xlsmw3euWeL1Ib1QQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIB2Imo1FOgIg+GFEV7QBJHPxXk3lT3N1MGf01QIcZp/v9ry3Fu
	dOubp3Fl5QrPM9pkN8J1ttecrKlHtKCCP6Pm3mU+c3Y0kc0hgRH33MY7
X-Gm-Gg: AYBFou3LLZyMmDF00QE7F3MuEcn4VbzHGKrEvsHEZJ3Rjugj9Ui/gQ33A8QE3g6QJLA
	UrC0T4YkUBjqjR5dJ3AUq66lIE/zHasZ4qLUIQtzMTm+acMFBlmKqQKkbmUz+fnYRPrh1Gw4rfC
	ARjkwxJqrLaHQW/Qpjq99VjWgMafnutMU+FOYrO+X+pEBEPBtFxjHwFQSxe1y7DZbgyLBZXviqT
	DVh7lKv+t37FEQewkni93jBGTkmcupR2uqMCtfEAYoziBIsyMEbWmWCs7gNEdvdN63CXL/tV/4O
	2BvZfDR569SjZH3XHhlBarXVMgnmCwUsN12EoyU0OBFhJAjJVq91JeAIiXnyeRPY5ENCA5qc7Rq
	phUXMv+oQNt50iFJ14LkltPHEUdZKHY6Zl/MospF3RqGDMJ56vbxel/AZSdgHMVLwJMSyOoTkEq
	hFlOYCIDQMSQQc5HjuvuOn9wAEhtOHpVPNTWKG43v+ujq/cq8nyPIPKZxOv947fD7WW48CwBhlj
	umK3E7rnC6apS5cerjG4qnkyj8Wd2I260ygSSb7hzz75R40nZz3iA==
X-Received: by 2002:a05:6a21:4584:b0:3e1:3734:63e0 with SMTP id adf61e73a8af0-3e26fb99eeamr1595875637.41.1792509584766;
        Tue, 20 Oct 2026 08:19:44 -0700 (PDT)
Received: from gmail.com ([185.220.238.37])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f56c89b97sm4994338b3a.12.2026.10.20.08.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:19:44 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: "Gregory Price (Meta)" <gourry@gourry.net>
Cc: Kunwu Chan <kunwu.chan@gmail.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	kasong@tencent.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	baoquan.he@linux.dev,
	baolin.wang@linux.alibaba.com,
	hannes@cmpxchg.org,
	david@kernel.org,
	mhocko@kernel.org,
	ljs@kernel.org,
	dave@stgolabs.net,
	roman.gushchin@linux.dev,
	stable@vger.kernel.org,
	Kunwu Chan <chentao@kylinos.cn>
Subject: Re: [PATCH] mm/vmscan: reclaim every zone in per-node proactive reclaim
Date: Tue, 20 Oct 2026 23:19:29 +0800
Message-ID: <20261020151931.885951-1-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019185002.3428594-1-gourry@gourry.net>
References: 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, 19 Oct 2026 14:50:02 -0400 "Gregory Price (Meta)" <gourry@gourry.net> wrote:

> user_proactive_reclaim() limits per-node reclaim to
> gfp_zone(GFP_KERNEL), which is ZONE_NORMAL. Proactive reclaim serves no
> allocation, but that limit makes shrink_node() skip every ZONE_MOVABLE
> folio, so writing to /sys/devices/system/node/nodeN/reclaim never
> reclaims a node's movable memory. A movable-only node, such as dax/kmem
> or hotplugged memory onlined movable, reclaims nothing and fails with
> -EAGAIN.
> 
> To reproduce, fill a movable-only node with clean page cache and write
> 200M to its nodeN/reclaim: the write fails with -EAGAIN and the page
> cache stays. The same write to a ZONE_NORMAL node frees 200MB.
> 
> Scan every zone, as memory.reclaim does.
> 
> Fixes: b980077899ea4 ("mm: introduce per-node proactive reclaim interface")
> Cc: stable@vger.kernel.org
> Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
> ---
>  mm/vmscan.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index e82ba737c028d..90f7a7bf4e426 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -8180,7 +8180,7 @@ int user_proactive_reclaim(char *buf,
>  		} else {
>  			struct scan_control sc = {
>  				.gfp_mask = current_gfp_context(gfp_mask),
> -				.reclaim_idx = gfp_zone(gfp_mask),
> +				.reclaim_idx = MAX_NR_ZONES - 1,
>  				.proactive_swappiness = swappiness == -1 ? NULL : &swappiness,
>  				.priority = DEF_PRIORITY,
>  				.may_writepage = 1,
> -- 
> 2.53.0-Meta
> 
> 

reclaim_idx = MAX_NR_ZONES - 1 is the right fix — proactive reclaim
isn't serving an allocation, so gfp_zone(GFP_KERNEL) needlessly caps
the scan.  GFP_HIGHUSER_MOVABLE would also work for the node path
via gfp_zone(), but that's indirect.

Reviewed-by: Kunwu Chan <chentao@kylinos.cn>


