Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00623E51F4
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 23:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788392905; cv=none; b=JGr4/8lmmpnE1opiQjfHQjjESPuXWgHR7PPakr/9fGvhnOqZx6tqEJRGVZCGdtpx4Pr48cj+Md8gsHTP514W9mLidTYzxfAdn+t+/jIqq3OlTGbafzSfBc/8hi8EsmXh3+1Jp2oVnRQkXRpk+uP9jXV6m/vOm5ZJNTKk6PONsmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788392905; c=relaxed/simple;
	bh=ChURomuOnORI847v97u/pFZOv9VDFxC8S3QptbUYh9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cH2MYrT1zHCGmiarSgdqZwIy6FqPjK0CL4vNV+5qTKiC0sDnqUMynFzbcpXpEms1A5k+WcixYotJf6IZKqCs8tZEPOa40a9OlWgcWSXgW4XrF+m7OCNwQyrUU5mK8agu6qtI549J9gpfUza34GQV3vkZMqXiGdBSpOR5s8Yx/Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=nOUApy5F; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="nOUApy5F"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-51bfad59921so18354211cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 16:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1788392900; x=1788997700; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jkgrm/ILoyMvWJ0vGraMeyhwgPKQ2+DFDrLrUyj3wEU=;
        b=nOUApy5FMxsCxs2b7hYinc7YdJQs2ZcjqYNbeZppF/eF2+/67zwSAgmloEFcpDue02
         P54nFYf296qVrmJJuegcSdiHs68XuhQSMHCyGDtg63nDfvdscI6xcT3ItSF++RiEE9ca
         /8FZvgxzQB1kQo2bIAiVHcDxvJ1dTCNcXSASfUT7Bzf1RppaVK9UBSuwRDezXg7KOoMS
         xpTrOhaLHaQegQB4jmpU/Bp8lhna/7m6+sllQ10Ur3ubyf+7QU7b+Jx2yd8LdkhM8Hy0
         bJBCpvthkD2RoAM4IMrtPlXjmBHXcT04VKzvkSyyyG19dcr8Uq9tcnsHb98DDJTbSpBK
         UNZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788392900; x=1788997700;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jkgrm/ILoyMvWJ0vGraMeyhwgPKQ2+DFDrLrUyj3wEU=;
        b=WN9yo6GWvmcLnQpjYFOrMLhtDTQu8+6NBy6Qq6U9qj16iKfXEvJdGx2AFsq4kT613w
         sxvSOzp4QV9pMYYfchN8QRkyKPguSWlvSft0lj6gIRTJGiEEfSxP3uGUiEFsBbtMQzfJ
         hy0/EF8YvzBXeutzzHh7EaqtrqnCS+ZC3jEgR6+S/h8tggiJpWriF5FLXhRhYIlmeDh7
         /CXTGveYXsUIVl/4zssw37TJ1zSaUI3EYy4lIm7TcT771XcbwMGfhAf4lq6ZBKwGq1Ja
         3eWgF5M1/fyNNEglxiqkEV2H4LdvAQLm7RrgGckmL253y7oD7igF91uvvnsAkQk6HwTH
         qG0w==
X-Gm-Message-State: AFuF++lFDD6MPf823S2P8DtA6wQgiKwyqeoqg7C5yBrmOiPboDfJMBOt
	CRb0q9YeHKJnk6pftSFcDbZtQMlp5+GUKrCIAgOJ+bUYlnRaNqWNL/tlJj4sMTSpoOQ=
X-Gm-Gg: AYBFou2orO6ts8qdf/vCKK6UhpuVhKjX28vsklE/M9/D9JY7bncjOXGeJ3l5A5kN1yF
	5gl36sXhqFAL0uPpvJ5tx70ImcYKoEKnHFIROwwXDvW8GpRXK7XnyCCz5SfNExEVYJwdkGgJd6A
	drUkN39UU8/IjshgN2Ob3ThQm0wPcLK5SgNqalvEy4E3VaR3gmYYn7ye/+AH5NZW/oS5/OioKWA
	oQ8Q1AO/XoQ5bVNdn9oYJclZ4F5y40B4X1MFwfNNhzFCAHYB+/Xq/bpD+3g0b5Pp+Z1qbj2tFkZ
	DuLRsHmCASSRd5gcBmo76ef/vSO2jpTLEGKRzU+Puk+3UkYmYoCLRO2oz1HuA/dBUVoFBpmIHnC
	LnBTiZP//NyVn8YwCczoa8TmumPrfKV+gq5U9/ztTxUoTsCMkpTHwsuSxuGaU6qFeuX5Cxw1IpQ
	ZzLEIGUJ741I5CvV2eAx+XdSNWxN9Idkad8ER//9UZoQDU7SotsIXqLd9+N/lsmMeL/IYNjTKUn
	If9dl9Q6TxwNV93U+HnjfUZofUYQoC9mfvGjq8kCX2X
X-Received: by 2002:a05:622a:3cb:b0:530:27a1:88be with SMTP id d75a77b69052e-53036d141b3mr104316971cf.30.1788392900530;
        Wed, 02 Sep 2026 16:48:20 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53033277f37sm31280861cf.30.2026.09.02.16.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 16:48:20 -0700 (PDT)
Date: Wed, 2 Sep 2026 19:48:18 -0400
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, liam@infradead.org, 
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
	brendan.jackman@linux.dev, hannes@cmpxchg.org, ziy@nvidia.com, balbirs@nvidia.com
Subject: Re: [PATCH 1/2] mm: refactor find_next_best_node to
 find_next_best_node_in
Message-ID: <api1Y0neGeB2ukQO@gourry-fedora-PF4VCD3F>
References: <20260902215853.156267-1-gourry@gourry.net>
 <20260902215853.156267-2-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902215853.156267-2-gourry@gourry.net>

On Wed, Sep 02, 2026 at 05:58:52PM -0400, Gregory Price wrote:
> find_next_best_node() picks the next-closest node for a fallback list
> from the full N_MEMORY set. Refactor it into find_next_best_node_in(),
> which takes an explicit candidates nodemask.
> 
> This enables building fallback lists with non-N_MEMORY candidates.
> 
> No functional change: every caller still selects from N_MEMORY.
> 
> Signed-off-by: Gregory Price <gourry@gourry.net>

Just realized this should carry an Ack from Balbir

Acked-by: Balbir Singh <balbirs@nvidia.com>

see - https://lore.kernel.org/linux-mm/62bf02dc-dab1-41bf-8204-eb3566628b93@nvidia.com/

