Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D95495ACB
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 17:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790010886; cv=none; b=ZLLfbUVabk8Zg564oZcKrDfyl7FWn0FpikjW7SQMUzQcPgBNsk4Lfj4qUhYGVoDBbaDjYuEArxefZpFXwuc6RlIadrUNJiZbqqSP3t5TFoweyW+5qNVWVhwgGdW6wq+viP8twxSVo5DpDPteY19L78rZUO+hodhmyHbtIKCKlWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790010886; c=relaxed/simple;
	bh=4Q47Nx0v2PfbDry2ZuPw0wyTY1/9y3ekQmbvOG94A84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rcNZ+1/I9/8iUV+yYeadaohD6Ke2l37r9769OLNUIXRIUxeaXdhLeUWgJ5h5YnzHGpLOc5WnVfNze3VUs93uXjhuxhfz2tevuSJ2KDg0qwt8hU5Txg/qMjb5SA9hip+cjTY1duB7gd8X9PPZ8ev9lweh4qK4hNEg5lxQ05x8mSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lC18rHOk; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lC18rHOk"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccda24a3so2476790a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 10:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790010884; x=1790615684; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s62zFFj4WH2VOWYiwWWo0/uUxMensPmTmV2z9uDhDgM=;
        b=lC18rHOk894SlYVEa6Tfmz1BGeeYnBXIqi8zaI2f5oOE5rpoean4jv8Mou3uEG9TY9
         FiyCPdQ/itnfcbiE8T5xUdxFZ5gOzEyIrjycxywL0cWUBxNK+1rvnlWrjAoUTgjHpk5m
         518wz8gu4i8yP0TIQnLd+hGuNIcbDi7zXQy7IKm0ocjdY4co3BPjThyn1ns3ZNoaVAvb
         TqtrWbylRL4Y46vcTkn51+Bs9eOn7wNzbX+pZU1U0CEFg+eZgUp4nGLmyZC/4n+rWvXn
         2PAg9wrhlGuC0FahiuDDAR4xUVTJ3esE+fHzgvT2xdf3dGmRIyI5POAlCHFhq/hIjcTe
         +dzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790010884; x=1790615684;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s62zFFj4WH2VOWYiwWWo0/uUxMensPmTmV2z9uDhDgM=;
        b=ZpFmeYiTPsd1TI+9LgNgKlO3/MVGzUM0FMcO07UqvStlZXo3JOFuPP2qPMcO8P0VoR
         r1JYOu9efbNXH9P3oSFcng65CWyD5KeIPc2x3Tpax3xOxrSdpatVZsY4DY1BLWfdxFzF
         hZLeGC8/D7pKXItLLfnT5BS57GljSKtI6Z4azWGwCpAinkToXPfDv6l2cvN1qYpA85OG
         Zw2yFRIrrKuubXOJMiN6I3NcxohJnsYZaalJ1dk7cKPph7HIH/Vlp6q6FDZiehqR4EPJ
         6YOjOoDa1DVSj6/QV1zmZPoiRwldfzjvGQtTLgCtl/LnQRcy5MIl+w2f9F5jdSGtq4za
         ZdRw==
X-Forwarded-Encrypted: i=1; AKwUvBwfi0djjAgFaqA4lmPs/f/Pxxpqb83oj7++2HCNs6f7AMNrucclEdPJD/uuBWMXIuL5OAiVgLH3/+BfBfs=@vger.kernel.org
X-Gm-Message-State: AFuF++lRdREnjF25mvXPCar3mveg/qZbTz4OYkdYu2RQd1zPiDypGFXr
	DMNt/1n9nqmkm8Wt+csa0dKD9DeUNY57yHjC2Xt4r+FaCa4KaswjJkdQ
X-Gm-Gg: AYBFou0YY566cktkeqLiU7GtmtMR9pCZ68s34wD4rfKPpE5cMN/jTL7XgvhvOstCxZI
	TZKzBd3XAG+nYTAAxtj7BWPUjTj1h+CViAk4WzLqWqXkz/1mDRyX9G2WIVRzLY1TspmKlScpbPG
	Ib5fZ1TdzLUqpke6MsSEpIa57F239q8sXWZ/jyww8aDgI/ryYjbJej3v/zIYBafo1Fn8KlRcNrM
	Ren+JzdwarO0tUwY5YcL4pxgWm2ZbN7eN8oqHs1t2FC31GtnGXHCiiICdKxgFpTLT1Kqjr+pEtA
	GBkTOViWPvQAL14mpnDsHW1V813P2Z0nLmt6mSrawXKfZaxAR9wrjjykC70VssTl/HrfHucc59G
	6HgQ0+Nog1S5eeSQ3G2WWIL+twWj1xGj7kV4idvgwxvf3/FteSl38b1o/5McgusQPyH7jkMptGM
	f3O+j453pRkC42+7ROYD1sfBTx1WAf+5BQrjnG7qPuodzXJJNLGHNvkKPOv2U96lm2qAEB3byRj
	h/XQTe7OQ5zJraGAUH0so5FmeRPVi9PMXGgllri8fMW
X-Received: by 2002:a17:90a:38c4:b0:3a0:3881:eabe with SMTP id 98e67ed59e1d1-3a03881eb2cmr4299874a91.5.1790010884064;
        Mon, 21 Sep 2026 10:14:44 -0700 (PDT)
Received: from google.com (61-230-36-154.dynamic-ip.hinet.net. [61.230.36.154])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0674a5ae4sm243226a91.12.2026.09.21.10.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 10:14:43 -0700 (PDT)
Date: Tue, 22 Sep 2026 01:14:40 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Georgi Djakov <djakov@kernel.org>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] interconnect: Add kernel-doc for devm_of_icc_get(),
 icc_enable() and icc_disable()
Message-ID: <arFmABi5mn12bF4S@google.com>
References: <20260912115456.89169-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260912115456.89169-1-kmehltretter@gmail.com>

On Sat, Sep 12, 2026 at 01:54:56PM +0200, Karl Mehltretter wrote:
> Documentation/driver-api/interconnect.rst lists devm_of_icc_get(),
> icc_enable() and icc_disable() in its kernel-doc directive for
> drivers/interconnect/core.c, but none of the three functions has a
> kernel-doc comment. The directive silently produces nothing for them, so
> the consumer API section of the rendered documentation never shows
> them.
> 
> Add kernel-doc comments in the style of the neighbouring functions.
> 
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Reviewed-by: Kuan-Wei Chiu <visitorckw@gmail.com>

Regards,
Kuan-Wei

> ---
> Changes in v2:
> - Describe @path as an interconnect path and explicitly state that
>   passing NULL is a no-op returning 0 for both icc_enable() and
>   icc_disable() (Kuan-Wei Chiu).
> 
> v1: https://lore.kernel.org/r/20260907020504.24783-1-kmehltretter@gmail.com/
> 
>  drivers/interconnect/core.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/interconnect/core.c b/drivers/interconnect/core.c
> index 4aa991a54101..802f07e806d5 100644
> --- a/drivers/interconnect/core.c
> +++ b/drivers/interconnect/core.c
> @@ -423,6 +423,17 @@ static void devm_icc_release(struct device *dev, void *res)
>  	icc_put(*(struct icc_path **)res);
>  }
>  
> +/**
> + * devm_of_icc_get() - get a path handle from a DT node based on name
> + * @dev: device pointer for the consumer device
> + * @name: interconnect path name
> + *
> + * This function is the resource managed version of of_icc_get(). The path
> + * is released with icc_put() automatically when @dev is unbound.
> + *
> + * Return: icc_path pointer on success or ERR_PTR() on error. NULL is returned
> + * when the API is disabled or the "interconnects" DT property is missing.
> + */
>  struct icc_path *devm_of_icc_get(struct device *dev, const char *name)
>  {
>  	struct icc_path **ptr, *path;
> @@ -786,12 +797,33 @@ static int __icc_enable(struct icc_path *path, bool enable)
>  			  path->reqs[0].peak_bw);
>  }
>  
> +/**
> + * icc_enable() - enable a path
> + * @path: interconnect path
> + *
> + * Mark all requests on the path as enabled and reapply the bandwidth that
> + * was last set with icc_set_bw().
> + * Passing a NULL @path is a no-op and returns 0.
> + *
> + * Return: 0 on success, or an appropriate error code otherwise.
> + */
>  int icc_enable(struct icc_path *path)
>  {
>  	return __icc_enable(path, true);
>  }
>  EXPORT_SYMBOL_GPL(icc_enable);
>  
> +/**
> + * icc_disable() - disable a path
> + * @path: interconnect path
> + *
> + * Mark all requests on the path as disabled, so that they no longer count
> + * towards the aggregated bandwidth, and reapply the constraints. The
> + * requested bandwidth is kept and restored by icc_enable().
> + * Passing a NULL @path is a no-op and returns 0.
> + *
> + * Return: 0 on success, or an appropriate error code otherwise.
> + */
>  int icc_disable(struct icc_path *path)
>  {
>  	return __icc_enable(path, false);
> 
> base-commit: 986c24e0fe44f844b44d365b71ce831947f50298
> -- 
> 2.39.5 (Apple Git-154)
> 
