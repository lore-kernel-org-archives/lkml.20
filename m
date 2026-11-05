Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793859284;
	b=OoylZt5tSS1ml5cjWVSmYSw4JqTqixAIhrFurp6Wk25Pw1o/awjjsjyNSuXoOuIMaDTo
	 DOmO6D0t0Loqr/KxxilGjZbgRaj1ofC3mCIkq0UuiJO4e4/upjnd7QpVIuWljdP06qT+/
	 DJTFhswGJzeKenm9DVmer7CKe48njqBcnxGRHt5vakZ9tkG8NNKM0xmH3bgtD6NuiL5Vh
	 r61IoVIeYTggNnI/DEcTtdem7ecPft3XUhIQdOXMkj4PKMr+29/8qhy76NtTsEMBiCazz
	 2FMCFkYBZ+0u6QMsFso9ddr4KfneHlMBx42pNpgDn3/vZ+0L6a1qDOzUnAsbuefqpqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793859284;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=hVvv46MqObsSbVKNxdb2wOsvci7D3s0OZ8w0s0IvXOw=;
	b=kr9oxEpODRGN1ORkGXYa8Ug5/bHwRMrM6vaZ4v0/7SPZqkpagW/WdfrA+XU6dfuJ/Pj5
	 mAt0wzDfc8XEfEYcFSqkP5S9T9HPC4JgjxphgdoWNsRRBjw5gzwCD/g37n7enCFnDTHxO
	 T6b/ocwj2VOWR8GwaLJxBLzsjdiT0uprWANiem4bKtd2P5u+sQr8pN6ReQ4/xNLdfLnl2
	 u+6pZ865DSl2Uj6uCVJfrvBXiRjLrgAmMBPJu9d6iDL/ZV2b7xTRaYywYotbALF0NeDwe
	 e7g7V4IV2x+cxwJjXy1av0LvutYZ5SlqQBVLtyx+QVn5Xx0Nwa/0mqnQ3pR09XTRu9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=No0RkY+2;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B446F606A31B;
	Thu,  5 Nov 2026 06:14:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B446F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=No0RkY+2
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 669D540E01D2;
	Thu,  5 Nov 2026 06:14:41 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id msEHwpIIfBCI; Thu,  5 Nov 2026 06:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1793859278; bh=hVvv46MqObsSbVKNxdb2wOsvci7D3s0OZ8w0s0IvXOw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=No0RkY+2w2EZW2Crl+yiArPnOUV0CtAMg6s9t45dc1IuXkXL8vICQQ7cyvEbMpECy
	 r3uGptBQI/oCG9OTvebR5IBDDZlvWZ5ftafbuxQKqEEpyrMZq7sbNNYYOfbUO352l0
	 eMsTVdMml7ntgh7v9DvT7lo/Zq95zkYdpswKq7qfuHhXYSHa97FxZQPSauvhWw15z+
	 VXdWBqfhi11onxJz2GdpNaJI7Ex7xJ6AclqBUKx3942kx+K2aAVJsePCDWRBcKwwwA
	 a9K1CN4UiT7ZC6OU3PSURTLVTJY/8TtdLj9KP2ZJHPV0MUSIFBpPjjDL1GSP+gAyh9
	 4H9jkNibjUgirqEbpdVuLAgqmkUOFDzl418kAzfEZSHIgmqJ7S6ipBHfhxa58vZxDB
	 z64J/k54laMUExkUOtPsdj9X7RNz40eSOI7oW5hjSDI2Qh2Qi2YD0GQOGmryGBF4DF
	 /ET3blc2+CFBQMaeZL6LaSTAGK4SxDZACkwxbBjaPZLTqMeaY0j0R4oVxFJvEpJfVN
	 x131d7IGCkUuSWp2xuGTYJj5zF5p1aAFc3aHCQD7t2CaSCg+rkF4k9WAN/+VuOYNOZ
	 Nl/nFRlvMvXs+zbMwIoXWIBQ5BgWa7onpigWGeNot0cznfqE9xlXUDT1AwSXuLOmk8
	 O7L6n99MNvx/gZEQU8DPQNxY=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id BD88040E0184;
	Thu,  5 Nov 2026 06:14:32 +0000 (UTC)
Date: Wed, 4 Nov 2026 22:14:29 -0800
From: Borislav Petkov <bp@alien8.de>
To: Vishal Badole <Vishal.Badole@amd.com>
Cc: yazen.ghannam@amd.com, tony.luck@intel.com, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] EDAC/amd64: Consolidate Family 1Ah setup and add
 support for models 0x88 ... 0x8f
Message-ID: <20261105061429.GHauwexa5ngBoEP3kV@fat_crate.local>
References: <20261014085720.1471993-1-Vishal.Badole@amd.com>
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
In-Reply-To: <20261014085720.1471993-1-Vishal.Badole@amd.com>

On Wed, Oct 14, 2026 at 02:27:18PM +0530, Vishal Badole wrote:
> This series cleans up the Family 1Ah model handling in amd64_edac and
> then adds support for the 0x88 ... 0x8f models.
> 
> Patch 1 consolidates the Family 1Ah setup: select the v2 UMC register
> layout once for the whole family instead of per model, and reject models
> that are not known to work.
> 
> Patch 2 adds the 0x88 ... 0x8f models, which use the default Family 1Ah
> settings (2 UMCs, v2 register layout), so the driver can decode and
> report memory errors on them.
> 
> Vishal Badole (2):
>   EDAC/amd64: Consolidate Family 1Ah model setup
>   EDAC/amd64: Add support for Family 1Ah models 0x88 ... 0x8f
> 
>  drivers/edac/amd64_edac.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)

Applied, thanks.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
