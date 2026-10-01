Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37FF331209;
	Thu,  1 Oct 2026 12:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858875; cv=none; b=d+3xdIr7u37Iub5rCpq5ddVcCyuy32WgYJlClNWjKJcAzMO6qm4j+2ouyjolM6RNiVCarWHil5/ROBUZA1xfUQVxFX2vz5vUBZhPhh+1EmDdbv0V6elWmDCQk+5g+eNBWIGpigGHTNOKIveMujySsIW8USfRmYbJ4BP2bRiiPas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858875; c=relaxed/simple;
	bh=C/a+BCNKjiJqGxIvspHg8Oa9sIw0CltanatdAqCPbuo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fx/uKiix+wCyFsmNWvWrkCWEUTGn8BiztLF5Yz2Lzxy2KQgD0Lw38gOSjEYklGwnL+Tk7ZZcbRooRRnbXI6G0pbq1j3vDuuRYU58ECMlHfdwfwykWpn6ErcWFJ06Vg8DwI5r08oP2Wf30WrOvSy1QGGGRen+OcOx+uNIiIYO7+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yfqn/mBu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yfqn/mBu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 031961F000FF;
	Thu,  1 Oct 2026 12:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790858873;
	bh=HM9xaKm75iHB1jueHcwqdbWn6Lp/O/gNvxajH9JPnTs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Yfqn/mBuWdeWEsetuiGqwLPvVWz//IiDPGDY3lR30HJk86SG//Zq56vprY9rv5PiA
	 CUeFTPzjwQqQl4yp7apsr72dK3a2C4jdPpFQeOTW7MWxp7z3XMP+DDK7v6y+oR2HjN
	 NmdR1LN6b7m8Cf1mr7LVjsUw7m9Ok0Opfv6RN2yK3MZoGbTOMGE1gld85gJbW5yPsE
	 MoSqGS06yKOl2743R/CDYQEki8DTdHmIhQlLd3/as/ABRb1RejWA6SGVUx/DZInJyt
	 tX2YNw9NrRANrw9V2LsqVxxKG4xm2nwTupAstRwflxJ1agEl/soQZRb1r1a7ecbrod
	 NSSrraJqfesCA==
Date: Thu, 1 Oct 2026 18:17:46 +0530
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
Subject: Re: [PATCH v3 3/6] tee: qcomtee: Allow object invokes from kernel
 clients
Message-ID: <ar5Wcpom0Ex29Sl5@sumit-xelite>
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
 <20261001-qcom_uefisecapp_migrate_qcomtee-v3-3-13df5c20c2e3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20261001-qcom_uefisecapp_migrate_qcomtee-v3-3-13df5c20c2e3@oss.qualcomm.com>

On Thu, 01 Oct 2026 at 16:32:35 +0530, Harshal Dev wrote:
>From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>
>QCOMTEE currently treats UBUF parameters as userspace addresses and
>applies userspace restrictions when invoking the root object. This is
>not suitable for object invocation requests issued by kernel clients.
>
>Use the kernel_ctx flag to distinguish kernel client requests from
>userspace requests. For kernel contexts, do not mark UBUF parameters as
>user addresses, and allow permitted root-object operations to proceed
>without applying the userspace-only checks.
>
>This allows in-kernel users of tee_client_object_invoke_func() to issue
>object invocation requests through the qcomtee backend.
>
>Co-developed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>---
> drivers/tee/qcomtee/call.c           | 34 +++++++++++++++++++++++-----------
> drivers/tee/qcomtee/qcomtee_object.h |  5 +++--
> include/linux/tee_drv.h              |  5 ++++-
> 3 files changed, 30 insertions(+), 14 deletions(-)

Acked-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

-Sumit

>
>diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
>index a0f2992c0611..b361d9c04de0 100644
>--- a/drivers/tee/qcomtee/call.c
>+++ b/drivers/tee/qcomtee/call.c
>@@ -202,7 +202,7 @@ int qcomtee_objref_from_arg(struct tee_param *param, struct qcomtee_arg *arg,
>  */
> static int qcomtee_params_to_args(struct qcomtee_arg *u,
> 				  struct tee_param *params, int num_params,
>-				  struct tee_context *ctx)
>+				  struct qcomtee_object_invoke_ctx *oic)
> {
> 	int i;
>
>@@ -210,8 +210,14 @@ static int qcomtee_params_to_args(struct qcomtee_arg *u,
> 		switch (params[i].attr) {
> 		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
> 		case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
>-			u[i].flags = QCOMTEE_ARG_FLAGS_UADDR;
>-			u[i].b.uaddr = params[i].u.ubuf.uaddr;
>+			if (oic->kernel_ctx) {
>+				u[i].flags = 0;
>+				u[i].b.addr = params[i].u.ubuf.addr;
>+			} else {
>+				u[i].flags = QCOMTEE_ARG_FLAGS_UADDR;
>+				u[i].b.uaddr = params[i].u.ubuf.uaddr;
>+			}
>+
> 			u[i].b.size = params[i].u.ubuf.size;
>
> 			if (params[i].attr ==
>@@ -223,7 +229,7 @@ static int qcomtee_params_to_args(struct qcomtee_arg *u,
> 			break;
> 		case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT:
> 			u[i].type = QCOMTEE_ARG_TYPE_IO;
>-			if (qcomtee_objref_to_arg(&u[i], &params[i], ctx))
>+			if (qcomtee_objref_to_arg(&u[i], &params[i], oic->ctx))
> 				goto out_failed;
>
> 			break;
>@@ -270,7 +276,7 @@ static int qcomtee_params_to_args(struct qcomtee_arg *u,
>  */
> static int qcomtee_params_from_args(struct tee_param *params,
> 				    struct qcomtee_arg *u, int num_params,
>-				    struct tee_context *ctx)
>+				    struct qcomtee_object_invoke_ctx *oic)
> {
> 	int i, np;
>
>@@ -288,7 +294,8 @@ static int qcomtee_params_from_args(struct tee_param *params,
> 			break;
> 		case QCOMTEE_ARG_TYPE_OO:
> 			/* TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT */
>-			if (qcomtee_objref_from_arg(&params[np], &u[np], ctx))
>+			if (qcomtee_objref_from_arg(&params[np], &u[np],
>+						    oic->ctx))
> 				goto out_failed;
>
> 			break;
>@@ -304,7 +311,7 @@ static int qcomtee_params_from_args(struct tee_param *params,
> 	/* Undo qcomtee_objref_from_arg(). */
> 	for (i = 0; i < np; i++) {
> 		if (params[i].attr == TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT)
>-			qcomtee_context_del_qtee_object(&params[i], ctx);
>+			qcomtee_context_del_qtee_object(&params[i], oic->ctx);
> 	}
>
> 	/* Release any IO and OO objects not processed. */
>@@ -357,7 +364,8 @@ static int qcomtee_params_check(struct tee_param *params, int num_params)
> }
>
> /* Check if an operation on ROOT_QCOMTEE_OBJECT from userspace is permitted. */
>-static int qcomtee_root_object_check(u32 op, struct tee_param *params,
>+static int qcomtee_root_object_check(struct qcomtee_object_invoke_ctx *oic,
>+				     u32 op, struct tee_param *params,
> 				     int num_params)
> {
> 	/* Some privileged operations recognized by QTEE. */
>@@ -366,6 +374,9 @@ static int qcomtee_root_object_check(u32 op, struct tee_param *params,
> 	    op == QCOMTEE_ROOT_OP_ADCI_SHUTDOWN)
> 		return -EINVAL;
>
>+	if (oic->kernel_ctx)
>+		return 0;
>+
> 	/*
> 	 * QCOMTEE_ROOT_OP_REG_WITH_CREDENTIALS is to register with QTEE
> 	 * by passing a credential object as input OBJREF. TEE_OBJREF_NULL as a
>@@ -429,7 +440,8 @@ static int qcomtee_object_invoke(struct tee_context *ctx,
> 	/* Get an object to invoke. */
> 	if (arg->id == TEE_OBJREF_NULL) {
> 		/* Use ROOT if TEE_OBJREF_NULL is invoked. */
>-		if (qcomtee_root_object_check(arg->op, params, arg->num_params))
>+		if (qcomtee_root_object_check(oic, arg->op, params,
>+					      arg->num_params))
> 			return -EINVAL;
>
> 		object = ROOT_QCOMTEE_OBJECT;
>@@ -437,7 +449,7 @@ static int qcomtee_object_invoke(struct tee_context *ctx,
> 		return -EINVAL;
> 	}
>
>-	ret = qcomtee_params_to_args(u, params, arg->num_params, ctx);
>+	ret = qcomtee_params_to_args(u, params, arg->num_params, oic);
> 	if (ret)
> 		goto out;
>
>@@ -455,7 +467,7 @@ static int qcomtee_object_invoke(struct tee_context *ctx,
>
> 	if (!result) {
> 		/* Assume service is UNAVAIL if unable to process the result. */
>-		if (qcomtee_params_from_args(params, u, arg->num_params, ctx))
>+		if (qcomtee_params_from_args(params, u, arg->num_params, oic))
> 			result = QCOMTEE_MSG_ERROR_UNAVAIL;
> 	} else {
> 		/*
>diff --git a/drivers/tee/qcomtee/qcomtee_object.h b/drivers/tee/qcomtee/qcomtee_object.h
>index 5f40617361fc..d3740099fae0 100644
>--- a/drivers/tee/qcomtee/qcomtee_object.h
>+++ b/drivers/tee/qcomtee/qcomtee_object.h
>@@ -113,8 +113,9 @@ struct qcomtee_buffer {
>  * @b: address and size if the type of argument is a buffer.
>  * @o: object instance if the type of argument is an object.
>  *
>- * &qcomtee_arg.flags only accepts %QCOMTEE_ARG_FLAGS_UADDR for now, which
>- * states that &qcomtee_arg.b contains a userspace address in uaddr.
>++ * If %QCOMTEE_ARG_FLAGS_UADDR is set in &qcomtee_arg.flags then it implies
>++ * that &qcomtee_arg.b contains a userspace address in uaddr.
>++ * Otherwise, &qcomtee_arg.b contains a kernel address in addr.
>  */
> struct qcomtee_arg {
> 	enum qcomtee_arg_type type;
>diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
>index 369c87ad0205..367208210a32 100644
>--- a/include/linux/tee_drv.h
>+++ b/include/linux/tee_drv.h
>@@ -83,7 +83,10 @@ struct tee_param_memref {
> };
>
> struct tee_param_ubuf {
>-	void __user *uaddr;
>+	union {
>+		void *addr;
>+		void __user *uaddr;
>+	};
> 	size_t size;
> };
>
>
>-- 
>2.34.1
>
