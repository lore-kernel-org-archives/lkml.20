Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9BD3932D1
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 02:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791425392; cv=none; b=HGNxhi/8kWR5vK6Us9UkoUDBIwqqhnW0/klRH3syqUt4+K2bBRvYeoVG5BnbKJkSMOrvP6R2ocuh33LNP4/dekNI+Dyb05nNGORLXmjUJ9djvo5Dx96dHHLzD87tM+xAZ/NdyOvTeKlcWADNTOwihs1iTDiF2P9l/8FiB8Z6Lgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791425392; c=relaxed/simple;
	bh=/+qVpi1a8isyFEsxyAdsKChqIba4Y6/B4BJwOBZt/2Y=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=M9dowUdjOk372UZwMJlV4hpsxLVNxA+K4L3kK/2OTzYhLRQ4K+MJVGKh+MKIQKFGAigh/gCRJj6rrFLs67FUETyd/tyHPZWYCnQluiU3OfLfTtSyi0ANMmqoQ4tk+L1vCOl8oBI0pBfCG6OhPoMqW7VXXatH+LOXTs4za8jWiNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Az2xhmjJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Az2xhmjJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6819D1F00893;
	Thu,  8 Oct 2026 02:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791425390;
	bh=sLZyJKiCSgxjVKXmv5xWwSa29qLHX+rbfn8RwKh9OKQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=Az2xhmjJyJZfE4l8JmlfOryuNV+QPUSMgj5lJ5f6iWfOfS4FfugxHC/1T5XdwnqqN
	 8dduWHK9rWqQDfgPbffN+kW0JU7FqgT47QZ3tG+Hux2uJXfEobCP+is5sXu10UR99Z
	 URmf+7fN+GaWQd1KlADB+sgnOwi3QDFogUDGuU04W/7e/x2YNljXpx4pzvLR/9kKPs
	 fD1mJzqGTzhin/B9RXG1QSVNiQOIHsAPTyZUMgDYBhfZdVCT7LYd/kqkk2BbgSdtQ0
	 uFlZesmSbamLTgS0IoP9eDrlmDjlzBwjTm9aQxlokj24o2sSFZ1QSmQNjL27f/K6bb
	 ewzpFgEmf/4gw==
Date: Wed, 7 Oct 2026 20:09:45 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Anthony Iliopoulos <ailiop@suse.com>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: remove unused profile.h includes
In-Reply-To: <20260820131309.14014-1-ailiop@suse.com>
Message-ID: <003df670-51e6-19d3-630c-8eb27c2ac95d@kernel.org>
References: <20260820131309.14014-1-ailiop@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 20 Aug 2026, Anthony Iliopoulos wrote:

> None of the code in these files uses declarations provided by profile.h.
> Remove the unnecessary header includes across the various files to clean
> up dependencies and reduce include bloat.
> 
> Signed-off-by: Anthony Iliopoulos <ailiop@suse.com>

Thanks, queued for v7.4.


- Paul

