Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF884CCDC1
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 12:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788266747; cv=none; b=D0fmV8TTiWamPDIvr9pIZDePVs16bFgL5GwQysvXGhy5k9u5dMbThcisn+ywfzlUJWSORD0AJhcxHL3f096vX+xfrlNbrRZjlnuPDDiJwdQQbiWSb+O7E/nZVpNAvDxbu9aQBxhZ+Ot+Ble6xoNUtFPsoivac8BSd5q78tgoiPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788266747; c=relaxed/simple;
	bh=JMfUuO7Q3tnP0mQpeoUxoRIDRObMiAZUMr3Gvcx0Vic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A0fxfQtYCjVJf+VHQNjF3FL0e603NdWzuLB0qOhaxgcwdpyXQksAbkz/yE/vImjwrpz1VwEVDO47dtXlzdQJQFJp25jC67QaYlxMMIQ/qBbGA62RXOO9CaT7heNuT7wuKYUf392Ahbxn2mt7mv/um0MmSJ1zhiSa5L0Em2gf/1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=amoWfVTh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="amoWfVTh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A6E41F000E9;
	Tue,  1 Sep 2026 12:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788266746;
	bh=niYIDUYwRMXDPZMowTCBWoaAO6Bg2ABfT4zwnyFKhB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=amoWfVThz51iC75pOrGZIRMvATDUBvuvebP3EeTn7xJ/9P9AfAmGsJeIJ28hRN0NC
	 UoG79IKXk73NmeHPRsfgYBmKejxF/VLVeIIMeKw4IGB+SyNvlketCwd+VpV/k00VC2
	 xYZcePiIF3iUwID5l7BTKpS6vFDdq6zAEuoQqMDlFZKUabUIgfMSU7D7k8Uqzy8Vg2
	 hjUAh/ILGDRpQpzFrw0dLGcuuytrNqvEon6Ko9bM+QSBct25xadFGakS77FH/mDfyO
	 SX0vrMbQYTkOjZtGCAAMPoYaVwaXFq6BAguNH0pbR4JSwvRScsF2v4R1mtNQZWqt9a
	 1idkfaLO8VgSQ==
Date: Tue, 1 Sep 2026 14:45:43 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Bradley Morgan <include@grrlz.net>
Cc: Tejun Heo <tj@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
	linux-kernel@vger.kernel.org, brads@mainlining.org
Subject: Re: [PATCH] kthread: remove worker->task self-assignment
Message-ID: <apbI91PzT2BaRazM@localhost.localdomain>
References: <20260829161150.16301-1-include@grrlz.net>
 <20260829161848.20635-1-include@grrlz.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260829161848.20635-1-include@grrlz.net>

Hi,

Le Sat, Aug 29, 2026 at 04:18:48PM +0000, Bradley Morgan a écrit :
> From: Bradley Morgan <brads@mainlining.org>
> 
> All kthread worker users now create their workers with
> kthread_create_worker*(), which sets worker->task before the worker
> starts. The self-assignment in kthread_worker_fn() is dead code now.

How could it be created before?

> 
> Remove it.
> 
> Signed-off-by: Bradley Morgan <brads@mainlining.org>
> ---
>  kernel/kthread.c | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/kernel/kthread.c b/kernel/kthread.c
> index 63beb59b7a3d..18bc702e8d2d 100644
> --- a/kernel/kthread.c
> +++ b/kernel/kthread.c
> @@ -987,13 +987,6 @@ int kthread_worker_fn(void *worker_ptr)
>  	struct kthread_worker *worker = worker_ptr;
>  	struct kthread_work *work;
>  
> -	/*
> -	 * FIXME: Update the check and remove the assignment when all kthread
> -	 * worker users are created using kthread_create_worker*() functions.
> -	 */
> -	WARN_ON(worker->task && worker->task != current);

Should we keep a WARN_ON(worker->task != current) here?

Thanks.

> -	worker->task = current;
> -
>  	if (worker->flags & KTW_FREEZABLE)
>  		set_freezable();
>  
> -- 
> 2.47.3

-- 
Frederic Weisbecker
SUSE Labs
