Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794613960;
	b=epC9zQ8mwij1J9S3xzAP4jx657jDe8s7HSHGth3L2gutoJr6J+Qr7rRvmmmAOJdxegLd
	 nVbDLQPjH/55NVaLlD3XIIEmR3HyVi74XD/7YK/FpTWniTnVLyXxyWBEMdzuReEvLLTAy
	 xGYi2O/QMFRLtevEYe+JzzgfPkTroQI1WZIM1EHImBprp4LArPjGiMjvnbGab/LugXtR+
	 cOlNngede84vZo3kxeJlQq3IBO4u53dGYXRTWeGL41G/VuHpcE9NRL+K99AyOhruBgrFF
	 Dj6jHQGhAiM3iKJ3HqdicQEkc5DkKZ1dWfg0lcJE8Gi/rcemKAiz2By501GVwA9f3kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794613960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qsdtOD00VR6ePwSdlnMVKGKaa+UhD0aTv2SSqisGmSc=;
	b=hV0X3YFm1XvY7AcnPhYLCEx7x9UsCP9z9Zv+lNiGPfAI+ZAX41cTspJTRHsMQSADf13X
	 K527MCBiNDz+KaesBChed2Un4Jr/grKxiRnzMk+Vi9uJuYVG0eGzk6rl7BEKfttpoTJwb
	 WVjznigqF0URrr0fNVWdVu3BfRy8qknjLYT9ufdvU5qVcatB5W20tdiPZNzgKZJvU9Ml2
	 3hg/ppjy/vO6Kmw+qE21aWbueSRpE3l/rSBtTH/0len4+H2T04sWHwoFpsWJsRw1tQ41l
	 9pTDv2Di9cGCyMQxXUH0feIuSUE4DHt66CovN6njSb1RdtbXDzH7qfQwManirFnrn9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R+JqDvCu;
	arc=none smtp.remote-ip=74.125.224.52
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8A1606A329
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:52:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E8A1606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R+JqDvCu
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-67921b515a7so1704013d50.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794613959; x=1795218759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qsdtOD00VR6ePwSdlnMVKGKaa+UhD0aTv2SSqisGmSc=;
        b=R+JqDvCuEUlZAzVJOyCBaRFGcBvYk1aLOAbzHHPM4H3uQGxYDMzURieT9ZRvtYYx7q
         gR6z45sPXnh10Mf60WHCEi7IhEZCOUaGE6zZ1x5QSgGNaKGI0PXr4wE7FgiE7NXKKN6+
         1GkyU8i4fVOfjCDbDpPd672+UT5mwjxyeZYuF4Ak8pCM3LYWAPsKiz8wz5dZcnd6PSVE
         X+GuLCbqX6aMWSdUiNbusAXCoHlgu1pvOVqNInVy4gF3RUjks4JfYn6Hh5L05GBe5XQa
         rAfoPCfEMvtCz5r/n6yjWk0PlwVKtqez3EnQaupDTkP2njkj5rhj0ZJDTgNy8J0OR1Ht
         0jeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794613959; x=1795218759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qsdtOD00VR6ePwSdlnMVKGKaa+UhD0aTv2SSqisGmSc=;
        b=mtTY9SqNBVMDTLYuKYCG9a6VPLj55gdC2wsrDkH7a87QHqQdBffyxMTjU5Op20RayY
         V92FdZXHZ0Sri7IZWpfqxJ+cDskBH18XX1dUpyEvRa77he9o9swlYrJfka575DQLqAUd
         vM7lF6ePFXLb3orR2cv/vrjG7h/zOjE7cqphZDPtLqCGAAyj2mntdpHsdO49EXdZ/zTS
         MrWBxeJQHrbZw5/fzLYX0ylvpBJdCyofznqBQol62YKd8mvRVHobpm/I2HOn6clFS+8v
         vs3TA0QfgMud3r//ji7bdIugUEFwLIMGXFCIZNifMT0Z5WQR2uSouJ5XqwNHCo/MHREn
         ttBw==
X-Forwarded-Encrypted: i=1; AL+hErFaC0WiIDNHWME3hTLO8VFYeN/Fua4T5lkqEa4/2P+uYQ9GGF346XbPhF80UcaIEI0HNfgZJvDOTWqGR3I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wIONGebdGOrpyZDLBWkX14fNb/Rt4URccC60A/afrmJMVakfi
	bInTh+0JDwNkoAdrjDMHcC4wCmUmHwfLRW/0TkTMT3qrCjMsno7SGQOB
X-Gm-Gg: AYBFou3RAU9oNOzloEa3iaZI49H1OOqDyEgn5dKEo3rLox9wQfyTs0wNB262vYfLWVS
	qC84Rt/ig8CVnj9BtNYlKpJtziNX+4h5xwFaWyIgPwvDbeHqONmZGvM0wRG5fstli3pWKkOCYr3
	olqHL97ZJT/Sl6XLbErzqoQBvYKrhvHRdbTy2QXg4Ibw6jS7Bs4Fjt1glHtExdp3JHI1aAKw5Ez
	5/kzMCUc3OrHxFJ1kbmzcCzNK6AFaQcdopmGMjjjtHBPVjYkM8SNs36ZyBCcO/fOcJO1RmrBk13
	LHNvDiqftUjtZ6widSjJ3QuJxXE5Tg7unOX/bhzLZYkmhJj27dkdtANhKwO2wl2BJEAKVjttBG8
	lbXfCdWnykZ1HJqflMLtnS2Z8VBWwdkeM2zotqVr/iMk7PeuaK5T3fCuVvTcXJ9CGcpazM6xz+e
	3XkWYdWa6fVMy0AKz3ODDqzbEfYP+tI8nN7sYs4cegQnwzWM6f3xTMPXX+KboIkrj8g5J+6oca5
	dMzzh/0pxjggMZPiba3XoAK7U1DFILmf/IQYAEvoZ7c0G8WlP7bnuboQ+dlRP1c6PSW7foy5GAU
	ffHOwh4tpNrziwCZezthEW5KpoLKHpaxeCT3I0KgbIWC+6KJ0HS+UrZNV1NL
X-Received: by 2002:a05:690e:12cc:b0:674:1576:d1a0 with SMTP id 956f58d0204a3-67d8972abf1mr3144701d50.76.1794613959114;
        Fri, 13 Nov 2026 15:52:39 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:52::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67d8a5ea356sm3386767d50.17.2026.11.13.15.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 15:52:38 -0800 (PST)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Zi Yan <ziy@nvidia.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH 0/3] mm/page_alloc, vmscan: get_page_from_freelist cleanups
Date: Fri, 13 Nov 2026 15:52:33 -0800
Message-ID: <20261113235238.3595412-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.53.1
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

3 cleanups for vmscan and page_alloc code. The primary goal is to make
get_page_from_freelist a bit easier to read, especially after the new
kswapd zone skip conditions [1].

1/3 is just a nice cleanup that I found along the way.

Based on the latest page_alloc/for-next branch as of 11/13/2026.
Notably, there is a dependency on the aforementioned kswapd zone skip,
677dfdfad244a "mm/page_alloc: only skip kswapd nodes below their kswapd
watermark".

No functional changes intended.

[1] https://lore.kernel.org/all/CAN+CAwNsqWpPoag_XE6bxbrfi6m71xw1NS_wc3h_ShZjNspSjg@mail.gmail.com/

Joshua Hahn (3):
  mm/page_alloc: drop unused gfp_mask from zone_watermark_fast()
  mm/page_alloc: move the kswapd node skip check into a helper
  mm/vmscan: consolidate promo vs. high watermark checks

 mm/internal.h   |  1 +
 mm/page_alloc.c | 52 +++++++++++++++++++++++++------------------------
 mm/vmscan.c     | 22 ++++++++++++---------
 3 files changed, 41 insertions(+), 34 deletions(-)

base-commit: 3a99594e62fce8c646e8aac01d38af16d6833a40
-- 
2.53.1-Meta

