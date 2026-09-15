Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59525226D05
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 00:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789432210; cv=none; b=tV0LjV2z77yX455fYmN/nsjwUU6ZfjDaUDUblO43gLX5e7XKaLjJa3FzT+Hs8ui+v5FuY8FULrV9A2D3HE6WM/k443b2AtNJLJC3gN74fUlpOC47g9BpDQBQxIS5d50zQW/9A0Bw6hyUKm+YORA8YiSUUMFw4gngYri2zEoAHmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789432210; c=relaxed/simple;
	bh=5psPMetdR6wXtXiN04r6FQNCU/jFmrua8WF+M0z+cZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ciyzq889H8RaNmAsisDfbKm/s3pgLlVK/B3p9l34RRO8zGoOSClIQuzD1pXmpYs74+xZMGXp0DMbbZphKqVnn7I6dvJLvEdRJdx3G6WQxzpaBJAiDQbZf9fuQxCIVmsO5RlrUlJCuP1GpjGzS5hCsMQw8wMHbBq87kHlwa+U0vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=bA811IOc; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="bA811IOc"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 1134D40E0173;
	Tue, 15 Sep 2026 00:30:06 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id XR39YgQ5l75b; Tue, 15 Sep 2026 00:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1789432196; bh=tylIh9nOV5/JOC9lteZex5BaGkPGrepf+mQ/+1Kn94Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bA811IOcWjPoEjd8bhs0TTiVsigCkH2Uthb3e+Gy8iqKvsR6dffVLxcQ5eiPbX/Ne
	 kuZk5ILmsZ7if0kUp80PZTDwHYoFIiFg20vy+pzXdEP5WftmersBWz6Fzs4pxyJdV4
	 h9IZ8+pacV15buktOcwMJLqPPnNPopISrP8P0vypox6mQJckjJ1eDOAK+wmo2au0HN
	 5jqttsV0lnWU5GY76RRo46bjV7t6cmgO7nUzwx/S7GR201q23qejfLIoR1wxcTV5Bl
	 c8EzFqYU4rJz4F8slTe7P0OxXYzi0KUYS4txgTt4ZIchVrfLcAyoP8jg5sh6fkIwSN
	 uHwaQY/gMcDFoY207kyRlf+pY54/+L98tMrOxeyBKyyMW8dh0Ew8xWi6lKdvviaTAp
	 gFl8N4dOjAszwtLYmUDva/eeFwi25uU/7RqMMlaj6X1LVB0bj3xLOw6/an7mjIx/lF
	 I2oLrp40SqfakcBY8gEz5LSzpJy3OsFXNjtE97bKhg4yAuyV9t8OdCuG5FaGrDc1lU
	 Bof/5e47zoejUdnr9T+KAoewVfDlkI1+uRdoustS200sCI3hPjfNCDr1p1L39uBfxi
	 mo1LplHPWn4s/IYfmLl8QUgRaa1DFPrydWc/l4CtQkTonl6CaZPORZxyBosCx7wMQP
	 g9c6jlEmf+oFDaPeVw+8h77c=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 5E5E040E015D;
	Tue, 15 Sep 2026 00:29:44 +0000 (UTC)
Date: Mon, 14 Sep 2026 17:29:40 -0700
From: Borislav Petkov <bp@alien8.de>
To: "Naveen N Rao (AMD)" <naveen@kernel.org>,
	Ravi Bangoria <ravi.bangoria@amd.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Bharata B Rao <bharata@amd.com>,
	Manali Shukla <manali.shukla@amd.com>,
	Nikunj A Dadhania <nikunj@amd.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH RESEND v4 0/3] x86/apic: Add support for additional AMD
 EILVT registers
Message-ID: <20260915002940.GDaqiRdNKYpyKgL2_B@fat_crate.local>
References: <cover.1788425679.git.naveen@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1788425679.git.naveen@kernel.org>

On Thu, Sep 03, 2026 at 02:58:38PM +0530, Naveen N Rao (AMD) wrote:
> Add support for additional APIC EILVT registers being introduced in 
> future AMD processors:
> https://docs.amd.com/v/u/en-US/69205_1.00_AMD64_IBS_PUB)
> 
> This is a resend of v4, rebased on tip/master. Previous posting:
> http://lore.kernel.org/r/cover.1784785046.git.naveen@kernel.org
> 
> Since then:
> - I have retained the macro name 'APIC_EILVT_NR_AMD_10H' since I felt it 
>   is accurate, and didn't hear a preference for anything else. Happy to 
>   change if needed (Ingo)
> - I have gone through Sashiko's findings on the previous versions, and 
>   none of those justified a change. Other than the pre-existing issues
>   reported by Sashiko, there have been 3 findings:

Except that someone should address the preexisting issues before we pile more
ontop:

https://sashiko.dev/#/patchset/cover.1788425679.git.naveen%40kernel.org

I see Ravi looks like the one who's been most busy here. CCed.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
