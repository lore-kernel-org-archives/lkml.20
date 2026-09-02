Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCB3378D82
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 17:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788371167; cv=none; b=XRfQBWWnHLoT4XrSH1q1wvIN1uZoyFX9JqXS6G0Lgemoa4fT2gejJQTP648YMfgX5/o0bLjTupO7Fo5NOopyVOawYMj6S9t6/U78HkFGPXLQVNJzx2PmbknB44Ff1jOw/uglk1+tglaJ1a1UsGpudhRLqAYOYVfy/XQ04IEFvks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788371167; c=relaxed/simple;
	bh=ukYqhyi0RGuOSajWaOkTQRPODSNPDMI/uvdyQNdZhaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q3d22PCP3XGyaOqK38ArfN7my1PuVMl47Xmte/h9Jo+A7dYJ4ZSSXKwbSSp69ww3nqv30i03MUpmWME8mZ8euAsWWjF6/ElSds/sWubtrVLfKdrT9DpeIzOVEMsaIGHVI1+Vb0qA6FPGHOCWgLPKbt2jbeov2NUgHf284MzXqhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=MS5P6Fdx; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="MS5P6Fdx"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-90f9f8553e0so9870036d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 10:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1788371165; x=1788975965; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ezr6Kp9rH9+35ejy6kYQ0m2wIG/3JEQzG3offk+MEvQ=;
        b=MS5P6FdxRTf6zZMhQdQyRdyCYJgoZHjc+ksJJWvMOaQdqxglDX+yxi/yZD7mioXPLX
         tinPOUIPNe4cwKb1skSYehRaoBNvQksly4nD3FYSKBf2p+yEM+Cf6Qx0GxpBS1ZfNAKD
         65Bg27dO99juvhMITqqGWJugJFBF/6rnSdoFrSu87+juUCmCYuUo2jV90QcGVyc/A17I
         A9Cs7klleg/fgNhuFzm8uUd/6kXEBxuMzgLsyf5OIzFQzOpJiCkNiJ8cyB5u2EIABZDB
         ohKUoHMIld6Z5OIjs77jo+R7syxC4oQEIF6UZcrFKDWgirEn6ZXesTjWOvf813r7nFXp
         6Nqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788371165; x=1788975965;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ezr6Kp9rH9+35ejy6kYQ0m2wIG/3JEQzG3offk+MEvQ=;
        b=LzIZ3B811tU7UHpRgh3dlfIgFx6eo/OhFWeKaSzsOuKrZnj9PvMandD0amuKz52Cwi
         8xeLloSLw04SbkNdHbNuy7te4QA/40OeN0DLIh0nXCkGIIarzJqoi9OAsg7Bep0fv8rn
         bz/wYXHwQjfLXCifHL+0Ht7Yby0xKfZXE2AciD3U5tdw+LpuRaLMhmnZ2nQhqg75dsEH
         Pc6M/He+q5sSUcty80wBpN7QllugI8dUSBv9jBtOfeJpgfpIzi34cofqayugA3IDUZaS
         p6rAXYsD1ZrAbw4BxJ3Yp4lUC4R8aKNqkLZevooqDxZnIbRnYPpUx5ZQaGWpAWA9mD6R
         5c1w==
X-Forwarded-Encrypted: i=1; AKwUvBwVOrsnldt4xhjdVlq0x92THNlPmX53pe74mcw5aDqZB9LhE14qDWfggc75X1DOtnqsnYtFtJccHq9jipc=@vger.kernel.org
X-Gm-Message-State: AFuF++lKVwmwEQFjr2cmnlZYVzHx5ClohHXqePKwhz2LXaxg2rpJlU9Y
	4x3PudKkJmqm2TJ+WxKd3QSZTyQk8r4fDo+A9CE5SR/qoQDNytmJMue4tbQWXy5rQoc=
X-Gm-Gg: AYBFou1chdzHP3v0R7ucCjlAg3LgCFzzAOd8S2t9QsFDYEuKZqV9Zhcy9DsMAyqg2mg
	Tf9Qmxo4aMFCh8FS56jhicmwwfk0nGuKcq/kFnSNyAPvTtNnPXzyWQXx1hc/V5ifNJRdyZxGRFW
	eRM/c2MYvJNwN1AqV/anc2Cki6/Ow2dUdX9RagBw2OqwT4iSQlRxnQSIkDMYcHuQRdpW6iltkuV
	/iuj71ZG96R6X9GaD/kClrBbMnH2f73/3cK9wXV7XIj9eGe6OnOcexHu9jyGg+2tO9RV6B1wpjs
	1Kmar72K2ZJULUMo8vs6tHPL1YphqLJpXAxbbZTc6/1ZNYH9n68I1iVnj3ksU+rc8Ab9/KzwBYv
	pXzEmegwFFE7GC8tzhTe42QVQP2VV5mr7TyPHfezcuV2uv8wFaYT12YKepedNjtahtLMEc3XZHP
	yJgh+nxAKXu7KzYw3p2Jn7m3JJKFZTe+mGUG2FgOQ6omiCJA2PVhAcZShS5LzWS+cls9CLX7PL2
	Lp34PGciDv+zibXBuZsIZihwCrmB7CBPvQpd9t1wj6kRYwyPBFHT8FA
X-Received: by 2002:a05:6214:2a84:b0:910:3453:7d8a with SMTP id 6a1803df08f44-91034538000mr9552376d6.31.1788371164336;
        Wed, 02 Sep 2026 10:46:04 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9ee41b5dsm23518966d6.21.2026.09.02.10.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 10:46:03 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x1p2B-0000000Emsa-0EzE;
	Wed, 02 Sep 2026 14:46:03 -0300
Date: Wed, 2 Sep 2026 14:46:03 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Leon Romanovsky <leon@kernel.org>, David Hu <dhu@x6u.co>,
	sumit.semwal@linaro.org, alex@shazbot.org, ankita@nvidia.com,
	chriscli@google.com, david.laight.linux@gmail.com,
	dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
	jmoroni@google.com, kevin.tian@intel.com, kpberry@google.com,
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, nicolinc@nvidia.com, praan@google.com,
	sashiko-bot@kernel.org, stable@vger.kernel.org,
	viursachi@google.com, xuehaohu@google.com
Subject: Re: [PATCH v8 0/2] dma-buf: Fix silent overflow and alignment
Message-ID: <20260902174603.GE2890729@ziepe.ca>
References: <20260901170849.4052816-1-dhu@x6u.co>
 <2bf581db-7cc5-4f38-a075-1b988c332f3c@amd.com>
 <20260902073936.GR24140@unreal>
 <aed39f83-6340-4fe9-890c-6d5f340c97d6@amd.com>
 <20260902083232.GT24140@unreal>
 <aae19599-2ba8-41fd-b3a9-b1f80107f563@amd.com>
 <20260902095338.GU24140@unreal>
 <65dc4ca1-6882-490d-baad-3e0abd708af3@amd.com>
 <20260902105919.GV24140@unreal>
 <7471c6e1-fbba-4430-a196-3f57a73505b7@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7471c6e1-fbba-4430-a196-3f57a73505b7@amd.com>

On Wed, Sep 02, 2026 at 03:34:18PM +0200, Christian König wrote:
> On 9/2/26 12:59, Leon Romanovsky wrote:
> ...
> >> The PCI_P2PDMA_MAP_BUS_ADDR is not supported by DMA-buf and as
> >> far as I can see is a complete dead end.
> > 
> > Maybe you mean DRM, but VFIO works perfectly with
> > PCI_P2PDMA_MAP_BUS_ADDR flow in DMA-buf.  What am I missing?
> 
> Well not quite.
> 
> The approach PCI_P2PDMA_MAP_BUS_ADDR takes is fundamentally tied to
> only map a physical CPU address into a PCI address and doesn't take
> into account that in a lot of configurations the CPU can't access
> all resources.

It is called PCI P2P. If the flow only uses PCI devices it should
always work because it relies on PCI spec things that happen outside
the CPU.

It does not try to solve the general embedded problem of arbitary
communication between blocks inside a SOC, scale up networks, and so
on.

So, yes, it does not solve every problem DMA buf faces, but no it is
not a "Dead end" as it 100% solves PCI to PCI communication which is
still a very common use case.

DMA buf users that are exporting from a PCI device, over PCI MMIO
should be using this API. It is the only way to do PCI to PCI
communication correctly in the kernel.

Jason
