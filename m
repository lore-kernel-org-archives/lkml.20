Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6775A367B94
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790129890; cv=none; b=OcPHbFOPt8ptedbsbB4iVS+YST92eQjA+6PtdVCOtBPVgZjvjqQz2+ksvg7Vs6oE2kcuC2pAH2se6X/6ckW+pRhURrbmNoqOqOonfgcLehm9G0leUAz6CAeGivHwgLuZuD4ShjWoKJexlUxZ7K8XooQKUDXSXxX69GlWUoH6pMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790129890; c=relaxed/simple;
	bh=nOVW/5nLaUpcAmlUNfD7Caq5T4TUqe/yCy9FK2vPuV4=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=IqhkZvxPj8rSe/7HzFIGkGmh1FvomfMkngc6u+ahwQdTIri0Dt8xFqTsAIoQaWPaz9L1pnfOl4laGUIX361tgrUr7pARI8vGORPnuH03dd+vC93IjuUtifKm3fhBKBH44up2FdVknaW14QDtfzbd1XG7ClvHsCSqHh25H5dDQZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=huIxadJN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="huIxadJN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06E8B1F000FF;
	Wed, 23 Sep 2026 02:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1790129889;
	bh=nOVW/5nLaUpcAmlUNfD7Caq5T4TUqe/yCy9FK2vPuV4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=huIxadJNOapBS/lOIsWhk8vDSUSKz2/vCkwaDooEOZK9m+qeZB0rewh0Y5Z5uix3b
	 thn+9TVisQMp1dxq2/ZUNBwP61U6vF360zJLwzFsEzw2/B8cUsdtR0MnL5bG6rShIJ
	 SXpUfbHOcbV91+EPusXJrC4tnKCSp6rpbtm0N76A=
Date: Tue, 22 Sep 2026 19:18:08 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Bence Csokas <bence.csokas@arm.com>
Cc: Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Yicong Yang <yangyicong@hisilicon.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] cache: Make cpu_cache_invalidate_memregion() error
 out if there are no handlers
Message-Id: <20260922191808.b82fa138c8bc80a1285e8ba4@linux-foundation.org>
In-Reply-To: <20260922-cci_enxio-v1-1-00bade212729@arm.com>
References: <20260922-cci_enxio-v1-0-00bade212729@arm.com>
	<20260922-cci_enxio-v1-1-00bade212729@arm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 22 Sep 2026 09:29:31 +0200 Bence Csokas <bence.csokas@arm.com> wrote:

> Currently, if there are no registered handlers,
> cpu_cache_invalidate_memregion() returns 0. Callers are expected to check
> cpu_cache_has_invalidate_memregion() and return -ENXIO themselves, instead
> of calling this function. If a caller forgets to do this, they may
> erroneously think the operation succeeded. This is in contrast to x86,
> where cpu_cache_invalidate_memregion() itself checks if the operation is
> supported, and returns -ENXIO if it is not.

Do you expect any callers to be altered as a result of this change?

If so, full details would be helpful.

