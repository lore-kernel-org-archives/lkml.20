Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB5155C333
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789573078; cv=none; b=ZKsanrzdYejhEUMUybsXynFCPbepfTEWmaHH4vkH99VYdvBOxf9wYuDOC5Ktx+NNfXI8cTTmahDybgFgOUEDf+DM6dxlT9okGyEtIWND9y1bYLlRncMCVDrji7OLcLuI5BjqQ6EqqnSKomB8I0BnShJb37EgJsKzO5dytEWhwWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789573078; c=relaxed/simple;
	bh=MSZm3L3WgvS/uJlzKYruSiBeiKAhMp7kcFZ+8BvZD9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tWRN4vFox4gygRZ+jmtCzMU4eZzzDoVIIvYE7OJvzFtcJsowPznHc7H+xo5P/rxCaftXOL18dKFWzYYEmDtF+Z980KcTZTapB1jkHpV+4Pyqg3U40Cyr5qY1KOlKahDV+gUAweq7JXy+4H0JcHE/xy96O4W1PeNyiwt65C1JtYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=lVH7kz77; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="lVH7kz77"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-53122c5bbb4so11272701cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1789573071; x=1790177871; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yrYalls8fAkvyVlQP9FlmP4RxEorGFK72anR8WExHtQ=;
        b=lVH7kz77hihe5ypICQsHpzMV0gmdhgnMWDxPSnat6p8LoLZoD0peFsMgsC7lrVs4Ik
         WRGJt9zs7PWX/FzihOoaCp+CxDpROSMhHhfwlxOBLQPdgK/xlJE2Wul9UigMRQV53Rqs
         nESg6VHg1fq90zHyqiVDsLEKGz6mbyiLJqxbEz4cPGDNP6SeDWjMxRMSmRLshEfuU+dx
         CBH1LaPUTGjc5vXhlZHM6mP6IKOksDhLzZPg85D7k8JfWI+CHEuZTydHjLuR2hB+V44S
         ov6llVPikUwNwOjVLHVbuLVcIJdmC2XHOPsIPt7DG/RWF9cQYj+X2Pb8O3x7RGrdvt+p
         xyYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789573071; x=1790177871;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yrYalls8fAkvyVlQP9FlmP4RxEorGFK72anR8WExHtQ=;
        b=E3PPDYlsoh4dsx9wThYcrJQTLeb4mWX9kyMootgYJeWk9ZdEU589Q5D3xn7ECsBtc9
         zlrx9qGS6DH/0lmhnX2gTekUeLw1Fn+mOQVYpXwyNhr52nAJFfl4oYd3T7y8BrSII1b1
         5fQDA2vA4fYFJMuAT0N1J/BT6oPM68bYk5A72h1mULrxMIQPAlxqhHyNBEsBknX7iIEc
         H9GDOcjMjoq+eIUsEgpbx5fgi9EdamskfQDVQ0W3eSTmn4U07+jEaj1HnKeeef7PQKMx
         8+xh2F3snYIDWUN0d0BLYqjwwt58Mu7/BIIgTwlQt3o6AZYzWF3xQHgicYaSgionms5o
         TdUQ==
X-Forwarded-Encrypted: i=1; AKwUvBwFJPQRQ1/lDSx4UbCi4qg2HjtOYprEfIYN0lUqVR8KeA9idU8WT+Jl4WpQqUxIpX4XYS88Q1U3xwEXUEw=@vger.kernel.org
X-Gm-Message-State: AFuF++mXeiOmmMAN+zZE+5/YjeAmNEY14+7EcZKpPGiffVDv6EVM8Bon
	8cNtJLR4gUcelGEcziYjE2zXoizFl5pXOWZqo3J3R29HRNe0wkilF6WwhkIhOYEYm/Y=
X-Gm-Gg: AYBFou1EYWpYmJbzrTMzrtKCPwhEoQC5OIdXFSM07+fNZKpksn6A0jCffTtV6tWkrUK
	3kFp6sIGergTWGmD50Rk3YeUe67M9Gh0spWgSR/lGy/+X4h85CWQ+8GNLnlF+BPeQ2ICdj14zm8
	qKpitOoEnwfZdNhU8fDuWcuiS5bf5v/0n45nwif0SBG/8ns4JJvxkG6M8tMgkZ1z3YlMLym28LU
	IE/P4XahJmYdgpyICPsfYy0cOAFbGOLi4230azymocGPJeqbchyHaxEXjVqrl7Dc0x2I+TMIrxD
	BZJa738gGlg1Mt3kfqls0c5t0WmNgiErgG7Fb37Nb0ut1FA17RzPix+GrlWwQHbudLf5kWpZON9
	vcMwQD5JSqsGy265yzIcWK8mYWUu0VlR/KcRamcPBvTRkjp0EMaP5MnbZDt828BKCchtZJX2nAT
	qjhqg8nzXK6ntJy3voNmskwNGYjq8uw37TzeBWna8HDFqqjG2fiM+SxGNpZ0uSJ+JZoN8xJiNJu
	U/fhhE1MQVhU5X+HiYda26QNVM6DPQLy3aEBOpPb67tOA9X0BUEu78=
X-Received: by 2002:ac8:6f0d:0:b0:530:cbf7:6bb7 with SMTP id d75a77b69052e-5327f201bdemr54089991cf.49.1789573071567;
        Wed, 16 Sep 2026 08:37:51 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53262024a94sm24407431cf.15.2026.09.16.08.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 08:37:49 -0700 (PDT)
Date: Wed, 16 Sep 2026 11:37:46 -0400
From: Gregory Price <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com, akpm@linux-foundation.org, 
	liam@infradead.org, vbabka@kernel.org, jannh@google.com, wangjiexun@tinylab.org, 
	sashiko-bot <sashiko-bot@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH] mm/madvise: reclaim isolated folios if PTE restart fails
Message-ID: <aqq23i9824-GWdhg@gourry-fedora-PF4VCD3F>
References: <aql65IhMobL5Al9B@gourry-fedora-PF4VCD3F>
 <aqqTbGMJL86TzDrf@gremlin>
 <aqqbB_nFAOGenDhy@gourry-fedora-PF4VCD3F>
 <aqqjW5dpyznijYLh@gremlin>
 <aqqk89oTigJ9LS2N@gourry-fedora-PF4VCD3F>
 <5437871c-d9ee-49d2-b24f-965c73c29c3e@kernel.org>
 <aqquDtEZL1ndymGN@gourry-fedora-PF4VCD3F>
 <46d923e6-5724-4df6-b0d5-8dda7c547f6e@kernel.org>
 <aqqyhkZqcXDUrzeb@gourry-fedora-PF4VCD3F>
 <4fadcda7-d96a-4cd9-9b0f-5d387b6f82af@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4fadcda7-d96a-4cd9-9b0f-5d387b6f82af@kernel.org>

On Wed, Sep 16, 2026 at 05:24:43PM +0200, David Hildenbrand (Arm) wrote:
> On 9/16/26 17:19, Gregory Price wrote:
> > On Wed, Sep 16, 2026 at 04:59:32PM +0200, David Hildenbrand (Arm) wrote:
> >>>
> >>> LLM go brrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr
> >>
> >> No schlop like that please, I don't want to hate my life
> >>
> > 
> > You missed this part:
> > 
> > "I'm trying to be careful about not causing a bigger maintenance burden"
> > 
> > I wouldn't do that to you :]
> 
> I just wanted to make it very clear that I don't need another schlopped gigantic
> patch series in my inbox that I'll mostly have to ignore because it's
> un-reviewable ;)
> 

I would never :]

But *motions generally at madvise* if this isn't schlop i don't know
what is lol.

~Gregory
