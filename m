Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793254050;
	b=vt4+I0bB9L1fkfW3xYuMyRa9zgmO6bahQ/BL88TOg/JvDnT3rYqf4SWA1t5DTErJrKiR
	 08VbqQx/mZOIMrlnDzpq8KkU6+i4pmwQgkO7/NDEbPAp6xsphfkpxAG6XVWAekpwPU3X9
	 pWe45VWUrep+AmKyQvaRrYElgoumXEti+2KKCKDgmvOKkKhSUzzdaJQ/atbdYX8/JR5dZ
	 hwp6Fg82HUmOLDvJZb8+eRwie7owEUIQ/AkJXttilTVsfBOMTFtlvR/3EwFZin1lcGVrl
	 2eMypIT3nUXSVA68Me66R9xVomykXlXTsdmCgwNDr+AakSZz8ovx+ntyp4hFP2CABdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793254050;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=hEvr/hVOQ19MxZAsJUGrC+tPSerEFjUvPXYsJLofEYw=;
	b=woMwfgk3GlYBGICpYmoX5mIvM0eNBaRxsBEYb9nLMAV5Hvt4VleTENuEktGGqdFvQlQw
	 Bfz/hhCDgHHgMwBiYq9ZseiC1azqf8MzIpVjZ+AL0ZNB96DVlBDCdoK2RbggMCwHqMfgO
	 Ke8fMmB7457qjN8ryECXT5T9mIA+dsM0tMrVI4glvspHOIi5YRKzjkwU0+nptWH2Q6wQ5
	 z//lt59+KVGSbwwCUf60cp1IwYvoK71b9GSQgatMwhjVDKa57bebOKoWpXsZOW2nwBwDD
	 355zdnKZ8IQOhQ9l2Wj91YDEnPZ6oAJNReHewAotwVA4vdz3AXnSJky8musXenZDtpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=wKCE9Rr2;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1036606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:07:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1036606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=wKCE9Rr2
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e812e2b31bso10305995ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 23:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793254049; x=1793858849; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hEvr/hVOQ19MxZAsJUGrC+tPSerEFjUvPXYsJLofEYw=;
        b=wKCE9Rr2pHlg9Iej+EfB+fHQaFD30y8Iu8WDDxhTeJdE6aGYQr15Q+KLHymc6gwlN6
         vnUYvr5t+AMhOlR3QljtofN6FTegQofX5SyEouR6+99oQOyuIqA9sl/VpQcNHMItuuP5
         mT9VUR9wnudDopJMD8QrpR63eOQSWHSbUp90w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793254049; x=1793858849;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hEvr/hVOQ19MxZAsJUGrC+tPSerEFjUvPXYsJLofEYw=;
        b=DfzBAik9ntScEJHkXoJyx3IZewcyZF/HtJ80LArvSbO2Q5BoBB0ycE0Kl5O0uHrhw0
         lC7LdZFL0BISPa9lxbLJ3qvbpozD2XhmPYrNlD6NcfY4iR8vtDA2QnhLS88MCAX+Fu56
         2tPJh3Ph/VYQuUGX22gl1COIykTlv192LK21twtl+lJ8w2PJZdRHpQWHTp+0I8Sc0WPI
         5NZaKppicQAAD9izg79rR8PisK43HVGaxH3zh452OxJ151l53SuVs5oeAnUGdbf7ws/1
         etPydyHxrBxS9nrIlDIVWWU5iiE6Rkf7s3YgBZtHikxyY6SFoOuMNej4CbLAt9eXeNwA
         jboA==
X-Forwarded-Encrypted: i=1; AKwUvBxl2pI+PJV/XOClmEu8Dz0w943Uf8+t/O3gRVUFZ1qOWESd35vjTPcKbuwUrjkTmZyuaFR8AEZSFgzosJo=@vger.kernel.org
X-Gm-Message-State: AFq9FYK59kkmNyhW1KIJjOw2dH543J44tvAGF5Uvw7bRXiWkyXKCwTDJ
	PJm9YKSsQEBVNUjbR/23L7V1EjyG8aJyL9SukSrnRcv3NdQuPKyEYDQWzy4Q6VL0yYs=
X-Gm-Gg: AYBFou3MPM3uHUQm1EMlVRUIrQWMwO3krONG1Jh89heUw7z2g9LIYOJ9u90qG5ZiRfG
	iGU2LXwjzFOi+66YKTxRfzYv0WcFn88aEiMjWKG9A9sT8WXa67+KLePmKzgqWHu8b2+QvygNa4Q
	olULz6GYflyXz2VAIqytPUhIYfFM4UbXliZPlek5E1RnHsEVDs1XelgDN8tbeGZaMqg7FjUkdPZ
	u9TRIZDl2UekPz8A8V5FYd++zMhWINJNz5hItG/MmML8yQNS30rBwUmRI7rosS3GVZkvQwpphCL
	P37CzOpQhKbEnULgTHPCtRoyBczc5zuYusE7eP+NR1VYbvHYduZ6SSOLGultcf124lYTqOPybP2
	XDgooFTWD/GmG32DvJOhSiPEXGSn+aZVKNkuOPTA76WixESjrzdLnoQjeVaD2faExH2kCeRN8Oy
	y9rvDIy33viUZPMT/Yd96f3dYBofavS5q4VnUybuYxAVA4zf8HM1S7c5o13biIXIGcpK85Dk+5k
	JCgk9YII9HJQpt8/CXTsmNgydAhyOn2ukAIPOTk2vex49CWXSlpqc7v0o/W+ziXEhhSgSQWxOtx
	yoCm0bwIHM1MuOrPcvYMxPoa6mJE+hRjekU264h9NvAOQ8QOEokj0q5xL3HzMosnHEddDjkns/H
	aM3BcgwcbV6Q1vNHrvf+nRxqe7/05Ud6fX62SqreP0tcHnEj2njOpwYsLTVIZslbuDYQerYLR
X-Received: by 2002:a17:902:e545:b0:2e8:2d05:9780 with SMTP id d9443c01a7336-2eb0005dca5mr43806985ad.8.1793254049153;
        Wed, 28 Oct 2026 23:07:29 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6b79ce2sm28521545ad.21.2026.10.28.23.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 23:07:28 -0700 (PDT)
Date: Thu, 29 Oct 2026 14:07:22 +0800
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
Subject: [PATCH v2 1/6] mm/slab: Enable SLAB_FREELIST_HARDENED by default
Message-ID: <2ba9dc862607d70050bbc86fce0091de2e23c023.1793253633.git.chris@chrisdown.name>
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
Signed-off-by: Chris Down <chris@chrisdown.name>
---
 mm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/Kconfig b/mm/Kconfig
index 604c58199acb..17d017e8fbef 100644
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
2.54.0

