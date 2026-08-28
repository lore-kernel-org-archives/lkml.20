Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D5814A8B
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 02:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787882606; cv=none; b=L3Yk16bsaPNHbiqkdfLD2IpdY7fnu04AYq/yfcBdIRxw/SFZrcrza0VTeB0pYnmMjvK1SneXTczaDem6Qeu38IXfy7JFEGulX72tT+jluV9XWaYGyBzYLSirkrOTGqF4Rs91q57+9N36DO+unJbuAN5EVB7iLqA8GsuBkghX1tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787882606; c=relaxed/simple;
	bh=nO2pAxV1NjTbBofk6R5GgxKO4mimVsO5mJyqelHHsfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WMuBAHcouXiPjAO/XS0d2KoePuIBU8o3JzUR0nUrjO5YhDedBjJVkXEKyOj4/iu4PNbub++IZkFpoHPRl98O1D/ZSJm/eMrCUm3GT5JXbQ37HXv0M6AI1J/qpMt9IcmZkVv49Xjj5dHW/OBfZ9+Tx/KX30y1n+IkNOT3tRh5DTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai; spf=none smtp.mailfrom=furiosa.ai; dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b=QVkekQTg; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b="QVkekQTg"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d53197d8b5so4284405ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 19:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1787882604; x=1788487404; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pTlKUEzQEa7Rn+0hDVYmAqWQKbByFTTyOUa8CoMUQEQ=;
        b=QVkekQTgoNbRC9uuew59k0uwQ0oHBtOdkaltw7xNZjMyMXPZrXmte1gjv1PzEUdaM4
         SJK/eg35ZlclqgecuAODdZMCrKwbZy//4QA2YsI/xftFmM3BP/R8HF9RheCRCzKcFZYb
         pyM09KpI7ok6C93a+RuqeC8mpH5LqC0mBf7vU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787882604; x=1788487404;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pTlKUEzQEa7Rn+0hDVYmAqWQKbByFTTyOUa8CoMUQEQ=;
        b=i0YYQk+TuDh2Qc26USnSuR6yXW1I1FFoVn5mNWPtc2EJu7SigF/S/yTeUavLuxSpgD
         A5Iz+SR9iEnVX0cAQTOp/SYh8iJLW8Vz4ZI2KQiTobJHVBCnlQmnC5G9suwYKkzaAy5N
         STJ9+KC04emeW1Q/n6QbUlWZzieYia9WYu50hXzajitCLiA1Brai1aaUvv01XE6NqkY2
         9YSga2l+gZIE6G+Y+D4lt0F/X5E9jJpPogGSVpHVXR4OcsYnlVebFaR85S26Vfr5yWhR
         g/MKnGrkGQ/S1F/Cd1/JaAB3Rml2bCQhM1+9CtLepPifAqpNP/Hp0fFXiu8Pye4Dp+Ye
         bqXw==
X-Forwarded-Encrypted: i=1; AHgh+RoBX1RHa5SareEY/1gn4fLwud/V3kPO7eJGsU4ACn30I8v1AwEdybFqrfgGkvvDR+UeP/3CAC47gPKr394=@vger.kernel.org
X-Gm-Message-State: AFuF++lPhxhohl19iDzZFR4J7qqz1QhZKiWkckGGw3PapwviuyLsS5Jo
	oOURU1WIPtz7YZ/0kq9blZ22ULTYe6IJlvzMl94s7rAO3oGxTYN9KDb7Vaz33+v7eLg=
X-Gm-Gg: AR+sD121LLSmWqdn3QE7n/axMft8RpUEBljvWOtde0sNBwxwcnYrM4bxzL0gVvDHmOM
	MSXGht7X7XFtTTsYlfF4ksRdYQOniuyOmwinriJzJqNtBbqVP2ho5D4pyjrWL7gBth32GDIcX8R
	xx//ay4AU5ndV/kK5/xk3pjUVaBeRMI1oCm0ABMCs8Qq6v1/jQuY9G8sFPh3jnKuYTTbZHNTZhS
	9yMJIgFgHsO5+x4z4MeqU/Kl1gfUV0KR8FP8xC5+1V6E0VgC5ZSuEL6RMJGQ2ZzMofMNE8Lt1j0
	RpxWwu5WnbM/8qUQsIz0bg+pbIC9ffjVY973qL5qJfK9WQZ/1tRzKtKeN22xo5i5baCoM7ZgSSq
	WGsas3BAQ08fmBfy8QHQiGaXHkiAaDU3ljsuKB5Blyg3JblpYzyK0CyvZnfTWGmFWvazLI8b1Ag
	e5uqRUxdo2kwhDbPkGlu0a80laMR1WgdFCk3daa9I1Xzf4UA4KSwl4LKn6Kt+hk9pKQ9dVEo86/
	A==
X-Received: by 2002:a17:902:d484:b0:2c9:bf82:dd11 with SMTP id d9443c01a7336-2d74ddddc11mr64753975ad.7.1787882604255;
        Thu, 27 Aug 2026 19:03:24 -0700 (PDT)
Received: from rock-5b-plus ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d7598c1cb4sm813515ad.81.2026.08.27.19.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 19:03:23 -0700 (PDT)
Date: Fri, 28 Aug 2026 11:03:02 +0900
From: Sidong Yang <sidong.yang@furiosa.ai>
To: MoGGuU <Naixumogu@whut.edu.cn>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/3] accel/rocket: Validate BO handle counts on job
 submission
Message-ID: <apDpz4j2y2_8_pOd@rock-5b-plus>
References: <20260827170608.39511-1-Naixumogu@whut.edu.cn>
 <20260827170608.39511-2-Naixumogu@whut.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260827170608.39511-2-Naixumogu@whut.edu.cn>

On Fri, Aug 28, 2026 at 01:06:06AM +0800, MoGGuU wrote:
> The input and output BO handle counts are __u32, while GEM lookup and
> reservation helpers take int counts. A count above INT_MAX, or a combined
> count above INT_MAX, cannot be represented safely at those call sites.
> 
> Reject such counts before looking up the BOs.
> 
> Fixes: 0810d5ad88a1 ("accel/rocket: Add job submission IOCTL")
> Cc: stable@vger.kernel.org
> Tested-by: Sidong Yang <sidong.yang@furiosa.ai>
> Signed-off-by: MoGGuU <Naixumogu@whut.edu.cn>
> ---
>  drivers/accel/rocket/rocket_job.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
> index bb77b6bf0f231..7e3d123afc5ad 100644
> --- a/drivers/accel/rocket/rocket_job.c
> +++ b/drivers/accel/rocket/rocket_job.c
> @@ -556,6 +556,12 @@ static int rocket_ioctl_submit_job(struct drm_device *dev, struct drm_file *file
>  	if (job->task_count == 0)
>  		return -EINVAL;
>  
> +	/* GEM lookup and reservation helpers take signed object counts. */
> +	if (job->in_bo_handle_count > INT_MAX ||
> +	    job->out_bo_handle_count > INT_MAX ||
> +	    job->in_bo_handle_count > INT_MAX - job->out_bo_handle_count)

I think checking in/out is okay but the sum of in/out would be checked with check_add_overflow()
in rocket_job_push(). But it only caches overflow UINT_MAX because bo_count is u32. It seems that it
would be good to change bo_count to int.
ㅏ

> +		return -EINVAL;
> +
>  	rjob = kzalloc_obj(*rjob);
>  	if (!rjob)
>  		return -ENOMEM;
> -- 
> 2.43.0
> 
