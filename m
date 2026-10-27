Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793086554;
	b=HFtrYptMgQ635T3l0WQE1j59iln17YhJsSscXcifcbQKx1PrEKL8xI1UwAQ+CZKNRpO1
	 B6iPAZd3S/r5y/oZ+HMawI3/EL1Ks+gs6HabBtxdBLAx6mqzERF35AFYJZ+apYmRvI4S9
	 FGqfRTxeJzQGAB0WNbYzlcrBJnZ/sqcGvxh84uFjamYqd/WE+wp3bQxhdb0lEfL2w+J9R
	 iS2gYVS8R6YkfNmpM+N6CX2+zqxfmXnQ01t9j4U8Fb73C/MA3NWDzyYIgEddU78pmDBM2
	 b6lmXrm5ULgu4kd+LEdI3vYRcHwQzi+awRYJX/WLkWHe8nG057BK9QTs3z5iDhs8NnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793086554;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=aAleu3PFDaaloUL3fp9TR8UUZq+CL8OXKyhY9njoszw=;
	b=PXhxWr+nwQzllz2LoLRIl6Kg5VaZ6bSUuIvn8dGMQlNA41l5pIX0Jvj5nS+7bYxjeOE4
	 /Brt4OZYxptvemFKpkx+fPJfBg30Li/+P2WXgjNxgQ25eOaKSdS4D+VZ4IYzCwnbjW+3j
	 YUMKAy3iPWdW01xDO47c41jO90p0MKzpe74k8it24SqGeMrr6LF7FHHYSTFC15P+FcUaS
	 0VPADq74HUOk8psCAxMzC6cFxBblO/3Y5PoTPPfuWWoMUQFKGMc0A8BnPIaaW+9g18kNe
	 D02yKUiIyKYc/JEJidP5CLMOW3e3fSIGSScpop3KHOohQoJBjU9yJKZVIGeKmhA3wdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=UA+RMIvd;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991CB606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:35:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 991CB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=UA+RMIvd
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so2049595a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 00:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793086553; x=1793691353; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=aAleu3PFDaaloUL3fp9TR8UUZq+CL8OXKyhY9njoszw=;
        b=UA+RMIvdJDiDPeX/NjNZrP60ECVkNVdz5unnwoSR8k6neRC99YxJu+tZQ4l6XDJul5
         VKBgjMwFh83zsMth2P6QZMjYAHPFZX1UPTpIjC2sJZXYGp6DhJfmFCQFWoup7+5G35oY
         TzxKVGL7soDKtAjYzTb6jCNU3NgUnmMzEe9ss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793086553; x=1793691353;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aAleu3PFDaaloUL3fp9TR8UUZq+CL8OXKyhY9njoszw=;
        b=IugwbLIH5Ash8DeWbFWsAfSjScYf/J9jfwKUBNMj7zQS1jZksJgQtJy5A2ZSmCR7xy
         s1xLthLyXfuVwpFbMzZlmJLoLuzos/EdAdJENTQ8dBubIizeV9rj3O0uJBl0zIo7NzPp
         CBfoRsOao+l0EVoaB9Kfuc6gM6Ja7CVfrHhl4kCEbfCxJn19FTzAUSeBkro9EdJD1noW
         8E/Iqr9juM8orHT/35ZS7nYB8Kul5+1F4607GGCcBe9Pghc0UNqzYroUYMc5oVuHzzhV
         TwaKzIvK9cwW0dAPEsGNZ5rtlRacmx64KGhSt3m90HXJ1Vhx7NEXAiopW8d35guiEJCc
         aupQ==
X-Forwarded-Encrypted: i=1; AKwUvByXOmEfYm2tQUhvlYLhQaBZM/To7ZVy+BCSzuWu4/guWbS7UyW7mbkTLgldOh+t4tte2iY7wPqFSBlXyPU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQCs65Sh+L7GbPuidaoD2IfTttQQrrxNxyEEYKkR4kWjxibKfv
	SL5WYGURx+P2ALMgdAa9CPWTp8Zvz0GTZY98OA3m53wpd3rLhpjRXWVGliWOs7Ke9sM=
X-Gm-Gg: AYBFou3xpvz+e2QkBFOzK1WmTDfZTF/yaL5UBIWs9oDELBm/XpfEaw9JMl7KkHnIow6
	4COS7c35HO2lNSsS7eXBRhUr/GBkwHAtvln5WGBOm79ATl1FFC7wWIaXAzoZ8xD56RQsgdgkcBL
	Z5PHlIOqh3TBCUnKjatrX5pbY4VB3O4Utsm+hTep/khOwfNi4n97mopC1MWL00qkAlxs4lAQp9h
	A9XXqEKAW3y6N64KDQF8e3NqUC0HG3fY1DTRfJ2bEbJfXXqMdiOP1COkzHNCj0AbqgbH3+vyozu
	Wdlxuk+x7psEfT5cz7b2lhzxOXaN91X+w2axQWYLWmBCLvP5e/U+HnKE6C41JMx3H8b0EPZmCOf
	YEN+Bdu9cAB4Dt+1k/2b50xR70tFyoF7NrLN/JL9ufhglmfYTG5jz6IFLrdvNRyAOCGk2+NwQve
	oBXGm3X0JOC4ybl6SWSxl3gyAltLeRcovWurRHfbme2rRqJxd3V6p4nKH/ni3J5R5wvEbxZXdZS
	d9nJnzdIOsK7Q4tbT1oln3X0Z2LkezTDj80Vp+lUpZrv+p8tW3o+DAJIr4MWAm94NKiuynP9Tw3
	MEOVt5uMveLjmNvfEGdHK0LaCiM4xTquBH1FF+zN8BdhkQEz8KyS+kWUof5YtPTLSoG0zYW5yVH
	H55AWSlB3ENFw2XqTBwa/9IQ=
X-Received: by 2002:a17:90b:1652:b0:3a7:82ef:bcdd with SMTP id 98e67ed59e1d1-3adead4f65fmr8276505a91.41.1793086553098;
        Tue, 27 Oct 2026 00:35:53 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae406506c2sm2520384a91.14.2026.10.27.00.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 00:35:52 -0700 (PDT)
Date: Tue, 27 Oct 2026 15:35:49 +0800
From: Chris Down <chris@chrisdown.name>
To: Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Kees Cook <kees@kernel.org>, Marco Elver <elver@google.com>,
	GONG Ruiqi <gongruiqi@huaweicloud.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Kieran Bingham <kbingham@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: [PATCH 3/8] mm/slub: Support disabling freelist randomisation at boot
Message-ID: <58f32032f0f5f3828322780aca1847f1cd80cef0.1793086056.git.chris@chrisdown.name>
References: <cover.1793086056.git.chris@chrisdown.name>
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
In-Reply-To: <cover.1793086056.git.chris@chrisdown.name>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Add a slab_freelist_random= early parameter, enabled by default on
kernels built with CONFIG_SLAB_FREELIST_RANDOM=y.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 Documentation/admin-guide/kernel-parameters.txt |  7 +++++++
 mm/Kconfig                                      |  3 +++
 mm/slub.c                                       | 16 ++++++++++++++++
 3 files changed, 26 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index ddf2f6fd60be..5c4d784e7786 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -7021,6 +7021,13 @@ Kernel parameters
 			without that option.
 			Default: on.
 
+	slab_freelist_random= [MM,EARLY]
+			Format: <bool>
+			Enable or disable slab freelist randomisation on
+			kernels built with CONFIG_SLAB_FREELIST_RANDOM=y.
+			Ignored without that option.
+			Default: on.
+
 	slab_max_order= [MM]
 			Determines the maximum allowed order for slabs.
 			A high setting may cause OOMs due to memory
diff --git a/mm/Kconfig b/mm/Kconfig
index 3ae97fec9946..56c422684b44 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -205,6 +205,9 @@ config SLAB_FREELIST_RANDOM
 	  security feature reduces the predictability of the kernel slab
 	  allocator against heap overflows.
 
+	  The randomisation is enabled by default and can be disabled at
+	  boot with "slab_freelist_random=0".
+
 config SLAB_FREELIST_HARDENED
 	bool "Harden slab freelist metadata"
 	depends on !SLUB_TINY
diff --git a/mm/slub.c b/mm/slub.c
index de4937fcb293..7e9dadda3d10 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -3424,12 +3424,23 @@ static inline struct slab *alloc_slab_page(gfp_t flags, int node,
 }
 
 #ifdef CONFIG_SLAB_FREELIST_RANDOM
+static bool slab_freelist_random __ro_after_init = true;
+
+static int __init setup_slab_freelist_random(char *str)
+{
+	return kstrtobool(str, &slab_freelist_random);
+}
+early_param("slab_freelist_random", setup_slab_freelist_random);
+
 /* Pre-initialize the random sequence cache */
 static int init_cache_random_seq(struct kmem_cache *s)
 {
 	unsigned int count = oo_objects(s->oo);
 	int err;
 
+	if (!slab_freelist_random)
+		return 0;
+
 	/* Bailout if already initialised */
 	if (s->random_seq)
 		return 0;
@@ -3456,6 +3467,11 @@ static void __init init_freelist_randomization(void)
 {
 	struct kmem_cache *s;
 
+	if (!slab_freelist_random) {
+		pr_info("SLUB: freelist randomisation disabled\n");
+		return;
+	}
+
 	mutex_lock(&slab_mutex);
 
 	list_for_each_entry(s, &slab_caches, list)
-- 
2.54.0

