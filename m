Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870412;
	b=ulzV/y9rcdpkeZCFE7WWOA0GP9LIuth33FBVf9pcWRio2vmm9UlsoI8QnBUYRYodEEjp
	 PSQ15+qA0kkCPn4xDbuZPRAvc0sVboeM9M2GwERQOqpp//h42dCZY0as9o/M3Fnt5GP+n
	 FZMwzmpucPKi2NQ9vtRqJhTEzF/3xXshyUixvWmfdiGk9zOZ8yoSUWJiCfPjGtB9lxtP8
	 jxqr359eXCxG2Vxsl+HSsVFhMwwB+b/S1nmehmiffSryW3vttnCOzLrlJaKrqAxr2lOyH
	 jLik1g1wQ/gu8y+KgfIDZSCCrsJy/ikkKzI+9uPdV22E1OB27ft+KGU+dk2eqRhOfvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870412;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=04YMYN0F09iXpQbtyDGXKPSGIzq5fh/Gsn7Dty8ViAw=;
	b=l8V9EKCfdHxS3BmUvFQEnTdUL0LLzZlM8C0IGM3sId8ehlhJffwI+Lghbf4gtr7oixWL
	 GEZ/EC0lXC2UQGJK38GOIAr0Qwke6k6MILzM1/o2TM09o38uL2KuquIziapEyYcS9FpR9
	 h/AqbanJ6UhPHP/QgZT18et10/mPQBNnm2TuNZLHSKHreN+RDYfazdvIZCpZybj5Al7kp
	 DspG/rmaLEt1W+XpOHP0+I+ACPCQEdVuka6mXk3RhoM1atuzjrNc3XmA00EF1IAfLLyP4
	 161YfW+6eltn8Rn6MNMbduEOISP4hxd04NZL1gIj68VuPhQHdwB4vZqbcuZFdkOus6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Vw4q3+7J;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391CA60A2612
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:06:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 391CA60A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Vw4q3+7J
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b083afebe4so728131a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794870410; x=1795475210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=04YMYN0F09iXpQbtyDGXKPSGIzq5fh/Gsn7Dty8ViAw=;
        b=Vw4q3+7J0GTgcSWFxg4Zuev6Td1Csd2F1YArOtz+EmHp+gxPgNOgtp4qGE5OPD4j8d
         8kMC/9FQsVFuqTXrWeUl/o210OhRp59ba5RQZzU7CkwS6iWkfFaXLl9A8QIJBFxoY1SP
         bjUYPHwoaCqN1KjkM+WmK83bXCgnxSkp1hmfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870410; x=1795475210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=04YMYN0F09iXpQbtyDGXKPSGIzq5fh/Gsn7Dty8ViAw=;
        b=MpymEOzr/bs6WvA4q21lRdusD2088TaA3j+apEj+acT/UbGxJ0iCjODBw3qs+qLWBS
         OY25y+DwTiP8Gj7LZCB4j526J+0mJ/F6QRDIgdhWaTqWnpIagCYA4rE7Wvef+rhdZH9Q
         sfMU5sMEZsHGs16hBKYQ+X4dBtlHQFvJ3sDPRzmv1aTkfD+zQ4QQoeOkQyWZnWL9lfI9
         BjZOoPHyaXuK4+lTMEtkmF9KnRLr4jwHh6kkw3KCKjM5Qzem/bLVRfmV4IzAV92BtiAL
         WtGkmg0OTaC7qd+ZoRKWEYuwGWA064TRZ61Jws06FdART1fjJeucn3v4IpZcys/Nz+ta
         fP/A==
X-Forwarded-Encrypted: i=1; AL+hErFUIuHybfAwVVhG8svQLgLqaYUC1HszeFGmGQtXhXCTTWDeH7pA7B1LMLtygfCxpbA4ynRVqKSlm/l2C5M=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dwjAh5GGjSYS86IX6n3W7YCjxDiG0kIMthOOeV6O1aC9FkjTs
	UPHsrNM2LPtYvIEMuKq6xXWl/GjqwlNyRMl9NW/k7RW8acnVa1LYsgJMI1ZKVJBlXw==
X-Gm-Gg: AZFdTZdbY8IDPCFj4utOkdEI8Y3eDuaM9U1haQYkqaTis7XOr+y3qqudzo6JdpZf4Lo
	DHSJrrgSKyDJarsayKSv/ZULl7p9P0Z96Tp4zPlFT7A8tZnABnvcrz8pXQBNM1Lek5S7jw4mZ09
	O34GXp8i0/RctqH6wDsRxnRtJytQo2Dw1re3P9whnMWsOR6urjop9QsE2l3cV3E5LGFrpkHZSGf
	WHpN3p44QkTjWnPH8fuB4dpMSS9MOOSZVHO2hzyaLVQfeu4fRKmiah38gO3wYJmMStmRwrpDrqC
	XiWrWQmCLM1U/fk23AkXf9oHACeHZeUo5FGLV7HDR7Cad5tYDig/Sdbjb7Z3NkFokI1zsnAdmO7
	371Tkw8W4z1HGFyQvM6l/qgOuVhaqHQE7/wiKpecBQQXg5szkWYjRixyXg3POgjzdGrGsyNZ2x0
	lfemp9asE5Z9s6zfTOWpuSAmdjTKHJ5PcLGTMngQRNgB71JEtCWd6o7oWxTiG5UwDFuEWSEttJF
	QU1VgSRZSPx58Jen4xSEB5BX1+AZ+vXDJ3xOtYsa1uZtSm1v5nbJs8dTs5wL7lEpNVtryk7k/uU
	xHRjbvRQR5I2XofZnGSzNOJ/7OGdKCoFKi2phvZTC0H64RdW1SLp2OwQECRxgKqihekz5WI=
X-Received: by 2002:a17:90b:1650:b0:3a0:c162:51af with SMTP id 98e67ed59e1d1-3b1b05fccc2mr17699416a91.0.1794870410469;
        Mon, 16 Nov 2026 15:06:50 -0800 (PST)
Received: from localhost (221.247.125.34.bc.googleusercontent.com. [34.125.247.221])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3b3abe8b263sm1120355a91.13.2026.11.16.15.06.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:06:50 -0800 (PST)
From: Jeff Xu <jeffxu@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Jeff Xu <jeffxu@chromium.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Zi Yan <ziy@nvidia.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Marco Elver <elver@google.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Chia-I Wu <olvaffe@gmail.com>,
	Dev Jain <dev.jain@arm.com>,
	Evgenii Stepanov <eugenis@google.com>,
	Ian Rickards <ian.rickards@arm.com>,
	Jann Horn <jannh@google.com>,
	Jeff Vander Stoep <jeffv@google.com>,
	Jeff Xu <jeffxu@google.com>,
	Kees Cook <kees@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Peter Collingbourne <peter@pcc.me.uk>,
	=?UTF-8?q?Pierre-Cl=C3=A9ment=20Tosi?= <ptosi@google.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Tomasz Figa <tfiga@chromium.org>,
	Will Deacon <will@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Baoquan He <baoquan.he@linux.dev>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Allison Henderson <achender@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-mm@kvack.org,
	kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	fuse-devel@lists.linux.dev,
	kexec@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	rds-devel@oss.oracle.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/7] pipe, fuse: use GFP_HIGHUSER_KASAN for pipe buffer pages
Date: Mon, 16 Nov 2026 15:06:22 -0800
Message-ID: <20261116230627.3537051-3-jeffxu@chromium.org>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
In-Reply-To: <20261116230627.3537051-1-jeffxu@chromium.org>
References: <20261116230627.3537051-1-jeffxu@chromium.org>
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

Pipe buffer pages hold data in transit. Pipe writes allocate them, and
the kernel fills and drains them through kmap_local_page(). The same
holds for the page fuse_copy_fill() allocates when a request is spliced
from /dev/fuse into a pipe.

Allocate them with GFP_HIGHUSER_KASAN, so that they keep their KASAN
tagging when GFP_HIGHUSER starts to skip it later in this series.

No functional change: GFP_HIGHUSER_KASAN has the same value as
GFP_HIGHUSER at this point.

Assisted-by: LLM
Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.cz>
Cc: Miklos Szeredi <miklos@szeredi.hu>
Cc: linux-fsdevel@vger.kernel.org
Cc: fuse-devel@lists.linux.dev
Signed-off-by: Jeff Xu <jeffxu@chromium.org>
---
 fs/fuse/dev.c | 2 +-
 fs/pipe.c     | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
index 3641abb90d6b..fdcb11679dbb 100644
--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ -1044,7 +1044,7 @@ static int fuse_copy_fill(struct fuse_copy_state *cs)
 			if (cs->nr_segs >= cs->pipe->max_usage)
 				return -EIO;
 
-			page = alloc_page(GFP_HIGHUSER);
+			page = alloc_page(GFP_HIGHUSER_KASAN);
 			if (!page)
 				return -ENOMEM;
 
diff --git a/fs/pipe.c b/fs/pipe.c
index 4fa69192e6fb..87792ef63564 100644
--- a/fs/pipe.c
+++ b/fs/pipe.c
@@ -155,7 +155,7 @@ static void anon_pipe_prefill_and_lock(struct pipe_inode_info *pipe, size_t tota
 	}
 
 	while (n < need) {
-		struct page *page = alloc_page(GFP_HIGHUSER | __GFP_ACCOUNT);
+		struct page *page = alloc_page(GFP_HIGHUSER_KASAN | __GFP_ACCOUNT);
 
 		if (!page)
 			break;
@@ -201,7 +201,7 @@ static struct page *anon_pipe_get_page(struct pipe_inode_info *pipe)
 		return page;
 
 	/* FWIW: This is called with pipe->mutex held */
-	return alloc_page(GFP_HIGHUSER | __GFP_ACCOUNT);
+	return alloc_page(GFP_HIGHUSER_KASAN | __GFP_ACCOUNT);
 }
 
 static void anon_pipe_put_page(struct pipe_inode_info *pipe,
-- 
2.56.0.611.g1030f0b940-goog

