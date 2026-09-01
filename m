Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4FE4749E9;
	Tue,  1 Sep 2026 10:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788257521; cv=none; b=nVc7vPfKDvA4oanQCuwbhqXj8EjrDRHddv1zD+gDcIbYVqJIedcKSpX+Sc8VfI5NexKPT+P5w7VZg/7nbqVhvSePuD4vuIjIWRxgArAdumUaY+9nMkQ2MLqRgi5TtH+d2Z32dJA4zZaNhLkWxE/rZTEBSuDMVHuBjtyLTuGeRV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788257521; c=relaxed/simple;
	bh=CYiPIDa+5SO6ePD4/mQ2ZCKWVWrW67WmnKqtV/v9b2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WfOvaWG5bwkSFpr1bdAG+dhaXeB4SxNBNtV7AQbTuNYVhK97Sj4+v3V4QBDFCdflojMcfrWPuCIL9BPokxFQN46S6Moq3Pa5/F65bJo1Y1R8Mag1hlRvg75c0M/U2ivmDLPabFhmoCWconuwwa0hnTsmUr/RmV5O/6sIzVpPIig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=VFUwahQ8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="VFUwahQ8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1337A1F000E9;
	Tue,  1 Sep 2026 10:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788257520;
	bh=qCccPL2iVmPO6iEdS+qVSXPbXNi4YoA43uOydyr3zF0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VFUwahQ86Tpf5Jg6Dqdf8293kxP6ul+Q/nEVNOlP0iDvsT1SS+FQ9oBEbnKqzrlDF
	 KJoCrTf2n4g8+j+aU/4I5W4JMXS5UaPdI8LwXFZ+9N+G6ZOriMggi815GItGt9cg13
	 Q6Fung8S4Zp580PQq3JvdKaD9+VHkFTF+5SJ70/w=
Date: Tue, 1 Sep 2026 12:11:56 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Arihan Bhor <dogestad24@gmail.com>
Cc: ovidiu.panait.oss@gmail.com, gustavopiazdasilva210@gmail.com,
	error27@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers/staging/axis-fifo: fix formatting issue
Message-ID: <2026090145-curing-generous-374d@gregkh>
References: <20260822064627.79029-1-dogestad24@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260822064627.79029-1-dogestad24@gmail.com>

On Sat, Aug 22, 2026 at 12:16:27PM +0530, Arihan Bhor wrote:
> The issue as reported by checkpatch -
> 
> 	CHECK: Alignment should match open parenthesis
> 
> 	#249: FILE: drivers/staging/axis-fifo/axis-fifo.c:249:
> 	+		ret = wait_event_interruptible(fifo->write_queue,
> 	+			ioread32(fifo->base_addr + XLLF_TDFV_OFFSET) >= words_to_write);
> 
> Signed-off-by: Arihan Bhor <dogestad24@gmail.com>
> ---
>  drivers/staging/axis-fifo/axis-fifo.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
> index 3aa2aa870ea9..13a4f329a2e3 100644
> --- a/drivers/staging/axis-fifo/axis-fifo.c
> +++ b/drivers/staging/axis-fifo/axis-fifo.c
> @@ -246,7 +246,8 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
>  		mutex_lock(&fifo->write_lock);
>  
>  		ret = wait_event_interruptible(fifo->write_queue,
> -			ioread32(fifo->base_addr + XLLF_TDFV_OFFSET) >= words_to_write);
> +					       ioread32(fifo->base_addr +
> +							XLLF_TDFV_OFFSET) >= words_to_write);
>  		if (ret)
>  			goto end_unlock;
>  	}
> 
> base-commit: 26260251022fbc2f248a3d747a9b2b961b18d2d8
> -- 
> 2.55.0
> 
> 

Does not apply to the staging-testing branch.  Can you please rebase and
resend?

thanks,

greg k-h
