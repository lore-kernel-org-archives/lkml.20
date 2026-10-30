Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793338740;
	b=gtHetB1K1mRy2WMlrpEot4DYRYJnprthIxIApY2HRVhL1ymh89Z93GH945WaeX4OBVWM
	 Ht480vyF9rzwUGfmCH86M/yLQ+qgd9nh14hhyjocVXm+DM1d7QCBHcoE47ohMmwxMHkac
	 aZSBZxW5bH5sLHrLyXPRhpn+epuyzyVEl0d0bdUV0NVIfOtfrJMEKAU9AChMe+0+/9GER
	 WseOlxjSuD3/T4HVOdYtpYhZ2UbgHqQGSMHQG3mSXJ4cFNr++n3Ebgg6ZFeoPYAs4qz/O
	 Axxr8s4MhDYyPaTB8iDmPHjHomv8rzU3WJMfLdoxYaE45nQhAmQyxT7DV8VBI4ItmwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793338740;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=FznyGR9DffnzS9tg5Z7SBGY0a5yXeXjM9mNEpGJjTNU=;
	b=W2DSP6ldrrxHSW3cjHW6pv5YDjteH3xCqbmsfmsj7p8nFWPollY2WhUY0V1ye+KSz0Ko
	 SU6auAqhtGv5qDw0X7ptXivWWL8DjlWvFfqSLRp4gY5YipBP5HiyVHAqxJp/j1g6/Xc0y
	 OukCT0To6d4MDJ4+qT3DRtx2AjypyymrFv+wuRI9A567Bn0L9WbHV1kRAFUMiVwRZNUse
	 BkJ4m2M2ggVzExfWuW6NCnouuSgPQV41WGkDFaoRgQfrpVwGHPDUOHSlqixcdM9Az6avP
	 F22KgdW5OJa+trIGza5klCdoVF5UCtYSq8ZHEG69rTuPwQetfdqDkINf1jNE7KfFoLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29ACD606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:38:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29ACD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 0DCBC40E04D6;
	Fri, 30 Oct 2026 05:38:53 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id qgmdnCPv0jOs; Fri, 30 Oct 2026 05:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1793338728; bh=FznyGR9DffnzS9tg5Z7SBGY0a5yXeXjM9mNEpGJjTNU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k2cPH3gaq4iwLO6fAcfQc5OVWaRzHLrntefm6f/tLjMNhM3AbDKcKJ1+h5EulWtx1
	 sa63oHetRuPWRtbWpdM4QWO1ySFrSXQnteRXhSLHwmYy6MSOMM1q3CGMkNbBcNCM1p
	 BLoLlph7M7/RAtku+O/tUlJRItbPN/KTUZt9zqvS5Ezl4qwyBX6tJIZiKtAI8da5Tf
	 yQopmyD7d7LJkZmOOgAb959LjPK9ojEwEacczB+l6uCuM7Su83GTICns3v/VJWifCN
	 LY8gJDgkdwc1XHqc97Lhcqp8ojkFnye70Z6tL3c+AHhxuykvvLQtQWFpZjluRaX4ib
	 M4BQ86MTVK/5hBmxvWAw39BVA8altRlReOA1b9kDmMDjVir+/BLl79gPQQVqU0Oj8W
	 nyi8Vj3hfKdfeFiwGqCTRcmwyGnxlJALuT6YMKF2f0rtmr5OfksbhtWAgH0TrQpQI9
	 8KWDbPQh9mULmrJKJjZaBQmUAeGeHDPPWU8obJEa2godAgz2w7UZulqwTLUrKrPLtY
	 ImcE2Jy7zuX7ZDPbFpQkbdiDg38JKhd4JdBhfMGaiYVsn9ysLoh6EaPJbBEq82K//F
	 JqoWlhMf9CxRrc2ciTOInCs5WS/YiCvgIWiD0LQ0DUaSHco0yec89fpkt+4BDhhgWi
	 LAAhrBfa/kdbcOzFI85m1xgI=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 0E5AC40E04D5;
	Fri, 30 Oct 2026 05:38:28 +0000 (UTC)
Date: Thu, 29 Oct 2026 22:38:25 -0700
From: Borislav Petkov <bp@alien8.de>
To: Breno Leitao <leitao@debian.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	torvalds@linux-foundation.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, kernel-team@meta.com,
	David Kaplan <David.Kaplan@amd.com>
Subject: Re: [PATCH RFC] x86/syscall: Dispatch via sys_call_table when
 Spectre v2 and BHI are off
Message-ID: <20261030053825.GKauQtUX0pauVeLsGg@fat_crate.local>
References: <20261029-syscall-table-dispatch-v1-1-bca9dbb886de@debian.org>
 <20261029104938.GC1813469@noisy.programming.kicks-ass.net>
 <auM6mSXz-BVIjYBc@gmail.com>
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
In-Reply-To: <auM6mSXz-BVIjYBc@gmail.com>

On Thu, Oct 29, 2026 at 05:30:25AM -0700, Breno Leitao wrote:
> My goal is to make booting with mitigations=off equivalent to building
> with CONFIG_CPU_MITIGATIONS=n, so we can ship a single kernel and pick
> the mitigations at boot time.

This might interest you then:

https://lore.kernel.org/all/20251013143444.3999-1-david.kaplan@amd.com

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
