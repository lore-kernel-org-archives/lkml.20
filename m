Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FCE3D9DCE
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 14:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791556700; cv=none; b=ZN3e5tadC7p+/WvsXsqzh9pOrlZxmsHM0ueb11YHRRqcQycXfFzOFhfAh/KHRBvZ1/V1DaCD7vFg0+hDOW5jVkP75abPnaAYTOWiYSh88oUCQQM14ShMqE9nOKGmVKK53hwp3pJEHhzEtbFnX8wf2AYJQYnHZed/MpKvJ6q5ARs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791556700; c=relaxed/simple;
	bh=WVChwmzOJXlx/K3vTVPxtUdHIg/2GuvU3lzTNBEWicI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tcvloS2JrBIHCzRxpBJYRk3ZWbGMC5iG5ayYWt4xLVi4E+ErdgNGpNOntVtE0xfxbWjYKeU5LNjBnKdmwyFnvxi484QgIb5wvCjvXcsOqvHZSUAldXmClOYm0zhtQDX9DbtRZd+1PRCIUBHaDpbgjuartdJWbli1Z4er9i29a84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DNYGoQ3H; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DNYGoQ3H"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a018792ab3so37462815e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 07:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791556697; x=1792161497; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ADsYu9bd8YELZpguZOm7XXP0fQTzNLazolnLueW7QDs=;
        b=DNYGoQ3HwemgVjPZ1pV85u9okaoHl6GT3EsHfdc+REIfB8KII5U74w8h0FwTnrGkDh
         DM9uCC5p4UcKVqxbN4OuLa1dwl5oYDTmJ7lW826RYTTqnM4ydsv+2EyYNVCOzTqDxKMR
         xDvxeGJ/CRFgSkNqQrz0lrssx/of2WLn1TU3RSkUU3Q8p7T2KIVMBrXE6QgzDpMs9yYv
         LQ5UQVgGeEYB0zqShHaXLU1yMOsjcGPAQOvjmeMHsfWMmxGRtBpjh0B6+dLhmT+cbJnV
         gsAiDXn5C1ncnbO5P+8iAkAL4UEW4U2pDg4p50XJtp8EDAh59J+4AmBupVdCXaDXdVli
         JkZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791556697; x=1792161497;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ADsYu9bd8YELZpguZOm7XXP0fQTzNLazolnLueW7QDs=;
        b=Saao+zaQyRPn2NdghhFdfSJg5hK0dDQmzMVt51ZwVRLcbv25QE0PwZogAU2Fm6wxBg
         1iLtOJuZ8zwp1EUrroHFiFMOLlM7LlF8H+GJHzOXI1pDjebZB2s/Inf4N9g6VkVua+Ne
         sDJ+fC/h2UDfXgV77krNQUq7hXwBKkK6LcNosWIMnp6PKPOG/mI86Ft+rt3bmp12hkuW
         euz2Y/yiHGJUmwcWLla+627dd/BnPEvmuWf7sBuVhn490jqwP3thmS8VWQdA4yP8L41H
         ImVbTZH7Ht2FLGhFXtKlPTJGJGnAmhr2WAE8f2cFeGSzJYIruVyoGgJa5xkSDYo+8lpQ
         sl/w==
X-Forwarded-Encrypted: i=1; AKwUvBx2vFn4IhdRp4s8Mkrvq/j3t8wq3MRLoFjfoKC47MfsCCtBFhpINAa5e2jWeXRglK7OTaFb/dOvAAwXLxY=@vger.kernel.org
X-Gm-Message-State: AFuF++m8eI2zIOqVBABqYJGAH0xHt72p4nk275ZYSC7BcjJcxJLpXtzY
	JjrdpuSg2b3nuas/ZWhCosNSRdhmhbrx/Lz5+AVd1dN/J5H8bRPqnjqcs5/IiIGqwtg=
X-Gm-Gg: AYBFou1kjH7X7pfEX5iVPzA1MdDi1Z02mFIESawTFALCI4dwJebUQSwvhNlj4sGyree
	fd5y10XczVWxo7A+D0Vn3Mw4oJ70LLNRIp63JlF3QUMj5CjQHuOOO4CJXo8T1XH9rY2aMkHExc3
	riKADO1dJdD7uxgzqT0aZWm9BIjiyVmIu7Lkzt6xCtVv87zovvkICN8DXfgdIHmCVPqZmMt2WTZ
	FjXry7R5lXSNe6g2iHJ0dYjOz8EIGY/LlJpu0sa8waBy3pX4ourWUBszNE7MzVJeeMmFZnMRPXu
	OKDSn0Y73FmcuFE0aLO4EsvcHQ+RI/HloStQKxL8ivdZNfbfJOlLBBnmk+R2fkJ+le/544UBAyj
	E62eX0+mFXWuqnFzdeeTQtuutuvzxrYICdFsDNykmIgdtCZmuS+tpgb6+KVmsLDxT6prmkdgWLM
	JyG0MSY+BV2XE7ukM7cjwdHQKLxMO6pVFBEZMafchO4vPTd+/j92FgPr6GNdMtR5+vnhSmN96dt
	G7cyADNoAQ=
X-Received: by 2002:a05:600c:c176:b0:4a0:c2a:485e with SMTP id 5b1f17b1804b1-4a18e4dce0cmr41026305e9.33.1791556696563;
        Fri, 09 Oct 2026 07:38:16 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff25:4f41:8f61:e8db:b29a:c15a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18e4225f4sm72506615e9.0.2026.10.09.07.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 07:38:16 -0700 (PDT)
Date: Fri, 9 Oct 2026 16:38:14 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] remoteproc: qcom: pas: Don't fail attach if the
 remote has crashed
Message-ID: <asj8VnSmKBF3nA79@linaro.org>
References: <20261006033550.2726451-1-shengchao.guo@oss.qualcomm.com>
 <20261006033550.2726451-3-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006033550.2726451-3-shengchao.guo@oss.qualcomm.com>

On Tue, Oct 06, 2026 at 11:35:50AM +0800, Shawn Guo wrote:
> When qcom_pas_attach() finds the fatal SMP2P bit already set, it reports
> a crash and then fails the attach. The core unwinds the attach while the
> crash work is queued: rproc_boot() drops the power refcount back to 0,
> and __rproc_attach()/rproc_attach() unprepare the subdevices, clean up
> the resource table and disable the IOMMU. Once rproc_boot() releases
> rproc->lock, the crash handler finds the rproc still RPROC_DETACHED,
> marks it RPROC_CRASHED and runs rproc_boot_recovery() on top of that
> torn-down state:
> 
>  - the subdevices are unprepared a second time by rproc_stop(), so SSR
>    and sysmon notifiers see a duplicate shutdown;
>  - qcom_pas_stop() and the subsequent rproc_start() operate on resources
>    that rproc_attach() already released, e.g. iommu_unmap() on a
>    disabled domain for rproc->has_iommu;
>  - recovery leaves the rproc RPROC_RUNNING with power == 0. A later
>    "stop" via sysfs takes power to -1 and returns success without
>    stopping anything, so the remote stays running. A following "start"
>    then boots the firmware again on the running remote and fails to
>    re-add the still registered subdevices:
> 
>   sysfs: cannot create duplicate filename '.../qcom_common.pd-mapper.0'
>   remoteproc remoteproc0: failed to prepare subdevices for adsp: -17
>   remoteproc remoteproc0: Boot failed: -17
> 
> A crash found at attach time is no different from one reported by the
> fatal interrupt right after attaching. Treat it the same way as
> q6v5_fatal_interrupt() does: clear q6v5.running, report the crash and
> let the attach succeed. The core completes the attach with balanced
> bookkeeping, and the crash handler then recovers the subsystem through
> the regular RPROC_ATTACHED -> RPROC_CRASHED path.  With running cleared,
> qcom_q6v5_request_stop() does not wait for a stop ack the dead remote
> cannot send, and handover_issued already prevents a spurious handover
> on stop.
> 

Hmmmm okay, I have never thought of this option, but reusing the
existing crash path as-is by making the attach succeed feels actually
quite clever! I suppose starting all the subdevs is really redundant in
this case, but the crash case is also nothing worth optimizing for.

> Assisted-by: LLM
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 8f3d45c604c9..0ecd7688a54d 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -562,10 +562,14 @@ static int qcom_pas_attach(struct rproc *rproc)
>  		goto disable_running;
>  
>  	if (crash_state) {
> +		/*
> +		 * Complete the attach and let the crash handler recover the
> +		 * subsystem from the attached state, as for a crash reported
> +		 * by the fatal interrupt.
> +		 */
>  		dev_err(pas->dev, "Subsystem has crashed before driver probe\n");
> +		pas->q6v5.running = false;
>  		rproc_report_crash(rproc, RPROC_FATAL_ERROR);
> -		ret = -EINVAL;
> -		goto disable_running;
>  	}

My only nitpick is that it would be nice to fully reuse the normal crash
handling in this case, in particular the crash_reason logging inside
q6v5_fatal_interrupt(). Can you extract that part into a common function
and call it from here?

(I guess you could also call the existing q6v5_fatal_interrupt()
function since it should work as-is, but externally calling an interrupt
handler might be a bit weird...)

Thanks,
Stephan
