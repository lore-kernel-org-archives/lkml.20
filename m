Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CF013777E
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 19:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790363798; cv=none; b=MxBIfLmblqax9C/b/FhjQUxVR7hpt5L+mqRsE4YML31aeT1iU+kJ5sw2Tg9lbYUVGA+YQDY0vpd5w3ewhLQVP+Xg42IvGVhR/CxJ0nFCO06aMFMsvskSbw5CFDIO2Tk2+8BvqION5MFgx3MaKUFsIcniYybW1m+AKcSGyMCZDeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790363798; c=relaxed/simple;
	bh=MKW3JyKMw5pWr+goHZluAQDGinqpg4YEMETVyvCJc2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=inqtjcO5dcxzO8LgABncbpgFBMXOYKyzzefRX+T/jEKZMJ2VJE3G1jk1YQG4Bo+hLsrG8X7+PuBpwp9W4bOs2ajnjVpGRK4XmDTX2jxza5nduK6lMv3/N9LoUB4/5NxZ6rk9Iihnzg1FlN+KZh5RIudMxEc1tf6M2XhkpT0RG6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=GMG/9aVk; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="GMG/9aVk"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 12A7840E021A;
	Fri, 25 Sep 2026 19:16:34 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Jn4u6Yue8xF5; Fri, 25 Sep 2026 19:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1790363784; bh=+tcasoT67ws4EFzQEtIpw08LOiTZf7cNRgv7xVLpQpc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GMG/9aVkePcYpMPvU4bPmwq5pTxVUDtn6nwx9mQezd8SzF4GcMZIFqt/o4LpNrZ6N
	 ZGoFr/GyG0KwI63oBSzV4QbOtKpMUM8sEWByLWZdTDwN2rmu2fcdsTt8Tw0GRtGZ6U
	 sXJKrN75+i20Q0PhLgWmDCzVffsQp65XCoPhOgNP/Pllf9DeUmcB0BSDnuOZOjVVsP
	 WbfCXzzqVhLgSmUg5z37lYldEDNr29sd26VTDzmoLtUU8yJmDfhvKjyyioUiSlIS3c
	 02FPVrahxHVdfdsmK48WvNXMXXL2RzHd89n7/5aKk1xcClq8YsYdSyijEbjynnATpm
	 jqcLKPS0n4ysC4yAXvyg/t8hAEW8zQrjg8Lr6Tgwo7mt7WoAsjvNayBnOdI+jz9rwH
	 P1gsBxCOvcDPSMUPTL839aWmJ5SRHMiXY/WB767WlQwVO4ftDJpbWdlAOpkOdkX1L7
	 ZbktQigf/4+xLHrL47qlcb05szHhty8lKKMWMInCEeZszE+gKtbY+e6TjzuGfYV9cf
	 tZskmBRytipv8WApv1K3c8KwqM/ezAXoaKcj4Eibtq6L3p4H/zZPnJDTavelkvkiZ/
	 8WuyxnlvE4YJdLDwHkjVXseNIk5qBOtzyFJk6GocRpG99MihRjKEiE7cw3S+higgmR
	 D29HX9FIX8qQ0HRg8sI7dPtw=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 6848340E015D;
	Fri, 25 Sep 2026 19:16:12 +0000 (UTC)
Date: Fri, 25 Sep 2026 12:16:08 -0700
From: Borislav Petkov <bp@alien8.de>
To: Andrei Vagin <avagin@gmail.com>
Cc: Andrei Vagin <avagin@google.com>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	"Chang S. Bae" <chang.seok.bae@intel.com>,
	linux-kernel@vger.kernel.org, criu@lists.linux.dev,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH 6/7] x86/fpu: Pre-fault only required size of xstate
 buffer
Message-ID: <20260925191608.GAarbIeDRVdrWMczbx@fat_crate.local>
References: <20260924210121.87032-1-avagin@google.com>
 <20260924210121.87032-7-avagin@google.com>
 <20260925040215.GAarXyR6cUzn9OH4ZD@fat_crate.local>
 <CANaxB-yxzmDr3K4qQ+f-pVyUOjn8jKJeEydR7adi5N+_TiFHZg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANaxB-yxzmDr3K4qQ+f-pVyUOjn8jKJeEydR7adi5N+_TiFHZg@mail.gmail.com>

On Fri, Sep 25, 2026 at 09:51:03AM -0700, Andrei Vagin wrote:
> I've sent v8.1, which is based on tip/fpu. In this version, I moved the
> xstate_calculate_size prototype to arch/x86/include/asm/fpu/xstate.h.
> This matches b84c96283684 to avoid the same problem when tip/x86/fpu and
> tip/perf/core will be merged.

Thanks, makes sense.

Lemme queue them and see what conflicts I get.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
