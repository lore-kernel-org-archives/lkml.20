Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793260223;
	b=yrMvH/hFdLeMLGpWZxHAQvxQtj44snkTf1iMQicKHqy7pVYEsBDVY1rVYCNZ8iYfNo6E
	 mlKc9kus3zHrLhlt6+zecVerFivNO7YSd3wgeNn0P7c+zcEkPzNhKdMKjHFMSicfMs7u6
	 9zKvFQQO8vWw6T/ovAOB6+NUoDjwn28DPdU+JtUAzn5gJT//9Y8AP6j2H9R7BOQEmThyF
	 ZW3bN65Xeb4qRu6J3a0qVe0UhBV7jlvnwdsWJBG9/oztbvd0X1J/44INKRRMy0Jl6rpHY
	 jEfV/4ZFBaY9aPkTaQPrmWjEEGshzWxI8h7nWnUIJjTu6whbs0cko1XldmH+L1LOSQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793260223;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=MV4ytUjkkUv8kGNfsO80EzlV4FKpsKt0v9OLD73l06w=;
	b=5HXGhJ+BTLVjYm0WcSqZD0tC7cY47eG4xMtOSZ0P8dHiDXBe5pBfKlYIzqYognxuFk/A
	 gTtAQ8yesvRDbhri2DY4tKNbSPNxT6uMOpo4/V7NoPHfYmnaWjqctZnNLZU+RfQU/etP0
	 ILLzzXQsxUk4FlWTztvf7RWfBd0DIVPTxemkzzsry2ICS0eNvfbTtaBBiRsHLLGeXjyUD
	 xgqtN5SaaO3pmj4g9BBPYGQezaRL0hbDN5r3X2L0O5c7BFSGyo9KESE/IEUgUdFIBNt8y
	 CTWpJi3xYHE5xviyVzmW+KKpntunxShkCAhZqrwGwq0iavr1b0K7tUswOXgoZKK5BYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b="ywY/1UxZ";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A00E606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ywY/1UxZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF45D1F031E0;
	Thu, 29 Oct 2026 07:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793260222;
	bh=MV4ytUjkkUv8kGNfsO80EzlV4FKpsKt0v9OLD73l06w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ywY/1UxZ1aWD7wkfTUYfqOTPn8ouDyPikF8GbfMYtO+iZa4EBkkSuCL0cloborX4K
	 3JpIZWobFGX4dj00UT2r3F0vxt8sKDoV+vna4CgcwrlZRqNDiaXJbmcwEy+z8opHg+
	 +zBa5GogV/n3GfSi/eYUagc1VDZss2ZMYD+39TZs=
Date: Thu, 29 Oct 2026 08:50:19 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: =?utf-8?B?5r2Y54Wc5p2t?= <panyuhang@hdu.edu.cn>
Cc: zack.rusin@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	security@kernel.org
Subject: Re: 0001-drm-vmwgfx-unpin-BOs-without-revalidating-placement
Message-ID: <2026102910-prodigal-fraternal-0b7b@gregkh>
References: <AKoAagBcLENWUVxRNA4*KqoJ.1.1793259618800.Hmail.242270054@hdu.edu.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AKoAagBcLENWUVxRNA4*KqoJ.1.1793259618800.Hmail.242270054@hdu.edu.cn>

On Thu, Oct 29, 2026 at 03:40:18PM +0800, 潘煜杭 wrote:
> Hello,
> 
> Thank you for the review and for pointing out the kernel-version,
> patch-format, and maintainer-CC issues.

All of this was rejected by the public lists due to html in your message
:(

Please just send a normal patch, as documented, and it can be handled
that way.  And as it's public, no need to get security@k.o involved.

thanks,

greg k-h
