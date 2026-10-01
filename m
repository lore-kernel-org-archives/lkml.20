Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9B95187D9;
	Thu,  1 Oct 2026 12:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858644; cv=none; b=kXMjI0FYIKG/nXHhlDuLbI6RXyfdcvce7p+kFty1++azdwuC7qc8g2VxmMSBKGAwC+VXFtiEeQdF9hUb9Jt7lL54aiNK9Cs6qhASmPsh1P/0nm8aMYWTpSD2O+MFrG1iv1gyHirFOBndH4EWbdm4YbbnIx9NsizZOdavT1sfnJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858644; c=relaxed/simple;
	bh=t+0B/sAQ3S+l9NYVbZtcH2UUvZ95WL4OO/xfo3lJYEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mcsZSW4U7kOtwlTNbCxehsuTRzmqpj0bWh6p9SHUnrH19wqrnLwjoGdF+jO1Qicqifh7L0x8DZ0U98VOLL34sgHvNUwFj/Ae1eXTBgr0gVGP69sGRk4P+Kf4dsZf0QY+Voya2JgDUTIk5fI0efErhaljLW8NsCw1ll7Wy+dDCJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lw3yNYuW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lw3yNYuW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27DDA1F00899;
	Thu,  1 Oct 2026 12:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790858642;
	bh=rXN5Orvh6wcqwDgLUoyOl8q44kbcCZ04cp0WYtrNd28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lw3yNYuWneYsXq36Dz0QRT4eJVGomNCaXLPibAKzTAn2zplZLxvZhtownDL11Arzq
	 YJ2bV3rgHjWp0l25u9LdG5xUHC1ZihTOylnvjhNXwZm0OOETpCnislnIaF/aEksuKu
	 9K8dO+LztHyXmnyYyeqLJXDTYvR4ZhtTp9Gjin5SJR0e3oZhnG5BL46U2b3VriEsxr
	 msd8lUUmlIvGcLXQqFIetvfqRUvSHiFnvXtsjfN1GKz95wNgOqNz9Wsexl3ViGlX/r
	 9odGos4HXVs5aMy4692DLEdP3acrLIs9GHpZedmF+WA5LWpsTM/mRsQJ/Iham3wXY8
	 gx47hXTX8hnGQ==
Date: Thu, 1 Oct 2026 18:13:55 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Harshal Dev <harshal.dev@oss.qualcomm.com>
Cc: Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
	Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
	Basant Kumar <basantk@qti.qualcomm.com>,
	Apurupa Pattapu <apurupa@qti.qualcomm.com>,
	Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 2/6] tee: Add kernel client object invoke helper
Message-ID: <ar5Vi8ccysSh4fQ1@sumit-xelite>
Mail-Followup-To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
	Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
	Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
	Basant Kumar <basantk@qti.qualcomm.com>,
	Apurupa Pattapu <apurupa@qti.qualcomm.com>,
	Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
References: <20261001-qcom_uefisecapp_migrate_qcomtee-v3-0-13df5c20c2e3@oss.qualcomm.com>
 <20261001-qcom_uefisecapp_migrate_qcomtee-v3-2-13df5c20c2e3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20261001-qcom_uefisecapp_migrate_qcomtee-v3-2-13df5c20c2e3@oss.qualcomm.com>

On Thu, 01 Oct 2026 at 16:32:34 +0530, Harshal Dev wrote:
>From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>
>Kernel clients can open a TEE context and invoke regular TA commands
>through tee_client_invoke_func(). However, there is currently no
>equivalent helper for invoking TEE objects.
>
>Add tee_client_object_invoke_func() as a kernel client API for issuing
>object invocation requests. The helper checks that the backend provides
>object_invoke_func() before forwarding the request by setting the origin
>as TEE_OBJECT_INVOKE_KERNEL. This allows TEE backends to support
>privileged object-based calls from the kernel-space.
>
>Co-developed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>---
> drivers/tee/tee_core.c  | 12 ++++++++++++
> include/linux/tee_drv.h | 13 +++++++++++++
> 2 files changed, 25 insertions(+)

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

-Sumit

>
>diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
>index 30901390149c..a03a3d645dd1 100644
>--- a/drivers/tee/tee_core.c
>+++ b/drivers/tee/tee_core.c
>@@ -1404,6 +1404,18 @@ int tee_client_invoke_func(struct tee_context *ctx,
> }
> EXPORT_SYMBOL_GPL(tee_client_invoke_func);
>
>+int tee_client_object_invoke_func(struct tee_context *ctx,
>+				  struct tee_ioctl_object_invoke_arg *arg,
>+				  struct tee_param *param)
>+{
>+	if (!ctx->teedev->desc->ops->object_invoke_func)
>+		return -EINVAL;
>+
>+	return ctx->teedev->desc->ops->object_invoke_func(ctx, arg, param,
>+							  TEE_OBJECT_INVOKE_KERNEL);
>+}
>+EXPORT_SYMBOL_GPL(tee_client_object_invoke_func);
>+
> int tee_client_cancel_req(struct tee_context *ctx,
> 			  struct tee_ioctl_cancel_arg *arg)
> {
>diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
>index f3c5e106d853..369c87ad0205 100644
>--- a/include/linux/tee_drv.h
>+++ b/include/linux/tee_drv.h
>@@ -283,6 +283,19 @@ int tee_client_invoke_func(struct tee_context *ctx,
> 			   struct tee_ioctl_invoke_arg *arg,
> 			   struct tee_param *param);
>
>+/**
>+ * tee_client_object_invoke_func() - Invoke a TEE object from kernel space
>+ * @ctx:    TEE Context
>+ * @arg:    Invoke arguments, see description of
>+ *          struct tee_ioctl_object_invoke_arg
>+ * @param:  Parameters for the object invocation
>+ *
>+ * Return: On success, returns 0; on failure, returns < 0.
>+ */
>+int tee_client_object_invoke_func(struct tee_context *ctx,
>+				  struct tee_ioctl_object_invoke_arg *arg,
>+				  struct tee_param *param);
>+
> /**
>  * tee_client_cancel_req() - Request cancellation of the previous open-session
>  * or invoke-command operations in a Trusted Application
>
>-- 
>2.34.1
>
