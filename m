Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559909;
	b=XGa+FehuIM5Hz30ho/wd0NGAPU+ffJeTAM3sTx9xYSrnbnZdMkLt8iUIaQAKj8w9NG8J
	 f1L8TxymAnVn0dQlKVeJiIKfQaUZQ2ug95iyTtkNpkqBLKf5K2mHomQOjMSJ9sVxRCtSo
	 h68OJy38Hb/DcIRkwtdwCNF2wiWKKdREuQ0JXLf3pNC1oEq8OID39OVz8aGkzXnitMeHm
	 r/oKkS8brihLTiPpaVuy27AgM/wOxoRXExzM0V0olTSk8Wp+MvmRPOvbrQ+GanfIWB8Xc
	 bjTkMi68kyfNiLmLl+8Cnccz6nswbDi4EHgVGi3FB7c5Ol3W16TyAnMKxU7NZX820qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559909;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:In-Reply-To:References:From:Subject:To:Cc:
	 MIME-Version:Content-Type:Content-Disposition:User-Agent;
	bh=lYzK3//iA/GrlqyqFKm7zb2MSKDdJnrLMa2XfcjD5wg=;
	b=Jz+4Dl80hmQ0YeQfIZdznZvd5/xPz+kBP9ve+/N0qUNViqg1O2pBwrrtSEuvFeIYh4/M
	 ujKw3GOUvdPs6Bo4t6cxHie5InXevMJCa04FdPeLz6YSOGFDh/88eUR5IwhTf+Ioja6JU
	 4I8jDzWVxeolhIWOfa3ya7M4y/z7ybOiVp9tljMOGgn4klg0eMacQrrDTlP0cQBW6RMCQ
	 /4D+aA3sT9k3qAJcv2tYHmSrkO7JTcHqENRQ8E6lfoe72co49VkMju/jlZ0mRzM1NOhpF
	 XMQNEppFghbrPY0UGcP4fr86i7BSms6rySiULLWYVDJS/a1K9AOlsYEBdiPVq3wzV2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=qAxpPyJV;
	arc=none smtp.remote-ip=74.125.227.131
Received: from mail-pj2-f3.google.com (mail-pj2-f3.google.com [74.125.227.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7229606C180
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:51:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7229606C180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=qAxpPyJV
Received: by mail-pj2-f3.google.com with SMTP id 98e67ed59e1d1-3adc0ac3566so193367a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794559908; x=1795164708; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lYzK3//iA/GrlqyqFKm7zb2MSKDdJnrLMa2XfcjD5wg=;
        b=qAxpPyJVdu3Eo1gikOQIp3VEgu6evI6bjx90G+83OTZYzs/tWWWCzokW+VgZygsbPQ
         /KQVTxfv1tD2R/lcDTf6g1dTBF3SL3in/BCuo/OPJ94eh/Lko7ICKpGWDq1/QATgDBjA
         xyz1+ZZxef3f3a4jG7EbDh5j6bYOucCm696vU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559908; x=1795164708;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lYzK3//iA/GrlqyqFKm7zb2MSKDdJnrLMa2XfcjD5wg=;
        b=24bdZBdFXqry3YkcYesaNKCW9Hl2bpVzR+pGsUoIBGRg4Mzm+wcTKwA0qGZC4idQ3Q
         Vhxcff9dJIkMKHoyVijTLcioEcZBfjp4Pc0LIRbAdMqqpcNPDhuzvDvBuIPxDGfiADG7
         jIHL3InZ9JcRu4pQ9BDfIh8ks8HVI75jExMtsC0mjf0WQ7fGnVenaWzvXL0t9Thx2tOi
         D9zAqYhlemB32M9wqynBH2HzIh+BJyknBgssgdU0vfyKSaEC+HTdw1Pvc06U2ob7SJ5h
         FsNoGeFMbomB3lSJP5HL/6kuFvWBLVkLYLhWO4Q+kVZjCLDrvGORXOt7Cy2Q2EUoHKzn
         53JA==
X-Forwarded-Encrypted: i=1; AL+hErFuWjAdPnuriKp8jPsmY4M6OdwveYjfSxg8gx08V4sBjk8AyuOFuNGhCjWkxam/UqLzVL2yWiGHkzni2gw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9TiTTmJI/y7sKHFFXckM/CrXzon8L4XLLh1xhSH2qDllbb0qwG
	FRMCGiq7ghwrVRV7RferiaW3iSckM1O3u2ElrAQgUS5XdEAsNT897lAgIE85zRlDHCo=
X-Gm-Gg: AYBFou0q2/FxPsnGKznV3xw0him+N6gr5QPMTJLQBRufBnoYF+fmjuPKQ8HBwdtyXTe
	mtUR/LrT9PCRClbzAi5n6vrROrey+hbj929IK3PAcPjGUd63NGWUh4LaPPOFLGnWRHwiKImqavi
	PsabvqTIHm+pYsLK04xjlIAjNxTZ4qYtzV5ZfiZNk0xb5mNMsjMSChU8KeHFti0T1dMoWk2N8sN
	mWOSBleGQ/nUru988eBlTDCjMMknb+R254vfrXh8CA6YaTcaBDY6+PwNyoPRbjtzC5v9+DU8F0B
	X2+fH1ZF312856AJmenp+2syFewAETjxp9KMqy+s4B+A0zr1JFtcC7JGw5Mov/XT4EsLlez1o93
	WAwJpKK9r5/JLogBMMeaeKL9Gj1URmnwiu82FxdKkgYQzdXD07CCfvBirZna7TebcZTSahZrTfB
	R8rUKfgM0zEPBoq3HwunZKmNHxvod3PG5U4iaU2x4Hh9saMJ4ZgCgPrOlqsqgyAldZRdDRo+wwR
	z/mhHWiizbaXSWRQJH0Ub+rFa4hCd6czhrL6pQzu3xY3UfQT+vunAbT15rDlISJA8hJWtAUWIwy
	EIn1vfymJQa9y1LRIxVgkkwDdOUwEthpzbLOqwC64uujwD7yIlh53Brkz9WP+GjsV+r/lbWY2fg
	cndQanxg+UAJrolo2SfPJ8Uc+OPRWpaqvzqEnVIQN/R0CKutiTmV9LJrVIdte9YGUBI4UFMdi4Y
	DMDAEdqu4OT34d4bxBaTcuVDlPCipw3y5JnXNIQ5N0xtudFKeXi3V1WlMVigcpPhIXs8wW/YvdE
	iARcCRl
X-Received: by 2002:a17:90b:584c:b0:3a4:b8dd:1447 with SMTP id 98e67ed59e1d1-3b1b0b5f9a7mr1634952a91.34.1794559907971;
        Fri, 13 Nov 2026 00:51:47 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d35ac2sm8778891a91.17.2026.11.13.00.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:51:46 -0800 (PST)
Date: Fri, 13 Nov 2026 00:51:41 -0800
Message-ID: <9a4caff0336c78a7adc746786c81c9c01f89c40b.1794506262.git.chris@chrisdown.name>
In-Reply-To: <cover.1794506262.git.chris@chrisdown.name>
References: <cover.1794506262.git.chris@chrisdown.name>
From: Chris Down <chris@chrisdown.name>
Subject: [PATCH v3 5/6] mm/slab: Support disabling KMALLOC_PARTITION_CACHES at
 boot
To: Vlastimil Babka <vbabka@kernel.org>,
    Harry Yoo <harry@kernel.org>,
    Andrew Morton <akpm@linux-foundation.org>
Cc: Hao Li <hao.li@linux.dev>,
    Christoph Lameter <cl@gentwo.org>,
    David Rientjes <rientjes@google.com>,
    Roman Gushchin <roman.gushchin@linux.dev>,
    Kees Cook <kees@kernel.org>,
    Marco Elver <elver@google.com>,
    GONG Ruiqi <gongruiqi@huaweicloud.com>,
    Jonathan Corbet <corbet@lwn.net>,
    linux-mm@kvack.org,
    linux-hardening@vger.kernel.org,
    linux-doc@vger.kernel.org,
    linux-kernel@vger.kernel.org,
    kernel-team@meta.com
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
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

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
 .../admin-guide/kernel-parameters.txt         |  7 ++++++
 mm/Kconfig                                    |  5 ++++
 mm/slab_common.c                              | 23 +++++++++++++++----
 3 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index c27bbe205051..91caeef33c3a 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3045,6 +3045,13 @@ Kernel parameters
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
index e602ebabd6e4..5bb6e33fab49 100644
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
index 5575706b8938..20b066d61703 100644
--- a/mm/slab_common.c
+++ b/mm/slab_common.c
@@ -781,6 +781,17 @@ unsigned long random_kmalloc_seed __ro_after_init;
 EXPORT_SYMBOL(random_kmalloc_seed);
 #endif
 
+static bool kmalloc_partition_enabled __ro_after_init =
+	IS_ENABLED(CONFIG_KMALLOC_PARTITION_CACHES);
+
+static int __init setup_kmalloc_partition(char *str)
+{
+	if (!IS_ENABLED(CONFIG_KMALLOC_PARTITION_CACHES))
+		return 0;
+	return kstrtobool(str, &kmalloc_partition_enabled);
+}
+early_param("kmalloc_partition", setup_kmalloc_partition);
+
 /*
  * Conversion table for small slabs sizes / 8 to the index in the
  * kmalloc array. This is necessary for slabs < 192 since we have non power
@@ -1012,10 +1023,14 @@ new_kmalloc_cache(int idx, enum kmalloc_cache_type type)
 		flags |= SLAB_CACHE_DMA;
 	}
 
-#ifdef CONFIG_KMALLOC_PARTITION_CACHES
-	if (type >= KMALLOC_PARTITION_START && type <= KMALLOC_PARTITION_END)
-		flags |= SLAB_NO_MERGE;
-#endif
+	if (kmalloc_partition_enabled) {
+		if (type >= KMALLOC_PARTITION_START && type <= KMALLOC_PARTITION_END)
+			flags |= SLAB_NO_MERGE;
+	} else if (type > KMALLOC_PARTITION_START && type <= KMALLOC_PARTITION_END) {
+		/* Use the normal caches, which have already been created. */
+		kmalloc_caches[type][idx] = kmalloc_caches[KMALLOC_NORMAL][idx];
+		return;
+	}
 
 	/*
 	 * If memcg_kmem is enabled and this is a KMALLOC_NORMAL cache and not
-- 
2.56.1

