Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794410755;
	b=1Pmq/8KgIeQfzNv7NCUvmWHEt5ib13VRhhMYEcuKxkUo4a8kU6nWFlcoCvbNVHEHvO8G
	 JMkkyH1jnO3vobCoDL4RIYk9dF2U6RpshfkoTIOE6ywrLXBPMmTjP249dx5/5/oEShKBc
	 jhL54StrbrJSzwhOUWEjj+AjlBci3p7BGfNBHeN+7mOhbQSfnzAi8n4ko0fMWH8cI/Q2y
	 GNcBr7uVOjFBr+Q4ndDkS9ezjS6xHKGD0jstluNYxBDConTMvMVwg0yw37Hkc4XnVJP9Y
	 cOxbXHxR/KSpPHpTsMbKuOLHkyQ2XJo5zHMIC8/8T0ZzwbGpPwrEkr74SSUfSQgdTtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794410755;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=VVuhmpTOxkpymn0weSleRGrGxCwyKmh4kNc2qrZbhPg=;
	b=URSK/1l6z87Px2ptQrlDjqAYB3BECqhgsOPwJm0qbbQMzPsSdqBLvecIW5dXqPlJmALs
	 X0smoPDqvD+scGxsaAuEy9noZSCBeWUuOQ2/ZXHrpKhU34+TxpCQPQln/Hl8coWu/d10m
	 vNvYP/76xxUTBc3CJIxNXw1VWco0MInT1easr/8k1n0aMtI/Rn1IHuO75+zXtsw+1gN0i
	 8oCm8a6J/Rdi975XTslR9MVsfdz125k94V0Zzihb19od32+hErfehkxADOSVKmeQUZwUa
	 eoDtwMcBqfQHmzDHEDlnHsY+YjQQUqiMFM4f/Zxa1AzwpmXcMfg2T0CP85wO53cbOsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=nNGvMAIL;
	arc=none smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DD1606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:25:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45DD1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=nNGvMAIL
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5495d549924so33300161cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1794410754; x=1795015554; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VVuhmpTOxkpymn0weSleRGrGxCwyKmh4kNc2qrZbhPg=;
        b=nNGvMAILLhIgpSoaRMs9TXupHeAJcVzXWR7e4jlC4QcIAGFon1n43zEsGUnQzyYj4T
         /cqjz2kPZtxEXRtaRzUeNuobDbt1po0n1thnjWj5aBlikM9PiREmxVOKIH5N+qfSNCf2
         1a80QphSH/bW4nH/V1F5fUP0LGuFqRQc4GTK6zZrtcBupN/GF+bvddj3vrPtrwXsq3+3
         alTS32l1WW9pXSSkHhFjvHpoXthbHSBfJnIizENmzz5znt7G1HpmNReXq/1vumc2S97p
         YukMPBPqoMbQgaHGDnd6nJqH2FhAiCxTX4lfAhQmczRTG59MmUjR8YswEsLNeZe/3uii
         eHPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794410754; x=1795015554;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VVuhmpTOxkpymn0weSleRGrGxCwyKmh4kNc2qrZbhPg=;
        b=iVLXMstro8C6jnUh6/+Gi8KLbanIlB0U1Wu6OhlwebC5A7EEuYSV/SnwBQEAWtozeV
         LYaxYWftZlhn9JdnH0bObHaHM4157agU9LF32n3ytQbHKBh7g5JPIrFR+kgHrR3GcYUX
         +958T9kmEphELBXrrmB0pq+7uw5+Ycn9rCaA1Y9SKYGZIbcRdM91e1clZkFcBUzD5TZF
         42euZDRiA15sRHPnhxp9WruBlx7Le39qGCMclS5cn/5WvHUKN3IGNUS2Av7DC9wgMQnP
         aJX+pgIO73q+FKHMf6Ifcy/Zb2P5QJe6raMnSrLaxe69z4tT0wE29s8nyTje/IIjyzNu
         +6mQ==
X-Forwarded-Encrypted: i=1; AL+hErGQaQrIogUCqjMXRDJlFSYrhpPEZat8yCgAoENA0V+OxNT87KKaOJtkyUc4a9NFDqcTjg9Z84ntHvDmpdw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vGgb8Noiz0CBQ18g9DhCv/k4XrwsWpgimss8nRTnPUFhum3zq
	KURAiZ2ie+iuHaQYiLG4If7PF6ahW+EhkrzfSyq4kFCwg6IwEP+Bk17u80MPMzYlXw==
X-Gm-Gg: AYBFou0onINzj/dDiJrsNju62lGSr3dXAYzGCKdypaa63urIlIaiSZn3XMWCht7jD5m
	nlCAwJQ7sS3IU65VuC2HlznQ+eqi8mYN8cQWLYtlWARcUYiDM/dB+ME6VxZbqXbw8iiGamHl6I4
	H4F4nWZDMwxOkiLLtbG0rfVYu0cg37Y/MINYedEpnOYrc+MNSalLmhq9FWawTlPFjhRV1+ihTuf
	gQfgSFw6oOz7ekY1oORr9OOKSh+Fw04ItZSPjhCutDoXE8hLSLWx6FHb4Ts2mCLlLVLyA3LjsBC
	PZ2qGSGGHrYxqV4GoMfEGYVQYmBb3xBtbwEys5SM/KnKk5mRcqc2L5PrJVYXZKaivksBMGn8boD
	3XsEbqF1fYF2JoAhtHeOyN2zUpZ8ogfJIbjx3O+fvy2LFu99bTd3l/p40SCEX4WdmklamqhSpGI
	N0p71Xj7PbKuSWlqRp1hwh8uELpM6PgvI2pTqkvTVazYK6ecwPyZe2CmCAD0fXofTUFeUBJV52P
	Z4gJqd8QTreV4DZi6/oL0ksnuWrPTwXCdfekZlZP1YChOazqQicH2GlAkOHh8daV7jk1RlvJ9rD
	ks9HCOTpVEf+gT/nithLIOMdw5H9F3sfps2ek+mw66A7Q4sxex4=
X-Received: by 2002:ac8:5dd0:0:b0:535:fc2d:b7c2 with SMTP id d75a77b69052e-556c1391522mr40169741cf.33.1794410753989;
        Wed, 11 Nov 2026 07:25:53 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::d355])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5550b9425c5sm52788841cf.17.2026.11.11.07.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:25:53 -0800 (PST)
Date: Wed, 11 Nov 2026 10:25:50 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] usb-storage: onetouch: Fix potential use-after-free on
 input failure
Message-ID: <c342c36a-df9f-4bf7-b96a-a4609f128b0e@rowland.harvard.edu>
References: <20261111-e5624093d6-usb-storage@mail.sdu.edu.cn>
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
In-Reply-To: <20261111-e5624093d6-usb-storage@mail.sdu.edu.cn>

On Wed, Nov 11, 2026 at 08:23:03PM +0800, Guangshuo Li wrote:
> If input_register_device() fails, onetouch_connect_input() frees the
> onetouch state but leaves it installed in ss->extra. USB-storage cleanup
> then calls onetouch_release_input() on the freed state.
> 
> Install the extra state and callbacks only after input registration
> succeeds.
> 
> This issue was found by our static analysis tool under development.
> 
> Fixes: 17efe155253e ("USB: onetouch - handle errors from input_register_device()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/storage/onetouch.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/storage/onetouch.c b/drivers/usb/storage/onetouch.c
> index 49d281f7bef6..e09b3c6b9a6a 100644
> --- a/drivers/usb/storage/onetouch.c
> +++ b/drivers/usb/storage/onetouch.c
> @@ -237,16 +237,16 @@ static int onetouch_connect_input(struct us_data *ss)
>  	onetouch->irq->transfer_dma = onetouch->data_dma;
>  	onetouch->irq->transfer_flags |= URB_NO_TRANSFER_DMA_MAP;
>  
> +	error = input_register_device(onetouch->dev);
> +	if (error)
> +		goto fail3;
> +
>  	ss->extra_destructor = onetouch_release_input;
>  	ss->extra = onetouch;
>  #ifdef CONFIG_PM
>  	ss->suspend_resume_hook = usb_onetouch_pm_hook;
>  #endif
>  
> -	error = input_register_device(onetouch->dev);
> -	if (error)
> -		goto fail3;
> -
>  	return 0;
>  
>   fail3:	usb_free_urb(onetouch->irq);
> 
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> -- 
> 2.43.0
> 
