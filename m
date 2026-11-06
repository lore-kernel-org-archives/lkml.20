Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793959199;
	b=145TN0NFq8E3G6d37tHaW69LPVD7gKCCEuF9Vg67bInA1HlLthENjjXry/c5gwjlg+Gm
	 o18yf9Fpt41gjcU3dSpUlRktNFNFneinHkz5eRRwuNaBODmK+FWmJcdLO17uc3U6TGKwi
	 3AOto6oYHMF5dQkvgcsPFhepj5xnlndZMOw1A9x+/loe4EuM2nsIYRLsAge1reKQlbMg9
	 gg2HnggB9Js3XB52bVQSnWu6x6jsUln0i0TpM4LnnEhMutNd4lTn7wrbG4rQCtbFMaW3t
	 iQuzBqjpnDJcZV9QmtbH95ztfrBOkTJVQJbeWX0V2yUljed0ruQ2G6jkXvFlzjWQZwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793959199;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=0+U2vTqYGmEsuBaqKS6I103lcYhGQy++74M9paljrRI=;
	b=bVtBVI63RYksGfCcweuIR5u75XLa1iikjAMf1egcoul2fgYxeyN94mGVxBd723nBfAYW
	 AsPlNQkDEWLGZyunuzY/Fmag427GYP//+ES/72p3uya0Unb7vEHU7DbIlXh7QfXDgZFCj
	 6F07MUxWu4GO+IlTzMPVFEWTMNwbCLYQRx/Y1nOt6wHDcA2yzM6LJ8ig6NdY0vF2CqTxL
	 EkNZ8V36CMYTILBmbZVjofH6ygrOhPqpHcNi4pxtCREzJzXkaZGq1IUCnydQdOVQqXvub
	 LscuVT9AGo6pSdu4Kr1naK7YUoBlvMlm8L362sVusCzZE0LjVmrcKv1jxCHFsubt3Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=DhEnS2Ce;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 944E6606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:59:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 944E6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=DhEnS2Ce
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A12BE1476;
	Fri,  6 Nov 2026 01:59:54 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A695E3F628;
	Fri,  6 Nov 2026 01:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793959197; bh=fRhN6cuZAlw5ZrkbGaGNRC9tVNOKkyJ93r/CRrXa9Kc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DhEnS2Ceug/N/YCLhLrTyZWwH5R5P4kXVtOtISrJpNxGrZdZMj+fdWRZXPAGlpcNl
	 AUHhuN62B31Abm3uddk/rym1pPKaSfd2cw9ZNCpr+W1QVjVAwpQhS0KXY0GfU9kfo8
	 PYXXtFCVbNS2fDnrS5FRKzOlddj9XD07z8VzYKfI=
Message-ID: <b91edbb3-8abe-4a1a-a8ba-00dd475dccff@arm.com>
Date: Fri, 6 Nov 2026 09:59:55 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] irqchip/gic-v3-its: Free the page when gen_pool_add()
 fails
To: Fuad Tabba <fuad.tabba@linux.dev>, Marc Zyngier <maz@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>, Steven Price <steven.price@arm.com>,
 Will Deacon <will@kernel.org>, Fuad Tabba <tabba@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261106092625.3977163-1-fuad.tabba@linux.dev>
 <20261106092625.3977163-4-fuad.tabba@linux.dev>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261106092625.3977163-4-fuad.tabba@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/11/2026 09:26, Fuad Tabba wrote:
> When the ITT pool has no room, itt_alloc_pool() grows it by a page and
> retries. gen_pool_add() fails when it cannot allocate its chunk
> descriptor, but its return is ignored, so the page is leaked and the
> retry allocates another page to leak, until an add succeeds or a page
> allocation fails.
> 
> Free the page and fail the allocation instead.
> 
> Fixes: b08e2f42e86b5 ("irqchip/gic-v3-its: Share ITS tables with a non-trusted hypervisor")
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>   drivers/irqchip/irq-gic-v3-its.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
> index 5c3ab9d30f6af..bdf7c81e60c76 100644
> --- a/drivers/irqchip/irq-gic-v3-its.c
> +++ b/drivers/irqchip/irq-gic-v3-its.c
> @@ -276,7 +276,10 @@ static void *itt_alloc_pool(int node, int size)
>   		if (!page)
>   			break;
>   
> -		gen_pool_add(itt_pool, (unsigned long)page_address(page), PAGE_SIZE, node);
> +		if (gen_pool_add(itt_pool, (unsigned long)page_address(page), PAGE_SIZE, node)) {
> +			its_free_pages(page_address(page), 0);
> +			break;
> +		}

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>


>   	} while (!addr);
>   
>   	return (void *)addr;

