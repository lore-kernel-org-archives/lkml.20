Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793254156;
	b=2jQkDQPO9kkez9Q/yDOZcoJfDrnRbRivgD41Gqe8DpsqFMJKpfYQydiG9gWvlxIRPY/J
	 SuEKR6iQOlrRttP3bEOvKENYNryptXr5JK07zq2IQE6m/kADPT+EoxLActkQOTeUFBqWw
	 PXDUqFAHMqjqmUqTkhV5lu/rGSRvih2NlETpqhQNtaSiCdYDYUgmw2tPEdt9ZRivK2ild
	 OeAur2mOA4ac5Zeddj9XsDe+tLlK9sqFtI2cu+DBbxNx73UjdE4r4EaSt0SCP1cHSP1Yb
	 mUB1vSXSLI0lDjReZQiyxHJnmCWh7WGMQy7QvOl6iFw6qPo05Gt/hlmclLhQvX5haXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793254156;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=TnENC99p6Lehtk+q2wiObbhSP6H/cGEPWJzdL6TBkdc=;
	b=RmWQ5Dgmup8jkGixX6V0VhEQ6ethzj4F+zLNcfM4pTi56eD41tuxD9kHxNrA9YPyjFuO
	 XBy9d/GL9yOxT1L1BkqnJLQ0AGWujBfPXVk9XII0gHfV2HVg4i+cMv+gs2IanGXZCxGgn
	 jGNYzTsgcp7QXmb4nhOBf750ydcnN5zGGhwT+DhpZ6nCQ8mat3PZMHGZpBQCckm3AiYcp
	 bW4AYumEl5MlWmzROVZu0hZrYpL6FN9AaJPuLTuBVtm0FZ+xk81TXdatiLSe+SxEwz8HD
	 tw29lOtM+Qwn2nRdOPTKyteNc8AEoe2i/GBauVlHFl4GNEmEBiDU/mMKXOdBXnAA7JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=G2oXuuMZ;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20ADC606A324
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:09:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20ADC606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=G2oXuuMZ
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc7d154ec4fso840955a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 23:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793254155; x=1793858955; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TnENC99p6Lehtk+q2wiObbhSP6H/cGEPWJzdL6TBkdc=;
        b=G2oXuuMZx27T7MTdteDxVRZzx91gBkxgG+OWKgozn9T+tELcU3T4zLqvl4C1Pv4YUo
         Q+L0vWHYoy6UEsBnfZNS30p440w5hc97l5DWbBQ/puezPRvYABOkSes28YH4SxkOAt6m
         VKZU4n3Rn+QkCH2ncZS2bwX4FWyeChexJBRLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793254155; x=1793858955;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TnENC99p6Lehtk+q2wiObbhSP6H/cGEPWJzdL6TBkdc=;
        b=DFVn250EsMLjuospzDCatCyQlwZ6b3b/7+8V2S5GXSVMnzLUky9THLmvpeGpIien1e
         XSC8Zfy9kXpY4MAioHdv18TdccV4C5NTpi+j6h4EdcgkwwayAcErdx1PgdejclLz9f0a
         lXgSORJhX1r5FH0tyOVlWkK4cEC+yDxYZOkiWSnQG4nNQBxVMlvHeZTxbINp9FE4FY01
         DEVF6wWI2P80ehF7ir+7G8qV0d+qwKFpYY1w4+qlu6G3QQh6ReyYJe6Yg7u4xhygAUuF
         0vV5ktQRw3dTeSM/q11zuOJWoXJ+18SRvUKQgdafXiOFA/mZxYFnmlbfK64wZVoUfaLe
         u+iA==
X-Forwarded-Encrypted: i=1; AKwUvBwJiPCMjTaqsixuiyJc7zT9giIGumUvq9xIrIirjB0ZwTaqo1vmv3NgQbVYaiVtcz+k78u6qllipXTA7kA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOt856O968WtgJgCPkWXrMKDowNj9vZsCheAdfSeSwEHlmaqbU
	yVBrvk5cSBp6bhst333M1/5x99FiQwuMvuvP9iMcDP4ZK6atgWYeRhFKOJhRkjSo9Zw=
X-Gm-Gg: AYBFou2RZw5ScLN+q+ykMnz8Ma/u9tLd2BR+Da4fZTtSAD/owYnqZ2pGcCLzeG1msjb
	lVVp7AWdtlpjBpZl2GDbzchAggigil6h1siIfwzK2IjczhESUstGuJxpyq8SfXUEc4W7pdG6ELv
	ydvLoU8c3HI5oB2LcXq9N2vYVEa3g8p9fkwDO5FMYvN9dSPybiuPUkMuN+17Fas9GmVneID7Ekq
	IgOHlXgXZiDA75eNxV80iPfV/wBdkmO6FWmLXsNUEEPcxDcPoJoCQgUBBarTPT73t2q6cmEb64R
	IsR27Ah7P01t1gpxmqBblNlAHf1jO0Qw/gcEANyCBPYD+COV1d/0p/NAvxboBO3kChzbA7JwjJi
	xjkH4vxRUjGW648RgKqRBv5O5YPFZZJ6/OSE2hLzFRf1e/a6Ozgf52z/X/ZI/Tl660l9TCDz8Jb
	z0tYYezGiFeU1rfBEnD8H4MVfltH9VGd5muXswNqmdVgT0IgChTCJ/u6EYZuKFgYfP053DvMtCh
	JzzI0VUxE+BVuIRUpvTC2t3rJU9r/nQHaDpTwQIwziJeM6IWLNvuIse7N25T7OfELb0bVYStowX
	ojXNQ2TEOl+vkZWfTRw7FQ4OdAICC6VLfDp+/EmrtISf9aH1oDtPdAJYe/8kxwXuNxhiMbHIsr0
	fSpzZFCnftff72rYyTIb5vyeLyb0WCgrWrvdybJM5i9/MhdCzsMyHBA6etYMHdcQw5s+5artf
X-Received: by 2002:a17:90b:590d:b0:3ab:2d46:1dd6 with SMTP id 98e67ed59e1d1-3ae57e401aemr3777671a91.4.1793254155497;
        Wed, 28 Oct 2026 23:09:15 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e7fe923sm2789462a91.8.2026.10.28.23.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 23:09:14 -0700 (PDT)
Date: Thu, 29 Oct 2026 14:09:09 +0800
From: Chris Down <chris@chrisdown.name>
To: Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Kees Cook <kees@kernel.org>, Marco Elver <elver@google.com>,
	GONG Ruiqi <gongruiqi@huaweicloud.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: [PATCH v2 5/6] mm/slab: Support disabling KMALLOC_PARTITION_CACHES
 at boot
Message-ID: <617bbfdce4fb2689c2510f0cd7f9adbb3ab8edfa.1793253633.git.chris@chrisdown.name>
References: <cover.1793253633.git.chris@chrisdown.name>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1793253633.git.chris@chrisdown.name>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

KMALLOC_PARTITION_CACHES creates several copies of each normal kmalloc
cache and spreads allocations across them. That costs a fair bit of
memory: Harry measured about 18 MiB more slab memory after boot on a 64
CPU, 64 GiB VM, mostly from under-used slabs [1]. Like SLAB_BUCKETS, it
can only be chosen at build time.

Add a kmalloc_partition= early parameter, enabled by default on kernels
built with CONFIG_KMALLOC_PARTITION_CACHES=y. When it's off, the copies
alias the normal caches rather than being created.

Let's leave kmalloc_type() unchanged since each index simply resolves to
the same cache when partitioning is off.

Link: https://lore.kernel.org/r/179312451613.474906.1475329637924619088@kernel.org [1]
Signed-off-by: Chris Down <chris@chrisdown.name>
---
 .../admin-guide/kernel-parameters.txt         |  7 +++++++
 mm/Kconfig                                    |  5 +++++
 mm/slab_common.c                              | 19 ++++++++++++++++++-
 3 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index de2fd6963a16..6633a553a79c 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3054,6 +3054,13 @@ Kernel parameters
 			Configure the RouterBoard 532 series on-chip
 			Ethernet adapter MAC address.
 
+	kmalloc_partition= [MM,EARLY]
+			Format: <bool>
+			Enable or disable kmalloc cache partitioning on
+			kernels built with CONFIG_KMALLOC_PARTITION_CACHES=y.
+			Ignored without that option.
+			Default: on.
+
 	kmemleak=	[KNL,EARLY] Boot-time kmemleak enable/disable
 			Valid arguments: on, off
 			Default: on
diff --git a/mm/Kconfig b/mm/Kconfig
index 48078c1fd26f..b90b3915fcd5 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -266,6 +266,11 @@ config KMALLOC_PARTITION_CACHES
 	  limited degree of memory and CPU overhead that relates to hardware
 	  and system workload.
 
+	  The partitioning can be disabled at boot with the
+	  "kmalloc_partition=0" kernel parameter, in which case the copies
+	  are not created and all normal kmalloc allocations use the
+	  regular kmalloc caches.
+
 choice
 	prompt "Partitioned slab cache mode"
 	depends on KMALLOC_PARTITION_CACHES
diff --git a/mm/slab_common.c b/mm/slab_common.c
index 9fe48da12010..5391149a2eed 100644
--- a/mm/slab_common.c
+++ b/mm/slab_common.c
@@ -781,6 +781,16 @@ unsigned long random_kmalloc_seed __ro_after_init;
 EXPORT_SYMBOL(random_kmalloc_seed);
 #endif
 
+#ifdef CONFIG_KMALLOC_PARTITION_CACHES
+static bool kmalloc_partition_enabled __ro_after_init = true;
+
+static int __init setup_kmalloc_partition(char *str)
+{
+	return kstrtobool(str, &kmalloc_partition_enabled);
+}
+early_param("kmalloc_partition", setup_kmalloc_partition);
+#endif
+
 /*
  * Conversion table for small slabs sizes / 8 to the index in the
  * kmalloc array. This is necessary for slabs < 192 since we have non power
@@ -1013,8 +1023,15 @@ new_kmalloc_cache(int idx, enum kmalloc_cache_type type)
 	}
 
 #ifdef CONFIG_KMALLOC_PARTITION_CACHES
-	if (type >= KMALLOC_PARTITION_START && type <= KMALLOC_PARTITION_END)
+	if (!kmalloc_partition_enabled) {
+		/* Use the normal caches, which have already been created. */
+		if (type > KMALLOC_PARTITION_START && type <= KMALLOC_PARTITION_END) {
+			kmalloc_caches[type][idx] = kmalloc_caches[KMALLOC_NORMAL][idx];
+			return;
+		}
+	} else if (type >= KMALLOC_PARTITION_START && type <= KMALLOC_PARTITION_END) {
 		flags |= SLAB_NO_MERGE;
+	}
 #endif
 
 	/*
-- 
2.54.0

