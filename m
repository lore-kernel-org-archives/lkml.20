Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793735022;
	b=fZRYCb/A/1j4zmJ+S8CGLsyusAA74x1RYfJDwxT34v29sELUu6etQg+uWDSAuPMIvYka
	 vgq0twVZ8HAb67y6ARjHdgzioptgv2yMNODd8yM48wsBZUNMAYp+H/lP+CxLFgOfIT86E
	 eL4fIdV9ZtIeTEhdn55b9xJ7ff8Ibi1EHaGe3HBy8F64IRLV8ySt7l13CVvOgbdVACkX2
	 Gy0IsQ2mT+H1k6FbRcVfyivBvzL6abhoad0eOHW3bvt72S+7ZjZeO3kA40t8heE9nprE7
	 pYjOvGySeBstIEp85QZJbpMB8Y9b7tki7SIbvf1GHf4++mivyhksWTdy0UHpqMNRMAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793735022;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=pM+ObFq+7UvTBHo/IKaCGchHuKGnrduWJa929a2AGj4=;
	b=1jj2dTWb28WFJHa/jgfmun2SVWfhATcxZCKonmBRUCgd94yESharj5R9MVDhn5UyhxfV
	 7OmDAjHT35usliYVSNbB+CBqMjFtOEJoFOvHFPhrpAKEi/8hEND4NMRAu7rpCrMgYxdyd
	 NpBJGMD68JmP4TGSL1B3LykBWBaPTItqf2LwqQHtXOx397Mpehkls3kpgUwq/wPmgbGQe
	 WW8bIADqQ/Mf5+taq8UaBTMKYtEIztK9j6+HCftNHfEHRz18HACm2vzmkbdYNG9Umn4Oy
	 WVxCbTgLUW+oivi4vOSVEFQWeqVO2ThbeqSPrm/xexx8rN8MLx3qnII1ZwXUOHcquXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=lbPap6xL;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C088F606A32E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 19:43:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C088F606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=lbPap6xL
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-14fc585291cso3687511c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793735021; x=1794339821; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pM+ObFq+7UvTBHo/IKaCGchHuKGnrduWJa929a2AGj4=;
        b=lbPap6xLlqMk+JYnuSIyFjcRQFqANvPP5Qqin+Bz3DY7GsGTRk8PniDPJ15f+G5ilO
         r9FUH9gktdgCzOrQpBTRygzrW0nj0WmLAxNtcOyIHnDJx0oZzTd14VRe3a1Nni0MjvN0
         78W91quHXoMTrB33+q740l4pO9Al9IeFiNf8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793735021; x=1794339821;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pM+ObFq+7UvTBHo/IKaCGchHuKGnrduWJa929a2AGj4=;
        b=kMC+ZkqnBpjfWLopOvnJKr89Yt7Sl+ilzbLmA4vHrEnmVw1zadjYi9/VG33pomsKn7
         NK3f0eJ41yMiudxslQniF2BgiGYbC9Bot5NhEK6z52pN4yVPtClZt33oB/sO0aCOKU67
         dRT9LyCL1yPFDiOY5liULE2dghinWD52+wCakIQwcneIszI+To/v8nCH3gYAfpaQrw1D
         SEWVp8ekPJXdqjuqY4G4r7DsrYzBwtw5SrVMOUnT+fD2iwJCyiGwy1J+I68BNnGaWpTr
         fYiaFpuwQ/5jFoL0vzfTVS/YJmEXKbWLYpTFXQqtAqgStl1BM72mWklyS4hxGaJ3ZA5b
         wcCw==
X-Forwarded-Encrypted: i=1; AKwUvBxVsj1X4LM6+Q4p+ONTh9Hrl5+tJJzFLkypeA/raJCscEYyIkBBkPc8F7Jw4+rXX6di7SAuwviyQtm+REw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qjrmZ8GVo7OU6BwXjIedvIaKAZbNeMNCRNTf4fevUdWXospf6
	GCHCp6WFo6W83egIFLlwQmtp87rCPbGB35dVUK+/2cHcRJhfq4Z5kSFas3Un2Yczm5CdewKS7CS
	+hJc=
X-Gm-Gg: AYBFou0PnMAsjvw5FuB7DrSjOyDFlZIx/xoaxsik2JOlRTxIG70WW5HHFYCsLn3BvmV
	Qbsuj10Aj3k01am4bN9jcOY9ofFbwQm9nFIwMP9H1oCDtZJV1y0x6HnndJStrhdx0j0b6tmMVAg
	YfFkYVw9w7Q5UDM3c6yyvx89yPPkiK457w5W5jiyo8fbmikXVSsrS2ychVCg3utzD7prwVFDJIe
	ksWoQ8mc5Jo8NTSSem9d1boO0sb6cAEN1hhOwgWHm9GMgWb1fLYCQNCDFCUKYxWdM0Kod3e4uI5
	CFdBCYufACcrp1MyvI0wNprDIyTeroJKI8IcPb2U5QF4fCo9lB13mWMzJeumGl24IC5jUB3W1uZ
	c7OHkK96ypWoJC++X8LpurLy0KrAZFq9sorvoMpq6QX0lYEcHLiyDlccUlb0RJBxgnyQZveqQca
	e8TC+1+tDmQvSeRAn1JoQrwApJGgMmACR4/KrwOoFDUgOdo6QWmqBmJIPUWGcZbQJgkgnBKDcWj
	Rp54gfJx8DcYhfqfIaPUvSvy3NSCRFska6KlgPL1dmiqVel+3jbZ74PHZ3ImOWIJ2mrVcUeFQmJ
	6Xv2idM+JVZe3PODJSWtlokIDnLhHzIdd3yM7dzrNhmHrM2pMtlC/Jwfjio1XJpCebE=
X-Received: by 2002:a05:701b:418f:10b0:14a:8df8:56c5 with SMTP id a92af1059eb24-1ac5dd5a055mr21441051c88.26.1793735020817;
        Tue, 03 Nov 2026 11:43:40 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:ab71:b3df:693a:fbf2])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1b245c2c2ddsm985448c88.10.2026.11.03.11.43.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 11:43:40 -0800 (PST)
Date: Tue, 3 Nov 2026 11:43:38 -0800
From: Brian Norris <briannorris@chromium.org>
To: Stanley Jhu <stanleyjhu@google.com>
Cc: "Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Bart Van Assche <bvanassche@acm.org>, Bean Huo <beanhuo@micron.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Praveen Talari <praveen.talari@oss.qualcomm.com>,
	Peter Wang <peter.wang@mediatek.com>,
	Can Guo <can.guo@oss.qualcomm.com>,
	John Garry <john.garry@linux.dev>, linux-scsi@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] scsi: ufs: core: Keep clock-gating hold on failed W-LUN
 runtime resume
Message-ID: <auo5ar8427cuH_nX@google.com>
References: <20261029040002.2100002-1-stanleyjhu@google.com>
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
In-Reply-To: <20261029040002.2100002-1-stanleyjhu@google.com>

Hi Stanley,

I'm not extremely familiar with the UFS or block layers here, so I'm
just coming from a general driver + runtime PM perspective. That said, I
have some thoughts:

On Thu, Oct 29, 2026 at 03:08:30PM +0800, Stanley Jhu wrote:
> 1. __ufshcd_wl_suspend() takes one ufshcd_hold() reference and sets
>    hba->clk_gating.is_suspended while the UFS device W-LUN enters
>    RPM_SUSPENDED.
> 2. Since commit eef1d74bf88f ("PM: runtime: Only set runtime_error on
>    suspend callback failures"), a failed runtime resume (for example
>    START STOP UNIT completing with an error) leaves the W-LUN in
>    RPM_SUSPENDED with power.runtime_error == 0, while
>    __ufshcd_wl_resume() already clears hba->clk_gating.is_suspended and
>    calls ufshcd_release().
> 3. The next W-LUN runtime resume runs __ufshcd_wl_resume() again without
>    an intervening suspend and calls ufshcd_release() a second time,
>    dropping a reference it does not own and underflowing
>    hba->clk_gating.active_reqs on UFSHCD_CAP_CLK_GATING hosts.

I _think_ this reasoning and patch all looks good, with one possible
exception: ufshcd has explicit recovery in ufshcd_recover_pm_error(),
which relies on checking power.runtime_error, and then explicitly
overrides the status to active to clear the error.

It seems to me like commit eef1d74bf88f might have subverted some of
that logic too, because resume failures will no longer latch a
runtime_error value, so that recovery function may not be doing
much/anything. Is that a problem too?

> Keep hba->clk_gating.is_suspended and the suspend hold across a failed
> W-LUN runtime resume, so the hold stays paired with the W-LUN
> RPM_SUSPENDED state and the next successful resume releases it.
> 
> Fixes: eef1d74bf88f ("PM: runtime: Only set runtime_error on suspend callback failures")
> Cc: stable@vger.kernel.org # v7.3+
> Signed-off-by: Stanley Jhu <stanleyjhu@google.com>
> ---
>  drivers/ufs/core/ufshcd.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> index cc75384c6502..9be370cea52a 100644
> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
> @@ -10626,8 +10626,14 @@ static int __ufshcd_wl_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>  out:
>  	if (ret)
>  		ufshcd_update_evt_hist(hba, UFS_EVT_WL_RES_ERR, (u32)ret);
> -	hba->clk_gating.is_suspended = false;
> -	ufshcd_release(hba);
> +	/*
> +	 * A failed runtime resume leaves the W-LUN RPM_SUSPENDED, so keep
> +	 * is_suspended and the suspend hold for the next resume.
> +	 */
> +	if (!ret || pm_op != UFS_RUNTIME_PM) {
> +		hba->clk_gating.is_suspended = false;
> +		ufshcd_release(hba);
> +	}

This looks right to me, as a non-expert in this code, and it may even
have been wrong before commit eef1d74bf88f.

Reviewed-by: Brian Norris <briannorris@chromium.org>

>  	hba->pm_op_in_progress = false;
>  	return ret;
>  }
> -- 
> 2.56.0.313.g2479322e68-goog
> 
