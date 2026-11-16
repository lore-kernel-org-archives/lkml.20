Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870414;
	b=mwDjSzDILc6sU9lHS6ODPaUT7013aqsfGFwahRB9FFRtDyYm3xdqwj6uEMO1OYobpHoW
	 VwYpIEunD3bQfeDqUXpi2ZK/hQK8veucEAyyxgGbezQ2Q0PaHXKAP2bVs6A4dck6VvElU
	 l3wljS6TuYwD2JXGnL3FgZ/11mea23DwKv5EfmdM42zt64QIm6czpvHkG7IuiKk1uIdsX
	 Ahmyi8ARngRUd/8Td3y6qjiNlm9/DqwtkAMMaKUK4RLF8NZuLZwu+uN5PeEAxHPc98gGC
	 DDFXCHmP13vk6XgS2Mymo9RyrkHlxAL/itomah7szM3EO+OB1leN3r72iyZPwX2FyIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870414;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AjhVL/tzJIhPQa9pnWiA/Lzn5A7WcpHhkbmWbBd9Z/A=;
	b=cu7WoY7lrqo+pQtaCqhRRNelg7kNj1NwQz2WQS/RydJwLRSB/GsRMYN9BzyVpE55jBsR
	 Yc+z4Cm9hs0K+DG/OrWGjUfkNH/x3iY9iqqxP//xIMr9yKy8LOj6Eht0FSn0sQPpgb4pS
	 sBlF1VhfH4/v9o8oT4VS4/qXchJMotBQJRoQJE2fiSotIcX8qdqkcJ+DQ2UbltWcgo9VH
	 EPT0SzgE1MQVEo9vlSDTXRklRILSV/mwpby1vXEUot7+r061ctulL1OqSXUw2fAlIkRet
	 Rsta6gUzNhelFB+TDcCTSJh1VYhNBLkNa/Ed2c/iunUsRpnSYbYWcG6saXv/j+NBZ/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=OEasZFiC;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB2360A260F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:06:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFB2360A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=OEasZFiC
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8b5e147f101so405793b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794870413; x=1795475213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AjhVL/tzJIhPQa9pnWiA/Lzn5A7WcpHhkbmWbBd9Z/A=;
        b=OEasZFiCCXd7n/M/UcduiXgq0vhYk4srVVnzKHpXRqoD95nlXtUP3TeLNkX0JweEo9
         DxSjeVsQyDj3Vhdhc9KfpT8C8oXNfziWnGdNY++4B+7gzbqkQMK37k0UZd5fFUA9gqnx
         UyWgZrw0eNM/Fg/dLZoy8VwoY7prhxICFZjNQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870413; x=1795475213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AjhVL/tzJIhPQa9pnWiA/Lzn5A7WcpHhkbmWbBd9Z/A=;
        b=kGBu5+snErDTjI7vFkA4tz309aOF4pIDMSLtYhdex9cu6s5UqzAPxq3r918XW+J+XW
         68JAbwGbYc0b+M/SQh08FbF7NDPb+sWM4vxhJ2yO0sujO4GH0CK+1q7W7nmukOx6CPh2
         XYkUmWgwABLV7BMNeCzOSFVEuUAuJYvLjj4BNFvToZ4mXd75w4SshfpG+dMyvzWM44r/
         W717APKxEbUn6IT62HmnsDHfjV+QXER+gHZE5EtZ1b7tTiKWZsIVtreuwMcPGd3rTB3O
         zpSosy1M7MzElzeHsEOwu6MCi6i6wm+wQyWX6hIzYZsjQDjCZBRGKmbjoBJDIdeqbIDL
         bhMw==
X-Forwarded-Encrypted: i=1; AL+hErHEB0uxhjXg0p184yvBrDSHR1itDpTu0lU2wWEzacno/CvH4hvchxhpGNCG7r19iAKpz7jGaXo/S69BcFU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+44Fjf78bWms640rnfGeU89C2XZNOfS4Yop4Cf/X4pEN7sAoLN
	F9MRuaiuXj+4iJUyVZDjBen/HrK8iT3Q+2hJwaftZK10/XIrVwB7x2hjG6tbM/KbNQ==
X-Gm-Gg: AZFdTZeljMCYgzcGo1uGjOR99ILJ5MuCVNEYaVecHs93vqBS1GWB0cKIz4M8cr/A1xi
	Ju9ApmPQowAb9H5ikn2RCJ5MQnnwE6uCKl8kGA3Z7kfOPgq/YdE1/g4mioXqP1f0ZzTW4TDT5sx
	/SanOyxRAqKDJ1LeImAsggBaYrulRTh8GInyaDfnBFO7aP+SEImbvX/uIokREodq4J7b4YGsGZ/
	umKa0vKbzG0UIlQEVfRr1K7wc9caFtDS+svvJd5Xs4P/PViHJN/TfOstStZ9N+NAmgfGBTIE2++
	9bK7zwC3WL5mk6KTfO3qhG3hR5oxbbkOREHehF68ccFecwD1sBiA+tQcJn6L3lHTJoqC9P6Ck8s
	BTT89XDLII2UvdJAp4s2wt9c2WjCx8qfMm7srrvj6FFad+27KP5v/R4+fEVHyBv3OO0GK0k64aS
	erw6Z5IzbaEaYAui5zk4xQ7e+2FkXj/BvxOw6JOzvzP6L3AWNaAspXueY1zXKhfAmzrdHbQJSUZ
	GLa7WQh+yX8A/qGs0+YClH83lUSrYpry4qWYUzTX4f3V+3HzCWyxH+B4O+zIGoyz6tR/BUCtDRP
	HXvg5ACytLMMSl1XZPNhbIcBmcyNGAiYbU5zxrU9tHp+ldk/sH/2/GetZOhSvpw99pQH+mk=
X-Received: by 2002:a17:90a:9f98:b0:3b3:b15f:eb89 with SMTP id 98e67ed59e1d1-3b3b15feeb1mr322004a91.1.1794870413060;
        Mon, 16 Nov 2026 15:06:53 -0800 (PST)
Received: from localhost (221.247.125.34.bc.googleusercontent.com. [34.125.247.221])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3b3abe8b263sm1120450a91.13.2026.11.16.15.06.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:06:52 -0800 (PST)
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
Subject: [PATCH v1 3/7] kexec: use GFP_HIGHUSER_KASAN for segment pages
Date: Mon, 16 Nov 2026 15:06:23 -0800
Message-ID: <20261116230627.3537051-4-jeffxu@chromium.org>
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

kimage_load_normal_segment() allocates the pages that hold the segments
of the next kernel. The kernel clears and fills them through
kmap_local_page(), and they are never mapped into userspace.

Allocate them with GFP_HIGHUSER_KASAN, so that they keep their KASAN
tagging when GFP_HIGHUSER starts to skip it later in this series.

No functional change: GFP_HIGHUSER_KASAN has the same value as
GFP_HIGHUSER at this point. Build tested only.

Assisted-by: LLM
Cc: Baoquan He <baoquan.he@linux.dev>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Pratyush Yadav <pratyush@kernel.org>
Cc: kexec@lists.infradead.org
Signed-off-by: Jeff Xu <jeffxu@chromium.org>
---
 kernel/kexec_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/kexec_core.c b/kernel/kexec_core.c
index f4a31565c447..a3abbb6a2d75 100644
--- a/kernel/kexec_core.c
+++ b/kernel/kexec_core.c
@@ -839,7 +839,7 @@ static int kimage_load_normal_segment(struct kimage *image, int idx)
 		char *ptr;
 		size_t uchunk, mchunk;
 
-		page = kimage_alloc_page(image, GFP_HIGHUSER, maddr);
+		page = kimage_alloc_page(image, GFP_HIGHUSER_KASAN, maddr);
 		if (!page) {
 			result  = -ENOMEM;
 			goto out;
-- 
2.56.0.611.g1030f0b940-goog

