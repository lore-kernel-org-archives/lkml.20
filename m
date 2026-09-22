Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C9A34C8C49
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790070482; cv=none; b=oNqRnEx8A6c5tTXoK9Vcwv1u+68ofyJ3ZmTfzdt8oqUx64B9WgaXNlXhm+ik33Q3y9MD1X1t9pvdh3Wn7cs6YNt/J9Kv4aUOhpwPb4ZWsftiO7fzbNolaPy2VQck223x/QxH0AY/2R30xkNR0cBApUzoBzkZMCoGDExpO0w7jOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790070482; c=relaxed/simple;
	bh=rrBXrUQcOcOTfzP6wbCiHxJahN45dpxh528Z+9Tu99c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=II9vewEzR15EDutZnmzMLKTgy4gIy5lu+7FZV/cyKL1TENsoIjishk3w8+w71RA/B5TDZ81xrOSpDeJNVeWzuXF/Mp6USWktIXz9BgppXWPjnlIE06qejWkFNVpyxHLGDXbmfUD6LpII8rkY9xsOsXpG38Rik5AoI9kw5m/IyJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=IKLmrhNR; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="IKLmrhNR"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CAC131576;
	Tue, 22 Sep 2026 02:47:49 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5C0ED3F528;
	Tue, 22 Sep 2026 02:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790070473; bh=rrBXrUQcOcOTfzP6wbCiHxJahN45dpxh528Z+9Tu99c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IKLmrhNRyFpezR6tHva6Ees7rZuSKc0N0nyLKOJD3tv0og7n2NYCkDAc0s1hn5cD2
	 qppUXEm6W+5Nc7RkxNuv1tnVLIMYEsrk8j90cZCgRmn8OEkfDYQseFUgMBuNOxn2VE
	 mP8chhFgjdlCaW8uO01M1rQ2v+nvFzyZ5UVm1cM8=
Date: Tue, 22 Sep 2026 10:47:49 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Breno Leitao <leitao@debian.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 1/2] mm: kmemleak: move the struct page scan into a helper
Message-ID: <arJOxbz_phnaqWD-@arm.com>
References: <20260921-b4-kmemleak-page-scan-v1-0-fb97d4801b3a@debian.org>
 <20260921-b4-kmemleak-page-scan-v1-1-fb97d4801b3a@debian.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-b4-kmemleak-page-scan-v1-1-fb97d4801b3a@debian.org>

On Mon, Sep 21, 2026 at 05:30:26AM -0700, Breno Leitao wrote:
> The struct page scanning loop sits inline in __kmemleak_scan(), nested
> three levels deep and sharing the caller's "stop" variable with the
> zone walk around it. Move it into scan_zone_pages(), which scans one
> zone and returns 1 if scanning should stop.
> 
> No functional change; this only makes room for changing how the pages
> are handed to scan_block().
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
