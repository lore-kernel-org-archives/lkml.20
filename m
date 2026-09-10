Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5F7485CCB
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789043288; cv=none; b=B/DWwysFjosZB2OVxFm9HN8dIdPw15ZDmAT3vjw+37LNUuJPBI5YdmYT8NSRBN+BXormI2qQdAnj4vrxTlF6f4k8v1mqgrsaf6YeaaTzI2F15yW6YyUxmJjGPMh7PnncOP9W/fJX5axhCChb+SlplBp057D0BwFzirO2e3AmoZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789043288; c=relaxed/simple;
	bh=o/DEm6hhOHxEiFxAOUmJzF/UqfDcU9pW2ZrALDBOWm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WqxOiuJ3RNDSvkBqYGHb1hnz5I95V6jPQeEv35jBdj3KbIcFWMNVyw0mCdr+b5LDHK7Ja5jGHeZhiMf9YKePXZ4zMVRRf7ccUTAvtl/Et+7Un4GKi7Aki6ePSLo+Ht1NsOsX2PiqgtJvnko71lI0IlhZoLMCjplAQRaXgVVlK7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rl49pUJs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rl49pUJs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04DC31F000FF;
	Thu, 10 Sep 2026 12:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789043286;
	bh=Q4bEjgbDb1gv1JLReYYbY4ojuS+Q+1rIOLGJ2NmcYXk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Rl49pUJsVzyQA8U1Z+ZMUoVTDgcSij0YNm8p40enI061R8nMbyWSzGdGPUn5NLC6Z
	 82Zi5rYBwU4xP7IfFfv+8nJerbSjQ86wn4d7z0c2/AYv2XV3whr5WlN+j/GTjQtAR3
	 0Bk99bcPaTj2nWp592BBSVp+et02gxreJnTGgPt109knrXKbcqXUD3iy4QTCQY0KUy
	 iLhrg8fO+beH6aU4UtRKpMtzRoUm3jK9t21mvIXFy4WLNE2q0cjP2wbXFVL+NsSjSj
	 e8ZT3Fzt3K0PpuBgdYAC6Ixsx1oSXH3j3qhX7W3+GlLGR8dbIaIA0hepcXim+ygIDa
	 tB2urKdwrsDIg==
Date: Thu, 10 Sep 2026 17:58:02 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Mahantesh Salimath <mahantesh@nvidia.com>
Cc: Jens Wiklander <jenswi@kernel.org>, op-tee@lists.trustedfirmware.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tee: optee: ffa: support shared memory offsets on
 large-page kernels
Message-ID: <aqKiUthQ-swgP5q7@sumit-xelite>
Mail-Followup-To: Mahantesh Salimath <mahantesh@nvidia.com>,
	Jens Wiklander <jenswi@kernel.org>,
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org
References: <20260904134732.1072541-1-mahantesh@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260904134732.1072541-1-mahantesh@nvidia.com>

On Fri, 04 Sep 2026 at 13:47:32 +0000, Mahantesh Salimath wrote:
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
> drivers/tee/optee/ffa_abi.c   | 66 +++++++++++++++++++++++++++++------
> drivers/tee/optee/optee_msg.h |  4 +--
> 2 files changed, 57 insertions(+), 13 deletions(-)
>
>diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/ffa_abi.c
>index 633715b98625..2a37e4899dc6 100644
>--- a/drivers/tee/optee/ffa_abi.c
>+++ b/drivers/tee/optee/ffa_abi.c
>@@ -187,6 +187,40 @@ static int optee_ffa_from_msg_param(struct optee *optee,
> 	return 0;
> }
>
>+/*
>+ * OP-TEE FF-A memory objects use 4 KiB pages while the kernel page size may
>+ * be larger, for example 64 KiB on arm64. The FF-A descriptor is registered
>+ * from the 4 KiB page containing the start of the shared buffer, so
>+ * internal_offs is the offset into that page.
>+ */
>+static void optee_ffa_set_internal_offs(struct optee_msg_param_fmem *fmem,
>+					struct tee_shm *shm)
>+{
>+	size_t page_offs = tee_shm_get_page_offset(shm);
>+
>+	BUILD_BUG_ON(PAGE_SIZE < FFA_PAGE_SIZE);
>+
>+	fmem->internal_offs = page_offs & (FFA_PAGE_SIZE - 1);
>+}
>+
>+/*
>+ * Keep shm_offs unchanged in offs_low/offs_high: it is returned to callers
>+ * and may be reused for a subsequent invocation.
>+ */
>+static int optee_ffa_set_fmem_offsets(struct optee_msg_param_fmem *fmem,
>+				      struct tee_shm *shm, u64 shm_offs)
>+{
>+	optee_ffa_set_internal_offs(fmem, shm);
>+
>+	fmem->offs_low = shm_offs;
>+	fmem->offs_high = shm_offs >> 32;
>+	/* Check that the entire offset could be stored. */
>+	if (fmem->offs_high != shm_offs >> 32)
>+		return -EINVAL;
>+
>+	return 0;
>+}
>+
> static int to_msg_param_ffa_mem(struct optee_msg_param *mp,
> 				const struct tee_param *p)
> {
>@@ -196,14 +230,8 @@ static int to_msg_param_ffa_mem(struct optee_msg_param *mp,
> 		   TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT;
>
> 	if (shm) {
>-		u64 shm_offs = p->u.memref.shm_offs;
>-
>-		mp->u.fmem.internal_offs = shm->offset;
>-
>-		mp->u.fmem.offs_low = shm_offs;
>-		mp->u.fmem.offs_high = shm_offs >> 32;
>-		/* Check that the entire offset could be stored. */
>-		if (mp->u.fmem.offs_high != shm_offs >> 32)
>+		if (optee_ffa_set_fmem_offsets(&mp->u.fmem, shm,
>+					       p->u.memref.shm_offs))
> 			return -EINVAL;
>

This all can rather be simplified below, lots of indirection here.

diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/ffa_abi.c
index 633715b98625..b9dcd2e2e28b 100644
--- a/drivers/tee/optee/ffa_abi.c
+++ b/drivers/tee/optee/ffa_abi.c
@@ -198,8 +198,8 @@ static int to_msg_param_ffa_mem(struct optee_msg_param *mp,
         if (shm) {
                 u64 shm_offs = p->u.memref.shm_offs;
  
-               mp->u.fmem.internal_offs = shm->offset;
-
+               mp->u.fmem.internal_offs = tee_shm_get_page_offset(shm) &
+                                          (FFA_PAGE_SIZE - 1);
                 mp->u.fmem.offs_low = shm_offs;
                 mp->u.fmem.offs_high = shm_offs >> 32;
                 /* Check that the entire offset could be stored. */

> 		mp->u.fmem.global_id = shm->sec_world_id;
>@@ -284,14 +312,30 @@ static int optee_ffa_shm_register(struct tee_context *ctx, struct tee_shm *shm,
> 		.nattrs = 1,
> 	};
> 	struct sg_table sgt;
>+	size_t page_offs;
>+	size_t ffa_offs;
>+	size_t ffa_size;
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
>+	page_offs = tee_shm_get_page_offset(shm);
>+	ffa_offs = round_down(page_offs, FFA_PAGE_SIZE);
>+	ffa_size = num_pages * PAGE_SIZE - ffa_offs;

Avoid redundant variables which are used only once.

>+
>+	/*
>+	 * Start the FF-A descriptor at the 4 KiB page containing the shared
>+	 * buffer, skipping unused leading 4 KiB pages when PAGE_SIZE is
>+	 * larger. Same approach as optee_fill_pages_list() in the SMC ABI.
>+	 * This leaves only page_offs & (FFA_PAGE_SIZE - 1) for internal_offs.
>+	 */
>+	rc = sg_alloc_table_from_pages(&sgt, pages, num_pages, ffa_offs,
>+				       ffa_size, GFP_KERNEL);
> 	if (rc)
> 		return rc;
> 	args.sg = sgt.sgl;
>@@ -458,8 +502,8 @@ static void handle_ffa_rpc_func_cmd_shm_alloc(struct tee_context *ctx,
> 		.attr = OPTEE_MSG_ATTR_TYPE_FMEM_OUTPUT,
> 		.u.fmem.size = tee_shm_get_size(shm),
> 		.u.fmem.global_id = shm->sec_world_id,
>-		.u.fmem.internal_offs = shm->offset,
> 	};
>+	optee_ffa_set_internal_offs(&arg->params[0].u.fmem, shm);

Ditto, directly inline the masking here.

-Sumit

>
> 	arg->ret = TEEC_SUCCESS;
> }
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
