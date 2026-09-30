Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5FA4F391A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790775653; cv=none; b=pmhkpH5t35DDdJAkliqBl4T9zIuD01l3xGnsLuoQm9V8FpDWelbz/PKlZLfng26aVjXvsDR6mNcWE5t5uhFs66xvV5ajoxOT/dyaU57iI5z0gnni59BSZU26/0GzQs5WvWt+QzU07Yzr8VjWWFhd5w8q4CYbNtPW1i/OFCL8H4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790775653; c=relaxed/simple;
	bh=TN0et96wk0KsRAeHUBwRAJLFU31hTDc5CY9QHL8nnWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RF3dxwn+fsh8yEd6vF2qKaMDb+56s8RzRASUuG1E6R0Siv5UiSws0/7GLhcVwjT0qplVEyTOTcKvRyE/Xx28XHbicJpBAirX/VhdcclqJ/HGQNRgISs0wT+MYrwg8pNw9iDLvaPHyEWdgLZHrOv9UyawFXfY1o0WGrxY2FSVF3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=UbOcf/vW; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="UbOcf/vW"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49fff72474fso23203195e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790775640; x=1791380440; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eojcGFVlS5R1p8FpQbuCoxDLXSD0EodVKDy7T+pbRu8=;
        b=UbOcf/vWKFVbzwcX+8OZqz/tiiolzoXqtLzo58zMW4HKOQqdsU7PiMIeqiTKRiJ82n
         5nI1WSPrha4/QzX/+70yeVuSHK7UOBp81wmeDK81PZIkZ5zWfqd+4BP0yLfKXAhJko1/
         yB6XnEPPDHDMTVUsvCgGAHQN2frqzV8ooyMmOzX+bNSNS9pYS57AxLyUgnsCIZMIjBzF
         0J2y11nXqQ0HUQzqTbBM/QsdG2xDe7LLTJUi3BDTONShEvqCre0GEEsPWEUUtMa1t+6/
         60x3BL+Drlxj7aWZ5Pd90hjsIPW8nn7AdMLM4sjm070t6KVrxP1U+lMHTewD0Szwoald
         4VJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790775640; x=1791380440;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eojcGFVlS5R1p8FpQbuCoxDLXSD0EodVKDy7T+pbRu8=;
        b=h61LpV3f/PsubORsF9yUrtJ/2DHFNuC3SqIxJug5wziCdP802gj0YRuraMzJ5LfQuS
         S3Mhxi2eeu+IQpSakh0CVpKX2wlxqZmWEJ1nrui+8rsSLfXz26KrDhZMguVx9lFoZJcr
         Aym1yO7h54AgbRTVg2whqJJF1qgVDabpdqh1IsK13bhu+5VeGZ+U0QiYTjtR/zNwQJzP
         s2E/xgvnXeaXcCMIgUlAx4vZVwFqWNhAqsck75aCLhwws7cTAyS9N+07PqfcoHKkrPeX
         lvm/3twh5k0Ryl9T2IEESQQq/uwI2jz9DO+Ce//rb8AdgCYtzRHa110C/GnitJAIXkuT
         DQQA==
X-Forwarded-Encrypted: i=1; AKwUvBzsu0AqddRylxNdx1cvSfcvfV1hE/YlecT8vmMXv+3SnScU3aTp4f2yIvN4UwnCwVq3RIwpiN4L/dgkzVU=@vger.kernel.org
X-Gm-Message-State: AFuF++l0E2pm+zIjEF1iIXA6ulSTfvi2w3RF+EdSZu65yQ5dmDTHmgK0
	WxBRc+bEGp4DcqNcS/rI62884AFZIK84gJrHRzQGEhT8EMHxnSpsOcGlmtW7sxp/mI0=
X-Gm-Gg: AYBFou3jwZhpvL9c2FePglYnAe2cUKq7jU1Y5WT6J4f2j4Bcc70cKqhdJ+AdO7kSHRt
	znRSi89zNxP4ZJkVWem0hPl1Z5BdfMGKw8vu5bOoCE8HeiG8rafBA8vSX79htlrM2ngbgOX9Z1G
	UoAjG2vJG8lXR88do94ddzwDWI1jZ1s/ZnskqosyoeVZkqmi+7zPnY13XLNCt1vtIoQedYm+Jy2
	1buAyySzxb6NL6c+oQ+MeJZdPU1YIh1wHpHMNClZZYLvNxa2JgbdNx3NzJl8aSrIcy3QgoZBvtc
	KEoJxfQ5cp0akOKz/xZT7YLRmU3cmJlCdKMjJFtrLXb7GIAfTwTkDJ0eNP/PzPsm0vVA9v5USTq
	NR6gW5nVxlyda7kPO2iPWxIdpo5I1l8MFKei3yV7oveaErWwHEYb1h5CnX23E4tXM4uVdyx/ohj
	oZu6ubuZwiPfyuV6XjZrHLkVxBk9WzhyKR9q71HYiwQPH7yvDydOQ67GnYmsCPcvmiyw8=
X-Received: by 2002:a05:600c:45d3:b0:49f:fe39:5bc8 with SMTP id 5b1f17b1804b1-4a01aff9b3dmr20989845e9.12.1790775640194;
        Wed, 30 Sep 2026 06:40:40 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F ([2620:10d:c092:500::6:13b8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01e662409sm125005e9.5.2026.09.30.06.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 06:40:39 -0700 (PDT)
Date: Wed, 30 Sep 2026 09:40:37 -0400
From: Gregory Price <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Li Zhe <lizhe.67@bytedance.com>, akpm@linux-foundation.org, 
	ljs@kernel.org, liam@infradead.org, rppt@kernel.org, mhocko@suse.com, 
	corbet@lwn.net, skhan@linuxfoundation.org, ziy@nvidia.com, 
	joshua.hahnjy@gmail.com, ying.huang@linux.alibaba.com, apopple@nvidia.com, 
	linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/numa_balancing: allow migrate on protnone reference
 with MPOL_WEIGHTED_INTERLEAVE policy
Message-ID: <ar0LqjO3-cwU6-Jy@gourry-fedora-PF4VCD3F>
References: <20260930072617.64665-1-lizhe.67@bytedance.com>
 <cfdcaaa3-a9e7-4352-ab01-4922ebb8e0c9@kernel.org>
 <arz56nVu8TzSjqlg@gourry-fedora-PF4VCD3F>
 <ca35c989-9aa1-491f-a247-ed36724f10a0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca35c989-9aa1-491f-a247-ed36724f10a0@kernel.org>

On Wed, Sep 30, 2026 at 02:32:16PM +0200, David Hildenbrand (Arm) wrote:
> > 
> > Right, but you're requesting this configuration.  If you didn't set
> > F_NUMA_BALANCING then you get the existing semantics.
> > 
> > In the existing semantics, if we're INTERLEAVE and WEIGHTED_INTERLEAVE
> > we just always say "no tiering for you".
> > 
> > But as an opt-in option?  I don't quite see the argument for saying
> > interleaved regions (or tasks) to be opted-out if the user asks for it -
> > that just seems like an arbitrary limitation.
> 
> Just to be clear, what I am saying is: the proposed semantics are inconsistent
> (weighted when mechanism A honors them and mechanism B doesn't honor them), but
> once we set these semantics in stone like that, we cannot easily change them
> later because some user might depend on that behavior.
> 
> So you'll need yet another flag to say "NUMA balancing really also honors the
> weights". And that's where it all gets ugly.
> 

I would agree with you if demotion didn't entirely ignoring mempolicy.

On a tiered system, mempolicy *only* applies to initial (or fault-in)
placement, and otherwise is more or less entirely ignored.  This is
a case where it's not ignored - which is actually inconsistent with
the rest of the tiering tools (demotion, damon).

This is why I said this distinction may only make sense in TIERING
mode, while in NORMAL mode you likely just want to fault it back to
its original interleave location.

Also file interleave (indexed by offset) vs task (counter-incremented)
policies are affected by these changes very differently, which I asked
for some thought on.

As tiering develops, the less I think task-mempolicy as a whole makes
much sense (because it's at-best advisory).

~Gregory
