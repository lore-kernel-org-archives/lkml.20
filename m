Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794850961;
	b=OGnmVuaKiUt8K4sQ2pthyaNhNeRoGXUL1h4NYIwUmbtnfg3lBDo4rBlGhnihH7ClWdVp
	 CsRtjsdeCm0VdCoSuH5UoMXqu5K/hWHq3qfcX6Ev8TnsAADFF+fmDbW0cKZOcFOEIAc23
	 ntU652UJyait0xDWEnVsjQ4gkFoKay8lyrQSwAn7FcQVPQliJZ1y/jnFabVZu0/p3xssH
	 K47aKSih30HElCNBU8yn/HxkgqqZxcDkw493Zkq3XZuiqoK+mPbhWIPQrLhd55FmABVGY
	 C870VMDrg/eZJy59ygPjswyR5eyYipMuk3BxSr5A+3ipP63hxeeox6tbXraUukf7MIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794850961;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=VLeTN5f3dNjgq7/DFz77VAQIKydYxJnpCGV8qATJCLU=;
	b=TkYgv6HI9rFTJhNx0LoRbWK05J5uik7t5oQcBlrvGF6/u953GC2K9RinydGl+rIAHDMN
	 9eMEbv+VI9Sktq6gWIwATq30xbzdE21uPz6AbwNwZeayTRbSFPvlxou++19CktPa1kgMJ
	 pqcItFGz0DyRAp/iQ/3tmA34AbFvruuOfLRXXNzPxPGeXadtkFpVAnsUaIZrHjQ7l9lqH
	 bqjjck8kxMr+bPhjMoLdeZQvEUgKNlm1adbWwj5bHrp9dlkaDgeUURMpqydn0A8MeCdG5
	 A59Up5EGJyWQE56s0c19b9ZN1nnqnRQI0Prl4zclQGBX7GQRFWr/nl8fxcSnMoB8RFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b="k7Z4B/rJ";
	arc=none smtp.remote-ip=209.85.219.53
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4560F606A331
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:42:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4560F606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=k7Z4B/rJ
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-91c1f548f87so69584216d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794850960; x=1795455760; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VLeTN5f3dNjgq7/DFz77VAQIKydYxJnpCGV8qATJCLU=;
        b=k7Z4B/rJV4BYSUn5DoRoCZy1plPwC9x9ovWb+QgIDH90LhQdOFFxPVKW8y+1D9G9U1
         dNY8XVweGaarB2H+Mo7+Ljohv4m7UtEMEOmREkcVV7D8kB073e4yluVQ3yHRLhBQRnee
         4TqEgTAlDtU1ys9YubCtkkzdgVNxjSb/z0ZOeeMy+Dto3b55aymi8viQ9OFG1sW0DGih
         8D6jlFgrgUETHCS5Y/tuPfdN2LnKjoAPDH5mWH9pRi7ZNxryEEPrCdvQ8e7Jdo25dOiS
         e4eE2v/9+zfQbQDE11ZD8kbUMaw71HaObIFAeMHeeeBCI/kUSTVNlSkktEgKUO5axUxy
         0psQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794850960; x=1795455760;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VLeTN5f3dNjgq7/DFz77VAQIKydYxJnpCGV8qATJCLU=;
        b=i4kvtOY5RBo3xmZQaaQ+DzKlkZX7d1v+RwvgvHPLen/jsFzGsx0BrjF1v9owoyOJSC
         n7Zu5zk52ydzSBZ07c4+Yj+kqi9WlhDV5Msjk/FEvBx1x6/v85IbwZEZI+B9vBqwAZY/
         vxqRK0IRu8AFAkczOnt6WUBiflyvH1HMbqYA6VbysnX+P7tgfqnypf9gLh9dsIRmda9U
         lqB300agQ5HGM8H+jlvOTYPssTBxphUqiO26QTtO68c4QH92fB+PrvYGFsiqY4H47ARo
         22/wgsUduF8+6PDXwzgQ+Y37DeWfnYd9Ai5Ad7/S9hUWhBO3W+wEUMUJcOtDT1R+tJQW
         Dpqw==
X-Forwarded-Encrypted: i=1; AL+hErFwXLksrmBOlepYU7pynqUm0BbJqBMVnqzwOHjCq0YPJNA8ZhOQNW18VBrV6svY3e6YOhOouTV9Ciqtfac=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GxV/YXxgJJjrti4X0nSgQFUhDIhP9hAJylIAlZ/Kv1sxTxJH/
	ptLLqHa5RJCYjG3LaTIVPeNJtMWfCvCSGm3fCt64eEgEPlaaxCHwkNFdEWm/gRQNme4=
X-Gm-Gg: AZFdTZdat2vup9+SmBsqri8NZPfE7wUFpeCdu5rS9xYkMYAeWafL+jkM3Zs0kgNQmTw
	Gv7mJ8Mg6z5CHEMh76o4jVEgvgiMq3aTfcYBmF5311jAhKs/uO8LJ08+ashlFXiSqQude8i+wN2
	YzF5x+oiPwGr2ByncozZeYClyPfdNzxl+7p5Ssb7viLvzgziwNx2g9y7JmnWtkM4g01ZGvi/2NK
	N3OGLHOjJaxJLktXJWuYmZXc6iWsD/5Nu9sKwCs+46nzCHjpJICU2NQfJ26kijwlE6lDLMyESJY
	Xcm6+pIr1gmSV9/hbnqhMCAIVNSFlzH+xTjfqgNepDF4M+xhgD9DgvYxJiDSqaK3aKQPnTXJtjV
	hxTJCPobh3Tij5t4dbO4LVEBT9nXs0F25gUlLu4Jh98/VrnT5vrJtLNiMlBNflU2idJu/zvX1qx
	HpIaT+0xU6KHpgPjaBohtlPISZ+yvMLzmbEQ5u1DGcZGd1bY/X09sl989W7/NCw41DiBXRVe+DM
	CLdkVdDavCvPmGVLLuqggG3zB18Lt0dFl6Blq3vVScdFMRaFKNqRG2oXyHMJiMt2s5b3g/a+sbm
	bjY4Zw==
X-Received: by 2002:a05:6214:4698:b0:91f:1004:2ba4 with SMTP id 6a1803df08f44-91f2400b38fmr177678706d6.2.1794850960144;
        Mon, 16 Nov 2026 09:42:40 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d73206sm91150276d6.25.2026.11.16.09.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:42:39 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xT0j0-0000000A2D3-2QWe;
	Mon, 16 Nov 2026 13:42:38 -0400
Date: Mon, 16 Nov 2026 13:42:38 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Mostafa Saleh <smostafa@google.com>,
	Daniel Mentz <danielmentz@google.com>,
	Juan Yescas <jyescas@google.com>, kernel-team@android.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH] iommu: Add iommu.passthrough_devs early command line
 parameter
Message-ID: <20261116174238.GC2299285@ziepe.ca>
References: <20261116-b4-iommu-passthrough-devs-v1-1-dc5b493f7551@linaro.org>
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
In-Reply-To: <20261116-b4-iommu-passthrough-devs-v1-1-dc5b493f7551@linaro.org>

On Mon, Nov 16, 2026 at 05:37:45PM +0000, Peter Griffin wrote:

> Instead, I propose handling this in the generic IOMMU core via a
> kernel command-line parameter. This makes it available uniformly
> across both Device Tree and ACPI systems and across all IOMMU drivers.

Something like this could be useful, but also Leon's series will allow
userspace to do it from the initrd too. IDK if that is more/less
interesting to Android.

>  static unsigned int iommu_def_domain_type __read_mostly;
>  static bool iommu_dma_strict __read_mostly = IS_ENABLED(CONFIG_IOMMU_DEFAULT_DMA_STRICT);
>  static u32 iommu_cmd_line __read_mostly;
> +static char iommu_passthrough_devs[IOMMU_PASSTHROUGH_DEVS_MAX_LEN] __read_mostly;

We can allocate memory at this point.. No need for a fixed array.

Jason
