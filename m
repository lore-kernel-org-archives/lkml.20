Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97E23DA5DA
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789031637; cv=none; b=PUBvU4yQk1bbHVLhp5cgWklJpIWGTJ+tI6uWeS+DF6lp4OdbmzblbiqAL3STm4Gf7+puxGrdlQsu7s1+KBbA5F9RVca/CUmTilPq5gnzXORVRcJZAl4RWvkT5DFc7J2DtA7k3FUUtcQogVmGaIXD5Onrz1JBkY044BBCcptYp4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789031637; c=relaxed/simple;
	bh=nMZBoNXkQlQS/WPoABbPQUqiyJGDCgy6yHUOVaPwAbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Drv3aA2VjsDFY+yBxCOVh8dmoOXNoyIgL4yHhAUAYDyOcMwCBBTrA6nZGg+4xoFeQ0FT75tzPp78QSzzstzDWuvFXQtCEcmq1ereCY6v0U3CVSMyVkwxBFxrWduQ9tepu+vr4N930LRRFgIZiXw5kiGrz+TEZhVMdFw9EujL4FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CJIptjZR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CJIptjZR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2872B1F000FF;
	Thu, 10 Sep 2026 09:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789031629;
	bh=56FTR3CNCz14tunVZgA5Dwrb7IctTYvmcWBAPlPQ+CU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CJIptjZRuGOqBFRKmUXA4yyCOtMnBCId91HOnDqrpUv04nqO8lkxk9B8AJTz22VAc
	 SpDh/DNy6Y86gzqcP+5WXOiHM4wZJjaZxkMsruEvXPX45o7KXXuBS7g+yMvjJypx6b
	 1KdY/PZ6TIxtVseUMq6hy4Ng2QHgN7Iqq0N+KRQ/MMznqskpZ64kL1yHuSHZVmsWo8
	 a4dzHpjIFThSin9Fg9Ua6WeQ3hgtVGjrJ53swlaBTlLzt5PXOO2mEOK6dy+sVlFnXZ
	 r3T9L4QwKit372bhw+lGxS+LHXF6p4E2Kb6+8HErBMFA6BiB08jFXvt8TIY2YYsDWO
	 bxdJoczzAGvUw==
Date: Thu, 10 Sep 2026 14:43:44 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Andrew Davis <afd@ti.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
	Sumit Garg <sumit.garg@linaro.org>,
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tee: move tee_ioctl_shm_register_data to above IOCTL
 definition
Message-ID: <aqJ0yCHd03ZLsSMT@sumit-xelite>
Mail-Followup-To: Andrew Davis <afd@ti.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Sumit Garg <sumit.garg@linaro.org>,
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org
References: <20260903175730.1909952-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260903175730.1909952-1-afd@ti.com>

On Thu, 03 Sep 2026 at 12:57:30 -0500, Andrew Davis via OP-TEE wrote:
>Most of the struct definitions for a given IOCTL definition immediately
>preceded that definition. The struct tee_ioctl_shm_register_data is an
>exception as it is placed above the TEE_IOC_SHM_REGISTER_FD definition,
>not the TEE_IOC_SHM_REGISTER one it is to be used with. Move it down
>to match the others.
>
>This is a non-functional change for consistency and to help prevent
>someone from accidentally using the wrong struct with the wrong IOCTL
>based on the struct's location.
>
>Fix a couple small spelling issues while here.
>
>Signed-off-by: Andrew Davis <afd@ti.com>
>---
> include/uapi/linux/tee.h | 40 ++++++++++++++++++++--------------------
> 1 file changed, 20 insertions(+), 20 deletions(-)
>

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

-Sumit

>diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
>index 5203977ed35d1..76815b0f4b665 100644
>--- a/include/uapi/linux/tee.h
>+++ b/include/uapi/linux/tee.h
>@@ -384,24 +384,6 @@ struct tee_iocl_supp_send_arg {
> #define TEE_IOC_SUPPL_SEND	_IOR(TEE_IOC_MAGIC, TEE_IOC_BASE + 7, \
> 				     struct tee_ioctl_buf_data)
>
>-/**
>- * struct tee_ioctl_shm_register_data - Shared memory register argument
>- * @addr:      [in] Start address of shared memory to register
>- * @length:    [in/out] Length of shared memory to register
>- * @flags:     [in/out] Flags to/from registration.
>- * @id:                [out] Identifier of the shared memory
>- *
>- * The flags field should currently be zero as input. Updated by the call
>- * with actual flags as defined by TEE_IOCTL_SHM_* above.
>- * This structure is used as argument for TEE_IOC_SHM_REGISTER below.
>- */
>-struct tee_ioctl_shm_register_data {
>-	__u64 addr;
>-	__u64 length;
>-	__u32 flags;
>-	__s32 id;
>-};
>-
> /**
>  * struct tee_ioctl_shm_register_fd_data - Shared memory registering argument
>  * @fd:		[in] File descriptor identifying dmabuf reference
>@@ -426,13 +408,31 @@ struct tee_ioctl_shm_register_fd_data {
>  * Returns a file descriptor on success or < 0 on failure
>  *
>  * The returned file descriptor refers to the shared memory object in the
>- * kernel. The supplied file deccriptor can be closed if it's not needed
>+ * kernel. The supplied file descriptor can be closed if it's not needed
>  * for other purposes. The shared memory is freed when the descriptor is
>  * closed.
>  */
> #define TEE_IOC_SHM_REGISTER_FD	_IOWR(TEE_IOC_MAGIC, TEE_IOC_BASE + 8, \
> 				     struct tee_ioctl_shm_register_fd_data)
>
>+/**
>+ * struct tee_ioctl_shm_register_data - Shared memory register argument
>+ * @addr:      [in] Start address of shared memory to register
>+ * @length:    [in/out] Length of shared memory to register
>+ * @flags:     [in/out] Flags to/from registration.
>+ * @id:                [out] Identifier of the shared memory
>+ *
>+ * The flags field should currently be zero as input. Updated by the call
>+ * with actual flags as defined by TEE_IOCTL_SHM_* above.
>+ * This structure is used as argument for TEE_IOC_SHM_REGISTER below.
>+ */
>+struct tee_ioctl_shm_register_data {
>+	__u64 addr;
>+	__u64 length;
>+	__u32 flags;
>+	__s32 id;
>+};
>+
> /**
>  * TEE_IOC_SHM_REGISTER - Register shared memory argument
>  *
>@@ -440,7 +440,7 @@ struct tee_ioctl_shm_register_fd_data {
>  *
>  * Returns a file descriptor on success or < 0 on failure
>  *
>- * The shared memory is unregisterred when the descriptor is closed.
>+ * The shared memory is unregistered when the descriptor is closed.
>  */
> #define TEE_IOC_SHM_REGISTER   _IOWR(TEE_IOC_MAGIC, TEE_IOC_BASE + 9, \
> 				     struct tee_ioctl_shm_register_data)
>-- 
>2.39.2
>
