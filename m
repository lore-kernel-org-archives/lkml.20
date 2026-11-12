Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794508701;
	b=bzST7dLZA7fZNbDoHy/nC4b27Vp6nmvtlnkygcgnYsuWD6Xnqc4wyHVio/Q6dy87NUs2
	 J6QrxUky2LQTHAr8jRfdFQuvcwZ0+vWxyyKiigb1O8c+/n1pLUdI223RVYQ6pvmIDyw5A
	 Mtzo7PDMobCvlr0HNxefeZHifWAIpD/B4t+g/bBZ9Ez9CJQfnHUz8pAhEyvuFhyFwcjpk
	 X4m9/p0nxTngVCDt3ZIpBPdrsQ9YHelZK5Ln2i+e3SyraTUcXc2fO2BOjEgl8xLCCQQLj
	 9fS+OOjS7UahRYHZzfbHEvbwFahchTGSUpsc8wbvVXnB+AoDEFkRgnqX6GpEprQgbZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794508701;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=jG//rwm8BG3eLa8N18ZMGuWXVwaEsdy3p2tva64gqAI=;
	b=ozsVbuZO5Cx9TbrY2nsLbyGuHffT8eHVL5U8Td/D8ss7hX8e+RzxGzIqvdqkHj38sRus
	 wVI5fc8jm81VHGkLgfrfU/SLI3EhG90Cuq4QUJOAjtp+UkmTn1gAi7DB8DFLEL3bqNU1W
	 PWzN1XX8pUbfpUELRxmS06EaPKERCGOL2LAsweP651KzqTymKyEafBr80lHtbd2QzmAqD
	 NO4FtoaF0g0mV/EsWSQ5KrHkgCMRKzNDufYIaHV+6rnoORxJY5pDK37VKFreTr6TSZZpr
	 4Hl9TUdrG0+Ea9wqGBPKkEOc3m/mlXhaFOARj15KOKSPnQGQCjGV4GZMxvpScFrC0sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=Mo4MerTY;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCEF606A339;
	Thu, 12 Nov 2026 18:38:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCCEF606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=Mo4MerTY
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id A667340E0234;
	Thu, 12 Nov 2026 18:38:18 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Or4TjDU85gde; Thu, 12 Nov 2026 18:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1794508695; bh=jG//rwm8BG3eLa8N18ZMGuWXVwaEsdy3p2tva64gqAI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mo4MerTYL5zvhK7FI25GpXleAh4ozLKh1Zu+0fQ8E0x71yYSlh537Fv5NGCfqjXS8
	 hYWT1DaXzV6ZyOc9eylwwUDe5Rc/UP7SQ088RpeesJHZtN+Bok5cp7E1jR/NBVo+c+
	 wLmWIox6h4Z52Hp+/qM85sTf/0x2LWNMg70ffnCaIPxehoYIHcL/d/YFqP/8neeBKg
	 34p2CzdnDLEfGU4npMXSEXhT8u4r24g0MN7cSX/oZkARkEF66ej+a6ZnpLcdsl/Ezr
	 QCLm3Iwb/JKDgAL/jrUB5eJefUaeFLd7dmoYthjsQe24pcx99LFCwmqDyv4VZLJqyb
	 Oe1vGXX9iy7GaWR9Gg25EgkjJ23asBNAeA5CBWU4kLGvukUdK/hN+OlMyBEXDigea2
	 CVa85rHZTm74BPy3YH66pYfIWGp+j5n8e+AdgdJo3xBdQOuIJx1qcsnZztJ43kNA8k
	 Gktd9FSHA9Qlc2WLUTRgeNvGVqx0cf2laztG1BWbFAdAr74naPh7FnzrEftQuj6zo7
	 0F05zU8pvhvb/yrkXSPwKYdSwOF49pce0WMFdM3LJpy0JlnNCksB0FiByLyfYoH8em
	 EbwAQmf/EqrKnSJ3qXV+rVK4BK7PL4NVKJO9XnS5Anez6OhtYuXEVLtJIw02VGaJqe
	 2iQppytewMA2SdliIi6ARnrQ=
Received: from stx.tnic (unknown [209.52.143.85])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 2484B40E0222;
	Thu, 12 Nov 2026 18:38:11 +0000 (UTC)
Date: Thu, 12 Nov 2026 10:38:09 -0800
From: Borislav Petkov <bp@alien8.de>
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 3/7] RAS/AMD/ATL: Add unified UMC address translation
 interface
Message-ID: <20261112183809.GFavYHkdBpCEpwPWR5@fat_crate.local>
References: <20260922202318.4079080-1-yazen.ghannam@amd.com>
 <20260922202318.4079080-4-yazen.ghannam@amd.com>
 <20261106175635.GAau4U08ECoVyMTEy1@fat_crate.local>
 <20261110152106.GA1579751@yaz-khff2.amd.com>
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
In-Reply-To: <20261110152106.GA1579751@yaz-khff2.amd.com>

On Tue, Nov 10, 2026 at 10:21:06AM -0500, Yazen Ghannam wrote:
> > Please remove text explaining the code.
> > 
> 
> Okay.
> 
> > > Assisted-by: LLM

I'm sure that assistant will help. :)

> I had considered that. But I went with the flag idea so that we could do
> multiple operations with a single call.

Fair enough. Less overhead is good.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
