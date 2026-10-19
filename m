Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792426250;
	b=MsofFvrkkFn/feg4SC7kt7NHt76BtPjaptPtn1IU9y7t2HbDwnXBHgEQWlUYPEpwCSiy
	 DleLxVFh+uQkebVm7Mt9mLEpO2qT4I5e5ebSgOHGVN5Mgprq55e5cvZtVXnwpwg+FmNFH
	 JhPTjhEO9G0XYva8+k5fL5jj0heWXgoSKTQIineVH3ewF/3RoKNlSmQVsi6b04UMOx38J
	 9gCvhSy7dFcpTJ9sgbM0PcI/V2PIgOrZ/F+hI+u9prYNDuAgVtGqtVouPQskM4ydaeEsr
	 W0owIz49zfXPi0wOMoY9RHYN+L5GBGtBzSjqUQaMwa/7nIL5sWPpBvlWXfxK+6Wu/QA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426250;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=524VuOfFgYNOliyeGIEdLFsd0yqaT8bQWUr86gODCAI=;
	b=sM9Y0YcmPMmWxvyHRCRwkm5dhlpyxrkDHlARRrOIa7sO2lSWvgKUdLvINBEZZxruFdsp
	 AXl5ggCLArghuC5dsz4Hm/YJaxFkdrwvkqDFaX5mKyqZ6mDMEJ2dTk4YRfsCOqqwni73b
	 C+1oiJyQb8rX5/gLWkksBwfCtw7vjX7NWB4d2ZZYAXD1ggtXH10T/i3oQ5ALq+DSslM6W
	 eTr6Ij9KfBpKrk3sWVkkvJSIDBpiZcVlz0t4pnGt5C9nfDWL3Ga2Cfb/NkYZl/dPk+ou+
	 uRZPj0c9SDSkP/TCSrGz5yzccrVK15iQ0ff3k3KQcqmSBWSmfoCKFkblpcjSLDKIL2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=TAJh4Er4;
	arc=none smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A631606AAD7
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:10:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A631606AAD7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=TAJh4Er4
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5363c8de563so20570811cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792426243; x=1793031043; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=524VuOfFgYNOliyeGIEdLFsd0yqaT8bQWUr86gODCAI=;
        b=TAJh4Er47ofnVCoUNWaumAYwysFjlSVRNjlHTmpTj1ZVtJ8fNPL1utvGKmXgV/4eBn
         WKml7mwNMk1f4tolbgazAnDGzkiSTKi9S8sXbDLJ3mZ6RBuEISEJCFx34RfbbToZYejN
         GZebR7UyU1PJt5HKc8XJur2s0Ojoh9U+eB+PjNvpRdBhPztdPt7yw5yjOZKUqVcf41Mn
         RZ4zmBu7vhessj9FGFWqp3joEv9m+RJWapnFHDaFxtO/DoPP+9H0PcsSGKdsdK9xVNIg
         JhR5TvhtMwla4ZgbDGqUQtnivSkJ958HLCYzNQxMzV2lswOONH30M2fjJylmos/D2s/+
         K9fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792426243; x=1793031043;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=524VuOfFgYNOliyeGIEdLFsd0yqaT8bQWUr86gODCAI=;
        b=VyCMTlROo2GVMzH+7dJchKikzxQHgFE+UIp8SDIh01SsuKkKJN8YLyPJgcer2z8NDB
         Ev76I1ycSKDAru8ikTMe7jQWbwlFZjtwHT0rCSUv7WsAh/Wp7kqp/zZOZ1nRGC/NFr9O
         nkF9Gf5Z0hdk5m7P6uOH4/5Q1leTBjtB2LX5oaSepREJeUHyeSktiW9xExbqL0CCVE05
         L5fHyd9E5QSO7TtetWjEPWLGeTBwin0U70ycTN1t2PYWgWPSLN8C8SBMNLCr9JphEq0w
         d7bKs0LQDD/VpjFsoDzHoLLC2aZMBHDuQ2SMud+h1JcxHGgD3nwsjPaigYUxB5RsQ52U
         NysQ==
X-Forwarded-Encrypted: i=1; AKwUvBwAcyHCp1ofjQaxA30eQHz2ozQwc6v7iUz77prYU7zX31TmwAGlkPDcO19GeoYUpBL1RWqpKMDJF4zqXXM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKY3KRHzVmEfglwbp173lZj1JBzWV1zkiqlWA9lF8t/78qIBMm1
	YsLRu1p+Ip+9Dd1LkAYTDigCXdq7RUxK6oN5CW6gbdWaQeQnlwqbUMZQr3NxTvs4zSc=
X-Gm-Gg: AYBFou3lP9HidvEwEefW0+z80JT61u1ME5JrlfqNZeBuVsuTVD4S/+11VxqX/pOLv/7
	KcvXDCh/ZJVKaH6N31PpNZRHKm0bj/6VGjQMomHtELcpPaXmUaYtJ8/axD8kQtPwe4S+2Y3NXn3
	QYaDkQtPux4v6MBWZBZ4867DUihlksYNDOrq2mi9iReiKdohqf7tfQicrdnWFhUZlDSHQmRMkfm
	wMxwU+nf2qzCCKN08V8a0N5vFWRxo21++q/JAH1VvBz1IdfDVJrxarNuo6QYMvI1rUi51TDMdlg
	CcjFrK3ikn3G6YkRtG1tBKuh7fJZNXBClJUDZ1cU5Nmr7623glX5wamQr7OlzD5kTunf1xnUgGC
	IOeB5odbFydUqxcILaEuNDMfQUeHW7QCs2uJIBru+3wmGXatPfSfy/1bcqgmMPkWvbezbjzPMKc
	F1J5fHl09eWXL+0Pa13X66SEK81wCZ6N+e0hlQQpYt92joOgJbSu2UED44RkWT9DhckFb0bXoGs
	juUtu6hCXdMh8oJIq/KXx6+ekA+zHPe+pFAxJIt9s0+Gj13aF8mlWA=
X-Received: by 2002:a05:622a:90b:b0:536:48df:345a with SMTP id d75a77b69052e-53648df3cb9mr103473081cf.32.1792426243229;
        Mon, 19 Oct 2026 09:10:43 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5367b3d1ccbsm12827051cf.0.2026.10.19.09.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:10:42 -0700 (PDT)
Date: Mon, 19 Oct 2026 12:10:40 -0400
From: Gregory Price <gourry@gourry.net>
To: Li Zhe <lizhe.67@bytedance.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ziy@nvidia.com, 
	joshua.hahnjy@gmail.com, rakie.kim@sk.com, ying.huang@linux.alibaba.com, ljs@kernel.org, 
	mhocko@suse.com, muchun.song@linux.dev, roman.gushchin@linux.dev, 
	shakeel.butt@linux.dev, weixugc@google.com, cgroups@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [RFC 0/2] mm: add source selectors to memory.reclaim
Message-ID: <atY-LD2AzCYATRii@gourry-fedora-PF4VCD3F>
References: <20261019141401.11927-1-lizhe.67@bytedance.com>
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
In-Reply-To: <20261019141401.11927-1-lizhe.67@bytedance.com>

On Mon, Oct 19, 2026 at 10:13:59PM +0800, Li Zhe wrote:
> memory.reclaim is a useful proactive reclaim interface for memcgs, but
> tiered memory makes "reclaim N bytes from this memcg" underspecified for
> userspace controllers that manage memory placement across tiers. The
> kernel's reclaim policy is aging-based, and on tiered systems aging may
> demote folios before they are eventually evicted. Without a way to
> declare where reclaim pressure should start, userspace can only reclaim
> from the memcg as a whole and observe one aggregate progress value.

This is not a good argument for pushing the complexity of managing tiers
into userspace - it is an argument for fixing the reclaim interface to
handle demotion and eviction sanely - which presently we do not do.

My best examples:
  1) the watermarks don't make sense for lower tiers that need to absorb
     large amounts of demotions from upper tiers.  It's likely lower
     tiers need larger WMARK_PROMO to let low-tier kswapd run longer.

  2) proactive and async reclaim current reclaim top-down, which results
     in swapping directly from top-tiers because lower tiers don't have
     space to absorb demotions.  We should experiment with async /
     proactive reclaim applying bottom-up (lowest tier first) so aging
     the top-tiers demotes into lower tiers more successfully.

     direct reclaim should stay top-down because we want the best page
     with the least work to minimize stalls.

I have a strong suspicion if we made these change, then memcg.reclaim
would work more or less the way you'd want - and anything else can be
managed more directly with madvise/process_madvise.

I also have concerns with extending memory.reclaim this way permanently
locking in reclaim implementation details that prevent us from making
changes like this in the future.

~Gregory
