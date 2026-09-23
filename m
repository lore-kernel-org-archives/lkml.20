Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BE0363095
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790128118; cv=none; b=UNKnTZVW0u9CYD5vlGJtTWhQLz46SwsVW7NqqIFT0/b13KoVwlg7yNdtVKlaNk2guwa4svHSTE3glxQR6mzjlXvC/oBIqgtVXZ6GDJPwov7p8V6YxcGDzn+6e/+Ly4dW+4/ms+IW43bS83osNGoI4OCiQBvrKlhFgxexqfLdkx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790128118; c=relaxed/simple;
	bh=NXxtGQEw3lJq2ywZ3JodKPpLNNcsOYfg8Wng3zlbIg4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f+z/muhs9GxQMKYh7huWIp/O9wYmN+sJ/9dGRh3jQ8kBkzugnw6ZO4mMNDwn1IRp/bMflfwU5FB6xyTUlRtNVoOAf1UEay+QBVTdECYtcWEBosJokxU7fMRi+BCrDUMFbdgzeS2evva6SmS3dxB90BZBQhJBcy8yQGpkvMZGbIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ddYDm/w1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ddYDm/w1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D3D01F000FF;
	Wed, 23 Sep 2026 01:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790128117;
	bh=XstYQSkFZPa4cglZOxjO7EMZGeq2UwulVKwwU1m5/mY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=ddYDm/w1eauvS3GtuwJjEmaoqcDTT8THiHyeLuMjikCjvy4Tkrwld5YTG3T1Hx4KR
	 jsocDiUVSLL2m2rt3XkspM6n+1xLk6jfcnpIIjOIc3oPfKaTPuHzoEQJo9TXFnW4MM
	 GFVn5T6IN/X358ru/LvwCCLVsTtcu8aXESyipxtfzPRkFDw18xzD0KKSmpVmDtcFsY
	 t2MlWL+AnpPa3ozfRxwz66oUr78cZwkqLxHgIKyBT2VfjGOVsGPf0DVPu8au4RB5r7
	 9KYHQJsj4JvwtKI/xkKnYqllf2jlp6sXDce24495avCacpEY0z6su7oNd3dql8bLe1
	 oCcR9M3y2oSHw==
Date: Wed, 23 Sep 2026 02:48:32 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Bence Csokas <bence.csokas@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Conor Dooley
 <conor@kernel.org>, Yicong Yang <yangyicong@hisilicon.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] cache: Make cpu_cache_invalidate_memregion() error
 out if there are no handlers
Message-ID: <20260923024832.53b104c7@jic23-hlaptop>
In-Reply-To: <20260922-cci_enxio-v1-1-00bade212729@arm.com>
References: <20260922-cci_enxio-v1-0-00bade212729@arm.com>
	<20260922-cci_enxio-v1-1-00bade212729@arm.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 22 Sep 2026 09:29:31 +0200
Bence Csokas <bence.csokas@arm.com> wrote:

> Currently, if there are no registered handlers,
> cpu_cache_invalidate_memregion() returns 0. Callers are expected to check
> cpu_cache_has_invalidate_memregion() and return -ENXIO themselves, instead
> of calling this function. If a caller forgets to do this, they may
> erroneously think the operation succeeded. This is in contrast to x86,
> where cpu_cache_invalidate_memregion() itself checks if the operation is
> supported, and returns -ENXIO if it is not.
> 
> Signed-off-by: Bence Csokas <bence.csokas@arm.com>

As you noted short of a race we should never hit this in practice as
all callers must check for support first. Still good to close
that race.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

Jonathan

> ---
>  lib/cache_maint.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/cache_maint.c b/lib/cache_maint.c
> index 9256a9ffc34c..132d2816d6b1 100644
> --- a/lib/cache_maint.c
> +++ b/lib/cache_maint.c
> @@ -59,12 +59,12 @@ static int cache_inval_done_one(struct cache_coherency_ops_inst *cci)
>  
>  static int cache_invalidate_memregion(phys_addr_t addr, size_t size)
>  {
> -	int ret;
>  	struct cache_coherency_ops_inst *cci;
>  	struct cc_inval_params params = {
>  		.addr = addr,
>  		.size = size,
>  	};
> +	int ret = -ENXIO;
>  
>  	guard(rwsem_read)(&cache_ops_instance_list_lock);
>  	list_for_each_entry(cci, &cache_ops_instance_list, node) {
> @@ -78,7 +78,7 @@ static int cache_invalidate_memregion(phys_addr_t addr, size_t size)
>  			return ret;
>  	}
>  
> -	return 0;
> +	return ret;
>  }
>  
>  struct cache_coherency_ops_inst *
> 

