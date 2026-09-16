Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1884D6C38
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789575054; cv=none; b=ciJrnxgQVpX9ANGTiyQnuWzMMPe/fbW4khkQfhGYvZoTtQEN00ZYLjF663TxM+ftCkCBatxp4xV3nfrTkaVsk8aHcYOu83X8HoRK67PzzcE9IAjLrKaAdgsykFAwgb33e+f+jCPBeVWqikTfOxwEd39n67lRir0u8vC/fPAt2t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789575054; c=relaxed/simple;
	bh=rxwh6HRPyMOg2IENeHM2VavTtsrGnyH3kk4Zp4dIvF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mQyoj7tzZEw7Djv2D2yU5nyOUBw790WEePQwPXSeOoZnKj8RKUb5eFqXwIcHqDRA03ooQbX8J/jYBUSCvDu2oEu/74AsC0sk1VZTZK+RLwl/OLD/cuaOGmByLw71KuuE52rFwWOyVV6MtvUMB9lPKOOvaRcWY5BGW6vqSRq/faU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=TrFSMl5E; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="TrFSMl5E"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-93a40a9a01aso115913285a.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1789575050; x=1790179850; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EzULl2Rsxwfe7EFb6MSMik7LenJTHelPDSDR0csqtEA=;
        b=TrFSMl5ESedbuJFx8Vm7RCbWOcge2/6wmdlIFn4lA6izxn4lVCOW9Elc0WcHDMCpzo
         E2bc4nOXlEqQKb0lzZy+KEWaEV+U1BsWeLHuCIVwON3nRFzEHfTJ9vKOgh1aE7in/0+8
         L2WEb1QNeqUWlZOTgjVx1zRzdHTC/IffAqWbWNvOnzZGko5+jUn8EGirVaaA5fRvh2yH
         LUkVXEr6DCAHaAsgh0X656f6s/3H17hcGmS3eJvn8mMlXrb71yUKjsn8hrsdMqYEbPEk
         8/gASMW7mfvwnTerlXElrUQrQlDV4D5hwwAKuJVSetp58kgXlClFZnR1X37yRQpb9Xz2
         0VmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789575050; x=1790179850;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EzULl2Rsxwfe7EFb6MSMik7LenJTHelPDSDR0csqtEA=;
        b=eJ0cL3N/HrJ8WBk0QLMO9so+ezJ96Z/xZ8/CqC+qNwxMXJa0Oil2XI57ymifHnjUro
         n+xwEWWxsI7LjiTD0KMkjLMIH/QJp9B6JmKUq+CyRbmvE0T9wKF303FQPbHewFomvbLb
         yuxO03GzpdReNcLAHxDj1rq8GpF/1ztL44bONXUiL6FzETgOFN6utz4RqWqpp1pKYcHk
         qGAVDoA2LYtcWTa4MGT6fl17W8D4a/E0XJfZLTRQmAf/M+SWmRlvN62Zhzzs5f1MF2jr
         Ls71tO7aanYC68xt8bMKLGXMIVaLgveDKDqFctAcvRQDgkHD9sV77fayacGPcKhf4Yxf
         0xzg==
X-Forwarded-Encrypted: i=1; AKwUvBzxrtuF162jcd8EyRebcycRtPr/2aAm7NwuAAAUTRIjA/nxY5VxpwecYV2s7wEpiv9+HU85GEDgQdfHLFA=@vger.kernel.org
X-Gm-Message-State: AFuF++l3A/2w4GFV9tZPb53oaVQDyJPWTBL0TiU2B3vvjXgvQftYdniY
	xORuYZYpkqoJsvucNm7xW4sUz1H8geV5olPSGiI58rHBWC/pS//cRXgc/iEvgR2Jds8=
X-Gm-Gg: AYBFou145xdNERMojR9DvMYD7vlsoR7K/R1h+AR4LXvj1tmL72SrNHCmC0RPbr3CijX
	wwknDByt7vGdgc5nzSvzqzaL4tsxYQSwxdV6JBfIWEFr5HH8U9EFed9gy8wvb6GyD2b8kfRbuiL
	jM27qdWgh/uND2yVGEN/+UrKa/xmWEt0ESIkA92Vg6N24x/aIjsFLVhFVmMAWD1Gg1A6mEvdF+j
	+kevwi909rIodYOCcfM+OL7rPk8apb9MZdA2HSYeGTMMV9xVyD+0cMP2Yw/kTdQ7nFVlsY+Puaq
	u37zgZnbLBbdCKOdDi81iow5ypbOxOw+UyAHPltMe9SQH2IQgR8CF8lmR0yAjj8B6vwGYArzuRM
	C8N+zluPHLJeFXdLqDz06TAoTBEK78NDimZqLivO3y4kfz92SpVCot6GuWwbb+Y078VBB1AnO7t
	EtuR2EpTdomFZtPwACUK1lT3Y2+li4bqLlrR/kjZK7aXYvoyPFQyzzj8OgJUPnfV+R5LrGkF+xA
	L0UomgZY4d55TNVk5qELSSL8crddCCFKzd/d+bjwBeQoiJCAmHl9vs=
X-Received: by 2002:a05:620a:1b83:b0:93a:1196:ce5 with SMTP id af79cd13be357-93bc63ec899mr23113285a.33.1789575049934;
        Wed, 16 Sep 2026 09:10:49 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93b782562c0sm248094585a.32.2026.09.16.09.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 09:10:49 -0700 (PDT)
Date: Wed, 16 Sep 2026 12:10:47 -0400
From: Gregory Price <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com, akpm@linux-foundation.org, 
	liam@infradead.org, vbabka@kernel.org, jannh@google.com, wangjiexun@tinylab.org, 
	sashiko-bot <sashiko-bot@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH] mm/madvise: reclaim isolated folios if PTE restart fails
Message-ID: <aqq6ey3DG9h5NIDZ@gourry-fedora-PF4VCD3F>
References: <aqqbB_nFAOGenDhy@gourry-fedora-PF4VCD3F>
 <aqqjW5dpyznijYLh@gremlin>
 <aqqk89oTigJ9LS2N@gourry-fedora-PF4VCD3F>
 <5437871c-d9ee-49d2-b24f-965c73c29c3e@kernel.org>
 <aqquDtEZL1ndymGN@gourry-fedora-PF4VCD3F>
 <46d923e6-5724-4df6-b0d5-8dda7c547f6e@kernel.org>
 <aqqyhkZqcXDUrzeb@gourry-fedora-PF4VCD3F>
 <4fadcda7-d96a-4cd9-9b0f-5d387b6f82af@kernel.org>
 <aqq23i9824-GWdhg@gourry-fedora-PF4VCD3F>
 <9b50a047-b5e6-45c3-aee6-551896b52eaa@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b50a047-b5e6-45c3-aee6-551896b52eaa@kernel.org>

On Wed, Sep 16, 2026 at 05:42:43PM +0200, David Hildenbrand (Arm) wrote:
> On 9/16/26 17:37, Gregory Price wrote:
> > On Wed, Sep 16, 2026 at 05:24:43PM +0200, David Hildenbrand (Arm) wrote:
> >> On 9/16/26 17:19, Gregory Price wrote:
> >>>
> >>> You missed this part:
> >>>
> >>> "I'm trying to be careful about not causing a bigger maintenance burden"
> >>>
> >>> I wouldn't do that to you :]
> >>
> >> I just wanted to make it very clear that I don't need another schlopped gigantic
> >> patch series in my inbox that I'll mostly have to ignore because it's
> >> un-reviewable ;)
> >>
> > 
> > I would never :]
> > 
> > But *motions generally at madvise* if this isn't schlop i don't know
> > what is lol.
> 
> Just to be clear, I enjoy any cleanups in that area which are well written (and
> your track record shows that you do exceptional work ;) ).
> 
> I would also enjoy a properly stubbed page allocator as well as I envisioned ...
> as long as it's not something schlopped together and rushed out.
> 
> ... of course you would never work-slop me/us like that! :)
> 

It's fundamentally a bootstrapping problem.

Regardless of whether an LLM wrote the tests for page_alloc in its
current form - it's going to be schloppy, because the code itself was
never written to be testable in the first place.

That's the actual problem we're all dancing around.

~Gregory
