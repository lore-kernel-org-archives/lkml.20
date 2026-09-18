Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EF54FE2C9
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 15:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789744403; cv=none; b=pyF1Mrh2am9gnVRqT7fgr+7PRUK/T9se60oiTX0Mp7blGnQPaemtDThZx57b705xvwM5QDfKWTgX8+iMae2bSRXzExXj8z4TwzmX0Ix4hwf1FV9WrbqYwzdHvyerZOqDN4wN9+UFusPN8SR61aZG0cDR0DAFNFxL4sC5bUi63Tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789744403; c=relaxed/simple;
	bh=jphqnC0BJPFoukGwzn5oIBT+VOOEUPId25SrqKFAyq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D9QU5IfqwnGLOivPU2+XXiybdqYlT9O8gBR12Bz5T+N/lKBt2QQIh8bktqxBl+lgrd2dfUBQodEACq1ovYwjYOfiVB8KwHdKcU9zUnQVuCsIhqzAfilOY1nE4LGcYPRUQoYnjsjcpb5jeEHcjMR6EcE+vHTymSOK8FY2h5g0rPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=miVzFX9i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="miVzFX9i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D36E1F000FF;
	Fri, 18 Sep 2026 15:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789744401;
	bh=vWbnyU0SIgiw4rSTlOVLNiUE31FvcrcAMlwh1SgQDVU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=miVzFX9igZ3PVWhA03s9dixOyKMPS4l18Vo4R3UZHusUIIo5y72rf7ft8SXbvbra0
	 5H1oR4Ae9sXBOHiavSgXlY5Q3lGSQWC22Ypm/wERkDEhpz4M/53jSw5I8cO2MuCukJ
	 zXOrNcmM63/vDw3ty7ZfiX75v0lh5KgF8Tt7YS1RqcWvg9Uuk1Z2bBvSyjkk39KuDv
	 vEV/FUpUPgojJKQvYqw4JOTmTDrXwVhD1NDwPT2077zT1Z0fibKdz+RNjECMEc9ZTI
	 VGwQ6MBFc9L7eBpf/FDWvo5Bg2rOub6CgPMnrMr0zdcUv6GMp07VUYzJm7TGEiubuX
	 vfBUfzFJFaKKw==
Date: Fri, 18 Sep 2026 09:13:17 -0600
From: Keith Busch <kbusch@kernel.org>
To: Daehyeon Ko <4ncienth@gmail.com>
Cc: axboe@kernel.dk, hch@lst.de, sagi@grimberg.me,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvme-multipath: fix underflow in ANA log bounds checks
Message-ID: <aq1VDfSe-YJU73Nh@kbusch-mbp>
References: <20260915021956.3142320-1-4ncienth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915021956.3142320-1-4ncienth@gmail.com>

On Tue, Sep 15, 2026 at 11:19:56AM +0900, Daehyeon Ko wrote:
> The number of ANA groups advertised through Identify Controller sizes the
> ANA log buffer. The ANA log header and group descriptors independently
> supply the number of groups and namespace IDs to parse.
> 
> Both bounds checks subtract an untrusted object size from ana_log_size
> before comparing the current offset. If the object is larger than the
> buffer, the size_t subtraction underflows and lets the parser read beyond
> ana_log_buf.
> 
> Check the current offset before the first subtraction and compare each
> object size with the remaining buffer instead. This rejects inconsistent
> ANA data before dereferencing a truncated group descriptor or walking an
> oversized namespace ID array.

Thanks, applied to nvme-7.3.
