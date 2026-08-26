Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28824078CF
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787762635; cv=none; b=H6R3HuBiqVEvLCVhxXbCtNt+nXHnKc7qfQ3ZwNQ02/hrylQvIN3zmO3x2fpxXXAtuQtxuTqtIgKjvdYXyiV3DgppTY/AZhW73Auan4YhPVko44yfVIIRp/GglykhM/AYXkPYVru/K+bVAW77CcZI0Kf5KT/NXYLapoiD4dBFRJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787762635; c=relaxed/simple;
	bh=jIxwb3GdvN+65ZxTGIBIO1dB/H3rDQTlF8K6cBQgwtc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YxfWROGO/nQTKjk8nvBJVkXGttBs2/A2HWpzbi0oTDi5Oe6fl9726PhLxD9DxOy0akbfI1FEQPUSgEs8z3EbE0OC5cB/CWJ2gKudw1IuVeRVxSNmrwZjQygbbnTjawPSmA1G2MbAfh2qt2x84IyER+VLxouFrFnOhSyKoZsUAuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=X9w7/3kI; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=iybq9esv; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="X9w7/3kI";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="iybq9esv"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id A43DAEC00DA;
	Wed, 26 Aug 2026 12:43:26 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Wed, 26 Aug 2026 12:43:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1787762606; x=
	1787849006; bh=NqES8EslKG0OtV6wDajYOfZeNHZies9zz1BZlvW2T2E=; b=X
	9w7/3kIe4u49OroNplXwQrcjIKDx6X0uY9+BEq1HPhnAzXbzAVaKgZrBKGellSwV
	Io9MMhlJTg8DAQIUeZjK1hAIr/OWSjbeHs800drepppCvcsKn4T+JAfhNDnuHfho
	u91E+jkGFBCZ38eCaaCCyIIN5G9N5NkcJLIXTYc/1ALRrApchcI3fEB1/5niJes0
	tpg1vu1bphFRZF1V7saPBNl2g9vJwNFr5FK7drR2kNAczI4InJ1VJcxFr7+w4O4T
	0oWFmHiUvYOoQCU5L62e0yX2ucVQ9ILTL/ro8N4ny41CSpnjZNcZcu9MMDhDCzWI
	4BJ2tVr/U6uBvtleuhvcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1787762606; x=1787849006; bh=NqES8EslKG0OtV6wDajYOfZeNHZies9zz1B
	ZlvW2T2E=; b=iybq9esvEteIZgsyzUxcuncFt2ZsnTbNmulFF74pkucgBhLbCWY
	+BktZdtFgpj5dgOjIUFCPTMWiGk7tpri4wZtbe6hRUYYHR/I5a75T2q8iX9Nykrb
	mXFnrK2gPrMn619zrpd/6szWCrE6Eh4hqCiv+rtqOfWnomO7eV8qmCCJpjW8Ouky
	R4hV8CdBnVFmh/YU8nQy+hOAmBpNuDM3LFZ5o721QrhOy/ZNwPRj5HT/d9BEWgfc
	xmrTlJGmdrDG4+ehI1GE/WH4Cyk7OAyO0IabED5o9jmDn9eWC1Pdp5wuWlAoxnGL
	P24gBLdHAg+GeGTXWuaLcsFiir+R3gIJ/uA==
X-ME-Sender: <xms:rRePar2oX-1HOva128EPdIT1yKLEM1YcwDYbEg1U06eCA7onFadQLA>
    <xme:rRePag4MsRutS2Xu7mzz5L1QJroPpoRnYBYweSvjYCKQsW24S2gRQUeIUz9S36EMC
    KO-IKIx2YqIB-3W3NpNrON1iRdPlnnpLqCZcnL3pTRJ06w5t7fvTBBC>
X-ME-Received: <xmr:rRePak1MrPnmTLcJww1cMjKgJARkw2CCZQQTY0zSXsSLYzQSOj4OMS7FGdU>
X-ME-Proxy-Cause: dmFkZTF1T3n4WYvbpk7ULqXIBzlz3ulhLrqWxztDjzS2yQyqiQ5hvVHI/6p8UOsl/I5HMu
    /ymmwbatakciZMvV6IpDSgzgRHOejfz5rqJe3BSdWMcbRMceq5JqW2sSSYDGox0WT/xhC2
    uqeJRqn6eV6SZjbB93JurF2D+eRRPSsZTdv2HWN52G7sG0pkPhZ8359cEQS6IIvuKtKNKu
    pGAUFEPIZjdsFB01GaT8fOjkMQr83e7hST/JkiYnZn22V59QNGBvXczypQwLMgedgR4lkI
    Lkkw6F/9WBpdtdlcolpDGsmUCWMu/kGOnCluhfa8lk1QxiqdndPtafItolK3gx35Du4LDW
    B2HbXeck7Sk7hGb/BC1P7fcTXWbvObvVPHs+Z2I3TwuBlcvwu7IomndUwr16tQE+T7aXkO
    PyTpu2SUpScjaP+qtuTpFkQTbsEPCw+Bp1aJNXbIN5neFmd/HC4bQkhzNk+OZzmKWAVXfD
    UcHrTOqf4XpnK2IjnJjeShj6txWBM9Z6WVh1GggdQc4c80glbcPr4pRbh38xtl3Cx+bHjx
    Q3Q6oLk2cG2UOGI/P6kmD3RegQIeCJLwkLcl2owp1t+VECos8UCdUBJGuwlSDwnDkcC7vf
    GV8HFZ5TGlYORtcWYK7LvOe19Wf1Gn4990K056bwdv7pt3XslQwHc+wkCj/Q
X-ME-Proxy: <xmx:rRePajp250_enFyiT5-JD2hJf5TvojCuRohRHvmLrWZFPhfwotopRA>
    <xmx:rRePaiX27WIuTkOKnDrKq3mzENVt3Fzc5D6QWc6QSyaj1VteinnGLw>
    <xmx:rRePagd0gU3Nhn-wMBbX6mqZnlIzEMxBwwDZCloEMSO6Atd0nUsOIQ>
    <xmx:rReParDtkGG-GcSJs8icV6W5no7zCINcOvcsaIu6dp7oJwQQz9Cy6g>
    <xmx:rhePanXkWjorwItYaUIPp69k5WhMKAQuFfutyj35qnZc_-1XOeuc9ogF>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 26 Aug 2026 12:43:24 -0400 (EDT)
Date: Wed, 26 Aug 2026 17:43:23 +0100
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Zi Yan <ziy@nvidia.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	hannes@cmpxchg.org, usama.arif@linux.dev, Kairui Song <kasong@tencent.com>, 
	lance.yang@linux.dev, hughd@google.com, baolin.wang@linux.alibaba.com, 
	baohua@kernel.org, liam@infradead.org, nico.pache@linux.dev, dev.jain@arm.com, 
	ryan.roberts@arm.com, balbirs@nvidia.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] mm/huge_memory: reduce indent level in
 __folio_freeze_and_split_unmapped()
Message-ID: <ao8Xaa4vGcAGPzCK@thinkstation>
References: <20260826162101.1314941-1-kirill@shutemov.name>
 <20260826162101.1314941-4-kirill@shutemov.name>
 <DKZ0RP174ZWV.1DP8KKRE1LQ6Y@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DKZ0RP174ZWV.1DP8KKRE1LQ6Y@nvidia.com>

On Wed, Aug 26, 2026 at 12:34:47PM -0400, Zi Yan wrote:
> On Wed Aug 26, 2026 at 12:20 PM EDT, Kiryl Shutsemau wrote:
> > From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> >
> > Trivial cleanup: short-circuit the function if folio_ref_freeze() fails.
> > It save an indent level for the whole function.
> >
> > No functional change intended.
> >
> > Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> > ---
> >  mm/huge_memory.c | 233 +++++++++++++++++++++++------------------------
> >  1 file changed, 115 insertions(+), 118 deletions(-)
> >
> 
> Kairui has a series that cleans up __folio_split()[1]. It seems that your
> patch 3, 4, and 5 overlap with his changes (e.g., your patch 3 is the
> same as his patch 3).

Ah, okay. Ignore 3-5 then.

I will review Kairui's patchset instead.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
