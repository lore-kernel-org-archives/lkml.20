Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794235972;
	b=Oxn9jlwdXYy+9t2UhO7FQsZ3JJP54ilId0H7+j6AhszyEUlZdv0kjEiSxqGg3ntGfyxB
	 0IsRBt774YMJ8C5yxVBh6u8BNgrRJTg1SwdhSObyyL/OzcxS3eDQKg1dJYDkyuTdYD0Uy
	 p8kqEBlzWNWjhp7UFStJPriRRHxnotuUjZoK7+f/y9FyqWRzEyLcl4czt/fSx29gFGdZd
	 aztyon/uxsqb7IeK13chR+Cnu5dURCYLAKOVGA1lr69vExl0LQjkiwTiiaTzlaqfQr2u/
	 pI+fBKUJEmEvteA38KZ8czY7M2Kb5xt7KdrcN8muD9S64bfZzk0VmOnrSlY26KNipGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794235972;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=RMkO9oL77p5sRlwGpFl2L+7RNFhj/mskLD55QzNXito=;
	b=x79XxGN9M4IzW+dXXU4G98KU8BuzgwuBgQMbYxaPl+nw3f1QKwQSsCoLVavZazpsM8+S
	 62v63b+FYjuWLWE19LGzDsCd5CpTEEzhSLHusZiBul0kJMTSCcFqvdveHbIhC9khv5RQF
	 oC2sZJWI7ZvJIvCZ5zoCHVPUUFVBD9z5B/aJt7+r1ajDbJJABrYiwFiwd9l03OFnCQ6tC
	 OD3e6tPUQ1Ief9gaLdfkKEyFa7kg1StF66y+wmFx/7Hjxo0TKZVGzrGRkDWrqqeBalhbT
	 Tp0FhKxZj3zxwMEFCRwrli7YSUzbQmH9zI/KtnlpkdLpm5PoGJxl1bdCB7ctQ0sl4sQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b="LF/+eb5R";
	arc=none smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C2B606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:52:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63C2B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=LF/+eb5R
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-53cd0c8614eso5869591cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794235971; x=1794840771; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RMkO9oL77p5sRlwGpFl2L+7RNFhj/mskLD55QzNXito=;
        b=LF/+eb5Rhw/1gJgLm9Vex7iyLPifi+/cZSrs/oL/G0x3lSuU7zSqIkrAm6f6qGtlQQ
         6fI0adOck8HUBmvyazU2/pecUsoE+fv43TkTvCNKQ2uGknNSvEV57lVoAsvcv7m3Dvs9
         1/Iq9KLTdFVV5uxwidLQBTmCAZFdJ5eADU2Gxcl+lCsm62zFE/L2ziKkeAeS60H0Em17
         9IfgPZSIpWnUk+EjcZT4w7XDUSgZ+cEkPGDLQxQa9TQXBwQMQ0uUIIj7VGjedEIoJE+N
         jP+QQ9L52yKAhgLKjmw3dCLX32r1qvaqCrPlaf78PM3TBrlGIffFCFPnMsbn0p7NCV4N
         4xXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794235971; x=1794840771;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RMkO9oL77p5sRlwGpFl2L+7RNFhj/mskLD55QzNXito=;
        b=L1s+K5ImdHqHt2MkPVQMKtz7cPhU0cvHidpPTMGTPSSv/zeS+7JU6b1FIAwJ/wygOF
         EiX8XiX98gLaLqQFc+ObsXSibKTFgxFx0mHoGfGpnKXHV6B0R8qbxaUk43KxtJHFSEmg
         6g2+YznpUgciZgaWdSJCu8oUB7pAGDAX1Vv93iw9Mvu5LY65fyJo8vYjvXxHK+VnfbgS
         7LhfPbFy3gedQruj/D+5Lq/pzjJbdz7fHPwtNcgxW0bDiuBXctk+IQl+QsQKUrMKuv+j
         ENIuGFq1SNNHPVBkOKZP5uWtIIJInw76yYokkpITMGpUVmC66F7akwc2oOjveRdtoCQI
         QoXg==
X-Forwarded-Encrypted: i=1; AL+hErGLble3MhFBJqedzITqxZra3sNaff4fXrKSH1mQfgWybegBqQ1VPELbjUIAeaVsdx6SSiNsltuA9lcV2t0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9IFJ8NxWXta1rHGgJzunTLbYw79NzCSwPZvVPUM0yVgpVwdFPa
	73rBHj8z/4DgDUSrLPRD65JSkYQz3nhSANarrwWCzkI8Z1IE0OwPbs6neYkEE+50QdI=
X-Gm-Gg: AYBFou3ujzwrIdjkCk1nfKXIwCwsg1wg+fYaE+8k/GqEueKXUYsBPrXGfq1UIsiyy7u
	amp3TlimexLzakU8PwjwRgSWAop6ZWxDJNhwAmqSfeDi2O49+ZfuIE1u3qZ478HwlR4J6rWMWW7
	x5fpkcUB4vGSNS9IMDTCIkdBhqXsREepzSSR49dfZ365ZkYYRpEhXO9O3Vew5Vh7h1OoGSbSd53
	d8zFPp4B+tStR7Z6o1wYjEHgUZRJhKdhqPi3ix+ALZJNXeoQnZVN7t8nH5IbRVqjQtUklv7ajhg
	47UjksoDslu5cudmKlHfzIqoQ+sPtc7sXmGGRF+Fa1avRvpFftHey01XnY4UuP4mAOVcuIkfCCv
	LWk8Hnd8P5KErELFEiYSpNx+hwQ7Lyn8OjaSK5Gpf7iq5wh/U/R/OCFAFsprjsTHUZuhZr0ac5I
	pnSRc3gh1o2p/Bdxt/zl1tPPfgBQmkrwnWSd9/KRUSAEXjyBNYwj3taQEs0RKIixSvA3ioG+/5q
	bmAPWH2+3YD6GrC73nsKD37M/wCDIFaY/ng2G6yeK3uSbj2luuJso2+Gh0JlynEnJLl9qcOv+2Q
	K//tbwebyvcMYBlzgh6VHgCtpt/iAFlY/khhcE6FYdTHg5utUjzeC6zkuXvDd+MFAWB8/Zt7foA
	MCmUGR9VC7vwAS5+mLZT6o5QuCMfi8Fs=
X-Received: by 2002:a05:622a:1aa0:b0:537:6f12:69 with SMTP id d75a77b69052e-552a6240a81mr63071801cf.45.1794235971214;
        Mon, 09 Nov 2026 06:52:51 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ece95b508sm43946716d6.0.2026.11.09.06.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:52:50 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xQQjq-00000001RUr-0lev;
	Mon, 09 Nov 2026 10:52:50 -0400
Date: Mon, 9 Nov 2026 10:52:50 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: Pranjal Shrivastava <praan@google.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Daniel Mentz <danielmentz@google.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Logan Odell <loganodell@google.com>, iommu@lists.linux.dev,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/5] iommupt: Introduce IO page table shrinker
Message-ID: <20261109145250.GO663069@ziepe.ca>
References: <20261001230219.818128-1-praan@google.com>
 <20261002150844.GC3481470@ziepe.ca>
 <asMuigioXmHZmjO2@google.com>
 <avG97sxE2NFZFtvE@google.com>
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
In-Reply-To: <avG97sxE2NFZFtvE@google.com>

On Mon, Nov 09, 2026 at 12:34:54PM +0000, Mostafa Saleh wrote:

> I believe there is a value in supporting other users beyond IOMMUFD/VFIO
> (eg. DMA domains) or even outside of iommupt, I haven't investigated this,
> but it's worth looking into either integrating the "iommupt clean(gap)"
> idea in the IOVA allocator or more generally rely on refcounting +
> shrinker (or other method).

The main point is to avoid the refcounting because that is going to be a
perf negative for everyone..

I think most people should be able to do a clean call, and if it is
routed as a generic domain function that would be fine too

Jason
