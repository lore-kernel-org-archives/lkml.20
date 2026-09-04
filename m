Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F3C3B841C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788537058; cv=none; b=DCzpqD4ej2+ufn8M/rh60O4MUGsXWCNIa2LEeQZcyxGhHr8v1nihlBpftzKOjSz37JEkflZ77Cq+sZnr3UNY7oE9dwySf7BvOiUTThaxq4Sxgl5UOq7Ed0+WOOh98PK/rMYQocBYxmUqsgUHEIcs12vgMIqLyF6kg4KYrhFbhSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788537058; c=relaxed/simple;
	bh=49NqWWnXPm5xwjmHssQaEwTFQ+eKAuxvGr1QMzit60Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PWG8Yrzq2ZXWP1Gsi2bjinMEGbdy+28wMfBIwEtUvSj1wsrYhNCdapbjDH3TZN7NM1N6aPXGRzGIteTYwx6XZx8Hk0YPcefEu/qpm1f+adSaHccJE1nsia0oUi+voAun/vvrBRE6VnFJc8JuI9XhHwLgBRCRBfAFB8jMRh9np6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=Qtd+qw0v; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="Qtd+qw0v"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-9390c3ade1dso56098385a.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1788537055; x=1789141855; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+CPM3PhCyVUbcThvlnBvxoK/N41olTITEO0G3pjffxQ=;
        b=Qtd+qw0vkjZmYfIdkXsxNG8nAjL10PQUweuT1muxcnsRYE4Q+qATX1KJhP3OsME3B2
         Fsb/wM7ZOymUUQz9yySIQNYe22mPe16zSHRPjf15rMhCr4Dw/Dibtj4OKv3VH6fquzlZ
         R0GBUi5Cs5Sog4zWk/KeR8OGxfUxfW6Ke5plgW2ikmegNAepk1zxI5n6WXUo8A/E4pOk
         jMsxguTLFuZUEKlc6fgtBIklnCp2SIT56r0pzQDsEFQV44piMc8yJw1w+eyTXliFhfAN
         fBi737NoJv9oveDvSiystDOjgTyDmCRieK1F4IhRJsdObvVk23fShZcrFOicG+0PWkHZ
         Nq3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788537055; x=1789141855;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+CPM3PhCyVUbcThvlnBvxoK/N41olTITEO0G3pjffxQ=;
        b=nRWPl0vGY9ma5ZC3as13xKg41fWTOJEml2uAxOl6vGUQTKpWwE4g2CxsyovC7kJhuQ
         lZvB0kGTNa6DkYPax15hoWOlLPxmslI/PmHegQU2X4F4LYv/Z/P4+aczAufE2oozEqCk
         X4YW2eJhz0R8hEUn9W9bx68/D8aJauR6ZluWJBvV7CvYkRBVelLHVjMX8OjQ3R6oLdZ2
         dtlZB+fFp8+fZYKi4PPThaeYEMq797x1vMVa0w7CFHvoQ4C33V7R+HDDbIVnU7jIzuEA
         IiJquQVum+aM2jC7GC+o/6AIV4zOsnVkeWAUGG6vzFlRE7ElUdVE3K19WbSyHbfzHzWT
         7K/g==
X-Gm-Message-State: AFuF++nwUwSEsbk6iqlsxc4+U82rgbAIAF/WU1avPX68uMkB4R+h+wzV
	DvKJE5fFOrB1kLQGZFSjHRq+swsEjef0+t2S1mIrOBEYSqLlABafNoflcKlPRyYEJpY=
X-Gm-Gg: AYBFou2eZPb2McvB1NXCD/m5YAs0Z0k8W4oQx41Zp7lB/IupyEV1rHZS7fQ/InI0QY1
	ufT9nX+QrAkJCoKnhEeTW9n+3bj3rAT+QzYvqSVa/UUhzUlYOzitj3Rl1tJQJ73fcazN2u1jxo5
	Ct2mmkEkVUE0XwEGru79Eq7pw4NIUqF7iRFbZAe2qB+GUnvfL7k6Hj37XiQGLLLkU8RiLpzVZwk
	lzqHBqWd0ha7KkDF9v6Bta+EGrkvwc31JSDHyXICkypgVXLkVjX0+ZbfxvWxuiMK6IZB5kpxJf5
	kjD5MYkOjfgw+JwCoiE6ziIcKhsAYAJX1DaazHJV3V+qygvYGtbwp+9fKNBDJO7L+lpVeDNBlqe
	aA46756vViolUzDV4JV65bkhxQ8EIxT6Pubdmxek5IvIOFkmsBj2Oty1qHbB5K6k8Xx9nysYrme
	Zh/v1G1VtaQi3ioWsNuZdFK8e4VktePfzqa8jySsuM2Z6tNBdb9+PKrow4DzW3Bh9ZSis527DPD
	7FSx1uG7dpeigU/ffqCUuUGQ+fMqBHsyJ90EQfU6gaj
X-Received: by 2002:a05:620a:aa1b:b0:937:675e:2903 with SMTP id af79cd13be357-939804018c5mr653972485a.14.1788537049980;
        Fri, 04 Sep 2026 08:50:49 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397f9f0734sm245958785a.4.2026.09.04.08.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 08:50:49 -0700 (PDT)
Date: Fri, 4 Sep 2026 11:50:47 -0400
From: Gregory Price <gourry@gourry.net>
To: Rakie Kim <rakie.kim@sk.com>
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	akpm@linux-foundation.org, david@kernel.org, ziy@nvidia.com, matthew.brost@intel.com, 
	joshua.hahnjy@gmail.com, byungchul@sk.com, ying.huang@linux.alibaba.com, 
	apopple@nvidia.com, urezki@gmail.com, chenwandun@huawei.com, linux-mm@kvack.org, 
	kernel_team@skhynix.com
Subject: Re: [PATCH 2/2] mm/mempolicy: stop copying the nodemask in the
 interleave paths
Message-ID: <aprm5dwF_kWaOe44@gourry-fedora-PF4VCD3F>
References: <apgzMZQPTxS9QtDy@gourry-fedora-PF4VCD3F>
 <20260904080140.1992-1-rakie.kim@sk.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904080140.1992-1-rakie.kim@sk.com>

On Fri, Sep 04, 2026 at 05:01:37PM +0900, Rakie Kim wrote:
> 
> What I had in mind is the gap between the two reads. Say the policy
> starts with two nodes, every weight is 10, and 100 pages are
> requested:
> 
> 	/* the mask is {0,1} here */
> 	do {
> 		cpuset_mems_cookie = read_mems_allowed_begin();
> 		nnodes = nodes_weight(pol->nodes);	/* nnodes = 2 */
> 	} while (read_mems_allowed_retry(cpuset_mems_cookie));
> 
> 	/* a rebind grows the mask to {0,1,2,3} at this point */
> 
> 	/* calculate total, detect system default usage */
> 	for_each_node_mask(node, pol->nodes)
> 		weight_total += ...;			/* 10 * 4 = 40 */
> 
> 	rounds = rem_pages / weight_total;		/* 100 / 40 = 2 */
> 
> 	for (i = 0; i < nnodes; i++)			/* bounded by 2 */
> 		...
>

Consider:

	/* nodemask: {0,1} */
 	for_each_node_mask(node, pol->nodes) {
 		weight_total += ...;
		nnodes++;
	}
 
 	/* a rebind grows the mask to {2,3,4,5} */
 
 	rounds = rem_pages / weight_total;		/* 100 / 10 = 10 */
 	for (i = 0; i < nnodes; i++)			/* bounded by 2 */
 		...

in this scenario every value is wrong.  The weight total was calculated
based on {0,1} and the loop will use {2,3} weights and ignore {4,5}
entirely.

It's the nature of the mechanism and race - best we can do is ensure
safety.  Ensuring correct distributions would likely require locks or
reworking the entire weight mechanism.

I'd rather keep the change simple (cookie the value that can cause a
div/0) and leave the math alone.

~Gregory
