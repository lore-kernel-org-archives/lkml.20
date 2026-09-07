Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC1F4E56E7
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 14:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788790098; cv=none; b=NYTl7jmMH2gvLNgwUNgNp7Bc5BxkTfjtwbeYI2hWn4cPHZY6z5U1r/aPCD5qkJLaMjjR3mdyOU5WppluincWs/Q1LgYYkQCg8jvZwlP7PQHKa2BLU40c/SwMHcimoN04V/xuJcnX1/Qzdnlh1T3ZvL3IHTjegNsLcyWBLTJqkUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788790098; c=relaxed/simple;
	bh=GhuLAYWZOWjLtDee5I+ZRCQi/tLTvHJC8QEGn7BeFik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dPJ/r8lX4hPkRs1ElqSVwZz3ZbtiUD5QZDGFULTl4P+n17XpNsriE5zkuIIlmiJb8hZearSZDcZ05i/qqJ39+hnlYJP4s6CECc3vCDebeD/9j5E8ixqy+M6Ruaq+o+RbU0TJMGTP+0ed0jp8/q/3t4K9LugegyB9GUateyZtJzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=haoLa08h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="haoLa08h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 538431F00A3A;
	Mon,  7 Sep 2026 14:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788790096;
	bh=sr+QCo6xQfPXgTOYYqw51EOYZ9lBSMZUZXOTHvbB0K8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=haoLa08happTKU0G+mwZmJ7e2zLqMXgmLLUYGwLe8QtCs/8rKatRIntZSZEPGeMvm
	 ijISDt+qEL98Z+wDxJCetyAx+Ork/d2fDcc1LhG6HDOv0eyR5iQ4IOfdrfyn4284kB
	 pZrTbEfNoRr2sdFJ4oeglkhWSAIjA8KZ5JZinI4qg4DJ7dmDN5t05MKKsHnh738rEC
	 n77KBxq13Wp8PaKgb1w2YwnM3zlPITTFXNFN92tmfXlIg4/U2fB99MAASYFlYFA5bp
	 xQF3upyDcsWkSJSlX+dGB5XuC0jjb3CZsd61Q7zF0elIIHUyiuET/Iy7emZoWoe02t
	 nOhGbTja7PbIw==
Date: Mon, 7 Sep 2026 15:08:10 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Tal Zussman <tz2294@columbia.edu>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: remove PageWriteback
Message-ID: <ap7FKO_9BdNymgsn@gremlin>
References: <20260905-remove-pagewriteback-v1-1-06f41c00db03@columbia.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905-remove-pagewriteback-v1-1-06f41c00db03@columbia.edu>

On Sat, Sep 05, 2026 at 03:08:30PM -0400, Tal Zussman wrote:
> The last caller of PageWriteback() was removed in commit f75987e543c2
> ("libceph: remove pinning assertion in ceph_msg_data_iter_next()").
> This flag is now only used on folios, so we can remove all the page
> accessors. folio_test_clear_writeback() is not used, so don't add
> FOLIO_TEST_CLEAR_FLAG() for it.
>
> Signed-off-by: Tal Zussman <tz2294@columbia.edu>

Nice! LGTM so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  include/linux/page-flags.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
> index 3dc79c0c5adf..86dd0470da11 100644
> --- a/include/linux/page-flags.h
> +++ b/include/linux/page-flags.h
> @@ -588,8 +588,8 @@ FOLIO_FLAG(owner_2, FOLIO_HEAD_PAGE)
>   * Only test-and-set exist for PG_writeback.  The unconditional operators are
>   * risky: they bypass page accounting.
>   */
> -TESTPAGEFLAG(Writeback, writeback, PF_NO_TAIL)
> -	TESTSCFLAG(Writeback, writeback, PF_NO_TAIL)
> +FOLIO_TEST_FLAG(writeback, FOLIO_HEAD_PAGE)
> +	FOLIO_TEST_SET_FLAG(writeback, FOLIO_HEAD_PAGE)
>  FOLIO_FLAG(mappedtodisk, FOLIO_HEAD_PAGE)
>
>  /* PG_readahead is only used for reads; PG_reclaim is only for writes */
>
> ---
> base-commit: b733fe31e781ed45c56d2ec561dbb61a903693c8
> change-id: 20260904-remove-pagewriteback-69d2aa5b3ee9
>
> Best regards,
> --
> Tal Zussman <tz2294@columbia.edu>
>

--
Cheers, Lorenzo
