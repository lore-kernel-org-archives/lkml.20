Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792441001;
	b=CPSpgk60mb3Ju5IeJzrVW3zjq6YSBYiF9p23FRCl8qDA07/bLsopvB2zM5jOOLYzgWLE
	 t7u0sAOY+Jn5W4hilY6IFngvLX4PiV6pezYl2XVFbfsJObbv+8+n+K8uzmKMTISDzVCtW
	 /S20lAGDdiUW/soaYG/Ak7axgeF/Lc7pHxjDWT2ojo+VZYQafI9jknR8dKaizS2biXea/
	 PRAIf5terGsi6R9M3zzk5rtUo1Wmssj4whfKrTHuJaeD9qXKCUzqZ2OmCAnbXLSdDGivK
	 8lkcL0C/GW0PIMTze2DmtntAJFj6LcQEZHdIly1XDgQ7vM9SZ/4v03OTeUKo9Tu5QIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792441001;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=S9eGMwv9EqBbEEX2MNNoILxQ3TMBAugbnnLoMrdF+dw=;
	b=Alz1MBlORgCz3CfjymlyOg3+HUzPtrehZITpnB1i34io8HFsf4EJ7XIvyOT3Tl9S+BpS
	 Fa8VuoFMelAJA0DpDia1mnwJfPsOKYqyNkmOqTGdkLokt4yYzD988z+/5becYyk4r2RUE
	 0cPHhtAcmKhpQgC7LAnT1jRNPMVh7ziMGODWe8gsOIUMbR/rWGpRxdUKjemYQJAvF04VT
	 7WC8HHNMHL98ceZJDrfKASR9QeRXXwLUF/6yd6xJ6YSBGSYNArzLAKj3WX4ASiXPqLojB
	 HpvZfg4FgTs0pRBB3yMxgZH1tFz9erXfY3MZU8WwRt1O9B3LKszS3N66IBr9D8xKiiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=M7nz4C2M;
	arc=none smtp.remote-ip=209.85.222.178
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1359D606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:16:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1359D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=M7nz4C2M
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-93ece7a73b9so334717385a.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792441000; x=1793045800; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S9eGMwv9EqBbEEX2MNNoILxQ3TMBAugbnnLoMrdF+dw=;
        b=M7nz4C2Mz8ane5eW/WdRbOyTKo3Q1vkLsYWhhB+2iQ90BZ24DpYvskXhZsXQDRntxR
         NjUP9PLKr2m/6Nx0WSxOx55ZSOJnW16QsVyhnmqxhtAC6Kfh9AwmSusTomdgbR3Ux5ka
         WqQw/cuw7tDXDNNDsvYO/KOKUclDffUAOVwJoZhlBJxrLyHiVAmCav9YGWXaOF/mCFpb
         FAfuef3n0bmdlyJqA99U3I2hStpW6IdMJEJ3Mtie0/drpu20ct4h3G2plTFpo2EMH/+0
         WHg8pSokOWgfzO7THrTl4XenWYkRsAmbHHAxI0QP2GPXNkpRgelf0cN9ytXLJBg9WxsQ
         ue/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792441000; x=1793045800;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S9eGMwv9EqBbEEX2MNNoILxQ3TMBAugbnnLoMrdF+dw=;
        b=C5AJ7pHRpnaLzFbcTxCWE47SgtqN0Amk/aH0ldc8hiaQap4N77Dis9R2HBawP8jfSY
         f95lB0OxIM+VKnupF+B4326nkWR00+WJ8UZZYbZ6zddh8AajJwppNO/WeR78VbeBXr9c
         FTV4UrgEAlbB9dgGDBJ4X0fATpYT+ZGD2SiV/2n0WvNJ1tXbC+THGFlMQFVeYj2Fgq5T
         N1GY7vf3ox1oqtDGLG1XTsPjNfvV4eMMhhVvFpLdbwAuOLbnNEjESwm7RoB4f1Xsy5bD
         YEhLr3w0qLCteDxDfRmxHtCVFR7Qg4Dm8/IKCAolVKsDl5fo6N9MZNP0+oG3jaHjv8Ps
         ehnQ==
X-Forwarded-Encrypted: i=1; AKwUvBz6BncApF2ZrdmOjh1SKgDeoRqs4LPePxFXkcw/6UJOhCtzTnH5L7BcKZsHKTrWdNda1tTUSeb+vkDcAD8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcM8U2K2ubavEdD0hGNlhbDPKLa5V/d7/uAUFk2jGLKAFOyOuz
	cah9VBo30PyyCsfo2StLD4XbYJOrsRbIEFlutVAMsV4PAQZew50GhoSqHQKL8VnlePw=
X-Gm-Gg: AYBFou2pNu7sjWMf/jHDzgWGcz5AyF5G/NdTVxAsUznsTXC3o7aFi+MEb+FDdSZcalL
	ItmYDmXq9PhGDc9jxV/saEZlVaeloTmfpVaJ0AE4PE8X5CJesujQmHWyFnI3NsdgB+gn8U9pxjx
	w0ppOjB3psSfdASDkUpdnB7mTUCF9RFaxMXqxYyU3c0AIDtZIsjZv8D2BdvBNzmGp/1E8ry2Fnj
	Iyy0T1RDIcCznxhvkUPj7BlkwxX3xPfV08YWr4JeBHZVS4/7bs6uGn6JyQfmYo67sAp6mQoj/av
	m8nl4zQFBLrCSHAn2kUqIPrwhMHK6W2JLwj148ALKTDWXV+6wq+suNro9v0QLvv3Uri0CeEfOpm
	TPvOFjrByo9t5YwNeB6yGspJmlNd7QcApv1GCxqhqfv1dpi4Kq5/bWrwnS9DABiOPnZmWNHSgZa
	lgHu4Og+IJk8pjSIfHV9BQ4pa1J1nHrVOtcL8NbYYL2w8v1OZYYjbgRmSFUF8c4/9VGi5c6xNwN
	KtgmuS3Gceq5fiISUwod+0kgNUK45Uxgr0us4fC9ofnxmbgq2jNR8Ro
X-Received: by 2002:a05:620a:2954:b0:93f:167e:d990 with SMTP id af79cd13be357-93f29d76b1dmr1324305785a.50.1792440999939;
        Mon, 19 Oct 2026 13:16:39 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f4b05c917sm46679685a.10.2026.10.19.13.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 13:16:39 -0700 (PDT)
Date: Mon, 19 Oct 2026 16:16:37 -0400
From: Gregory Price <gourry@gourry.net>
To: Zi Yan <ziy@nvidia.com>
Cc: linux-mm@kvack.org, Jiayuan Chen <jiayuan.chen@shopee.com>, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com, akpm@linux-foundation.org, 
	vbabka@kernel.org, surenb@google.com, mhocko@suse.com, brendan.jackman@linux.dev, 
	hannes@cmpxchg.org, flyinrm@gmail.com, stable@vger.kernel.org
Subject: Re: [PATCH] mm/page_alloc: let the highest memory node recover from
 hopeless state
Message-ID: <atZ6H6IIx5gmiAkg@gourry-fedora-PF4VCD3F>
References: <20261019184850.3427905-1-gourry@gourry.net>
 <DM92ROTIF1U8.26CQNH7ZPEBG@nvidia.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM92ROTIF1U8.26CQNH7ZPEBG@nvidia.com>

On Mon, Oct 19, 2026 at 03:51:27PM -0400, Zi Yan wrote:
> On Mon Oct 19, 2026 at 2:48 PM EDT, Gregory Price (Meta) wrote:
> >  		if (kswapd_test_hopeless(pgdat) &&
> > -		    next_memory_node(pgdat->node_id) < MAX_NUMNODES)
> > +		    num_node_state(N_MEMORY) > 1)
> 
> Why does a runtime behavior, clearing kswapd hopeless state, depend on a
> static memory topology (excluding memory hotadd/hotremove in this
> context)? There is nothing telling us if a fallback node has available memory.
> 
> Just reset it regardless. kswapd can go hopeless later if the node
> cannot be reclaimed.
> 

I mostly agree, but this was more of behavioral change than i was
outright willing to commit to in a stable backport.

I can send a follow up commit to drop the check altogether if you
prefer - but I'm not sure we want to drop it outright in the backport.

> BTW, LLM also points out that kswapd_try_clear_hopeless(), called by
> direct reclaim, only clears hopeless when the node is balanced, but that
> rarely happens. So hopeless state can stay much longer if there is only
> one node. Adding Jiayuna, who added kswapd_try_clear_hopeless(), to gvie
> some insight.
> 

Yeah I have some additional things in my pile on the hopeless flag, but
i haven't gotten around to them.

~Gregory
