Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793126062;
	b=hmmasQduL1QXVIIwwyNVMJCUTQoXXufQVR1JLBIQAQvP0qiQML698mC/+82FCmJ/YyY7
	 7MVqhSdk1idumq3ODC0KMb5+mdNycpp3ng9V1ePw7D3ktw0gm3uQ4mxEOskNp3ysPtgSU
	 oNijPS3RJYvyEC4tf45bQcNd9Zp2XJbpGptM0cW7WeZ8ZUpf1AktQzBScnHK74M08/b4t
	 q7NCndL40siA0RX4ZWE8jqbpzdCn5Sp+yDAznxRjg+FVqdlBF5oyxT2XVDT/Y1CwfXRNB
	 c+ec39erBeMsNniaE7FBz4Jn8BZdtEvaa28cPDi7evY+b3/JTah5XEe1k2nMYcOLhag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793126062;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=BcXyn5Pt3Ud5pWl9ffP7/JMMW96ISxtzbbqlGIIDb20=;
	b=XzQSE/mgc0hoXhvy9LnjH5gDORBIkUTPsoNGKYY2Ji365+VfBBm+DxMNrPjk0wMMZVJA
	 wtnt/hneo321aocaPcl8jMqrth2Iplp9vn/OfyV3+CyCmPXxoLADvey3BEjd5fNuTp9CT
	 XXULThtreyZb8QNb3ZtF+S8XhOh7YeNlyTEAHZoCnhzhkkC0mnY2Im4TKd0jiuhmquKsA
	 hl09QpY/9MafSpnXqewmlkEjoCSVsbzZ1j9RNbZZfovT+6j82nBgnvB3H/Pc3p9VQNe6H
	 DgR8JaIEV6//AQYlaZncI/xr0a7Mp7wxoD4fcS3ToM8oR+VHbUUvvTU50ogWfEBHVfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=nmgeP0Sd;
	arc=none smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36F9606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 18:34:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A36F9606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=nmgeP0Sd
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-53644ab1f7bso2393591cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793126060; x=1793730860; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BcXyn5Pt3Ud5pWl9ffP7/JMMW96ISxtzbbqlGIIDb20=;
        b=nmgeP0SdWfa2tzbuqRiyYonKuXW0nk59qgp/qUPB6taLSZg8kWKK9At6O2Ajgmb2YC
         lbLxDvJC0SIP3e/877Va0sLwnAIob1QYjqCI2C6BskQWwZaYT9QFpUmyF/PAOg79QBxa
         BgpM0eh/MvHQfaR/MV8LfX4qyFtxm02fUmeK+3culcJ6RAaAhZD85utDK3rgmst9J1nq
         GmMsomXLYHk4WY/N/+1acL7TT0cruXiXjV4yvffzOLHTKqdBYumYz5p3M5BFv564m37D
         l9ayGnZcZkyCtgJ0zi8QhEkOALXxQsYIb2ifQ4B8ZCXTvhuMgj2feIVj8nsgLH2M4M6j
         2pyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793126060; x=1793730860;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BcXyn5Pt3Ud5pWl9ffP7/JMMW96ISxtzbbqlGIIDb20=;
        b=nHI9XqdAjGF7ejNK/2toi7QKEAEWdv4Ku/aEY6nP7b7H0ktckH3o2xxamSCEbPbGU4
         97oUITm8NcBuIkjX/QQueqgG+9Ch0KPfgsQYrSd3bGPHLj2b0fu/44JaoUFXiph8TZj+
         NPiFmMFV+YbDoOy0ydm6zCzcICevomB1ith0saVSn0GNloIiwxwJ8wZtr3AfKFjMbqCH
         zceWsdQKCaOj++96d2/Vjq/aK7rPwQBfQz1B+dl6aNGwsTyXjctPvz3SvV+bwcIUcqIb
         RW9yQJN/8dalRmWC9wfH3TbRqEkMDNGV9YpG6nPju8TgGXMPwYygq4D+oswcgyKmUmWv
         aN7Q==
X-Forwarded-Encrypted: i=1; AKwUvBxHlj+UERHG8Dq/a/r7Ylr0x0H2cPz+D43ImQlO6snxdf6fbrExAKzVEvr4jQKJXglnoUe1MYXJKNLCQPg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIy1V1qJZfTVrlzM9ndl/w43q72z5Aw4mMRBtISOkJtCClVBhou
	RJ+M41pZZIdYvTcgd8Yo18Ym8F4f3Ou4LHBTASMuDovVTwI/2Eo7iFXNZ1XA2OMsU8HKZVPb3qI
	TQ8Pp
X-Gm-Gg: AYBFou3DFQfAFBx0k8DBW77+CqzPhmKUWGcVBV05bsBWRA7bTjF8HxvZvAUz4XirqH/
	48BNMiWoR/Avf0MD85sDcpwG7jM4kmnS9+dSnfaMcVJaT8miwBLCW4WPKznkeyQBDEwNE851ogY
	TsQ1kdFuWAkbRPRjItgeD1dsOceICVqFZNfjzeXnz0JvtjwB0DFowOXG1rDXoMyNc38eJAje9YL
	wCdYbnOgY6+bxcFEGxt1TLSD0H2eaTIjfG98gW3DXoAvWwr54mqaBjZ8fkUoA75q0KKYy/rqDqP
	78NEzHoP1YJUiGUTd5qq+q1f8a1KiwgtmyHBIv6y/C4gjRVC5XrKPJyelzTo4/6gaPJG81+cPtG
	137VJuUg2pO2M2nI7KiESzsdZn5qB0BZNIy/OrYq3WHxxaZyqIdpRJFe98g+6xqa+dcgCHll9DC
	tYd6tCL3BwRpBlcMX5vZeKtYXKctVipaN7yk+xbcL/eTUz2TlYHYfC4hubPZpeZeBXkVg2ushqm
	rOOm7K6s3Z1yJuS91J1Ga3kK2jr4A9MBNifzzKKYGTaYLhJgJGuB109rQGGAeK0n7FJHh1p8tbB
	u4KaZ+OIHHU3ybT8ACoIkY9Q/bDVlMUZdO66sg==
X-Received: by 2002:a05:622a:4d07:b0:536:458d:525e with SMTP id d75a77b69052e-53fcc5c17c1mr1974831cf.37.1793126060344;
        Tue, 27 Oct 2026 11:34:20 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-538394c518csm84854701cf.8.2026.10.27.11.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 11:34:19 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xLm02-0000000AgqP-3BXi;
	Tue, 27 Oct 2026 15:34:18 -0300
Date: Tue, 27 Oct 2026 15:34:18 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Guanghui Feng <guanghuifeng@linux.alibaba.com>
Cc: alex@shazbot.org, iommu@lists.linux.dev, joro@8bytes.org,
	kevin.tian@intel.com, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, robin.murphy@arm.com, will@kernel.org
Subject: Re: [PATCH v4 2/2] iommufd: Add IOMMU_GET_PCI_MMIO_WINDOWS ioctl
Message-ID: <20261027183418.GJ1685504@ziepe.ca>
References: <20261022193359.GF3381610@ziepe.ca>
 <20261025133000.205508-1-guanghuifeng@linux.alibaba.com>
 <20261025133000.205508-3-guanghuifeng@linux.alibaba.com>
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
In-Reply-To: <20261025133000.205508-3-guanghuifeng@linux.alibaba.com>

On Sun, Oct 25, 2026 at 09:30:00PM +0800, Guanghui Feng wrote:
> +
> +/**
> + * struct iommu_pci_mmio_window - a PCI host bridge MMIO window
> + * @start: First PCI bus address of the window
> + * @last: Inclusive last PCI bus address of the window
> + *
> + * A memory window claimed by the PCI host bridge that a device sits
> + * behind.  These are PCI bus addresses (what appears in the TLP).
> + * A PCIe switch could misinterpret DMA to these addresses as
> + * peer-to-peer traffic and route it to the wrong device.
> + */
> +struct iommu_pci_mmio_window {
> +	__aligned_u64 start;
> +	__aligned_u64 last;
> +};

We already have struct iommu_iova_range, don't need another one.

> +
> +/**
> + * struct iommu_pci_mmio_windows - ioctl(IOMMU_GET_PCI_MMIO_WINDOWS)
> + * @size: sizeof(struct iommu_pci_mmio_windows)
> + * @flags: Must be 0
> + * @dev_id: The device bound to iommufd to query
> + * @num_windows: Input/output number of MMIO windows
> + * @out_windows: Pointer to the output array of struct iommu_pci_mmio_window
> + *
> + * Query the memory windows of the PCI host bridge that @dev_id sits
> + * behind.  This is advisory: the kernel does not reserve these ranges,
> + * it only reports them so userspace can choose to keep its IOVA
> + * allocations away from them and avoid accidental peer-to-peer DMA
> + * routing.  The reported windows are pessimistic (the whole host bridge
> + * window, not the precise BAR ranges that may actually conflict).
> + *
> + * Windows are reported in host bridge resource list order.  They are
> + * typically non-overlapping (host bridge address decoders are exclusive)
> + * but no sorting guarantee is made.  Userspace should treat them as a
> + * set and compute the union if needed.
> + *
> + * If an IOAS has devices behind multiple host bridges, query each device
> + * and take the union of the results.
> + *
> + * On input num_windows is the length of the out_windows array.  On
> + * output it is the total number of windows.  The ioctl will return
> + * -EMSGSIZE and set num_windows to the required value if num_windows is
> + * too small.  In this case the caller should allocate a larger output
> + * array and re-issue the ioctl.
> + *
> + * Return: 0 on success, -EOPNOTSUPP if @dev_id is not a PCI device,
> + * -ENOENT if @dev_id is invalid, -EMSGSIZE if the output array is too
> + * small.
> + */
> +struct iommu_pci_mmio_windows {
> +	__u32 size;
> +	__u32 flags;
> +	__u32 dev_id;
> +	__u32 num_windows;
> +	__aligned_u64 out_windows;
> +};
> +#define IOMMU_GET_PCI_MMIO_WINDOWS \
> +	_IO(IOMMUFD_TYPE, IOMMUFD_CMD_GET_PCI_MMIO_WINDOWS)
>  #endif

I wonder if this should have the word PCI in it..

Maybe this is 'recommended reserved regions' or something?

This is also lacking a way to send the ranges back in so they create a
restriction for the allocator.

Jason

