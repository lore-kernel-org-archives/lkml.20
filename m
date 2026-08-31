Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105303AA1B6;
	Mon, 31 Aug 2026 22:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788216850; cv=none; b=AUe2UkrdBYG2dOTlTUFohVvW9NDltuE4zNVFBCh5JzFC1OgPYQBle0UE9MKQfWQd2599OEPhayzraTGasb1c2ASbRU5T1cLpAH83xZW+sN28dp8q/wLWZso1vtqOM5X2dZuC+Y4R907xk5TCDuntVHwas/zzC28rIlPtz7WP7i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788216850; c=relaxed/simple;
	bh=+kLJTOQcgtnujjFfaBXmldwr7QkPXcN2ecuSsR5BaNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pp8DiRyeBZNS1e6vGlvKocEOTr6aPehDwCLYcgjsRsvUv2g3VxUT6eUSvXE3urWpZMeKRnxu98VeRf+XmsyfP1fSOfXuOySMXKf2FZ/lgwBje6P5cshV7cQIekV5hK9NgDH7/ZlzHNfPLjCAglowJfRNxPrmL1pzQAp+FtesOp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JNp2Fa+/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JNp2Fa+/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D59E41F000E9;
	Mon, 31 Aug 2026 22:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788216848;
	bh=c1xMaguqzWma2hDRCTuvoAbCewOIauRAijFiNm/Uyco=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JNp2Fa+/GWKkskm9Xq2o/HbnOQ07uGP+J9wZ+Q1RVOqIDNsfFCDYXi//popRWtaz3
	 IOY9tSvDrjMGJUKIk8k4eITONAW4NYZNhs2jLrP5Ra598P3XJFK+/R38dm7N05EIK8
	 jFVmsS6xUVHiZ0MTzzz+syUmpvf3W/Eo01FWAfMRLGNAe0G9tNvQvex5okhF50KEv4
	 HEGbECO+libvCiQAFZ/OvdpBmOoeK4XpCrwHnyxsf8b9dutgGoRGvj9mE/y/nPDwq3
	 daHl8lgTAENtYGU1jNwNHmmIG6i9goDTixqEXhCbwBApQBha2IBe2NkPoFNFmOylti
	 6cAiVN7FDeY0A==
Date: Mon, 31 Aug 2026 17:54:05 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Albert Esteve <aesteve@redhat.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sudeepgoud Patil <quic_sudeepgo@quicinc.com>, 
	Sarannya S <quic_sarannya@quicinc.com>, Pranav Mahesh Phansalkar <quic_pphansal@quicinc.com>
Subject: Re: [PATCH 1/2] soc: qcom: smem: add boundary checks for partitions
Message-ID: <apYFPXLD6hLWohz0@baldur>
References: <20260820-port-smem-v1-0-d19a45f583bf@redhat.com>
 <20260820-port-smem-v1-1-d19a45f583bf@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820-port-smem-v1-1-d19a45f583bf@redhat.com>

On Thu, Aug 20, 2026 at 01:34:18PM +0200, Albert Esteve wrote:
> From: Sudeepgoud Patil <quic_sudeepgo@quicinc.com>
> 
> Add condition check to make sure that the end address
> of private entry does not go out of partition.
> 
> Signed-off-by: Sarannya S <quic_sarannya@quicinc.com>
> Signed-off-by: Pranav Mahesh Phansalkar <quic_pphansal@quicinc.com>
> Signed-off-by: Sudeepgoud Patil <quic_sudeepgo@quicinc.com>
> Signed-off-by: Albert Esteve <aesteve@redhat.com>

I'm sorry, Albert. Sudeepgoud messed up the authorship vs signed-off-by
chain here. The author should be "Sarannya", as that's the first
signed-off-by.

PS. It would also be nice if this was submitted with updated email
addresses and copyright statement. But I'd not expect you to fix that.

Regards,
Bjorn

> ---
>  drivers/soc/qcom/smem.c | 105 +++++++++++++++++++++++++++++++++---------------
>  1 file changed, 72 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
> index afb21a778fe7b..194ffb2ac010f 100644
> --- a/drivers/soc/qcom/smem.c
> +++ b/drivers/soc/qcom/smem.c
> @@ -2,6 +2,7 @@
>  /*
>   * Copyright (c) 2015, Sony Mobile Communications AB.
>   * Copyright (c) 2012-2013, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
>  #include <linux/hwspinlock.h>
> @@ -85,6 +86,17 @@
>  /* Processor/host identifier for the global partition */
>  #define SMEM_GLOBAL_HOST	0xfffe
>  
> +/* Entry range check
> + * ptr >= start : Checks if ptr is greater than the start of access region
> + * ptr + size >= ptr: Check for integer overflow (On 32bit system where ptr
> + * and size are 32bits, ptr + size can wrap around to be a small integer)
> + * ptr + size <= end: Checks if ptr+size is less than the end of access region
> + */
> +#define IN_PARTITION_RANGE(ptr, size, start, end)		\
> +	(((void *)(ptr) >= (void *)(start)) &&			\
> +	 (((void *)(ptr) + (size)) >= (void *)(ptr)) &&	\
> +	 (((void *)(ptr) + (size)) <= (void *)(end)))
> +
>  /**
>    * struct smem_proc_comm - proc_comm communication struct (legacy)
>    * @command:	current command to be executed
> @@ -403,6 +415,7 @@ static int qcom_smem_alloc_private(struct qcom_smem *smem,
>  				   size_t size)
>  {
>  	struct smem_private_entry *hdr, *end;
> +	struct smem_private_entry *next_hdr;
>  	struct smem_partition_header *phdr;
>  	size_t alloc_size;
>  	void *cached;
> @@ -415,19 +428,25 @@ static int qcom_smem_alloc_private(struct qcom_smem *smem,
>  	end = phdr_to_last_uncached_entry(phdr);
>  	cached = phdr_to_last_cached_entry(phdr);
>  
> -	if (WARN_ON((void *)end > p_end || cached > p_end))
> +	if (WARN_ON(!IN_PARTITION_RANGE(end, 0, phdr, cached) ||
> +						cached > p_end))
>  		return -EINVAL;
>  
> -	while (hdr < end) {
> +	while ((hdr < end) && ((hdr + 1) < end)) {
>  		if (hdr->canary != SMEM_PRIVATE_CANARY)
>  			goto bad_canary;
>  		if (le16_to_cpu(hdr->item) == item)
>  			return -EEXIST;
>  
> -		hdr = uncached_entry_next(hdr);
> +		next_hdr = uncached_entry_next(hdr);
> +
> +		if (WARN_ON(next_hdr <= hdr))
> +			return -EINVAL;
> +
> +		hdr = next_hdr;
>  	}
>  
> -	if (WARN_ON((void *)hdr > p_end))
> +	if (WARN_ON((void *)hdr > (void *)end))
>  		return -EINVAL;
>  
>  	/* Check that we don't grow into the cached region */
> @@ -587,9 +606,11 @@ static void *qcom_smem_get_private(struct qcom_smem *smem,
>  				   unsigned item,
>  				   size_t *size)
>  {
> -	struct smem_private_entry *e, *end;
> +	struct smem_private_entry *e, *uncached_end, *cached_end;
> +	struct smem_private_entry *next_e;
>  	struct smem_partition_header *phdr;
>  	void *item_ptr, *p_end;
> +	size_t entry_size = 0;
>  	u32 padding_data;
>  	u32 e_size;
>  
> @@ -597,67 +618,85 @@ static void *qcom_smem_get_private(struct qcom_smem *smem,
>  	p_end = (void *)phdr + part->size;
>  
>  	e = phdr_to_first_uncached_entry(phdr);
> -	end = phdr_to_last_uncached_entry(phdr);
> +	uncached_end = phdr_to_last_uncached_entry(phdr);
> +	cached_end = phdr_to_last_cached_entry(phdr);
> +
> +	if (WARN_ON(!IN_PARTITION_RANGE(uncached_end, 0, phdr, cached_end)
> +					|| (void *)cached_end > p_end))
> +		return ERR_PTR(-EINVAL);
>  
> -	while (e < end) {
> +	while ((e < uncached_end) && ((e + 1) < uncached_end)) {
>  		if (e->canary != SMEM_PRIVATE_CANARY)
>  			goto invalid_canary;
>  
>  		if (le16_to_cpu(e->item) == item) {
> -			if (size != NULL) {
> -				e_size = le32_to_cpu(e->size);
> -				padding_data = le16_to_cpu(e->padding_data);
> +			e_size = le32_to_cpu(e->size);
> +			padding_data = le16_to_cpu(e->padding_data);
>  
> -				if (WARN_ON(e_size > part->size || padding_data > e_size))
> -					return ERR_PTR(-EINVAL);
> +			if (e_size < part->size && padding_data < e_size)
> +				entry_size = e_size - padding_data;
> +			else
> +				return ERR_PTR(-EINVAL);
>  
> -				*size = e_size - padding_data;
> -			}
> +			item_ptr =  uncached_entry_to_item(e);
>  
> -			item_ptr = uncached_entry_to_item(e);
> -			if (WARN_ON(item_ptr > p_end))
> +			if (WARN_ON(!IN_PARTITION_RANGE(item_ptr, entry_size, e, uncached_end)))
>  				return ERR_PTR(-EINVAL);
>  
> +			if (size != NULL)
> +				*size = entry_size;
> +
>  			return item_ptr;
>  		}
>  
> -		e = uncached_entry_next(e);
> -	}
> +		next_e = uncached_entry_next(e);
> +		if (WARN_ON(next_e <= e))
> +			return ERR_PTR(-EINVAL);
>  
> -	if (WARN_ON((void *)e > p_end))
> +		e = next_e;
> +	}
> +	if (WARN_ON((void *)e > (void *)uncached_end))
>  		return ERR_PTR(-EINVAL);
>  
>  	/* Item was not found in the uncached list, search the cached list */
>  
> +	if (cached_end == p_end)
> +		return ERR_PTR(-ENOENT);
> +
>  	e = phdr_to_first_cached_entry(phdr, part->cacheline);
> -	end = phdr_to_last_cached_entry(phdr);
>  
> -	if (WARN_ON((void *)e < (void *)phdr || (void *)end > p_end))
> +	if (WARN_ON(!IN_PARTITION_RANGE(cached_end, 0, uncached_end, p_end) ||
> +			!IN_PARTITION_RANGE(e, sizeof(*e), cached_end, p_end)))
>  		return ERR_PTR(-EINVAL);
>  
> -	while (e > end) {
> +	while (e > cached_end) {
>  		if (e->canary != SMEM_PRIVATE_CANARY)
>  			goto invalid_canary;
>  
>  		if (le16_to_cpu(e->item) == item) {
> -			if (size != NULL) {
> -				e_size = le32_to_cpu(e->size);
> -				padding_data = le16_to_cpu(e->padding_data);
> +			e_size = le32_to_cpu(e->size);
> +			padding_data = le16_to_cpu(e->padding_data);
>  
> -				if (WARN_ON(e_size > part->size || padding_data > e_size))
> -					return ERR_PTR(-EINVAL);
> -
> -				*size = e_size - padding_data;
> -			}
> +			if (e_size < part->size && padding_data < e_size)
> +				entry_size  = e_size - padding_data;
> +			else
> +				return ERR_PTR(-EINVAL);
>  
> -			item_ptr = cached_entry_to_item(e);
> -			if (WARN_ON(item_ptr < (void *)phdr))
> +			item_ptr =  cached_entry_to_item(e);
> +			if (WARN_ON(!IN_PARTITION_RANGE(item_ptr, entry_size, cached_end, e)))
>  				return ERR_PTR(-EINVAL);
>  
> +			if (size != NULL)
> +				*size = entry_size;
> +
>  			return item_ptr;
>  		}
>  
> -		e = cached_entry_next(e, part->cacheline);
> +		next_e = cached_entry_next(e, part->cacheline);
> +		if (WARN_ON(next_e >= e))
> +			return ERR_PTR(-EINVAL);
> +
> +		e = next_e;
>  	}
>  
>  	if (WARN_ON((void *)e < (void *)phdr))
> 
> -- 
> 2.55.0
> 
