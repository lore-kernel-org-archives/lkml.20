Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BD82FD69E
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789032217; cv=none; b=eX2Vc8/SaAYf3gedRcmaHnIopUzIw8hOLLAjT9ihsAJ7augwQAHnPb7D7bn38HokfkBGTFgRl4pL+TeHIjmVLKOBZfQcXhnvJP4uSW7xTqWhB0GRDhEEpisT98j708sBMDrF2NNbSGUm3JdEethN2KF5slkzE1gR6XzLeO/vUDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789032217; c=relaxed/simple;
	bh=3h6dOaWn9MbzfnZmkrI8RhpI7ycb2SvYmH3VMy/0T0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uV8VJ2BmtXpdvXDYsHJJNzidAEj+Wo81UGDwnZzyEDvX54X1/WrAiJ0aBavDWnAcLxpJWzkK1c+nNH0xADf69xPD2DH/l3lSzW/0CzH5o5r4A8+xgFkZlmwvbBnV3dubONXmoP4CvN+48SmZv5R4xZFIgdZlWxkXa7kBimE1guE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KyTwAc6e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KyTwAc6e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B75811F000FF;
	Thu, 10 Sep 2026 09:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789032215;
	bh=CBK8bp8Jw50Wx0Cwsv2CkCMUmnFWUqrGVXgO0hUGIS4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KyTwAc6e4cH6wmMAK6Eff7Xf/UtjdaC6WVegf0hPGjlFCvdXAk2PxaTHv/Yt6xf5l
	 g3jFLEwiU0oaNIyLtL+jj/uQfAuS3pE9fYss/H4MQtVC8jTExP7RugNZy/eJtMcNaD
	 ZJYoZ4boZCuxsbH4pkAeGvZzgLpVeMehgecE+b54EtjS0mpaR7fv/3DiDO49nanO0p
	 Kuq56QNnZI0txYJmjY1eVJX/9hyXIT/075/d72MU0g8T8R9dmyl4lzcrDQKrFzSApG
	 1dOgQok6BPDKoC4Lwpmw1bvcQ4Z7/CvLAGxYVdqu7NTTMEfQYZ6uE57sOr0cHITz2h
	 q983vXA6+WzvQ==
Date: Thu, 10 Sep 2026 14:53:31 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Andrew Davis <afd@ti.com>
Cc: Jens Wiklander <jenswi@kernel.org>, op-tee@lists.trustedfirmware.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] tee: move tee_ioctl_shm_register_data to above
 IOCTL definition
Message-ID: <aqJ3E4-vfMWhuQxU@sumit-xelite>
Mail-Followup-To: Andrew Davis <afd@ti.com>,
	Jens Wiklander <jenswi@kernel.org>,
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org
References: <20260903181251.1912165-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260903181251.1912165-1-afd@ti.com>


On Thu, 03 Sep 2026 at 13:12:51 -0500, Andrew Davis wrote:
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
>
>Resending using folks updated emails :)

Ah, I see this update now. FWIW:

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

-Sumit

>
> include/uapi/linux/tee.h | 40 ++++++++++++++++++++--------------------
> 1 file changed, 20 insertions(+), 20 deletions(-)
>
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
