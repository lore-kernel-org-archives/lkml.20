Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794083770;
	b=05y8O80eLVHWiFJUfmXzJaYXc762+C4/oq/XXtqTE/FEA5YjOii5EXoexd3k2bnJ8q9d
	 g7wLeU2sDv3FDVTSndjVYx5lpj66P8oDrqbcAa/CaGo8yHU5zodepwWFXNpzkffABdOWT
	 yf6Ha40MGQzg8b8VjJyiE4Lt5+QNwPbdMFJgI6a3prUhRdN4PkYIkKB+VMCAUPqa0RqOy
	 RqUGA3LGug4hTU9lKF4Rblh9dtXz8JmOnmhJRuBy3dJSDBRerePU3gd0+8zJ6DxEOEGpr
	 a/0RJ92W5nJ7+cFEqxNUE1n+5i7ow2VVXgio3Qs6sQYqdBDx+u7aOPQxNwgFaou4QlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794083770;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=UfW/MjP7lx0zRb4o0SszgrqvJgVaIkoZZrFELniqBZA=;
	b=3meLl3no/6WVkH96p1jySH5008kh13vJFuxCOpxYXyuNHzvlveB9wfBfb4N1whjpYr2a
	 ly20fmMNLBRc4Hi09vzJSjifst/209jKynIWveoBreRrvSzvXb0s6t4fY8WxldcZsCyHx
	 08YAB5UwST1rJumR/EBM2Cf7KtkViRCo82N44NksEvJP5XsaIHBz5EWe1I/u8x5Ou6gDn
	 w+GcIExHxiotXIvPYrsnQZj0r5Tj7ZdUmD43SSAplor7gR2Go8RAG3/xjvReJYowThCtc
	 JkQB6TbwrfNSNNhe8+VDg/hunooO9v8hXypYzmwiVG1urez6YzJq4hox+xGNh5Oei3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=keyVQqZQ;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC6A606A32C;
	Sat,  7 Nov 2026 20:36:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BC6A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=keyVQqZQ
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 67F0C40E02AF;
	Sat,  7 Nov 2026 20:36:00 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 8Pnp9920DlSj; Sat,  7 Nov 2026 20:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1794083757; bh=UfW/MjP7lx0zRb4o0SszgrqvJgVaIkoZZrFELniqBZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=keyVQqZQu8nVBODixHek/5PddFHoy6gdpI16n5W5D2s7ZC83vSCUgcxAguIlsyQiC
	 WUT2ROaceuptCELErKw5sV1cJogUczAW8F8jzfxq74xXc8TIXZLcOBSIz9YooKREER
	 gWmxPrl8NFAKerFgbxdrgjKBQWqt/+VH3FOgh1drby4yzknLLCGAIoHBD0S4XlO2TH
	 xzUcpTzSFowOXl4KB0bty0FuL3X6p3q5pCG1Mw90OvxiZClfobsYM9ZxkvWJfCgwUI
	 cgDNDp07KSslctbp3Sv6WAseoCQLDE5knrGNJRE/gFf2BCPnVzRx914e0+8brbIeSS
	 JMWi3JGgtizH9W/eGeJTNNcyYobHMYvYJYCgaCpjw12MgzX/IIlh0mY9WB86nlVPvE
	 r3ORpVqhntb2j4PjGyMP6ITKkTMuw+wQKmE9HLrdgOOmbR6cBIA6ysp2a8dFAXj1Xw
	 3BsrzCSVldqPFtUWnFlLkrDA2/LKVEM8fB/FoCO3vD3Aa2l+Z61cFaHs33PlHO7Alj
	 BWWwGwIE5DrqIjDcI9GppAq4HDmJanxbmO737i0mXRRaGZn8S691zgKy2rx5hzvaPv
	 no1PI0i5snFnIMzGr/CnuybBbfKU2cJ/tSAOHRl6PWF2F8VTBMPs235vQl7rvsADVT
	 Jgv/bm6jFuq9TAseMA6u7wno=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C9BDA40E01B5;
	Sat,  7 Nov 2026 20:35:52 +0000 (UTC)
Date: Sat, 7 Nov 2026 12:35:49 -0800
From: Borislav Petkov <bp@alien8.de>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: tony.luck@intel.com, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] EDAC/i3200: drop the PCI device reference on module exit
Message-ID: <20261107203549.GBau-Lpd74Wo9UiSC3@fat_crate.local>
References: <20261104033833.1566974-1-vulab@iscas.ac.cn>
 <20261105194529.GAauzc2axWPncLCpVo@fat_crate.local>
 <179393571491.2060286.9429869566285761831@iscas.ac.cn>
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
In-Reply-To: <179393571491.2060286.9429869566285761831@iscas.ac.cn>

On Fri, Nov 06, 2026 at 03:28:34AM -0000, Wentao Liang wrote:
> Hi Boris,
> 
> Sorry for the late reply, and for the mess it caused.
> 
> Thank you for telling me that the EDAC i3200 driver is orphaned. I will stop
> working on this driver and will not send patches for orphaned EDAC drivers
> again.
> 
> In particular, thank you for pointing out the Assisted-by guidance and the
> problem with my submission process. This is an important lesson for me. I
> will go through all previous feedback manually, one by one, and reply in a
> timely manner from now on. I will also not send patches in large batches
> going forward, so that I do not accumulate more feedback than I can respond
> to in time.
> 
> Thank you for your patience.
> 
> Best regards,
> Wentao Liang

See, and my years of experience talking to submitters tells me that even your
reply is AI. And I'm not even buying it.

So I'm going to ignore all submissions from you from now on.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
