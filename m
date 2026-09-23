Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E363650C2B3
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790166083; cv=none; b=NNz74gOCgOZRTBj79Km7HhjhuYqABpDzuyUfjJpbPp8iR+wQTcxdHBqqsx/EQg+s682RmS3DEG/TvG2sUJUPH+7N3H6Bb3JWab1HTZwIgoUvPjOLvkzhxbIgmrUYpvfeellAFW4HbwPcjVB0+S0OIIo1D6dYV0feosYxwrpOSaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790166083; c=relaxed/simple;
	bh=bQcH3jTKNmXdXEb+sr4yWEqfbt2vZeJTXfNoUGfU04M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tOm//WAaTwrXlCHnZ5PP616dsTjPmIr7PKvICkcGd1GRoCLSVuotA0QJxrZiUCD6Z6fv/u9ZaGAZ7Zp9mTMao62+CtkdOjayC++MwNZehs57r9KonJihhXKhgRnD6WivwfsuiSCiXy8ItLAZ31ZmAehJUZ6rWfPcQEKyaRWvvhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EkaYgAxk; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EkaYgAxk"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49e65a8f70eso35375e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790166079; x=1790770879; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6u3N2T6sQi1Z1c8x0CoJeove0ost1XCLW14esiat9kw=;
        b=EkaYgAxkeQdHQd1CTMQuzABNJz+94eu9vQwCPnRPUrHicwt3eNxO4Y1sF/OfhubCPI
         gp57HpYaObZwlLbR711K6RHjMk6zUOX68c2au93i7ofLuD4Q2J7gEX2C8XYeB30aSXJw
         utwrbpCqqeg9PDULgH+TqNUlfW3MU9j1+MKy96Sd+IGkq5hcn4JceI/K0eycLLfJf8t4
         b/6YfDeeSWFZ28Q5m27BLJX/9w7jdLvgJNxeBGjWn9kfK+0IKMxbDJijyIyX+gbOf6IJ
         H/caUDVXxjded7JRFCguSlFiF95DJnEInUjAJCaxlAXW2MTPGTBZuJkDAzeP1XjsFCOL
         FWEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790166079; x=1790770879;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6u3N2T6sQi1Z1c8x0CoJeove0ost1XCLW14esiat9kw=;
        b=Ucie9MsFgMb2jwx7pDoRQbtUNyuwopY80r8bhQPk959VZXJ9qQ9zhHNsPblOreAFdw
         qlZbE4cWpb+LHvGZJzuEugfZd/mP96MyzDdr5BYE2+rRTdh75PQnNWs1U+y8PhKne9Q2
         EIGuwUVi81y21jyRZn9KCRzDd6LpUKqOyxAwoRcQaYc8BPNl5oXWPlrZxsCkdGFybeFl
         233CNm7/cY0Upaw/ueLX1KHe8j8uBeERBasoZW8wG6X10SpPEmxlBSd9gJKhXtK5auz3
         CzL0Gc2V9hZQgUDIIQsbwyaL10QtX6XiXQHomazvE7haOcQ/zeuGNieFwEzY7EO8IfJV
         UNsg==
X-Forwarded-Encrypted: i=1; AKwUvBzOU9cCef0N76P1FHBcJSKhNj86+Qh15vqJLf8dPExHwsBNA5JlUDXxay29c0e0IIriB8LmtUCrBzMBnik=@vger.kernel.org
X-Gm-Message-State: AFuF++keGGaNEhL3n1Ao00ovb5FqfNOEuhan2U/4Ya7T66fbT6nn4zWz
	wkD7odW2Hzs08clb1HwzU8Qqa1HFp0eWs4hJk2MIPZpmAWcWfxnPId4lzlh4zfcAPQ==
X-Gm-Gg: AYBFou1pZex6pG89iltz9EMOMxb155H+GHFrElCMkbpl1aCNDzEUrOl7xCR1kEDz02t
	GI4yQ1d4EZsKYv26AFSr5LRtXi1EVG9V3mpMpt6OEiY2j3/abkf+bfJ7izQU15t//vunjBGSTCg
	FCd4oXznpvsXEvzzQ6pikaN4rzOM/VaWcBybwPZP7Y1oVMmW1/pDAFTZ0c/HQS+xOlrblv5Jg3u
	yudf4XBFIeVc4C9A0Ntl5kZQx+2J94OdGLnDbMYn7C49rWPy6xvUUUvrxFmbF+G/Zu5KqLX7F3b
	8Y8HorZsLaP1bH+pfmi05zb2TwCxfvq0FJOMiquqvxX4pNiWim5HOk44HEVy25qWj8ze6GGYxXS
	qD41RNVPhSHd+/OjFEeBLslZTf+F6fS8jVLCmRut4IONo8mazpdrMUfWnPiUHUoisrZLlEpaHnB
	5rvWb6BP4UZ4Gtto3UrC8CW5FW588LwZkSCiUj5g6ZQEQd+N5jPDVzokRpR/vqr3L+5u6/pKI+8
	KH34zwR3SLwj/vnW1+L0B7/zGbgBa64DsEsw81K
X-Received: by 2002:a05:600c:a415:b0:49e:65b0:7b7c with SMTP id 5b1f17b1804b1-49fe0c3692cmr754895e9.7.1790166078185;
        Wed, 23 Sep 2026 05:21:18 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1c159esm82068375e9.4.2026.09.23.05.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 05:21:16 -0700 (PDT)
Date: Wed, 23 Sep 2026 12:21:13 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, mark.rutland@arm.com,
	qperret@google.com, tabba@google.com, vdonnefort@google.com,
	sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v8 04/25] iommu/arm-smmu-v3: Move IDR parsing to common
 functions
Message-ID: <arPEOTzER6gberB5@google.com>
References: <20260922131259.2975334-1-smostafa@google.com>
 <20260922131259.2975334-5-smostafa@google.com>
 <arLa0E3xq5dGuPpd@nvidia.com>
 <20260922214818.GA2545495@nvidia.com>
 <arOmSxqRxhd717Xy@google.com>
 <20260923115501.GD2545495@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923115501.GD2545495@nvidia.com>

On Wed, Sep 23, 2026 at 08:55:01AM -0300, Jason Gunthorpe wrote:
> On Wed, Sep 23, 2026 at 10:13:31AM +0000, Mostafa Saleh wrote:
> > > If kvm doesn't want to dev_err log that's fine, we should able to
> > > #define that away too shouldn't we? And maybe it does want to log?
> > 
> > The hypervisor can not print to the kernel console, so dev_err()
> > will not compile, I'd rather keep that outside and let the caller
> > decide what is a probe failure and print it's own message that keeping
> > the code and stubbing dev_err().
> 
> I'd rather stub the dev_err than split it like this. Every driver
> should still do these checks, it doesn't entirely make sense to omit
> them from the pkvm flow.. No print, fine (and really, pkvm has no
> tracing, printing or anything?)

Tracing is supported, trace_printk() might be coming soon to upstream,
but console printing is not supported at the moment.

> 
> As a stube I'd do something like arm_smmu_err(smmu, "blah"); pkvm can
> do whatever with that.

That's ok by me, we can define those next to the struct typedefs for
each one.

Thanks,
Mostafa

> 
> Jason
