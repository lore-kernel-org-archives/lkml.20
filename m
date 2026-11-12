Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794500496;
	b=yL1tXpDPNV3JwrPApMimR3HaqNy3qHqgP+ukSsax8f1CQHHDDL9AaBLS0JdJD/fq1oO6
	 wcle2NF3wLe4u5debsxPs0H/+eo8fDHAR+SbV+UYYCQoLQGjCH2Dyo0CM1JqoBjaD3UN+
	 +tjXiQqU6Mec+9S4CkPWzSaWGR9Eii6dFBMoJ9p4zeXahJ4e0yHV1nFS6u5SGcK4krcy6
	 5keur/C8GhqtbntTE3/ys4HAlzOVXnpL4LqjS9uixbODls/9/jHCTirkmGOh9dkj8QcIq
	 tmEYFvWiQI+HsaFFbIkWi/bRINs6+JpbXmAxwB0cmJsYLBFR+OggDYYDLoP/xP+HhfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794500496;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=FvwIi9PGGXoQsiA6+EZQf2O4ZXu7pd1RUjro27vdlbw=;
	b=vhH5Rz3KKxbI6jVclscsZojABqYOHITVy/SUTWAmHxgDphuQUU+E9+LedXeMghUBwDbm
	 Mi7ZiNhaF+rEpQutz1JY90Ek/plHE9K0ZDIIRp2vzaBC0PMlre/IIAnCPfVKAirgId5jb
	 n6rKdZZXAVFy0unV3j4IYsjjc3JlGRy0IyczIbsMRZKsW6Xo0/uUjK5olx+w3XJHS1nR0
	 EsaYlRggRRUTgo1FgIGEOGL3ld3mQdokh8vvcAUHaWZaX7bh9HrZEManBlc8vIxKvh17r
	 vitjC/hZ54hB4Z4yvZJWMUv8STsYwSisPDlb9Hegywmd5Ck8F3zG4xDESGyLYldw8bA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmpxchg.org;
	spf=pass smtp.mailfrom=cmpxchg.org;
	dkim=pass header.d=cmpxchg.org header.i=@cmpxchg.org header.a=rsa-sha256 header.s=google header.b=t3lZoFQx;
	arc=none smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F249606A884
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:21:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F249606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cmpxchg.org header.i=@cmpxchg.org header.a=rsa-sha256 header.s=google header.b=t3lZoFQx
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b31261e8a9so585407b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1794500494; x=1795105294; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FvwIi9PGGXoQsiA6+EZQf2O4ZXu7pd1RUjro27vdlbw=;
        b=t3lZoFQxr1lPXxTLA82vL4akkgK+Z4i0FUrPphDOtx6gufFLDAaYP3+1+qy4qFJu0d
         1csIKW51+ABMI9QXz4cRqb0/odu3azYJGU3hSav57uyWcT0KHa3hHILLarZASw9WZii7
         b//fowF2YKcFx/9lezoZ3Y+vfjTGtbXOnv021wA5HCp/FeT0dHJFDjWaTcORPxD8TTSr
         xw2L1xQbsNMswEbyL3SyHOq9gHlti4LaSBFi/0Myb6VryoP3Mq03D5WASMBaKd9rNUPT
         W8kovCXoVvP8ZwN6sLzVJA+W5kc+yUgkTwDNfnND/punFpEHYiWZoYtQCYM/wzg7CFHO
         rd1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794500494; x=1795105294;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FvwIi9PGGXoQsiA6+EZQf2O4ZXu7pd1RUjro27vdlbw=;
        b=E7LitcsNOkjwVGhbhI6RXGy+xftmLWJt9tOXx/V7evAyeyJW7qb0f06ejTZnaYEVPN
         MdZTneGtfHlqj3+Irj5Y3ALHEMSpizqIa3KPPHb+LtaucISef0w2Ja2jMGYNoi7TcENv
         JoZkmitzfg6KH6hz+OgZzHzN2M+5X18uw2pKqC5g3lKy+IwJueD2vLxxmARAZPZoqyE/
         SSuANoYYEB16GYkD+buTxTJEB1MXrimg4hkBKvtEeCWkHFvQxUlEWmyNTpPmly9gSv/7
         D8sKvijJ6NiT+30QSsVsD/dupOIez8OwWGIu3DhPEAVMbYfWEOlHPw95ovLADtGLiz2E
         kTMA==
X-Forwarded-Encrypted: i=1; AL+hErEM6il5B9CnCSXYXf6oX+V2NkrQ05fMGr9dGxa0rTrzpDIgqklT0Ltg52Y8VdzAxswmaf0ESEkaoLZMAMg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9TpjK3mL4XMxxIqPV2kf2Lf6VwTFudK1nA2pu9CDDppvNlwVG5
	7yxev7ZgwsIujVS1HoDXh8uwm49RwS85bNYcaF503unGNhD068jxQQ03JERApOxG9Xo=
X-Gm-Gg: AYBFou3L+lTDbU8m1GKtjtoKAQ8ln0t0bEk9X9qTMMxFNdRU0yp+7NsQJMNkkdmIQeH
	L4qexEw5ejSQ80sq5h4H/Z42YSRHfSmEdVJqlo3dP2ZsJ2ko8pX83uBmdEi+F98aOQNuiEa++mE
	k6LpME/pHjAPz0vrdYWnyFfhMyWS+UZ7oDUTp+3GUK3+qTwjVhs7SeXCiOaims+k+y9X6VAYUUS
	aJDDO+p53Npy/c/uXO0MWOYRI+YfNage7i7KbBzar6Fs9GDadl6sMwySCxlGYbedim8g9NPbGqT
	7PQ8LQlxCLLUAJddvkcofzPfyGJPp2u+tG2enl0nrE/C0PO40aulw/xdbiqCw4xbxyV4mhdYQWN
	bdxEd9LYJhjx/d0N0OHa1l2MUbDuyfKLfm5mBVr2ZMTUUYxX0VWPaueymcV9ikDrtg5MUQC9ZzQ
	vazfiJU/b9NH7Lj1vubPU2PL/9BTPT15h3CQy97NXUxJguLg92mzai1fj78Z67huAaOHXFd8uM2
	Rypkk1u4gN++EwMhSMpd9FLMhLGCWW52mLvP4x9Ln/S4Y4FMOKUS2ikGygAwbilKRKsStiecDfc
	pO8AainswaGv5SNAsOc/iEVZyUtM
X-Received: by 2002:a05:690c:9e:b0:8b3:37e1:9263 with SMTP id 00721157ae682-8b4aa3ae8demr296007b3.46.1794500493993;
        Thu, 12 Nov 2026 08:21:33 -0800 (PST)
Received: from localhost ([2605:8600:200:14e3:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b393426f13sm73450137b3.34.2026.11.12.08.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:21:32 -0800 (PST)
Date: Thu, 12 Nov 2026 11:21:31 -0500
From: Johannes Weiner <hannes@cmpxchg.org>
To: Usama Arif <usama.arif@linux.dev>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, davem@davemloft.net,
	terrelln@fb.com, dsterba@suse.com, yosry@kernel.org,
	nphamcs@gmail.com, chengming.zhou@linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-crypto@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, riel@surriel.com,
	shakeel.butt@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH 1/2] crypto: zstd - use vmalloc() for stream workspaces
Message-ID: <avXni0bS7twguZdt@cmpxchg.org>
References: <20261111153532.1036709-1-usama.arif@linux.dev>
 <20261111153532.1036709-2-usama.arif@linux.dev>
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
In-Reply-To: <20261111153532.1036709-2-usama.arif@linux.dev>

On Wed, Nov 11, 2026 at 07:07:39AM -0800, Usama Arif wrote:
> The zstd acomp streams retain their workspaces after the last transform
> has been freed. The first is allocated during transform initialization;
> additional per-CPU streams are allocated on demand. They are released
> when the algorithm is unregistered.
> 
> In a 4 KiB-page x86-64 build, each stream requests 1,566,281 bytes.
> If kvmalloc() succeeds via kmalloc(), it occupies an order-9 block
> (2 MiB). vmalloc() needs 383 backing pages (1,532 KiB), 516 KiB fewer
> per stream. Across 384 populated streams, that is 193.5 MiB less
> workspace backing if all would have used kmalloc(). There is no such
> gain when kvmalloc() already falls back to vmalloc().
> 
> Use vmalloc() and vfree() directly to avoid the high-order allocation.
> This uses vmalloc address space, page tables and bookkeeping; the
> figures above compare workspace backing only.
> 
> Signed-off-by: Usama Arif <usama.arif@linux.dev>

Nice catch. Given the lifetime of these streams, there really isn't
enough turnover to justify the kmalloc optimization to begin with.

Reviewed-by: Johannes Weiner <hannes@cmpxchg.org>
