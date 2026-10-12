Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0132841A76F
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 19:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791832896; cv=none; b=EMaGNwJbbHRw0VVcb7v1yp6OX8oqX08ThLXmygdk7F5QaDbe8XRGouNEJj4Jblet6So9qBfif9u/t5DTzRjOo8KbapSMFsifNzKkY1XO9Jl6BmYTTi3aZiZu/Jf9U0t+54xk2D2seBGMD6XDCtb2LQvKYXQ0C1DmeLfBcbmlksc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791832896; c=relaxed/simple;
	bh=1k/DQKPcw8YK/xoL6gtmsWPkUhYp94wG1UsM588r5bE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s/Qw3aH3iGJwVsxlZZk1OlGSxSkHb3fZLoTlWV97wsm7hZIKc8g9+I/gTlTERK2vdODOqRaLieFMzWHIpuBIOVRcd7g9C3Gn8xKlXs9taPzKhIb+lpqHiMXsw1aoVwsLRJfPOHtjGlKKFWrjymdnVCb6T4AT1d1hnHfzyUEGJok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=lHiOLo54; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="lHiOLo54"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 74FBA40E03BE;
	Mon, 12 Oct 2026 19:21:24 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 1GdfJFy0tNit; Mon, 12 Oct 2026 19:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1791832881; bh=WqFeSQEBcvFM0X4Ltoz0Z2wIxF05UhXGwoaGo91n8pA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lHiOLo54sbzzTO7dznYp+Y4m/v9HN7PwdJ8P2SsFAczM2V4hyWgsRW72kufPDQJpH
	 v4OxWMEybbdRryY8sPq/8YQhD2efK6TYtuENUchgKoyFb36dA/H2Sa0XNM9owo/rqb
	 E0KA0imoFWDBZ/eziVfTSuPEwtl1URFtErQIs7cHBlgMJUV8+XEgEHZJJuosI7KqDC
	 j5mq+0vh+CNHHvVkEnaa2awrwBZGM2GjyJd5UffTmIvr6GsdKVW6ryV4PkoG88ZS8p
	 +r9fjKR8n2cbjWJSTX09oXbKjAwMgDWuna1Y8SldVKLVM15XWqenJc9qIE4tAETl/G
	 BeqNJYgKUmaNrEp/Z11UG9S+qEz8dU/zwHhz4clR5Ip5cwoQyWTc0cH1sLawM0PCCu
	 pFIvMgyv3ty2VLXc9M2AUKheZp7PMLMfBVyDngubaM4fcW3QaQX3qFLYGQI2oA8ZM7
	 jLRWGmLut1vo5rZeO44GDBWUzSo1vFo6zf3TLZo9MqgnKOG5d6QpaQMuI4bN6a12j3
	 YNCaeBrLEwTKRrh8WxleByv60ioVG1Xrzy1t3xlu4OsF4GeMF/wj8+K3RtjjC+PrAb
	 4SHHxeS4V2xf0y1ddusq1MHJx51ANrg8Pp5Vl7bTEFQviXgFVngQheYQ+aYmGi1pzS
	 32wNopL05/harpXiNO71A4xU=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C5E4E40E02B3;
	Mon, 12 Oct 2026 19:21:09 +0000 (UTC)
Date: Mon, 12 Oct 2026 12:21:06 -0700
From: Borislav Petkov <bp@alien8.de>
To: 1sh1ro <yangguikun19@qq.com>
Cc: Ihor Solodrai <ihor.solodrai@linux.dev>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Alexander Potapenko <glider@google.com>,
	Thomas Gleixner <tglx@kernel.org>, kasan-dev@googlegroups.com,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] kasan: Fix false-positive wild-memory-access on x86
 under 5-level paging
Message-ID: <20261012192106.GAas0zIsS_fb6dgtGB@fat_crate.local>
References: <20260624234510.GHajxsBgG62PHgEZa4@fat_crate.local>
 <20261013015904.44144-kasan-early-boot@yangguikun19.qq.com>
 <tencent_8BA9ABDFF623474ECBA6E251A03E19512808@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <tencent_8BA9ABDFF623474ECBA6E251A03E19512808@qq.com>

On Tue, Oct 13, 2026 at 02:06:08AM +0800, 1sh1ro wrote:
> I hit the same false positive and can add a data point that seems relevant for
> the fix: it still reproduces on 7.3-rc5, i.e. after the CPUID rewrite that was
> expected to take care of it.  The rewrite is in 7.3 -- get_cpu_cap() became
> cpu_detect() -- and that is exactly the function my crashes interrupt.

I don't know which rewrite you mean. 

If you mean those patches by Ihor:

2711d67bc3a7 x86/cpu: Don't transiently clear the boot CPU's capabilities
db349783ca7a x86/cpu: Move 32-bit SEP setup into identify_cpu()
ad86fe2134cc x86/cpu: Inline generic_identify() into identify_cpu()
7a762b51a149 x86/cpu: Initialize boot CPU cpuinfo defaults early
54a2882ab9f7 x86/cpu: Factor init_cpu_info() out of identify_cpu()

they're in tip queued for 7.4. So not mainline yet.

You can test current tip/master if you mean them.

HTH.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
