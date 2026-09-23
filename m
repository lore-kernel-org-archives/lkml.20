Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24405383DC
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790179119; cv=none; b=VHYZ+SXZVSGQWqXB0JKWIAt7K6MTb+5kR4RKdt5EamW/EhJywjA0aLUJgiN9pBqXS7NAb/YS8r0EIRsybXtoi+bnXWuUS7dLzyD6quaCkJgPKewhuJQlN4YR4L6Oxkhty1klwsWZPPmSF+iBZFcIfpzuBcV+JtxgLJvlGWNWXCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790179119; c=relaxed/simple;
	bh=0PfK8JMSkVzFLf8e2q/WRG4SF7QVJLAT8oXdBZ/vtT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dhnUm6ILKbvD2Vb2yVg3vSkPd6pdHIBpTOLv/73wWHummXJ8VLJl9cfIbT+Z5VwXmQ2HB7PP/dYb55/rqt6SnNxB6kmkA4i6NUTLtDaXUSBJhZkdJ6dgaMHWnro0jpDN0MgdTR/8OzWMwQd9zCflNf1cct33O2dO2arJJs7zH0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=DI2rGQ2U; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="DI2rGQ2U"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d43f9b120so16008037b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1790179116; x=1790783916; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W3dgsIcDJ8p5ZJDPUatobQL/ESNNZ/DHoKBc/ZFp4ms=;
        b=DI2rGQ2UB/3fWM8C6wvqKa4w1NaPNmRg8pGkmXpQLwBh58KUE//gW/+2PqlpqM7yd2
         OnYtlFD1hZNqXWu1+dP3ijX9ZVrnUkal334n6bJzWldheHhX2KvMki8E7ZxY16yrANc2
         1vYhrB+3716Rtzd8yjuhO3uaMIIvbGU4L2yztXXWJUkbeQxjihzr6S7xcMluC0oE4y7K
         g/rzDveRQ8JMo4ZJOTGG16xOPac6E2yx6nqhbR/80CJ9AeSgHBrDpImlrxj3avH/LUsh
         zpz7pbJetsTX/VEKBO1cfUi84dxfQrAJBKkBIxpmx29WrPeokSoYNEEFWlPQwHV4PpUG
         d6Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790179116; x=1790783916;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W3dgsIcDJ8p5ZJDPUatobQL/ESNNZ/DHoKBc/ZFp4ms=;
        b=QAiRPLWBVSw4iIcclRi+K2QMU4fVEWSHk63dGgz4KvRkUEzxtDCimGrb0tNMoS6JUj
         yoJspRm6pQJqibAuZ5BKawh57fPjrckGpPQsdWklq+JImbou5FUouGzlgiGH6WBlmsFB
         RCrxJWRiT31/KofSWMk68c5IvL472z9QukHMWGdcayB4L0FSoMlOuK7dSZzv9ZC0J3D4
         tqvM6NOeuFzvP3n+uWIDARBNtnMn88F/0LUUm90WwluCJPmkSQ9tadwh7u9CrLK9OVQK
         5B2nYbwNxXDbGvIA/JJoZvtsP0Clc6FJFHe7pNd0raPbtBbbuUMopckADzWnLBYtg8z6
         Viyw==
X-Forwarded-Encrypted: i=1; AKwUvBwvCQ/pZn+Fw2MuwAyglfN6NY0Fv1ZP9PAP2RQbejvuz99xMgNT/M1x5D6fYsqiOadbr13Fjd+U4Vuql/Q=@vger.kernel.org
X-Gm-Message-State: AFuF++mPUXPFgEDPI5dkoSFYrRXqThMhmsWiYrKOujH5DRomwMuA0z8j
	QvOKs6rU9zS3diHDzaFwqDhLJhREINNFJWYRIWtmYv7b9SbMUyoXehnf5uQOptUun8U=
X-Gm-Gg: AYBFou2y3ucJ5WjhDtnvRkIfgQLTx/AwMbwGIgFcC8vYjlIjaVXWWWHtBruG8urTkjb
	1ibjWG68W5k7Yh/tEytQ3SKcT65xpD2U/NLsqfGsAk5kcDGePxr/h/T26iVYODkveOcWTBTO5Im
	rM/LjMvKrJT1roxTrCU439BqSMGZ5rNrIqMrHLVVfiSJBfA0UWbIidTmOG2WZ8/etLR3eYhhu9Q
	Ys5T2bEOWM3FiSf0IDL5KKXO7VE6cTxVznOapOK47jWy91uzM1vV/9fdIl6QgK+FQ2T+O+1maZv
	ysq47ctNwMyfCQfQPj+QAceg0CFo1+/uXuMOkbrguCITCFg6oDR1Fyz1C0gVhz6/VQdzRuQ/I9I
	8TUU2uOzBJVjKTnjuJnZqHARqOZYdS3xNm51ChftQak44oKteOvJCUGkMhdECxppKHIs+UzmTqS
	XrQjaExIo3XRxbsRNdCfwBp9R4mEisIO2Ho85q+WgEFWi5
X-Received: by 2002:a05:690c:f07:b0:89a:63da:fa90 with SMTP id 00721157ae682-8a45bb7ceb7mr18084857b3.75.1790179116666;
        Wed, 23 Sep 2026 08:58:36 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a4658c72f3sm11900977b3.17.2026.09.23.08.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:58:36 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x9PMg-0000000DwaY-36Ny;
	Wed, 23 Sep 2026 12:58:34 -0300
Date: Wed, 23 Sep 2026 12:58:34 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-coco@lists.linux.dev,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v6 0/9] coco: guest: Enforce host page-size alignment for
 shared buffers
Message-ID: <20260923155834.GK1540250@ziepe.ca>
References: <20260904103452.1197239-1-aneesh.kumar@kernel.org>
 <aq1sT2EDsGaomqST@arm.com>
 <20260918165754.GG11599@ziepe.ca>
 <yq5ao6do36jk.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5ao6do36jk.fsf@kernel.org>

On Wed, Sep 23, 2026 at 10:31:19AM +0530, Aneesh Kumar K.V wrote:
> Jason Gunthorpe <jgg@ziepe.ca> writes:
> 
> > On Fri, Sep 18, 2026 at 05:52:31PM +0100, Catalin Marinas wrote:
> >
> >> TBH, I'm tempted not to support this configuration at all, just fail
> >> gracefully if the realm page size doesn't match the host's. However, if
> >> that's a real world configuration, 
> >
> > realm != host is going to be fairly common.
> >
> > host > realm is probably not that common, I would guess.
> 
> Wouldn't it be more common to run a distro with a 4K page size as the
> guest on a custom hypervisor with a 4K or larger page size?

Maybe someday, but right now I think the 4k hyp is going to be common
and people who really reach for 16/64k are going to need to run !4k
guests too.

Jason
