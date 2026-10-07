Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF44549E13F;
	Wed,  7 Oct 2026 14:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791384191; cv=none; b=jny6RJOefsyBsdygtsAJ9uXds5a/NFIdD7xcDBt5oNoY+bnedR1+WJ7h3At2r54hgNwwvgBCXxOCRPCOVFfEFt9hmLWvWmLzNXlGuOn3fPEXyRcylfonwv3V+W3pZY+alTjREfCk22u2IiOrWxindFeE9W8v7PmKM54Rm0F6Aj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791384191; c=relaxed/simple;
	bh=xcCZxypVl+hwx4LveDXvbkYtsVTfZuAreWliu31ApxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pc+vrpwV9ZegGm9eXI+9XlH1cp5S1h69tJU5tUiig44lp0GEWwViajxp3xGgRJApMaPHHrHiRRYLewcfaG1EEwPe1GUm/Wmf7FGdi5fGMzgoQn0FomrtodIKa6hphcIUPZcXxnJp+kjw1so5GggrLgWNbUcc8ltKJOp7zK3DlW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org; spf=pass smtp.mailfrom=ozlabs.org; dkim=pass (2048-bit key) header.d=ozlabs.org header.i=@ozlabs.org header.b=iDj1cgYt; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ozlabs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ozlabs.org header.i=@ozlabs.org header.b="iDj1cgYt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1791384182;
	bh=Vy/SqPR2iRJy+qH2zNvd5P2288DBcyzZTTebwGhXmmo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iDj1cgYt3A0i04M2ayQrIeQD8r2hmTUox//NvpuJMBgb9DAJGJgDjG+45BDvpKfAn
	 YGWxBZIr+jOJGuGraDsDKknuoYlTQXy/MvRh+NRtDQlpY3fBJIndRDaWMOWrODf5YK
	 +uZlsuORBlsm7MgvchZvA88okEqAQn8quST5REy2c6jn705dZR8ytJwAUsBocB7BeU
	 MiZw0J79WZOWR2fmJb+e9wJULTpZkCvH0J6cR3rJR7390Yz/j3S2sWKOiQZCCaRkCw
	 hfK+kSaXQl4TWkQWHbBxytFYU3JeT/A7DO5xRVzinzMDiZ2R2+BfnFLTHJpjXMjAeZ
	 2DdvZFRErtdkA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4j0G7j0fjYz4wKm;
	Thu, 08 Oct 2026 01:42:56 +1100 (AEDT)
Message-ID: <88a14307-37a2-4081-b5b1-039d4f64a6da@ozlabs.org>
Date: Wed, 7 Oct 2026 15:42:54 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: Annul dmabuf->file on file release
Content-Language: en-GB
To: Alex Mastro <amastro@fb.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Zack Rusin <zack.rusin@broadcom.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, Alex Williamson <alex@shazbot.org>
References: <f8efaabd-c06e-4f04-8cfa-489c148e37ba@ozlabs.org>
 <asYOmaPqwUOBdz0x@devgpu015.cco6.facebook.com>
From: Matt Evans <matt@ozlabs.org>
In-Reply-To: <asYOmaPqwUOBdz0x@devgpu015.cco6.facebook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Alex,

On 07/10/2026 10:19, Alex Mastro wrote:
> On Tue, Oct 06, 2026 at 08:15:26PM +0100, Matt Evans wrote:
>>  static int dma_buf_file_release(struct inode *inode, struct file *file)
>>  {
>> +	struct dma_buf *dmabuf = file->private_data;
> 
> I think dmabuf can be NULL here if the dmabuf allocation fails during
> dma_buf_export().
> 
>> +
>>  	if (!is_dma_buf_file(file))
>>  		return -EINVAL;
>> -	__dma_buf_list_del(file->private_data);
>> +	__dma_buf_list_del(dmabuf);
>> +	/* Must be observed by __get_file_rcu() before file_free() */
>> +	smp_store_mb(dmabuf->file, NULL);
> 
> Resulting in NULL deref here -- guard with null check?

Oof, yes!  Thanks for catching this.  __dma_buf_list_del() protects
itself against a NULL arg.  Done.


Thanks,

Matt

> 
>>  	return 0;
>>  }
> 
> via this path
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index d504c636dc29..557cd7a4c971 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -725,6 +725,7 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
>  	if (!try_module_get(exp_info->owner))
>  		return ERR_PTR(-ENOENT);
>  
> +	// succeeds
>  	file = dma_buf_getfile(exp_info->size, exp_info->flags);
>  	if (IS_ERR(file)) {
>  		ret = PTR_ERR(file);
> @@ -739,6 +740,7 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
>  	dmabuf = kzalloc(alloc_size, GFP_KERNEL);
>  	if (!dmabuf) {
>  		ret = -ENOMEM;
> +		// go here
>  		goto err_file;
>  	}
>  
> @@ -771,6 +773,7 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
>  	return dmabuf;
>  
>  err_file:
> +	// ends up calling dma_buf_file_release()
>  	fput(file);
>  err_module:
>  	module_put(exp_info->owner);
> 

