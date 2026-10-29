Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793254082;
	b=nu92i0UUid1uxQCAOvAsvNPXmoRNlnzIJkGzL17HffNWmoBCFTwOZe8DtQnHZx4u3qjx
	 7gWMOTCpcmK5ysnIYSQp4zYcX6jmTVpYfPgG4j0WBfZtxyjUtGAeikJmOnEbsjFqIGAEi
	 9EXccJWBoHf8L11EeyekB+FzEw7Xg3bvmKmQSgp6xlMga54Sd5X2QQq0sJXQfrg+lqLvH
	 sha7a5KlQVtpSm1o8j1UUz1RVr5qC2m0jK0AjdoJdUAUMx+p9m13ot+q5hBi3WWa4USNn
	 KOtGEqBEIGVp6g8OVAM9Edds2qNNqoyxA0DQeCcG2VXDj8+wctUfW6hJuCYLInW/y9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793254082;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=KIyRNW6At3oCihbJNccAaO3bWJ8LNw9lR1egadV9gDM=;
	b=UeliQnXQ+DCuTFEWx9OXQQPlWEB7piVSOcco5Fe93uzzrMb048h4vSLdoQr7nFZdCKXC
	 vGz+78VBLcOMGb9q5tID80R4nRb+zPDPiEqGdimmOOie/IRJhFOhKgmltdYAEH4Od0vPz
	 aQZZPo8pw1mycUT85u/PWJmjkZ542dYTYUgYkcB7GWiZyLLwhIM7gglIr2CZ6wXzHBSlb
	 Q1oUQJOkToWFCiiLfCaOdenUiMuouRyOZp8SBARLO/CUd9rMGQFVNsQwSCQubcSQmAkfr
	 9xy1XbawJpouwyfHY+qtpTdLoFXWKa2Wb6MGVkYEGpTTBroHxtXFVbViOewfurDfkcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b="I/xnC8+n";
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11294606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:08:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11294606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=I/xnC8+n
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a07078200fso912014b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 23:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793254081; x=1793858881; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KIyRNW6At3oCihbJNccAaO3bWJ8LNw9lR1egadV9gDM=;
        b=I/xnC8+nPsymSUHPSCVMndHbMjYrHGaw/y9W97v/V/2TNEsAbBBtCC0eACd7C6iOiB
         ASuuEHniK+dy6GiylaKYvhwWBE9+sneWyYMdevPhbS4Ji19fDeXXk1rT00IZNjslxLMk
         Ei6Ot5AsDmBrSOlXrS725Y2BufoI2xfgpZUi4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793254081; x=1793858881;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KIyRNW6At3oCihbJNccAaO3bWJ8LNw9lR1egadV9gDM=;
        b=UoKiUM2ApRkoj2EfLZgt3T7OibEXRHevAeNdvYWA2Y1oM3G8Lb8F34YtgyQqAj9l1d
         Yg33liFh925zr/M/HtXoMOrjYYZs58TKeIdfyAhdgfyYNxEnZJ/O8QcDlVnbd0kWfAgl
         fkv3YqeVwwiW1fXMdOCS3bRdbN8RI9i+F65T8i+HI6mWD8fmGJPH1nikBuYSkX/15l3P
         HY3G2IYy/co4KCyw9EYAarQ+msVApxZFEaUrewyCrDOsF3rhyTVMzpppHiRXFvICY/kW
         wW8GlBuhhlabanHG6DuTctdigHPcAaQVqL0s3yWD6f72vIE01t4xDdLX+P8WSUWtPpE9
         rZjA==
X-Forwarded-Encrypted: i=1; AKwUvBwF5kBO8aDrPCYCGBzot0wZAJR9MnWJTSmVFWcxcjWYgx9igVrpP5bLRe5TR4eyFevuQZCcuH4ivvsljGU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLNxvGTvCXC+ACApqeeP/i3tVHpwWu1hlzRWaA37IzyY0Qyf08f
	fHEa5T3lD1s3b2n74Ttd4u16bt9B7uQ9pCwpadxSrzLLp6qdgjAQxtgdb20+ntzuClKz3KfMI9k
	dTdRpxqtMV8UB
X-Gm-Gg: AYBFou3oFWErFKmuRScb7BhjF1DbTYiilg2kcn6LSObTOVB1LYRlIXmyzIJjMAzGaYu
	PAafaQQmslNHLzpWmjM7fltgmSk2/MMDzGBdSiYKEzcul0dBWxGLs0u4sRbkgeXZ3ZrcRepGMWO
	yvscWwr1PMRDMuGvGekUxKHU77Im9GEpDmVKZR8Xbl2F9Z/RAbXydpn5rX/ay8HLW/1hv2fDn6X
	JRdQ+y6nNU4q9s6qXJGRZb/qmC8xQGu38aVC2+E1OZ9JUyxbJLigppaj954aP+Q8RjnhlV4UNS6
	Yq9YwmxPKfI6kJ+dpGOJncHJwDEuroEcUFtxpr/PdNeuGbxzNFsleRUK5oDVi48p69uNryXoxnH
	ILxd3hHT4xgEjCrsSfHmjtW6Zf5vWfRfhot9QJpTtk5f4Dm8hfU397Ox/0vHB+D62t+j6+JMWFT
	6SzmxKKGoFl+i1tcgIRTzIzahy9s1aek1XdfOaVIWfsZy6LYAtYJViVKJ0IB6+iOrzRFcvfQuLf
	cRbqYrA2rKBqcDPrbd66JBYtB6Hmj9qQ+08iUfZPjLRxlCSm1gbFF5HaQ4tgwU5hRI0lMf2hJ6t
	PodHsl8ZyKwMmTAkMH6wEvCcl+uILFT0bNd3S8D0KCYPJ0n1vwm/g1inYY9zunoVWzCajGNjolm
	RDfBUdVa5gQJWTmt4H0ZhfR6+kQN0WsVERa/PSd2rAxcWLrZzDLNrookD3XZpWcs1zkHI+COa
X-Received: by 2002:a05:6a00:a0f:b0:886:5f48:3fca with SMTP id d2e1a72fcca58-8a6e7dc9293mr3736944b3a.37.1793254081351;
        Wed, 28 Oct 2026 23:08:01 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a3d5bd6asm1861640b3a.4.2026.10.28.23.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 23:08:00 -0700 (PDT)
Date: Thu, 29 Oct 2026 14:07:55 +0800
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
Subject: [PATCH v2 2/6] mm/slab: Enable SLAB_FREELIST_RANDOM by default
Message-ID: <6bdc161bd869ead04b3b9a651ef6a83882ecbea3.1793253633.git.chris@chrisdown.name>
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

SLAB_FREELIST_RANDOM randomises the order in which the objects in a new
slab are handed out. Like SLAB_FREELIST_HARDENED, most distros already
enable it, and its cost is only paid when a new slab is set up.

With it on, the same system level benchmarks didn't change measurably.
Allocating from new slabs does get slower, by up to about 30% per object
in a microbenchmark which does little else.

So let's enable it by default too. SHUFFLE_PAGE_ALLOCATOR defaults to
SLAB_FREELIST_RANDOM && ACPI_NUMA, so it's now built in by default on
those systems, but page shuffling itself stays off unless it's enabled
with page_alloc.shuffle.

Suggested-by: Vlastimil Babka <vbabka@kernel.org>
Signed-off-by: Chris Down <chris@chrisdown.name>
---
 mm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/Kconfig b/mm/Kconfig
index 17d017e8fbef..92ff97ff24fb 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -200,6 +200,7 @@ config SLAB_MERGE_DEFAULT
 config SLAB_FREELIST_RANDOM
 	bool "Randomize slab freelist"
 	depends on !SLUB_TINY
+	default y
 	help
 	  Randomizes the freelist order used on creating new pages. This
 	  security feature reduces the predictability of the kernel slab
-- 
2.54.0

