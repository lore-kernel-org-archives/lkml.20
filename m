Received: from mail-oi2-f42.google.com (mail-oi2-f42.google.com [74.125.231.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B6848820E
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 14:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790865311; cv=none; b=JwfqYkD48MssKYbcmm/aFy3cjw0LqEuNm2oL3sUpcPMQundB7Ehn11HlfbUNy6HHeJqN4oZNvnU+U04Sh75730dcWX3klD73vxmiQIOevTKyowti+VbUJwmlljcRyaGEtgpAMk8MU4BsEzlrSWpwkhsalA4ugwcf+Dgq1lYq0ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790865311; c=relaxed/simple;
	bh=8bNBonel1eiwJmzEGlZ12+ywTpzur3cAUUr7r6NablA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NUKLnon+aKzcoTPrIXa+w9Do3vEXvFnRH3nCvXUYEe/dmbyo7uBoI/VksQlmbgKdPR+XUIpZH+ZIHbjk73oFEeqzebyNdxKWdNcfyk4d80r1UYkyAPz5td5q7l8m/GPT0TYWKK29aPGHFduZARRcIaGuND8QN/6xChQimQwiWsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nx5OEGYV; arc=none smtp.client-ip=74.125.231.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nx5OEGYV"
Received: by mail-oi2-f42.google.com with SMTP id 5614622812f47-4e4b644b4e3so1094731b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 07:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790865302; x=1791470102; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cUAcFPVvp9NmtmeivTgTtb3I2BaROQYBORbE57S0nb4=;
        b=Nx5OEGYVX0/QogaBBHIp27XtHq9eNT9fld1Yxe/fMW8JD2hScOqg1T4Y3AJXSWVT9E
         YlqbQLQ3uiMaLkcuXHFnz8km0e5qtAdF72Izwl8AXQDpvP7HHT4fOsFvKuu9ajCbed0V
         vCrXa5bYynaPFYyUxHcZJUoXQReKYAkiJCiKx5N8Ra5X8dBHDQ6Mdo3TAXiLFGFFVYqI
         CDYfn+F2FXZ9gJdL4gbdH56I1d2RteSDviJNTsRExlZdVwL7FZDHABnlZHn33hro+rdY
         ra6Oi4BtS2LK43oFwx2EuMBsnzkiax70KbP1Jl/ya4Ya1cCjRHFw8bEr530nj3BnCTHM
         pRaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790865302; x=1791470102;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cUAcFPVvp9NmtmeivTgTtb3I2BaROQYBORbE57S0nb4=;
        b=ccTXBmVyNSjHQXhaDNreVhIdttHn9J33awMOPC+7s8vnvVeDyqliqAhLskYDwiOokc
         yLoIiNfGXIP1AdHs6FMVnntD/D7B6HUVhWISEejbI+eFSd881NTSWNfxsfHQriB+R5D7
         bHzdgsQgv06+uz3pQrh7eeX/Nd5+NA3vv1ZyueEdRLEM18GB8OK3sm59tY3XYvR7mNMd
         myqyLZ87UMoeUAo122BlfDE/ccbgybZuwG1ayKBA6EHv79wJeFZA0LOeS7ZkiDWFC28L
         sfEDC3cza9TFFj5XDKQrbGNWlxF56lR1XYuWSObpboRKAgvS+B1aAPWQLSQcSCgk0vPS
         BobA==
X-Forwarded-Encrypted: i=1; AKwUvBz3n7XhDqkHQVk9XXnFHUIz7REW5hQmfYiapTMCeHYQ8fSJ+ypqAOdWtkmNoFDhDe8z2hRCLhDul0u9bbg=@vger.kernel.org
X-Gm-Message-State: AFuF++mPT4dxP0c0nRsbj1AJ3o5hLmlk7cWIDSxIBz+iTJPQ/alY3VWF
	cztNCvHwwIrG3nYi0kgT+GrDQLBnhM6+kZApKV4grlwtyH+SmQWLE1UU
X-Gm-Gg: AYBFou3n9DnUHFUybiWYbjQb53R7jAGDaLZ1LfDxfGou3ZkU5ew0bKA3u5AAbrQd9Af
	lu8HnCsDB6xnWyXynhG1ESCI3SeherlvIXd2aTDwNCZAD1kI3t4KGLvzmTZT2zCf4LEmLI4Plek
	TaVU5Tgs0AEGQM1vdo5qWpGjwUTP+09c50P7kI3sYRDjae2g+uCiWXUa6g7s85Vbe6EGLwCuWZp
	nWYMnLZ7mwzLnm6AtARpGD/6Q/xUE+D2Ao7AnVlM30CKCmRsSiQEYgwcZx6d1vTJczGA59MYbz+
	bZlBs02gMeQRcpvgT6DqaIzzqoqVIOXbHCvPXw91hXSxR/WOc8rqBUfHdBI6VEfn6Qrg9SzbAcC
	cr51nM22ICJ33Pd4pykpb76lNSm3Seh2X5mBh7N3LloqieWvFoXCivVnjA7Nwt2PzXqre7mKpHH
	DCLWS1JmADuTg0IFTZFCoQtkzfP7PfmFSB1hnIfj+4G8utnOtSe0yUNf0kep1ONNedGnGdWT+9z
	nxmivv90FBfJhER+dwj6qGLkeZGjRKjq92fEjpotwg0yrl/STtbPT+56UGgy1pn/tlE+L3TS2Am
	p/PxZQF34yeEzg==
X-Received: by 2002:a05:6808:508f:b0:4e9:3412:14ac with SMTP id 5614622812f47-4f1b87b67cbmr6198251b6e.33.1790865301709;
        Thu, 01 Oct 2026 07:35:01 -0700 (PDT)
Received: from fedora-laptop ([172.245.82.59])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4f34b8bc733sm2445476b6e.10.2026.10.01.07.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 07:35:01 -0700 (PDT)
Date: Thu, 1 Oct 2026 09:34:53 -0500
From: Ming Lei <tom.leiming@gmail.com>
To: Qiliang Yuan <odys.yuan@gmail.com>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ublk: drop the device reference outside ublk_ctl_mutex
 in DEL_DEV
Message-ID: <ar5vjRR_I4Vkd9h5@fedora-laptop>
References: <20261001-bug-ublk-del-dev-put-unlocked-v1-1-18e9bb9be727@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001-bug-ublk-del-dev-put-unlocked-v1-1-18e9bb9be727@gmail.com>

On Thu, Oct 01, 2026 at 11:10:47AM +0800, Qiliang Yuan wrote:
> ublk_ctrl_del_dev() drops its reference to the device while holding the
> global ublk_ctl_mutex. When this is the last reference, ublk_cdev_rel()
> frees the tag set, and blk_mq_free_tag_set() waits for the pending SRCU
> callbacks of the tag set with srcu_barrier(). Every DEL_DEV thus waits
> for an SRCU grace period with the mutex held, and deleting devices from
> several threads serializes on it.
> 
> The release path doesn't need ublk_ctl_mutex. The device number is freed
> under ublk_idr_lock, and the last reference is already dropped without
> the mutex when the ublk server still has the char device open at
> DEL_DEV time, from ublk_ch_release_work_fn().
> 
> Drop the reference after unlocking ublk_ctl_mutex.
> 
> ublk null target, 4000 single-queue devices, STOP_DEV + DEL_DEV issued
> from N threads, 16 vCPU KVM guest:
> 
>   threads     before      after
>         1     77.6 s     77.6 s
>         4     20.1 s     19.4 s
>         8     19.3 s      9.0 s
>        16     19.2 s      4.1 s
> 
> Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
> ---
>  drivers/block/ublk_drv.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
> index 66eb55e7162e5..5d237aae51b7b 100644
> --- a/drivers/block/ublk_drv.c
> +++ b/drivers/block/ublk_drv.c
> @@ -4901,10 +4901,15 @@ static int ublk_ctrl_del_dev(struct ublk_device **p_ub, bool wait)
>  		set_bit(UB_STATE_DELETED, &ub->state);
>  	}
>  
> -	/* Mark the reference as consumed */
> +	mutex_unlock(&ublk_ctl_mutex);
> +
> +	/*
> +	 * Drop the reference outside ublk_ctl_mutex: if it is the last one,
> +	 * the release frees the tag set, which waits for an SRCU grace period,
> +	 * and holding the mutex would serialize concurrent deletions on it.
> +	 */
>  	*p_ub = NULL;
>  	ublk_put_device(ub);
> -	mutex_unlock(&ublk_ctl_mutex);

Looks good,

Reviewed-by: Ming Lei <tom.leiming@gmail.com>


Thanks,
Ming
