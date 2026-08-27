Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D582345731
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787849960; cv=none; b=SrDju7atij5b+JVUV39kgEMxdQzE+cU5aTi1M9ySuscvbzkQr5hoSsssNOJn5/dyD+0noLGbvezyQpNChIHNLzk4rD9yDlPt6yDcUz4tDJTYSXxm3hnIa90urAEMounRoe8Ba5T6oAy3WhFLaKFY60QgJPjVYrL+OiOeDW89wlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787849960; c=relaxed/simple;
	bh=fBXgn0wUuEp/xqd6Wg6cegnfsxJPoBtkUXA+FI3MvCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DNjmD6Yp2OkBXWb1buT70+zKuQ3cvflAxq+Lr/dzKEr13l3Xc7J0oA5ydiDfz0xdY4E9OuLrl1tarL1Wuy7j1OkEnFmGGH8yxkseCKCu9utarSqDOnwhX/M84k2RGJPzkq0R0q/Hl6l2dCM+oyEbZTZS8ncPltmnbhMkzVnTO3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=R8qzl/x3; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="R8qzl/x3"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-66d1447e2b1so36540d50.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1787849956; x=1788454756; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5T+UVRvHTqXXOze9HatcC2azQ28k3mYQ8S0a+CsmrJc=;
        b=R8qzl/x3D6WOcKAL7Q24JzJlndM7qL1GdlEB6l5yR5W4z7ZXBbnaqXnJC1kMOLaDA9
         BebUVuOGpDlDRRSrNCF0WdKCOMDG6ydyAF/2uCg1fKM1GQSuSvACOrXA0hVNms3xRlHV
         //Rt9v1S4y6D6XmTIpUo1e93v3zFDk8v0Hh0nJWMSj0mRnOBF9TrsbJCbgaEtNWQJSYn
         uJbVualyTBMd3KnI06JNcPnLlJM4s7PRmKTRXoXZvNi+VnELmloD8g7NyuR0MLWFdmuq
         K/9jKZ1KVrDK/Tf3efuMnixArfnPs8RhS0fi6Dmsta3dubM4aN7UISPzsYP0xIeEXT8q
         e3aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787849956; x=1788454756;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5T+UVRvHTqXXOze9HatcC2azQ28k3mYQ8S0a+CsmrJc=;
        b=KoPT3nCY26u5KWXL5gXpulsx8EoaX8aqQ0by/crIuYwviOo6xzLgrZuycL622NxJCE
         iSi1xa860RTzArqLjVgDwM9PgP9uZi+m8xhicPLNMB70p7c9IgE7TMfZVaLUaZC2XBcc
         WhHqfNuqjOLM0L/RgUHNWfaNvhZw+UaB8rMRYHKPiHlzmjqxsCzMyo0nXXGgEadVUg8R
         3i6pcF0xrYGTiHASdl1TQFUKpeCtukVfoS6PsiKAXfcRcH4A30MyyQriRcdibXk/wMe/
         PFPMyADaqCsksKxurK4oC4qR2ylzNZVYIaLoIYCwk0M56SqM6TPnxi5IE9m8NTgj6inX
         wmKQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqu5nGAlLVGSvxVFpLTHuEkZjAXfR1lY86XGdDo3eBw9wDp+S/z0+3rusUMHcHqda5JytIz4nl5esQBVrk=@vger.kernel.org
X-Gm-Message-State: AFuF++lm79OY4jDggetCtNnevVWfBjNyNalv6JzBuvSNnffreUVf1HUH
	oS7OxHVNIrYSVt8r3irWsw3AzBkYNsZPcNNE2OLtw5z+synCqEEge1KzGbi3xVwZFw8=
X-Gm-Gg: AR+sD13qiijCHYjjLZjpKcsFja8rGR98jFXwTbSvrnbqDoPRy4bjXpEToa5dNKkzmVb
	OI6ELLWNSdDpTAE7KCG+kQmRuuAwKs1bzbmSZCEIP8iRjI+WCQSnjSqNj7s6Q1v7b1VZ37R99hB
	tgC+fSi/Hjqw9OvNERGlZzrDJgFuWR+hFTsgipBEFC4ppOyPYk2ExxPx4y+93OClIiP3n2la7jV
	F1ex+x61cAPx/gEPk1j/M6T/a3y4/j75hQ0eTXNJLba7cjqFsVRJU6r5K6hvpK9EljeneGXNkcT
	AECmgL6WdCuYkg/Le6PpdH5EFPIa8gPM6VhHtjMf6eV1OsHmx3dUwnb//YZG6USh62Slxh3bBKm
	oVFLtgVR2Mbg72/wplurV5Sr125aKnEUpRudeKyVIbEEavo4oxH4QGJ6b5iyZnFAKTq6YVJu8cH
	AGox75rPzTEgnlA+0um9YfvaFmXScA7agYfKqHMcWKVrd5IPWmIW5luueIkwtF6ROj8rLkniw=
X-Received: by 2002:a05:690e:2509:b0:66d:28c1:4db6 with SMTP id 956f58d0204a3-66e4b914e01mr228373d50.23.1787849956251;
        Thu, 27 Aug 2026 09:59:16 -0700 (PDT)
Received: from localhost ([2605:8600:200:1a83:fe59:7385:2855:8588])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66d24787e65sm3299110d50.20.2026.08.27.09.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 09:59:15 -0700 (PDT)
Date: Thu, 27 Aug 2026 12:59:14 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
	usama.arif@linux.dev, lance.yang@linux.dev, ziy@nvidia.com,
	hughd@google.com, baolin.wang@linux.alibaba.com, baohua@kernel.org,
	liam@infradead.org, nico.pache@linux.dev, dev.jain@arm.com,
	ryan.roberts@arm.com, balbirs@nvidia.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>
Subject: Re: [PATCH 2/5] mm/huge_memory: dequeue the deferred split after the
 split freeze
Message-ID: <20260827165914.GD3004@cmpxchg.org>
References: <20260826162101.1314941-1-kirill@shutemov.name>
 <20260826162101.1314941-3-kirill@shutemov.name>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826162101.1314941-3-kirill@shutemov.name>

On Wed, Aug 26, 2026 at 05:20:58PM +0100, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> 
> __folio_freeze_and_split_unmapped() takes the deferred split list_lru lock
> across the freeze. It is only there to stop deferred_split_scan() from
> touching the folio under split.
> 
> With deferred_split_isolate() fixed, the workaround can be dropped.
> 
> Unqueue the folio after folio_ref_freeze(), the way
> __folio_migrate_mapping() does: folio_unqueue_deferred_split() needs a
> zero refcount and a memcg still set, and both hold there.
> 
> If the split is called from deferred_split_scan(), the unqueue is a
> no-op -- the folio is already removed from the list. But
> PG_partially_mapped is still set, so it has to be cleared here or
> MTHP_STAT_NR_ANON_PARTIALLY_MAPPED never comes back down.
> 
> Assisted-by: Claude-Code:claude-opus-5
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

Infinitely better!

Reviewed-by: Johannes Weiner <hannes@cmpxchg.org>
