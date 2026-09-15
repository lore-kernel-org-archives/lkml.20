Received: from mail-wr2-f19.google.com (mail-wr2-f19.google.com [74.125.225.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A58D3B7767
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 21:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789507868; cv=none; b=J79QAYBR2QxcZ8ICRTyBEH+TXfFFgMY+FlrqtRmahBb6VlrxYNENAg5QbnhK2LA/HLItQpv1WpXEAZJ7bjnJwmNnXXCyOUBO4pYNFb4LPzbBUNYJcxNBs6gQWCbHhcr5w4GP7ee1MRafKoQkMKKpLqpARkqoIJR5haJzIKcYCcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789507868; c=relaxed/simple;
	bh=hxkVFZZoMQECY3fDO3cdjGvVbbJxX4hdwI6RfZfrqKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b9cMbY4ilXk5aCHEwn4qGftzjM8GStwDnrAFliKtfQCBFQzXgsCpHWlZ32fZPcd5a0iWXpGz1Zf04Pv2Th1a/XGJzxifhFh9IoGbF70QNBinoS15+53o2MajNpieSU7XgFrR8Kt3K7yjsX6fIs+mDboUyILDYRXfr4jvcnRhFeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DTyDZJI3; arc=none smtp.client-ip=74.125.225.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DTyDZJI3"
Received: by mail-wr2-f19.google.com with SMTP id ffacd0b85a97d-48583cc7ab1so75043f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 14:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789507865; x=1790112665; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f43s6nsHY5Ivj1yPDbhwSaNlMFWcD03sTjXZTf3Cl8Q=;
        b=DTyDZJI30sZ323NGKdvALZAwO5cVZbJlLYLl0MJHW5HCQtocmhOIFLcgvGyir78Jze
         KMMRLs/eACl8fuQgvKRoCx0U0euZMg79Qk0etGIRudoOhuerjNmc5oEEuNbvHczoQ/YO
         Qx8fwfmk3B1K4sFose5nOOPrGv6a0yr80iHKveapxFA98aJdpSUEnsIuWXX+nfzW0UXW
         ju1upRb2DQKRhoSFiw8ESB9g2TqiEygh0kDH7s3M99nfLBdeU7BqDS+Hbd/n3jN7fqAq
         ReXY0fzweUUwgMaLT2C0LdzyKqn2HR/Pfa19ny6E/tkPYcT54bY1RbNYCJep/w3ZQmMo
         IQRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789507865; x=1790112665;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f43s6nsHY5Ivj1yPDbhwSaNlMFWcD03sTjXZTf3Cl8Q=;
        b=nuq8RwOeQ6m072RRnO6DgvPlDJ2Xn21ZZQpixhtmkS5OK1Utx9Y8NP66KaQOXcA5gK
         zflM6zz0d82SkkfFk7g3IZumssA3G99P1b2FbORNXaKMEf5vdhKKP4eO0N/0hhm2p7k5
         NkYYvlLE4yjQf7FfSDMWOuF/P7ABGPUnlQzw4aRJccFiQcayJwdfcxGb1wx67/ZBlN97
         PFX1wRG7NQvKmolK2cwgUXbPbcakHCqetAkSdZ04uoIXQ1xj1i3xq2jsnasL4SKWRsd4
         GH9b8LMF78lAZ92uV/mzI/8N2mtNjzStNLZ726pX9E7dp/1kQZ+kC18SFkSnu+vPyPg2
         yyzQ==
X-Forwarded-Encrypted: i=1; AKwUvBxaURRVCdfkpL5ARIG/hxIujEPeg+pOKUWdpvZcp6SHBGfy6bshkpv5ono9KvbgH2j+Z9MS+0Wkfp2UNvo=@vger.kernel.org
X-Gm-Message-State: AFuF++mQwn2QMf8RQ6KfympoILNnqHjiIfI+ZcxIt88TPjEuuUE1ALrW
	Yh0NQjrG5B/gIkxmOQ6r4y1ylTxwIqcaCgEX+YI7KYWhUzC2iCqgZQ8d
X-Gm-Gg: AYBFou2knxQykOtLZHBouBw+avX5wgulHC9eVAqm6L63ydWSa8EsWQ3c0LcQOFK/wFG
	kKJTSbwKdxZC+YSlXDkCsLUIGyMfN7C8gQc1y6zbciO7422W2abx+0e7Ulg1R2F+0UGRr6Qd9VT
	ajB3dd8ZejEDnZUK7pu1crLRvJwT//YXUdmZj11nt5MSze3g+JZvYG+tRq4cmFhS1ioKr0/mkPP
	gvoSy5svgN4kE13JBt9xBhW2sH1cvyn+Cc/h9ytiX/LwSm8D3oszZpunn5u6+/QOaZxYnBsBPbD
	9mFIsbPTWaEkSAGTDGyLS3qOh5pI2UlcaoMP9fG9eDVOqgwAxOkzODOGNbnrbo5EnRR4fFsIqHJ
	qbtjyMSdH7jg82hsywMGAkQgVhWQdy0kzMvKjhqiyoPE9Nh5GZJdyh91uzC/NdbrCoBX58LSVwR
	1WU+EjFh41jCtdoYjuBIDtHQxTLX9X9/SPbvBQmcWn539g5p94/Curg7jIqTlhC9xAc9BzUQazU
	JfUTA7Oe/dUstktQk4czE5g9+JA6Mp5mtuLi0nqXB84srbN5R0RGcYQ5wjkUlQcJNtX1I6Gadv2
	TJifKQ8URLT714tSorCS8tYX9iVmN6hh19LVHJKy58m018XPJupHAwD1juCOUOvenqxhEecl
X-Received: by 2002:a05:6000:400c:b0:486:e9ab:2b86 with SMTP id ffacd0b85a97d-4870d0717damr254328f8f.39.1789507865223;
        Tue, 15 Sep 2026 14:31:05 -0700 (PDT)
Received: from MBP-von-Karl (dynamic-2a02-3100-afd5-c801-ec9e-1a2a-2fc8-3f88.310.pool.telefonica.de. [2a02:3100:afd5:c801:ec9e:1a2a:2fc8:3f88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf43511sm1713554f8f.33.2026.09.15.14.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 14:31:04 -0700 (PDT)
Date: Tue, 15 Sep 2026 23:31:02 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: KunWu Chan <kunwu.chan@gmail.com>
Cc: SJ Park <sj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Lian Wang <lianux.mm@gmail.com>, damon@lists.linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mm/damon/tests/core-kunit: test PSI goal rounds
 under the temporal tuner
Message-ID: <aqm4xSben7Aq1iNO@gmail.com>
References: <20260915060937.3423-1-kmehltretter@gmail.com>
 <20260915060937.3423-3-kmehltretter@gmail.com>
 <CAN_Opa9rS45S_MHbmf63KC0LY9AGAdAC5r=vv_qcYMVAenWosQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAN_Opa9rS45S_MHbmf63KC0LY9AGAdAC5r=vv_qcYMVAenWosQ@mail.gmail.com>

On Tue, Sep 15, 2026 at 03:04:06PM +0100, KunWu Chan wrote:
> Could we also check goal->last_psi_total here?
> 
> The first tuning round should consume the U64_MAX sentinel
> and establish the measured state.
> 
> Testing this explicitly would lock in that state transition.
> 

Thanks for the review, good idea! The test only inferred the state
from the effective quota, a direct check of last_psi_total is clearer
and stricter.

It also fits the v2 fix. I plan to keep last_psi_total across a
commit of an existing PSI goal instead of touching the tuners, so
that value is what the test should assert.

For the v2 test I plan to check last_psi_total at each transition:
not U64_MAX after the first round, still the kept sample after a
commit of the same metric, U64_MAX again after a commit that changes
the metric and back. The quota checks stay to cover the tuners.

Karl
