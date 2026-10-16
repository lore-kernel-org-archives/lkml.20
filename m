Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC14257845
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792166145; cv=none; b=fGfXiHthDIEN9lcpg1eK255cBRkaF2oOF7ZtWI3U8kieo5ykQgCDEm6nm38RbMMx/cQe5FTGQXs8O2PrN5Z+Tqdbz7KcaBN2mr6kkiMXEAaeMEpZXSu/XQ9/CzkMOEA3mdwW7H3iazW9GMEZhFGLP27Sy+NG17wFv3iI8uc2Q7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792166145; c=relaxed/simple;
	bh=XovGGZDGcMTSdz8nogdvxDY0i5eeOP5V0+TcNmFECBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VJoSxVDSBqRVCgqizwPBoeUIdZkyc8mSoZZy2e07vgAY15dATHmSMAiR4FXtsFFc39y0jQIdW5TTHxdQZuJv/xGpnSPzqlMi4Ym4ahXTItPRiO9gEOVFXpqLz5DVkZ5e9KwEX8y9iG0dtTwYQyQPKq8WxTHzldqeclUTVvOAv/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ImKKOb9f; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ImKKOb9f"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-825b40f8a26so3122923a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792166142; x=1792770942; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MANMo/9EL3PurFRTyqp9fqNscO3ewlbZ43zTZIeVTEM=;
        b=ImKKOb9fW0meVxetLtUMwwSVnuorHVWX2YzrYFvZYVyRTrGML32MW6vFsZUViEhl20
         wFYDg0JqPM0srze1b5V/F0nDCe0nHnvn17RXegk0I0JwRw9HaQH1kGz03nI/RnW75UkH
         Ckv+5CXLUNCTOJ3q/ORWSDGiRRULYGwV4lz2MlXXaQjPQOY3mDRGszLGTqgTpzsCLnax
         mb/+STdlw+bzmQH+o7qFZSps47UQZPkdAKD5otyPXtg7dT5FzfcOCBApi2r9ktFQYSGG
         GI8GKSCbSgGhjCRbpVhZnC6Klk0o9l4HqYqg+iAlakjRDaCKveyLqgCjSb2VYT1q2ImA
         11Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792166142; x=1792770942;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MANMo/9EL3PurFRTyqp9fqNscO3ewlbZ43zTZIeVTEM=;
        b=d/wF2jxugaVPbtCP9WbvmTtYqgbdKPbHrvcm2QBA9YGs1RFwuhSqr9iZmwgjxltUqO
         fnZUsGERwVmFE/0Xq88e+2bnnFkHTwfqy/bKPMj0hJ4KKQyzRNtS5e0+S94DmVNGLuX3
         61C90NzzfvY2ZWgdsH8qe38nqe4iZN5Fq9dDjuAOaCCzpNQmAofbJ6MHWag9Lfm2tQK+
         5pa6kzX1A6JIxj4Mc8nCp6G+Smcvs68rpHP2Asv/v2BD8i2N80bThWJVeYq57fp/XTqD
         4rFqNBv8Y9t48JOReCriO4mfComi583IWIug6cnTGdzRDglcKS/kiT8tcOFjzR7LbLFG
         zp2g==
X-Forwarded-Encrypted: i=1; AKwUvByWZGW25yP2puIh/uOiEbn59u/ZOnG00WEzb/cDrR795UpD6zTJp+3WPO+3gzGzuv38805uqS9JFHK4xJw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLzBdx8oM+gNiVMsFkWcWMAtU8AjR20rC7MoUPWWA2MZbsdRhR
	04l4Js1r9Ov9vEOQvECp6R1OiGqCzvuy6C/vmJCtCP5Psmu2wFc1klHmc76O+LQDjpt948gYDjT
	4X3FG
X-Gm-Gg: AYBFou0ZvT58uuhqP7bCsecNEiaHebt6MWovx9+QaKynHP7g03sux/M+B7f1zAL1VPq
	doW+Gdv7BRs7+nix+ByysPch93na9Fq8LUvMXHEfzTsLXyL0AeK314/yri+CFI2PLKYExUXzbD1
	jfor+F8Vugt50AJLR3NQwlG09umCbN1pXA7+yXVhNMj3ALM4ofmEBYJWTJ/sZGbIE5tMEOERMQh
	KThLvta52OGwjxMPkvMksABvyQGOYw6S7Ccc1XD4Ua7raXFsRGLVYKB9mCM9F2LLOfHD8A2V6jM
	X5NTzUwx0vtq/WvmiAv8ZAzFz4O/ttSVza3sRENhKLljSDIDfij+pL1auRdsGdSPIgWDe/m4VLi
	D35GBixIyJubgIZHBaOioRM7ULAazbqxwuka8sctVRTS02zjEaWr4v+P8GBqXGPsSCXM77spAw/
	81yR/7zSkw3YS8nKafVRR+oeESHKDOLJDasZ5yv52xkq9DTzgmSiwnjth8W5aENybBVCO8bHwDx
	A==
X-Received: by 2002:a05:6830:4408:b0:81c:292f:97a3 with SMTP id 46e09a7af769-8309610badfmr21885225a34.5.1792166141529;
        Fri, 16 Oct 2026 08:55:41 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:ff2f:8a9c:5623:f753])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-842a0f284d1sm2073901a34.2.2026.10.16.08.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 08:55:41 -0700 (PDT)
Date: Fri, 16 Oct 2026 09:55:38 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Yonghao Zhang <hyz3367@gmail.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] remoteproc: core: Guard against a missing stop() in
 rproc_start()
Message-ID: <atJI-r0JBsnVfMVS@p14s>
References: <20260929075453.2324597-1-hyz3367@gmail.com>
 <20260929075453.2324597-3-hyz3367@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929075453.2324597-3-hyz3367@gmail.com>

On Tue, Sep 29, 2026 at 03:54:51PM +0800, Yonghao Zhang wrote:
> When the subdevice registration fails after a successful ops->start(),
> rproc_start() unrolls with an unconditional ops->stop() call: an
> implementation without stop() turns that error path into a NULL
> dereference, and there is no other way to undo a start once the
> processor is up.
> 
> Nothing rules that implementation out.  rproc_validate() checks the
> callbacks against the state a processor registers in: start() for
> an offline one, attach() for a detached one, which never look at
> stop(); the only written rule, Documentation/staging/remoteproc.rst
> ("Every remoteproc implementation should at least provide the ->start
> and ->stop handlers"), is a should the core does not enforce.  The
> in-tree implementations all provide both, or neither when they only
> attach (commit 1168af40b1ad ("remoteproc: k3-r5: Add support for
> IPC-only mode for all R5Fs")), so none of them can reach the call
> today.
> 
> Skip the rollback call when there is no stop(): with nothing to roll
> the start back with, the processor stays running and the failure is
> reported by the boot attempt itself.
> 
> Fixes: 7bdc9650f036 ("remoteproc: Introduce subdevices")
> Signed-off-by: Yonghao Zhang <hyz3367@gmail.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 123aadb467a0..19e0ea3e7240 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1336,7 +1336,10 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
>  	return 0;
>  
>  stop_rproc:
> -	rproc->ops->stop(rproc);
> +	if (rproc->ops->stop)
> +		rproc->ops->stop(rproc);
> +	else
> +		dev_err(dev, "can't roll %s back: no stop()\n", rproc->name);

I don't want to clutter the function's error path.  Please move that to the
error path for rproc_start_subdevices() and call the correct "goto" based on the
validity of rproc->ops->stop.

>  unprepare_subdevices:
>  	rproc_unprepare_subdevices(rproc);
>  reset_table_ptr:
> -- 
> 2.34.1
> 
