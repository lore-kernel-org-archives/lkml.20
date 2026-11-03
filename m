Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793668363;
	b=JvzfoMfQ/agV79UHyTPUKS6ytjNOz7h+18Cp6rGFJ+/wJoKWhEC7APb5Z+qZ3WRkKxn0
	 1pcbaHkHRfkv8Hh0hiZfne13vc0rtCNPAPetsZbtl4hsdACIrFcbk4T7/N6nKQecabig3
	 2iX0h/PlkiFquzlMmQemixjz8Jo2MDwobY/QN/Bsdd3xZIGIqV6quADnyWyprjqBD5kwq
	 ywKYgx6GI4iXz12mqujPNSzzhF9Nz0Bce5BzfDPW/x6yEeZjhptvF8GolDzE6V7oV6nhU
	 fBkbhm+TFOrEVuN4r1KIOj/98y2q1a7VkMYcbk/8G0Vyd+Di9VXpeYRZUHtnt4FvhWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793668363;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=eAMU6Rk2mC3IXoyZ+xiiwlzQCqVx9u1/gi5nvdpNwX8=;
	b=e/tAjBc4+3T9BvQ8Nrqn6cFUgHPCTXbAg/9o/8s0iebBeA0C2I3Xwl+jSHx4lZVfNm+p
	 39alqufzAOoKxXfS/CrPFhRAkpPROnvCpKGCc6Fmb45hdYOqyk7caH5cuCY/T0+kWdQ+G
	 DJZ4mEaby3fNBqwfPxWzyxHrEMwxbhOe+na5RwnSFXA8/14HP2IInJCTjbt4FOSksa7zg
	 nQ0CLdtIugAkS7tJc6eEkZrUto2wAk9M0Z9hGqVmNpFrKmkw8er0lZHfnIJi3hQBxtoPL
	 i2mBvm+6RWnFIpNRI/k8ehon6jtvoaHe3hE+i+lPsvo/8/tw+WxMxztBGsfaKoiA68Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=UqA1nNgC;
	arc=none smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F55F606A327
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 01:12:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F55F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=UqA1nNgC
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-535179e995bso43702731cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 17:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793668362; x=1794273162; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eAMU6Rk2mC3IXoyZ+xiiwlzQCqVx9u1/gi5nvdpNwX8=;
        b=UqA1nNgCUhinaPBpC2jF4UMrILEg97oExPjE9RSp7dISp6MJgj9Y3FY5coKBbeDrHS
         v7FRQvXv7tVLhFbJ+ocWJ9oMKWbkfEgYYPa8BtWcTlHcBLbrs7TTmfG37Kfu+M3T58sM
         SUKuM7XBwYucV1brwLglCKShNfZETtPm31oTDqTWTaL6x8KThARHpCiETAmf5pWXJsQM
         dyXfgK1kBZeh9kQHQYmc9S8VJiuoLR/6wyIN3IOggOSShjPm3tvHfjWKgkF8EOmen9sj
         7L0YjsZDtb7Ub48KeF1L5QEIMO5OI9I0DWREQyJI8ubzdlpKWG62+2bjf7FZjRCxueWP
         whEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793668362; x=1794273162;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eAMU6Rk2mC3IXoyZ+xiiwlzQCqVx9u1/gi5nvdpNwX8=;
        b=HDkfN7NGR5iSkCB+UfJXauw/Qz76kC8WPUjcCBIHwlaRwlzzbVusj3iC9uqtbSbot+
         JVzma7ZGFB488SWHXmvYocTw/ooLkoAuCCEedJJucs/Oxr1T+jae5HiYRq7KfM1pZ4AE
         lvZ03khhSWafBGUZa1UgKzkA8aTBIFW16rM9m/ox7V5MM81peaEjLyxAwTyt1ddfcuLs
         vfir/0/r/D35jj9sOUi77/asFqU2VdhEccUG22tzDJvcwAm1VG0mI+rwjDg3t3Ww7ra9
         fTgiPmPQ9mopn97MmCnR3WxF/QKTEh701q/spgQhKxQbzHk+/uPCmVRAr0FdE/SzDImv
         NeHg==
X-Forwarded-Encrypted: i=1; AKwUvBxaiLWOcGoK9WfkEs1YBcBSGF3LrdFd+n5dR+fUDFMEuAjlh6M6Q3H37FP1MnQblYeVc694Nf110w9jzmg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vein5jPZjXZ0VGNyUNGh3kecy4qJE2P5WdMm1E8H90esLvkC8
	galWcliNMXRTmwipg5uekrX+QBEJwGi2qC74CB5mAGaEkWdhqgvGsutv1Z/2HIW8wXo=
X-Gm-Gg: AYBFou1juD6OPwhhUerlsj0Cieh2diBjmsC7n3FMLMksPpHSkXXq+drg4x1x7YUcZhg
	edFUnkcRAnO58sg0RieB5wgZJu/AEuXR0p9gb+8206belVSNfmag/iYSXJJ+23+OM5mSlqN3h8b
	m5lzLx03xP/r7PElyMBPe60BTNqGOotqEoQLYPQ4iaLpEh52DPDhXsIWILWJt5SMYW6dEO/T6vk
	2qhBYpGOJZgSHQBZ4rS5PcutikaHys/K1tq0IGMkXeHO6jdYHg/AGsDdvoUTqSqjY/dBLv1ETXL
	X/FFdh+GXbjdWIwWiB41Yp9BhC6mAokv8sHpYHQietxa8oGG3JS5rHTnPTKzdxHrrh9ZxqAFs0i
	OGlRQk9YIosYhP6uyL44w1qTcEUC79fj/mPq2Gr2I2NOB47VhBbI/OJvwZQotXrPPSWKgO1h1gM
	LXAh4m9Nb6U4D+B6PcYpXl0koVRTDj+9GTq/PX6Ld8+McnUAANRfE8VZh4pPwRq5YAtCwbWu588
	L9cU8hJIb0D8JvY1wrBfEF5TU7FE0Dw1OMY81D3o3bnRDQNIx7S4haCO2FebGJpgD3T3LUzY1am
	8ksHhwdQB/ca48TXs7exLr6UMkW9oee7Gx/2U4oQGDhsAuuLIdf7b/VU1KTj4C99E0B1BWR7j6D
	3RpCqBfhRAcvoSSHzxyRQoRXfIZaAHuc=
X-Received: by 2002:a05:622a:17ce:b0:535:e8c:4258 with SMTP id d75a77b69052e-542b7b0b9e9mr209257251cf.54.1793668362334;
        Mon, 02 Nov 2026 17:12:42 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5498c379989sm12317581cf.19.2026.11.02.17.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 17:12:41 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xO34r-0000000BJux-09A2;
	Mon, 02 Nov 2026 21:12:41 -0400
Date: Mon, 2 Nov 2026 21:12:41 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Kyle Zeng <kylebot@openai.com>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	Kevin Tian <kevin.tian@intel.com>, outbounddisclosures@openai.com
Subject: Re: [PATCH 1/2] vfio: Publish the container after all fallible
 initialization
Message-ID: <20261103011241.GA2696898@ziepe.ca>
References: <20261031042527.6418-1-kylebot@openai.com>
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
In-Reply-To: <20261031042527.6418-1-kylebot@openai.com>

On Fri, Oct 30, 2026 at 09:25:26PM -0700, Kyle Zeng wrote:
> vfio_group_init() publishes /dev/vfio/vfio before vfio_init() has
> finished. The optional no-IOMMU backend is also registered after the
> misc device. A concurrent open can therefore obtain a container while
> the module is still COMING, even if a later initialization step fails.

You didn't cc the vfio maintainers or the its list.

Nor did you refer to my prior remarks here:

https://lore.kernel.org/all/20261030120845.GA3889730@ziepe.ca/

> The failed-module-init path frees the module without waiting for these
> open files.

This is a cdev core bug. It should not allow the file to be opened
until it has secured a module refcount. I don't know much about how
the module refcounting mechanisms work, but it is unreasonable to fix
it like you are doing here by hacking every misc user in the kernel.

Jason
