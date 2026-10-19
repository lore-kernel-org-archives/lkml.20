Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB893DAAD2
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792408170; cv=none; b=XzM3EtgKLr1xuOFj3aKXVk0kZEuW9CaFONYydLQgcrfH3I2RMYWhMWH9GXtz0jwPF1VCQB/N3UZP9GuXBzN9xh0eUdVXVKpol4PIIUL4aroHDhJ2ZcpEkfabkRPLM2tn9qL4E4dE9uLHyMeqsCP+Do1LHIRqlSoZGQnTgslKpNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792408170; c=relaxed/simple;
	bh=H6o32xVh5ACHUEr2zNlG+jzsUhTFt1focx+3zSqj79w=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=jKz7SNQSLxnEql+rXMNH9068bcgvqtj+mCgIOFhByBcTUqnRF9J4IfAURZki61mrelVbGbCj5UbQgaxRhRBqVe/hUbYFZOURTLaehPIyDstLmpNjHbpOqFB1lbQzgmIC5izx6Q6Xdsms+QEeEFWxxp4e3pRexBBa8Gjn3CBXCMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HLO4yck0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HLO4yck0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 998981F000C4;
	Mon, 19 Oct 2026 11:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792408169;
	bh=/HHsrhMZL6uF7oMdrWjCL4GY6W29/wq0pzaKjLWhw5Q=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=HLO4yck0sfA1Dc2Axu9Qpd+8qknBvutqF+8W81beeHiIgS7sZoI4o/S4MqCQ6oBvT
	 we8+Xop+9IE7HnyeePgzmdXeK+9kJYZEdpQfOlX66FYfV/sL/ExV1mGlEXS1uJ6kw/
	 hn5x58AI9hhnOeKPtHz+NlLdFJDvoFkpYqaL/2XsLTKcKZ8WDmgXoE/swn5YeifWUP
	 /A7akVF+wbGAJ7GA0xcZgI2SgKpJclInnxl1zn/eHjBmEo2ZroSR5IJnxEg+j1LN6V
	 k8ksyqoFygDGUze75YA1yx0zxNtObZ/rQI2o1BLzfzTfhepRJN34Y+WFFj5f9SAw7O
	 KrzyfXsLyaaVQ==
Message-ID: <d1236f9a-b5ec-434d-9293-54cf9f6364ef@kernel.org>
Date: Mon, 19 Oct 2026 19:09:27 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] f2fs: fix submit accounting for IPU writeback
To: Seongjae Jeong <jsjlee1020@gmail.com>, jaegeuk@kernel.org
References: <20261014112629.59861-1-jsjlee1020@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261014112629.59861-1-jsjlee1020@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/14/26 19:26, Seongjae Jeong wrote:
> f2fs_write_cache_pages() uses the submitted count, which is set to
> fio.submitted in f2fs_write_single_data_page(), to update nwritten
> and decrement wbc->nr_to_write.
> 
> In the OPU path, f2fs_submit_page_write() sets fio->submitted to 1.
> However, in the IPU path, fio->submitted is never set and remains zero.
> As a result, successful IPU writes are not accounted for.
> This can cause asynchronous writeback to continue beyond its budget.
> 
> Set fio->submitted in f2fs_inplace_write_data() after a page is
> successfully merged into a bio or submitted, so that successful
> IPU writes are included in the writeback accounting.
> 

Missing Fixes and Cc stable line?

> Signed-off-by: Seongjae Jeong <jsjlee1020@gmail.com>
Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
