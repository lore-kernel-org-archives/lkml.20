Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1CCB48E0E7
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790160456; cv=none; b=nsJKfamY6VRKDESCMtBZbz4OXqTL4GsfV57LjPllHg5KjK2rJ9piyCbe/36H5SAbdJ4YCWL8r5mJ52MV4nviNPGTlD4dfqvhUwsL+SlUDCSQTYZA+hTFHlTn7q88ZvRftljHkz0RwStWw5OPdwt6QNShwKSaTxZR/jrqGR6IkII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790160456; c=relaxed/simple;
	bh=jBpobpGD6Ea5rJoVfzQTN7ysJ2G/gw8VNJRkAAGh20k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KStgYYg6fETylfglZiSBe11nW5m8Cx+vujECBlhYlEoseSBIhtAMz4gAS+Kjn0v1oZKktM5yCeiWDKLTyOoZXvf0dCegvaQb0avnEGNOvI8pu2C7NTx2bBsNKhcXsbeI/ddYhAXDiX6FPRAESMn3eR4TpzNBxQcA1XOqa4XjhCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=oltc4gXy; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="oltc4gXy"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 27861143D;
	Wed, 23 Sep 2026 03:47:08 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C63FC3F86C;
	Wed, 23 Sep 2026 03:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790160431; bh=jBpobpGD6Ea5rJoVfzQTN7ysJ2G/gw8VNJRkAAGh20k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oltc4gXy8tuCEPLl8q04CzNR/M2uenYDnBnMu3UBGTi3Torjd7pC1U7F1T5SRjm/s
	 GrTdEKfdLYGY7NiOGO8bqTXh4rBHevv/UctDKm6ABR5WXJmD4pDTY5K/wSUsXaFHCc
	 SKzG87M596tYPnIzCnJR5XLCEGs7yh3k4BQ1yPDY=
Date: Wed, 23 Sep 2026 11:47:08 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Breno Leitao <leitao@debian.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 2/2] mm: kmemleak: scan the struct page array in
 MAX_SCAN_SIZE batches
Message-ID: <arOuLEZfEqmce4iO@arm.com>
References: <20260921-b4-kmemleak-page-scan-v1-0-fb97d4801b3a@debian.org>
 <20260921-b4-kmemleak-page-scan-v1-2-fb97d4801b3a@debian.org>
 <arJPsqUSHGiitXQR@arm.com>
 <20260922183921.b30bc1c3ba9443e021910851@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922183921.b30bc1c3ba9443e021910851@linux-foundation.org>

On Tue, Sep 22, 2026 at 06:39:21PM -0700, Andrew Morton wrote:
> On Tue, 22 Sep 2026 10:51:46 +0100 Catalin Marinas <catalin.marinas@arm.com> wrote:
> 
> > On Mon, Sep 21, 2026 at 05:30:27AM -0700, Breno Leitao wrote:
> > > scan_zone_pages() scans the struct page array one page per scan_block()
> > > call:
> > > 
> > > 	if (scan_block(page, page + 1, NULL))
> > > 
> > > scan_block() takes kmemleak_lock with interrupts disabled for the
> > > duration of the call, so this acquires the lock once per online PFN to
> > > scan a single struct page.
> > > 
> > > Gather runs of adjacent eligible struct pages and pass each run to
> > > scan_block() in one call, capped at MAX_SCAN_SIZE.
> > > 
> > > The longest kmemleak_lock is now held is MAX_SCAN_SIZE worth of words,
> > 
> > Remove an 'is'.
> 
> That was actually correct, but it doesn't read well.

Ah, yes, you can read it in a correct way as well ;).

> > Also, MAX_SCAN_SIZE worth of bytes rather than words.
> 
> edited, thanks.
> 
> How's this?
> 
> : The longest kmemleak_lock hold duration is now MAX_SCAN_SIZE worth of
> : bytes.  The same bound scan_large_block() already applies to the data
> : sections and the per-CPU areas.

Looks good. Thanks!

-- 
Catalin
