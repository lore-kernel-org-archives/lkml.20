Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38F34973BD
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789993509; cv=none; b=QFL9pzX7NZvqEZ2zyJzJEorAGq682f6ZrCYFwgJ+88Y001x2Zl/nhJkGE6ylziKU7geKn+9/JMx1c1f46c4idZdVXZayM7b7T/C+ACsrJxmMFbMVjAq9TKqJ2NHXSQCdOxI9O6jmIJtEJ17BUDwyrYj6ThleiNRhLVrw4K/OJFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789993509; c=relaxed/simple;
	bh=Y5U2M0IMBc45XTMcbO64QLv1LrJr5qtSmRYz5xM4BsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IwPUgfJyhpQCu9PsvlaH1mWdE6LjsVw6FK9sozoG1vkqnd0+A8DrbvO+KECl43WR1T+h1E4s68rEiR3jQ+UNSFYAG+AI+rNGsxaXmlfZ3Bri/IOSKW1oE74Nc35soYa4JKzqM+RbVH5ioDrW8rVVLVuUjykQzrS+LmY2bzmZoDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iNj6P50U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iNj6P50U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AD7A1F000FF;
	Mon, 21 Sep 2026 12:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789993505;
	bh=1M6p5SOy+SM0nOL2SmY16j3B6xH1lik+zLKQU4/iFH8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iNj6P50UtRgQl2RU7gqsAGidmnThd6QdCIOvkbBRbf/0BE6OIZbomw4twQQLLngqD
	 P7lpuahOvCgxP8soBxNKczoacZ+EFeAgzvxVhBt32IRjBsO0PtRyyR/N5I08ozroKm
	 VvLogotQf7osq6E+/NWiXZ56nqljL2IBMhC5cnf2LMhwWHfunbfHh5OC+bXC4Zt5Us
	 +uxXmWX1m8g7mI/9piFMSd+RquSont/e8ZEJV2GDjO60IXL58wZemyMZRbSldqHxcC
	 XA4KZrvSeV/mCrC+J05Jrnb9TmvnQz6vTf0OkXjmvbSiWhXTgQD9LLKDekoO0kVqaN
	 ynpT0Ib1KJpcg==
Date: Mon, 21 Sep 2026 17:55:00 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Mahantesh Salimath <mahantesh@nvidia.com>
Cc: Jens Wiklander <jenswi@kernel.org>, op-tee@lists.trustedfirmware.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] tee: optee: ffa: support shared memory offsets on
 large-page kernels
Message-ID: <arEiHFtNB3p6g4WB@sumit-xelite>
Mail-Followup-To: Mahantesh Salimath <mahantesh@nvidia.com>,
	Jens Wiklander <jenswi@kernel.org>,
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org
References: <20260904134732.1072541-1-mahantesh@nvidia.com>
 <20260910161124.1561170-1-mahantesh@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260910161124.1561170-1-mahantesh@nvidia.com>

On Thu, 10 Sep 2026 at 16:11:24 +0000, Mahantesh Salimath wrote:
>OP-TEE FF-A memory objects use 4 KiB pages, while the kernel page
>size may be larger. Consequently, tee_shm->offset can be greater than
>or equal to FFA_PAGE_SIZE, but OP-TEE rejects such a value in
>internal_offs.
>
>Do not encode the excess page offset in offs_low/offs_high. Those
>fields describe the logical memref offset and are copied back into
>tee_param->shm_offs on return. Folding the page offset into them breaks
>parameter round trips when a memref is reused. They are also ignored by
>the OPTEE_RPC_CMD_SHM_ALLOC response path, which uses only global_id and
>internal_offs to construct the shared-memory mobj.
>
>Instead, start the FF-A descriptor at the 4 KiB page containing the
>shared buffer, the same approach as optee_fill_pages_list() in the SMC
>ABI. Store the remaining in-page offset in internal_offs and preserve
>shm_offs in offs_low/offs_high. This keeps internal_offs within the
>FF-A page size, maps RPC allocations at the correct address, and
>preserves normal memref offsets across repeated invocations.
>
>Tested on ARMv8-A with 64 KiB PAGE_SIZE. OP-TEE OS ran as a secure
>partition under Hafnium (SPMC) over FF-A. Verified registered shared
>memory with tee_shm->offset >= 4 KiB, memref reuse on the same
>TEEC_Operation, and RPC OPTEE_RPC_CMD_SHM_ALLOC (xtest regression
>6007-6009). optee_hello_world, optee_aes, and xtest regression 1005,
>1007, 1008, 4001-4003 and 6001-6003 also passed.
>
>Fixes: 4615e5a34b95 ("optee: add FF-A support")
>Acked-by: Liming Sun <limings@nvidia.com>
>Acked-by: James Hurley <jahurley@nvidia.com>
>Acked-by: Dave Thompson <davthompson@nvidia.com>
>Signed-off-by: Mahantesh Salimath <mahantesh@nvidia.com>
>---
>v2:
>- Drop helper indirection; mask internal_offs inline (Sumit Garg)
>- Keep a single ffa_offs local in optee_ffa_shm_register()
>
>Link: https://lore.kernel.org/lkml/20260904134732.1072541-1-mahantesh@nvidia.com/
>
> drivers/tee/optee/ffa_abi.c   | 22 ++++++++++++++++++----
> drivers/tee/optee/optee_msg.h |  4 ++--
> 2 files changed, 20 insertions(+), 6 deletions(-)

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

-Sumit

>
>diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/ffa_abi.c
>index 633715b98625..fdedcab50f23 100644
>--- a/drivers/tee/optee/ffa_abi.c
>+++ b/drivers/tee/optee/ffa_abi.c
>@@ -198,7 +198,8 @@ static int to_msg_param_ffa_mem(struct optee_msg_param *mp,
> 	if (shm) {
> 		u64 shm_offs = p->u.memref.shm_offs;
>
>-		mp->u.fmem.internal_offs = shm->offset;
>+		mp->u.fmem.internal_offs = tee_shm_get_page_offset(shm) &
>+					   (FFA_PAGE_SIZE - 1);
>
> 		mp->u.fmem.offs_low = shm_offs;
> 		mp->u.fmem.offs_high = shm_offs >> 32;
>@@ -284,14 +285,26 @@ static int optee_ffa_shm_register(struct tee_context *ctx, struct tee_shm *shm,
> 		.nattrs = 1,
> 	};
> 	struct sg_table sgt;
>+	size_t ffa_offs;
> 	int rc;
>
>+	if (!num_pages)
>+		return -EINVAL;
>+
> 	rc = optee_check_mem_type(start, num_pages);
> 	if (rc)
> 		return rc;
>
>-	rc = sg_alloc_table_from_pages(&sgt, pages, num_pages, 0,
>-				       num_pages * PAGE_SIZE, GFP_KERNEL);
>+	/*
>+	 * Start the FF-A descriptor at the 4 KiB page containing the shared
>+	 * buffer, skipping unused leading 4 KiB pages when PAGE_SIZE is
>+	 * larger. Same approach as optee_fill_pages_list() in the SMC ABI.
>+	 * This leaves only the offset into that 4 KiB page for internal_offs.
>+	 */
>+	ffa_offs = round_down(tee_shm_get_page_offset(shm), FFA_PAGE_SIZE);
>+	rc = sg_alloc_table_from_pages(&sgt, pages, num_pages, ffa_offs,
>+				       num_pages * PAGE_SIZE - ffa_offs,
>+				       GFP_KERNEL);
> 	if (rc)
> 		return rc;
> 	args.sg = sgt.sgl;
>@@ -458,7 +471,8 @@ static void handle_ffa_rpc_func_cmd_shm_alloc(struct tee_context *ctx,
> 		.attr = OPTEE_MSG_ATTR_TYPE_FMEM_OUTPUT,
> 		.u.fmem.size = tee_shm_get_size(shm),
> 		.u.fmem.global_id = shm->sec_world_id,
>-		.u.fmem.internal_offs = shm->offset,
>+		.u.fmem.internal_offs = tee_shm_get_page_offset(shm) &
>+					(FFA_PAGE_SIZE - 1),
> 	};
>
> 	arg->ret = TEEC_SUCCESS;
>diff --git a/drivers/tee/optee/optee_msg.h b/drivers/tee/optee/optee_msg.h
>index 7d9b12e71c03..6c3043f8da33 100644
>--- a/drivers/tee/optee/optee_msg.h
>+++ b/drivers/tee/optee/optee_msg.h
>@@ -136,8 +136,8 @@ struct optee_msg_param_rmem {
>  * struct optee_msg_param_fmem - FF-A memory reference parameter
>  * @offs_low:		lower bits of offset into shared memory reference
>  * @offs_high:		higher bits of offset into shared memory reference
>- * @internal_offs:	internal offset into the first page of shared memory
>- *			reference
>+ * @internal_offs:	offset into the first 4 KiB page of the FF-A shared
>+ *			memory region
>  * @size:		size of the buffer
>  * @global_id:		global identifier of the shared memory
>  */
>-- 
>2.43.0
>
