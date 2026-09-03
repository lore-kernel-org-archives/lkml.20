Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516464E66B9;
	Thu,  3 Sep 2026 16:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788453581; cv=none; b=BzSR1qjsdfzAoivvJuTwNgUhHRvPFon2OPLMnNr1xQAE/54bOwthKxBTT1nCso9ocx6qIWTdLNkiU8A5WBu4zty9TmFWjhIzoZ65ZPnUE0q2Xh+UjZ3yKh/ac8cbjGruW9+cl317i8hqiaYcJN7dWyGnfn2V0XdinWR1K74J/pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788453581; c=relaxed/simple;
	bh=4KnOCEvB9Zmgxm3HnYsIVLIJiLSzJQJUflmAy4Gbbcw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pXOipcWeMueGghc0LQlTZ36wgaAKLWBTlp4XkwuM8u8fD5LipKm4Mlb+AIsFydH0kzTK2+t+FEstw7/cZAfen4A33oqb0Kd27qdI8WCfJFz0dvwinZ5d3duDHDAR9t6SORirXQu57WnChhy5qSkazDRLqO+UivtmbHT0dc8kh8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=dwkAxOgt; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="dwkAxOgt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=/5UO8yAUIryn8dEVF1Ml7GRz8oikkuw9d/euczO9QSQ=; b=dwkAxOgtvW1mQ1ZHdfDmg0drBR
	7RiVXThqnL7IRpE7if3bn/NgksbSUmL51YCacii+sadFYYp71SnxjRsivHsZcKWlHqM/fkMV/nKaW
	HVX4K8ft3eNUMpDrye3MEYqmoxJBtpZvBBWneyEV8GJ6dkzbdBhyGpiGE4xczcOzD8Q2UBTPCQOwU
	6RQCLK3v7/yTsGFFXaR/ujQytSgIHzz5JCdxtqrVz6LgQZG6qHTHbpysjpIYyeWN6IFmV/RuXb/cf
	jJQ37pKLmBLpwtSlzbVfrzTneR4eWMFfvdUBQPJHfaw83ykNgAKvy0RFoig/rdX6w3tqxyAHlGSdQ
	J+Y02jKQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2ATK-00000000Bhn-2dIO;
	Thu, 03 Sep 2026 16:39:30 +0000
Message-ID: <0a7579cc-94e3-4f02-a3e8-e42b7012a470@infradead.org>
Date: Thu, 3 Sep 2026 09:39:29 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation/gpu: Fix brackets
To: Manuel Ebner <manuelebnerli@mailbox.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20260903161006.735038-2-manuelebnerli@mailbox.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260903161006.735038-2-manuelebnerli@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9/3/26 9:10 AM, Manuel Ebner wrote:
> Remove needless '(' and add missing ')'.
> 
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
> ---
>  Documentation/gpu/drm-vm-bind-locking.rst | 2 +-
>  Documentation/gpu/nova/core/todo.rst      | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

This patch probably should be 2 patches since these files have
different maintainers.


> diff --git a/Documentation/gpu/drm-vm-bind-locking.rst b/Documentation/gpu/drm-vm-bind-locking.rst
> index a345aa513..df6cf0132 100644
> --- a/Documentation/gpu/drm-vm-bind-locking.rst
> +++ b/Documentation/gpu/drm-vm-bind-locking.rst
> @@ -170,7 +170,7 @@ submission is therefore preceded with a re-validation section:
>             validate_gem_bo(&gpu_vm_bo->gem_bo);
>  
>             // The following list iteration needs the Gem object's
> -           // dma_resv to be held (it protects the gpu_vm_bo's list of
> +           // dma_resv to be held. It protects the gpu_vm_bo's list of
>             // gpu_vmas, but since local gem objects share the gpu_vm's
>             // dma_resv, it is already held at this point.

I think that I must like parenthetical phrases more than you do. ;)

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

>             for_each_gpu_vma_of_gpu_vm_bo(&gpu_vm_bo, &gpu_vma)
> diff --git a/Documentation/gpu/nova/core/todo.rst b/Documentation/gpu/nova/core/todo.rst
> index d5130b2b0..a01c362b1 100644
> --- a/Documentation/gpu/nova/core/todo.rst
> +++ b/Documentation/gpu/nova/core/todo.rst
> @@ -33,7 +33,7 @@ A good example from nova-core would be the ``Chipset`` enum type, which defines
>  the value ``AD102``. When probing the GPU the value ``0x192`` can be read from a
>  certain register indication the chipset AD102. Hence, the enum value ``AD102``
>  should be derived from the number ``0x192``. Currently, nova-core uses a custom
> -implementation (``Chipset::from_u32`` for this.
> +implementation (``Chipset::from_u32``) for this.
>  
>  Instead, it would be desirable to have something like the ``FromPrimitive``
>  trait [1] from the num crate.

-- 
~Randy
