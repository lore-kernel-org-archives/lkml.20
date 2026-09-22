Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE0634D4898
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790070720; cv=none; b=BZhfA8AJCkt3uExbNYYw+T+mfTfyM72QDtU/Pc0weDKa+6zM0C8ZPSHqCZLcLy+6WDiyNL38/W2MB42L7I0INENW8Giml4TkN2n50SxEFt94usgY29g5Sqg+5pubgoj7qWV0aVPQROskFWZXA9TXma1QkZZHnCvUjIiPWzmTbps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790070720; c=relaxed/simple;
	bh=m8dsVUe9VmybSB8L2iZwJ4I5m2KEM3g6YTnaSnesjQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MQ89rvHFXVhW5rz+Elc9cfJ1daBCwZHYyWkSCsCQwjprAcc8pVioXB8xg1PBp37Wpa52oCj3mTKDJOVxoWZ6o2nIqo0Wvmbmn4f+QA7Rb/UxKQuhhC/OCa/JDxtHZBK6Shm4yu7+NFFJf07qI+AH5uVwsij3THGChk+BcCgvyUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=BM48WV7h; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="BM48WV7h"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3AF371576;
	Tue, 22 Sep 2026 02:51:46 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 05C843F528;
	Tue, 22 Sep 2026 02:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790070709; bh=m8dsVUe9VmybSB8L2iZwJ4I5m2KEM3g6YTnaSnesjQY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BM48WV7hYmWiUmnDxQ3oRew/uliRrgx0D0KZyCHyPfwsttd7dkn2czRr/XktATdY2
	 DkRKudakyQe/pHVQAnqysUhYelbsKoNTuC+5yy+NCSgn85p6n6Y8rGFsA7/W9m97jd
	 FOBKjpSZGGN10bSF/gAGt0+nT8zKt7skFxE/pgUI=
Date: Tue, 22 Sep 2026 10:51:46 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Breno Leitao <leitao@debian.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 2/2] mm: kmemleak: scan the struct page array in
 MAX_SCAN_SIZE batches
Message-ID: <arJPsqUSHGiitXQR@arm.com>
References: <20260921-b4-kmemleak-page-scan-v1-0-fb97d4801b3a@debian.org>
 <20260921-b4-kmemleak-page-scan-v1-2-fb97d4801b3a@debian.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-b4-kmemleak-page-scan-v1-2-fb97d4801b3a@debian.org>

On Mon, Sep 21, 2026 at 05:30:27AM -0700, Breno Leitao wrote:
> scan_zone_pages() scans the struct page array one page per scan_block()
> call:
> 
> 	if (scan_block(page, page + 1, NULL))
> 
> scan_block() takes kmemleak_lock with interrupts disabled for the
> duration of the call, so this acquires the lock once per online PFN to
> scan a single struct page.
> 
> Gather runs of adjacent eligible struct pages and pass each run to
> scan_block() in one call, capped at MAX_SCAN_SIZE.
> 
> The longest kmemleak_lock is now held is MAX_SCAN_SIZE worth of words,

Remove an 'is'. Also, MAX_SCAN_SIZE worth of bytes rather than words.

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
