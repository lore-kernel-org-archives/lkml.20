Received: from flow-a6-smtp.messagingengine.com (flow-a6-smtp.messagingengine.com [103.168.172.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DF9359A90
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 15:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787843739; cv=none; b=Ik/57BR82iS9UdFS0oD/38eRbDzBzXnxNcRalINi4Y/pp3xoek/6Cpu4Pda3EW/SUKsqiW6ZD8XsR1H7QhYkV9DbUEPOwmlkZojbTVLLCVL+M/xusAbmdg8DUTeXyv7HG4shAotyOj9z8vVEDwpYKY67jG2npxDqD1k49TBWN7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787843739; c=relaxed/simple;
	bh=FLQ6GILkFwLfKND/7MjEdZkSy48ZgDTKejDD3W8N1/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EsOYl+Y8egv+cXTwJg15UHx/iZMaRLLElg5lh9uYqNmpztkIT0n50c8BAavPS39R84PZNpuGGSwNBpqs3zzHe6OBKxlfb0FDSW1CfTPJsiin5C02LZKXKAXtAAuEIyAaoWbIkynlW2ViM+YUqF4H8fjfhiobeDygut6lXao5nnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=Vh8rLUYA; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=elE2WPi0; arc=none smtp.client-ip=103.168.172.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="Vh8rLUYA";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="elE2WPi0"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailflow.phl.internal (Postfix) with ESMTP id 32CEA1380023;
	Thu, 27 Aug 2026 11:15:37 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Thu, 27 Aug 2026 11:15:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1787843737; x=
	1787850937; bh=w7v3jZKyW5YM/dZvPHiNitrQbB/s0Wrf3eO5lZfLNvo=; b=V
	h8rLUYAEp6IBdGqRDW3bR20Q8yA7ENN7eqrmvHy0PDCFf90onNqb9+wGJYTa3Cft
	wskH2UNXDnn3ybOY4l86B301cTdxVJspQ6zQFuFErdpHz0oRbW2ouu65RAJ2LIeO
	jumFfgyaZIRX3SrRcR5O1N40P1xcCzQzelzwaalbdFEJBS4Ppafs3RVwMjhfQweY
	WIZ76jBo6ZuXnPmX/yNytavQ7yFVAy+e0gZiZ/hu5Q//VOWPKsxwq8ObkiadMO9x
	rQH71Ga95PAQwrBhIvdT3CqKQrftcKV8kav2GYcS+egAlx5Ds9WFOeRY68RgbiS/
	laZfB5eHrVKubPhvphQTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1787843737; x=1787850937; bh=w7v3jZKyW5YM/dZvPHiNitrQbB/s0Wrf3eO
	5lZfLNvo=; b=elE2WPi0unuyaqdBwDmtf4TTMIehjErNAil5+mWE4WtYVeyiuLx
	Q9KfgEX8yCLzNGhfpgBGHhSJsxjAyKKb0PLmZGK1N39Ju57niUOulvUrXF0lxkh+
	uFZypeFwMiCT8bLoKJyEm0a/kojVzXz7lR9IrfENS0fLJBq3+4p+bypmf0V71zJR
	6/snfMBIha9cFQkFoIePrjdotiIwPGUTgZppMkx6DEfo3pcK1DWycfc06lBTuIfQ
	ZdQMInmIl8moFiKsbFu5J2U+bPOvn///EWpKiCEhXOxYQHzADLPKV3REpM7IS9cA
	o9YW/iQqc2MHoGJO0UXSeKn7K0CiFDlzxGg==
X-ME-Sender: <xms:l1SQamo3GtLojnOzVAUjlhsW__lSX8S37BnxT0hoAGRN0vwJkb3qqg>
    <xme:l1SQajHlG1c7DmBjjUxS5NALq-jAmGXlF9QIWVthXmPKYd-mb_fbJ-Qiq5QIuqy-O
    0V--SnEhx5QKWgQnzwyzH_tORm0bbHcmadz5LiT-yiwoEV4IEmBPZeV>
X-ME-Received: <xmr:l1SQaiUjY-2MsoHSA-byma1BGA2z3fnXTF_Qst2Uq8y-0dudqKhFhJaDL_g>
X-ME-Proxy-Cause: dmFkZTEK2w8SRbJqzGnH6ehcVK5N1qa5p52AX6WHPYzFNTZiHkb2XIoweUi+AenE+O52CY
    jnx/t5shrleOg8Roeoj1Awr1mVPEkSbBBUa/blkcFR2EIeGEtMLr5YMn9gIebwPs615/jG
    5MrlYenrv555VDhVYUXwZYPJstEhfJfeBlpC38ShgRGy3/C6X5Hx1oWf6v685LC9i8/Xub
    KcacxxWxHv2lzAy+H4Ljqul6w7o45k9q99p0sX7icTcOkqRMR0CjAF91iJ7eOrNtOLRVbp
    5V1FQHrNtyPXTEfWGz++lNNUongVLq06lmIl4uaGADJuKpJVtkfx1XLxdfx2hNYhnaanBo
    rAFHBgKSVvn1SjfBcWx3CTavhB0j6bpN9SQo/qVVoSUHQN9v9gyT1/rXtqjYU/f4HLLCav
    g83GQ5YcK1lY6rCqJSA7EOkzvjQsXy8DtMmHIP0guoihX0EID5N0XNxU4BWGLm3fKJloQo
    Ko9zL2sSl+7XasTyo/rVRDPorv0ONc1jO9fKn0lfR03UlbViEo4krJNd8EgBHq62sMPEjY
    Owk4itnnOOMod4qctfpyS8nD3DkjAIoi0mR2KVaMXXQb1x4dlwjitVILmOYXpvGikCh0aU
    AnqWbyCjXHxv7uA73tPCSbi/N8o744pxlHzPZ8bpCJ8EKZji4XuwSKcsi8Lg
X-ME-Proxy: <xmx:l1SQapfpH1PoP9-9NAVqdo8yRoSTEDpaqL2RRuKw5EeejUTp76eGaQ>
    <xmx:l1SQapQ7jHsAy7l81qsh5lHFXyDFDC7Zp0UO6Iwey2gkRsZkGhsDkA>
    <xmx:l1SQajALTqetQVYAVWOXM_2421xwPW2MyP_t2d5uSR6CzENCQk0ilA>
    <xmx:l1SQanuWtsQ0DLKTXoOY7vGA0ScKlcnaamBJzsvEJE8MhPOfD-RB2g>
    <xmx:mVSQamTGGg9Mv1BBnEqNNU8yxMe2u4A3mKUgG01VfG3wZz-04HyrAKO2>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Aug 2026 11:15:34 -0400 (EDT)
Date: Thu, 27 Aug 2026 16:15:33 +0100
From: Kiryl Shutsemau <kirill@shutemov.name>
To: kasong@tencent.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Chris Li <chrisl@kernel.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, 
	Barry Song <baohua@kernel.org>, Youngjun Park <youngjun.park@lge.com>, 
	Shivam Kalra <shivamkalra98@zohomail.in>, Kairui Song <ryncsn@gmail.com>
Subject: Re: [PATCH v3 06/18] mm/huge_memory: consolidate irq and locking for
 folio split
Message-ID: <apBUezypL2aITw-0@thinkstation>
References: <20260821-swap-thp-cleanup-v3-0-9b43f5163238@tencent.com>
 <20260821-swap-thp-cleanup-v3-6-9b43f5163238@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821-swap-thp-cleanup-v3-6-9b43f5163238@tencent.com>

On Fri, Aug 21, 2026 at 02:55:19AM +0800, Kairui Song via B4 Relay wrote:
> From: Kairui Song <kasong@tencent.com>
> 
> Let each split helper handle its own locking instead of relying on
> the caller, so both helpers manage their own irq and locking state.
> This lets __folio_split() drop its local irq handling and fail label,
> preparing for further cleanup.
> 
> The file path now uses xas_lock_irq() instead of local_irq_disable()
> with xas_lock(). The two are equivalent on non-RT, and
> TRANSPARENT_HUGEPAGE cannot be enabled on RT anyway. This conversion
> also buys consistency: every other place in mm/ that freezes a folio
> while it is still reachable through the page cache already takes the
> lock this way. This was actually the last plain xas_lock() on
> mapping->i_pages left in mm. If we are going to support RT, spinning
> on frozen folio refs could be a problem, but it already exists in
> many places and should be fixed generically.
> 
> The anon helper keeps a single local_irq_disable() as before, because
> it has to cover several plain spinlocks at once.
> 
> The dropped xas_reset() was a no-op as the xa_state is not walked
> before the xas_load() under the lock.
> 
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: Kairui Song <kasong@tencent.com>

Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
