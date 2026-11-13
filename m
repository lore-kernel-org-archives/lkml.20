Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559889;
	b=IcsnHLe6TIRGczHTR00ZkG4K+33QuTGvTgQI9A+xZqEN3ms/e0gAUz+47OqUcNS81dZ2
	 bS8SP9Jsz4F+FRAfYK9nzjBMlVMYMadlXSmBDYFJ5XO6zLcwkeYCGMd/CywOQmVk42lb5
	 U9w6m5Ae5/ABA0gFSzVwmVBof0bWtmOMcG8Al9MW3xOtiSx9DtslGh9aty/jsXO6bzcbR
	 n31seMXIZk3XW3bYN1nleIKnRWM+uk7B22X9s5oZxK9nN8PRdeFMuPq3PYGByGfSEA2zf
	 l5oiEpTnVu+sjbzRYZCzcHm0ERb55pB5qwlVfTBJ1QyxGm0Os+KJuxVx1K3RlPmcw0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559889;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:In-Reply-To:References:From:Subject:To:Cc:
	 MIME-Version:Content-Type:Content-Disposition:User-Agent;
	bh=Md769LsMtNFDtvpBg7Ba+68YL18ytLzyTSc3mrMJ/dI=;
	b=ZHuA8T67Y87R7lo3iUT5mFQU4mPImVyYEE+BCU17D8mm/IfAn0aqND+9ZcZ24kT+D1Ml
	 RsubSPaYdAlAMSl9UYNWeVGP0Rmqz3TyOPI+dGQAMFR+M4qspC7d2hbDWRewW1NF3iza2
	 Tfh1czvPQKq7BcazyWTWC4T2zQk/NyjUFJEBx8mRjjnMh1FdONjAJxagWPGrGEgxMRCJl
	 D+MNbuq2/McvLwwFZXbDDgOtz6I8PwHwYZp2DHE76bCMOxA19UVKVBir96MIIds6G73hp
	 7mVn5RewH1Zf3+1Kau9TicKqUTuSq8WXy8DWhuUrbztydSLAVU2lRZMD6uBKJToEEBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=dKyQHG7e;
	arc=none smtp.remote-ip=74.125.227.138
Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811B7606CB01
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:51:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 811B7606CB01
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=dKyQHG7e
Received: by mail-pj2-f10.google.com with SMTP id d9443c01a7336-2e934c6c20aso7478075ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794559889; x=1795164689; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Md769LsMtNFDtvpBg7Ba+68YL18ytLzyTSc3mrMJ/dI=;
        b=dKyQHG7e36AfbdbP3xWgJ1T5mk3j1Zz7afAQdAkLhfmZUq6skcehaz3NG/QsgoHZpD
         G3hgalq5PQ9o0enPeskHgm3mVr1BKg4vjLcFE+/274UmQqoqzmgznMEAzLxTMwGIHRYh
         FvXiP6mXLB9oKFlqpSVIBLLE/Xhui0UbSyNXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559889; x=1795164689;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Md769LsMtNFDtvpBg7Ba+68YL18ytLzyTSc3mrMJ/dI=;
        b=RNODrx9zQPZz8FzK0o0zwNLqekwMN7ThgILNosJNA2MQYqBIOpGcKtSfW7m5E23fj4
         BciQ9H8TMhXaMVc4yuLWVItBs7pwqzWSWCYT0vDATVzseMa70Ad2VUalsi/fHxsOwv1C
         5k19mm/mGuDj3KDrnW0vlM5VJFeAxWRpVGcBYDLagVasYJDQbfoy16auzkhcWW91/Sn/
         GQ71hV6Si63lv9Ukky3Er0NSgp7Wkwaw5jl5oyquFrym7KNxfTWckFv5+7W2Pv04daj4
         SC/0tAPnuonaeyHCXEOhBpFGkSk8D1xaINbbWMpLQ/+QMWhey0Qb5YENbhZlP1COOUbB
         JWbw==
X-Forwarded-Encrypted: i=1; AL+hErFKwbRBW6N9gNu7LmeTv7nH8LVeeekBg7Xo/WemvJGpv2BrPnFnyBrtJmGjkPlH7TQsVhQdWcyE7n9EIXE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MNhEz4hcBXpTqPO6WyB6DntHQvfq8yHl3TaJCC/UG12LH0VZf
	xlxQYoMzHRvpaBjAiJex5IYSeRoDpGf5v/dOSVOnkD+YLR/Nl07LpSKgBXWyckRA3hI=
X-Gm-Gg: AYBFou2k6K10KcnXtVJ/GHySpPJc+bnii4F6X87LsYxsF2iMTtrM0U6ZVRVuOfqFsiO
	WHbGZizlpDpDRMHEzAioEaLiWPtNgf61fvLmgb2pOFqv+1jrv7j8qxN6wEAha6Uq0ko6vIO2FNy
	G6JWvVRdLg6K2Upj1DiIKO2cQhV0BXE2dyxkmOqxItHreuDmmtWQR9pH65YwXj0eI/l6vA1uksS
	HiNOJczy2Z4uh1OzACPl7/kmVv2No8jFvZeXppkCeHkyXzFgoZZ/B9/c9WwZsRkvn0w9RNbKX/X
	Qbf0Tm+9wyFNTlg4XG+W/xoUEXCUQ3X+D94iis4RoUIyDI4B1rmWx/Ejy0kggxTeTGDkn1y5Lvq
	Pp3lE6V6BDV9cBfNl6NSDJPDQcv022013APalFGh6GaFRO462v/eJr8h5Nh1Vk7T6for+a5PuKG
	ywXocjdBt2W4FOEB0og6J/gqnAxJqRr41yZjVdwa+RYWLMv/sYjxjRGjDhdhqNKDtwDVbK7jcek
	LIS2Hdqzbe75fs1K7vgVQmguPF6OPRnK5G2dKSkre8gfoZAkkofnCUGs58WXUXlnBoJzCRxUkkb
	DAPhkjBbxXDItanl3V4k5GflX3aIMzKRSmHP4vhcDVHfgnAGLfIark8qAXAQjr4Wn6q5dZTXZoS
	GEhbnBxwA6kT68nBSUAnK5xy2bvQ4bYOZ9qavucVAX72I0JLBKJgr32iFs63TqW3GTMfC6QfWQm
	wFPcWZtRXy1KyJhrZYNq4496L55DOAF2rgQECgDlX36zKJO4MhZBMw+sHtgP8=
X-Received: by 2002:a17:902:c945:b0:2e8:8637:5e3 with SMTP id d9443c01a7336-2ee0daf1004mr19821485ad.34.1794559888836;
        Fri, 13 Nov 2026 00:51:28 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee1c4d802csm2287965ad.37.2026.11.13.00.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:51:27 -0800 (PST)
Date: Fri, 13 Nov 2026 00:51:25 -0800
Message-ID: <25b5bf9a7ef115709f1149044824576e6f71e71c.1794506262.git.chris@chrisdown.name>
In-Reply-To: <cover.1794506262.git.chris@chrisdown.name>
References: <cover.1794506262.git.chris@chrisdown.name>
From: Chris Down <chris@chrisdown.name>
Subject: [PATCH v3 1/6] mm/slab: Enable SLAB_FREELIST_HARDENED by default
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

SLAB_FREELIST_HARDENED obfuscates the free pointers stored in free
objects, and catches naive double frees and frees to the wrong cache.
Most distros already enable it, and with sheaves its cost is small,
since the per-cpu fast paths don't touch freelists. Measurements also
show this quite clearly [1][2].

So let's just enable it by default. SLAB_BUCKETS defaults to
SLAB_FREELIST_HARDENED, so it's now enabled by default too.

Link: https://lore.kernel.org/all/auITixAJMfLtfa7i@chrisdown.name/ [1]
Link: https://lore.kernel.org/all/179312451613.474906.1475329637924619088@kernel.org/ [2]
Suggested-by: Vlastimil Babka <vbabka@kernel.org>
Reviewed-by: Kees Cook <kees@kernel.org>
Signed-off-by: Chris Down <chris@chrisdown.name>
---
 mm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/Kconfig b/mm/Kconfig
index afff1b25b543..f330c2c29fd2 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -208,6 +208,7 @@ config SLAB_FREELIST_RANDOM
 config SLAB_FREELIST_HARDENED
 	bool "Harden slab freelist metadata"
 	depends on !SLUB_TINY
+	default y
 	help
 	  Many kernel heap attacks try to target slab cache metadata and
 	  other infrastructure. This options makes minor performance
-- 
2.56.1

