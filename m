Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792563344;
	b=yH7v+PFeYPRtMssMTFyNOD2zDxahYhmdhCZfaOJQAL6+cYNE7A//+gAJ28FFrBcLMyqR
	 l21ueO06YS78aIeoMJiHDungPJdE9z7x09rawt13AGTXyI1VGKPaH945weeTFWeAiQGCt
	 CpHfIlu1loa2Eio5HWc6cW0bXSS/MHL7QZW1eywWJA+5NrfyxLapQJhkebduJ1AEXP5Lh
	 XgaSlTdGj2C4t1+V5bk2GTpO7EV3+MFz+vDeoyVcXXalJS43SXWO9eMoWM3l6BZqKlz24
	 OYUVmYYbJJpQY9+WQmTs6ibJJgeIEMYDq2b4GhX3sjMQOr93F/NFrdVPqhVFXtYnJWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792563344;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=fB0b8NJZoMpWF8abgjJlyikhaeYEgHqEJZNWJDbK+sw=;
	b=2oy514ov8be6iVhzmteyUnFcldl4XWYt+2NeJlc5c/TXDOoJcfU6pEHju6JmyyGqskP7
	 4yTPnoAuPFy8HrzJhgmO80X9eS3aFtKeDSpBRedPa9BILGEmcBU8/lkm+9EZrSSSBz5V8
	 TZENWk4E7zs2WPWvKlHLVZ/iEBOjg9n0QGcAGt7G7cxknDzbGvs/3IB7dMuA34CzKAdeb
	 KZuLdlkpwuR+9brStaCnEixUnJzmosGzxwndS0eleskyV6QFaoy2/t//2vsV257IZJO0s
	 IEBs6c+Sqvz2unqBf+6bWMDZjkO3aoa4EtJnKMFbxl/fPMb6go8BEa47RE22ecsoGUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=PUfPtUQ8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AACC606A319;
	Wed, 21 Oct 2026 06:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=PUfPtUQ8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A5C21F000C9;
	Wed, 21 Oct 2026 06:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792563343;
	bh=fB0b8NJZoMpWF8abgjJlyikhaeYEgHqEJZNWJDbK+sw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PUfPtUQ8FbvPZ9syPju5obBpBQQ6xaRz0GiGciwNRR4V06DTYzzGyz1ocHeVJvJbH
	 8ZTnWTQzA5ZtF+IKeGtHyRxMqZYjRnibRUcrrJanElnBswcQSbLDDQ28xevf9I7INc
	 Kfdx5+zmSPydCXgH7ZWPlSPIJ+42vPKCL2GCCzik=
Date: Wed, 21 Oct 2026 08:15:40 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: LiuJunyuan <2058432396@qq.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vme_user: use scnprintf in tsi148_alloc_resource
Message-ID: <2026102114-overstock-omnivore-d5b3@gregkh>
References: <tencent_F5EEA06B3CD49F9EFF5C185259BF4134DA0A@qq.com>
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
In-Reply-To: <tencent_F5EEA06B3CD49F9EFF5C185259BF4134DA0A@qq.com>

On Wed, Oct 21, 2026 at 11:13:49AM +0800, LiuJunyuan wrote:
> Replace sprintf() with scnprintf() when formatting the resource name.

Why?  That's a requirement for your changelog text.

thanks,

greg k-h
