Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794545060;
	b=s/u5Ir+08CoEUGUCy4UswmLqeb5PsftERS+oH6wWX5xC4mOueJh2rTFAbraS8xTProc1
	 zzitQv4Cbn6a9z7s96l0nsjD37G/XBbyZMEvEZFukNBzygy/Z65sMPYGBezhlFib6WAAF
	 4zaAxfbTaI4w5ZNS5MopUOjc9lb2GUqqB1aaRlF8qSLn6mfGaQOkwe9Z2bt7FsQcLIAI6
	 GhBZ2cRcfLVZdUNLZKOx8+5sT+yMHO3G7tv+nJBypEoVVf+PWL2YpIfMcdiUg7ZjAYrN6
	 PeG6SOOdb0aaywS835BXdWhsmCgpXLSbwiZHkJH+w6OxlSmm8u4KF+lfES/Sg8mvEdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794545060;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=nyGN+nVCQk2jGiiRX5tOBHHujsmmLnwl4mJOZzL7bkQ=;
	b=G5+xQhSmh2U6TPa2/MkQqzQWi3DP8qBVKJX8v5lHDw/t4e8VH1GIPTg1/jFpq2/Fvy+s
	 cWA4O4Zx/ygwzo8Cl/6YSuuTFO3vCEUZh2Cr2QqViDIc5OSyGjDKkwz77qvEWaGEUPi8B
	 GaetbiEVejyE/kmKekvDyA4fYufcw2hSqLlXkorcmuikTMfV24+hbQB5BQjqpnf0JRC4m
	 CKxGeXXZNTK2brC0tRM86wpBhlahgERcmVZTX5jV1t9xkYaICbVZSNcm5ylyDSnGJBjCd
	 ZN6rYPV62FKQEYpNXPGor1ea6CGZh2EkDeZ7AAshtILMnJJ8W8rcT5YbarzBQYRF66A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=dDJ94GWp;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C5D606A327;
	Fri, 13 Nov 2026 04:44:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75C5D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=dDJ94GWp
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 43EAE40E021A;
	Fri, 13 Nov 2026 04:44:17 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id YanY5FfRt11J; Fri, 13 Nov 2026 04:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1794545054; bh=nyGN+nVCQk2jGiiRX5tOBHHujsmmLnwl4mJOZzL7bkQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dDJ94GWpOI8VTlG2lGKYD0quI/UY4zqz6AMI7ho6MlpqSUWhLQx3HS9/cB7LMBoMz
	 9tfV1wQzImWxsCzSj4c87LY55d6xeCx3ksvO7k2DYQW9DJqsUHxUvX0W7Y1CHD2D0q
	 lE5EA4SWvedlXetFjg0G2IGjyuxnQajJux6iAXJU/SIwgk+Smp95muaJCEfWTYQ+kf
	 pHwq/9utBXR+w5bZO3ZZy3y6Gt6/oheBOcZOSToydA2sn21+ZwJLCDLPvwp2BJLkNY
	 ipRAMfXW3BJ/wSNpsWBkmy2tClGzR9jge8v1SZ/KsBbWzlUe5ouRZDaTg5XsnX6uU4
	 8a+HmIeiXmluIfp6cceUcHRMeCyM9fgP1TLC8gs2TuX1rUswIgD+YRS+vMX+saEpOU
	 /b/0hxZ+3WXyZuD3cyxsWr3QWW0QIeL+mFyILYMslQKfuAu/wcWzNy+Amymh554zqU
	 cbHmVYlb14bsbZ8wMNh33JuLXxGON3WqcNROajnRy5Nbj2fbJLBrE1MpSU6SCgM68G
	 /RmZojPzWlPNl2oq+IMAf6kLdWzeWawpX9DCUA4tvOaYYOhJvsnV6h2YtUX0/GPcWq
	 k7rmBUe2pGII6hCdqVRcbMc4ea6FhqFRCC4ugnRTKJKn9bcS2lnyDK2qlyCOsuXsRG
	 ab/ab9H8Vdu9EEeZtwtb9Qfs=
Received: from stx.tnic (unknown [209.52.143.85])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 9494C40E015B;
	Fri, 13 Nov 2026 04:44:01 +0000 (UTC)
Date: Thu, 12 Nov 2026 20:43:57 -0800
From: Borislav Petkov <bp@alien8.de>
To: Lin Wang <wanglin@open-hieco.net>
Cc: Yazen Ghannam <yazen.ghannam@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Pu Wen <puwen@hygon.cn>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Tony Luck <tony.luck@intel.com>,
	x86@kernel.org, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 2/7] x86/hygon: Map CPU NodeIds to DF nodes
Message-ID: <20261113044357.GBavaVjdHaKh3oni3q@fat_crate.local>
References: <20261029053313.46323-1-wanglin@open-hieco.net>
 <20261029053313.46323-3-wanglin@open-hieco.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261029053313.46323-3-wanglin@open-hieco.net>

On Thu, Oct 29, 2026 at 01:33:08PM +0800, Lin Wang wrote:
> +static int __maybe_unused cpu_to_df_node(unsigned int cpu)
> +{
> +	if (cpu >= nr_cpu_ids)

That cpu and nr_cpu_ids mean nothing in a guest so I'm thinking you wanna test
hypervisor first...

> +		return -EINVAL;
> +
> +	/*
> +	 * The NodeId reported by CPUID in a guest may not describe the
> +	 * physical DF topology.
> +	 */
> +	if (cpu_feature_enabled(X86_FEATURE_HYPERVISOR))
					    ^^^^^^^^^^^^

> +		return -ENODEV;

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
