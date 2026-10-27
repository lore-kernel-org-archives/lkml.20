Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793086576;
	b=EtJaaCRPff59KsOaqE1+vjJBHhAk1YiIHVgAP4GagojRCTCbHDmd4O8BgTTqJAqgx7bI
	 FDwleSf0CP4z54Cg0qglS2awPkOwJJSoTvNHkwc6Fh4dwO8L4rZ5K1wTxX1fmjGiIDQu4
	 NHHY5vmtespqRJn8GUAES+NmSL7pVvnIc7NbCxDn7bdB/Sb76zVB4ObqJJ1C/sz7QIWRs
	 hw2ZvRDQWVQX9/TYyTV52WcPnQzFYqmqRj1+zQM99FRFK6qpvwtXqu1Cs2bNcaPuj7S5C
	 JJrGLiFOHrYktSBLQ6WP7dPRBqX3juE+QKzpoEKx/tCZ1zixxZy7qv/1Qr3rhuztDlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793086576;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=dOacexIKHraWCg9yl1hlssxWGivRL2xIzkUcida+0nw=;
	b=CmvEDwXLXm00U/sLsElSnQ9PC+9BLJDqH3Qz5/Au4LUT2dx4KDlqxn4itu9p48OzgMTm
	 Wwsr9hcgq786rfMCkq2xloCw+TX2jgVlpKmAoYAELuJCG4+ithtY96oKa/RGw9Y1C6TH/
	 GVPXxQ6oCVgpoORAfh1RjTEZ0j8wOXlyGrjNNApBMdfLroXV7xX+WfBYK2sLQfM+osRTF
	 VZzntFdIRRYhrSw78DJgfUsmEJE93+5sLMKnBCmL+9p9k6PZzp5lLXWgKK+bSmMQ19oOY
	 QXQDkrcrwW73117oPNd7VWzblje2cdBzBQxQlpUzvWbX5X7cs8SG1/cgIk6/Y2XAZgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=M79mcIHG;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A9C60A2619
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:36:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1A9C60A2619
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=M79mcIHG
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ae25008e2aso800814a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 00:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793086575; x=1793691375; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dOacexIKHraWCg9yl1hlssxWGivRL2xIzkUcida+0nw=;
        b=M79mcIHGuHPL1m6cfk9iKqAoGpVCK2z7DNCA0lY6hiO5ngsUUYaEIXNrDLp6x5FtEy
         57XZ6PyeZmYRslT6UnKALitb4LNl0rsd1LJKUUQ/udMuod62deAlUV3wjhvQjRuyeYbK
         YuS1bUTyJeVf/gn28Nc6gDACb0NVuZ9RcHsYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793086575; x=1793691375;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dOacexIKHraWCg9yl1hlssxWGivRL2xIzkUcida+0nw=;
        b=hkbeJtPLjEZH/PmPMTG4uM0L11mg15D49BYOVBRHiItBgUnCPnit+3E1b+cEqJR+1z
         J3UIXNK0YaJILIIEce2UbnPkzX3r2NjqvUcdVObzKvFE4c1qFzdT+/J2zLd3Cw+WwdQi
         +vJmk16MgCNPe7/DfzpBJqNTTx2fubiCxyuvEJfw58NvvppIpw986XoJQdbRablKTugn
         LMdkcuA+DYPF1YVbyRyxh4OwKE831u+HXchyXAUumgKDG27l0SFyQD+NW7zi01GPGzut
         pvlrVft7ZdZtS9wHswhYrSmNKX4BWBx1V1uZGvc3LYioYNRkYwphs2HpmAAW67DunjlK
         52Ow==
X-Forwarded-Encrypted: i=1; AKwUvBx6JEEPX+oTPdSC66wBbYurcY1fJAoKN6DqoVYs8Y9EtSaFYM+L+x/R3FmMCmydK0KRNy4eeJMXidLdbX8=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3A2xfcAElb86UdkUFJ/iudU8zAX1zhvSRav3dcX0jmQxzyIXz
	+z3AILQToJ3QqX+t7+oZM1Wu3guANmOy86tuy9yWLPOXmv3X1Ct+JzmQ9wGkfdjL/80=
X-Gm-Gg: AYBFou3IziNjLyuPkVjGdC+ZID7s/BJfWvkzV14Z59p9Ksa61dzqGBtnfD+5y24synl
	Ivhae+pwo1KKGl51/i6ZY0wwcgeSAaD80Az2vYMfPfF3hR0PowKNtg46F5IayKUxjeYbocozLX5
	ODAlQDpJqtDST13tKvUPo3K2CQkw8FLvUAIzXrqaFiyLnFedh2iTI7ogLqDfUaPW61UsriatKq+
	yK5j2pEzrQjSoFzTz5OK+UusQ6m1NIIhRLV42RnXO43KyQ1iuZB51Tu8UfIQTpzkAMv5lsJAzQm
	idFYp+OU791umXj7ctW7srv0OGKYZolWzHp36DlqjZQNadJuqRMaU7BugCyT1RxrjOZBOJuaQ/B
	37CzDq21fDaiISQdLE/yA8PO1wTCZ6EybLU1YV/ZGbrhHgnemBrxZRlW8IJBlGtiMxngGMDNn4A
	scRGIehn2yyZb0IK5a9TTWAEHVVOkCaUZnN2c/eAOTwq5S2/Q6iO6ODPXier/QNBtKLLmBQIicw
	rofN6JGpEmq6q8U4ctl2G5FS3OTJXJTPB/4qU4ZwwmziIhASaScPj/+/5Z6eY7E75IXESmMaz4x
	+7tozMdo5jaQI94k5eYEFkcQkWMnZmIXKdxES+9VBjoAMA+hANu4pyLVv+Ybdc1W8BhVrbIfUCz
	tmW1eKCVrOcKlugyCLxwt3cQ=
X-Received: by 2002:a17:90b:48cb:b0:3ab:1b19:78ed with SMTP id 98e67ed59e1d1-3adea9dca32mr7453567a91.21.1793086575392;
        Tue, 27 Oct 2026 00:36:15 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae40472ed9sm2570983a91.16.2026.10.27.00.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 00:36:14 -0700 (PDT)
Date: Tue, 27 Oct 2026 15:36:10 +0800
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
Subject: [PATCH 7/8] mm/slab: Support disabling KMALLOC_PARTITION_CACHES at
 boot
Message-ID: <1b07254587060aea4bb296ceb10f80e09b46e95a.1793086056.git.chris@chrisdown.name>
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

Add a kmalloc_partition= early parameter, enabled by default on kernels
built with CONFIG_KMALLOC_PARTITION_CACHES=y.

Let's leave kmalloc_type() unchanged since each index simply resolves to
the same cache when partitioning is off.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 .../admin-guide/kernel-parameters.txt         |  7 +++++++
 mm/Kconfig                                    |  5 +++++
 mm/slab_common.c                              | 19 ++++++++++++++++++-
 3 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 20710d6ccd1f..9752bd2aaa72 100644
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
index ebdf14a87c71..12fbd7075705 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -270,6 +270,11 @@ config KMALLOC_PARTITION_CACHES
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

