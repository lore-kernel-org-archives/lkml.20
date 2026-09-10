Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214D66DCE1;
	Thu, 10 Sep 2026 03:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789012787; cv=none; b=Iq8KMIVkucx0VU0JYV6QJl/gAEAjL/bcnY22DRCu7b4Xbr+LahhtwYLJpxyLjrmXlYOhod1JAYsd2hcd2BQWzJ3qs0MrBeST6lCUjfxFUxj52fYBBwmFl+P64JM5YPZr0to28fudA+rHmOidZG6kHM+Pkr+gk5EuH55YhKS6YtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789012787; c=relaxed/simple;
	bh=AQ3nMLs4AE69MR4ahHGkQVD3dp1XMaMp5qM0p3jSnEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ov6V2cQ0lGiFnVn+B5KXtodr/yhHYfP0aAYir2gFz2Os0ibFwwSoPdAb9vPlm7qleDllL69K22inRT8XUAz79j+VbXlJPPmKBgVaxIkca1HBMBUiqO8+5YjqJxOmEUXRjNGCkaIH1lqRRJoxMloXIh8lfsyM1KF9hNmEjEO4hwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=CLS3GiiF; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="CLS3GiiF"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id A919740E02DA;
	Thu, 10 Sep 2026 03:59:37 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id D69c_iYK79Tb; Thu, 10 Sep 2026 03:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1789012766; bh=LqBpIY6MU7bms/ALFpBzxazqnXxjtvMKsYAiNvHgwoQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CLS3GiiFDSge57DOVP+YEZ0f0CPkE30/R1ztw7yN+HMWy0Xdum2x14hJBLXaJcx5w
	 Ft4YBLID6eHbscM0uZ2/zWGC55BG30FUaTSqHYFJLMq6bGyT+7l4UOxtmoAZl2+B/3
	 wFN6CdTILbxbMBGrXePFQpGpqFoCtUlchWJqlr5AVMVVzySe2SuK9a47wbTvg04d3Y
	 tW/P/X2TpLZugC7KtW8T3HMkX/k4DP04sUrDfpGX8UxOcpzIDMxACRH09XJ+m+X7LD
	 aFNVN/+WOHM6LzXv9vu200OWhBcQOvILvWXM2/OrP9mIdssS6afP0PX2yrSOuLpr0t
	 388WinKkVUypxmXnlmBfUye1i/3uyoLmcLTrGGvyb/mRgiA9K1Qn5D3tqUeo+jOSHs
	 sRC4lCFWRcRMRVr6+9gmFgexIL92BjApRu7jAy6uGHHpFI2GmmeqyKgERMhdHvJGi0
	 1FVeisQssdZ72Zg0jJLWzw8I/PcejPdspsgixVWbgTZTF2QXyOgpLd0BphLcSHYVxe
	 3Rkc9906GQ9RcG3PmPejUEkll75vHZQI67Hp4qZ93heehIPjGqr7egtynW7YMVCUMB
	 SM3eLEjTjCd1vHkcMab/7ryZWSkXATHAcOvXHI8suHulRh6LcPo7dn2GPNPLZfKD2P
	 BFvVKSYaCPLC9Tg98R1wOOQM=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id E47D040E01DD;
	Thu, 10 Sep 2026 03:59:18 +0000 (UTC)
Date: Wed, 9 Sep 2026 20:59:15 -0700
From: Borislav Petkov <bp@alien8.de>
To: Yifei Chu <Chuyf26@linux.alibaba.com>
Cc: Tony Luck <tony.luck@intel.com>, Avadhut Naik <avadhut.naik@amd.com>,
	Yazen Ghannam <yazen.ghannam@amd.com>, linux-edac@vger.kernel.org,
	x86@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/mce: Zero the injected error record before logging it
Message-ID: <20260910035915.GDaqIrE7Jm5Ww9_Wf-@fat_crate.local>
References: <178901113715.2666699.12712427139715728985@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <178901113715.2666699.12712427139715728985@linux.alibaba.com>

On Thu, Sep 10, 2026 at 11:32:17AM +0800, Yifei Chu wrote:
> Reproduced with CONFIG_X86_MCE_INJECT: writing "sw" to flags and
> injecting a bank/status makes the mce_record tracepoint print random
> vendor data, e.g.
> 
>     vendor data: {0xb3,0x8a,0xb5,0x41,0x0,0x0,0x0,0x0,
>                   0x67,0x93,0xbc,0xa8,0xff,0xff,0xff,0xff}

And? Who cares?

> Fixes: d4fca1358ea9 ("x86/MCE/AMD: Add support for new MCA_SYND{1,2} registers")
> Cc: stable@vger.kernel.org

Backport it everywhere? A MCE injection fix?

You must be joking.

> Reported-by: Abaci <abaci@linux.alibaba.com>
> Assisted-by: abaci:qwen3.8-max

This is now

Assisted-by: LLM

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
