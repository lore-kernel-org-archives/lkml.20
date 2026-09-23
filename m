Received: from mail-qv2-f40.google.com (mail-qv2-f40.google.com [74.125.230.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0748556B866
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 22:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790201394; cv=none; b=J79nEw4ofrLRB1KnMTJBMc7LaNtVkd4otPhg5skO5q+1kHzfg8R8+hAKMOc4voC8BMuyNJTJ6vyQaSrJs9HsyxpXRXPn5UimK+Qe5Z4P6pAEWaiDJQvImmUCVDFdMnR8oipzHMqJsigPJ6EM64MiynAwpEul+eXnwXO4uRl4GrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790201394; c=relaxed/simple;
	bh=qUgi28KzXa/rBYmuGnRdzm2GomdlzkFdVTAERTef4fA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m0Lhu22aL65i98rprEmRbLfqKkVAHUUoyylB+EZixJxraglr03oSi9fUilDvAiJzOl71RhD8hwmpwOdw1NHb5R13tOC3XXHp67RE2KvJQNoitbeeCl73Fm6mBoO69bx0geRaBpM5X+RaudxPIXlT1/brz6bYb+Ea2wBM3emZGwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=dC8ANaOc; arc=none smtp.client-ip=74.125.230.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="dC8ANaOc"
Received: by mail-qv2-f40.google.com with SMTP id 6a1803df08f44-90cdfe57a3bso10209526d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790201392; x=1790806192; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K1Hvo7RTbP2R7EwaTKGv+PaU0aoOQ9FZzhpnXlX0iSg=;
        b=dC8ANaOcdlcw/hXF1QtFu+9WETRasZcor4Ac6D/KFt7/MedNJypEA5cZk7imdnxG1G
         G6p2hJyVnTaL7anDY7cri5ZnsKER3/n/fB32R2FPrA9LP11g+CpEQt1ym5dMH1YkTNmp
         3flOiq3iWFdZ+sxTWw5nYLLWkU+bC9Xqu2fs3MAgEKCXssxcwiood5434KHrf8+kcTez
         9UXFDAawjUs1FpCzk6fNCiMlhcSioNrZsXMU6gt79QlmL8IfzHDlmktVAWgZD5lJsTst
         sl0jAx0K9BxCjvICsgVv4SOz6W7eA1lT1eAH8p2tHWrCWkef3Zo93nw95ALLfzX/yZfH
         GaQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790201392; x=1790806192;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K1Hvo7RTbP2R7EwaTKGv+PaU0aoOQ9FZzhpnXlX0iSg=;
        b=YqUb++VwdXf+nHlV0tyvr/4B4cyMci4jcMGxMEH/R5pBYqkULNf60GpWLNrmeCbfoF
         JWeksNQO+N8XJTpA3VdGtyqTUdj+6UMn+Iwbc1YfDQ7uSN6AisdwBriCrjnRNQXsUpts
         rni00kWThCbTNrdGhAUj6Ny5lqwMsQxTBNzJ9vrTo+qjeNgbpPIqL/9ycesRwr9r3bxZ
         KY5CoDl0YFkzh/dn5T7zhV6r1P1FrEs6D4Q4MxILmnykr1RLB68HhcfFSomCVndHqNuX
         lQMcYjziL6gAF4Hw1PX2mBd89CZHRn2QPDJXQ4zuNbn5SXTcoKVeo5b96mQfWnBCKz3+
         BXjg==
X-Forwarded-Encrypted: i=1; AKwUvBxFKJl4uI+4O4d8d2Lez9VSikxTUPKSQlYVotZ3m+xFPesYK/s4V5MsI6d5RPprCWf38judXso2Xw42vuk=@vger.kernel.org
X-Gm-Message-State: AFuF++l6Vrx1ytgJ/YGhEER96sz01It2Opt73o9IKCo8Yffjp46W6Ipq
	nB4EQ4LRLSoHWg/vLT/nNJe3u+Yb16/cDMVZSj7a4rqqPGDa+xqfjFYnCZYMevNDJNA=
X-Gm-Gg: AYBFou2SwbTei2Se3Gaa3YuD6b6TXaD+HV6SfYAh0Imy2eDpt4Ro3UPy/TSrAfU0yiw
	+d3N+DCNiZvhl4HubG5WwLlmyBk6EmHbukd6zohSOonThCgc64a/oG4rgdGDCANejuH+bY5C0GN
	SSCLQSj/vYuGiT49FNhh5q8iZnvmoZVoCliOaPkD0hRxc4Fv3bN2m3d2gU1v9NAnlWcdEQHQHZk
	Vojdc+p8bzivG8o3vBNnV6oDF1rE302H0wrAOU7rBgvinaN7NRb+PSIONKRcJrnp17q218FORpd
	8Tcp9efFTa96588m1QZ/n/qxr7tM/1/o85eEBSoYYPwK4aSZzDMBxD9Geeyvmi6B7i80uea9Zec
	n7FdwtgKWwW/mfYM2dpWR/vcW4Ket0/kjHNEz5YoZ4WkwegaZKgMjcaC1wFwWU1q0tyra/i43l9
	DROSicdxTUcsgft3mwwoyQDHkJSwDw4XLqZg+dZWt3F3bsOBR1JrksMk9UoL+0jw8Pgway36aSW
	eCrCwxO0HdscpHUFTeK2Y53x/wcRgh5znVqDKgK1OwuzVQdZ1oeGhWv60tsoaHlMec=
X-Received: by 2002:a05:6214:3282:b0:912:517b:9753 with SMTP id 6a1803df08f44-9141e966f4dmr9008456d6.45.1790201391865;
        Wed, 23 Sep 2026 15:09:51 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9141e217944sm3890176d6.9.2026.09.23.15.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 15:09:51 -0700 (PDT)
Date: Wed, 23 Sep 2026 18:09:49 -0400
From: Gregory Price <gourry@gourry.net>
To: Matthew Wilcox <willy@infradead.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, kernel-team@meta.com, jack@suse.cz, akpm@linux-foundation.org, 
	david@kernel.org, ziy@nvidia.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com, 
	ying.huang@linux.alibaba.com, vbabka@kernel.org, surenb@google.com, mhocko@suse.com, 
	brendan.jackman@linux.dev, hannes@cmpxchg.org
Subject: Re: [RFC PATCH 0/6] mm: pass alloc_flags through folio, filemap, and
 bulk allocators
Message-ID: <arRM9qUFLfP04YUB@gourry-fedora-PF4VCD3F>
References: <20260923211041.3127588-1-gourry@gourry.net>
 <arRHr05gy_eu4WVA@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arRHr05gy_eu4WVA@casper.infradead.org>

On Wed, Sep 23, 2026 at 10:42:07PM +0100, Matthew Wilcox wrote:
> On Wed, Sep 23, 2026 at 05:10:34PM -0400, Gregory Price wrote:
> > The folio, filemap, and bulk allocation interfaces currently hard-code
> > ALLOC_DEFAULT before reaching the page allocator. Multiple MM series
> > need to select allocator behavior through these paths, so pulling these
> > changes out ahead helps both series avoid conflicts.
> 
> I really think this 'expose ALLOC flags' idea is wrong.

It is mm/ internal only - to be clear.

It's also already been partially exposed, this just brings the rest of
the interfaces with it.

There are use cases.  I initially only wanted to expose a zonelist
selection rather than alloc flags, but given ALLOC_UNMAPPED was
in-flight it seemed better not to propose different solutions when there
are existing possibilities.

I'm open to options.

~Gregory
