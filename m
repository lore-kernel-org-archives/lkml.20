Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792687434;
	b=TLy2/WBgV5+wcaeFpBM12NHG6FusmbpDUXM1nYQu7gXu0GuM8PngzHjprXkcUZ7J9Xuo
	 xjPDnhOsVTnAcqwJSTsS5xQ7SMa/nLOSyzhoIs9tVzhtie1P3nSOmd7zg+v2dJCsfbCOX
	 3ahamxsn+wk/Ea7UaMoUiLFmNYXPTbo31S5bNbmbmkb/xUknaaN9BbcCvKDIdnnQRPPNz
	 LNY1G3TuHjBSUsr5X78bGQV18ehFfWNxWWYOpSFhUkY8l8O2IVlvIjoYqyiZYcUJ4UBTC
	 RSRt4/HtWEQcQo4LyjlyTkWV/mTrOyKRc3dgRZcKGQOEUG5zyNxGxvka8zUerj2b83g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792687434;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ETjJA992+3Nw94AfVhCDwB14jB6KIUui/slQ6pLMm7s=;
	b=VoqsfknK2ecoEEWdVx/lSeAzfyerHuPUejj4EMo+0hv/5tB2EhOxsErQ87tiI2G7HysH
	 xCsfPy4vURqLrIlSQ/FsTuk6ZIG54g4Rv3OUJ9XpkCiNciqkSlxhYkuvE9ngt9kO+wdkk
	 qXIdWy/2ff+ns8B7SuffVOqD8H+PFO5lPb8cC2ttdpWAlyD6CUBtT/bJ0Cg4RCpSXOJEt
	 uMeyJF02Ao/zbCf6EaYu8ZOMROIWjxirrXZM5WbApEaGJRng8VhTYFLvFzpZ9QrAnPXBI
	 j5jRiVk2Q03uG2Js9Aod0R1+k6lQACNLYK9qra4+WpS+OY4Ch+ToFn/4z/M9MbMZMtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmpxchg.org;
	spf=pass smtp.mailfrom=cmpxchg.org;
	dkim=pass header.d=cmpxchg.org header.i=@cmpxchg.org header.a=rsa-sha256 header.s=google header.b=CEN3gmk+;
	arc=none smtp.remote-ip=74.125.224.44
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C376C606A325
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:43:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C376C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cmpxchg.org header.i=@cmpxchg.org header.a=rsa-sha256 header.s=google header.b=CEN3gmk+
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-679334baa1fso85339d50.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1792687431; x=1793292231; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ETjJA992+3Nw94AfVhCDwB14jB6KIUui/slQ6pLMm7s=;
        b=CEN3gmk+YO/eN2F39INYrEU+HFy0QEePQ4t8Tq51Vhh+SvKt3BlNS6nL7RyQG5Mx87
         zI42p49MigzPI3ZgcAX1xD+YW8vI2JMIvAT2lFyzxFd0PBX6bufbXv00SGXNnQ64pv+M
         GiiZkcTN2mOr5qG9ZKJDVUgzNP4keXJmGaxOoT2u0czlKj64wnREjZ6GObot3heZpZlK
         D0rFcNGzora7+RcTMza585NTMqwzn7R5xH4sk0wFOnl5/TfNHUtnX702VxVZ13z129jB
         AIVXphUzwoBq32Q9Vtw3IBscF89gjvdi30HYfMaSDEvZw44BcetxiWGa6dOxKd6ReCbs
         zjsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792687431; x=1793292231;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ETjJA992+3Nw94AfVhCDwB14jB6KIUui/slQ6pLMm7s=;
        b=I9x/p5gQTQDCZY26/OWkU+y+CfXpwcjpS8zi119PRi37mcR+OGsM4kMF7mfz9B770V
         0plSC/yOPxXx6E66gWGu2vCoKUHF1BPtiG94ysFC5YJN2ejKclOoSQRUnv4m2KozbuN+
         xVOltVjeSBk3O99jsJ48EhrgH+T4jEx7AYMyUv4LQPB1kBbPaTdPzoYbgr6qiUar3ute
         VSaW6M6MSuYg56Yl85Uvcjl0hAQtVu8UlWaYoL9akqorZ0sQxQUJ7Q7NkFZ6OYO4Xcid
         mHJTgnf+uNKpeMMfkuCEWDMy7cyQR0tdTNYn89i0vVWX56nu5yygaaeP13LF223gBLCH
         y6FQ==
X-Forwarded-Encrypted: i=1; AKwUvBxWBavXILSC3RN6uSWHjLCXPL2LzbWEHAoPbIberlytJtrBgjDtGyF7vPdcH6krH0ZTnUk+tmPQh7LsXVM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKMKvM6a8Logjz+mcmu1SeAllK5h+XyBFkTOF0MvWRuHx/29vtL
	nObKuT1G+3B/+tqQsHj5gt464inOtG3Ji+byo8Gq34Rnsz1QdyA0Lpt/tGWfUnU5NRXdUUWzevB
	RHW41
X-Gm-Gg: AYBFou2ljrQ2L2LR4lChMOejrzlg8gfJRuHrziWcuAIXcaSQfNK7xdSKux+P7J5MEfZ
	0vplcwYRrn2HqgD/gxJqwwl4cjDtKFohLSa47IWGMUaBAjdyaUcHaW4lYdxnXlEy6RSyjM1/r9G
	mmi+0aDFbnU+UPkNtTJbbb9kfCg5fgFQ9yhSlgBBG6f7x5vnjo5nEv8KgToTNyiyZqkMQ+56lVA
	PAtFHkiPdCfV3qJOWg/Dxk0yUbcpB/660Bwn1lMUZL6N3fkU+1HRVFtfUcj/T62UNay1cl4eA7Y
	dIr7CCyBogQOIQqKFuUumtbaSzZQ8bkADC2hJrNV3S2c2xKHFyKBUeAz0AsS7id0wOsNxiqzdlL
	NLE3Ju/Y7a6SxKoC5zL+y+I4wiwtpqQGue2PJYYNaR7chfX1x1gy8PBJcsayOyQnFUw6Mpn3gCY
	N07LfL56eUhPkLvj6ARTLFO3hKf3y1RZiKX4PMXqWZ6KuLnLGyK9AWkhiqRzunECjjuWA4/sCL5
	2RDQBSUF6vXyPQGp3nMYfaz3vzmjP/R+T3bz/N5Jv7F8XuZ3rIiW8/L
X-Received: by 2002:a53:dd09:0:b0:672:99e0:ebdf with SMTP id 956f58d0204a3-67a0e57f0ebmr1751623d50.119.1792687431653;
        Thu, 22 Oct 2026 09:43:51 -0700 (PDT)
Received: from localhost ([2605:8600:200:14e3:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a0e496732sm2881390d50.5.2026.10.22.09.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 09:43:51 -0700 (PDT)
Date: Thu, 22 Oct 2026 12:43:50 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Zenghui Yu <zenghui.yu@linux.dev>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, vbabka@kernel.org, surenb@google.com,
	mhocko@suse.com, brendan.jackman@linux.dev, ziy@nvidia.com
Subject: Re: [PATCH] mm/page_alloc: remove unneeded forward declaration of
 __free_pages_ok()
Message-ID: <ato9Rvu6H3Ze60ht@cmpxchg.org>
References: <20261022124504.75642-1-zenghui.yu@linux.dev>
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
In-Reply-To: <20261022124504.75642-1-zenghui.yu@linux.dev>

On Thu, Oct 22, 2026 at 08:45:04PM +0800, Zenghui Yu wrote:
> From: "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>
> 
> All remaining callers of __free_pages_ok() appear after its definition, so
> the forward declaration near the top of mm/page_alloc.c is no longer
> needed.  Remove it.
> 
> Signed-off-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>

Reviewed-by: Johannes Weiner <hannes@cmpxchg.org>
