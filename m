Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 706463845AC;
	Fri, 18 Sep 2026 09:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789722658; cv=none; b=S+G9HHmBUAdR2ot6joS5XgwKlwe8E/HgWmL92eA//D78XNsn3AEk8/la7xFfuo2QlOArx6hav9Uxrc45h0E0fiVo/CTjahw7M9QSINJndn/awRjJHz8JDLAF3MCIFXh3pgucqJDx93wtOfn+xrVhADbO0P3EN9TuLSCxcmfjRqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789722658; c=relaxed/simple;
	bh=0Gs4DhCYwB3KNPu9eHCxhSGFokYsZcGSeJbNemazHxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ikM6Yp7yvmstw77dSQDtP2/NGrA59H7jDAr0RuSTxheusPwe2bYNcdVozagfgAzhD0QFMYOwdO+2BLquiBe1kYp4gaSFhAXqmbc8mzrtps6BBZAnHuxCZZJxK2RMt2BH+VEysE44jdJN9WSpTnFX3sUMb8/8iB7MIE5aMFRQoxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=bz+TTwjs; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="bz+TTwjs"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 241591BF7;
	Fri, 18 Sep 2026 02:10:53 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 688683F882;
	Fri, 18 Sep 2026 02:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789722656; bh=0Gs4DhCYwB3KNPu9eHCxhSGFokYsZcGSeJbNemazHxk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bz+TTwjspbB5CaBJQxhzIc+/C1YNfnXZLlT/T5yo6haK6KNwifGYUJynU0DrbRGwX
	 vf4N1YThDlrhFR4eQCgJt1MZJGlooz1TqPGxlRH2RyPPuc+n8XzbLDH3PMakjlMfTD
	 AV+DOvFw/Z5Mw10nwAD/y+QnzprCz/BN1XOr+fr0=
Date: Fri, 18 Sep 2026 10:10:52 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Breno Leitao <leitao@debian.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	kernel-team@meta.com
Subject: Re: [PATCH 1/3] Documentation: kmemleak: describe the metadata pool,
 not the early log
Message-ID: <aq0AHKSkUCSeQMV2@arm.com>
References: <20260917-b4-kmemleak-doc-v1-0-84fde6d1f749@debian.org>
 <20260917-b4-kmemleak-doc-v1-1-84fde6d1f749@debian.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-b4-kmemleak-doc-v1-1-84fde6d1f749@debian.org>

On Thu, Sep 17, 2026 at 06:47:35AM -0700, Breno Leitao wrote:
> commit c5665868183f ("mm: kmemleak: use the memory pool for early
> allocations") removed the early log buffer in favour of a static pool of
> kmemleak_object structures, but the documentation still describes the
> old mechanism.
> 
> Fix the documentation by describing what the pool actually is, matching
> the Kconfig help text.
> 
> Fixes: c5665868183f ("mm: kmemleak: use the memory pool for early allocations")
> Signed-off-by: Breno Leitao <leitao@debian.org>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
