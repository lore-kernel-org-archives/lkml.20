Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A41A311C35
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 23:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790118133; cv=none; b=pyOPKAeqsgeV00KjibhewS/km3SdG6OPy4M+qNFMGSZRFgtyzq5wtEmRz2KzZbqs7BCFA9GaHahY2z25btHtS0ivfuAU9kDmGMbhOAS+0VPOlpCLOk31yob6tqdJosYF2m+OGv+idVNDI9tO0i8GtQId8eKqxS5H1ZILGYcNWbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790118133; c=relaxed/simple;
	bh=/kR6171VB3erZoDRI/AmxeFfyrqkGrs6uGWwaYmkEkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JzWkA/sZ+WacoCGXrEsfL3F7m71pNdW1bi+nmzbCLLIu082pBhqvpl1nq/J92zAb2JrMgkQTVwytTwsh6EMMEHGJW9xzUvloEeXoRiROCGF9869KzvUAk7A6DMq7nZnW2CIDXz8hdrPpeuCfV2xEgXO08QTP6dqJBRLm8OQXynY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D1n+cES1; arc=none smtp.client-ip=74.125.227.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D1n+cES1"
Received: by mail-pj2-f5.google.com with SMTP id 98e67ed59e1d1-3965683e9e9so215829a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790118132; x=1790722932; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h7ulPYzV5Y+Sdfs1jUESf1o0c5bJv/uTbUIcuWdrADA=;
        b=D1n+cES1mxFmCL+CAWxBSYhAVnjRCOGK2M3w1jPjjNsZeUbBfIGsxotMXKdFyZKvuC
         hGVNFZv/5DodqS9O2jx62R8Jrnza8E4bS0As/HpIzXy+Rw44KSmrZEbW5kNUUjTUfAHa
         UvBtOWbeU0hx5LD06d6cbp/vh8ZxQqAq9PeKoG51/meG5Jp9madddR7L4G8LmZBYHHDD
         yt7qiq052dFHOGOIrzdhKh3R5/FY5i9RgEFBIqvl55SGYQWFCRAN0LX9/MSYSoZUkmee
         LAGet9XsebNiQY8R6q4TTWkKxN30539QcgN3Xb0kK+qs+GtGfDNJv1WJYQrBDxs36ufh
         y9JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790118132; x=1790722932;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h7ulPYzV5Y+Sdfs1jUESf1o0c5bJv/uTbUIcuWdrADA=;
        b=dbR1TaOmG0aoxMTJsqLuEddW5mA5q062ETri7h17LDPqf5Zg7XbywjZVO6oi+bug0F
         uH8mGfK3l8Wt4KJ6KlLWGprnk+z48tYAl+QzuTUQggt6UKvXD9/6PNHu0hyvG/HAKbKY
         miGnKEvU+T3iORqpoqs6Tdrw+vjh8UEa9ctgdQ5lutbavYzlUq5ZUUuGgQDb1pEgm4j+
         wPpXWLqddui1HsSKaXb8d9ySLCmuUNS21hvYwPq30YwDCkPeHtV6F0K/Z5MRkbgHBySQ
         Ao9Ne4RRgGGczsAgfodLjBXu18fN2bEzlqKznuYKVVCSgzVI+Hebl0LsFNxViY4lFBOQ
         55hg==
X-Forwarded-Encrypted: i=1; AKwUvBwssozk3Gb0Ef6T6cwOsJG19GwZhO7yK5xOIxmTjf7HJsjj6FBFaZm/tWcC1i8kVh6QEqRTdaYkqXBbUk8=@vger.kernel.org
X-Gm-Message-State: AFuF++lqVfT8Tb/z5VIcJOmWxvJQaeFa2ZzrSuwJVwGTBpnbcCXIeNzY
	iNHWEyJU+7Niz4feB1PzayHd9zCzJdZ3VIY1uyFH6sxjhMmmB8JbtRVH
X-Gm-Gg: AYBFou1j/hCOuPDTVzOQl2jPeU6dbOPg+1uAoSNInepY23h2i5S5TrXAjxbNK5Wobpd
	wRJTritV98RL+o5LjF/sE/wd2w8Jtiplx1PA6hFjD/xApmn3sUQMYzUlNSTT2D8+H9OFRd68mkp
	BqsJn6SQ8ucx9PfJ1ixrm/merlTSmCbvMP2UT0frPREO8xauRnCKH5TtNoiR4W6JGNERV+4+guf
	Q+37pkk8sj9Eq0tDGV7Pt+jk/VmRJOmkcdNcCIlgoYvJ8Ud8IYrtHUfEViLk2hzBX3JXYJeYQXS
	DKOgw/mXhPQ++UW9yNOIxF4bx1uDkr2qx11o4ND1Q73rLFqJ1Zj3h6YPzx8IV+T8qrMFWp2vF70
	Pql/ocdLPrH/PUT0n7QrAQKNAGlb5q32+mP2I0iEMvAuStet4haYHfHXw5YEFjvvbvUZGWmp55U
	FY4oG960dOYXPdvHmBxBe8aOws0PEPXVMp1tL9WsansBPdxky4YZey8VsKINHtV0Zp
X-Received: by 2002:a17:90b:390d:b0:398:bacb:1137 with SMTP id 98e67ed59e1d1-3a07e54a8e2mr805121a91.19.1790118131508;
        Tue, 22 Sep 2026 16:02:11 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:74::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07f8180f6sm315373a91.0.2026.09.22.16.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 16:02:10 -0700 (PDT)
Date: Tue, 22 Sep 2026 16:02:06 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Kaifeng Wang <kaifengw@google.com>
Cc: netdev@vger.kernel.org, almasrymina@google.com, edumazet@google.com, 
	kuniyu@google.com, pabeni@redhat.com, willemb@google.com, davem@davemloft.net, 
	kuba@kernel.org, horms@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: devmem: use page_pool_put_netmem_bulk
Message-ID: <arMI41pIJDuQK6JH@devvm7509.cco0.facebook.com>
References: <20260922193356.542922-1-kaifengw@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260922193356.542922-1-kaifengw@google.com>

On 09/22, Kaifeng Wang wrote:
> Instead of looping over napi_pp_put_page() and repeatedly acquiring the
> page_pool producer lock in sock_devmem_dontneed(), use
> page_pool_put_netmem_bulk() to return the netmem references in batches.
> 
> This reduces the number of lock acquisitions on the page pool ring
> producer lock when releasing user tokens.
> 
> Reviewed-by: Mina Almasry <almasrymina@google.com>
> Signed-off-by: Kaifeng Wang <kaifengw@google.com>

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
