Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11CFB4B1CE0;
	Fri, 18 Sep 2026 09:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789722690; cv=none; b=KNii9ClPSlTTYT5su5JD0vgYYqqTVnf4/8QkJV0HCeas8m26EJHNiMupPIU67Kqz2DPYFSZNQDvDejKNt6dhry4RdEZezsDT/PNa5OtXnUxMIEfrzakEBjvfpNTz5NAr59+EyWK5yxrOB+20nOIT/edC04bW7vXXDjNrM0ILQPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789722690; c=relaxed/simple;
	bh=QDovF6IY2cXmjqmBfXW5bRuHL6UkjR3u0TxhkLEgnqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kogIDwly0NXe0ktO4AgWx1M3Ofg4GNuMscbhEjr90auVPFw6GKm3jUwyb/jATdF2s36bcY3WX/8MFVqM5yChZYTN0jVIYEpqTu2r4/zT7zkf+cu79raxEw+n5E2FaCkeGjhZeEAwv3Z7YiHMWPzEntVLonwkxB/Vdf0Z0kR9sT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=STANK877; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="STANK877"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B1DB3168F;
	Fri, 18 Sep 2026 02:11:23 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B8BFE3F882;
	Fri, 18 Sep 2026 02:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789722687; bh=QDovF6IY2cXmjqmBfXW5bRuHL6UkjR3u0TxhkLEgnqU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=STANK877C1Whm2O8uccdlWMmaOMh9bKuHYoKP58NSc/v7I4sfca5KNJ7pPa7+g4Z/
	 GvzUC7/afJIhuBHqmNSLGtCWjBlIvQp1+TJoItEH7D5WBx+CObtdJvHVkSaFVIrJCg
	 hkgR4zLf55tW80Ea1Y0VCqda2FfoXf6FIPYylEDs=
Date: Fri, 18 Sep 2026 10:11:22 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Breno Leitao <leitao@debian.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	kernel-team@meta.com
Subject: Re: [PATCH 2/3] Documentation: kmemleak: fix stale statements about
 scanning
Message-ID: <aq0AOiEyi635ARKm@arm.com>
References: <20260917-b4-kmemleak-doc-v1-0-84fde6d1f749@debian.org>
 <20260917-b4-kmemleak-doc-v1-2-84fde6d1f749@debian.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-b4-kmemleak-doc-v1-2-84fde6d1f749@debian.org>

On Thu, Sep 17, 2026 at 06:47:36AM -0700, Breno Leitao wrote:
> Three statements in the "false positives/negatives" and "Limitations"
> sections have never matched the code:
> 
>  - task stack scanning is on by default (kmemleak_stack_scan = 1), as
>    the parameter list earlier in the same document already states;
> 
>  - MSECS_MIN_AGE has been 5000, not 1000, since the initial commit;
> 
>  - scanning is done by a periodic kthread. Reading the debugfs file
>    only lists what the last scan found; kmemleak_open() calls
>    seq_open() and never scans.
> 
> Fixes: 04f70336c80c ("kmemleak: Add documentation on the memory leak detector")
> Fixes: e0a2a1601bec ("kmemleak: Enable task stacks scanning by default")
> Signed-off-by: Breno Leitao <leitao@debian.org>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
