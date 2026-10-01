Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6184F31283E
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 13:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790861170; cv=none; b=lqHuiymxTwX90ZkBpPI0aBMVZqXoZYDXq0XMq/GJp86z5/GvhulvM/gT5xbvFngPXSAROYyeYAMoSGNrn2GJOlw5FthsFK4+jSQPQOQfP4hobwKvRqyMOpjrQ5CrpektLWegMbfI3vIpk7NRnxtoMO9fSQ8cLwndqJkVETnBaL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790861170; c=relaxed/simple;
	bh=ASd1S1qQ49fEQp8HALzVs+yB7/ulU5Tcnt2/SJGQYMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JW9K16LmTkDWjHg2+EHnY1HPRbO5OLpdusg3HIxZeNKMvAKo52PUsfawfHDQtlVTMviasbXBOmsTQZQOdqJgWVH67BW4/XxO96mmaulWzzGk+2FYr6l3EU3LiDt9wergcXwkjQw+9Rb2d8xhEy9tGEaqT1hijLQhueozBBudS3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=LM4yJuLo; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="LM4yJuLo"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4887840c529so2264699f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 06:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790861166; x=1791465966; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1U7rCP2J1UR7XvChQyXqCJWaXLGRfuecEUSlZ8WyOlk=;
        b=LM4yJuLoNL6+u5IzkUooUlEr1vzWbopo0MxKOnmOoLle2O53r3hPVkGx0mEHOtkBzj
         +ypb7pZNIe/rTQTPYwmlSueAfykkmiW643NXszTqwcDEfLnEgNeSx+C+mpeWYWTWNnn7
         0r5y6Ku1VDFEpK1u7WAJIdyrR3n76v8w8vHIB2eZ4xrDcUKlf8VqpVxKZyNibTszNICL
         vkxJtT7PgKWFP7xPdbi7kVjuT69PG8NX0FgN+x6mI+9yhadzmJl5Mj49h2OMs46s8YzX
         l1ja4Dmemy03+Xc4Y0W4TZETspPcuyqlWNmbKtJppagFCfZw3zduoRvYRpx7C1n2D0Z5
         i2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790861166; x=1791465966;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1U7rCP2J1UR7XvChQyXqCJWaXLGRfuecEUSlZ8WyOlk=;
        b=XW0cCEW5Fce+uD9VCtcwyR1OraEmFUa2ABEWezGMIuMK5k3wooNe4VDS7B7yV8ymgA
         3WOQdoMRBQyrlChuR5Gc2LJ2dsOQ8tTnO3kAOdqETaKCfDAcfJwucA4wVFZi8hNDMl1L
         eyEFhgBvYCmAfp98pYrVayV+3has3sEPaNSd9NpEjUtoHqcZjErbYY1nDM1P7KTuh/wX
         NvAWSz02Noo8Ep+uy2H1z/M7Znj3lTD3Sidq/DtkH0dA4HUhOeprq59YuNiKc6/XbZr3
         xnIEWC3AtNzxSGA/jH0bXDyZiOoD9e0WLYcs/y80/5tPIZxNGabYzCXyqu5GxWnP/Oir
         6bbA==
X-Forwarded-Encrypted: i=1; AKwUvBycn9jzRp1b7FSOdSbopjzqBRTNtsTvhM0cwhHijsJ0HRYocqyUURYcD8ea+qo+/vOHGcA6IT8ZES4UUq4=@vger.kernel.org
X-Gm-Message-State: AFuF++lht3RSviTNd1ekepjVzWclDIP5XA7fZh7Qkvp3HmAguLm689k+
	jZP8Rcs0/I4Sq2aAUdxQPiy0gYJqYdO/08jJYs2YQ3GLJU927T/NgwI5pQ1fPW00Szs=
X-Gm-Gg: AYBFou19yPVvMx7CkLt1lwA/GyiRUiOILTh2iEraMSqsnDKlimwfV73vJRyeYaJH/NQ
	jhoKHk0E+1gbepKmZgcNDp9td0UdgEOm218JTw2cowuE7wMio6p/Bg7m5FKcnr6F8imZzD9nCa1
	jXSOTfZa6T71bZlTyu40qOztMaGqy9fnvAvgjX6dQhdXySQ6h0lASM0/7wPfh2rwnetgIV5ywcj
	Xq0puwQYYUnX1dRouuDtH7Th/lp0MCZq262TSPKFHSAGrkroMZcz2vLV4fvrmMeMXxDrsi2mlNR
	DDB6mlV3IwSFYAVZqkDVaMnoXmKi1/YY04YcUj9fS/2RxbUkTa6iw8F1ioiNyYAjEw3Szgd/JfV
	Wb/Pg05U0Hw/JM7Z6ZR3YsWgublkSF2yQHNaVUWGDc9+/cxNsMvl9O/lCyxIFiYWpcQE+qtWLVV
	eO0/ecQnfxmqO6H1fitn8IGi1fMNJfn482zFCdrLM0wZ7nAA3hJbIkXQCmJS/3Sq9Kvyd9qE8Mj
	has6w==
X-Received: by 2002:a05:600c:a107:b0:4a0:1ef1:b62b with SMTP id 5b1f17b1804b1-4a01ef1b7ebmr36180515e9.10.1790861166322;
        Thu, 01 Oct 2026 06:26:06 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F ([2620:10d:c092:500::6:7dd1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f93ad0bsm47435175e9.4.2026.10.01.06.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 06:26:05 -0700 (PDT)
Date: Thu, 1 Oct 2026 09:26:03 -0400
From: Gregory Price <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Zi Yan <ziy@nvidia.com>, Li Zhe <lizhe.67@bytedance.com>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, akpm@linux-foundation.org, ljs@kernel.org, liam@infradead.org, 
	rppt@kernel.org, mhocko@suse.com, corbet@lwn.net, skhan@linuxfoundation.org, 
	ying.huang@linux.alibaba.com, apopple@nvidia.com, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/numa_balancing: allow migrate on protnone reference
 with MPOL_WEIGHTED_INTERLEAVE policy
Message-ID: <ar5eC22VfSFlMw3W@gourry-fedora-PF4VCD3F>
References: <20260930121154.687586-1-joshua.hahnjy@gmail.com>
 <2e3f12b7-0dac-428c-b70b-07e1f63de028@bytedance.com>
 <ar0fURbLDPrphYMY@gourry-fedora-PF4VCD3F>
 <A005B05D-A85C-4153-A65D-0BDF9D8500DF@nvidia.com>
 <280965b2-c6eb-4f01-a0ac-c4fb7e518f97@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <280965b2-c6eb-4f01-a0ac-c4fb7e518f97@kernel.org>

On Thu, Oct 01, 2026 at 12:54:22PM +0200, David Hildenbrand (Arm) wrote:
> > If this is a initial-fill problem, can userspace set weighted interleave
> > initially? The program or harness can observe memory usage of the program
> > or related NUMA nodes and switch the policy to numa balancing via
> > set_mempolicy() or mbind() without MPOL_MF_MOVE after certain threshold
> > is met?
> 
> You mean: use the weighted policy initially and then switch to a NUMA-balancing
> one which doesn't involve the weights anymore?
> 
> That makes more sense to me. Although I struggle to see why an effectively
> "let's put random memory on slow and others at hot" is a good starting point to
> later let if be fixed up by actual balancing/tiering.
> 
> It all sounds a bit hackish. :)
>

It is a bit of a non-combo (Nonbo).  You're using weighted interleave
with the intent of spreading out the bandwidth utilization (and maybe to
offset some reclaim behavior? *shrug*) but then undo all the placement
with tiering.

But, in defense of the hackery - I have seen strategies like this work
to optimize startup times and then let tiering optimize runtime.  Phased
execution gets funky like that.

~Gregory
