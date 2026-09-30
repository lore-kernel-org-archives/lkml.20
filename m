Received: from smtpcmd12131.aruba.it (smtpcmd12131.aruba.it [62.149.156.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73A04D1788
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.149.156.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790770399; cv=none; b=ig2fUCszN1UzX62kEZVcxq9jq2GseaQ9S3MTG61kuYxea1mcH/EoZOs96F0zdjzSmVOa4qMyYk7xqa7exNXpu7l8PsYvPx11XVyfN7UoGVLrdILCiMAJhw+f3j9PYwn/9nMXTMyH6r1kZe7RgKpPh8buVJ1AmJu49LFS9AQUGTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790770399; c=relaxed/simple;
	bh=FwoNYZXk+r1mKKOYa8x+DGn5mNbFW/ybehamwDVSyIM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TWPmzk/NjlvlMtaEGIW58Z+uPq6jEGkeKfbBFGXXUQgVnm4cfYZu5bYivnEx/8LfVkPEHSA6pLIA6kJ8vaAHos2l+LgfJYSKo6+TiF7gy84gUByogtyOY9OH+oGZ8a7uDOmM+eXMmk0DOE/Ih5UtLoqxwYPEe5I5gYeLm1CXQOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com; spf=pass smtp.mailfrom=enneenne.com; dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b=SVMsvxXL; arc=none smtp.client-ip=62.149.156.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enneenne.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b="SVMsvxXL"
Received: from [192.168.0.186] ([101.57.122.26])
	by Aruba SMTP with ESMTPSA
	id Bt8KxwoBsxUh5Bt8OxVwwG; Wed, 30 Sep 2026 14:10:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1790770205; bh=FwoNYZXk+r1mKKOYa8x+DGn5mNbFW/ybehamwDVSyIM=;
	h=Date:MIME-Version:Subject:To:From:Content-Type;
	b=SVMsvxXLTSVVMyLMuKXkJlnWh/hjF0N99BDf292WJcJ0A9NnvEmCubbMxSKeamHmE
	 w/Pa7LgRwjxQ13iLNawQEZzKltA7vJ8OYpC2NL6kpDrNLs3OJJbXx5jQLWEzr/fXNy
	 u6v079t+FLkPLMVdn9k9ngFfQp9SVXykkL/EyePevEiKerxFjm3FSRKLpDMEyGGf/R
	 C5LyiUbjfKUc9TdHyRcVWkVjqdT2vOhrowqwBpK4n1s20SiX35GPRz+Mf/MCxvSsmJ
	 A20+j0fBdexVA6kYl9dWbXnUryjXIj1pudkMF1FEoj8JDjDbCtjnGpxNUeB/qD8VmS
	 E1ZRaOH8Hobrg==
Message-ID: <adf6790a-c785-44ab-b2e8-635cacc980e4@enneenne.com>
Date: Wed, 30 Sep 2026 14:10:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] pps: generators: wake up PPS_GEN_FETCHEVENT
 readers on unregister
Content-Language: en-US
To: Danish Khateeb <danishkhateeb03@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Calvin Owens <calvin@wbinvd.org>, Yibo Tan <lhfff@tju.edu.cn>,
 linux-kernel@vger.kernel.org
References: <20260929124937.51114-1-danishkhateeb03@gmail.com>
 <20260929124937.51114-5-danishkhateeb03@gmail.com>
From: Rodolfo Giometti <giometti@enneenne.com>
In-Reply-To: <20260929124937.51114-5-danishkhateeb03@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfCVVcZ3jAyU9SFJhtl3x9+Gw2ImL1ZYIqlt785VECLf1A4DrjmFUrleBvMkNyWC6K5uzfNRCoYKpklDHx6m7jbyRcXjasya1tpDJenbgbbDP+vCUOrNo
 3yJzj1CeclNo7O2yYvhNo9P6ogEnUa7JgBk3bh7sU7LjlxpX9Bl7Qv1LS4h8qEvY3c3IvabkSkfPhspJa+ACEmd9wdDZgyggYbwlHWBGrEDa4wvb5riLc3cC
 tOY2bSYXG3LNpEZVOYkyiETK913To+fqdKT7C42Tzt5pe8qwINJYbfuOcT06dq10FOML2tY4dXBliLjN6UOKiOL1DmrrwkrLebaEe8nEo1/mQwu8qAnArDR9
 0wtnlHsWvZiOd0wy3cAEIsFJp4aAnA==

On Tue, 29 Sep 2026 07:49:37 -0500, Danish Khateeb wrote:
> A reader sleeping in PPS_GEN_FETCHEVENT waits for the next event, but
> no event comes after pps_gen_unregister_source(), so the reader sleeps
> until it gets a signal. A PPS_GEN_FETCHEVENT issued after the
> unregister sleeps the same way.
>
> Wake up the readers on unregister, and make PPS_GEN_FETCHEVENT fail
> with -ENODEV once the generator is gone, like the other ioctls. The
> wait checks info without info_lock, so clear it with WRITE_ONCE().
>
> Fixes: 86b525bed275 ("drivers pps: add PPS generators support")
> Suggested-by: Rodolfo Giometti <giometti@enneenne.com>
> Assisted-by: LLM
> Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
> ---
>
> Notes:
>     Tested in the same setup. With a reader asleep in PPS_GEN_FETCHEVENT,
>     unbinding the test driver used to leave it asleep until its alarm(5)
>     fired (-EINTR after 5 s), and a PPS_GEN_FETCHEVENT after the unbind
>     did the same. With this patch both return -ENODEV right away. Normal
>     use of pps_gen-dummy, including PPS_GEN_FETCHEVENT, is unchanged.
>
>  drivers/pps/generators/pps_gen.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pps/generators/pps_gen.c b/drivers/pps/generators/pps_gen.c
> index 452cc12a96f2..474e17c36458 100644
> --- a/drivers/pps/generators/pps_gen.c
> +++ b/drivers/pps/generators/pps_gen.c
> @@ -103,11 +103,14 @@ static long pps_gen_cdev_ioctl(struct file *file,
>  		dev_dbg(&pps_gen->dev, "PPS_GEN_FETCHEVENT\n");
>  
>  		ret = wait_event_interruptible(pps_gen->queue,
> -				ev != pps_gen->last_ev);
> +				ev != pps_gen->last_ev ||
> +				!READ_ONCE(pps_gen->info));
>  		if (ret == -ERESTARTSYS) {
>  			dev_dbg(&pps_gen->dev, "pending signal caught\n");
>  			return -EINTR;
>  		}
> +		if (!READ_ONCE(pps_gen->info))
> +			return -ENODEV;
>  
>  		spin_lock_irq(&pps_gen->lock);
>  		info.sequence = pps_gen->sequence;
> @@ -238,9 +241,12 @@ static void pps_gen_unregister_cdev(struct pps_gen_device *pps_gen)
>  			pps_gen->info->enable(pps_gen, false);
>  			pps_gen->enabled = false;
>  		}
> -		pps_gen->info = NULL;
> +		WRITE_ONCE(pps_gen->info, NULL);
>  	}
>  
> +	/* Wake up the readers in PPS_GEN_FETCHEVENT, they fail now as well */
> +	wake_up_interruptible_all(&pps_gen->queue);
> +
>  	put_device(&pps_gen->dev);
>  }
>  

Acked-by: Rodolfo Giometti <giometti@enneenne.com>
