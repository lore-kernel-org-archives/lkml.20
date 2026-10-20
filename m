Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792524485;
	b=MUA7j1MqjE+VdmzjZo7f3xoEy8bfnAjK98fPQ5eWJPZPtN3f5i77Gm3rNEwLtUQe8svi
	 2j3yKXNRUzRJ3dcJSIDDtSkUNHnIWRyfoxQcHeoEn4G6XBd73FCY15+k4dOB/XmPV1lIe
	 +Um4dV1Rc7iWVmsgNmK6yq2w/S8a2I/+h0fcZ6l2I89VajsLBFscMuK9bhJ7h/pntEy+y
	 gpYkhkNoyP+utEBgLS5wDXglusZm2ohlFmrIx3XFjyGxLg0wXlsOt/Nauv7dyq6pCLmOC
	 JmtcO+9fvrjFqLXVFOU7iGoSucZrZBbNm96CbRHtLlZv5F9B7DKyJn0KpwM23jLEANw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792524485;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=4Oum7bllURz1Icez86sPHFIClyN9kbXqs/qBQKatBzo=;
	b=C8MlDAnYoe0Fo6fnpTI1i91D/vNnL6M4NU9Ms4QT5frxGUnujRPojbWg4Czuw+cm9eK1
	 eAJ8bcUB89b7TB+utHsNLB62+m2wCEHzoNvXq8mQstobq1HkVZ1zWVX18nsyqRuXF9tpN
	 LRav93pkwO0Bt31vPDaO9NryblXZcX3ikka+ghCu5nTVHb2gGaQPx8JLX2EhL7YMawTdv
	 lI3RUtbhqhjW3sCL2G281L4h9XCE8nqJwvthpdHK+JPeie9z9aYiX2gABJTsqcbj2TyRh
	 /sE7amzApjbZqWxXzkEg/x/+28yP8Dhcg+HdFVW7rpz/7J6saEei76OlBj57/biEdrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lxAjn5hU;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E7D606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:28:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69E7D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lxAjn5hU
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so1320669a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792524483; x=1793129283; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4Oum7bllURz1Icez86sPHFIClyN9kbXqs/qBQKatBzo=;
        b=lxAjn5hUni/1Q2zG2C1AbrXWO/JlFOUm3UVxgSN7I9O3uBFKalnFS3wPH07ZI10PSh
         Ebf0QHycv98aYoaO4Hx0gYcXsByC1zKWOhhAL5f0ssQFbtnFzlz0X0Cd3Xawsp2FTVI/
         JA5G7qRcvBF/hlUotTpirAphceodprwxSAJ6BAm28nYvpYxPbPr1eEoM3t+ZHNFvd9fx
         0gSq9KeX1HIdpJjUwl8N1qm4ObK5f6mwItX5dYjVpSE8ybwAQ36NSdIz1RApcrXlfle1
         hTOnf56UZQEq0al7KIVGN2Zh7xxwSTLHsxpwWl/JMzsrWyfUxVS167aGJeHzyRfSaIJ/
         k5Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792524483; x=1793129283;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Oum7bllURz1Icez86sPHFIClyN9kbXqs/qBQKatBzo=;
        b=HhPeeOkfUigwfqmaH3FfYrbEWOoEI4XtOVYRv/zOcU6I6ccrvIJBW7kDb3GwdVld4M
         BKFm7HcC4etqfc+trlPKFIy446hol5nUQ1Ytgs6v/S/7pkKEpGeKqnoC7+3B/nHWW4lM
         ZZSCfMMPOSx6qxZwZ+FLrlNxu23V2My5CHeuS0ov8oyqvmcEhbZ/XfnkcHfxXQvGvhXW
         27ng2LHihUi/OPGHgPxV2bRyK57bgjYsCdbOYGbTHThcwDrMqY6XV1WhihYkM33wFcWV
         L1UySAbexFgHvQZ0+9bLIwL0CuW+0dCBfbVC65UMt41yXCJ5bgnH6OEpy89sLKxBml6S
         uhTg==
X-Forwarded-Encrypted: i=1; AKwUvBwLYpYQtbI4/k/i4CT9E+GJbg9JeQLkEMfqOnxWTf6UJCyRSX/eOQbNVMgbjWjVCSLa00jlqtfm+uM5xlM=@vger.kernel.org
X-Gm-Message-State: AFq9FYK89m5oufgx6If/DnILw35KBANYwvGvFMHHklujKUK1n7jmsi7z
	z7eMsPsyJIKuCQdk//CpsXsbHjp9TpIYvcWBK+r1Km5hgcEhqfJPSu4QMcdyDXcVroM=
X-Gm-Gg: AYBFou225HS38VYhhChxlhSqdf3IOrr7WN8M6Vt9FHidtzIjfZvkYZzw0fIPWRI7PtN
	W+8xzMiIs+1D9unR1Yz0g3Zr5EHAAt9+W5YN1utmHRfJD+VD4cRspFhS0G4vWT5SElqJIN0MkWP
	ovTGEtHJzCW1XFiJl/ZNrVvjqre1x0GVJRHNUj7yqpniYumcrJ/Eklvpbw891ZvC60Ysrt9fsJ7
	TJMvfeAvFT9M9Op25XcPcw6EC2xhiS1Cyx6EXCE5NW3bUMI0HhxAubvMMS0Xb8f9j6jNyum2jw5
	o05W4JzVAmavjlcQG/sX5z0oWjqR6wFCvYueZbBIH45zNCluOeNxJxZ0e7x2h5sVWNNn4jS9bhw
	WYdDFVhbEiVKdL8SG2QoFGkaeVEnLCW79B19EFwJ0Opn37B05bWwBztwi1ASuZjVezPU2L0Kcyb
	xB7VKh9pNXYVumrFZBWjAhc0dznJGNYWCevP0dBy/NC4MvsZppQvRueOzrWcurrAusHQRVMTfp8
	Fl23oGHQiheGVUNW4wwj+S/Yc6FTeLaOyv7AMz74ZMVXWbArBALTpkJCV4=
X-Received: by 2002:a05:6300:2786:20b0:3e2:325f:578e with SMTP id adf61e73a8af0-3e2325f58d6mr4982382637.66.1792524483323;
        Tue, 20 Oct 2026 12:28:03 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:1567:1f94:7104:b613])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895f8ca3sm26422b3a.46.2026.10.20.12.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 12:28:02 -0700 (PDT)
Date: Tue, 20 Oct 2026 13:27:59 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Yonghao Zhang <hyz3367@gmail.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] remoteproc: core: Clean up after a failed recovery
Message-ID: <atfAv4kekczalp6V@p14s>
References: <20260929075453.2324597-1-hyz3367@gmail.com>
 <20260929075453.2324597-5-hyz3367@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929075453.2324597-5-hyz3367@gmail.com>

On Tue, Sep 29, 2026 at 03:54:53PM +0800, Yonghao Zhang wrote:
> When rproc_boot_recovery() fails to bring a crashed processor back
> (the firmware request fails, or rproc_start() fails), it returns
> with the processor stopped but two kinds of state still held.
> 
> The resources of the boot the recovery was trying to restore are
> never released: rproc_stop() does not clean them up, and unlike
> rproc_attach_recovery(), which releases everything when its
> re-attach fails, boot_recovery just returned.  Stale carveout
> entries then fail every later firmware boot at "already associated
> to resource table", until one of those failing boots happens to run
> the cleanup of rproc_fw_boot().
> 
> The power references fare worse: nothing can release them anymore.
> Take a processor with two outstanding rproc_boot() references whose
> recovery stops it and then fails to restart it -- RPROC_OFFLINE,
> with the count still at two.  rproc_shutdown() drops exactly one
> reference per call, and only once past its state gate; the gate
> admits RPROC_RUNNING, RPROC_ATTACHED and RPROC_CRASHED, so an
> offline processor never passes and no amount of shutdown() calls
> releases anything.  With the count still above zero, rproc_boot()
> then short-circuits on atomic_inc_return(&rproc->power) > 1 and
> returns success without doing anything: the users of a dead
> processor are told it is running.  The reference count and the
> state machine are misaligned for good.

Please remove the above 3 paragraphs.

> 
> Release the resources on the failure paths of rproc_boot_recovery(),
> the same way rproc_shutdown() does, and void the power count in
> rproc_trigger_recovery() when the recovery failed without leaving
> the processor crashed, offline or detached.  The service the count
> was tracking is gone, so every outstanding reference is dead, which
> decrementing instead would leave the survivors stranded exactly as
> above.  A processor that is still crashed keeps its references, as
> rproc_shutdown() can still drain them in that state.

Remove the last sentence, starting at "The service the...".

> 
> Fixes: ba194232edc0 ("remoteproc: Support attach recovery after rproc crash")
> Signed-off-by: Yonghao Zhang <hyz3367@gmail.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 34 +++++++++++++++++++++++++++-
>  1 file changed, 33 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index c52212a1d180..b138680b1905 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1900,7 +1900,7 @@ static int rproc_boot_recovery(struct rproc *rproc)
>  	ret = request_firmware(&firmware_p, rproc->firmware, dev);
>  	if (ret < 0) {
>  		dev_err(dev, "request_firmware failed: %d\n", ret);
> -		return ret;
> +		goto clean_up_resources;
>  	}
>  
>  	/* boot the remote processor up again */
> @@ -1908,6 +1908,24 @@ static int rproc_boot_recovery(struct rproc *rproc)
>  
>  	release_firmware(firmware_p);
>  
> +	if (ret < 0)
> +		goto clean_up_resources;
> +
> +	return 0;
> +
> +clean_up_resources:
> +	/*
> +	 * rproc_stop() has already switched the remote processor off, but
> +	 * unlike rproc_shutdown() nothing releases the resources of the
> +	 * boot this recovery was trying to restore.
> +	 */

Describe the situation as it will be when your patch is applied, not the
situation you are fixing.

> +	rproc_resource_cleanup(rproc);
> +	kfree(rproc->cached_table);
> +	rproc->cached_table = NULL;
> +	rproc->table_ptr = NULL;
> +	/* release HW resources if needed */
> +	rproc_unprepare_device(rproc);
> +	rproc_disable_iommu(rproc);

Use the same sequence as in __rproc_shutdown().

>  	return ret;
>  }
>  
> @@ -1948,6 +1966,20 @@ int rproc_trigger_recovery(struct rproc *rproc)
>  	else
>  		ret = rproc_boot_recovery(rproc);
>  
> +	/*
> +	 * A failed recovery leaves the remote processor in a state from which
> +	 * rproc_shutdown() refuses to release the outstanding power references
> +	 * (RPROC_OFFLINE or RPROC_DETACHED), so every rproc_boot() would
> +	 * free-ride on them and silently do nothing. The service those
> +	 * references were tracking is gone: void them all.  Failures that
> +	 * leave the processor crashed keep the references, as rproc_shutdown()
> +	 * can still drain them in that state.
> +	 */

Again, don't describe the situation you're fixing, describe the situatio once
the fix has been applied.

> +	if (ret && rproc->state != RPROC_CRASHED) {

The only possible states we can be in at this point is either RPROC_OFFLINE or
RPROC_DETACHED.  Make that explicit rather than anything that isn't
RPROC_CRASHED.

I am done reviewing this set.

Thanks,
Mathieu

> +		dev_err(dev, "failed to recover %s: %d\n", rproc->name, ret);
> +		atomic_set(&rproc->power, 0);
> +	}
> +
>  unlock_mutex:
>  	mutex_unlock(&rproc->lock);
>  	return ret;
> -- 
> 2.34.1
> 
