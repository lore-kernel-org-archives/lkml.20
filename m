Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C61D42903F
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789493195; cv=none; b=KO9Jmdr1Dtaeq4X9bPLtUGrmX10Dqaekw4qot72QPO/TPk+WXM+yogdO7JEFkGvGxaJB6CWyqUxBvRyUltOBV5dfTjkqIZeUJ1z9uYR9VQdDGTRGDHS9iQtiS8vxz5DMDfjfI812ARbMaTn2d+JizXHAwfPUlb6wBXbe9qQ294U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789493195; c=relaxed/simple;
	bh=8UbkferCh4G7xJ08bKzrNxvUDkn0u7D9hP2PlhUAMfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YqFRg2gH+vlLakO5QqJvEGFZv/+isdOsG/zvg9YbjB1fukDfky+ELBYKB3NSv434FjcEL01rW0L/vWS0//TH+ne/KYCDFsWpyEUuMyaXAkhq9e48euvCN3UDpUWWCbXkM33u27zoSo1ez+gDULPJDd87lOU68NuKwD7m9nhaA1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=K2Joys22; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="K2Joys22"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398a147688bso512311a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789493193; x=1790097993; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IqiqAKtP9jwo6b7c6fPqWn0LoPHF2A3cHgQdurIrJGg=;
        b=K2Joys22+UG4d7VH2+S+pQp0xPmLgm1sHebBAUEYFzMjNWcKDkVQABsguAB0fzA3qQ
         6EhPY0CZtm+dY9UpNsFrCiCsQ8kcBK4HOehdHLnX4nXzFXn6Zv3clMXcKnvURmijhyIh
         5CZ6MEVUhIafM6peLLkFezF1hTi5czS2byymk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789493193; x=1790097993;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IqiqAKtP9jwo6b7c6fPqWn0LoPHF2A3cHgQdurIrJGg=;
        b=fc9n40qKofFcfOTxtYDlQNHkyD8VjKb5srP1BalF1Rq1dCj7qwplb0IzWJw0LX/GbJ
         Gr4dwHI2KmVnylnC79YjzK93znoOxpBElDtbiZJppaL1Gx1e72rR6jNbY1smWwkqqPHv
         ga9NLD98xCAAUIRJd2uxdApAKU0Swc8uRX82NJkm2Um8oH+VljaK2dlAYfcW1gMR6+4v
         OWi8GphZTEbte6aPTwGISe5hQcf41I2VdH60Yb+SkfXt5FN03Dsu7G8qcHbKt/OPxwRX
         oRKKC0QQAYW0obCrHZMuSw8L7FunlMtm1Bu0f6rjJ9UyCIecLHFxHDUOPilNW/4g9viY
         bU5A==
X-Forwarded-Encrypted: i=1; AKwUvByZInxRnDKoC9tafyQc7/BR1A/RK3UPeyUqRyWIIkcgVav9O0HMgq8l0aGrbcsqTSDxuBUq2BgTawbKMe0=@vger.kernel.org
X-Gm-Message-State: AFuF++kY3qBjjpURQbW4WbAzriPEjhLFY4/qNqlTnRznLKt8fNMdLO75
	x9ceSDt1z/bqAQp/6E0FJZintIL0RH6x3km4qw5eU8f5tz1Eo3+/loYI9KIpiupWng==
X-Gm-Gg: AYBFou2WHjsOWFvtVLXzH9xSy2cIBbteGqgCjc4dppVehYB/Ci3VCwpujjL+htABpkO
	gCE7J2Szer7l89ZUP2PsVgI7o7fSCK+1OTq9ZUf7C9erw6bP0kNL29IWIOnxWRGRQda1K6sv6kY
	zRY6rA5RRNJ6wS1vldN2aeQ1C1e0pjsyi0JG5kde5XuTpTVtih/cecodBAGEo5Tx/eGuaGcnItb
	WxeVraMSkcq5Jigdw9TGFK5js4E6ed7SFZmFWU0nilffFN8CGSK5knepQ/5nl29RtLXOuK1Eab4
	2BJYSbgPqwaNPBHnhh+Zpuy1yuXOw94CXBA2fzBsANmnAt2MzMTKCG9x0tt9cB73DJWx1Y6Cld1
	pX1fABUeiJjq5hxS6ldwoyavER4yGvQw3q/IU0m20uWQ/xydjetJy7vhRYlVKjkKoVOo2shn9hV
	2EQ7Qrt5MoSBKMivD7l+H5DWuKs9b9OVQg9uYCzzt09OBZyKepQGSSC/3sWfa7PC2dOgfrhh6+D
	ehgHW4hiqy8UYKgjzgC6KwDrEA21wanP6AMag==
X-Received: by 2002:a17:90b:17cd:b0:39d:e75d:f33 with SMTP id 98e67ed59e1d1-39e110961c1mr3185168a91.19.1789493193520;
        Tue, 15 Sep 2026 10:26:33 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:60c4:eed3:a48a:b9f4])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-39dfdd0ba9bsm6560457a91.7.2026.09.15.10.26.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 10:26:32 -0700 (PDT)
Date: Tue, 15 Sep 2026 10:26:31 -0700
From: Brian Norris <briannorris@chromium.org>
To: Albert Esteve <aesteve@redhat.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Govind Singh <govinds@codeaurora.org>,
	Niklas Cassel <niklas.cassel@linaro.org>,
	linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ath10k: clear QMI if failed during init
Message-ID: <aql_xwEy5POcVmyU@google.com>
References: <20260914-fix-ath10k-dangling-v1-1-15c5089682b1@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-fix-ath10k-dangling-v1-1-15c5089682b1@redhat.com>

On Mon, Sep 14, 2026 at 03:05:19PM +0200, Albert Esteve wrote:
> A failed ath10k_qmi_init() left a dangling
> pointer (ar_snoc->qmi) in the cleanup path.
> Clear the pointer on the way out for hygiene
> and consistency with deinit().
> 
> Fixes: ba94c753ccb4 ("ath10k: add QMI message handshake for wcn3990 client")

It's all going away (probe failure / removal) if we get here anyway, so
this hardly qualifies as a "fix". In fact, in a cursory check of the
driver, it seems the NULL-ability of the ar_snoc->qmi field is totally
irrelevant to this driver -- it never is actually checked.

I suppose you can still call it "hygiene" though, and it's probably
reasonable to do the same here as we do in deinit().

> Signed-off-by: Albert Esteve <aesteve@redhat.com>

Reviewed-by: Brian Norris <briannorris@chromium.org>

> ---
>  drivers/net/wireless/ath/ath10k/qmi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
> index 0d74548a5f34..08a64f737fb4 100644
> --- a/drivers/net/wireless/ath/ath10k/qmi.c
> +++ b/drivers/net/wireless/ath/ath10k/qmi.c
> @@ -1128,6 +1128,7 @@ int ath10k_qmi_init(struct ath10k *ar, u32 msa_size)
>  
>  err:
>  	kfree(qmi);
> +	ar_snoc->qmi = NULL;
>  	return ret;
>  }
>  
> 
> ---
> base-commit: bc35965f6940a9bf834d54187b6088b8eb09206d
> change-id: 20260914-fix-ath10k-dangling-15676d427cbb
> 
> Best regards,
> -- 
> Albert Esteve <aesteve@redhat.com>
> 
