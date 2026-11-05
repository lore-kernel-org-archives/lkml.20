Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793870777;
	b=io8QFiGCkt6e6zS+cCgAE/qi8/DgQoRspjV1Oc3s0mfmCR91XHIeH31qRdu07He3PrO4
	 XCkUxyPnqvfoYlW2N/+MhCE6NiRerUq4doziSctUmt+H7GMyFwkGBZqFlc7PBvHla+eWV
	 YENhil08SBSyljpsZcucXiGCLBnd5ycjs/EZKH/m2SXGJ7HGLvOgIT8IMFBsSRVX0w4EB
	 vTas3D6wd6uwuvgEAozFjnj87Py+CxD1QbucQVGWYociVYRUs5kExl5V4S3UMRvbSqd4V
	 K6wM6RH9h8979YaFqJKneEf7a8UlOX83cPYFFwXhoavrqDgrGZHWVmXjiGyzcA4atCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870777;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=dPKDQBCBYQNiMfvrFyD8dFjYAwa7Jdg7sOpNKNrqofY=;
	b=ny/dvmKhsPIHi3zRIqkovFRo/wAgrH83d72CPDBN5sAMFh7grMs1WOMhS9oHnznhxeyx
	 IF6dtAdUprKpePjBOfthbOWUzcAAxllRNGcnZaCK7II2esWPoB+XQ2RZ+kKAdFoybljmt
	 yIRu/Yc2WAa0rJqf4K1itdpF7c/TFEPF8glY+4nvvY2OiA/97HDgRipXD6DL2vJKHR7Wk
	 H6ysKCIiMk7LqL/7rAAhQISv2tKFB9OJLTZSw8fr2b+0dw85epSuKTri7AxRW0KQRN6U4
	 i6ePH5Ffw3RJF2iS1EH8zB71SWseR6QFTCxew9ilzyawUU52B0twZZItcl+sGZEv8cQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Q80U/Jse";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA55C606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q80U/Jse
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A621D1F00919;
	Thu,  5 Nov 2026 09:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793870776;
	bh=dPKDQBCBYQNiMfvrFyD8dFjYAwa7Jdg7sOpNKNrqofY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q80U/JsetB0EGKNlhWAcY1cZ1tYtokLqJ+h6xwcw+jOr5gyZcw9/4tQvSIhTM/KpN
	 cZJ+dUR7XWwP74J1yWKuFgMMtpArg4ZXiWdUEayzYfx9+TXmQycQcdp4Wr9Fy6dqM/
	 pY9+hmLZbu8HnyPDdkMOYKeOVI6BXNEFxrAoI57F26PUd2vqYsPwYAshjzx+DJtN6B
	 yXX9uurlUAQOJgmMAZJ+G2fzglJR5LzaU1IVo7W7XaA84eAFhJSXvssj5DMShq1KGX
	 AS/AyLlA5yRHvzbHPZdTB6YC6Q97/Igw54dI0RoGTag/do/m1n6nAX/4shIrbluaWj
	 AVVyfXJ+30Wkw==
Date: Thu, 5 Nov 2026 11:26:10 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Alexander Graf <graf@amazon.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Chen Pei <cp0613@linux.alibaba.com>,
	George Guo <guodongtai@kylinos.cn>, Kexin Liu <liukexin@kylinos.cn>,
	Sourabh Jain <sourabhjain@linux.ibm.com>, kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v2 3/3] kho: fix bootmem sizing
Message-ID: <auxLssVxRqlgMFRt@kernel.org>
References: <20261104-kho-bootmem-sizing-v2-0-b0d1a834780f@kernel.org>
 <20261104-kho-bootmem-sizing-v2-3-b0d1a834780f@kernel.org>
 <179381862329.2089669.11972657670874869389.b4-review@b4>
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
In-Reply-To: <179381862329.2089669.11972657670874869389.b4-review@b4>

On Wed, Nov 04, 2026 at 01:57:03PM -0500, Pasha Tatashin wrote:
> > -
> > -	return round_up(size, BOOTMEM_ALIGNMENT_BYTES);
> > +	for_each_node_state(nid, N_MEMORY)
> > +		bootmem_size_node[nid] = round_up(bootmem_size_node[nid],
> > +						  BOOTMEM_ALIGNMENT_BYTES);
> 
> Nit, but I prefer to avoid multi-line indented statements without 
> braces. Just put a braces around the above.

Yep, I'll fix it up while applying.
 
> Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> 
> -- 
> Pasha
> 

-- 
Sincerely yours,
Mike.
