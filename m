Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05ACC388E7A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 10:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788429812; cv=none; b=sxLkypFiPED7xtVA4M+3Vybtvi13zXz7KG/q7pXvnzWNYACqoL2Seu0BFRr5CNVBsms+y9FgcBPB1RN0aAL0fpwiWpYUn1z7W+cWV3gNC1wMJLIZdSL5g312bXAJVSjGtR2ShprlV2A+c7DXy3VZDMyGbw7aqSyQ9ncaLhYXhms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788429812; c=relaxed/simple;
	bh=ntB9fs616qYfrLPBRKjSLmOUV5UErT3QQloiRYYK6Sk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d0C+K4kIZ+1FiFFGdUOGaBH4ZsXev4rSFVNSuePHzr0/6d4XdS2WmhXRzcDRS3fBvTxHWyYsy+pY35MHIRs0iluGN1dCUAMl2IH4EY+f7iXuyf5tZMZbunj3C9//j8gZfBNYVbnqrMGLgPeImXKVBJHJkScyePorL137LRxtHEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=N2yP0L5n; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N2yP0L5n"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a623987d32so3553182a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 03:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788429799; x=1789034599; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NTFqZaE5WeXzEFHRWSBbenebslM+9RuyFvHTxQmSgMQ=;
        b=N2yP0L5nTY/nWVm0VWA89oNldW+PU1Jt3gfaVqOXAnY9bB/QeHSmFFmdQbe3Cz+by3
         7KB1TJjTLdkvGM+Bvi7mzxou2UrcFixYxnRqvFlso9KU/Xd5h2TZ3S9ySvrJXAzCmZNY
         yLfJWqwCouYKU758pymZ/e5DL+Tj0Hd7Rh8MKCO1PJoI/tdwXntU7PMoY29SCXncN12q
         365ER75fZuiMk1b5+SInrsIGov1Dxl1NqKqs4y+61JrLi2DGY5s9Zx7rz7K+kgBApyYb
         KlBrpoweG+JLXLAQVj4vOAst8SN0DsdoBaSVISG+dmIYoaeowS1oL4ZFIs0ujBxy2ZD/
         HvLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788429799; x=1789034599;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NTFqZaE5WeXzEFHRWSBbenebslM+9RuyFvHTxQmSgMQ=;
        b=epOrDUvhxd26w1IH5omQ74cp3aa9l0tlVzeL+fkXraOcUiYGOQyyr9fwYMazdxpslJ
         G2QKcS8KfB/wQwsG8shAcoAytLPqspJPYpbSxMN/dILA1sa4YPCn2Ed890jT+FzL8wHn
         LsFIowhNttst87sIG+i1dBt7ld/SxYnfq3dAViDvda1LRI8UY7CLGN/lQ+2mGmMOi94b
         flqNoX2OegBkO+tn9sU+C4gD5Z0bl/P3uP8yO8PIB/+/gxw+Jtt1gRkKHo/Umc4jCJkt
         LMtiHNkse9aOQk8YwCqWQUFQRoxLiMTH91GK63uP33HHSRXSi9cc/ef/VJ5foZmnPvLP
         MdZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxS6EQPVkdI94N9QjckkHgVPIPLLQBC9oDSgNxQjbL1BRVYbCLAs7fC7QZ5AkcYl9ZmJ666YoaWI6c899Q=@vger.kernel.org
X-Gm-Message-State: AFuF++kvm1LWWF6ZmpviX0+r6pVTOARL5s6yhgzD0ON7t0dBUywlIxLc
	BETaynGW+ZOrOMqTmK1vNCi5a41eFS2/dT/INbyZSVCcWjrbTJ20mH1H8qhzMr4uqA==
X-Gm-Gg: AYBFou1EkX8iqLiaLcsdK/K57beUxze6JtPSsE8WCWD7nAsU6qP2Iqydzfkamu754Dr
	2tpxfTgkhH0U5wgEFm+IVmQPPoHqpz6kYMr9rE+h07PtNZ/iHlTUBJY0EUrk7qSfY2Qoy6+ZHKu
	xaGbERDw32R8nNOnrKjRqso8SKuBlxTnFg2d+D7Lx2bFj8mFipfvxkR+rQc8xnu0BUVqw546MX3
	IEFaFQVxtTWqeZ6DuzQZlIAIT9zr8XBei1udJ8LDTgJIbfQ/KUttejbuDHuJx4wwS7XRNcDD80b
	aHScjI2ZMwsnyp/TUYWFjgRn5+OYweNwiYQ7mb01QwvVYWrKk60w+woK7OB0/f+kXZlnnXOL2CE
	4ubb2ksfY14W2HL7JyeU67Y3RhgQ1xZCbwNU+wqneUNnSv1iGpWnF2LBYkq2T3EnUFNmie0VA+b
	7sSHQC4zWHJblRj1jD9l8FAoL7kfV7tXCjVaNyZidou4Ot5aYnmUqeaj17yK3ULqUH7DZcM6aZH
	TCPb0AmUz1MMpq4Xw==
X-Received: by 2002:a05:6402:1ed1:b0:6a5:f4f4:5c0e with SMTP id 4fb4d7f45d1cf-6a6829afd97mr6824116a12.14.1788429798174;
        Thu, 03 Sep 2026 03:03:18 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f8b47f7sm2104420a12.9.2026.09.03.03.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 03:03:16 -0700 (PDT)
Date: Thu, 3 Sep 2026 11:03:12 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Rob Herring <robh@kernel.org>
Cc: catalin.marinas@arm.com, will@kernel.org, rppt@kernel.org,
	akpm@linux-foundation.org, sudeep.holla@kernel.org,
	jenswi@kernel.org, mark.rutland@arm.com, sumit.garg@kernel.org,
	ardb@kernel.org, thierry.reding@kernel.org, david@kernel.org,
	danielmentz@google.com, linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org, op-tee@lists.trustedfirmware.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 02/10] of: reserved_mem: Introduce "ll-map" property
Message-ID: <aplF4NaoFk73d-c5@google.com>
References: <20260902104712.2399797-1-vdonnefort@google.com>
 <20260902104712.2399797-3-vdonnefort@google.com>
 <20260902172436.GB1440252-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902172436.GB1440252-robh@kernel.org>

On Wed, Sep 02, 2026 at 12:24:36PM -0500, Rob Herring wrote:
> On Wed, Sep 02, 2026 at 11:47:04AM +0100, Vincent Donnefort wrote:
> > Keeping last-level mappings is interesting on some architectures as it
> > allows mapping/unmapping pages from the kernel direct map without the
> > risk of splitting blocks which, under the break-before-make rule, may
> > trigger page-faults the kernel can't handle.
> > 
> > Add an "ll-map" property for reserved-memory regions. When set, it
> > splits the underlying memblock and sets the MEMBLOCK_LLMAP flag.
> 
> Where is this documented? Any DT property must have a schema.

Ack.

> 
> Though I'm not thrilled about more flag properties. Handling all the 
> combinations of properties has proven to be painful. Can this be implied 
> from the compatible string instead?
> 
> Rob

We need this before the kernel direct map has been created (paging_init()).

I would have moved that directly into the driver lend_pool.c, but then it is
probed too late (unflatten_device_tree()).

-- 
Vincent
